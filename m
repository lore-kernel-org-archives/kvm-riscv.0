From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Jul 2023 13:45:41 +0200
Subject: [PATCH 4/7] RISC-V: KVM: Allow Zicntr, Zicsr, Zifencei, and
 Zihpm for Guest/VM
In-Reply-To: <20230712161047.1764756-5-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-5-apatel@ventanamicro.com>
Message-ID: <20230713-0a6b8a76803c70d3fe92f77c@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 09:40:44PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zicntr, Zicsr, Zifencei, and Zihpm
> extensions for Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 4 ++++
>  arch/riscv/kvm/vcpu_onereg.c      | 8 ++++++++
>  2 files changed, 12 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

