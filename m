From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 16 Feb 2024 16:57:28 -0800
Subject: [PATCH RFC 10/20] dt-bindings: riscv: add Smcntrpmf ISA extension description
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
Message-ID: <20240217005738.3744121-11-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the description for Smcntrpmf ISA extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 15adeb60441b..149ecf2a8af3 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -135,6 +135,13 @@ properties:
 	    directlyi accessible in the supervisor mode. This extension depend
 	    on Sscsrind, Zihpm, Zicntr extensions.
 
+	- const: smcntrpmf
+	  description: |
+	    The standard Smcntrpmf supervisor-level extension for the machine mode
+	    to enable privilege mode filtering for cycle and instret counters.
+	    The Ssccfg extension depends on this as *cfg CSRs are available only
+	    if smcntrpmf is present.
+
         - const: smstateen
           description: |
             The standard Smstateen extension for controlling access to CSRs
-- 
2.34.1


