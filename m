From: Jisheng Zhang <jszhang@kernel.org>
Date: Sun, 15 Jan 2023 23:49:43 +0800
Subject: [PATCH v4 03/13] riscv: cpufeature: detect RISCV_ALTERNATIVES_EARLY_BOOT earlier
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
Message-ID: <20230115154953.831-4-jszhang@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Currently riscv_cpufeature_patch_func() does nothing at the
RISCV_ALTERNATIVES_EARLY_BOOT stage. Add a check to detect whether we
are in this stage and exit early. This will allow us to use
riscv_cpufeature_patch_func() for scanning of all ISA extensions.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 421b3d9578cc..37e8c5e69754 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -328,6 +328,9 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	struct alt_entry *alt;
 	u32 tmp;
 
+	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
+		return;
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != 0)
 			continue;
-- 
2.38.1


