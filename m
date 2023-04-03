From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Apr 2023 14:27:41 +0200
Subject: [PATCH v3 6/8] RISC-V: KVM: Add ONE_REG interface for AIA CSRs
In-Reply-To: <20230403093310.2271142-7-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-7-apatel@ventanamicro.com>
Message-ID: <qrx4xyreynfc3yg67cwknwxof3omuknmz55bzyjzrgs3d3iffk@a4qt4pewh5pk>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 03:03:08PM +0530, Anup Patel wrote:
> We implement ONE_REG interface for AIA CSRs as a separate subtype
> under the CSR ONE_REG interface.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 8 ++++++++
>  arch/riscv/kvm/vcpu.c             | 8 ++++++++
>  2 files changed, 16 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

