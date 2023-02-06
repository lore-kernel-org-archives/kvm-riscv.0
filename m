From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 6 Feb 2023 13:04:45 +0100
Subject: [PATCH v5 13/14] RISC-V: KVM: Support firmware events
In-Reply-To: <20230205011515.1284674-14-atishp@rivosinc.com>
References: <20230205011515.1284674-1-atishp@rivosinc.com>
 <20230205011515.1284674-14-atishp@rivosinc.com>
Message-ID: <20230206120445.6tlsvy5fsawn475v@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Feb 04, 2023 at 05:15:14PM -0800, Atish Patra wrote:
> SBI PMU extension defines a set of firmware events which can provide
> useful information to guests about the number of SBI calls. As
> hypervisor implements the SBI PMU extension, these firmware events
> correspond to ecall invocations between VS->HS mode. All other firmware
> events will always report zero if monitored as KVM doesn't implement them.
> 
> This patch adds all the infrastructure required to support firmware
> events.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  17 ++++
>  arch/riscv/kvm/vcpu_pmu.c             | 141 ++++++++++++++++++++------
>  2 files changed, 125 insertions(+), 33 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

