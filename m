From: Anup Patel <anup@brainfault.org>
Date: Tue, 5 Apr 2022 12:48:28 +0530
Subject: [PATCH 2/3] KVM: selftests: riscv: Fix alignment of the
 guest_hang() function
In-Reply-To: <20220329072911.1692766-3-apatel@ventanamicro.com>
References: <20220329072911.1692766-1-apatel@ventanamicro.com>
 <20220329072911.1692766-3-apatel@ventanamicro.com>
Message-ID: <CAAhSdy0ZZAVPr68VK2k+0HQDZHyaCGTv1FgQKHqh2=T1wYzZtg@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Mar 29, 2022 at 12:59 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> The guest_hang() function is used as the default exception handler
> for various KVM selftests applications by setting it's address in
> the vstvec CSR. The vstvec CSR requires exception handler base address
> to be at least 4-byte aligned so this patch fixes alignment of the
> guest_hang() function.
>
> Fixes: 3e06cdf10520 ("KVM: selftests: Add initial support for RISC-V
> 64-bit")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

I have queued this patch for RC fixes.

Thanks,
Anup

> ---
>  tools/testing/selftests/kvm/lib/riscv/processor.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
> index d377f2603d98..3961487a4870 100644
> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
> @@ -268,7 +268,7 @@ void vcpu_dump(FILE *stream, struct kvm_vm *vm, uint32_t vcpuid, uint8_t indent)
>                 core.regs.t3, core.regs.t4, core.regs.t5, core.regs.t6);
>  }
>
> -static void guest_hang(void)
> +static void __aligned(16) guest_hang(void)
>  {
>         while (1)
>                 ;
> --
> 2.25.1
>

