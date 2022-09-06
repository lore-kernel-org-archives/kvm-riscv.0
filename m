From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue,  6 Sep 2022 10:35:53 +0200
Subject: [PATCH 1/3] RISC-V: Output cbom-block-size
In-Reply-To: <20220906083555.931806-1-ajones@ventanamicro.com>
References: <20220906083555.931806-1-ajones@ventanamicro.com>
Message-ID: <20220906083555.931806-2-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide an info message with the block size when the Zicbom extension is
present and the block size has been determined.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index e5b087be1577..8595baf8e403 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -122,7 +122,9 @@ void riscv_init_cbom_blocksize(void)
 		}
 	}
 
-	if (probed_block_size)
+	if (probed_block_size) {
 		riscv_cbom_block_size = probed_block_size;
+		pr_info("riscv: Zicbom: Cache blocksize is %u bytes", probed_block_size);
+	}
 }
 #endif
-- 
2.37.2


