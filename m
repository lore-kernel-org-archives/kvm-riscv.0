From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:05 +0000
Subject: [PATCH 13/15] KVM: Add KVM_TRANSLATE2 stub
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-14-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add stub function for the KVM_TRANSLATE2 ioctl, as well as generic
parameter verification. In a later commit, the ioctl will be properly
implemented for x86.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 include/linux/kvm_host.h |  2 ++
 virt/kvm/kvm_main.c      | 41 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 43 insertions(+)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index c78017fd2907..de6557794735 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1492,6 +1492,8 @@ int kvm_arch_vcpu_ioctl_set_fpu(struct kvm_vcpu *vcpu, struct kvm_fpu *fpu);
 
 int kvm_arch_vcpu_ioctl_translate(struct kvm_vcpu *vcpu,
 				    struct kvm_translation *tr);
+int kvm_arch_vcpu_ioctl_translate2(struct kvm_vcpu *vcpu,
+				   struct kvm_translation2 *tr);
 
 int kvm_arch_vcpu_ioctl_get_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs);
 int kvm_arch_vcpu_ioctl_set_regs(struct kvm_vcpu *vcpu, struct kvm_regs *regs);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index d51357fd28d7..c129dc0b0485 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -4442,6 +4442,32 @@ static int kvm_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
 }
 #endif
 
+int __weak kvm_arch_vcpu_ioctl_translate2(struct kvm_vcpu *vcpu,
+					  struct kvm_translation2 *tr)
+{
+	return -EINVAL;
+}
+
+static int kvm_vcpu_ioctl_translate2(struct kvm_vcpu *vcpu,
+				     struct kvm_translation2 *tr)
+{
+	/* Don't allow FORCE_SET_ACCESSED and SET_BITS without SET_ACCESSED */
+	if (!(tr->flags & KVM_TRANSLATE_FLAGS_SET_ACCESSED) &&
+	    (tr->flags & KVM_TRANSLATE_FLAGS_FORCE_SET_ACCESSED ||
+	     tr->flags & KVM_TRANSLATE_FLAGS_SET_DIRTY))
+		return -EINVAL;
+
+	if (tr->flags & KVM_TRANSLATE_FLAGS_SET_DIRTY &&
+	    !(tr->access & KVM_TRANSLATE_ACCESS_WRITE))
+		return -EINVAL;
+
+	if (tr->flags & ~KVM_TRANSLATE_FLAGS_ALL ||
+	    tr->access & ~KVM_TRANSLATE_ACCESS_ALL)
+		return -EINVAL;
+
+	return kvm_arch_vcpu_ioctl_translate2(vcpu, tr);
+}
+
 static long kvm_vcpu_ioctl(struct file *filp,
 			   unsigned int ioctl, unsigned long arg)
 {
@@ -4585,6 +4611,21 @@ static long kvm_vcpu_ioctl(struct file *filp,
 		r = 0;
 		break;
 	}
+	case KVM_TRANSLATE2: {
+		struct kvm_translation2 tr;
+
+		r = -EFAULT;
+		if (copy_from_user(&tr, argp, sizeof(tr)))
+			goto out;
+		r = kvm_vcpu_ioctl_translate2(vcpu, &tr);
+		if (r)
+			goto out;
+		r = -EFAULT;
+		if (copy_to_user(argp, &tr, sizeof(tr)))
+			goto out;
+		r = 0;
+		break;
+	}
 	case KVM_SET_GUEST_DEBUG: {
 		struct kvm_guest_debug dbg;
 
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


