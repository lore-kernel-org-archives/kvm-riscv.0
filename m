From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:17:01 -0700
Subject: [RFC 33/48] RISC-V: KVM: Hookup TVM VCPU init/destroy
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-34-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TVM VCPU create function requires the vcpu id which is generated
after the arch_create_vcpu returns. Thus, TVM vcpu init can not be
invoked from the arch_create_vcpu. Invoke it in post create for now.
However, post create doesn't return any error which is problematic
as vcpu creation can fail from TSM side.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 65f87e1..005c7c9 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -218,6 +218,17 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 {
+	int rc;
+	/*
+	 * TODO: Ideally it should be invoked in vcpu_create. but vcpu_idx
+	 * is allocated after returning create_vcpu. Find a better place to do it
+	 */
+	if (unlikely(is_cove_vcpu(vcpu))) {
+		rc = kvm_riscv_cove_vcpu_init(vcpu);
+		if (rc)
+			pr_err("%s: cove vcpu init failed %d\n", __func__, rc);
+	}
+
 	/**
 	 * vcpu with id 0 is the designated boot cpu.
 	 * Keep all vcpus with non-zero id in power-off state so that
@@ -237,6 +248,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_pmu_deinit(vcpu);
 
+	if (unlikely(is_cove_vcpu(vcpu)))
+		kvm_riscv_cove_vcpu_destroy(vcpu);
+
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
 }
-- 
2.25.1


