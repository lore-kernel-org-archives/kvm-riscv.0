From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 21 Jul 2023 10:54:31 +0200
Subject: [PATCH v2 3/6] RISC-V: KVM: Enable Smstateen accesses
In-Reply-To: <20230721075439.454473-4-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-4-mchitale@ventanamicro.com>
Message-ID: <20230721-06dfa28577ca906d6aaa5951@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023 at 01:24:36PM +0530, Mayuresh Chitale wrote:
> Configure hstateen0 register so that the AIA state and envcfg are
> accessible to the vcpus. This includes registers such as siselect,
> sireg, siph, sieh and all the IMISC registers.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/csr.h      | 16 ++++++++++++++++
>  arch/riscv/include/asm/kvm_host.h |  1 +
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu.c             | 16 ++++++++++++++++
>  4 files changed, 34 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

