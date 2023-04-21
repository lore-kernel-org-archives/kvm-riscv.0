From: Vipin Sharma <vipinsh@google.com>
Date: Fri, 21 Apr 2023 09:53:05 -0700
Subject: [PATCH 9/9] KVM: arm64: Run clear-dirty-log under MMU read lock
In-Reply-To: <20230421165305.804301-1-vipinsh@google.com>
References: <20230421165305.804301-1-vipinsh@google.com>
Message-ID: <20230421165305.804301-10-vipinsh@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Take MMU read lock for write protecting PTEs and use shared page table
walker for clearing dirty logs.

Clearing dirty logs are currently performed under MMU write locks. This
means vCPUs write protection fault, which also take MMU read lock,  will
be blocked during this operation. This causes guest degradation and
especially noticeable on VMs with lot of vCPUs.

Taking MMU read lock will allow vCPUs to execute parallelly and reduces
the impact on vCPUs performance.

Tested improvement on a ARM Ampere Altra host (64 CPUs, 256 GB
memory and single NUMA node) via dirty_log_perf_test for 48 vCPU, 96
GB memory, 8GB clear chunk size, 1 second wait between Clear-Dirty-Log
calls and configuration:

Test command:
./dirty_log_perf_test -s anonymous_hugetlb_2mb -b 2G -v 48 -l 1 -k 8G -j -m 2

Before:
Total pages touched: 50331648 (Reads: 0, Writes: 50331648)

After:
Total pages touched: 125304832 (Reads: 0, Writes: 125304832)

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 arch/arm64/kvm/mmu.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index e0189cdda43d..3f2117d93998 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -67,8 +67,12 @@ static int stage2_apply_range(struct kvm_s2_mmu *mmu, phys_addr_t addr,
 		if (ret)
 			break;
 
-		if (resched && next != end)
-			cond_resched_rwlock_write(&kvm->mmu_lock);
+		if (resched && next != end) {
+			if (flags & KVM_PGTABLE_WALK_SHARED)
+				cond_resched_rwlock_read(&kvm->mmu_lock);
+			else
+				cond_resched_rwlock_write(&kvm->mmu_lock);
+		}
 	} while (addr = next, addr != end);
 
 	return ret;
@@ -994,7 +998,7 @@ static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
 	phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
 	phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
 
-	stage2_wp_range(&kvm->arch.mmu, start, end, 0);
+	stage2_wp_range(&kvm->arch.mmu, start, end, KVM_PGTABLE_WALK_SHARED);
 }
 
 /*
@@ -1008,9 +1012,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 		struct kvm_memory_slot *slot,
 		gfn_t gfn_offset, unsigned long mask)
 {
-	write_lock(&kvm->mmu_lock);
+	read_lock(&kvm->mmu_lock);
 	kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
-	write_unlock(&kvm->mmu_lock);
+	read_unlock(&kvm->mmu_lock);
 }
 
 static void kvm_send_hwpoison_signal(unsigned long address, short lsb)
-- 
2.40.0.634.g4ca3ef3211-goog


