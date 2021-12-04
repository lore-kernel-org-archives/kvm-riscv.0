From: Atish Patra <atishp@atishpatra.org>
Date: Fri,  3 Dec 2021 16:20:34 -0800
Subject: [RFC 2/6] RISC-V: Do not print the SBI version during HSM extension
 boot print
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
Message-ID: <20211204002038.113653-3-atishp@atishpatra.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Atish Patra <atishp@rivosinc.com>

The HSM extension information log also prints the SBI version v0.2. This
is misleading as the underlying firmware SBI version may be different
from v0.2.

Remove the unncessary printing of SBI version.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpu_ops.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 1985884fe829..3f5a38b03044 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -38,7 +38,7 @@ void __init cpu_set_ops(int cpuid)
 #if IS_ENABLED(CONFIG_RISCV_SBI)
 	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
 		if (!cpuid)
-			pr_info("SBI v0.2 HSM extension detected\n");
+			pr_info("SBI HSM extension detected\n");
 		cpu_ops[cpuid] = &cpu_ops_sbi;
 	} else
 #endif
-- 
2.33.1


