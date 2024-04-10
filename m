From: Conor Dooley <conor@kernel.org>
Date: Wed, 10 Apr 2024 23:27:16 +0100
Subject: [PATCH 07/10] riscv: add ISA extension parsing for Zcmop
In-Reply-To: <20240410-jawless-cavalry-a3eaf9c562a4@spud>
References: <20240410091106.749233-1-cleger@rivosinc.com>
 <20240410091106.749233-8-cleger@rivosinc.com>
 <ZhcFeVYUQJmBAKuv@debug.ba.rivosinc.com>
 <20240410-jawless-cavalry-a3eaf9c562a4@spud>
Message-ID: <20240410-judgingly-appease-5df493852b70@spud>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 11:16:11PM +0100, Conor Dooley wrote:
> On Wed, Apr 10, 2024 at 02:32:41PM -0700, Deepak Gupta wrote:
> > On Wed, Apr 10, 2024 at 11:11:00AM +0200, Cl?ment L?ger wrote:
> > > Add parsing for Zcmop ISA extension which was ratified in commit
> > > b854a709c00 ("Zcmop is ratified/1.0") of the riscv-isa-manual.
> > > 
> > > Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> > > ---
> > > arch/riscv/include/asm/hwcap.h | 1 +
> > > arch/riscv/kernel/cpufeature.c | 1 +
> > > 2 files changed, 2 insertions(+)
> > > 
> > > diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> > > index b7551bad341b..cff7660de268 100644
> > > --- a/arch/riscv/include/asm/hwcap.h
> > > +++ b/arch/riscv/include/asm/hwcap.h
> > > @@ -86,6 +86,7 @@
> > > #define RISCV_ISA_EXT_ZCB		77
> > > #define RISCV_ISA_EXT_ZCD		78
> > > #define RISCV_ISA_EXT_ZCF		79
> > > +#define RISCV_ISA_EXT_ZCMOP		80
> > > 
> > > #define RISCV_ISA_EXT_XLINUXENVCFG	127
> > > 
> > > diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> > > index 09dee071274d..f1450cd7231e 100644
> > > --- a/arch/riscv/kernel/cpufeature.c
> > > +++ b/arch/riscv/kernel/cpufeature.c
> > > @@ -265,6 +265,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
> > > 	__RISCV_ISA_EXT_DATA(zcb, RISCV_ISA_EXT_ZCB),
> > > 	__RISCV_ISA_EXT_DATA(zcd, RISCV_ISA_EXT_ZCD),
> > > 	__RISCV_ISA_EXT_DATA(zcf, RISCV_ISA_EXT_ZCF),
> > > +	__RISCV_ISA_EXT_DATA(zcmop, RISCV_ISA_EXT_ZCMOP),
> > 
> > As per spec zcmop is dependent on zca. So perhaps below ?
> > 
> > __RISCV_ISA_EXT_SUPERSET(zicboz, RISCV_ISA_EXT_ZCMOP, RISCV_ISA_EXT_ZCA)
> 
> What's zicboz got to do with it, copy-pasto I guess?
> If we're gonna imply stuff like this though I think we need some
> comments explaining why it's okay.

Also, I'm inclined to call that out specifically in the binding, I've
not yet checked if dependencies actually work for elements of a string
array like the do for individual properties. I'll todo list that..
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240410/57ae9275/attachment.sig>
