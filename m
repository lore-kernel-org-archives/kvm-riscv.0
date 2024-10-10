From: Sean Christopherson <seanjc@google.com>
Date: Thu, 10 Oct 2024 11:23:22 -0700
Subject: [PATCH v13 20/85] KVM: Remove pointless sanity check on @map param to kvm_vcpu_(un)map()
In-Reply-To: <20241010182427.1434605-1-seanjc@google.com>
References: <20241010182427.1434605-1-seanjc@google.com>
Message-ID: <20241010182427.1434605-21-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Drop kvm_vcpu_{,un}map()'s useless checks on @map being non-NULL.  The map
is 100% kernel controlled, any caller that passes a NULL pointer is broken
and needs to be fixed, i.e. a crash due to a NULL pointer dereference is
desirable (though obviously not as desirable as not having a bug in the
first place).

Tested-by: Alex Benn?e <alex.bennee@linaro.org>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 52629ac26119..c7691bc40389 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3071,9 +3071,6 @@ int kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map)
 	void *hva = NULL;
 	struct page *page = KVM_UNMAPPED_PAGE;
 
-	if (!map)
-		return -EINVAL;
-
 	pfn = gfn_to_pfn(vcpu->kvm, gfn);
 	if (is_error_noslot_pfn(pfn))
 		return -EINVAL;
@@ -3101,9 +3098,6 @@ EXPORT_SYMBOL_GPL(kvm_vcpu_map);
 
 void kvm_vcpu_unmap(struct kvm_vcpu *vcpu, struct kvm_host_map *map, bool dirty)
 {
-	if (!map)
-		return;
-
 	if (!map->hva)
 		return;
 
-- 
2.47.0.rc1.288.g06298d1525-goog


