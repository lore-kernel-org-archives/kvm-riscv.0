From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 12 Jul 2023 22:04:55 +0530
Subject: [kvmtool PATCH v4 3/9] riscv: Allow setting custom mvendorid, marchid, and mimpid
In-Reply-To: <20230712163501.1769737-1-apatel@ventanamicro.com>
References: <20230712163501.1769737-1-apatel@ventanamicro.com>
Message-ID: <20230712163501.1769737-4-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We add command-line parameter to set custom mvendorid, marchid, and
mimpid so that users can show fake CPU type to Guest/VM which does
not match underlying Host CPU.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h | 12 ++++++++++++
 riscv/kvm-cpu.c                     | 26 +++++++++++++++++++++++++-
 2 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 188125c..e64e3ca 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -5,6 +5,9 @@
 
 struct kvm_config_arch {
 	const char	*dump_dtb_filename;
+	u64		custom_mvendorid;
+	u64		custom_marchid;
+	u64		custom_mimpid;
 	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
 };
 
@@ -12,6 +15,15 @@ struct kvm_config_arch {
 	pfx,								\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
+	OPT_U64('\0', "custom-mvendorid",				\
+		&(cfg)->custom_mvendorid,				\
+		"Show custom mvendorid to Guest VCPU"),			\
+	OPT_U64('\0', "custom-marchid",					\
+		&(cfg)->custom_marchid,					\
+		"Show custom marchid to Guest VCPU"),			\
+	OPT_U64('\0', "custom-mimpid",					\
+		&(cfg)->custom_mimpid,					\
+		"Show custom mimpid to Guest VCPU"),			\
 	OPT_BOOLEAN('\0', "disable-sstc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
 		    "Disable Sstc Extension"),				\
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index f98bd7a..89122b4 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -22,7 +22,7 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 {
 	struct kvm_cpu *vcpu;
 	u64 timebase = 0;
-	unsigned long isa = 0;
+	unsigned long isa = 0, id = 0;
 	int coalesced_offset, mmap_size;
 	struct kvm_one_reg reg;
 
@@ -64,6 +64,30 @@ struct kvm_cpu *kvm_cpu__arch_init(struct kvm *kvm, unsigned long cpu_id)
 	if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
 		die("KVM_SET_ONE_REG failed (config.isa)");
 
+	if (kvm->cfg.arch.custom_mvendorid) {
+		id = kvm->cfg.arch.custom_mvendorid;
+		reg.id = RISCV_CONFIG_REG(mvendorid);
+		reg.addr = (unsigned long)&id;
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			die("KVM_SET_ONE_REG failed (config.mvendorid)");
+	}
+
+	if (kvm->cfg.arch.custom_marchid) {
+		id = kvm->cfg.arch.custom_marchid;
+		reg.id = RISCV_CONFIG_REG(marchid);
+		reg.addr = (unsigned long)&id;
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			die("KVM_SET_ONE_REG failed (config.marchid)");
+	}
+
+	if (kvm->cfg.arch.custom_mimpid) {
+		id = kvm->cfg.arch.custom_mimpid;
+		reg.id = RISCV_CONFIG_REG(mimpid);
+		reg.addr = (unsigned long)&id;
+		if (ioctl(vcpu->vcpu_fd, KVM_SET_ONE_REG, &reg) < 0)
+			die("KVM_SET_ONE_REG failed (config.mimpid)");
+	}
+
 	/* Populate the vcpu structure. */
 	vcpu->kvm		= kvm;
 	vcpu->cpu_id		= cpu_id;
-- 
2.34.1


