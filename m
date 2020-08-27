From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 27 Aug 2020 17:21:37 +0800
Subject: [PATCH RFC v3 14/14] target/riscv: Support virtual time context
 synchronization
In-Reply-To: <20200827092137.479-1-jiangyifei@huawei.com>
References: <20200827092137.479-1-jiangyifei@huawei.com>
Message-ID: <20200827092137.479-15-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add virtual time context description to vmstate_riscv_cpu. After cpu being
loaded, virtual time context is updated to KVM.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index b698f4adbb..c6b207d201 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -496,11 +496,19 @@ static void riscv_cpu_init(Object *obj)
     cpu_set_cpustate_pointers(cpu);
 }
 
+static int cpu_post_load(void *opaque, int version_id)
+{
+    RISCVCPU *cpu = opaque;
+    cpu->env.kvm_timer_dirty = true;
+    return 0;
+}
+
 #ifndef CONFIG_USER_ONLY
 static const VMStateDescription vmstate_riscv_cpu = {
     .name = "cpu",
     .version_id = 1,
     .minimum_version_id = 1,
+    .post_load = cpu_post_load,
     .fields = (VMStateField[]) {
         VMSTATE_UINTTL_ARRAY(env.gpr, RISCVCPU, 32),
         VMSTATE_UINT64_ARRAY(env.fpr, RISCVCPU, 32),
@@ -514,6 +522,9 @@ static const VMStateDescription vmstate_riscv_cpu = {
         VMSTATE_UINTTL(env.sbadaddr, RISCVCPU),
         VMSTATE_UINTTL(env.mip, RISCVCPU),
         VMSTATE_UINTTL(env.satp, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_time, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_compare, RISCVCPU),
+        VMSTATE_UINT64(env.kvm_timer_state, RISCVCPU),
         VMSTATE_END_OF_LIST()
     }
 };
-- 
2.19.1



