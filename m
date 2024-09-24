From: zhouquan@iscas.ac.cn <zhouquan@iscas.ac.cn>
Date: Tue, 24 Sep 2024 19:03:53 +0800
Subject: [kvmtool PATCH 2/2] riscv: Add Zc*/Zimop/Zcmop/Zawrs exts support
In-Reply-To: <cover.1727174321.git.zhouquan@iscas.ac.cn>
References: <cover.1727174321.git.zhouquan@iscas.ac.cn>
Message-ID: <2b02ee03d0a952ff876d8423cf66031436dfaadf.1727174321.git.zhouquan@iscas.ac.cn>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Quan Zhou <zhouquan@iscas.ac.cn>

When the Zc*/Zimop/Zcmop/Zawrs extensions are available
expose them to the guest via device tree so that guest can use it.

Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
---
 riscv/fdt.c                         |  7 +++++++
 riscv/include/kvm/kvm-config-arch.h | 21 +++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index e331f80..6af639f 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -24,6 +24,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
 	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
+	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
 	{"zbb", KVM_RISCV_ISA_EXT_ZBB},
 	{"zbc", KVM_RISCV_ISA_EXT_ZBC},
@@ -31,6 +32,12 @@ struct isa_ext_info isa_info_arr[] = {
 	{"zbkc", KVM_RISCV_ISA_EXT_ZBKC},
 	{"zbkx", KVM_RISCV_ISA_EXT_ZBKX},
 	{"zbs", KVM_RISCV_ISA_EXT_ZBS},
+	{"zca", KVM_RISCV_ISA_EXT_ZCA},
+	{"zcb", KVM_RISCV_ISA_EXT_ZCB},
+	{"zcd", KVM_RISCV_ISA_EXT_ZCD},
+	{"zcf", KVM_RISCV_ISA_EXT_ZCF},
+	{"zcmop", KVM_RISCV_ISA_EXT_ZCMOP},
+	{"zimop", KVM_RISCV_ISA_EXT_ZIMOP},
 	{"zfa", KVM_RISCV_ISA_EXT_ZFA},
 	{"zfh", KVM_RISCV_ISA_EXT_ZFH},
 	{"zfhmin", KVM_RISCV_ISA_EXT_ZFHMIN},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 3fbc4f7..ed9b9e5 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -49,6 +49,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zacas",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
 		    "Disable Zacas Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zawrs",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZAWRS],	\
+		    "Disable Zawrs Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zba",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBA],	\
 		    "Disable Zba Extension"),				\
@@ -70,6 +73,24 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-zbs",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZBS],	\
 		    "Disable Zbs Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zca",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCA],	\
+		    "Disable Zca Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcb",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCB],	\
+		    "Disable Zcb Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcd",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCD],	\
+		    "Disable Zcd Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcf",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCF],	\
+		    "Disable Zcf Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zcmop",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZCMOP],	\
+		    "Disable Zcmop Extension"),				\
+	OPT_BOOLEAN('\0', "disable-zimop",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZIMOP],	\
+		    "Disable Zimop Extension"),				\
 	OPT_BOOLEAN('\0', "disable-zfa",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZFA],	\
 		    "Disable Zfa Extension"),				\
-- 
2.34.1


