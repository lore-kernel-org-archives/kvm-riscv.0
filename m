From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 10 May 2023 14:07:46 +0530
Subject: [PATCH kvmtool 6/8] riscv: Add Zicboz extension support
In-Reply-To: <20230510083748.1056704-1-apatel@ventanamicro.com>
References: <20230510083748.1056704-1-apatel@ventanamicro.com>
Message-ID: <20230510083748.1056704-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Andrew Jones <ajones@ventanamicro.com>

When the Zicboz extension is available expose it to the guest.
Also provide the guest the size of the cache block through DT.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 12 +++++++++++-
 riscv/include/kvm/kvm-config-arch.h |  3 +++
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 17d6757..a76dc37 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -21,6 +21,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
+	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 };
 
@@ -47,7 +48,7 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 	int cpu, pos, i, index, valid_isa_len;
 	const char *valid_isa_order = "IEMAFDQCLBJTPVNSUHKORWXYZG";
 	int arr_sz = ARRAY_SIZE(isa_info_arr);
-	unsigned long cbom_blksz = 0;
+	unsigned long cbom_blksz = 0, cboz_blksz = 0;
 
 	_FDT(fdt_begin_node(fdt, "cpus"));
 	_FDT(fdt_property_cell(fdt, "#address-cells", 0x1));
@@ -97,6 +98,13 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 					die("KVM_GET_ONE_REG failed (config.zicbom_block_size)");
 			}
 
+			if (isa_info_arr[i].ext_id == KVM_RISCV_ISA_EXT_ZICBOZ && !cboz_blksz) {
+				reg.id = RISCV_CONFIG_REG(zicboz_block_size);
+				reg.addr = (unsigned long)&cboz_blksz;
+				if (ioctl(vcpu->vcpu_fd, KVM_GET_ONE_REG, &reg) < 0)
+					die("KVM_GET_ONE_REG failed (config.zicboz_block_size)");
+			}
+
 			if ((strlen(isa_info_arr[i].name) + pos + 1) >= CPU_ISA_MAX_LEN) {
 				pr_warning("Insufficient space to append ISA exension\n");
 				break;
@@ -118,6 +126,8 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 		_FDT(fdt_property_string(fdt, "riscv,isa", cpu_isa));
 		if (cbom_blksz)
 			_FDT(fdt_property_cell(fdt, "riscv,cbom-block-size", cbom_blksz));
+		if (cboz_blksz)
+			_FDT(fdt_property_cell(fdt, "riscv,cboz-block-size", cboz_blksz));
 		_FDT(fdt_property_cell(fdt, "reg", cpu));
 		_FDT(fdt_property_string(fdt, "status", "okay"));
 
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 8448b1a..b12605d 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -40,6 +40,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicbom",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOM],	\
 		    "Disable Zicbom Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zicboz",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOZ],	\
+		    "Disable Zicboz Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zihintpause",			\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
 		    "Disable Zihintpause Extension"),			\
-- 
2.34.1


