From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 15:44:54 +0200
Subject: [kvm-unit-tests PATCH v2 2/7] riscv: setup: Apply VA_BASE check to rv64
In-Reply-To: <20240812134451.112498-9-andrew.jones@linux.dev>
References: <20240812134451.112498-9-andrew.jones@linux.dev>
Message-ID: <20240812134451.112498-11-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The VA_BASE check in setup() also applies to rv64, as is clear from
the later VA_BASE check in mem_allocator_init(), which ensures
freemem_start < freemem_end < VA_BASE.

Fixes: 6895ce6dc618 ("riscv: Populate memregions and switch to page allocator")
Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index e0b5f6f7daf5..2c7792a5b0bd 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -193,7 +193,7 @@ void setup(const void *fdt, phys_addr_t freemem_start)
 	const char *bootargs;
 	int ret;
 
-	assert(sizeof(long) == 8 || freemem_start < VA_BASE);
+	assert(freemem_start < VA_BASE);
 	freemem = __va(freemem_start);
 
 	freemem_push_fdt(&freemem, fdt);
-- 
2.45.2


