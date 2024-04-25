From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 25 Apr 2024 16:29:30 -0700
Subject: [kvm-riscv/for-next 0/2] Fixes for kvm-riscv
Message-ID: <20240425232933.4111680-1-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Here are two fixes for issues found during review/testing after the
series[1] has been queued for 6.10.


@Anup: Can you please squash them into the original source commit 
22f5dac41004 that introduced this ?

[1] https://lore.kernel.org/all/20240420151741.962500-1-atishp at rivosinc.com/

Atish Patra (2):
drivers/perf: riscv: Remove the warning from stop function
drivers/perf: riscv: Fix RV32 snapshot overflow use case

drivers/perf/riscv_pmu.c       |  2 --
drivers/perf/riscv_pmu_sbi.c   | 49 +++++++++++++++++++---------------
include/linux/perf/riscv_pmu.h |  2 ++
3 files changed, 30 insertions(+), 23 deletions(-)

--
2.34.1


