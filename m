From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:24 +0530
Subject: [kvmtool PATCH 06/10] riscv: Add Zicsr and Zifencei extension support
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zicsr and Zifencei extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 2 ++
 riscv/include/kvm/kvm-config-arch.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 19786af..a4d54eb 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -27,6 +27,8 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
 	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
+	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
+	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
 };
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index af5c4b8..c524771 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -58,6 +58,12 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicntr",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICNTR],	\
 		    "Disable Zicntr Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zicsr",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICSR],	\
+		    "Disable Zicsr Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zifencei",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIFENCEI],	\
+		    "Disable Zifencei Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zihintpause",			\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
 		    "Disable Zihintpause Extension"),			\
-- 
2.34.1


