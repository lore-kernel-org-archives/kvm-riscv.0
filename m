From: Andrew Jones <andrew.jones@linux.dev>
Date: Fri, 30 Aug 2024 17:53:40 +0200
Subject: [kvm-unit-tests PATCH 2/2] sbi: dbcn: Add write-byte test with more than byte given
In-Reply-To: <20240830155337.335534-4-andrew.jones@linux.dev>
References: <20240830155337.335534-4-andrew.jones@linux.dev>
Message-ID: <20240830155337.335534-6-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Try the write-byte function, but with a word full of characters. We
should still get 'a' since that's in the least-significant byte.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 907bfbe5bb69..a1c97b93cdd0 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -407,12 +407,18 @@ static void check_dbcn(void)
 	report_prefix_pop();
 	report_prefix_push("write_byte");
 
-	puts("DBCN_WRITE TEST CHAR: ");
+	puts("DBCN_WRITE_BYTE TEST BYTE: ");
 	ret = sbi_dbcn_write_byte(DBCN_WRITE_BYTE_TEST_BYTE);
 	puts("\n");
 	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
 	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
 
+	puts("DBCN_WRITE_BYTE TEST WORD: "); /* still expect 'a' in the output */
+	ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, 0x64636261, 0, 0, 0, 0, 0);
+	puts("\n");
+	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
+	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
+
 	report_prefix_pop();
 	report_prefix_pop();
 }
-- 
2.45.2


