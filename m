From: Thomas Huth <thuth@redhat.com>
Date: Wed,  8 Feb 2023 15:01:03 +0100
Subject: [PATCH v2 4/6] KVM: arm64: Limit length in kvm_vm_ioctl_mte_copy_tags() to INT_MAX
In-Reply-To: <20230208140105.655814-1-thuth@redhat.com>
References: <20230208140105.655814-1-thuth@redhat.com>
Message-ID: <20230208140105.655814-5-thuth@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In case of success, this function returns the amount of handled bytes.
However, this does not work for large values: The function is called
from kvm_arch_vm_ioctl() (which still returns a long), which in turn
is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that function
stores the return value in an "int r" variable. So the upper 32-bits
of the "long" return value are lost there.

KVM ioctl functions should only return "int" values, so let's limit
the amount of bytes that can be requested here to INT_MAX to avoid
the problem with the truncated return value. We can then also change
the return type of the function to "int" to make it clearer that it
is not possible to return a "long" here.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Documentation/virt/kvm/api.rst    | 3 ++-
 arch/arm64/include/asm/kvm_host.h | 4 ++--
 arch/arm64/kvm/guest.c            | 8 ++++++--
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 0a67cb738013..f184427931fa 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5553,7 +5553,8 @@ with the KVM_XEN_VCPU_GET_ATTR ioctl.
   };
 
 Copies Memory Tagging Extension (MTE) tags to/from guest tag memory. The
-``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned. The ``addr``
+``guest_ipa`` and ``length`` fields must be ``PAGE_SIZE`` aligned.
+``length`` must not be bigger than 2^31 - PAGE_SIZE bytes. The ``addr``
 field must point to a buffer which the tags will be copied to or from.
 
 ``flags`` specifies the direction of copy, either ``KVM_ARM_TAGS_TO_GUEST`` or
diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 35a159d131b5..b1a16343767f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -963,8 +963,8 @@ int kvm_arm_vcpu_arch_get_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 			       struct kvm_device_attr *attr);
 
-long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
-				struct kvm_arm_copy_mte_tags *copy_tags);
+int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
+			       struct kvm_arm_copy_mte_tags *copy_tags);
 
 /* Guest/host FPSIMD coordination helpers */
 int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index cf4c495a4321..cadef953046f 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1013,8 +1013,8 @@ int kvm_arm_vcpu_arch_has_attr(struct kvm_vcpu *vcpu,
 	return ret;
 }
 
-long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
-				struct kvm_arm_copy_mte_tags *copy_tags)
+int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
+			       struct kvm_arm_copy_mte_tags *copy_tags)
 {
 	gpa_t guest_ipa = copy_tags->guest_ipa;
 	size_t length = copy_tags->length;
@@ -1035,6 +1035,10 @@ long kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 	if (length & ~PAGE_MASK || guest_ipa & ~PAGE_MASK)
 		return -EINVAL;
 
+	/* Lengths above INT_MAX cannot be represented in the return value */
+	if (length > INT_MAX)
+		return -EINVAL;
+
 	gfn = gpa_to_gfn(guest_ipa);
 
 	mutex_lock(&kvm->slots_lock);
-- 
2.31.1


