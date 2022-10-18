From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Oct 2022 19:38:52 +0530
Subject: [PATCH kvmtool 4/6] riscv: Move reg encoding helpers to kvm-cpu-arch.h
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <20221018140854.69846-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

We'll need one of these helpers in the next patch in another file.
Let's proactively move them all now, since others may some day also
be useful.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c                      |  2 --
 riscv/include/kvm/kvm-cpu-arch.h | 19 +++++++++++++++++++
 riscv/kvm-cpu.c                  | 16 ----------------
 3 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index ef0bc47..8d6da11 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -9,8 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/sizes.h>
 
-#define RISCV_ISA_EXT_REG(id)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
-					     id, KVM_REG_SIZE_ULONG)
 struct isa_ext_info {
 	const char *name;
 	unsigned long ext_id;
diff --git a/riscv/include/kvm/kvm-cpu-arch.h b/riscv/include/kvm/kvm-cpu-arch.h
index 4b3e602..e014839 100644
--- a/riscv/include/kvm/kvm-cpu-arch.h
+++ b/riscv/include/kvm/kvm-cpu-arch.h
@@ -18,6 +18,25 @@ static inline __u64 __kvm_reg_id(__u64 type, __u64 idx, __u64  size)
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
+#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
+					     KVM_REG_RISCV_CONFIG_REG(name), \
+					     KVM_REG_SIZE_ULONG)
+
+#define RISCV_ISA_EXT_REG(id)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
+					     id, KVM_REG_SIZE_ULONG)
+
+#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
+					     KVM_REG_RISCV_CORE_REG(name), \
+					     KVM_REG_SIZE_ULONG)
+
+#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
+					     KVM_REG_RISCV_CSR_REG(name), \
+					     KVM_REG_SIZE_ULONG)
+
+#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
+					     KVM_REG_RISCV_TIMER_REG(name), \
+					     KVM_REG_SIZE_U64)
+
 struct kvm_cpu {
 	pthread_t	thread;
 
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index a17b957..f98bd7a 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -18,22 +18,6 @@ int kvm_cpu__get_debug_fd(void)
 	return debug_fd;
 }
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
-					     KVM_REG_RISCV_CONFIG_REG(name), \
-					     KVM_REG_SIZE_ULONG)
-
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
-					     KVM_REG_RISCV_CORE_REG(name), \
-					     KVM_REG_SIZE_ULONG)
-
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
-					     KVM_REG_RISCV_CSR_REG(name), \
-					     KVM_REG_SIZE_ULONG)
-
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
-					     KVM_REG_RISCV_TIMER_REG(name), \
-					     KVM_REG_SIZE_U64)
-
 struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 {
 	struct kvm_cpu *vcpu;
-- 
2.34.1


