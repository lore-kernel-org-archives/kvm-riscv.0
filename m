From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 15 Apr 2024 15:31:32 +0200
Subject: [PATCH v6 21/24] KVM: riscv: selftests: Add SBI PMU selftest
In-Reply-To: <20240411000752.955910-22-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
 <20240411000752.955910-22-atishp@rivosinc.com>
Message-ID: <20240415-05af8386b8ebe9aecf37c1c8@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed, Apr 10, 2024 at 05:07:49PM -0700, Atish Patra wrote:
> This test implements basic sanity test and cycle/instret event
> counting tests.
> 
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/riscv/sbi_pmu_test.c        | 369 ++++++++++++++++++
>  2 files changed, 370 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

