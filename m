From: Anup Patel <apatel@ventanamicro.com>
Date: Sat,  5 Oct 2024 13:30:21 +0530
Subject: [kvmtool PATCH v2 5/8] riscv: Add Zcd extension support
In-Reply-To: <20241005080024.11927-1-apatel@ventanamicro.com>
References: <20241005080024.11927-1-apatel@ventanamicro.com>
Message-ID: <20241005080024.11927-6-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the Zcd extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index c62d4a3..5587343 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -34,6 +34,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
 	{"zca", KVM_RISCV_ISA_EXT_ZCA},
 	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
+	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
 	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
 	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 68fc47c..155faa6 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -79,6 +79,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zcb",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCB],	\
 		    "Disable Zcb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcd",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCD],	\
+		    "Disable Zcd Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zfa",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFA],	\
 		    "Disable Zfa Extension"),				\
-- 
2.43.0


