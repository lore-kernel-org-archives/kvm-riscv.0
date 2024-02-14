From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:34 +0530
Subject: [kvmtool PATCH 03/10] riscv: Add Zbc extension support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zbc extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 8485acf..84b6087 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -24,6 +24,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
 	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
+	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index d2fc2d4..6d09eee 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -49,6 +49,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zbb",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBB],	\
 		    "Disable Zbb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zbc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBC],	\
+		    "Disable Zbc Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zbs",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
 		    "Disable Zbs Extension"),				\
-- 
2.34.1


