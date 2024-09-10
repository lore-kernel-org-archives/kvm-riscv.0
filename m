From: Nikolas Wipper <nikwip@amazon.de>
Date: Tue, 10 Sep 2024 15:21:59 +0000
Subject: [PATCH 07/15] KVM: x86/mmu: Implement PWALK_SET_DIRTY in page walker
In-Reply-To: <20240910152207.38974-1-nikwip@amazon.de>
References: <20240910152207.38974-1-nikwip@amazon.de>
Message-ID: <20240910152207.38974-8-nikwip@amazon.de>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Implement PWALK_SET_DIRTY in the page walker. This flag allows controlling,
whether the page walker will set the dirty bit after a successful page
walk. If the page walk fails for any reason, the dirty flag is not set.

Signed-off-by: Nikolas Wipper <nikwip@amazon.de>
---
 arch/x86/kvm/mmu/paging_tmpl.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kvm/mmu/paging_tmpl.h b/arch/x86/kvm/mmu/paging_tmpl.h
index eed6e2c653ba..b6897f7fbf52 100644
--- a/arch/x86/kvm/mmu/paging_tmpl.h
+++ b/arch/x86/kvm/mmu/paging_tmpl.h
@@ -318,6 +318,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 	const int user_fault  = access & PFERR_USER_MASK;
 	const int fetch_fault = access & PFERR_FETCH_MASK;
 	const int set_accessed = flags & PWALK_SET_ACCESSED;
+	const int set_dirty = flags & PWALK_SET_DIRTY;
 	u16 errcode = 0;
 	gpa_t real_gpa;
 	gfn_t gfn;
@@ -471,7 +472,7 @@ static int FNAME(walk_addr_generic)(struct guest_walker *walker,
 
 	if (unlikely(set_accessed && !accessed_dirty)) {
 		ret = FNAME(update_accessed_dirty_bits)(vcpu, mmu, walker, addr,
-							write_fault);
+							write_fault && set_dirty);
 		if (unlikely(ret < 0))
 			goto error;
 		else if (ret)
-- 
2.40.1




Amazon Web Services Development Center Germany GmbH
Krausenstr. 38
10117 Berlin
Geschaeftsfuehrung: Christian Schlaeger, Jonathan Weiss
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597


