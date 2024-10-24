From: Andrew Jones <andrew.jones@linux.dev>
Date: Thu, 24 Oct 2024 14:28:41 +0200
Subject: [kvm-unit-tests PATCH 1/2] riscv: Add sbi_send_ipi_broadcast
In-Reply-To: <20241024122839.71753-4-andrew.jones@linux.dev>
References: <20241024122839.71753-4-andrew.jones@linux.dev>
Message-ID: <20241024122839.71753-5-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Coming SBI IPI tests will use this, but as it could be useful for
other tests too, add it to the library.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/asm/sbi.h | 1 +
 lib/riscv/sbi.c     | 7 ++++++-
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index 1319439b7118..102486c00de3 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -87,6 +87,7 @@ struct sbiret sbi_hart_get_status(unsigned long hartid);
 struct sbiret sbi_send_ipi(unsigned long hart_mask, unsigned long hart_mask_base);
 struct sbiret sbi_send_ipi_cpu(int cpu);
 struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask);
+struct sbiret sbi_send_ipi_broadcast(void);
 struct sbiret sbi_set_timer(unsigned long stime_value);
 long sbi_probe(int ext);
 
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index f25bde169490..02dd338c1915 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -62,13 +62,18 @@ struct sbiret sbi_send_ipi_cpu(int cpu)
 	return sbi_send_ipi(1UL, cpus[cpu].hartid);
 }
 
+struct sbiret sbi_send_ipi_broadcast(void)
+{
+	return sbi_send_ipi(0, -1UL);
+}
+
 struct sbiret sbi_send_ipi_cpumask(const cpumask_t *mask)
 {
 	struct sbiret ret;
 	cpumask_t tmp;
 
 	if (cpumask_full(mask))
-		return sbi_send_ipi(0, -1UL);
+		return sbi_send_ipi_broadcast();
 
 	cpumask_copy(&tmp, mask);
 
-- 
2.47.0


