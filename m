From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 29 Nov 2022 06:22:17 +0100
Subject: [PATCH 7/9] RISC-V: KVM: Save mvendorid, marchid, and mimpid
 when creating VCPU
In-Reply-To: <20221128161424.608889-8-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-8-apatel@ventanamicro.com>
Message-ID: <20221129052217.7rpw33yrr6i6kncx@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Nov 28, 2022 at 09:44:22PM +0530, Anup Patel wrote:
> We should save VCPU mvendorid, marchid, and mimpid at the time
> of creating VCPU so that we don't have to do host SBI call every
> time Guest/VM ask for these details.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 +++++
>  arch/riscv/kvm/vcpu.c             |  6 ++++++
>  arch/riscv/kvm/vcpu_sbi_base.c    | 11 +++++------
>  3 files changed, 16 insertions(+), 6 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

