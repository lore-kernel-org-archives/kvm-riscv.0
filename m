From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 29 Oct 2024 16:55:39 +0800
Subject: [PATCH v2 1/1] RISC-V: KVM: Fix APLIC in_clrip and clripnum write emulation
Message-ID: <20241029085542.30541-1-yongxuan.wang@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In the section "4.7 Precise effects on interrupt-pending bits"
of the RISC-V AIA specification defines that:

"If the source mode is Level1 or Level0 and the interrupt domain
is configured in MSI delivery mode (domaincfg.DM = 1):
The pending bit is cleared whenever the rectified input value is
low, when the interrupt is forwarded by MSI, or by a relevant
write to an in_clrip register or to clripnum."

Update the aplic_write_pending() to match the spec.

Fixes: d8dd9f113e16 ("RISC-V: KVM: Fix APLIC setipnum_le/be write emulation")
Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Reviewed-by: Vincent Chen <vincent.chen@sifive.com>
---
v2;
- add fixes tag (Anup)
- follow the suggestion from Anup
---
 arch/riscv/kvm/aia_aplic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_aplic.c b/arch/riscv/kvm/aia_aplic.c
index da6ff1bade0d..f59d1c0c8c43 100644
--- a/arch/riscv/kvm/aia_aplic.c
+++ b/arch/riscv/kvm/aia_aplic.c
@@ -143,7 +143,7 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
 	if (sm == APLIC_SOURCECFG_SM_LEVEL_HIGH ||
 	    sm == APLIC_SOURCECFG_SM_LEVEL_LOW) {
 		if (!pending)
-			goto skip_write_pending;
+			goto noskip_write_pending;
 		if ((irqd->state & APLIC_IRQ_STATE_INPUT) &&
 		    sm == APLIC_SOURCECFG_SM_LEVEL_LOW)
 			goto skip_write_pending;
@@ -152,6 +152,7 @@ static void aplic_write_pending(struct aplic *aplic, u32 irq, bool pending)
 			goto skip_write_pending;
 	}
 
+noskip_write_pending:
 	if (pending)
 		irqd->state |= APLIC_IRQ_STATE_PENDING;
 	else
-- 
2.17.1


