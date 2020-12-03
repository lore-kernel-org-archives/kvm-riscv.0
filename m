From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:47:03 +0800
Subject: [PATCH RFC v4 15/15] target/riscv: Add time frequency migration
 support
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-16-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If vcpu's time frequency is not specified by CPU option 'time-frequency'
on the destination, the time frequency of destination will follow
the source.

If vcpu's time frequency specified by CPU option 'time-frequency' on the
destination is different from migrated time frequency. The migration
will be abort.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/machine.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ef2d5395a8..6955542fef 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -144,6 +144,13 @@ static int cpu_post_load(void *opaque, int version_id)
     CPURISCVState *env = &cpu->env;
 
     env->kvm_timer_dirty = true;
+
+    if (env->user_frequency && env->user_frequency != env->frequency) {
+        error_report("Mismatch between user-specified time frequency and "
+                     "migrated time frequency");
+        return -EINVAL;
+    }
+
     return 0;
 }
 
@@ -198,6 +205,7 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
         VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+        VMSTATE_UINT64(env.frequency, RISCVCPU),
 
         VMSTATE_END_OF_LIST()
     },
-- 
2.19.1


