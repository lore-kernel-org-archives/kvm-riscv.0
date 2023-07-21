From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 21 Jul 2023 10:53:25 +0200
Subject: [PATCH v2 2/6] RISC-V: KVM: Add kvm_vcpu_config
In-Reply-To: <20230721075439.454473-3-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
 <20230721075439.454473-3-mchitale@ventanamicro.com>
Message-ID: <20230721-dbd1895a2b4d06091fdb96f7@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Jul 21, 2023 at 01:24:35PM +0530, Mayuresh Chitale wrote:
> Add a placeholder for all registers such as henvcfg, hstateen etc
> which have 'static' configurations depending on extensions supported by
> the guest. The values are derived once and are then subsequently written
> to the corresponding CSRs while switching to the vcpu.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  7 +++++++
>  arch/riscv/kvm/vcpu.c             | 27 ++++++++++++++-------------
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

