From: Anup Patel <anup@brainfault.org>
Date: Wed, 2 Feb 2022 16:44:08 +0530
Subject: [PATCH] RISC-V: KVM: make CY, TM, and IR counters accessible in
 VU mode
In-Reply-To: <20220131110307.1684739-1-mchitale@ventanamicro.com>
References: <20220131110307.1684739-1-mchitale@ventanamicro.com>
Message-ID: <CAAhSdy2wX7Re4yepV7ReNQazF9jb-eqSUDE7rLCarr3iUchzkQ@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 4:33 PM Mayuresh Chitale
<mchitale@ventanamicro.com> wrote:
>
> Those applications that run in VU mode and access the time CSR cause
> a virtual instruction trap as Guest kernel currently does not
> initialize the scounteren CSR.
>
> To fix this, we should make CY, TM, and IR counters accessibile
> by default in VU mode (similar to OpenSBI).
>
> Fixes: a33c72faf2d73 ("RISC-V: KVM: Implement VCPU create, init and
> destroy functions")
> Cc:stable at vger.kernel.org
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>

Thanks, I have queued this for fixes.

Regards,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 0c5239e05721..caaf824347b9 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -90,6 +90,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>  int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>  {
>         struct kvm_cpu_context *cntx;
> +       struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
>
>         /* Mark this VCPU never ran */
>         vcpu->arch.ran_atleast_once = false;
> @@ -106,6 +107,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>         cntx->hstatus |= HSTATUS_SPVP;
>         cntx->hstatus |= HSTATUS_SPV;
>
> +       /* By default, make CY, TM, and IR counters accessible in VU mode */
> +       reset_csr->scounteren=0x7;
> +
>         /* Setup VCPU timer */
>         kvm_riscv_vcpu_timer_init(vcpu);
>
> --
> 2.25.1
>

