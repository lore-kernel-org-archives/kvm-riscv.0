From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 31 Jan 2024 13:05:15 +0100
Subject: [PATCH 3/3] RISC-V: KVM: Use correct restricted types
In-Reply-To: <20240131120511.200338-5-ajones@ventanamicro.com>
References: <20240131120511.200338-5-ajones@ventanamicro.com>
Message-ID: <20240131120511.200338-8-ajones@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

__le32 and __le64 types should be used with le32_to_cpu() and
le64_to_cpu() and __user is needed for pointers referencing
guest memory, as sparse helpfully points out.

Fixes: e9f12b5fff8a ("RISC-V: KVM: Implement SBI STA extension")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202401020142.lwFEDK5v-lkp at intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu_sbi_sta.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
index 01f09fe8c3b0..d8cf9ca28c61 100644
--- a/arch/riscv/kvm/vcpu_sbi_sta.c
+++ b/arch/riscv/kvm/vcpu_sbi_sta.c
@@ -26,8 +26,12 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 {
 	gpa_t shmem = vcpu->arch.sta.shmem;
 	u64 last_steal = vcpu->arch.sta.last_steal;
-	u32 *sequence_ptr, sequence;
-	u64 *steal_ptr, steal;
+	__le32 __user *sequence_ptr;
+	__le64 __user *steal_ptr;
+	__le32 sequence_le;
+	__le64 steal_le;
+	u32 sequence;
+	u64 steal;
 	unsigned long hva;
 	gfn_t gfn;
 
@@ -47,22 +51,22 @@ void kvm_riscv_vcpu_record_steal_time(struct kvm_vcpu *vcpu)
 		return;
 	}
 
-	sequence_ptr = (u32 *)(hva + offset_in_page(shmem) +
+	sequence_ptr = (__le32 __user *)(hva + offset_in_page(shmem) +
 			       offsetof(struct sbi_sta_struct, sequence));
-	steal_ptr = (u64 *)(hva + offset_in_page(shmem) +
+	steal_ptr = (__le64 __user *)(hva + offset_in_page(shmem) +
 			    offsetof(struct sbi_sta_struct, steal));
 
-	if (WARN_ON(get_user(sequence, sequence_ptr)))
+	if (WARN_ON(get_user(sequence_le, sequence_ptr)))
 		return;
 
-	sequence = le32_to_cpu(sequence);
+	sequence = le32_to_cpu(sequence_le);
 	sequence += 1;
 
 	if (WARN_ON(put_user(cpu_to_le32(sequence), sequence_ptr)))
 		return;
 
-	if (!WARN_ON(get_user(steal, steal_ptr))) {
-		steal = le64_to_cpu(steal);
+	if (!WARN_ON(get_user(steal_le, steal_ptr))) {
+		steal = le64_to_cpu(steal_le);
 		vcpu->arch.sta.last_steal = READ_ONCE(current->sched_info.run_delay);
 		steal += vcpu->arch.sta.last_steal - last_steal;
 		WARN_ON(put_user(cpu_to_le64(steal), steal_ptr));
-- 
2.43.0


