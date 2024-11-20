From: Max Hsu <max.hsu@sifive.com>
Date: Wed, 20 Nov 2024 22:09:32 +0800
Subject: [PATCH RFC v3 1/3] dt-bindings: riscv: Add Svukte entry
In-Reply-To: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
References: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
Message-ID: <20241120-dev-maxh-svukte-v3-v3-1-1e533d41ae15@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add an entry for the Svukte extension to the riscv,isa-extensions
property.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index af7e5237b2c03085611daad9e1e39aa93cc8ae95..bf177274b5c6f4cd1c842b4221ca5bbfc2960a0a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -189,6 +189,15 @@ properties:
             memory types as ratified in the 20191213 version of the privileged
             ISA specification.
 
+        - const: svukte
+          description:
+            The standard Svukte supervisor-level extension for making user-mode
+            accesses to supervisor memory raise page faults in constant time,
+            mitigating attacks that attempt to discover the supervisor
+            software's address-space layout. Currently under review as Pull
+            Request number 1564 at commit 81dc9277 ("Svukte v0.3") of
+            riscv-isa-manual.
+
         - const: svvptc
           description:
             The standard Svvptc supervisor-level extension for

-- 
2.43.2


