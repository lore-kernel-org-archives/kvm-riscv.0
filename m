From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 13 Jul 2023 14:48:30 +0200
Subject: [PATCH 6/7] RISC-V: KVM: Allow Zbc, Zbk* and Zk* extensions for
 Guest/VM
In-Reply-To: <20230712161047.1764756-7-apatel@ventanamicro.com>
References: <20230712161047.1764756-1-apatel@ventanamicro.com>
 <20230712161047.1764756-7-apatel@ventanamicro.com>
Message-ID: <20230713-bf041a3bbf91d041db3bd623@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Jul 12, 2023 at 09:40:46PM +0530, Anup Patel wrote:
> We extend the KVM ISA extension ONE_REG interface to allow KVM
> user space to detect and enable Zbc, Zbk* and Zk* extensions for
> Guest/VM.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 11 +++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 22 ++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

