From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  5 Oct 2024 13:30:24 +0530
Subject: [kvmtool PATCH v2 8/8] riscv: Add Zimop extension support
In-Reply-To: <20241005080024.11927-1-apatel@ventanamicro.com>
References: <20241005080024.11927-1-apatel@ventanamicro.com>
Message-ID: <20241005080024.11927-9-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zimop extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 768ee1f..8189601 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -49,6 +49,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zihintntl", KVM_RISCV_ISA_EXT_ZIHINTNTL},
 	{"zihintpause", KVM_RISCV_ISA_EXT_ZIHINTPAUSE},
 	{"zihpm", KVM_RISCV_ISA_EXT_ZIHPM},
+	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP},
 	{"zknd", KVM_RISCV_ISA_EXT_ZKND},
 	{"zkne", KVM_RISCV_ISA_EXT_ZKNE},
 	{"zknh", KVM_RISCV_ISA_EXT_ZKNH},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 5d655cf..7a9ca60 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -124,6 +124,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zihpm",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIHPM],	\
 		    "Disable Zihpm Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zimop",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIMOP],	\
+		    "Disable Zimop Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zknd",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZKND],	\
 		    "Disable Zknd Extension"),				\
-- 
2.43.0


