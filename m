From: Jisheng Zhang <jszhang@kernel.org>
Date: Mon, 29 Nov 2021 00:07:40 +0800
Subject: [PATCH 4/5] riscv: errata: alternative: mark vendor_patch_func
 __initdata
In-Reply-To: <20211128160741.2122-1-jszhang@kernel.org>
References: <20211128160741.2122-1-jszhang@kernel.org>
Message-ID: <20211128160741.2122-5-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The function pointer vendor_patch_func is only used during init, so
mark it as __initdata.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/errata/alternative.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
index 3b15885db70b..e8b4a0fe488c 100644
--- a/arch/riscv/errata/alternative.c
+++ b/arch/riscv/errata/alternative.c
@@ -22,7 +22,8 @@ static struct cpu_manufacturer_info_t {
 } cpu_mfr_info;
 
 static void (*vendor_patch_func)(struct alt_entry *begin, struct alt_entry *end,
-				 unsigned long archid, unsigned long impid);
+				 unsigned long archid,
+				 unsigned long impid) __initdata;
 
 static inline void __init riscv_fill_cpu_mfr_info(void)
 {
-- 
2.34.0


