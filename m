From: Anup Patel <anup@brainfault.org>
Date: Tue, 19 Oct 2021 14:52:26 +0530
Subject: [PATCH v3 13/23] Documentation: update vcpu-requests.rst reference
In-Reply-To: <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
References: <cover.1634630485.git.mchehab+huawei@kernel.org>
 <1f62fdbd0dd9298a19c491447a4b415a8ef3bd69.1634630486.git.mchehab+huawei@kernel.org>
Message-ID: <CAAhSdy0Rp8gf_OHy-qi1aDhCouMXYe_4qcFUUZkZCs2BCRPNog@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Oct 19, 2021 at 1:34 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Changeset 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> renamed: Documentation/virtual/kvm/vcpu-requests.rst
> to: Documentation/virt/kvm/vcpu-requests.rst.
>
> Update its cross-reference accordingly.
>
> Fixes: 2f5947dfcaec ("Documentation: move Documentation/virtual to Documentation/virt")
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

Looks good to me.

Reviewed-by: Anup Patel <anup.patel@wdc.com>

Regards,
Anup

>
> To mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 00/23] at: https://lore.kernel.org/all/cover.1634630485.git.mchehab+huawei at kernel.org/
>
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index c44cabce7dd8..260ce0779a32 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -912,7 +912,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>                  * Ensure we set mode to IN_GUEST_MODE after we disable
>                  * interrupts and before the final VCPU requests check.
>                  * See the comment in kvm_vcpu_exiting_guest_mode() and
> -                * Documentation/virtual/kvm/vcpu-requests.rst
> +                * Documentation/virt/kvm/vcpu-requests.rst
>                  */
>                 vcpu->mode = IN_GUEST_MODE;
>
> --
> 2.31.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv at lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

