From: Sean Christopherson <seanjc@google.com>
Date: Thu,  4 Nov 2021 00:25:23 +0000
Subject: [PATCH v5.5 22/30] KVM: Move WARN on invalid memslot index to
 update_memslots()
In-Reply-To: <20211104002531.1176691-1-seanjc@google.com>
References: <20211104002531.1176691-1-seanjc@google.com>
Message-ID: <20211104002531.1176691-23-seanjc@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>

Since kvm_memslot_move_forward() can theoretically return a negative
memslot index even when kvm_memslot_move_backward() returned a positive one
(and so did not WARN) let's just move the warning to the common code.

Signed-off-by: Maciej S. Szmigiero <maciej.szmigiero@oracle.com>
Reviewed-by: Claudio Imbrenda <imbrenda@linux.ibm.com>
Reviewed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index a2d51ce957e1..d45d574a5a2d 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1307,8 +1307,7 @@ static inline int kvm_memslot_move_backward(struct kvm_memslots *slots,
 	struct kvm_memory_slot *mslots = slots->memslots;
 	int i;
 
-	if (WARN_ON_ONCE(slots->id_to_index[memslot->id] == -1) ||
-	    WARN_ON_ONCE(!slots->used_slots))
+	if (slots->id_to_index[memslot->id] == -1 || !slots->used_slots)
 		return -1;
 
 	/*
@@ -1412,6 +1411,9 @@ static void update_memslots(struct kvm_memslots *slots,
 			i = kvm_memslot_move_backward(slots, memslot);
 		i = kvm_memslot_move_forward(slots, memslot, i);
 
+		if (WARN_ON_ONCE(i < 0))
+			return;
+
 		/*
 		 * Copy the memslot to its new position in memslots and update
 		 * its index accordingly.
-- 
2.33.1.1089.g2158813163f-goog


