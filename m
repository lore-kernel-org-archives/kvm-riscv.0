From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 3 Apr 2023 14:18:11 +0200
Subject: [PATCH v3 5/8] RISC-V: KVM: Implement subtype for CSR ONE_REG
 interface
In-Reply-To: <20230403093310.2271142-6-apatel@ventanamicro.com>
References: <20230403093310.2271142-1-apatel@ventanamicro.com>
 <20230403093310.2271142-6-apatel@ventanamicro.com>
Message-ID: <t2xcol77el5zebqnjvigqzysiyv3w2xcc6i45f2gthr5dbntnt@eu4obey7lxgf>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Apr 03, 2023 at 03:03:07PM +0530, Anup Patel wrote:
> To make the CSR ONE_REG interface extensible, we implement subtype
> for the CSR ONE_REG IDs. The existing CSR ONE_REG IDs are treated
> as subtype = 0 (aka General CSRs).
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  3 +-
>  arch/riscv/kvm/vcpu.c             | 88 +++++++++++++++++++++++--------
>  2 files changed, 69 insertions(+), 22 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

