From: Andrew Jones <andrew.jones@linux.dev>
Date: Wed, 28 Aug 2024 19:18:28 +0200
Subject: [kvm-unit-tests PATCH 4/3] riscv: QEMU Sstc timer stop workaround
In-Reply-To: <20240828162200.1384696-5-andrew.jones@linux.dev>
References: <20240828162200.1384696-5-andrew.jones@linux.dev>
Message-ID: <20240828171827.1401255-2-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

QEMU doesn't stop a pending timer when UINT64_MAX is written to
stimecmp, see QEMU commit ae0edf2188b3 ("target/riscv: No need to
re-start QEMU timer when timecmp == UINT64_MAX"). We should probably
change that in QEMU, but we need a solution in kvm-unit-tests anyway
in order to support older QEMU versions. A bit of an ugly workaround
is to simply subtract one from UINT64_MAX, which is still a really
big number, but not the exact number QEMU is using to decide it
should skip the timer update.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/timer.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/lib/riscv/timer.c b/lib/riscv/timer.c
index 67fd031ab95f..28e1626607f7 100644
--- a/lib/riscv/timer.c
+++ b/lib/riscv/timer.c
@@ -62,9 +62,16 @@ void timer_start(unsigned long duration_us)
 void timer_stop(void)
 {
 	if (cpu_has_extension(smp_processor_id(), ISA_SSTC)) {
-		csr_write(CSR_STIMECMP, ULONG_MAX);
+		/*
+		 * Subtract one from ULONG_MAX to workaround QEMU using that
+		 * exact number to decide *not* to update the timer. IOW, if
+		 * we used ULONG_MAX, then we wouldn't stop the timer at all,
+		 * but one less is still a big number ("infinity") and it gets
+		 * QEMU to do what we want.
+		 */
+		csr_write(CSR_STIMECMP, ULONG_MAX - 1);
 		if (__riscv_xlen == 32)
-			csr_write(CSR_STIMECMPH, ULONG_MAX);
+			csr_write(CSR_STIMECMPH, ULONG_MAX - 1);
 	} else if (sbi_probe(SBI_EXT_TIME)) {
 		struct sbiret ret = sbi_set_timer(ULONG_MAX);
 		assert(ret.error == SBI_SUCCESS);
-- 
2.45.2


