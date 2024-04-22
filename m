From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 22 Apr 2024 12:36:42 +0100
Subject: [PATCH v2 04/12] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
 <20240418124300.1387978-5-cleger@rivosinc.com>
 <20240419-clinic-amusing-d23b1b6d2af2@spud>
 <6ab9e591-f2f2-4267-8bdd-169ef0243e14@rivosinc.com>
 <20240422-daylight-sassy-ff3b0d867fef@wendy>
 <032530b8-a26e-494f-bd9c-3e1661add5d4@rivosinc.com>
Message-ID: <20240422-matchbook-unlikable-59987a8d8b1f@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 22, 2024 at 01:14:26PM +0200, Cl?ment L?ger wrote:
> On 22/04/2024 11:35, Conor Dooley wrote:
> > On Mon, Apr 22, 2024 at 10:53:10AM +0200, Cl?ment L?ger wrote:
> >> On 19/04/2024 17:51, Conor Dooley wrote:
> >>> On Thu, Apr 18, 2024 at 02:42:27PM +0200, Cl?ment L?ger wrote:
> >>>> The Zc* standard extension for code reduction introduces new extensions.
> >>>> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> >>>> are left out of this patch since they are targeting microcontrollers/
> >>>> embedded CPUs instead of application processors.
> >>>>
> >>>> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> >>>> ---
> >>>>  arch/riscv/include/asm/hwcap.h | 4 ++++
> >>>>  arch/riscv/kernel/cpufeature.c | 4 ++++
> >>>>  2 files changed, 8 insertions(+)
> >>>>
> >>>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >>>> index 543e3ea2da0e..b7551bad341b 100644
> >>>> --- a/arch/riscv/include/asm/hwcap.h
> >>>> +++ b/arch/riscv/include/asm/hwcap.h
> >>>> @@ -82,6 +82,10 @@
> >>>>  #define RISCV_ISA_EXT_ZACAS		73
> >>>>  #define RISCV_ISA_EXT_XANDESPMU		74
> >>>>  #define RISCV_ISA_EXT_ZIMOP		75
> >>>> +#define RISCV_ISA_EXT_ZCA		76
> >>>> +#define RISCV_ISA_EXT_ZCB		77
> >>>> +#define RISCV_ISA_EXT_ZCD		78
> >>>> +#define RISCV_ISA_EXT_ZCF		79
> >>>>  
> >>>>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >>>>  
> >>>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >>>> index 115ba001f1bc..09dee071274d 100644
> >>>> --- a/arch/riscv/kernel/cpufeature.c
> >>>> +++ b/arch/riscv/kernel/cpufeature.c
> >>>> @@ -261,6 +261,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> >>>>  	__RISCV_ISA_EXT_DATA(zfa, RISCV_ISA_EXT_ZFA),
> >>>>  	__RISCV_ISA_EXT_DATA(zfh, RISCV_ISA_EXT_ZFH),
> >>>>  	__RISCV_ISA_EXT_DATA(zfhmin, RISCV_ISA_EXT_ZFHMIN),
> >>>> +	__RISCV_ISA_EXT_DATA(zca, RISCV_ISA_EXT_ZCA),
> >>>> +	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> >>>> +	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> >>>> +	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> >>>>  	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
> >>>>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
> >>>>  	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
> >>>
> >>> Ye, this looks exactly like what I "feared".
> >>
> >> Ok but for instance, Qemu actually set Zc* based on C/F/D. So the ISA
> >> string containing theses dependencies should actually also be allowed.
> >> So should we simply ignore them in the ISA string and always do our own
> >> "post-processing" based on C/F/D?
> > 
> > I'm not familiar with the contents of all of these extensions, but I
> > assume the reasoning for splitting them out is that you can implement
> > them but not maybe not implement C (or something similar)? If that's the
> > case, you cannot always imply.
> 
> Yeah, they can be implemented independently so we need to be able to
> parse them independently.

> However, the kernel currently requires C

No it doesn't!
There's a Kconfig option that controls whether or not we build with
compressed instructions.

> so we
> should always have Zca/Zcf/Zcd. But if that changes in the future, then,
> that won't be true anymore. Better keep it generic probably

-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240422/e6542f09/attachment.sig>
