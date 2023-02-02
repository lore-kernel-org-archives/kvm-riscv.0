From: Anup Patel <anup@brainfault.org>
Date: Thu, 2 Feb 2023 14:19:23 +0530
Subject: [PATCH v3 1/2] RISC-V: KVM: Fix privilege mode setting in kvm_riscv_vcpu_trap_redirect()
In-Reply-To: <20230128082847.3055316-1-apatel@ventanamicro.com>
References: <20230128082847.3055316-1-apatel@ventanamicro.com>
Message-ID: <CAAhSdy17dUdhn3ijVzps4J0k=_xH6GWC16CHHJPN_2E7xBwdbA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Jan 28, 2023 at 1:58 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The kvm_riscv_vcpu_trap_redirect() should set guest privilege mode
> to supervisor mode because guest traps/interrupts are always handled
> in virtual supervisor mode.
>
> Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Queued this patch for Linux-6.3

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu_exit.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index c9f741ab26f5..af7c4bc07929 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -160,6 +160,9 @@ void kvm_riscv_vcpu_trap_redirect(struct kvm_vcpu *vcpu,
>
>         /* Set Guest PC to Guest exception vector */
>         vcpu->arch.guest_context.sepc = csr_read(CSR_VSTVEC);
> +
> +       /* Set Guest privilege mode to supervisor */
> +       vcpu->arch.guest_context.sstatus |= SR_SPP;
>  }
>
>  /*
> --
> 2.34.1
>

