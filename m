From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 19 Apr 2023 15:16:50 -0700
Subject: [RFC 22/48] RISC-V: KVM: Implement vcpu load/put functions for CoVE guests
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
Message-ID: <20230419221716.3603068-23-atishp@rivosinc.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TSM takes care of most of the H extension CSR/fp save/restore
for any guest running in CoVE. It may choose to do the fp save/restore
lazily as well. The host has to do minimal operations such timer
save/restore and interrupt state restore during vcpu load/put.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/cove.c | 12 ++++++++++--
 arch/riscv/kvm/vcpu.c | 12 +++++++++++-
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/cove.c b/arch/riscv/kvm/cove.c
index 87fa04b..c93de9b 100644
--- a/arch/riscv/kvm/cove.c
+++ b/arch/riscv/kvm/cove.c
@@ -139,12 +139,20 @@ __always_inline bool kvm_riscv_cove_enabled(void)
 
 void kvm_riscv_cove_vcpu_load(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	kvm_riscv_vcpu_timer_restore(vcpu);
 }
 
 void kvm_riscv_cove_vcpu_put(struct kvm_vcpu *vcpu)
 {
-	/* TODO */
+	void *nshmem;
+	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
+
+	kvm_riscv_vcpu_timer_save(vcpu);
+	/* NACL is mandatory for CoVE */
+	nshmem = nacl_shmem();
+
+	/* Only VSIE needs to be read to manage the interrupt stuff */
+	csr->vsie = nacl_shmem_csr_read(nshmem, CSR_VSIE);
 }
 
 int kvm_riscv_cove_vcpu_sbi_ecall(struct kvm_vcpu *vcpu, struct kvm_run *run)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 8cf462c..3e04b78 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -972,6 +972,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	u64 henvcfg = kvm_riscv_vcpu_get_henvcfg(vcpu->arch.isa);
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_riscv_cove_vcpu_load(vcpu);
+		goto skip_load;
+	}
+
 	if (kvm_riscv_nacl_sync_csr_available()) {
 		nshmem = nacl_shmem();
 		nacl_shmem_csr_write(nshmem, CSR_VSSTATUS, csr->vsstatus);
@@ -1010,9 +1015,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
-
 	kvm_riscv_vcpu_aia_load(vcpu, cpu);
 
+skip_load:
 	vcpu->cpu = cpu;
 }
 
@@ -1023,6 +1028,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 
 	vcpu->cpu = -1;
 
+	if (is_cove_vcpu(vcpu)) {
+		kvm_riscv_cove_vcpu_put(vcpu);
+		return;
+	}
+
 	kvm_riscv_vcpu_aia_put(vcpu);
 
 	kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
-- 
2.25.1


