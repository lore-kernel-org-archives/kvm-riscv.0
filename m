From: Yifei Jiang <jiangyifei@huawei.com>
Date: Thu, 3 Dec 2020 20:46:57 +0800
Subject: [PATCH RFC v4 09/15] target/riscv: Add host cpu type
In-Reply-To: <20201203124703.168-1-jiangyifei@huawei.com>
References: <20201203124703.168-1-jiangyifei@huawei.com>
Message-ID: <20201203124703.168-10-jiangyifei@huawei.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently, host cpu is inherited simply.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
---
 target/riscv/cpu.c | 6 ++++++
 target/riscv/cpu.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index faee98a58c..439dc89ee7 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -186,6 +186,10 @@ static void rv32_imafcu_nommu_cpu_init(Object *obj)
 
 #endif
 
+static void riscv_host_cpu_init(Object *obj)
+{
+}
+
 static ObjectClass *riscv_cpu_class_by_name(const char *cpu_model)
 {
     ObjectClass *oc;
@@ -641,10 +645,12 @@ static const TypeInfo riscv_cpu_type_infos[] = {
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E31,       rvxx_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E34,       rv32_imafcu_nommu_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U34,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #elif defined(TARGET_RISCV64)
     DEFINE_CPU(TYPE_RISCV_CPU_BASE64,           riscv_base_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_E51,       rvxx_sifive_e_cpu_init),
     DEFINE_CPU(TYPE_RISCV_CPU_SIFIVE_U54,       rvxx_sifive_u_cpu_init),
+    DEFINE_CPU(TYPE_RISCV_CPU_HOST,             riscv_host_cpu_init),
 #endif
 };
 
diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index ad1c90f798..4288898019 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -43,6 +43,7 @@
 #define TYPE_RISCV_CPU_SIFIVE_E51       RISCV_CPU_TYPE_NAME("sifive-e51")
 #define TYPE_RISCV_CPU_SIFIVE_U34       RISCV_CPU_TYPE_NAME("sifive-u34")
 #define TYPE_RISCV_CPU_SIFIVE_U54       RISCV_CPU_TYPE_NAME("sifive-u54")
+#define TYPE_RISCV_CPU_HOST             RISCV_CPU_TYPE_NAME("host")
 
 #define RV32 ((target_ulong)1 << (TARGET_LONG_BITS - 2))
 #define RV64 ((target_ulong)2 << (TARGET_LONG_BITS - 2))
-- 
2.19.1


