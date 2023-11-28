From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 28 Nov 2023 20:26:25 +0530
Subject: [kvmtool PATCH 07/10] riscv: Add Smstateen extension support
In-Reply-To: <20231128145628.413414-1-apatel@ventanamicro.com>
References: <20231128145628.413414-1-apatel@ventanamicro.com>
Message-ID: <20231128145628.413414-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Smstateen extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index a4d54eb..0fe0f0b 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -16,6 +16,7 @@ struct isa_ext_info {
 
 struct isa_ext_info isa_info_arr[] = {
 	/* sorted alphabetically */
+	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
 	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index c524771..49eb3e6 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -25,6 +25,9 @@ struct kvm_config_arch {
 	OPT_U64('\0', "custom-mimpid",					\
 		&(cfg)->custom_mimpid,					\
 		"Show custom mimpid to Guest VCPU"),			\
+	OPT_BOOLEAN('\0', "disable-smstateen",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SMSTATEEN],	\
+		    "Disable Smstateen Extension"),			\
 	OPT_BOOLEAN('\0', "disable-ssaia",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSAIA],	\
 		    "Disable Ssaia Extension"),				\
-- 
2.34.1


