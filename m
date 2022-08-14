From: Conor Dooley <mail@conchuod.ie>
Date: Sun, 14 Aug 2022 15:12:36 +0100
Subject: [PATCH 2/4] riscv: kvm: move extern sbi_ext declarations to a header
In-Reply-To: <20220814141237.493457-1-mail@conchuod.ie>
References: <20220814141237.493457-1-mail@conchuod.ie>
Message-ID: <20220814141237.493457-3-mail@conchuod.ie>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Conor Dooley <conor.dooley@microchip.com>

Sparse complains about missing statics in the declarations of several
variables:
arch/riscv/kvm/vcpu_sbi_replace.c:38:37: warning: symbol 'vcpu_sbi_ext_time' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:73:37: warning: symbol 'vcpu_sbi_ext_ipi' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:126:37: warning: symbol 'vcpu_sbi_ext_rfence' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_replace.c:170:37: warning: symbol 'vcpu_sbi_ext_srst' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:69:37: warning: symbol 'vcpu_sbi_ext_base' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:90:37: warning: symbol 'vcpu_sbi_ext_experimental' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_base.c:96:37: warning: symbol 'vcpu_sbi_ext_vendor' was not declared. Should it be static?
arch/riscv/kvm/vcpu_sbi_hsm.c:115:37: warning: symbol 'vcpu_sbi_ext_hsm' was not declared. Should it be static?

These variables are however used in vcpu_sbi.c where they are declared
as extern. Move them to kvm_vcpu_sbi.h which is handily already
included by the three other files.

Fixes: a046c2d8578c ("RISC-V: KVM: Reorganize SBI code by moving SBI v0.1 to its own file")
Fixes: 5f862df5585c ("RISC-V: KVM: Add v0.1 replacement SBI extensions defined in v0.2")
Fixes: 3e1d86569c21 ("RISC-V: KVM: Add SBI HSM extension in KVM")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 2 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 83d6d4d2b1df..26a446a34057 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -33,4 +33,16 @@ void kvm_riscv_vcpu_sbi_system_reset(struct kvm_vcpu *vcpu,
 				     u32 type, u64 flags);
 const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(unsigned long extid);
 
+#ifdef CONFIG_RISCV_SBI_V01
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
+#endif
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
+extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
+
 #endif /* __RISCV_KVM_VCPU_SBI_H__ */
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index d45e7da3f0d3..f96991d230bf 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -32,23 +32,13 @@ static int kvm_linux_err_map_sbi(int err)
 	};
 }
 
-#ifdef CONFIG_RISCV_SBI_V01
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01;
-#else
+#ifndef CONFIG_RISCV_SBI_V01
 static const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_v01 = {
 	.extid_start = -1UL,
 	.extid_end = -1UL,
 	.handler = NULL,
 };
 #endif
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_time;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_ipi;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_rfence;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_hsm;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental;
-extern const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor;
 
 static const struct kvm_vcpu_sbi_extension *sbi_ext[] = {
 	&vcpu_sbi_ext_v01,
-- 
2.37.1


