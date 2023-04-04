From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 4 Apr 2023 18:25:17 +0200
Subject: [PATCH v4 7/9] RISC-V: KVM: Use bitmap for irqs_pending and
 irqs_pending_mask
In-Reply-To: <20230404153452.2405681-8-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
 <20230404153452.2405681-8-apatel@ventanamicro.com>
Message-ID: <6dvutvobx754xdbbfw4ociyxuay6fqjwm3vxdp5dmsyefypvzs@ydxl65hjdwt2>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 04, 2023 at 09:04:50PM +0530, Anup Patel wrote:
> To support 64 VCPU local interrupts on RV32 host, we should use
> bitmap for irqs_pending and irqs_pending_mask in struct kvm_vcpu_arch.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  7 ++--
>  arch/riscv/kvm/vcpu.c             | 53 ++++++++++++++++++++-----------
>  2 files changed, 38 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

