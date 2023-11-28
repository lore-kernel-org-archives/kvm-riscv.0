From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:28 +0530
Subject: [kvmtool PATCH 10/10] riscv: Handle SBI DBCN calls from Guest/VM
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-11-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The new SBI DBCN functions are forwarded by in-kernel KVM RISC-V module
to user-space so let us handle these calls in kvm_cpu_riscv_sbi() function.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h |  5 ++-
 riscv/include/kvm/sbi.h             | 14 ++++++-
 riscv/kvm-cpu.c                     | 57 +++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 3 deletions(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 48d0770..d2fc2d4 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -102,6 +102,9 @@ struct kvm_config_arch {
 		    "Disable SBI Experimental Extensions"),		\
 	OPT_BOOLEAN('\0', "disable-sbi-vendor",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_VENDOR],	\
-		    "Disable SBI Vendor Extensions"),
+		    "Disable SBI Vendor Extensions"),			\
+	OPT_BOOLEAN('\0', "disable-sbi-dbcn",				\
+		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_DBCN],	\
+		    "Disable SBI DBCN Extension"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
diff --git a/riscv/include/kvm/sbi.h b/riscv/include/kvm/sbi.h
index f4b4182..a0f2c70 100644
--- a/riscv/include/kvm/sbi.h
+++ b/riscv/include/kvm/sbi.h
@@ -20,6 +20,7 @@ enum sbi_ext_id {
 	SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
 	SBI_EXT_0_1_SHUTDOWN = 0x8,
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_DBCN = 0x4442434E,
 };
 
 enum sbi_ext_base_fid {
@@ -32,6 +33,12 @@ enum sbi_ext_base_fid {
 	SBI_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_dbcn_fid {
+	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
+	SBI_EXT_DBCN_CONSOLE_READ = 1,
+	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_OFFSET	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
@@ -41,8 +48,11 @@ enum sbi_ext_base_fid {
 #define SBI_SUCCESS		0
 #define SBI_ERR_FAILURE		-1
 #define SBI_ERR_NOT_SUPPORTED	-2
-#define SBI_ERR_INVALID_PARAM   -3
+#define SBI_ERR_INVALID_PARAM	-3
 #define SBI_ERR_DENIED		-4
-#define SBI_ERR_INVALID_ADDRESS -5
+#define SBI_ERR_INVALID_ADDRESS	-5
+#define SBI_ERR_ALREADY_AVAILABLE -6
+#define SBI_ERR_ALREADY_STARTED -7
+#define SBI_ERR_ALREADY_STOPPED -8
 
 #endif
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index 540baec..c4e83c4 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -105,6 +105,17 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 			die("KVM_SET_ONE_REG failed (sbi_ext %d)", i);
 	}
 
+	/* Force enable SBI debug console if not disabled from command line */
+	if (!kvm->cfg.arch.sbi_ext_disabled[KVM_RISCV_SBI_EXT_DBCN]) {
+		id = 1;
+		reg.id = RISCV_SBI_EXT_REG(KVM_REG_RISCV_SBI_SINGLE,
+					   KVM_RISCV_SBI_EXT_DBCN);
+		reg.addr = (unsigned long)&id;
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			pr_warning("KVM_SET_ONE_REG failed (sbi_ext %d)",
+				   KVM_RISCV_SBI_EXT_DBCN);
+	}
+
 	/* Populate the vcpu structure. */
 	vcpu->kvm		= kvm;
 	vcpu->cpu_id		= cpu_id;
@@ -128,7 +139,9 @@ void kvm_cpu__delete(struct kvm_cpu *vcpu)
 static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 {
 	char ch;
+	u64 addr;
 	bool ret = true;
+	char *str_start, *str_end;
 	int dfd = kvm_cpu__get_debug_fd();
 
 	switch (vcpu->kvm_run->riscv_sbi.extension_id) {
@@ -144,6 +157,50 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 		else
 			vcpu->kvm_run->riscv_sbi.ret[0] = SBI_ERR_FAILURE;
 		break;
+	case SBI_EXT_DBCN:
+		switch (vcpu->kvm_run->riscv_sbi.function_id) {
+		case SBI_EXT_DBCN_CONSOLE_WRITE:
+		case SBI_EXT_DBCN_CONSOLE_READ:
+			addr = vcpu->kvm_run->riscv_sbi.args[1];
+#if __riscv_xlen == 32
+			addr |= (u64)vcpu->kvm_run->riscv_sbi.args[2] << 32;
+#endif
+			if (!vcpu->kvm_run->riscv_sbi.args[0])
+				break;
+			str_start = guest_flat_to_host(vcpu->kvm, addr);
+			addr += vcpu->kvm_run->riscv_sbi.args[0] - 1;
+			str_end = guest_flat_to_host(vcpu->kvm, addr);
+			if (!str_start || !str_end) {
+				vcpu->kvm_run->riscv_sbi.ret[0] =
+						SBI_ERR_INVALID_PARAM;
+				break;
+			}
+			vcpu->kvm_run->riscv_sbi.ret[1] = 0;
+			while (str_start <= str_end) {
+				if (vcpu->kvm_run->riscv_sbi.function_id ==
+				    SBI_EXT_DBCN_CONSOLE_WRITE) {
+					term_putc(str_start, 1, 0);
+				} else {
+					if (!term_readable(0))
+						break;
+					*str_start = term_getc(vcpu->kvm, 0);
+				}
+				vcpu->kvm_run->riscv_sbi.ret[1]++;
+				str_start++;
+			}
+			break;
+		case SBI_EXT_DBCN_CONSOLE_WRITE_BYTE:
+			ch = vcpu->kvm_run->riscv_sbi.args[0];
+			term_putc(&ch, 1, 0);
+			vcpu->kvm_run->riscv_sbi.ret[0] = 0;
+			vcpu->kvm_run->riscv_sbi.ret[1] = 0;
+			break;
+		default:
+			vcpu->kvm_run->riscv_sbi.ret[0] =
+						SBI_ERR_NOT_SUPPORTED;
+			break;
+		}
+		break;
 	default:
 		dprintf(dfd, "Unhandled SBI call\n");
 		dprintf(dfd, "extension_id=0x%lx function_id=0x%lx\n",
-- 
2.34.1


