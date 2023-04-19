From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:47 -0700
Subject: [RFC kvmtool 07/10] riscv: Define riscv specific vm_type function
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-8-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

RISC-V supports CoVE VMs now. It needs to setup correct VM type if the
user requests it.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 riscv/kvm.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/riscv/kvm.c b/riscv/kvm.c
index 5f9b0d5..e728790 100644
--- a/riscv/kvm.c
+++ b/riscv/kvm.c
@@ -39,6 +39,18 @@ u64 kvm__arch_default_ram_address(void)
 	return RISCV_RAM;
 }
 
+int kvm__get_vm_type(struct kvm *kvm)
+{
+	if (kvm->cfg.arch.cove_vm) {
+		if (__riscv_xlen == 64)
+			return KVM_VM_TYPE_RISCV_COVE;
+		else
+			die("CoVE VM is not supported in RV32\n");
+	} else {
+		return KVM_VM_TYPE;
+	}
+}
+
 void kvm__arch_validate_cfg(struct kvm *kvm)
 {
 }
-- 
2.25.1


