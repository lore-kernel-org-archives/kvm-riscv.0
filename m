From: Haibo Xu <xiaobo55x@gmail.com>
Date: Wed, 6 Sep 2023 14:56:54 +0800
Subject: [PATCH v2 4/8] KVM: riscv: selftests: Switch to use macro from csr.h
In-Reply-To: <20230904-d35320b23119ee97737e8a74@orel>
References: <cover.1693659382.git.haibo1.xu@intel.com> <ee4e518cbed9ff4210b74a22c5af21c410fab85d.1693659382.git.haibo1.xu@intel.com>
 <20230904-d35320b23119ee97737e8a74@orel>
Message-ID: <CAJve8om7Rmp-gbyT7DfHQVPrpkrgA95pbLVrTh=-S2HegkuXpQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Sep 4, 2023 at 9:31?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Sat, Sep 02, 2023 at 08:59:26PM +0800, Haibo Xu wrote:
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > ---
> >  tools/testing/selftests/kvm/include/riscv/processor.h | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> > index 5b62a3d2aa9b..6810c887fadc 100644
> > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > @@ -8,6 +8,7 @@
> >  #define SELFTEST_KVM_PROCESSOR_H
> >
> >  #include "kvm_util.h"
> > +#include <asm/csr.h>
> >  #include <linux/stringify.h>
> >
> >  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> > @@ -95,12 +96,8 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> >  #define PGTBL_PAGE_SIZE                              PGTBL_L0_BLOCK_SIZE
> >  #define PGTBL_PAGE_SIZE_SHIFT                        PGTBL_L0_BLOCK_SHIFT
> >
> > -#define SATP_PPN                             _AC(0x00000FFFFFFFFFFF, UL)
> >  #define SATP_MODE_39                         _AC(0x8000000000000000, UL)
> >  #define SATP_MODE_48                         _AC(0x9000000000000000, UL)
>
> SATP_MODE_39/48 are also in csr.h
>

Good catch! These 2 should also be removed. Will fix it in the next version.

> > -#define SATP_ASID_BITS                               16
> > -#define SATP_ASID_SHIFT                              44
> > -#define SATP_ASID_MASK                               _AC(0xFFFF, UL)
> >
> >  #define SBI_EXT_EXPERIMENTAL_START           0x08000000
> >  #define SBI_EXT_EXPERIMENTAL_END             0x08FFFFFF
> > --
> > 2.34.1
> >
>
> Thanks,
> drew

