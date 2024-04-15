From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Apr 2024 15:23:35 +0200
Subject: [PATCH v6 14/24] RISC-V: KVM: Add perf sampling support for
 guests
In-Reply-To: <20240411000752.955910-15-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-15-atishp@rivosinc.com>
Message-ID: <20240415-cdc6d5bc6c5145f9d6f54afc@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 05:07:42PM -0700, Atish Patra wrote:
> KVM enables perf for guest via counter virtualization. However, the
> sampling can not be supported as there is no mechanism to enabled
> trap/emulate scountovf in ISA yet. Rely on the SBI PMU snapshot
> to provide the counter overflow data via the shared memory.
> 
> In case of sampling event, the host first sets the guest's LCOFI
> interrupt and injects to the guest via irq filtering mechanism defined
> in AIA specification. Thus, ssaia must be enabled in the host in order
> to use perf sampling in the guest. No other AIA dependency w.r.t kernel
> is required.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/include/asm/csr.h          |  3 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h |  3 ++
>  arch/riscv/include/uapi/asm/kvm.h     |  1 +
>  arch/riscv/kvm/aia.c                  |  5 ++
>  arch/riscv/kvm/vcpu.c                 | 15 ++++--
>  arch/riscv/kvm/vcpu_onereg.c          |  6 +++
>  arch/riscv/kvm/vcpu_pmu.c             | 68 +++++++++++++++++++++++++--
>  7 files changed, 93 insertions(+), 8 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

