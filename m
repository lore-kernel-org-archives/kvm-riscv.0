From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 29 Nov 2022 06:21:17 +0100
Subject: [PATCH 5/9] RISC-V: KVM: Move sbi related struct and functions
 to kvm_vcpu_sbi.h
In-Reply-To: <20221128161424.608889-6-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-6-apatel@ventanamicro.com>
Message-ID: <20221129052117.d2o4zadk2z43jgoy@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 09:44:20PM +0530, Anup Patel wrote:
> Just like asm/kvm_vcpu_timer.h, we should have all sbi related struct
> and functions in asm/kvm_vcpu_sbi.h.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h     | 10 ++--------
>  arch/riscv/include/asm/kvm_vcpu_sbi.h |  6 ++++++
>  2 files changed, 8 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

