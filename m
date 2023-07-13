From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Jul 2023 13:27:08 +0200
Subject: [PATCH 2/7] RISC-V: KVM: Extend ONE_REG to enable/disable
 multiple ISA extensions
In-Reply-To: <20230712161047.1764756-3-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-3-apatel@ventanamicro.com>
Message-ID: <20230713-3dd9e72ecd9f7926a2035f59@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 09:40:42PM +0530, Anup Patel wrote:
> Currently, the ISA extension ONE_REG interface only allows enabling or
> disabling one extension at a time. To improve this, we extend the ISA
> extension ONE_REG interface (similar to SBI extension ONE_REG interface)
> so that KVM user space can enable/disable multiple extensions in one
> ioctl.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |   9 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 153 ++++++++++++++++++++++++------
>  2 files changed, 133 insertions(+), 29 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

