From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 14 Feb 2024 17:51:38 +0530
Subject: [kvmtool PATCH 07/10] riscv: Add Zihintntl extension support
In-Reply-To: <20240214122141.305126-1-apatel@ventanamicro.com>
References: <20240214122141.305126-1-apatel@ventanamicro.com>
Message-ID: <20240214122141.305126-8-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zihintntl extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 7687624..80e045d 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -37,6 +37,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zicond", KVM_RISCV_ISA_EXT_ZICOND},
 	{"zicsr", KVM_RISCV_ISA_EXT_ZICSR},
 	{"zifencei", KVM_RISCV_ISA_EXT_ZIFENCEI},
+	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
 	{"zknd", KVM_RISCV_ISA_EXT_ZKND},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index f1ac56b..2935c01 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -88,6 +88,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zifencei",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIFENCEI],	\
 		    "Disable Zifencei Extension"),			\
+	OPT_BOOLEAN('\0', "disable-zihintntl",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTNTL],	\
+		    "Disable Zihintntl Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zihintpause",			\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHINTPAUSE],\
 		    "Disable Zihintpause Extension"),			\
-- 
2.34.1


