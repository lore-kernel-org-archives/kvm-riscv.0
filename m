From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 15 Aug 2022 15:43:22 +0530
Subject: [PATCH kvmtool 2/5] riscv: Append ISA extensions to the device tree
In-Reply-To: <20220815101325.477694-1-apatel@ventanamicro.com>
References: <20220815101325.477694-1-apatel@ventanamicro.com>
Message-ID: <20220815101325.477694-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atishp@rivosinc.com>

The riscv,isa DT property only contains single letter base extensions
until now. However, there are also multi-letter extensions which were
ratified recently. Add a mechanism to append those extension details
to the device tree so that guest can leverage those.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                      | 30 ++++++++++++++++++++++++++++++
 riscv/include/kvm/kvm-cpu-arch.h | 11 +++++++++++
 riscv/kvm-cpu.c                  | 11 -----------
 3 files changed, 41 insertions(+), 11 deletions(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index de15bfe..1818cf7 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -9,6 +9,16 @@
 #include <linux/kernel.h>
 #include <linux/sizes.h>
 
+#define RISCV_ISA_EXT_REG(id)	__kvm_reg_id(KVM_REG_RISCV_ISA_EXT, \
+					     id, KVM_REG_SIZE_ULONG)
+struct isa_ext_info {
+	const char *name;
+	unsigned long ext_id;
+};
+
+struct isa_ext_info isa_info_arr[] = {
+};
+
 static void dump_fdt(const char *dtb_file, void *fdt)
 {
 	int count, fd;
@@ -31,6 +41,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 {
 	int cpu, pos, i, index, valid_isa_len;
 	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
+	int arr_sz = ARRAY_SIZE(isa_info_arr);
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -42,6 +53,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 		char cpu_name[CPU_NAME_MAX_LEN];
 		char cpu_isa[CPU_ISA_MAX_LEN];
 		struct kvm_cpu *vcpu = kvm->cpus[cpu];
+		struct kvm_one_reg reg;
+		unsigned long isa_ext_out = 0;
 
 		snprintf(cpu_name, CPU_NAME_MAX_LEN, "cpu@%x", cpu);
 
@@ -53,6 +66,23 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 			if (vcpu->riscv_isa & (1 << (index)))
 				cpu_isa[pos++] = 'a' + index;
 		}
+
+		for (i = 0; i < arr_sz; i++) {
+			reg.id = RISCV_ISA_EXT_REG(isa_info_arr[i].ext_id);
+			reg.addr = (unsigned long)&isa_ext_out;
+			if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
+				continue;
+			if (!isa_ext_out)
+				/* This extension is not available in hardware */
+				continue;
+
+			if ((strlen(isa_info_arr[i].name) + pos + 1) >= CPU_ISA_MAX_LEN) {
+				pr_warning("Insufficient space to append ISA exension\n");
+				break;
+			}
+			pos += snprintf(cpu_isa + pos, CPU_ISA_MAX_LEN, "_%s",
+					isa_info_arr[i].name);
+		}
 		cpu_isa[pos] = '\0';
 
 		_FDT(fdt_begin_node(fdt, cpu_name));
diff --git a/riscv/include/kvm/kvm-cpu-arch.h b/riscv/include/kvm/kvm-cpu-arch.h
index 78fcd01..4b3e602 100644
--- a/riscv/include/kvm/kvm-cpu-arch.h
+++ b/riscv/include/kvm/kvm-cpu-arch.h
@@ -7,6 +7,17 @@
 
 #include "kvm/kvm.h"
 
+static inline __u64 __kvm_reg_id(__u64 type, __u64 idx, __u64  size)
+{
+	return KVM_REG_RISCV | type | idx | size;
+}
+
+#if __riscv_xlen == 64
+#define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U64
+#else
+#define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
+#endif
+
 struct kvm_cpu {
 	pthread_t	thread;
 
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index df90c7b..a17b957 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -18,17 +18,6 @@ int kvm_cpu__get_debug_fd(void)
 	return debug_fd;
 }
 
-static __u64 __kvm_reg_id(__u64 type, __u64 idx, __u64  size)
-{
-	return KVM_REG_RISCV | type | idx | size;
-}
-
-#if __riscv_xlen == 64
-#define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U64
-#else
-#define KVM_REG_SIZE_ULONG	KVM_REG_SIZE_U32
-#endif
-
 #define RISCV_CONFIG_REG(name)	__kvm_reg_id(KVM_REG_RISCV_CONFIG, \
 					     KVM_REG_RISCV_CONFIG_REG(name), \
 					     KVM_REG_SIZE_ULONG)
-- 
2.34.1


