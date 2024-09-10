From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:22:02 +0000
Subject: [PATCH 10/15] KVM: x86/mmu: Implement PWALK_STATUS_READ_ONLY_PTE_GPA in page walker
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-11-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement PWALK_STATUS_READ_ONLY_PTE_GPA in the page walker. This status
flag is set when setting an accessed or dirty bit fails, because the
memory of the page table entry was marked as read-only

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/include/asm/kvm_host.h | 2 ++
 arch/x86/kvm/mmu/paging_tmpl.h  | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 1c5aaf55c683..7ac1956f6f9b 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -290,6 +290,8 @@ enum x86_intercept_stage;
 #define PWALK_FORCE_SET_ACCESSED	BIT(2)
 #define PWALK_SET_ALL	(PWALK_SET_ACCESSED | PWALK_SET_DIRTY)
 
+#define PWALK_STATUS_READ_ONLY_PTE_GPA BIT(0)
+
 /* apic attention bits */
 #define KVM_APIC_CHECK_VAPIC	0
 /*
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index 985a19dda603..0eefa48e0e7f 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -244,8 +244,11 @@ static int FNAME(update_accessed_dirty_bits)(struct kvm_vcpu *vcpu,
 		 * overwrite the read-only memory to set the accessed and dirty
 		 * bits.
 		 */
-		if (unlikely(!walker->pte_writable[level - 1]))
+		if (unlikely(!walker->pte_writable[level - 1])) {
+			if (status)
+				*status |= PWALK_STATUS_READ_ONLY_PTE_GPA;
 			continue;
+		}
 
 		ret = __try_cmpxchg_user(ptep_user, &orig_pte, pte, fault);
 		if (ret)
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


