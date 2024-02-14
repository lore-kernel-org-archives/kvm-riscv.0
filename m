From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:37 +0530
Subject: [kvmtool PATCH 06/10] riscv: Add Zfh[min] extensions support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zfh[min] extensions are available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 2 ++
 riscv/include/kvm/kvm-config-arch.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 44058dc..7687624 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -29,6 +29,8 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
 	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
+	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
+	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
 	{"zicbom", KVM_RISCV_ISA_EXT_ZICBOM},
 	{"zicboz", KVM_RISCV_ISA_EXT_ZICBOZ},
 	{"zicntr", KVM_RISCV_ISA_EXT_ZICNTR},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index ae648ce..f1ac56b 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -64,6 +64,12 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zbs",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
 		    "Disable Zbs Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zfh",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFH],	\
+		    "Disable Zfh Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zfhmin",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFHMIN],	\
+		    "Disable Zfhmin Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zicbom",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZICBOM],	\
 		    "Disable Zicbom Extension"),			\
-- 
2.34.1


