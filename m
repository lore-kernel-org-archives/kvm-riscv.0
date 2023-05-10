From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 10 May 2023 14:07:43 +0530
Subject: [PATCH kvmtool 3/8] riscv: Allow disabling SBI extensions for Guest
In-Reply-To: <20230510083748.1056704-1-apatel@ventanamicro.com>
References: <20230510083748.1056704-1-apatel@ventanamicro.com>
Message-ID: <20230510083748.1056704-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add "--disable-sbi-<xyz>" options to disable various SBI extensions
visible to the Guest. This allows users to disable deprecated/redundant
SBI extensions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h | 30 ++++++++++++++++++++++++++++-
 riscv/include/kvm/kvm-cpu-arch.h    | 19 +++++++++++-------
 riscv/kvm-cpu.c                     | 19 +++++++++++++++++-
 3 files changed, 59 insertions(+), 9 deletions(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e64e3ca..56676e3 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -9,6 +9,7 @@ struct kvm_config_arch {
 	u64		custom_marchid;
 	u64		custom_mimpid;
 	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
+	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
 };
 
 #define OPT_ARCH_RUN(pfx, cfg)						\
@@ -38,6 +39,33 @@ struct kvm_config_arch {
 		    "Disable Zicbom Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zihintpause",			\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
-		    "Disable Zihintpause Extension"),
+		    "Disable Zihintpause Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-legacy",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_V01],	\
+		    "Disable SBI Legacy Extensions"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-time",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_TIME],	\
+		    "Disable SBI Time Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-ipi",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_IPI],	\
+		    "Disable SBI IPI Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-rfence",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_RFENCE],	\
+		    "Disable SBI RFence Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-srst",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_SRST],	\
+		    "Disable SBI SRST Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-hsm",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_HSM],	\
+		    "Disable SBI HSM Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-pmu",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_PMU],	\
+		    "Disable SBI PMU Extension"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-experimental",			\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_EXPERIMENTAL],\
+		    "Disable SBI Experimental Extensions"),		\
+	OPT_BOOLEAN('\0', "disable-sbi-vendor",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_VENDOR],	\
+		    "Disable SBI Vendor Extensions"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
diff --git a/riscv/include/kvm/kvm-cpu-arch.h b/riscv/include/kvm/kvm-cpu-arch.h
index e014839..1e9a7b0 100644
--- a/riscv/include/kvm/kvm-cpu-arch.h
+++ b/riscv/include/kvm/kvm-cpu-arch.h
@@ -7,9 +7,10 @@
 
 #include "kvm/kvm.h"
 
-static inline __u64 __kvm_reg_id(__u64 type, __u64 idx, __u64  size)
+static inline __u64 __kvm_reg_id(__u64 type, __u64 subtype,
+				 __u64 idx, __u64  size)
 {
-	return KVM_REG_RISCV | type | idx | size;
+	return KVM_REG_RISCV | type | subtype | idx | size;
 }
 
 #if __riscv_xlen == 64
@@ -18,25 +19,29 @@ static inline __u64 __kvm_reg_id(__u64 type, __u64 idx, __u64  size)
 #define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
 #endif
 
-#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
+#define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, 0, \
 					     KVM_REG_RISCV_CONFIG_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_ISA_EXT_REG(id)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
+#define RISCV_ISA_EXT_REG(id)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, 0, \
 					     id, KVM_REG_SIZE_ULONG)
 
-#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, \
+#define RISCV_CORE_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CORE, 0, \
 					     KVM_REG_RISCV_CORE_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, \
+#define RISCV_CSR_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CSR, 0, \
 					     KVM_REG_RISCV_CSR_REG(name), \
 					     KVM_REG_SIZE_ULONG)
 
-#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, \
+#define RISCV_TIMER_REG(name)	__kvm_reg_id(KVM_REG_RISCV_TIMER, 0, \
 					     KVM_REG_RISCV_TIMER_REG(name), \
 					     KVM_REG_SIZE_U64)
 
+#define RISCV_SBI_EXT_REG(subtype, id)	\
+				__kvm_reg_id(KVM_REG_RISCV_SBI_EXT, subtype, \
+					     id, KVM_REG_SIZE_ULONG)
+
 struct kvm_cpu {
 	pthread_t	thread;
 
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index 89122b4..540baec 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -23,7 +23,8 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 	struct kvm_cpu *vcpu;
 	u64 timebase = 0;
 	unsigned long isa = 0, id = 0;
-	int coalesced_offset, mmap_size;
+	unsigned long masks[KVM_REG_RISCV_SBI_MULTI_REG_LAST + 1] = { 0 };
+	int i, coalesced_offset, mmap_size;
 	struct kvm_one_reg reg;
 
 	vcpu = calloc(1, sizeof(struct kvm_cpu));
@@ -88,6 +89,22 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 			die("KVM_SET_ONE_REG failed (config.mimpid)");
 	}
 
+	for (i = 0; i < KVM_RISCV_SBI_EXT_MAX; i++) {
+		if (!kvm->cfg.arch.sbi_ext_disabled[i])
+			continue;
+		masks[KVM_REG_RISCV_SBI_MULTI_REG(i)] |=
+					KVM_REG_RISCV_SBI_MULTI_MASK(i);
+	}
+	for (i = 0; i <= KVM_REG_RISCV_SBI_MULTI_REG_LAST; i++) {
+		if (!masks[i])
+			continue;
+
+		reg.id = RISCV_SBI_EXT_REG(KVM_REG_RISCV_SBI_MULTI_DIS, i);
+		reg.addr = (unsigned long)&masks[i];
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			die("KVM_SET_ONE_REG failed (sbi_ext %d)", i);
+	}
+
 	/* Populate the vcpu structure. */
 	vcpu->kvm		= kvm;
 	vcpu->cpu_id		= cpu_id;
-- 
2.34.1


