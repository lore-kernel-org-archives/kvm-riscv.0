From: Zeng Guang <guang.zeng@intel.com>
Date: Thu,  2 Nov 2023 23:51:11 +0800
Subject: [RFC PATCH v1 8/8] KVM: selftests: x86: Add KVM forced emulation prefix capability
In-Reply-To: <20231102155111.28821-1-guang.zeng@intel.com>
References: <20231102155111.28821-1-guang.zeng@intel.com>
Message-ID: <20231102155111.28821-9-guang.zeng@intel.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce KVM selftest exception fixup using forced emulation prefix to
emulate instruction unconditionally when kvm.force_emulation_prefix is
enabled.

Signed-off-by: Zeng Guang <guang.zeng@intel.com>
---
 .../selftests/kvm/include/x86_64/processor.h  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/x86_64/processor.h b/tools/testing/selftests/kvm/include/x86_64/processor.h
index 2534bdf8aa71..a1645508affc 100644
--- a/tools/testing/selftests/kvm/include/x86_64/processor.h
+++ b/tools/testing/selftests/kvm/include/x86_64/processor.h
@@ -1110,6 +1110,10 @@ void vcpu_init_descriptor_tables(struct kvm_vcpu *vcpu);
 void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 			void (*handler)(struct ex_regs *));
 
+/* Forced emulation prefix for KVM emulating instruction unconditionally */
+#define KVM_FEP "ud2; .byte 'k', 'v', 'm';"
+#define KVM_FEP_LENGTH 5
+
 /* If a toddler were to say "abracadabra". */
 #define KVM_EXCEPTION_MAGIC 0xabacadabaULL
 
@@ -1149,6 +1153,22 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector,
 	"mov  %%r9b, %[vector]\n\t"				\
 	"mov  %%r10, %[error_code]\n\t"
 
+/*
+ * KVM selftest exception fixup using forced emulation prefix enforces KVM
+ * on emulating instruction unconditionally when kvm.force_emulation_prefix
+ * is enabled.
+ */
+#define KVM_FEP_ASM_SAFE(insn)					\
+	"mov $" __stringify(KVM_EXCEPTION_MAGIC) ", %%r9\n\t"	\
+	"lea 1f(%%rip), %%r10\n\t"				\
+	"lea 2f(%%rip), %%r11\n\t"				\
+	KVM_FEP							\
+	"1: " insn "\n\t"					\
+	"xor %%r9, %%r9\n\t"					\
+	"2:\n\t"						\
+	"mov  %%r9b, %[vector]\n\t"				\
+	"mov  %%r10, %[error_code]\n\t"
+
 #define KVM_ASM_SAFE_OUTPUTS(v, ec)	[vector] "=qm"(v), [error_code] "=rm"(ec)
 #define KVM_ASM_SAFE_CLOBBERS	"r9", "r10", "r11"
 
-- 
2.21.3


