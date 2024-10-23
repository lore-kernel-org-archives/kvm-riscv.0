From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 23 Oct 2024 15:21:32 +0200
Subject: [kvm-unit-tests PATCH 1/4] riscv: Bump NR_CPUS to 256
In-Reply-To: <20241023132130.118073-6-andrew.jones@linux.dev>
References: <20241023132130.118073-6-andrew.jones@linux.dev>
Message-ID: <20241023132130.118073-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Besides a bit more memory used for the .bss section, where there are
NR_CPUS sized arrays, and a tiny bit more stack used by functions
with cpumasks on their stacks, then there's no harm in bumping
NR_CPUS. Bump it to 256, which should cover us for quite a while.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/setup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/riscv/asm/setup.h b/lib/riscv/asm/setup.h
index a13159bfe395..a031ebe7d762 100644
--- a/lib/riscv/asm/setup.h
+++ b/lib/riscv/asm/setup.h
@@ -4,7 +4,7 @@
 #include <libcflat.h>
 #include <asm/processor.h>
 
-#define NR_CPUS 16
+#define NR_CPUS 256
 extern struct thread_info cpus[NR_CPUS];
 extern int nr_cpus;
 extern uint64_t timebase_frequency;
-- 
2.47.0


