From: Raghavendra Rao Ananta <rananta@google.com>
Date: Tue,  8 Aug 2023 23:13:24 +0000
Subject: [PATCH v8 08/14] arm64: tlb: Implement __flush_s2_tlb_range_op()
In-Reply-To: <20230808231330.3855936-1-rananta@google.com>
References: <20230808231330.3855936-1-rananta@google.com>
Message-ID: <20230808231330.3855936-9-rananta@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Define __flush_s2_tlb_range_op(), as a wrapper over
__flush_tlb_range_op(), for stage-2 specific range-based TLBI
operations that doesn't necessarily have to deal with 'asid'
and 'tlbi_user' arguments.

Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
---
 arch/arm64/include/asm/tlbflush.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index b9475a852d5be..93f4b397f9a12 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -340,6 +340,9 @@ do {									\
 	}								\
 } while (0)
 
+#define __flush_s2_tlb_range_op(op, start, pages, stride, tlb_level) \
+	__flush_tlb_range_op(op, start, pages, stride, 0, tlb_level, false)
+
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
-- 
2.41.0.640.ga95def55d0-goog


