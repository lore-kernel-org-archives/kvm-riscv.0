From: Mayuresh Chitale <mchitale@ventanamicro.com>
Date: Fri, 21 Jul 2023 13:24:34 +0530
Subject: [PATCH v2 1/6] RISC-V: Detect Smstateen extension
In-Reply-To: <20230721075439.454473-1-mchitale@ventanamicro.com>
References: <20230721075439.454473-1-mchitale@ventanamicro.com>
Message-ID: <20230721075439.454473-2-mchitale@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Extend the ISA string parsing to detect the Smstateen extension

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 arch/riscv/include/asm/hwcap.h                          | 1 +
 arch/riscv/kernel/cpu.c                                 | 1 +
 arch/riscv/kernel/cpufeature.c                          | 1 +
 4 files changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..1e6d0e182be1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smstateen
+          description: |
+            The standard Smstateen extension for controlling accesss to CSRs
+            added by other Risc-V extensions in H/S/VS/U/VU modes and as
+            ratified at commit a28bfae (Ratified (#7)).
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f041bfa7f6a0..fad1fd1fcd05 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -53,6 +53,7 @@
 #define RISCV_ISA_EXT_ZICSR		40
 #define RISCV_ISA_EXT_ZIFENCEI		41
 #define RISCV_ISA_EXT_ZIHPM		42
+#define RISCV_ISA_EXT_SMSTATEEN		43
 
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index a2fc952318e9..fb0df651bc48 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -217,6 +217,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
+	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..ddca31160637 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -301,6 +301,7 @@ void __init riscv_fill_hwcap(void)
 			} else {
 				/* sorted alphabetically */
 				SET_ISA_EXT_MAP("smaia", RISCV_ISA_EXT_SMAIA);
+				SET_ISA_EXT_MAP("smstateen", RISCV_ISA_EXT_SMSTATEEN);
 				SET_ISA_EXT_MAP("ssaia", RISCV_ISA_EXT_SSAIA);
 				SET_ISA_EXT_MAP("sscofpmf", RISCV_ISA_EXT_SSCOFPMF);
 				SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
-- 
2.34.1


