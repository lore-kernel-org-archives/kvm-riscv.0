From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 14:43:57 -0700
Subject: [PATCH v12 15/17] riscv: Add V extension to KVM ISA allow list
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
Message-ID: <20220921214439.1491510-15-stillson@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Vincent Chen <vincent.chen@sifive.com>

Add V extension to KVM_RISCV_ISA_ALLOWED list to enable VCPU
to support V extension.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 6f59ec64175e..b242ed155262 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -35,6 +35,7 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_m		('m' - 'a')
 #define RISCV_ISA_EXT_s		('s' - 'a')
 #define RISCV_ISA_EXT_u		('u' - 'a')
+#define RISCV_ISA_EXT_v		('v' - 'a')
 
 /*
  * Increse this to higher value as kernel support more ISA extensions.
-- 
2.25.1


