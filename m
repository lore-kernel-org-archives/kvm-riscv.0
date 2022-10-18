From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 18 Oct 2022 19:38:54 +0530
Subject: [PATCH kvmtool 6/6] riscv: Add --disable-<xyz> options to allow user disable extensions
In-Reply-To: <20221018140854.69846-1-apatel@ventanamicro.com>
References: <20221018140854.69846-1-apatel@ventanamicro.com>
Message-ID: <20221018140854.69846-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

By default, the KVM RISC-V keeps all extensions available to VCPU
enabled and KVMTOOL does not disable any extension.

We add --disable-<xyz> command-line options in KVMTOOL RISC-V to
allow users explicitly disable certain extension if they don't
desire it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         |  8 ++++++++
 riscv/include/kvm/kvm-config-arch.h | 18 +++++++++++++++++-
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 30d3460..3cdb95c 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -80,6 +80,14 @@ static void generate_cpu_nodes(void *fdt, struct kvm *kvm)
 				/* This extension is not available in hardware */
 				continue;
 
+			if (kvm->cfg.arch.ext_disabled[isa_info_arr[i].ext_id]) {
+				isa_ext_out = 0;
+				if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+					pr_warning("Failed to disable %s ISA exension\n",
+						   isa_info_arr[i].name);
+				continue;
+			}
+
 			if (isa_info_arr[i].ext_id == KVM_RISCV_ISA_EXT_ZICBOM && !cbom_blksz) {
 				reg.id = RISCV_CONFIG_REG(zicbom_block_size);
 				reg.addr = (unsigned long)&cbom_blksz;
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 526fca2..188125c 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -5,11 +5,27 @@
 
 struct kvm_config_arch {
 	const char	*dump_dtb_filename;
+	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
 };
 
 #define OPT_ARCH_RUN(pfx, cfg)						\
 	pfx,								\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
-		   ".dtb file", "Dump generated .dtb to specified file"),
+		   ".dtb file", "Dump generated .dtb to specified file"),\
+	OPT_BOOLEAN('\0', "disable-sstc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
+		    "Disable Sstc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-svinval",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVINVAL],	\
+		    "Disable Svinval Extension"),			\
+	OPT_BOOLEAN('\0', "disable-svpbmt",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
+		    "Disable Svpbmt Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zicbom",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOM],	\
+		    "Disable Zicbom Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zihintpause",			\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
+		    "Disable Zihintpause Extension"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
-- 
2.34.1


