From: Sean Christopherson <seanjc@google.com>
Date: Fri, 26 Jul 2024 16:51:41 -0700
Subject: [PATCH v12 32/84] KVM: Get writable mapping for __kvm_vcpu_map() only
 when necessary
In-Reply-To: <20240726235234.228822-1-seanjc@google.com>
References: <20240726235234.228822-1-seanjc@google.com>
Message-ID: <20240726235234.228822-33-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When creating a memory map for read, don't request a writable pfn from the
primary MMU.  While creating read-only mappings can be theoretically slower,
as they don't play nice with fast GUP due to the need to break CoW before
mapping the underlying PFN, practically speaking, creating a mapping isn't
a super hot path, and getting a writable mapping for reading is weird and
confusing.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a46c7bf1f902..a28479629488 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3142,7 +3142,7 @@ int __kvm_vcpu_map(struct kvm_vcpu *vcpu, gfn_t gfn, struct kvm_host_map *map,
 	struct kvm_follow_pfn kfp = {
 		.slot = gfn_to_memslot(vcpu->kvm, gfn),
 		.gfn = gfn,
-		.flags = FOLL_WRITE,
+		.flags = writable ? FOLL_WRITE : 0,
 		.refcounted_page = &map->pinned_page,
 		.pin = true,
 	};
-- 
2.46.0.rc1.232.g9752f9e123-goog


