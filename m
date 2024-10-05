From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  5 Oct 2024 13:30:19 +0530
Subject: [kvmtool PATCH v2 3/8] riscv: Add Zca extension support
In-Reply-To: <20241005080024.11927-1-apatel@ventanamicro.com>
References: <20241005080024.11927-1-apatel@ventanamicro.com>
Message-ID: <20241005080024.11927-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zca extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 9d0c038..4fe4583 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -32,6 +32,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
 	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
+	{"zca", KVM_RISCV_ISA_EXT_ZCA},
 	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
 	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 0b79d62..40679ef 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -73,6 +73,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zbs",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
 		    "Disable Zbs Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zca",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCA],	\
+		    "Disable Zca Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zfa",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFA],	\
 		    "Disable Zfa Extension"),				\
-- 
2.43.0


