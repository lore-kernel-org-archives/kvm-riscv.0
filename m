From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Mon, 15 Apr 2024 14:49:04 +0800
Subject: [PATCH 1/1] RISC-V: KVM: No need to use mask when hart-index-bit is 0
Message-ID: <20240415064905.25184-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When the maximum hart number within groups is 1, hart-index-bit is set to
0. Consequently, there is no need to restore the hart ID from IMSIC
addresses and hart-index-bit settings. Currently, QEMU and kvmtool do not
pass correct hart-index-bit values when the maximum hart number is a
power of 2, thereby avoiding this issue. Corresponding patches for QEMU
and kvmtool will also be dispatched.

Fixes: 89d01306e34d ("RISC-V: KVM: Implement device interface for AIA irqchip")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
---
 arch/riscv/kvm/aia_device.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 0eb689351b7d..5cd407c6a8e4 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -237,10 +237,11 @@ static gpa_t aia_imsic_ppn(struct kvm_aia *aia, gpa_t addr)
 
 static u32 aia_imsic_hart_index(struct kvm_aia *aia, gpa_t addr)
 {
-	u32 hart, group = 0;
+	u32 hart = 0, group = 0;
 
-	hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
-		GENMASK_ULL(aia->nr_hart_bits - 1, 0);
+	if (aia->nr_hart_bits)
+		hart = (addr >> (aia->nr_guest_bits + IMSIC_MMIO_PAGE_SHIFT)) &
+		       GENMASK_ULL(aia->nr_hart_bits - 1, 0);
 	if (aia->nr_group_bits)
 		group = (addr >> aia->nr_group_shift) &
 			GENMASK_ULL(aia->nr_group_bits - 1, 0);
-- 
2.17.1


