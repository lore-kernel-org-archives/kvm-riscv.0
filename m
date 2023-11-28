From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:26 +0530
Subject: [kvmtool PATCH 08/10] riscv: Add Zicond extension support
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-9-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zicond extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 0fe0f0b..1124fa1 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -28,6 +28,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
 	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
+	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
 	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
 	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 49eb3e6..48d0770 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -61,6 +61,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zicntr",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICNTR],	\
 		    "Disable Zicntr Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zicond",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICOND],	\
+		    "Disable Zicond Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zicsr",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICSR],	\
 		    "Disable Zicsr Extension"),				\
-- 
2.34.1


