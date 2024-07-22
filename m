From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 22 Jul 2024 17:37:10 +0530
Subject: [PATCH 2/2] riscv: Add Sscofpmf extensiona support
In-Reply-To: <20240722120710.417705-1-apatel@ventanamicro.com>
References: <20240722120710.417705-1-apatel@ventanamicro.com>
Message-ID: <20240722120710.417705-3-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atishp@rivosinc.com>

When the Sscofpmf extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index cf367b9..e331f80 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -18,6 +18,7 @@ struct isa_ext_info isa_info_arr[] = {
 	/* sorted alphabetically */
 	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
 	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
+	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 17f0ceb..3fbc4f7 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -31,6 +31,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-ssaia",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSAIA],	\
 		    "Disable Ssaia Extension"),				\
+	OPT_BOOLEAN('\0', "disable-sscofpmf",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSCOFPMF],	\
+		    "Disable Sscofpmf Extension"),			\
 	OPT_BOOLEAN('\0', "disable-sstc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
 		    "Disable Sstc Extension"),				\
-- 
2.34.1


