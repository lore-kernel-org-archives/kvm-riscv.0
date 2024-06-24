From: Conor Dooley <conor.dooley@microchip.com>
Date: Mon, 24 Jun 2024 11:28:41 +0100
Subject: [PATCH v7 08/16] riscv: add ISA parsing for Zca, Zcf, Zcd and Zcb
In-Reply-To: <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
References: <20240619113529.676940-1-cleger@rivosinc.com>
 <20240619113529.676940-9-cleger@rivosinc.com>
 <20240623-cornbread-preteen-4ec287aa165c@spud>
 <c59a8897-34a1-4dc3-b68b-35dddf55c937@rivosinc.com>
Message-ID: <20240624-remission-dominoes-9f22be5ba999@wendy>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jun 24, 2024 at 10:24:51AM +0200, Cl?ment L?ger wrote:
> 
> 
> On 23/06/2024 17:42, Conor Dooley wrote:
> > On Wed, Jun 19, 2024 at 01:35:18PM +0200, Cl?ment L?ger wrote:
> >> The Zc* standard extension for code reduction introduces new extensions.
> >> This patch adds support for Zca, Zcf, Zcd and Zcb. Zce, Zcmt and Zcmp
> >> are left out of this patch since they are targeting microcontrollers/
> >> embedded CPUs instead of application processors.
> >>
> >> Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
> >> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> >> ---
> >>  arch/riscv/include/asm/hwcap.h |  4 +++
> >>  arch/riscv/kernel/cpufeature.c | 55 +++++++++++++++++++++++++++++++++-
> >>  2 files changed, 58 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> >> index 18859277843a..b12ae3f2141c 100644
> >> --- a/arch/riscv/include/asm/hwcap.h
> >> +++ b/arch/riscv/include/asm/hwcap.h
> >> @@ -87,6 +87,10 @@
> >>  #define RISCV_ISA_EXT_ZVE64F		78
> >>  #define RISCV_ISA_EXT_ZVE64D		79
> >>  #define RISCV_ISA_EXT_ZIMOP		80
> >> +#define RISCV_ISA_EXT_ZCA		81
> >> +#define RISCV_ISA_EXT_ZCB		82
> >> +#define RISCV_ISA_EXT_ZCD		83
> >> +#define RISCV_ISA_EXT_ZCF		84
> >>  
> >>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> >>  
> >> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> >> index a3af976f36c9..aa631fe49b7c 100644
> >> --- a/arch/riscv/kernel/cpufeature.c
> >> +++ b/arch/riscv/kernel/cpufeature.c
> >> @@ -111,6 +111,9 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
> >>  
> >>  #define __RISCV_ISA_EXT_DATA(_name, _id) _RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, NULL)
> >>  
> >> +#define __RISCV_ISA_EXT_DATA_VALIDATE(_name, _id, _validate) \
> >> +			_RISCV_ISA_EXT_DATA(_name, _id, NULL, 0, _validate)
> >> +
> >>  /* Used to declare pure "lasso" extension (Zk for instance) */
> >>  #define __RISCV_ISA_EXT_BUNDLE(_name, _bundled_exts) \
> >>  	_RISCV_ISA_EXT_DATA(_name, RISCV_ISA_EXT_INVALID, _bundled_exts, \
> >> @@ -122,6 +125,37 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
> >>  #define __RISCV_ISA_EXT_SUPERSET_VALIDATE(_name, _id, _sub_exts, _validate) \
> >>  	_RISCV_ISA_EXT_DATA(_name, _id, _sub_exts, ARRAY_SIZE(_sub_exts), _validate)
> >>  
> >> +static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
> > 
> > It's super minor, but my OCD doesn't like this being called "depends"
> > when the others are all called "validate".
> 
> Ok, let's make a deal. You review patch 14/16 and I'll make the machine
> part of you happy and call this function validate ;)

I generally avoid the hwprobe patches intentionally :) I'm not even
expecting a respin for this tbh, I'd like to just get it in so that I
can do things on top of it.
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 228 bytes
Desc: not available
URL: <http://lists.infradead.org/pipermail/kvm-riscv/attachments/20240624/e997bb7c/attachment.sig>
