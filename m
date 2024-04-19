From: Andrew Jones <ajones@ventanamicro.com>
Date: Fri, 19 Apr 2024 15:53:24 +0200
Subject: [PATCH v2 2/6] dt-bindings: riscv: Add Zawrs ISA extension description
In-Reply-To: <20240419135321.70781-8-ajones@ventanamicro.com>
References: <20240419135321.70781-8-ajones@ventanamicro.com>
Message-ID: <20240419135321.70781-10-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add description for the Zawrs (Wait-on-Reservation-Set) ISA extension
which was ratified in commit 98918c844281 of riscv-isa-manual.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../devicetree/bindings/riscv/extensions.yaml        | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..584da2f539e5 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -177,6 +177,18 @@ properties:
             is supported as ratified at commit 5059e0ca641c ("update to
             ratified") of the riscv-zacas.
 
+        - const: zawrs
+          description: |
+            The Zawrs extension for entering a low-power state or for trapping
+            to a hypervisor while waiting on a store to a memory location, as
+            ratified in commit 98918c844281 ("Merge pull request #1217 from
+            riscv/zawrs") of riscv-isa-manual. Linux assumes that WRS.NTO will
+            either always eventually terminate the stall due to the reservation
+            set becoming invalid, implementation-specific other reasons, or
+            because a higher privilege level has configured it to cause an
+            illegal instruction exception after an implementation-specific
+            bounded time limit.
+
         - const: zba
           description: |
             The standard Zba bit-manipulation extension for address generation
-- 
2.44.0


