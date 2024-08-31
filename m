From: Anup Patel <apatel@ventanamicro.com>
Date: Sat, 31 Aug 2024 16:57:41 +0530
Subject: [kvmtool PATCH 6/8] riscv: Add Zcf extension support
In-Reply-To: <20240831112743.379709-1-apatel@ventanamicro.com>
References: <20240831112743.379709-1-apatel@ventanamicro.com>
Message-ID: <20240831112743.379709-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zcf extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 5587343..7d8a39d 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -35,6 +35,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zca", KVM_RISCV_ISA_EXT_ZCA},
 	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
 	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
+	{"zcf", KVM_RISCV_ISA_EXT_ZCF},
 	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
 	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 155faa6..09ab59d 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -82,6 +82,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zcd",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCD],	\
 		    "Disable Zcd Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcf",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCF],	\
+		    "Disable Zcf Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zfa",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFA],	\
 		    "Disable Zfa Extension"),				\
-- 
2.43.0


