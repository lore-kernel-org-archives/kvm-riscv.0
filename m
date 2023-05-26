From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 26 May 2023 12:25:39 +0200
Subject: [PATCH v2 2/3] RISC-V: KVM: Convert extension_disabled[] to ext_status[]
In-Reply-To: <20230526102540.105013-1-ajones@ventanamicro.com>
References: <20230526102540.105013-1-ajones@ventanamicro.com>
Message-ID: <20230526102540.105013-3-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Change the boolean extension_disabled[] array to an array of enums,
ext_status[]. For now, the enum only has two states, which correspond
to the previous boolean states, so this patch has no intended
functional change. The next patch will add another state, expanding
the purpose of ext_status[].

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 7 ++++++-
 arch/riscv/kvm/vcpu_sbi.c             | 9 ++++++---
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4278125a38a5..cda99fc3d897 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -14,9 +14,14 @@
 #define KVM_SBI_VERSION_MAJOR 1
 #define KVM_SBI_VERSION_MINOR 0
 
+enum KVM_RISCV_SBI_EXT_STATUS {
+	KVM_RISCV_SBI_EXT_AVAILABLE,
+	KVM_RISCV_SBI_EXT_UNAVAILABLE,
+};
+
 struct kvm_vcpu_sbi_context {
 	int return_handled;
-	bool extension_disabled[KVM_RISCV_SBI_EXT_MAX];
+	enum KVM_RISCV_SBI_EXT_STATUS ext_status[KVM_RISCV_SBI_EXT_MAX];
 };
 
 struct kvm_vcpu_sbi_return {
diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index 6aa15f1b97d9..28e55ba023dc 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -155,7 +155,8 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	scontext->extension_disabled[sext->ext_idx] = !reg_val;
+	scontext->ext_status[sext->ext_idx] = reg_val ?
+		KVM_RISCV_SBI_EXT_AVAILABLE : KVM_RISCV_SBI_EXT_UNAVAILABLE;
 
 	return 0;
 }
@@ -180,7 +181,8 @@ static int riscv_vcpu_get_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext)
 		return -ENOENT;
 
-	*reg_val = !scontext->extension_disabled[sext->ext_idx];
+	*reg_val = scontext->ext_status[sext->ext_idx] ==
+				KVM_RISCV_SBI_EXT_AVAILABLE;
 
 	return 0;
 }
@@ -316,7 +318,8 @@ const struct kvm_vcpu_sbi_extension *kvm_vcpu_sbi_find_ext(
 		if (sext->ext_ptr->extid_start <= extid &&
 		    sext->ext_ptr->extid_end >= extid) {
 			if (sext->ext_idx < KVM_RISCV_SBI_EXT_MAX &&
-			    scontext->extension_disabled[sext->ext_idx])
+			    scontext->ext_status[sext->ext_idx] ==
+						KVM_RISCV_SBI_EXT_UNAVAILABLE)
 				return NULL;
 			return sbi_ext[i].ext_ptr;
 		}
-- 
2.40.1


