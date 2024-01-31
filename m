From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jan 2024 13:05:14 +0100
Subject: [PATCH 2/3] RISC-V: paravirt: Use correct restricted types
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
Message-ID: <20240131120511.200338-7-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

__le32 and __le64 types should be used with le32_to_cpu() and
le64_to_cpu(), as sparse helpfully points out.

Fixes: fdf68acccfc6 ("RISC-V: paravirt: Implement steal-time support")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401011933.hL9zqmKo-lkp at intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 15c5d4048db5..0d6225fd3194 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -91,8 +91,8 @@ static int pv_time_cpu_down_prepare(unsigned int cpu)
 static u64 pv_time_steal_clock(int cpu)
 {
 	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
-	u32 sequence;
-	u64 steal;
+	__le32 sequence;
+	__le64 steal;
 
 	/*
 	 * Check the sequence field before and after reading the steal
-- 
2.43.0


