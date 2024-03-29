From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 29 Mar 2024 17:26:17 +0800
Subject: [PATCH RFC 01/11] dt-bindings: riscv: Add Sdtrig ISA extension
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
Message-ID: <20240329-dev-maxh-lin-452-6-9-v1-1-1534f93b94a7@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

As riscv-debug-spec [1] Chapter 5 introduce Sdtrig extension.

Add an entry for the Sdtrig extension to the riscv,isa-extensions property.

Link: https://github.com/riscv/riscv-debug-spec/releases/download/ar20231208/riscv-debug-stable.pdf [1]
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 468c646247aa..47d82cd35ca7 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -121,6 +121,13 @@ properties:
             version of the privileged ISA specification.
 
         # multi-letter extensions, sorted alphanumerically
+        - const: sdtrig
+          description: |
+            The standard Sdtrig extension for introduce trigger CSRs for
+            cause a breakpoint exception, entry into Debug Mode,
+            or trace action as frozen at commit 359bedc ("Freeze Candidate")
+            of riscv-debug-spec
+
         - const: smaia
           description: |
             The standard Smaia supervisor-level extension for the advanced

-- 
2.43.2


