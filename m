From: James Raphael Tiovalen <jamestiotio@gmail.com>
Date: Fri, 19 Jul 2024 10:39:45 +0800
Subject: [kvm-unit-tests PATCH v3 3/5] riscv: Add method to probe for SBI extensions
In-Reply-To: <20240719023947.112609-1-jamestiotio@gmail.com>
References: <20240719023947.112609-1-jamestiotio@gmail.com>
Message-ID: <20240719023947.112609-4-jamestiotio@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add a `sbi_probe` helper method that can be used by SBI extension tests
to check if a given extension is available.

Signed-off-by: James Raphael Tiovalen <jamestiotio@gmail.com>
---
 lib/riscv/asm/sbi.h |  1 +
 lib/riscv/sbi.c     | 10 ++++++++++
 2 files changed, 11 insertions(+)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index d82a384d..5e1a674a 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -49,6 +49,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 
 void sbi_shutdown(void);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
+long sbi_probe(int ext);
 
 #endif /* !__ASSEMBLY__ */
 #endif /* _ASMRISCV_SBI_H_ */
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index f39134c4..7d7d09c3 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -38,3 +38,13 @@ struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned
 {
 	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_START, hartid, entry, sp, 0, 0, 0);
 }
+
+long sbi_probe(int ext)
+{
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, ext, 0, 0, 0, 0, 0);
+	assert(!ret.error);
+
+	return ret.value;
+}
-- 
2.43.0


