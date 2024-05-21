From: Clément Léger <cleger@rivosinc.com>
Date: Tue, 21 May 2024 09:58:25 +0200
Subject: [PATCH v5 07/16] riscv: add ISA extensions validation callback
In-Reply-To: <20240517-scrunch-palace-2f83aa8cc3ce@spud>
References: <20240517145302.971019-1-cleger@rivosinc.com>
 <20240517145302.971019-8-cleger@rivosinc.com>
 <20240517-scrunch-palace-2f83aa8cc3ce@spud>
Message-ID: <6d2eb1ec-010d-4390-a25e-afd2fca0311d@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit



On 17/05/2024 18:44, Conor Dooley wrote:
> On Fri, May 17, 2024 at 04:52:47PM +0200, Cl?ment L?ger wrote:
>> Since a few extensions (Zicbom/Zicboz) already needs validation and
>> future ones will need it as well (Zc*) add a validate() callback to
>> struct riscv_isa_ext_data. This require to rework the way extensions are
>> parsed and split it in two phases. First phase is isa string or isa
>> extension list parsing and consists in enabling all the extensions in a
>> temporary bitmask (source isa) without any validation. The second step
>> "resolves" the final isa bitmap, handling potential missing dependencies.
>> The mechanism is quite simple and simply validate each extension
>> described in the source bitmap before enabling it in the resolved isa
>> bitmap. validate() callbacks can return either 0 for success,
>> -EPROBEDEFER if extension needs to be validated again at next loop. A
>> previous ISA bitmap is kept to avoid looping multiple times if an
>> extension dependencies are never satisfied until we reach a stable
>> state. In order to avoid any potential infinite looping, allow looping
>> a maximum of the number of extension we handle. Zicboz and Zicbom
>> extensions are modified to use this validation mechanism.
> 
> I wish we weren't doin' it at all, but since we have to, I think what
> you've got here is good.

Yup, this is what you got with a fast evolving architecture I guess ;)

> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> Do you want me to send some patches for the F/V stuff we discussed
> previously?

Sure go ahead, I did not have anything written yet.

Thanks,

Cl?ment

> 
> Cheers,
> Conor.

