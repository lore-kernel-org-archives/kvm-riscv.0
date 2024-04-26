From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 26 Apr 2024 12:08:22 +0200
Subject: [PATCH v3 2/6] dt-bindings: riscv: Add Zawrs ISA extension description
In-Reply-To: <20240426100820.14762-8-ajones@ventanamicro.com>
References: <20240426100820.14762-8-ajones@ventanamicro.com>
Message-ID: <20240426100820.14762-10-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
which was ratified in commit 98918c844281 of riscv-isa-manual.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..8594e7c33ea2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -177,6 +177,13 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zawrs
+          description: |
+            The Zawrs extension for entering a low-power state or for trapping
+            to a hypervisor while waiting on a store to a memory location, as
+            ratified in commit 98918c844281 ("Merge pull request #1217 from
+            riscv/zawrs") of riscv-isa-manual.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.44.0


