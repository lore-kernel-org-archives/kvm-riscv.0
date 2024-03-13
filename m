From: cem@kernel.org <cem@kernel.org>
Date: Wed, 13 Mar 2024 22:50:52 +0100
Subject: [PATCH V4 1/6] riscv: Add a wrapper to call sbi_ecall for base extension
In-Reply-To: <20240313215106.325766-1-cem@kernel.org>
References: <20240313215106.325766-1-cem@kernel.org>
Message-ID: <20240313215106.325766-2-cem@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Carlos Maiolino <cem@kernel.org>

All SBI extension functions accepts at most one argument, so create a
wrapper around sbi_ecall() to avoid needing to pass in arguments 1 to 5
all the time, also, the wrapper can specify SBI_EXT_BASE directly.

Signed-off-by: Carlos Maiolino <cmaiolino@redhat.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

---
V4:
	- Remove stray blank line
V3:
	- Move to the beginning of the series
	- Don't mark __base_sbi_ecall() as inline
V2:
	- This patch was introduced in V2

 riscv/sbi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index ffb07a25..76b72a80 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -14,6 +14,11 @@ static void help(void)
 	puts("An environ must be provided where expected values are given.\n");
 }
 
+static struct sbiret __base_sbi_ecall(int fid, unsigned long arg0)
+{
+	return sbi_ecall(SBI_EXT_BASE, fid, arg0, 0, 0, 0, 0, 0);
+}
+
 int main(int argc, char **argv)
 {
 	struct sbiret ret;
@@ -32,7 +37,7 @@ int main(int argc, char **argv)
 	}
 	expected = strtol(getenv("MVENDORID"), NULL, 0);
 
-	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_GET_MVENDORID, 0, 0, 0, 0, 0, 0);
+	ret = __base_sbi_ecall(SBI_EXT_BASE_GET_MVENDORID, 0);
 	report(!ret.error, "mvendorid: no error");
 	report(ret.value == expected, "mvendorid");
 
-- 
2.44.0


