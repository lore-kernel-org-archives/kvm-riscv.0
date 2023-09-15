From: Haibo Xu <xiaobo55x@gmail.com>
Date: Fri, 15 Sep 2023 14:13:13 +0800
Subject: [PATCH v3 5/9] KVM: riscv: selftests: Switch to use macro from csr.h
In-Reply-To: <20230914-18bfe93b679e290188e70307@orel>
References: <cover.1694421911.git.haibo1.xu@intel.com> <6cdda82518977c67004ee01a767bc67962352c13.1694421911.git.haibo1.xu@intel.com>
 <20230914-18bfe93b679e290188e70307@orel>
Message-ID: <CAJve8okdUtcCihGh4wRb9rHTxuL7=7_1FY8Ez0+QMr=+x7fzoQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 14, 2023 at 4:52?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Thu, Sep 14, 2023 at 09:36:59AM +0800, Haibo Xu wrote:
> > Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> > ---
> >  tools/testing/selftests/kvm/include/riscv/processor.h | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> > index 5b62a3d2aa9b..67766baed4f7 100644
> > --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> > +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> > @@ -8,6 +8,7 @@
> >  #define SELFTEST_KVM_PROCESSOR_H
> >
> >  #include "kvm_util.h"
> > +#include <asm/csr.h>
> >  #include <linux/stringify.h>
>
> nit: Usually we try to keep the order of our includes separated into five
> categories, listed below, where each category is sorted alphabetically. Of
> course any dependencies the includes have on each other need to be
> considered too.
>
> <library-includes-without-a-subdir>
> <library-includes-with-subdir>
> <linux/...>
> <asm/...>
> "local-includes"
>

It's very helpful. Thanks for sharing it!
Will fix it in v4.

> >
> >  static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> > @@ -95,13 +96,6 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t idx,
> >  #define PGTBL_PAGE_SIZE                              PGTBL_L0_BLOCK_SIZE
> >  #define PGTBL_PAGE_SIZE_SHIFT                        PGTBL_L0_BLOCK_SHIFT
> >
> > -#define SATP_PPN                             _AC(0x00000FFFFFFFFFFF, UL)
> > -#define SATP_MODE_39                         _AC(0x8000000000000000, UL)
> > -#define SATP_MODE_48                         _AC(0x9000000000000000, UL)
> > -#define SATP_ASID_BITS                               16
> > -#define SATP_ASID_SHIFT                              44
> > -#define SATP_ASID_MASK                               _AC(0xFFFF, UL)
> > -
> >  #define SBI_EXT_EXPERIMENTAL_START           0x08000000
> >  #define SBI_EXT_EXPERIMENTAL_END             0x08FFFFFF
> >
> > --
> > 2.34.1
> >
>
> Assuming the CONFIG_64BIT patch will come before this, then
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew

