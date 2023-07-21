From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 21 Jul 2023 10:55:30 +0200
Subject: [PATCH v2 4/6] RISCV: KVM: Add senvcfg context save/restore
In-Reply-To: <20230721075439.454473-5-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-5-mchitale@ventanamicro.com>
Message-ID: <20230721-e1837bf67c22da7377d892b4@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023 at 01:24:37PM +0530, Mayuresh Chitale wrote:
> Add senvcfg context save/restore for guest VCPUs and also add it to the
> ONE_REG interface to allow its access from user space.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 1 +
>  arch/riscv/include/asm/kvm_host.h | 2 ++
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 4 ++++
>  4 files changed, 8 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

