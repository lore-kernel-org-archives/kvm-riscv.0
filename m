From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 14 May 2024 11:19:27 +0530
Subject: [kvmtool PATCH 2/3] riscv: Add Ztso extensiona support
In-Reply-To: <20240514054928.854419-1-apatel@ventanamicro.com>
References: <20240514054928.854419-1-apatel@ventanamicro.com>
Message-ID: <20240514054928.854419-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Ztso extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index cc8070d..418b668 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -48,6 +48,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zksed", KVM_RISCV_ISA_EXT_ZKSED},
 	{"zksh", KVM_RISCV_ISA_EXT_ZKSH},
 	{"zkt", KVM_RISCV_ISA_EXT_ZKT},
+	{"ztso", KVM_RISCV_ISA_EXT_ZTSO},
 	{"zvbb", KVM_RISCV_ISA_EXT_ZVBB},
 	{"zvbc", KVM_RISCV_ISA_EXT_ZVBC},
 	{"zvfh", KVM_RISCV_ISA_EXT_ZVFH},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e562d71..7cfbf30 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -121,6 +121,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zkt",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKT],	\
 		    "Disable Zkt Extension"),				\
+	OPT_BOOLEAN('\0', "disable-ztso",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZTSO],	\
+		    "Disable Ztso Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zvbb",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZVBB],	\
 		    "Disable Zvbb Extension"),				\
-- 
2.34.1


