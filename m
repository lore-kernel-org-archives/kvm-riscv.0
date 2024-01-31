From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jan 2024 13:05:13 +0100
Subject: [PATCH 1/3] RISC-V: paravirt: steal_time should be static
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
Message-ID: <20240131120511.200338-6-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

steal_time is not used outside paravirt.c, make it static,
as sparse suggested.

Fixes: fdf68acccfc6 ("RISC-V: paravirt: Implement steal-time support")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 8e114f5930ce..15c5d4048db5 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -41,7 +41,7 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
-DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+static DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
 
 static bool __init has_pv_steal_clock(void)
 {
-- 
2.43.0


