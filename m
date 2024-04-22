From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:57:51 +0530
Subject: [PATCH v8 17/24] KVM: riscv: selftests: Move sbi definitions to
 its own header file
In-Reply-To: <20240420151741.962500-18-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-18-atishp@rivosinc.com>
Message-ID: <CAAhSdy0KMApgSh4q1zxgv1AKrT44bSEL3+GaFbA8M1XL6UMoJw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 20, 2024 at 5:18?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> The SBI definitions will continue to grow. Move the sbi related
> definitions to its own header file from processor.h
>
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  .../selftests/kvm/include/riscv/processor.h   | 39 ---------------
>  .../testing/selftests/kvm/include/riscv/sbi.h | 50 +++++++++++++++++++
>  .../selftests/kvm/include/riscv/ucall.h       |  1 +
>  tools/testing/selftests/kvm/steal_time.c      |  4 +-
>  4 files changed, 54 insertions(+), 40 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/sbi.h
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index ce473fe251dd..3b9cb39327ff 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -154,45 +154,6 @@ void vm_install_interrupt_handler(struct kvm_vm *vm, exception_handler_fn handle
>  #define PGTBL_PAGE_SIZE                                PGTBL_L0_BLOCK_SIZE
>  #define PGTBL_PAGE_SIZE_SHIFT                  PGTBL_L0_BLOCK_SHIFT
>
> -/* SBI return error codes */
> -#define SBI_SUCCESS                            0
> -#define SBI_ERR_FAILURE                                -1
> -#define SBI_ERR_NOT_SUPPORTED                  -2
> -#define SBI_ERR_INVALID_PARAM                  -3
> -#define SBI_ERR_DENIED                         -4
> -#define SBI_ERR_INVALID_ADDRESS                        -5
> -#define SBI_ERR_ALREADY_AVAILABLE              -6
> -#define SBI_ERR_ALREADY_STARTED                        -7
> -#define SBI_ERR_ALREADY_STOPPED                        -8
> -
> -#define SBI_EXT_EXPERIMENTAL_START             0x08000000
> -#define SBI_EXT_EXPERIMENTAL_END               0x08FFFFFF
> -
> -#define KVM_RISCV_SELFTESTS_SBI_EXT            SBI_EXT_EXPERIMENTAL_END
> -#define KVM_RISCV_SELFTESTS_SBI_UCALL          0
> -#define KVM_RISCV_SELFTESTS_SBI_UNEXP          1
> -
> -enum sbi_ext_id {
> -       SBI_EXT_BASE = 0x10,
> -       SBI_EXT_STA = 0x535441,
> -};
> -
> -enum sbi_ext_base_fid {
> -       SBI_EXT_BASE_PROBE_EXT = 3,
> -};
> -
> -struct sbiret {
> -       long error;
> -       long value;
> -};
> -
> -struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> -                       unsigned long arg1, unsigned long arg2,
> -                       unsigned long arg3, unsigned long arg4,
> -                       unsigned long arg5);
> -
> -bool guest_sbi_probe_extension(int extid, long *out_val);
> -
>  static inline void local_irq_enable(void)
>  {
>         csr_set(CSR_SSTATUS, SR_SIE);
> diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
> new file mode 100644
> index 000000000000..ba04f2dec7b5
> --- /dev/null
> +++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
> @@ -0,0 +1,50 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * RISC-V SBI specific definitions
> + *
> + * Copyright (C) 2024 Rivos Inc.
> + */
> +
> +#ifndef SELFTEST_KVM_SBI_H
> +#define SELFTEST_KVM_SBI_H
> +
> +/* SBI return error codes */
> +#define SBI_SUCCESS                             0
> +#define SBI_ERR_FAILURE                                -1
> +#define SBI_ERR_NOT_SUPPORTED                  -2
> +#define SBI_ERR_INVALID_PARAM                  -3
> +#define SBI_ERR_DENIED                         -4
> +#define SBI_ERR_INVALID_ADDRESS                        -5
> +#define SBI_ERR_ALREADY_AVAILABLE              -6
> +#define SBI_ERR_ALREADY_STARTED                        -7
> +#define SBI_ERR_ALREADY_STOPPED                        -8
> +
> +#define SBI_EXT_EXPERIMENTAL_START             0x08000000
> +#define SBI_EXT_EXPERIMENTAL_END               0x08FFFFFF
> +
> +#define KVM_RISCV_SELFTESTS_SBI_EXT            SBI_EXT_EXPERIMENTAL_END
> +#define KVM_RISCV_SELFTESTS_SBI_UCALL          0
> +#define KVM_RISCV_SELFTESTS_SBI_UNEXP          1
> +
> +enum sbi_ext_id {
> +       SBI_EXT_BASE = 0x10,
> +       SBI_EXT_STA = 0x535441,
> +};
> +
> +enum sbi_ext_base_fid {
> +       SBI_EXT_BASE_PROBE_EXT = 3,
> +};
> +
> +struct sbiret {
> +       long error;
> +       long value;
> +};
> +
> +struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
> +                       unsigned long arg1, unsigned long arg2,
> +                       unsigned long arg3, unsigned long arg4,
> +                       unsigned long arg5);
> +
> +bool guest_sbi_probe_extension(int extid, long *out_val);
> +
> +#endif /* SELFTEST_KVM_SBI_H */
> diff --git a/tools/testing/selftests/kvm/include/riscv/ucall.h b/tools/testing/selftests/kvm/include/riscv/ucall.h
> index be46eb32ec27..a695ae36f3e0 100644
> --- a/tools/testing/selftests/kvm/include/riscv/ucall.h
> +++ b/tools/testing/selftests/kvm/include/riscv/ucall.h
> @@ -3,6 +3,7 @@
>  #define SELFTEST_KVM_UCALL_H
>
>  #include "processor.h"
> +#include "sbi.h"
>
>  #define UCALL_EXIT_REASON       KVM_EXIT_RISCV_SBI
>
> diff --git a/tools/testing/selftests/kvm/steal_time.c b/tools/testing/selftests/kvm/steal_time.c
> index bae0c5026f82..2ff82c7fd926 100644
> --- a/tools/testing/selftests/kvm/steal_time.c
> +++ b/tools/testing/selftests/kvm/steal_time.c
> @@ -11,7 +11,9 @@
>  #include <pthread.h>
>  #include <linux/kernel.h>
>  #include <asm/kvm.h>
> -#ifndef __riscv
> +#ifdef __riscv
> +#include "sbi.h"
> +#else
>  #include <asm/kvm_para.h>
>  #endif
>
> --
> 2.34.1
>

