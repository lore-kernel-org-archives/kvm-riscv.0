From: Anup Patel <anup@brainfault.org>
Date: Thu, 9 Jun 2022 09:39:15 +0530
Subject: [PATCH] RISC-V: fix typos in comments
In-Reply-To: <20220430191122.8667-6-Julia.Lawall@inria.fr>
References: <20220430191122.8667-6-Julia.Lawall@inria.fr>
Message-ID: <CAAhSdy1kEPYJQdK+f-6Dkb92ScV9fG2m0J2rJSeWjfNFUtjVwA@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sun, May 1, 2022 at 12:41 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:
>
> Various spelling mistakes in comments.
> Detected with the help of Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

I have included this patch for 5.19-rc fixes

Thanks,
Anup

>
> ---
>  arch/riscv/kvm/vmid.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 2fa4f7b1813d..4a2178c60b5d 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -92,7 +92,7 @@ void kvm_riscv_stage2_vmid_update(struct kvm_vcpu *vcpu)
>                  * We ran out of VMIDs so we increment vmid_version and
>                  * start assigning VMIDs from 1.
>                  *
> -                * This also means existing VMIDs assignement to all Guest
> +                * This also means existing VMIDs assignment to all Guest
>                  * instances is invalid and we have force VMID re-assignement
>                  * for all Guest instances. The Guest instances that were not
>                  * running will automatically pick-up new VMIDs because will
>

