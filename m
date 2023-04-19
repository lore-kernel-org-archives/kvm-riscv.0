From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:42 -0700
Subject: [RFC kvmtool 02/10] riscv: Define a command line option for CoVE VM
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-3-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The user should be able configure the VMM to instantiate a CoVE VM via
a command line. Add the new option cove-vm.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index aed4fbf..01276ea 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -10,6 +10,7 @@ struct kvm_config_arch {
 	u64		custom_mimpid;
 	bool		ext_disabled[KVM_RISCV_ISA_EXT_MAX];
 	bool		sbi_ext_disabled[KVM_RISCV_SBI_EXT_MAX];
+	bool		cove_vm;
 };
 
 #define OPT_ARCH_RUN(pfx, cfg)						\
@@ -66,6 +67,7 @@ struct kvm_config_arch {
 		    "Disable SBI Experimental Extensions"),		\
 	OPT_BOOLEAN('\0', "disable-sbi-vendor",				\
 		    &(cfg)->sbi_ext_disabled[KVM_RISCV_SBI_EXT_VENDOR],	\
-		    "Disable SBI Vendor Extensions"),
+		    "Disable SBI Vendor Extensions"),			\
+	OPT_BOOLEAN('\0', "cove-vm", &(cfg)->cove_vm, "CoVE VM"),
 
 #endif /* KVM__KVM_CONFIG_ARCH_H */
-- 
2.25.1


