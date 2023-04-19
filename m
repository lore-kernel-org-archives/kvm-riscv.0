From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:02 -0700
Subject: [RFC 34/48] RISC-V: KVM: Initialize CoVE
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-35-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

CoVE initialization depends on few underlying conditions that differs
from normal VMs.

1. RFENCE extension is no longer mandatory as TEEH APIs has its own set
of fence APIs.
2. SBI NACL is mandatory for TEE VMs to share memory between the host
and the TSM.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 842b78d..a059414 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -102,15 +102,12 @@ static int __init riscv_kvm_init(void)
 		return -ENODEV;
 	}
 
-	if (sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
-		kvm_info("require SBI RFENCE extension\n");
-		return -ENODEV;
-	}
-
 	rc = kvm_riscv_nacl_init();
 	if (rc && rc != -ENODEV)
 		return rc;
 
+	kvm_riscv_cove_init();
+
 	kvm_riscv_gstage_mode_detect();
 
 	kvm_riscv_gstage_vmid_detect();
@@ -121,6 +118,15 @@ static int __init riscv_kvm_init(void)
 		return rc;
 	}
 
+	/* TVM don't need RFENCE extension as hardware imsic support is mandatory for TVMs
+	 * TODO: This check should happen later if HW_ACCEL mode is not set as RFENCE
+	 * should only be mandatory in that case.
+	 */
+	if (!kvm_riscv_cove_enabled() && sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
+		kvm_info("require SBI RFENCE extension\n");
+		return -ENODEV;
+	}
+
 	kvm_info("hypervisor extension available\n");
 
 	if (kvm_riscv_nacl_available()) {
-- 
2.25.1


