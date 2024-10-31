From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 31 Oct 2024 13:39:51 +0100
Subject: [kvm-unit-tests PATCH v2 2/3] lib/on-cpus: Add barrier after func call
In-Reply-To: <20241031123948.320652-5-andrew.jones@linux.dev>
References: <20241031123948.320652-5-andrew.jones@linux.dev>
Message-ID: <20241031123948.320652-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

It's reasonable for users of on_cpu() and on_cpumask() to assume
they can read data that 'func' has written when the call completes.
Ensure the caller doesn't observe a completion (target cpus are again
idle) without also being able to observe any writes which were made
by func(). Do so by adding barriers to implement the following

 target-cpu                                   calling-cpu
 ----------                                   -----------
 func() /* store something */                 /* wait for target to be idle */
 smp_wmb();                                   smp_rmb();
 set_cpu_idle(smp_processor_id(), true);      /* load what func() stored */

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/on-cpus.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/on-cpus.c b/lib/on-cpus.c
index f6072117fa1b..356f284be61b 100644
--- a/lib/on-cpus.c
+++ b/lib/on-cpus.c
@@ -79,6 +79,7 @@ void do_idle(void)
 			smp_wait_for_event();
 		smp_rmb();
 		on_cpu_info[cpu].func(on_cpu_info[cpu].data);
+		smp_wmb(); /* pairs with the smp_rmb() in on_cpu() and on_cpumask() */
 	}
 }
 
@@ -145,12 +146,14 @@ void on_cpumask(const cpumask_t *mask, void (*func)(void *data), void *data)
 		smp_wait_for_event();
 	for_each_cpu(cpu, mask)
 		cpumask_clear_cpu(me, &on_cpu_info[cpu].waiters);
+	smp_rmb(); /* pairs with the smp_wmb() in do_idle() */
 }
 
 void on_cpu(int cpu, void (*func)(void *data), void *data)
 {
 	on_cpu_async(cpu, func, data);
 	cpu_wait(cpu);
+	smp_rmb(); /* pairs with the smp_wmb() in do_idle() */
 }
 
 void on_cpus(void (*func)(void *data), void *data)
-- 
2.47.0


