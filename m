From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 12 Aug 2024 16:13:56 +0200
Subject: [kvm-unit-tests PATCH 1/4] riscv: sbi: dbcn: Output return values
In-Reply-To: <20240812141354.119889-6-andrew.jones@linux.dev>
References: <20240812141354.119889-6-andrew.jones@linux.dev>
Message-ID: <20240812141354.119889-7-andrew.jones@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When a test fails its nice to be able to see exactly what error code
it failed with in order to immediately start debug.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 93a79d8095f5..2393929b965d 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -299,7 +299,7 @@ static void check_dbcn(void)
 		num_calls++;
 	} while (num_bytes != 0 && ret.error == SBI_SUCCESS);
 
-	report(ret.error == SBI_SUCCESS, "write success");
+	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
 	report_info("%d sbi calls made", num_calls);
 
 	/* Bytes are read from memory and written to the console */
@@ -307,7 +307,7 @@ static void check_dbcn(void)
 		paddr = strtoull(getenv("INVALID_ADDR"), NULL, 0);
 		split_phys_addr(paddr, &base_addr_hi, &base_addr_lo);
 		ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE, 1, base_addr_lo, base_addr_hi);
-		report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address");
+		report(ret.error == SBI_ERR_INVALID_PARAM, "invalid parameter: address (error=%ld)", ret.error);
 	}
 
 	report_prefix_pop();
@@ -317,8 +317,8 @@ static void check_dbcn(void)
 	puts("DBCN_WRITE TEST CHAR: ");
 	ret = __dbcn_sbi_ecall(SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, (u8)DBCN_WRITE_BYTE_TEST_BYTE, 0, 0);
 	puts("\n");
-	report(ret.error == SBI_SUCCESS, "write success");
-	report(ret.value == 0, "expected ret.value");
+	report(ret.error == SBI_SUCCESS, "write success (error=%ld)", ret.error);
+	report(ret.value == 0, "expected ret.value (%ld)", ret.value);
 
 	report_prefix_pop();
 }
-- 
2.45.2


