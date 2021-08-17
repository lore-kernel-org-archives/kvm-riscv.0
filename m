From: Yifei Jiang <jiangyifei@huawei.com>
Date: Tue, 17 Aug 2021 11:24:44 +0800
Subject: [PATCH RFC v6 09/12] target/riscv: Add host cpu type
In-Reply-To: <20210817032447.2055-1-jiangyifei@huawei.com>
References: <20210817032447.2055-1-jiangyifei@huawei.com>
Message-ID: <20210817032447.2055-10-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

'host' type cpu is set isa to RV32 or RV64 simply, more isa info
will obtain from KVM in kvm_arch_init_vcpu()

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.c | 15 +++++++++++++++
 target/riscv/cpu.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 2251784f7b..976e71c4c7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -260,6 +260,18 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 }
 #endif
 
+#if defined(CONFIG_KVM)
+static void riscv_host_cpu_init(Object *obj)
+{
+    CPURISCVState *env = &RISCV_CPU(obj)->env;
+#if defined(TARGET_RISCV32)
+    set_misa(env, RV32);
+#elif defined(TARGET_RISCV64)
+    set_misa(env, RV64);
+#endif
+}
+#endif
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -792,6 +804,9 @@ static const TypeInfo riscv_cpu_type_infos[] = {
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
index 3d3bdc2816..720cb688bb 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -44,6 +44,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #if defined(TARGET_RISCV32)
 # define TYPE_RISCV_CPU_BASE            TYPE_RISCV_CPU_BASE32
-- 
2.19.1


