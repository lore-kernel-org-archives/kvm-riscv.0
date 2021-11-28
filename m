From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:41 +0800
Subject: [PATCH 5/5] riscv: head: remove useless __PAGE_ALIGNED_BSS and .balign
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <20211128160741.2122-6-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After commit 83e7b8769a08 ("RISC-V: move empty_zero_page definition to
C and export it"), the empty_zero_page has been moved outside head.S,
the __PAGE_ALIGNED_BSS and .balign LoCs are useless, clean up them.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/head.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 3ce95f8783bd..c128a32c2ed3 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -447,7 +447,3 @@ ENTRY(reset_regs)
 	ret
 END(reset_regs)
 #endif /* CONFIG_RISCV_M_MODE */
-
-__PAGE_ALIGNED_BSS
-	/* Empty zero page */
-	.balign PAGE_SIZE
-- 
2.34.0


