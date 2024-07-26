From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:29 -0700
Subject: [PATCH v12 80/84] KVM: Make kvm_follow_pfn.refcounted_page a required field
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-81-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the legacy gfn_to_pfn() APIs are gone, and all callers of
hva_to_pfn() pass in a refcounted_page pointer, make it a required field
to ensure all future usage in KVM plays nice.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 5dcf3561b829..030a08d4b21d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2844,8 +2844,7 @@ static kvm_pfn_t kvm_resolve_pfn(struct kvm_follow_pfn *kfp, struct page *page,
 		pfn = page_to_pfn(page);
 	}
 
-	if (kfp->refcounted_page)
-		*kfp->refcounted_page = page;
+	*kfp->refcounted_page = page;
 
 	return pfn;
 }
@@ -3001,6 +3000,9 @@ kvm_pfn_t hva_to_pfn(struct kvm_follow_pfn *kfp)
 
 	might_sleep();
 
+	if (WARN_ON_ONCE(!kfp->refcounted_page))
+		return KVM_PFN_ERR_FAULT;
+
 	if (hva_to_pfn_fast(kfp, &pfn))
 		return pfn;
 
-- 
2.46.0.rc1.232.g9752f9e123-goog


