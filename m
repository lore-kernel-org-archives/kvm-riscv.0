From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 25 Sep 2024 13:06:35 +0200
Subject: [PATCH v2 1/1] target/riscv: enable floating point unit
In-Reply-To: <20240925061704.12440-1-heinrich.schuchardt@canonical.com>
References: <20240925061704.12440-1-heinrich.schuchardt@canonical.com>
Message-ID: <20240925-27610830c7f6c0235bc8b1a1@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Sep 25, 2024 at 08:17:04AM GMT, Heinrich Schuchardt wrote:
> The status and mstatus CSRs contain bit field FS, which control if the
> floating point unit of RISC-V hart is enabled.
> 
> There seems to be no specification prescribing the value of the field when
> entering S-mode from M-mode. But OpenSBI, as the leading SBI M-mode
> firmware, has set a precedent by enabling the FPU by setting the value of
> FS to 3 (dirty).
> 
> In TCG mode, QEMU uses OpenSBI by default. Users can reasonably expect that
> software running QEMU in TCG mode and in KVM mode behaves similarly.
> 
> When QEMU in KVM mode creates a vCPU, Linux' KVM code sets FS=1 (initial)
> in kvm_riscv_vcpu_fp_reset(). However, QEMU internally keeps a value of
> FS=0 (off) and then synchronizes this value into KVM. Thus VS-mode software
> is invoked with a disabled floating point unit.
> 
> One example of software being impacted is EDK II with TLS enabled. It
> crashes when hitting the first floating point instruction while running
> QEMU with --accel kvm, and runs fine with --accel tcg.
> 
> With this patch the FPU will be enabled when entering S-mode in KVM mode
> and when entering M-mode in TCG mode.
> 
> Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> ---
> v2:
> 	Rewrite the commit message as suggested in the v1 thread
> 	https://lore.kernel.org/qemu-riscv/20240916181633.366449-1-heinrich.schuchardt at canonical.com/
> ---
>  target/riscv/cpu.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> index 4bda754b01..c32e2721d4 100644
> --- a/target/riscv/cpu.c
> +++ b/target/riscv/cpu.c
> @@ -923,6 +923,13 @@ static void riscv_cpu_reset_hold(Object *obj, ResetType type)
>      if (mcc->parent_phases.hold) {
>          mcc->parent_phases.hold(obj, type);
>      }
> +    if (riscv_has_ext(env, RVF) || riscv_has_ext(env, RVD)) {
> +        env->mstatus = set_field(env->mstatus, MSTATUS_FS, env->misa_mxl);
> +        for (int regnr = 0; regnr < 32; ++regnr) {
> +            env->fpr[regnr] = 0;
> +        }
> +        riscv_csrrw(env, CSR_FCSR, NULL, 0, -1);
> +    }
>  #ifndef CONFIG_USER_ONLY
>      env->misa_mxl = mcc->misa_mxl_max;
>      env->priv = PRV_M;
> -- 
> 2.45.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

