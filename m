From: Yifei Jiang <jiangyifei@huawei.com>
Date: Mon, 12 Apr 2021 14:52:43 +0800
Subject: [PATCH RFC v5 09/12] target/riscv: Add host cpu type
In-Reply-To: <20210412065246.1853-1-jiangyifei@huawei.com>
References: <20210412065246.1853-1-jiangyifei@huawei.com>
Message-ID: <20210412065246.1853-10-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

'host' type cpu is set isa to RVXLEN simply, more isa info
will obtain from KVM in kvm_arch_init_vcpu()

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c | 9 +++++++++
 target/riscv/cpu.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index dd34ab4978..8132d35a92 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -216,6 +216,12 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
 
+static void riscv_host_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+    set_misa(env, RVXLEN);
+}
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -706,6 +712,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
         .class_init = riscv_cpu_class_init,
     },
     DEFINE_CPU(TYPE_RISCV_CPU_ANY,              riscv_any_cpu_init),
+#if defined(CONFIG_KVM)
+    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
+#endif
 #if defined(TARGET_RISCV32)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE32,           rv32_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_IBEX,             rv32_ibex_cpu_init),
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index a489d94187..3ca3dad341 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -43,6 +43,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-- 
2.19.1


