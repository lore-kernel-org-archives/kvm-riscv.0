From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 27 Jan 2023 13:05:39 +0100
Subject: [PATCH v2] RISC-V: KVM: Redirect illegal instruction traps to
 guest
In-Reply-To: <20230127112934.2749592-1-apatel@ventanamicro.com>
References: <20230127112934.2749592-1-apatel@ventanamicro.com>
Message-ID: <20230127120539.nzbdoli7ahmenjmx@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jan 27, 2023 at 04:59:34PM +0530, Anup Patel wrote:
> From: Andy Chiu <andy.chiu@sifive.com>
> 
> The M-mode redirects an unhandled illegal instruction trap back
> to S-mode. However, KVM running in HS-mode terminates the VS-mode
> software when it receives illegal instruction trap. Instead, KVM
> should redirect the illegal instruction trap back to VS-mode, and
> let VS-mode trap handler decide the next step. This futher allows
> guest kernel to implement on-demand enabling of vector extension
> for a guest user space process upon first-use.
> 
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_exit.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..4ea101a73d8b 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>  
>  	/* Set Guest PC to Guest exception vector */
>  	vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +	/* Set Guest privilege mode to supervisor */
> +	vcpu->arch.guest_context.sstatus |= SR_SPP;

This could/should be a separate fix patch, right?

>  }
>  
>  /*
> @@ -179,6 +182,12 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	ret = -EFAULT;
>  	run->exit_reason = KVM_EXIT_UNKNOWN;
>  	switch (trap->scause) {
> +	case EXC_INST_ILLEGAL:
> +		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV) {
> +			kvm_riscv_vcpu_trap_redirect(vcpu, trap);
> +			ret = 1;
> +		}
> +		break;
>  	case EXC_VIRTUAL_INST_FAULT:
>  		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
>  			ret = kvm_riscv_vcpu_virtual_insn(vcpu, run, trap);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

