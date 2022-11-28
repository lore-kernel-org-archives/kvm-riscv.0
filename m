From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 28 Nov 2022 21:44:21 +0530
Subject: [PATCH 6/9] RISC-V: Export sbi_get_mvendorid() and friends
In-Reply-To: <20221128161424.608889-1-apatel@ventanamicro.com>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
Message-ID: <20221128161424.608889-7-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sbi_get_mvendorid(), sbi_get_marchid(), and sbi_get_mimpid()
can be used by KVM module so let us export these functions.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kernel/sbi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 775d3322b422..5c87db8fdff2 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -627,16 +627,19 @@ long sbi_get_mvendorid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MVENDORID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_mvendorid);
 
 long sbi_get_marchid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MARCHID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_marchid);
 
 long sbi_get_mimpid(void)
 {
 	return __sbi_base_ecall(SBI_EXT_BASE_GET_MIMPID);
 }
+EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
 static void sbi_send_cpumask_ipi(const struct cpumask *target)
 {
-- 
2.34.1


