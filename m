From: Jisheng Zhang <jszhang@kernel.org>
Date: Thu,  1 Sep 2022 01:59:18 +0800
Subject: [PATCH v2 3/5] riscv: select HAVE_POSIX_CPU_TIMERS_TASK_WORK
In-Reply-To: <20220831175920.2806-1-jszhang@kernel.org>
References: <20220831175920.2806-1-jszhang@kernel.org>
Message-ID: <20220831175920.2806-4-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Move POSIX CPU timer expiry and signal delivery into task context to
allow PREEMPT_RT setups to coexist with KVM.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 79e52441e18b..7a8134fd7ec9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -104,6 +104,7 @@ config RISCV
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_FUNCTION_ARG_ACCESS_API
 	select HAVE_STACKPROTECTOR
-- 
2.34.1


