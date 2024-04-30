From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 30 Apr 2024 13:58:11 +0200
Subject: [PATCH v4 02/11] riscv: add ISA extensions validation
In-Reply-To: <20240430-payable-famished-6711765d5ca4@wendy>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
Message-ID: <dbcf0be9-eae6-4776-bc5b-c6fad58df9c3@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 30/04/2024 13:44, Conor Dooley wrote:
> On Tue, Apr 30, 2024 at 09:18:47AM +0200, Cl?ment L?ger wrote:
>>
>>
>> On 30/04/2024 00:15, Conor Dooley wrote:
>>> On Mon, Apr 29, 2024 at 05:04:55PM +0200, Cl?ment L?ger wrote:
>>>> Since a few extensions (Zicbom/Zicboz) already needs validation and
>>>> future ones will need it as well (Zc*) add a validate() callback to
>>>> struct riscv_isa_ext_data. This require to rework the way extensions are
>>>> parsed and split it in two phases. First phase is isa string or isa
>>>> extension list parsing and consists in enabling all the extensions in a
>>>> temporary bitmask without any validation. The second step "resolves" the
>>>> final isa bitmap, handling potential missing dependencies. The mechanism
>>>> is quite simple and simply validate each extension described in the
>>>> temporary bitmap before enabling it in the final isa bitmap. validate()
>>>> callbacks can return either 0 for success, -EPROBEDEFER if extension
>>>> needs to be validated again at next loop. A previous ISA bitmap is kept
>>>> to avoid looping mutliple times if an extension dependencies are never
>>>> satisfied until we reach a stable state. In order to avoid any potential
>>>> infinite looping, allow looping a maximum of the number of extension we
>>>> handle. Zicboz and Zicbom extensions are modified to use this validation
>>>> mechanism.
>>>
>>> Your reply to my last review only talked about part of my comments,
>>> which is usually what you do when you're gonna implement the rest, but
>>> you haven't.
>>> I like the change you've made to shorten looping, but I'd at least like
>>> a response to why a split is not worth doing :)
>>
>> Hi Conor,
>>
>> Missed that point since I was feeling that my solution actually
>> addresses your concerns. Your argument was that there is no reason to
>> loop for Zicbom/Zicboz but that would also apply to Zcf in case we are
>> on RV64 as well (since zcf is not supported on RV64). So for Zcf, that
>> would lead to using both mecanism or additional ifdefery with little to
>> no added value since the current solution actually solves both cases:
>>
>> - We don't have any extra looping if all validation callback returns 0
>> (except the initial one on riscv_isa_ext, which is kind of unavoidable).
>> - Zicbom, Zicboz callbacks will be called only once (which was one of
>> your concern).
>>
>> Adding a second kind of callback for after loop validation would only
>> lead to a bunch of additional macros/ifdefery for extensions with
>> validate() callback, with validate_end() or with both (ie Zcf)). For
>> these reasons, I do not think there is a need for a separate mechanism
>> nor additional callback for such extensions except adding extra code
>> with no real added functionality.
>>
>> AFAIK, the platform driver probing mechanism works the same, the probe()
>> callback is actually called even if for some reason properties are
>> missing from nodes for platform devices and thus the probe() returns
>> -EINVAL or whatever.
>>
>> Hope this answers your question,
> 
> Yeah, pretty much I am happy with just an "it's not worth doing it"
> response. Given it wasn't your first choice, I doubt you're overly happy
> with it either, but I really would like to avoid looping to closure to
> sort out dependencies - particularly on the boot CPU before we bring
> anyone else up, but if the code is now more proactive about breaking
> out, I suppose that'll have to do :)

Ahah, I would have done it if it would have make sense and add any
useful support. But AFAICT, the current implementation solves most of
the problems you raised.

While thinking about it, I can even simply it a bit more. Once a ISA
extension bit is set in the final mask, I can actually disable it in the
original mask to avoid looping over it again. I'll send a V5.

> I kinda wish we didn't do this at all, but I think we've brought this
> upon ourselves via hwprobe. I'm still on the fence as to whether things
> that are implied need to be handled in this way. I think I'll bring this
> up tomorrow at the weekly call, because so far it's only been you and I
> discussing this really and it's a policy decision that hwprobe-ists
> should be involved in I think.

Yeah sure.

> 
> Implied extensions aside, I think we will eventually need this stuff
> anyway, for extensions that make no sense to consider if a config option
> for a dependency is disabled.
> From talking to Eric Biggers the other week about
> riscv_isa_extension_available() I'm of the opinion that we need to do
> better with that interface w.r.t. extension and config dependencies,
> and what seems like a good idea to me at the moment is putting tests for
> IS_ENABLED(RISCV_ISA_FOO) into these validate hooks.

Yeah, see what you mean. I think we also need to define if we want to
expose all the ISA extensions in /proc/cpuinfo (ie no matter the config
of the kernel) or not. If so, additional validate() callback would make
sense. If we want to keep the full ISA string in /proc/info, then we
will need another way of doing so.

> 
> I'll try to look at the actual implementation here tomorrow.

Great, thanks.

Cl?ment

> 
> Cheers,
> Conor.

