From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:11 -0700
Subject: [PATCH v12 02/84] KVM: arm64: Disallow copying MTE to guest memory
 while KVM is dirty logging
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-3-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Disallow copying MTE tags to guest memory while KVM is dirty logging, as
writing guest memory without marking the gfn as dirty in the memslot could
result in userspace failing to migrate the updated page.  Ideally (maybe?),
KVM would simply mark the gfn as dirty, but there is no vCPU to work with,
and presumably the only use case for copy MTE tags _to_ the guest is when
restoring state on the target.

Fixes: f0376edb1ddc ("KVM: arm64: Add ioctl to fetch/store tags in a guest")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/guest.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index e1f0ff08836a..962f985977c2 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -1045,6 +1045,11 @@ int kvm_vm_ioctl_mte_copy_tags(struct kvm *kvm,
 
 	mutex_lock(&kvm->slots_lock);
 
+	if (write && atomic_read(&kvm->nr_memslots_dirty_logging)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
 	while (length > 0) {
 		kvm_pfn_t pfn = gfn_to_pfn_prot(kvm, gfn, write, NULL);
 		void *maddr;
-- 
2.46.0.rc1.232.g9752f9e123-goog


