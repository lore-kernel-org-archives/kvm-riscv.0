From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:56 +0000
Subject: [PATCH 04/15] KVM: x86/mmu: Store GPA in exception if applicable
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-5-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Store the GPA where the page walk failed within the walker's exception.
Precisely this means, the PTE's GPA, if it couldn't be resolved or it
caused an access violation, or the fully translated GPA in case the final
page caused an access violation.

Returning the GPA from the page walker directly is not possible, because
other code within KVM relies on INVALID_GPA being returned on failure.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/kvm_emulate.h     | 6 ++++++
 arch/x86/kvm/mmu/paging_tmpl.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/arch/x86/kvm/kvm_emulate.h b/arch/x86/kvm/kvm_emulate.h
index afd8e86bc6af..6501ce1c76fd 100644
--- a/arch/x86/kvm/kvm_emulate.h
+++ b/arch/x86/kvm/kvm_emulate.h
@@ -25,6 +25,12 @@ struct x86_exception {
 	u16 error_code;
 	bool nested_page_fault;
 	u64 address; /* cr2 or nested page fault gpa */
+	/*
+	 * If error_code is a page fault, this will be the address of the last
+	 * visited page table, or the fully translated address if it caused the
+	 * failure. Otherwise, it will not hold a meaningful value.
+	 */
+	u64 gpa_page_fault;
 	u8 async_page_fault;
 	unsigned long exit_qualification;
 #define KVM_X86_UNMAPPED_PTE_GPA	BIT(0)
diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index f6a78b7cfca1..74651b097fa0 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -485,6 +485,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	walker->fault.vector = PF_VECTOR;
 	walker->fault.error_code_valid = true;
 	walker->fault.error_code = errcode;
+	walker->fault.gpa_page_fault = real_gpa;
 
 #if PTTYPE == PTTYPE_EPT
 	/*
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


