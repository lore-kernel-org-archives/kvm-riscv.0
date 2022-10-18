From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Oct 2022 19:38:53 +0530
Subject: [PATCH kvmtool 5/6] riscv: Add Zicbom extension support
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <20221018140854.69846-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

When the Zicbom extension is available expose it to the guest.
Also provide the guest the size of the cache block through DT.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 8d6da11..30d3460 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -19,6 +19,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
+	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
@@ -44,6 +45,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 	int cpu, pos, i, index, valid_isa_len;
 	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 	int arr_sz = ARRAY_SIZE(isa_info_arr);
+	unsigned long cbom_blksz = 0;
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -78,6 +80,13 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 				/* This extension is not available in hardware */
 				continue;
 
+			if (isa_info_arr[i].ext_id == KVM_RISCV_ISA_EXT_ZICBOM && !cbom_blksz) {
+				reg.id = RISCV_CONFIG_REG(zicbom_block_size);
+				reg.addr = (unsigned long)&cbom_blksz;
+				if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
+					die("KVM_GET_ONE_REG failed (config.zicbom_block_size)");
+			}
+
 			if ((strlen(isa_info_arr[i].name) + pos + 1) >= CPU_ISA_MAX_LEN) {
 				pr_warning("Insufficient space to append ISA exension\n");
 				break;
@@ -97,6 +106,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 			_FDT(fdt_property_string(fdt, "mmu-type",
 						 "riscv,sv32"));
 		_FDT(fdt_property_string(fdt, "riscv,isa", cpu_isa));
+		if (cbom_blksz)
+			_FDT(fdt_property_cell(fdt, "riscv,cbom-block-size", cbom_blksz));
 		_FDT(fdt_property_cell(fdt, "reg", cpu));
 		_FDT(fdt_property_string(fdt, "status", "okay"));
 
-- 
2.34.1


