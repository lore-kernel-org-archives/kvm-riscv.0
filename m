From: Clément Léger <cleger@rivosinc.com>
Date: Wed, 19 Jun 2024 17:39:08 +0200
Subject: [PATCH 1/5] dt-bindings: riscv: add Zaamo and Zalrsc ISA extension description
In-Reply-To: <20240619153913.867263-1-cleger@rivosinc.com>
References: <20240619153913.867263-1-cleger@rivosinc.com>
Message-ID: <20240619153913.867263-2-cleger@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add description for the Zaamo and Zalrsc ISA extension[1].

Link: https://github.com/riscv/riscv-zaamo-zalrsc [1]
Signed-off-by: Cl?ment L?ger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 33f1a86efed8..982684e4daa1 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -171,12 +171,24 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: zaamo
+          description: |
+            The standard Zaamo extension for atomic memory operations as
+            ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
+            (#1304)") of the unprivileged ISA specification.
+
         - const: zacas
           description: |
             The Zacas extension for Atomic Compare-and-Swap (CAS) instructions
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zalrsc
+          description: |
+            The standard Zalrsc extension for load-reserved/store-conditional as
+            ratified at commit e87412e621f1 ("integrate Zaamo and Zalrsc text
+            (#1304)") of the unprivileged ISA specification.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
@@ -591,6 +603,13 @@ properties:
         then:
           contains:
             const: zca
+      # Zacas depends on Zaamo
+      - if:
+          contains:
+            const: zacas
+        then:
+          contains:
+            const: zaamo
 
 allOf:
   # Zcf extension does not exist on rv64
-- 
2.45.2


