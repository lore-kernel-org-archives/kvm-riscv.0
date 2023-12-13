From: Anup Patel <anup@brainfault.org>
Date: Wed, 13 Dec 2023 17:52:19 +0530
Subject: [PATCH] RISC-V: KVM: remove a redundant condition in kvm_arch_vcpu_ioctl_run()
In-Reply-To: <20231211094014.4041-1-duchao@eswincomputing.com>
References: <20231211094014.4041-1-duchao@eswincomputing.com>
Message-ID: <CAAhSdy0t01YVX3iBq+w1eiEo+NAPotFR3TD2m_558CgS0=AQzw@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Dec 11, 2023 at 3:11?PM Chao Du <duchao@eswincomputing.com> wrote:
>
> The latest ret value is updated by kvm_riscv_vcpu_aia_update(),
> the loop will continue if the ret is less than or equal to zero.
> So the later condition will never hit. Thus remove it.
>
> Signed-off-by: Chao Du <duchao@eswincomputing.com>

Queued this patch for Linux-6.8

Thanks,
Anup

> ---
>  arch/riscv/kvm/vcpu.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e087c809073c..bf3952d1a621 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -757,8 +757,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                 /* Update HVIP CSR for current CPU */
>                 kvm_riscv_update_hvip(vcpu);
>
> -               if (ret <= 0 ||
> -                   kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
> +               if (kvm_riscv_gstage_vmid_ver_changed(&vcpu->kvm->arch.vmid) ||
>                     kvm_request_pending(vcpu) ||
>                     xfer_to_guest_mode_work_pending()) {
>                         vcpu->mode = OUTSIDE_GUEST_MODE;
> --
> 2.17.1
>

