From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:45 -0700
Subject: [PATCH v12 36/84] KVM: x86: Use kvm_lookup_pfn() to check if APIC
 access page was installed
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-37-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use kvm_lookup_pfn() to verify that the APIC access page was allocated and
installed as expected.  The mapping is controlled by KVM, i.e. it's
guaranteed to be backed by struct page, the purpose of the check is purely
to ensure the page is allocated, i.e. that KVM doesn't point the guest at
garbage.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index 6d65b36fac29..88dc43660d23 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2612,8 +2612,8 @@ void kvm_apic_update_apicv(struct kvm_vcpu *vcpu)
 
 int kvm_alloc_apic_access_page(struct kvm *kvm)
 {
-	struct page *page;
 	void __user *hva;
+	kvm_pfn_t pfn;
 	int ret = 0;
 
 	mutex_lock(&kvm->slots_lock);
@@ -2628,17 +2628,16 @@ int kvm_alloc_apic_access_page(struct kvm *kvm)
 		goto out;
 	}
 
-	page = gfn_to_page(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
-	if (!page) {
-		ret = -EFAULT;
-		goto out;
-	}
-
 	/*
 	 * Do not pin the page in memory, so that memory hot-unplug
 	 * is able to migrate it.
 	 */
-	put_page(page);
+	pfn = kvm_lookup_pfn(kvm, APIC_DEFAULT_PHYS_BASE >> PAGE_SHIFT);
+	if (is_error_noslot_pfn(pfn)) {
+		ret = -EFAULT;
+		goto out;
+	}
+
 	kvm->arch.apic_access_memslot_enabled = true;
 out:
 	mutex_unlock(&kvm->slots_lock);
-- 
2.46.0.rc1.232.g9752f9e123-goog


