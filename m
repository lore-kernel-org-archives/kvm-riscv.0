From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:52:22 -0700
Subject: [PATCH v12 73/84] KVM: PPC: Use kvm_vcpu_map() to map guest memory to
 patch dcbz instructions
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-74-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use kvm_vcpu_map() when patching dcbz in guest memory, as a regular GUP
isn't technically sufficient when writing to data in the target pages.
As per Documentation/core-api/pin_user_pages.rst:

      Correct (uses FOLL_PIN calls):
          pin_user_pages()
          write to the data within the pages
          unpin_user_pages()

      INCORRECT (uses FOLL_GET calls):
          get_user_pages()
          write to the data within the pages
          put_page()

As a happy bonus, using kvm_vcpu_{,un}map() takes care of creating a
mapping and marking the page dirty.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/kvm/book3s_pr.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ae4757ac0848..393c18958a5b 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -639,28 +639,27 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, u32 pvr)
  */
 static void kvmppc_patch_dcbz(struct kvm_vcpu *vcpu, struct kvmppc_pte *pte)
 {
-	struct page *hpage;
+	struct kvm_host_map map;
 	u64 hpage_offset;
 	u32 *page;
-	int i;
+	int i, r;
 
-	hpage = gfn_to_page(vcpu->kvm, pte->raddr >> PAGE_SHIFT);
-	if (!hpage)
+	r = kvm_vcpu_map(vcpu, pte->raddr >> PAGE_SHIFT, &map);
+	if (r)
 		return;
 
 	hpage_offset = pte->raddr & ~PAGE_MASK;
 	hpage_offset &= ~0xFFFULL;
 	hpage_offset /= 4;
 
-	page = kmap_atomic(hpage);
+	page = map.hva;
 
 	/* patch dcbz into reserved instruction, so we trap */
 	for (i=hpage_offset; i < hpage_offset + (HW_PAGE_SIZE / 4); i++)
 		if ((be32_to_cpu(page[i]) & 0xff0007ff) == INS_DCBZ)
 			page[i] &= cpu_to_be32(0xfffffff7);
 
-	kunmap_atomic(page);
-	put_page(hpage);
+	kvm_vcpu_unmap(vcpu, &map);
 }
 
 static bool kvmppc_visible_gpa(struct kvm_vcpu *vcpu, gpa_t gpa)
-- 
2.46.0.rc1.232.g9752f9e123-goog


