From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:36 +0530
Subject: [kvmtool PATCH 05/10] riscv: Add vector crypto extensions support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the vector extensions are available expose them to the guest
via device tree so that guest can use it. This includes extensions
Zvbb, Zvbc, Zvkb, Zvkg, Zvkned, Zvknha, Zvknhb, Zvksed, Zvksh,
and Zvkt.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 10 ++++++++++
 riscv/include/kvm/kvm-config-arch.h | 30 +++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index be87e9a..44058dc 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -44,6 +44,16 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zksed", KVM_RISCV_ISA_EXT_ZKSED},
 	{"zksh", KVM_RISCV_ISA_EXT_ZKSH},
 	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
+	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB},
+	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC},
+	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB},
+	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG},
+	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED},
+	{"zvknha", KVM_RISCV_ISA_EXT_ZVKNHA},
+	{"zvknhb", KVM_RISCV_ISA_EXT_ZVKNHB},
+	{"zvksed", KVM_RISCV_ISA_EXT_ZVKSED},
+	{"zvksh", KVM_RISCV_ISA_EXT_ZVKSH},
+	{"zvkt", KVM_RISCV_ISA_EXT_ZVKT},
 };
 
 static void dump_fdt(const char *dtb_file, void *fdt)
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 3764d7c..ae648ce 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -109,6 +109,36 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zkt",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKT],	\
 		    "Disable Zkt Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvbb",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVBB],	\
+		    "Disable Zvbb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvbc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVBC],	\
+		    "Disable Zvbc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvkb",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKB],	\
+		    "Disable Zvkb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvkg",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKG],	\
+		    "Disable Zvkg Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvkned",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKNED],	\
+		    "Disable Zvkned Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zvknha",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKNHA],	\
+		    "Disable Zvknha Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zvknhb",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKNHB],	\
+		    "Disable Zvknhb Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zvksed",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKSED],	\
+		    "Disable Zvksed Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zvksh",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKSH],	\
+		    "Disable Zvksh Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvkt",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKT],	\
+		    "Disable Zvkt Extension"),				\
 	OPT_BOOLEAN('\0', "disable-sbi-legacy",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_V01],	\
 		    "Disable SBI Legacy Extensions"),			\
-- 
2.34.1


