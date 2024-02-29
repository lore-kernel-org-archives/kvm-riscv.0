From: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Feb 2024 16:53:39 -0800
Subject: [PATCH v9 07/11] KVM: selftests: Allow tagging protected memory
 in guest page tables
In-Reply-To: <Zd6Wo0hQu11L4aPc@google.com>
References: <20240223004258.3104051-1-seanjc@google.com> <20240223004258.3104051-8-seanjc@google.com>
 <75d37243-e2a3-421a-b74f-ccbe307fef96@intel.com> <Zd6Wo0hQu11L4aPc@google.com>
Message-ID: <Zd_Vk1dlpLNjUzQD@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Feb 27, 2024, Sean Christopherson wrote:
> On Wed, Feb 28, 2024, Xiaoyao Li wrote:
> > On 2/23/2024 8:42 AM, Sean Christopherson wrote:
> > ...
> > > diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > > new file mode 100644
> > > index 000000000000..218f5cdf0d86
> > > --- /dev/null
> > > +++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
> > > @@ -0,0 +1,7 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only */
> > > +#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > > +#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
> > 
> > Since the file name is changed from kvm_host.h (in v7) to kvm_util_arch.h,
> > we need to update it as well.
> > 
> > Ditto for other archs
> 
> Ugh, nice catch.  I'll fixup and force push (likely tomorrow).

Here's the diff of my fixup:

diff --git a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
index 218f5cdf0d86..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/aarch64/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_ARM64_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
index c8280d5659ce..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/riscv/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_RISCV_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
index 4c4c1c1e4bf8..e43a57d99b56 100644
--- a/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/s390x/kvm_util_arch.h
@@ -1,7 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_S390_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 struct kvm_vm_arch {};
 
-#endif  // _TOOLS_LINUX_ASM_S390_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H
diff --git a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
index 205ed788aeb8..9f1725192aa2 100644
--- a/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
+++ b/tools/testing/selftests/kvm/include/x86_64/kvm_util_arch.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _TOOLS_LINUX_ASM_X86_KVM_HOST_H
-#define _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#ifndef SELFTEST_KVM_UTIL_ARCH_H
+#define SELFTEST_KVM_UTIL_ARCH_H
 
 #include <stdbool.h>
 #include <stdint.h>
@@ -20,4 +20,4 @@ static inline bool __vm_arch_has_protected_memory(struct kvm_vm_arch *arch)
 #define vm_arch_has_protected_memory(vm) \
        __vm_arch_has_protected_memory(&(vm)->arch)
 
-#endif  // _TOOLS_LINUX_ASM_X86_KVM_HOST_H
+#endif  // SELFTEST_KVM_UTIL_ARCH_H

