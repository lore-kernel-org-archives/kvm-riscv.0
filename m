From: Yifei Jiang <jiangyifei@huawei.com>
Date: Sat, 20 Nov 2021 15:46:44 +0800
Subject: [PATCH v1 12/12] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <20211120074644.729-1-jiangyifei@huawei.com>
References: <20211120074644.729-1-jiangyifei@huawei.com>
Message-ID: <20211120074644.729-13-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add virtual time context description to vmstate_riscv_cpu. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
---
 target/riscv/machine.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/target/riscv/machine.c b/target/riscv/machine.c
index ad8248ebfd..153215549b 100644
--- a/target/riscv/machine.c
+++ b/target/riscv/machine.c
@@ -164,10 +164,20 @@ static const VMStateDescription vmstate_pointermasking = {
     }
 };
 
+static int cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    CPURISCVState *env = &cpu->env;
+
+    env->kvm_timer_dirty = true;
+    return 0;
+}
+
 const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 3,
     .minimum_version_id = 3,
+    .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -211,6 +221,10 @@ const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINT64(env.mtohost, RISCVCPU),
         VMSTATE_UINT64(env.timecmp, RISCVCPU),
 
+        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
+
         VMSTATE_END_OF_LIST()
     },
     .subsections = (const VMStateDescription * []) {
-- 
2.19.1


