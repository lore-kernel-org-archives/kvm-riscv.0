From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  5 Oct 2024 13:30:23 +0530
Subject: [kvmtool PATCH v2 7/8] riscv: Add Zcmop extension support
In-Reply-To: <20241005080024.11927-1-apatel@ventanamicro.com>
References: <20241005080024.11927-1-apatel@ventanamicro.com>
Message-ID: <20241005080024.11927-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zcmop extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 7d8a39d..768ee1f 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -36,6 +36,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
 	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
 	{"zcf", KVM_RISCV_ISA_EXT_ZCF},
+	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP},
 	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
 	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 09ab59d..5d655cf 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -85,6 +85,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zcf",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCF],	\
 		    "Disable Zcf Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcmop",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCMOP],	\
+		    "Disable Zcmop Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zfa",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFA],	\
 		    "Disable Zfa Extension"),				\
-- 
2.43.0


