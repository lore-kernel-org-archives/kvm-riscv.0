From: Vincent Chen <vincent.chen@sifive.com>
Date: Wed, 15 Sep 2021 17:34:02 +0800
Subject: [PATCH] riscv: plic: Clear the associated bit of irq_claimed when
 writing CLAIM
Message-ID: <1631698442-756-1-git-send-email-vincent.chen@sifive.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

When an IRQ number is written to the claim register, it means this IRQ
has been addressed. If this interrupt is still pending, PLIC should
clear the associated bit of irq_claimed to allow this interrupt to
be claimed again.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 riscv/plic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/riscv/plic.c b/riscv/plic.c
index 07cadc7..d677bbf 100644
--- a/riscv/plic.c
+++ b/riscv/plic.c
@@ -394,6 +394,9 @@ static void plic__context_write(struct plic_state *s,
 			irq_update = true;
 		break;
 	case CONTEXT_CLAIM:
+		val = ioport__read32(data);
+		if (val < plic.num_irq)
+			c->irq_claimed[val / 32] &= ~(1 << (val % 32));
 		break;
 	default:
 		irq_update = true;
-- 
2.32.0


