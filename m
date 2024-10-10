From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:24:22 -0700
Subject: [PATCH v13 80/85] KVM: s390: Use kvm_release_page_dirty() to unpin
 "struct page" memory
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <20241010182427.1434605-81-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use kvm_release_page_dirty() when unpinning guest pages, as the pfn was
retrieved via pin_guest_page(), i.e. is guaranteed to be backed by struct
page memory.  This will allow dropping kvm_release_pfn_dirty() and
friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/s390/kvm/vsie.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/kvm/vsie.c b/arch/s390/kvm/vsie.c
index 763a070f5955..e1fdf83879cf 100644
--- a/arch/s390/kvm/vsie.c
+++ b/arch/s390/kvm/vsie.c
@@ -670,7 +670,7 @@ static int pin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t *hpa)
 /* Unpins a page previously pinned via pin_guest_page, marking it as dirty. */
 static void unpin_guest_page(struct kvm *kvm, gpa_t gpa, hpa_t hpa)
 {
-	kvm_release_pfn_dirty(hpa >> PAGE_SHIFT);
+	kvm_release_page_dirty(pfn_to_page(hpa >> PAGE_SHIFT));
 	/* mark the page always as dirty for migration */
 	mark_page_dirty(kvm, gpa_to_gfn(gpa));
 }
-- 
2.47.0.rc1.288.g06298d1525-goog


