From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Apr 2023 10:44:13 +0200
Subject: [PATCH] RISC-V: KVM: Allow Zbb extension for Guest/VM
In-Reply-To: <20230401112730.2105240-1-apatel@ventanamicro.com>
References: <20230401112730.2105240-1-apatel@ventanamicro.com>
Message-ID: <mhrkfb5qtqlmzvivljo4y4o2ii4r6ucjdyeq4orn2gxpbrxzel@eemujnzws5xt>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Apr 01, 2023 at 04:57:30PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zbb extension for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

