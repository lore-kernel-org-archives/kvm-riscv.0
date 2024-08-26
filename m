From: Cade Richard <cade.richard@gmail.com>
Date: Sun, 25 Aug 2024 22:40:38 -0700
Subject: [kvm-unit-tests PATCH] Changed cpumask_next to wrap instead of terminating after nr_cpus.
Message-ID: <20240826054038.11584-1-cade.richard@berkeley.edu>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Changed cpumask_next() to wrap instead of terminating after nr_cpus.

Signed-off-by: Cade Richard <cade.richard@berkeley.edu>
---
 lib/cpumask.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/cpumask.h b/lib/cpumask.h
index be191923..5105c3bd 100644
--- a/lib/cpumask.h
+++ b/lib/cpumask.h
@@ -109,8 +109,10 @@ static inline void cpumask_copy(cpumask_t *dst, const cpumask_t *src)
 
 static inline int cpumask_next(int cpu, const cpumask_t *mask)
 {
-	while (++cpu < nr_cpus && !cpumask_test_cpu(cpu, mask))
-		;
+	do {
+		if (++cpu > nr_cpus)
+			cpu = 0;
+	} while (!cpumask_test_cpu(cpu, mask));
 	return cpu;
 }
 
-- 
2.43.0


