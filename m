From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:23:41 -0700
Subject: [RFC kvmtool 01/10] riscv: Add a CoVE VM type.
In-Reply-To: <20230419222350.3604274-1-atishp@rivosinc.com>
References: <20230419222350.3604274-1-atishp@rivosinc.com>
Message-ID: <20230419222350.3604274-2-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The KVM needs to distinguish if an user wants to create a CoVE VM instead
of a traditional VM. Define a RISC-V specific CoVE VM type that can be
passed as a VM type.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/kvm.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/kvm.h b/include/linux/kvm.h
index ba4c4b0..000d2b9 100644
--- a/include/linux/kvm.h
+++ b/include/linux/kvm.h
@@ -911,6 +911,8 @@ struct kvm_ppc_resize_hpt {
 #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK	0xffULL
 #define KVM_VM_TYPE_ARM_IPA_SIZE(x)		\
 	((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
+
+#define KVM_VM_TYPE_RISCV_COVE  (1UL << 9)
 /*
  * ioctls for /dev/kvm fds:
  */
-- 
2.25.1


