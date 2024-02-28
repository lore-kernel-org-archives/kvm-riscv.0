From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Feb 2024 16:04:17 +0100
Subject: [kvm-unit-tests PATCH 01/13] riscv: Call abort instead of assert on unhandled exceptions
In-Reply-To: <20240228150416.248948-15-andrew.jones@linux.dev>
References: <20240228150416.248948-15-andrew.jones@linux.dev>
Message-ID: <20240228150416.248948-16-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

We should call abort() instead of assert() on an unhandled
exception since assert() calls abort() anyway after a useless
"assert failed: 0" message. We can also skip dumping the
exception stack and just unwind from the stack frame where
the exception occurred.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/processor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index e0904209c0da..6c868b805cf7 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -43,7 +43,8 @@ void do_handle_exception(struct pt_regs *regs)
 	}
 
 	show_regs(regs);
-	assert(0);
+	dump_frame_stack((void *)regs->epc, (void *)regs->s0);
+	abort();
 }
 
 void install_exception_handler(unsigned long cause, void (*handler)(struct pt_regs *))
-- 
2.43.0


