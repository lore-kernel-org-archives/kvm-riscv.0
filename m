From: Anup Patel <anup@brainfault.org>
Date: Fri, 26 Apr 2024 13:17:55 +0530
Subject: [PATCH v2 kvm-riscv/for-next 0/2] Fixes for kvm-riscv
In-Reply-To: <20240426031637.4135544-1-atishp@rivosinc.com>
References: <20240426031637.4135544-1-atishp@rivosinc.com>
Message-ID: <CAAhSdy2xECj3AOBNCVJSsNi==7PdT5riqx7-gsVd-v0MdRU2ag@mail.gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Fri, Apr 26, 2024 at 5:18?AM Atish Patra <atishp@rivosinc.com> wrote:
>
> Here are two fixes for issues found during review/testing after the
> series[1] has been queued for 6.10.
>
> @Anup: Can you please squash them into the original source commit
> 22f5dac41004 that introduced this ?
>
> [1] https://lore.kernel.org/all/20240420151741.962500-1-atishp at rivosinc.com/
>
> Changes from v1->v2:
> 1. Added RB tags.
> 2. Optimized the logic for overflow mask.
> 3. Update the fixes tag. The cover letter should be enough to indicate the base
>    tag for rebasing.
>
> Atish Patra (2):
> drivers/perf: riscv: Remove the warning from stop function
> drivers/perf: riscv: Fix RV32 snapshot overflow use case

Thanks, I have squashed both fixes into appropriate commit along
with Samuel's Reviewed-by

Regards,
Anup

>
> drivers/perf/riscv_pmu.c       |  2 --
> drivers/perf/riscv_pmu_sbi.c   | 45 +++++++++++++++++++---------------
> include/linux/perf/riscv_pmu.h |  2 ++
> 3 files changed, 27 insertions(+), 22 deletions(-)
>
> --
> 2.34.1
>

