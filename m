From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:38 +0800
Subject: [PATCH 2/5] riscv: head: make secondary_start_common() static
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <20211128160741.2122-3-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are no users outside head.S so make secondary_start_common()
static.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/head.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..3ce95f8783bd 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -177,8 +177,7 @@ secondary_start_sbi:
 	REG_L sp, (a4)
 	REG_L tp, (a5)
 
-	.global secondary_start_common
-secondary_start_common:
+.Lsecondary_start_common:
 
 #ifdef CONFIG_MMU
 	/* Enable virtual memory and relocate to virtual address */
@@ -365,7 +364,7 @@ clear_bss_done:
 	beqz tp, .Lwait_for_cpu_up
 	fence
 
-	tail secondary_start_common
+	tail .Lsecondary_start_common
 #endif
 
 END(_start_kernel)
-- 
2.34.0


