From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:35 +0530
Subject: [kvmtool PATCH 04/10] riscv: Add scalar crypto extensions support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-5-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the scalar extensions are available expose them to the guest
via device tree so that guest can use it. This includes extensions
Zbkb, Zbkc, Zbkx, Zknd, Zkne, Zknh, Zkr, Zksed, Zksh, and Zkt.

The Zkr extension requires SEED CSR emulation in user space so
we also add related KVM_EXIT_RISCV_CSR handling.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 10 ++++++++++
 riscv/include/kvm/csr.h             | 15 ++++++++++++++
 riscv/include/kvm/kvm-config-arch.h | 30 ++++++++++++++++++++++++++++
 riscv/kvm-cpu.c                     | 31 +++++++++++++++++++++++++++++
 4 files changed, 86 insertions(+)
 create mode 100644 riscv/include/kvm/csr.h

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 84b6087..be87e9a 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -25,6 +25,9 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
 	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
 	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
+	{"zbkb", KVM_RISCV_ISA_EXT_ZBKB},
+	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
+	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
@@ -34,6 +37,13 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
+	{"zknd", KVM_RISCV_ISA_EXT_ZKND},
+	{"zkne", KVM_RISCV_ISA_EXT_ZKNE},
+	{"zknh", KVM_RISCV_ISA_EXT_ZKNH},
+	{"zkr", KVM_RISCV_ISA_EXT_ZKR},
+	{"zksed", KVM_RISCV_ISA_EXT_ZKSED},
+	{"zksh", KVM_RISCV_ISA_EXT_ZKSH},
+	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
diff --git a/riscv/include/kvm/csr.h b/riscv/include/kvm/csr.h
new file mode 100644
index 0000000..2d27f74
--- /dev/null
+++ b/riscv/include/kvm/csr.h
@@ -0,0 +1,15 @@
+#ifndef KVM__KVM_CSR_H
+#define KVM__KVM_CSR_H
+
+#include <linux/const.h>
+
+/* Scalar Crypto Extension - Entropy */
+#define CSR_SEED		0x015
+#define SEED_OPST_MASK		_AC(0xC0000000, UL)
+#define SEED_OPST_BIST		_AC(0x00000000, UL)
+#define SEED_OPST_WAIT		_AC(0x40000000, UL)
+#define SEED_OPST_ES16		_AC(0x80000000, UL)
+#define SEED_OPST_DEAD		_AC(0xC0000000, UL)
+#define SEED_ENTROPY_MASK	_AC(0xFFFF, UL)
+
+#endif /* KVM__KVM_CSR_H */
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 6d09eee..3764d7c 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -52,6 +52,15 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zbc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBC],	\
 		    "Disable Zbc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zbkb",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBKB],	\
+		    "Disable Zbkb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zbkc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBKC],	\
+		    "Disable Zbkc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zbkx",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBKX],	\
+		    "Disable Zbkx Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zbs",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
 		    "Disable Zbs Extension"),				\
@@ -79,6 +88,27 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zihpm",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHPM],	\
 		    "Disable Zihpm Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zknd",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKND],	\
+		    "Disable Zknd Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zkne",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKNE],	\
+		    "Disable Zkne Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zknh",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKNH],	\
+		    "Disable Zknh Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zkr",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKR],	\
+		    "Disable Zkr Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zksed",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKSED],	\
+		    "Disable Zksed Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zksh",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKSH],	\
+		    "Disable Zksh Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zkt",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKT],	\
+		    "Disable Zkt Extension"),				\
 	OPT_BOOLEAN('\0', "disable-sbi-legacy",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_V01],	\
 		    "Disable SBI Legacy Extensions"),			\
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index c4e83c4..3e17c12 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -1,3 +1,4 @@
+#include "kvm/csr.h"
 #include "kvm/kvm-cpu.h"
 #include "kvm/kvm.h"
 #include "kvm/virtio.h"
@@ -222,11 +223,41 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 	return ret;
 }
 
+static bool kvm_cpu_riscv_csr(struct kvm_cpu *vcpu)
+{
+	int dfd = kvm_cpu__get_debug_fd();
+	bool ret = true;
+
+	switch (vcpu->kvm_run->riscv_csr.csr_num) {
+	case CSR_SEED:
+		/*
+		 * We ignore the new_value and write_mask and simply
+		 * return a random value as SEED.
+		 */
+		vcpu->kvm_run->riscv_csr.ret_value = rand() & SEED_ENTROPY_MASK;
+		break;
+	default:
+		dprintf(dfd, "Unhandled CSR access\n");
+		dprintf(dfd, "csr_num=0x%lx new_value=0x%lx\n",
+			vcpu->kvm_run->riscv_csr.csr_num,
+			vcpu->kvm_run->riscv_csr.new_value);
+		dprintf(dfd, "write_mask=0x%lx ret_value=0x%lx\n",
+			vcpu->kvm_run->riscv_csr.write_mask,
+			vcpu->kvm_run->riscv_csr.ret_value);
+		ret = false;
+		break;
+	};
+
+	return ret;
+}
+
 bool kvm_cpu__handle_exit(struct kvm_cpu *vcpu)
 {
 	switch (vcpu->kvm_run->exit_reason) {
 	case KVM_EXIT_RISCV_SBI:
 		return kvm_cpu_riscv_sbi(vcpu);
+	case KVM_EXIT_RISCV_CSR:
+		return kvm_cpu_riscv_csr(vcpu);
 	default:
 		break;
 	};
-- 
2.34.1


