From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 28 Jun 2024 00:51:41 -0700
Subject: [PATCH v4 1/3] drivers/perf: riscv: Do not update the event data
 if uptodate
In-Reply-To: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
References: <20240628-misc_perf_fixes-v4-0-e01cfddcf035@rivosinc.com>
Message-ID: <20240628-misc_perf_fixes-v4-1-e01cfddcf035@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In case of an counter overflow, the event data may get corrupted
if called from an external overflow handler. This happens because
we can't update the counter without starting it when SBI PMU
extension is in use. However, the prev_count has been already
updated at the first pass while the counter value is still the
old one.

The solution is simple where we don't need to update it again
if it is already updated which can be detected using hwc state.
The event state in the overflow handler is updated in the following
patch. Thus, this fix can't be backported to kernel version where
overflow support was added.

Fixes: a8625217a054 ("drivers/perf: riscv: Implement SBI PMU snapshot function")

Reported-by: garthlei at pku.edu.cn
Closes:https://lore.kernel.org/all/CC51D53B-846C-4D81-86FC-FBF969D0A0D6 at pku.edu.cn/
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu.c b/drivers/perf/riscv_pmu.c
index 78c490e0505a..0a02e85a8951 100644
--- a/drivers/perf/riscv_pmu.c
+++ b/drivers/perf/riscv_pmu.c
@@ -167,7 +167,7 @@ u64 riscv_pmu_event_update(struct perf_event *event)
 	unsigned long cmask;
 	u64 oldval, delta;
 
-	if (!rvpmu->ctr_read)
+	if (!rvpmu->ctr_read || (hwc->state & PERF_HES_UPTODATE))
 		return 0;
 
 	cmask = riscv_pmu_ctr_get_width_mask(event);

-- 
2.34.1


