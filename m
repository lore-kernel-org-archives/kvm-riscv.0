From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:55 +0000
Subject: [PATCH 03/15] KVM: x86/mmu: Introduce exception flag for unmapped GPAs
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-4-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce a flag in x86_exception which signals that a page walk failed
because a page table GPA wasn't backed by a memslot. This only applies to
page tables; the final physical address is not checked.

This extra flag is needed, because the normal page fault error code does
not contain a bit to signal this kind of fault.

Used in subsequent patches to give userspace information about translation
failure.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/kvm_emulate.h     | 2 ++
 arch/x86/kvm/mmu/paging_tmpl.h | 6 +++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index 55a18e2f2dcd..afd8e86bc6af 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -27,6 +27,8 @@ struct x86_exception {
 	u64 address; /* cr2 or nested page fault gpa */
 	u8 async_page_fault;
 	unsigned long exit_qualification;
+#define KVM_X86_UNMAPPED_PTE_GPA	BIT(0)
+	u16 flags;
 };
 
 /*
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index d9c3c78b3c14..f6a78b7cfca1 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -339,6 +339,8 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 #endif
 	walker->max_level = walker->level;
 
+	walker->fault.flags = 0;
+
 	/*
 	 * FIXME: on Intel processors, loads of the PDPTE registers for PAE paging
 	 * by the MOV to CR instruction are treated as reads and do not cause the
@@ -393,8 +395,10 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 			return 0;
 
 		slot = kvm_vcpu_gfn_to_memslot(vcpu, gpa_to_gfn(real_gpa));
-		if (!kvm_is_visible_memslot(slot))
+		if (!kvm_is_visible_memslot(slot)) {
+			walker->fault.flags = KVM_X86_UNMAPPED_PTE_GPA;
 			goto error;
+		}
 
 		host_addr = gfn_to_hva_memslot_prot(slot, gpa_to_gfn(real_gpa),
 					    &walker->pte_writable[walker->level - 1]);
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


