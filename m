From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Jul 2023 12:57:07 +0200
Subject: [PATCH 1/7] RISC-V: KVM: Factor-out ONE_REG related code to its
 own source file
In-Reply-To: <20230712161047.1764756-2-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-2-apatel@ventanamicro.com>
Message-ID: <20230713-40f6804b248987add29f83aa@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 09:40:41PM +0530, Anup Patel wrote:
> The VCPU ONE_REG interface has grown over time and it will continue
> to grow with new ISA extensions and other features. Let us move all
> ONE_REG related code to its own source file so that vcpu.c only
> focuses only on high-level VCPU functions.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |   6 +
>  arch/riscv/kvm/Makefile           |   1 +
>  arch/riscv/kvm/vcpu.c             | 529 +----------------------------
>  arch/riscv/kvm/vcpu_onereg.c      | 547 ++++++++++++++++++++++++++++++
>  4 files changed, 555 insertions(+), 528 deletions(-)
>  create mode 100644 arch/riscv/kvm/vcpu_onereg.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

