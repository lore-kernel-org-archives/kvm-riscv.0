From: Anup Patel <apatel@ventanamicro.com>
Date: Tue,  8 Nov 2022 17:25:43 +0530
Subject: [PATCH] RISC-V: KVM: Exit run-loop immediately if xfer_to_guest fails
Message-ID: <20221108115543.1425199-1-apatel@ventanamicro.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If xfer_to_guest_mode_handle_work() fails in the run-loop then exit
the run-loop immediately instead of doing it after some more work.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 71ebbc4821f0..17d5b3f8c2ee 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -984,8 +984,9 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	while (ret > 0) {
 		/* Check conditions before entering the guest */
 		ret = xfer_to_guest_mode_handle_work(vcpu);
-		if (!ret)
-			ret = 1;
+		if (ret)
+			continue;
+		ret = 1;
 
 		kvm_riscv_gstage_vmid_update(vcpu);
 
-- 
2.34.1


