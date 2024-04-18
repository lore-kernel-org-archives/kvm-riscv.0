From: Clément Léger <cleger@rivosinc.com>
Date: Thu, 18 Apr 2024 14:42:26 +0200
Subject: [PATCH v2 03/12] dt-bindings: riscv: add Zc* extension rules implied by C extension
In-Reply-To: <20240418124300.1387978-1-cleger@rivosinc.com>
References: <20240418124300.1387978-1-cleger@rivosinc.com>
Message-ID: <20240418124300.1387978-4-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As stated by Zc* spec:

"As C defines the same instructions as Zca, Zcf and Zcd, the rule is that:
 - C always implies Zca
 - C+F implies Zcf (RV32 only)
 - C+D implies Zcd"

Add additionnal validation rules to enforce this in dts.

Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       |  8 +++--
 .../devicetree/bindings/riscv/extensions.yaml | 34 +++++++++++++++++++
 2 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..c4e2c65437b1 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -168,7 +168,7 @@ examples:
                 i-cache-size = <16384>;
                 reg = <0>;
                 riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "c";
+                riscv,isa-extensions = "i", "m", "a", "c", "zca";
 
                 cpu_intc0: interrupt-controller {
                         #interrupt-cells = <1>;
@@ -194,7 +194,8 @@ examples:
                 reg = <1>;
                 tlb-split;
                 riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+                riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca",
+                                       "zcd";
 
                 cpu_intc1: interrupt-controller {
                         #interrupt-cells = <1>;
@@ -215,7 +216,8 @@ examples:
                 compatible = "riscv";
                 mmu-type = "riscv,sv48";
                 riscv,isa-base = "rv64i";
-                riscv,isa-extensions = "i", "m", "a", "f", "d", "c";
+                riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zca",
+                                       "zcd";
 
                 interrupt-controller {
                         #interrupt-cells = <1>;
diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index db7daf22b863..0172cbaa13ca 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -549,6 +549,23 @@ properties:
                 const: zca
             - contains:
                 const: f
+      # C extension implies Zca
+      - if:
+          contains:
+            const: c
+        then:
+          contains:
+            const: zca
+      # C extension implies Zcd if d
+      - if:
+          allOf:
+            - contains:
+                const: c
+            - contains:
+                const: d
+        then:
+          contains:
+            const: zcd
 
 allOf:
   # Zcf extension does not exists on rv64
@@ -566,6 +583,23 @@ allOf:
           not:
             contains:
               const: zcf
+  # C extension implies Zcf if f on rv32 only
+  - if:
+      properties:
+        riscv,isa-extensions:
+          allOf:
+            - contains:
+                const: c
+            - contains:
+                const: f
+        riscv,isa-base:
+          contains:
+            const: rv32i
+    then:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zcf
 
 additionalProperties: true
 ...
-- 
2.43.0


