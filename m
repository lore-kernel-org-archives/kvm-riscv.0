From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 24 Apr 2024 10:13:34 +1000
Subject: [PATCH] target/riscv/kvm: Fix exposure of Zkr
In-Reply-To: <20240422134605.534207-2-ajones@ventanamicro.com>
References: <20240422134605.534207-2-ajones@ventanamicro.com>
Message-ID: <CAKmqyKNX=gnWgTBDp60W_iZk3aEfcNbvfhB+N6ZoWvkQdwxgkg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 22, 2024 at 11:47?PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> The Zkr extension may only be exposed to KVM guests if the VMM
> implements the SEED CSR. Use the same implementation as TCG.
>
> Without this patch, running with a KVM which does not forward the
> SEED CSR access to QEMU will result in an ILL exception being
> injected into the guest (this results in Linux guests crashing on
> boot). And, when running with a KVM which does forward the access,
> QEMU will crash, since QEMU doesn't know what to do with the exit.
>
> Fixes: 3108e2f1c69d ("target/riscv/kvm: update KVM exts to Linux 6.8")
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

Thanks!

Applied to riscv-to-apply.next

Alistair

> ---
>  target/riscv/cpu.h         |  3 +++
>  target/riscv/csr.c         | 18 ++++++++++++++----
>  target/riscv/kvm/kvm-cpu.c | 25 +++++++++++++++++++++++++
>  3 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
> index 3b1a02b9449a..52fb8c15d08f 100644
> --- a/target/riscv/cpu.h
> +++ b/target/riscv/cpu.h
> @@ -821,6 +821,9 @@ void riscv_set_csr_ops(int csrno, riscv_csr_operations *ops);
>
>  void riscv_cpu_register_gdb_regs_for_features(CPUState *cs);
>
> +target_ulong riscv_new_csr_seed(target_ulong new_value,
> +                                target_ulong write_mask);
> +
>  uint8_t satp_mode_max_from_map(uint32_t map);
>  const char *satp_mode_str(uint8_t satp_mode, bool is_32_bit);
>
> diff --git a/target/riscv/csr.c b/target/riscv/csr.c
> index 726096444fae..829d8346ed4e 100644
> --- a/target/riscv/csr.c
> +++ b/target/riscv/csr.c
> @@ -4267,10 +4267,8 @@ static RISCVException write_upmbase(CPURISCVState *env, int csrno,
>  #endif
>
>  /* Crypto Extension */
> -static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> -                               target_ulong *ret_value,
> -                               target_ulong new_value,
> -                               target_ulong write_mask)
> +target_ulong riscv_new_csr_seed(target_ulong new_value,
> +                                target_ulong write_mask)
>  {
>      uint16_t random_v;
>      Error *random_e = NULL;
> @@ -4294,6 +4292,18 @@ static RISCVException rmw_seed(CPURISCVState *env, int csrno,
>          rval = random_v | SEED_OPST_ES16;
>      }
>
> +    return rval;
> +}
> +
> +static RISCVException rmw_seed(CPURISCVState *env, int csrno,
> +                               target_ulong *ret_value,
> +                               target_ulong new_value,
> +                               target_ulong write_mask)
> +{
> +    target_ulong rval;
> +
> +    rval = riscv_new_csr_seed(new_value, write_mask);
> +
>      if (ret_value) {
>          *ret_value = rval;
>      }
> diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
> index 6a6c6cae80f1..50bdbd24a878 100644
> --- a/target/riscv/kvm/kvm-cpu.c
> +++ b/target/riscv/kvm/kvm-cpu.c
> @@ -1418,6 +1418,28 @@ static int kvm_riscv_handle_sbi(CPUState *cs, struct kvm_run *run)
>      return ret;
>  }
>
> +static int kvm_riscv_handle_csr(CPUState *cs, struct kvm_run *run)
> +{
> +    target_ulong csr_num = run->riscv_csr.csr_num;
> +    target_ulong new_value = run->riscv_csr.new_value;
> +    target_ulong write_mask = run->riscv_csr.write_mask;
> +    int ret = 0;
> +
> +    switch (csr_num) {
> +    case CSR_SEED:
> +        run->riscv_csr.ret_value = riscv_new_csr_seed(new_value, write_mask);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "%s: un-handled CSR EXIT for CSR %lx\n",
> +                      __func__, csr_num);
> +        ret = -1;
> +        break;
> +    }
> +
> +    return ret;
> +}
> +
>  int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>  {
>      int ret = 0;
> @@ -1425,6 +1447,9 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
>      case KVM_EXIT_RISCV_SBI:
>          ret = kvm_riscv_handle_sbi(cs, run);
>          break;
> +    case KVM_EXIT_RISCV_CSR:
> +        ret = kvm_riscv_handle_csr(cs, run);
> +        break;
>      default:
>          qemu_log_mask(LOG_UNIMP, "%s: un-handled exit reason %d\n",
>                        __func__, run->exit_reason);
> --
> 2.44.0
>
>

