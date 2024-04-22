From: Anup Patel <anup@brainfault.org>
Date: Mon, 22 Apr 2024 10:59:25 +0530
Subject: [PATCH v8 18/24] KVM: riscv: selftests: Add helper functions for
 extension checks
In-Reply-To: <20240420151741.962500-19-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com> <20240420151741.962500-19-atishp@rivosinc.com>
Message-ID: <CAAhSdy0OmAjs1oHUjPzwUydsnGtqUd_HKTZKZzJpQQFEXvPX8w@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 20, 2024 at 5:18?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> __vcpu_has_ext can check both SBI and ISA extensions when the first
> argument is properly converted to SBI/ISA extension IDs. Introduce
> two helper functions to make life easier for developers so they
> don't have to worry about the conversions.
>
> Replace the current usages as well with new helpers.
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

LGTM.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  tools/testing/selftests/kvm/include/riscv/processor.h | 10 ++++++++++
>  tools/testing/selftests/kvm/riscv/arch_timer.c        |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
> index 3b9cb39327ff..5f389166338c 100644
> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
> @@ -50,6 +50,16 @@ static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>
>  bool __vcpu_has_ext(struct kvm_vcpu *vcpu, uint64_t ext);
>
> +static inline bool __vcpu_has_isa_ext(struct kvm_vcpu *vcpu, uint64_t isa_ext)
> +{
> +       return __vcpu_has_ext(vcpu, RISCV_ISA_EXT_REG(isa_ext));
> +}
> +
> +static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
> +{
> +       return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
> +}
> +
>  struct ex_regs {
>         unsigned long ra;
>         unsigned long sp;
> diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
> index 0f9cabd99fd4..735b78569021 100644
> --- a/tools/testing/selftests/kvm/riscv/arch_timer.c
> +++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
> @@ -85,7 +85,7 @@ struct kvm_vm *test_vm_create(void)
>         int nr_vcpus = test_args.nr_vcpus;
>
>         vm = vm_create_with_vcpus(nr_vcpus, guest_code, vcpus);
> -       __TEST_REQUIRE(__vcpu_has_ext(vcpus[0], RISCV_ISA_EXT_REG(KVM_RISCV_ISA_EXT_SSTC)),
> +       __TEST_REQUIRE(__vcpu_has_isa_ext(vcpus[0], KVM_RISCV_ISA_EXT_SSTC),
>                                    "SSTC not available, skipping test\n");
>
>         vm_init_vector_tables(vm);
> --
> 2.34.1
>

