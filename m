From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Apr 2024 15:19:59 +0200
Subject: [PATCH v6 13/24] RISC-V: KVM: Implement SBI PMU Snapshot feature
In-Reply-To: <20240411000752.955910-14-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-14-atishp@rivosinc.com>
Message-ID: <20240415-74754b02ead9b89dcaef6d3a@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 05:07:41PM -0700, Atish Patra wrote:
> PMU Snapshot function allows to minimize the number of traps when the
> guest access configures/access the hpmcounters. If the snapshot feature
> is enabled, the hypervisor updates the shared memory with counter
> data and state of overflown counters. The guest can just read the
> shared memory instead of trap & emulate done by the hypervisor.
> 
> This patch doesn't implement the counter overflow yet.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |   7 ++
>  arch/riscv/kvm/vcpu_pmu.c             | 121 +++++++++++++++++++++++++-
>  arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
>  3 files changed, 130 insertions(+), 1 deletion(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

