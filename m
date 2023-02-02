From: Andrew Jones <ajones@ventanamicro.com>
Date: Thu, 2 Feb 2023 19:48:57 +0100
Subject: [PATCH v4 14/14] RISC-V: KVM: Increment firmware pmu events
In-Reply-To: <20230201231250.3806412-15-atishp@rivosinc.com>
References: <20230201231250.3806412-1-atishp@rivosinc.com>
 <20230201231250.3806412-15-atishp@rivosinc.com>
Message-ID: <20230202184857.knf3cle6j2cd7a4n@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Feb 01, 2023 at 03:12:50PM -0800, Atish Patra wrote:
> KVM supports firmware events now. Invoke the firmware event increment
> function from appropriate places.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  arch/riscv/kvm/tlb.c              | 4 ++++
>  arch/riscv/kvm/vcpu_sbi_replace.c | 7 +++++++
>  2 files changed, 11 insertions(+)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

