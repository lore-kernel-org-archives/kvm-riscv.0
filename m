From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 22:05:00 +0530
Subject: [kvmtool PATCH v4 8/9] riscv: Add Ssaia extension support
In-Reply-To: <20230712163501.1769737-1-apatel@ventanamicro.com>
References: <20230712163501.1769737-1-apatel@ventanamicro.com>
Message-ID: <20230712163501.1769737-9-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Ssaia extension is available expose it to the guest.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index a76dc37..df71ed4 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -16,6 +16,7 @@ struct isa_ext_info {
 
 struct isa_ext_info isa_info_arr[] = {
 	/* sorted alphabetically */
+	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index b12605d..b0a7e25 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -25,6 +25,9 @@ struct kvm_config_arch {
 	OPT_U64('\0', "custom-mimpid",					\
 		&(cfg)->custom_mimpid,					\
 		"Show custom mimpid to Guest VCPU"),			\
+	OPT_BOOLEAN('\0', "disable-ssaia",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSAIA],	\
+		    "Disable Ssaia Extension"),				\
 	OPT_BOOLEAN('\0', "disable-sstc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
 		    "Disable Sstc Extension"),				\
-- 
2.34.1


