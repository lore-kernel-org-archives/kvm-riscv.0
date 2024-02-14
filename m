From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:39 +0530
Subject: [kvmtool PATCH 08/10] riscv: Add Zvfh[min] extensions support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-9-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zvfh[min] extensions are available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 2 ++
 riscv/include/kvm/kvm-config-arch.h | 6 ++++++
 2 files changed, 8 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 80e045d..005301e 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -49,6 +49,8 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
 	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB},
 	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC},
+	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH},
+	{"zvfhmin", KVM_RISCV_ISA_EXT_ZVFHMIN},
 	{"zvkb", KVM_RISCV_ISA_EXT_ZVKB},
 	{"zvkg", KVM_RISCV_ISA_EXT_ZVKG},
 	{"zvkned", KVM_RISCV_ISA_EXT_ZVKNED},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 2935c01..10ca3b8 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -124,6 +124,12 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zvbc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVBC],	\
 		    "Disable Zvbc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvfh",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVFH],	\
+		    "Disable Zvfh Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zvfhmin",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVFHMIN],	\
+		    "Disable Zvfhmin Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zvkb",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVKB],	\
 		    "Disable Zvkb Extension"),				\
-- 
2.34.1


