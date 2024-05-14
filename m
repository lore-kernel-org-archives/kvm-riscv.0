From: Conor Dooley <conor@kernel.org>
Date: Tue, 14 May 2024 15:44:05 +0100
Subject: [PATCH v4 02/11] riscv: add ISA extensions validation
In-Reply-To: <9d0840ff-d00a-4866-8f45-e8676f369ad6@rivosinc.com>
References: <20240429150553.625165-1-cleger@rivosinc.com>
 <20240429150553.625165-3-cleger@rivosinc.com>
 <20240429-subtext-tabby-3a1532f058a5@spud>
 <5d5febd5-d113-4e8c-9535-9e75acf23398@rivosinc.com>
 <20240430-payable-famished-6711765d5ca4@wendy>
 <e57f8b70-7981-42c1-bb04-2060054dd796@rivosinc.com>
 <20240514-sip-exclusion-014b07b01f4c@spud>
 <9d0840ff-d00a-4866-8f45-e8676f369ad6@rivosinc.com>
Message-ID: <20240514-ascend-joyous-a15969f703de@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 14, 2024 at 02:48:01PM +0200, Cl?ment L?ger wrote:
> 
> 
> On 14/05/2024 14:43, Conor Dooley wrote:
> > On Tue, May 14, 2024 at 09:53:08AM +0200, Cl?ment L?ger wrote:
> >>
> >>
> >> On 30/04/2024 13:44, Conor Dooley wrote:
> >>> On Tue, Apr 30, 2024 at 09:18:47AM +0200, Cl?ment L?ger wrote:
> >>>>
> >>>>
> >>>> On 30/04/2024 00:15, Conor Dooley wrote:
> >>>>> On Mon, Apr 29, 2024 at 05:04:55PM +0200, Cl?ment L?ger wrote:
> >>>>>> Since a few extensions (Zicbom/Zicboz) already needs validation and
> >>>>>> future ones will need it as well (Zc*) add a validate() callback to
> >>>>>> struct riscv_isa_ext_data. This require to rework the way extensions are
> >>>>>> parsed and split it in two phases. First phase is isa string or isa
> >>>>>> extension list parsing and consists in enabling all the extensions in a
> >>>>>> temporary bitmask without any validation. The second step "resolves" the
> >>>>>> final isa bitmap, handling potential missing dependencies. The mechanism
> >>>>>> is quite simple and simply validate each extension described in the
> >>>>>> temporary bitmap before enabling it in the final isa bitmap. validate()
> >>>>>> callbacks can return either 0 for success, -EPROBEDEFER if extension
> >>>>>> needs to be validated again at next loop. A previous ISA bitmap is kept
> >>>>>> to avoid looping mutliple times if an extension dependencies are never
> >>>>>> satisfied until we reach a stable state. In order to avoid any potential
> >>>>>> infinite looping, allow looping a maximum of the number of extension we
> >>>>>> handle. Zicboz and Zicbom extensions are modified to use this validation
> >>>>>> mechanism.
> >>>>>
> >>>>> Your reply to my last review only talked about part of my comments,
> >>>>> which is usually what you do when you're gonna implement the rest, but
> >>>>> you haven't.
> >>>>> I like the change you've made to shorten looping, but I'd at least like
> >>>>> a response to why a split is not worth doing :)
> >>>>
> >>>> Hi Conor,
> >>>>
> >>>> Missed that point since I was feeling that my solution actually
> >>>> addresses your concerns. Your argument was that there is no reason to
> >>>> loop for Zicbom/Zicboz but that would also apply to Zcf in case we are
> >>>> on RV64 as well (since zcf is not supported on RV64). So for Zcf, that
> >>>> would lead to using both mecanism or additional ifdefery with little to
> >>>> no added value since the current solution actually solves both cases:
> >>>>
> >>>> - We don't have any extra looping if all validation callback returns 0
> >>>> (except the initial one on riscv_isa_ext, which is kind of unavoidable).
> >>>> - Zicbom, Zicboz callbacks will be called only once (which was one of
> >>>> your concern).
> >>>>
> >>>> Adding a second kind of callback for after loop validation would only
> >>>> lead to a bunch of additional macros/ifdefery for extensions with
> >>>> validate() callback, with validate_end() or with both (ie Zcf)). For
> >>>> these reasons, I do not think there is a need for a separate mechanism
> >>>> nor additional callback for such extensions except adding extra code
> >>>> with no real added functionality.
> >>>>
> >>>> AFAIK, the platform driver probing mechanism works the same, the probe()
> >>>> callback is actually called even if for some reason properties are
> >>>> missing from nodes for platform devices and thus the probe() returns
> >>>> -EINVAL or whatever.
> >>>>
> >>>> Hope this answers your question,
> >>>
> >>> Yeah, pretty much I am happy with just an "it's not worth doing it"
> >>> response. Given it wasn't your first choice, I doubt you're overly happy
> >>> with it either, but I really would like to avoid looping to closure to
> >>> sort out dependencies - particularly on the boot CPU before we bring
> >>> anyone else up, but if the code is now more proactive about breaking
> >>> out, I suppose that'll have to do :)
> >>> I kinda wish we didn't do this at all, but I think we've brought this
> >>> upon ourselves via hwprobe. I'm still on the fence as to whether things
> >>> that are implied need to be handled in this way. I think I'll bring this
> >>> up tomorrow at the weekly call, because so far it's only been you and I
> >>> discussing this really and it's a policy decision that hwprobe-ists
> >>> should be involved in I think.
> >>
> >> Hi Conor,
> >>
> >> Were you able to discuss that topic ?
> > 
> > I realised last night that I'd not got back to this thread and meant to
> > do that today (I had accidentally deleted it from my mailbox), but I had
> > a migraine this morning and so didn't.
> > I did bring it up and IIRC Palmer was of the opinion that we should try
> > our best to infer extensions.
> > 
> >>> Implied extensions aside, I think we will eventually need this stuff
> >>> anyway, for extensions that make no sense to consider if a config option
> >>> for a dependency is disabled.
> >>> From talking to Eric Biggers the other week about
> >>> riscv_isa_extension_available() I'm of the opinion that we need to do
> >>> better with that interface w.r.t. extension and config dependencies,
> >>> and what seems like a good idea to me at the moment is putting tests for
> >>> IS_ENABLED(RISCV_ISA_FOO) into these validate hooks.
> >>>
> >>> I'll try to look at the actual implementation here tomorrow.
> >>
> >> Did you found time to look at the implementation ?
> > 
> > No, with the above excuse. I'll try to get to it today or tomorrow...
> 
> No worries, I was on vacation and was just checking if I hadn't missed
> anything in the meantime. Take your time ;)

I forget where we talked about validation for F/V, but I chucked this
together last week in response to another thread of Andy's that was
adding some of the vector subset stuff, because I realised we don't turn
off any of the stuff that depends on vector if vector gets disabled:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=riscv-check_vector&id=38050c6858143f43ce2fd04e9824727a7d7731d0

What I've got there doesn't actually work for the vector subsets though,
only for vector itself, because of the probe ordering. Your validate
callback stuff should solve that issue though.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240514/6061491f/attachment-0001.sig>
