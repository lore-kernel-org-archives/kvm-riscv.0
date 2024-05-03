From: David Matlack <dmatlack@google.com>
Date: Fri,  3 May 2024 11:17:33 -0700
Subject: [PATCH v3 2/3] KVM: Ensure new code that references immediate_exit
 gets extra scrutiny
In-Reply-To: <20240503181734.1467938-1-dmatlack@google.com>
References: <20240503181734.1467938-1-dmatlack@google.com>
Message-ID: <20240503181734.1467938-3-dmatlack@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure that any new KVM code that references immediate_exit gets extra
scrutiny by renaming it to immediate_exit__unsafe in kernel code.

All fields in struct kvm_run are subject to TOCTOU races since they are
mapped into userspace, which may be malicious or buggy. To protect KVM,
this commit introduces a new macro that appends __unsafe to field names
in struct kvm_run, hinting to developers and reviewers that accessing
this field must be done carefully.

Apply the new macro to immediate_exit, since userspace can make
immediate_exit inconsistent with vcpu->wants_to_run, i.e. accessing
immediate_exit directly could lead to unexpected bugs in the future.

Signed-off-by: David Matlack <dmatlack@google.com>
---
 include/uapi/linux/kvm.h | 15 ++++++++++++++-
 virt/kvm/kvm_main.c      |  2 +-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index 2190adbe3002..3611ad3b9c2a 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -192,11 +192,24 @@ struct kvm_xen_exit {
 /* Flags that describe what fields in emulation_failure hold valid data. */
 #define KVM_INTERNAL_ERROR_EMULATION_FLAG_INSTRUCTION_BYTES (1ULL << 0)
 
+/*
+ * struct kvm_run can be modified by userspace@any time, so KVM must be
+ * careful to avoid TOCTOU bugs. In order to protect KVM, HINT_UNSAFE_IN_KVM()
+ * renames fields in struct kvm_run from <symbol> to <symbol>__unsafe when
+ * compiled into the kernel, ensuring that any use within KVM is obvious and
+ * gets extra scrutiny.
+ */
+#ifdef __KERNEL__
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol##__unsafe
+#else
+#define HINT_UNSAFE_IN_KVM(_symbol) _symbol
+#endif
+
 /* for KVM_RUN, returned by mmap(vcpu_fd, offset=0) */
 struct kvm_run {
 	/* in */
 	__u8 request_interrupt_window;
-	__u8 immediate_exit;
+	__u8 HINT_UNSAFE_IN_KVM(immediate_exit);
 	__u8 padding1[6];
 
 	/* out */
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index bdea5b978f80..2b29851a90bd 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4425,7 +4425,7 @@ static long kvm_vcpu_ioctl(struct file *filp,
 				synchronize_rcu();
 			put_pid(oldpid);
 		}
-		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit);
+		vcpu->wants_to_run = !READ_ONCE(vcpu->run->immediate_exit__unsafe);
 		r = kvm_arch_vcpu_ioctl_run(vcpu);
 		vcpu->wants_to_run = false;
 
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


