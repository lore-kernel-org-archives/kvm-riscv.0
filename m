From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:47 -0700
Subject: [RFC 19/48] RISC-V: KVM: Register memory regions as confidential for TVMs
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-20-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The entire DRAM region of a TVM running in CoVE must be confidential by
default. If a TVM wishes to share any sub-region, the TVM has to
request it explicitly with memory share APIs.

Mark the memory region as confidential during vm create itself.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/mmu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 4b0f09e..63889d9 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -499,6 +499,11 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
 
 	mmap_read_lock(current->mm);
 
+	if (is_cove_vm(kvm)) {
+		ret = kvm_riscv_cove_vm_add_memreg(kvm, base_gpa, size);
+		if (ret)
+			return ret;
+	}
 	/*
 	 * A memory region could potentially cover multiple VMAs, and
 	 * any holes between them, so iterate over all of them to find
-- 
2.25.1


