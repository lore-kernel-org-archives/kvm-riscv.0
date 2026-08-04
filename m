Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211BBC55184
	for <kvm-riscv@archiver.kernel.org>; Tue,  4 Aug 2026 13:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:From:Message-Id:Cc:Mime-Version:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bp0BMzbMxSVdLU3MWM2T4bEDcaCQHmj6L2C/VX6mPtc=; b=kacAofh0cMOWfo
	+K86MZSTUkaPsw5niuuuj5a9QOgdPYasd7BaGzqeLYTCsyTQTjPPJETNN4e2qA1b5Mv7i6wzRwEI/
	HSg1PLJieejHsQn84hsEMYexsPxw1BzTfMQoUxLaY2U7j/J3Sb078VN0bqsoFqYOk8rXeMz7lpPR9
	X8cK4+uswe+R73uivvcfBydQGOUAR4lTuhFkGcPOufdSX2t7OPxbZflK21SIqtuUFLf2T00WqhYSX
	M7qZ/Ktibs7x5jU/V8JjgwpseEnDVCIbXDKolYxfjg4SLcaRVeXSf6Ma6R88NF6KZDkQ4BpLjJK28
	t4hNSd6zoRzw2j5q+ydg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFNk-00000001wtD-2nKp;
	Tue, 04 Aug 2026 13:40:36 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrFNg-00000001wru-1kCe
	for kvm-riscv@lists.infradead.org;
	Tue, 04 Aug 2026 13:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1785850823; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=AknMIQauPg1YOAClwSPeiL6pzYhNPDvCWZ6dNGeF+7w=;
 b=GpGvYJKhJkG/ZoXhVTlfJUX4JDAWye/Op0TGsFmrsGAmnOSHEsvYMxYPGEnTS4DQ6+Y1EC
 vGhync4QKaMrVoU7R6P+AG8GaxiSwHA+GVOuDN9rrvG5yEiSIF6u88Sgv2U4CoCslngE9k
 RBnwwCOejm6R98gegksWvYWeUxZN4qL7kz2jHPl0CP3k/XhctoekQe0E0gbERIjO5Nu6Ae
 HEmTRXKne0gJgYia61LJNcSqig8iWrSgFSpdZ0aSLEfFGJN5JLgysCx+8Y45P0RN4h/M2u
 lS+AAqjVmu5VdamV2m2QYwIgv3y8tsg+MpUgCVTACrJ1Jffv3CmWQDopPqKwGg==
To: <pjw@kernel.org>, <anup@brainfault.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>, 
	<kvm-riscv@lists.infradead.org>
Subject: [PATCH v2] RISC-V: KVM: Fix the conversion between vsip and hvip
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1
X-Lms-Return-Path: <lba+26a71ebc5+7518c5+lists.infradead.org+yang.yicong@picoheart.com>
Cc: <alex@ghiti.fr>, <atish.patra@linux.dev>, <geshijian@picoheart.com>, 
	<shenyang.young@picoheart.com>, <yang.yicong@picoheart.com>
Message-Id: <20260804134018.85497-1-yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Tue,  4 Aug 2026 21:40:18 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.106]) by smtp.feishu.cn with ESMTPS; Tue, 04 Aug 2026 21:40:20 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_064032_646000_845F4E0A 
X-CRM114-Status: GOOD (  11.69  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Per AIA spec 1.0 Section 6.3.2, the interrupt numbers 13-63
shares same bit position between related VS shadow CSRs and
hypervisor CSRs. So there's a shift only for SSI, STI and
SEI interrupt.

Currently the KVM always does a shift for all the interrupts
(include LCOFI with number 13) when doing the conversion
between vsip and hvip. Fix this by only doing shift the SSI,
STI and SEI. Add wrappers for doing the conversion between
vsip and hvip.

Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
Change since v1:
- rebase on -rc6 and fixed the conflict
- add fix tag since it fixes the LCOFI injection
Link: https://lore.kernel.org/linux-riscv/20260721141815.80677-1-yang.yicong@picoheart.com/

 arch/riscv/include/asm/csr.h       | 20 ++++++++++++++++----
 arch/riscv/kvm/vcpu.c              |  3 +--
 arch/riscv/kvm/vcpu_onereg.c       |  8 +++-----
 tools/arch/riscv/include/asm/csr.h | 20 ++++++++++++++++----
 4 files changed, 36 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index d806a979f595..7bfbda958f0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -184,12 +184,24 @@
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
-/* VSIP & HVIP relation */
+/*
+ * VSIP & HVIP relation
+ *
+ * The bit positions are same between VSIP and HVIP for interrupt
+ * numbers 13-63, where there's a shift for the SSI, STI and SEI.
+ */
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
-#define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
+#define VSIP_BIAS_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT) | \
-				 (_AC(1, UL) << IRQ_PMU_OVF))
+				 (_AC(1, UL) << IRQ_S_EXT))
+#define VSIP_NO_BIAS_MASK	(_AC(1, UL) << IRQ_PMU_OVF)
+#define VSIP_VALID_MASK		(VSIP_BIAS_MASK | VSIP_NO_BIAS_MASK)
+#define vsip_to_hvip(_vsip)	((((_vsip) & VSIP_BIAS_MASK) << \
+				  VSIP_TO_HVIP_SHIFT) | \
+				 ((_vsip) & VSIP_NO_BIAS_MASK))
+#define hvip_to_vsip(_hvip)	((((_hvip) >> VSIP_TO_HVIP_SHIFT) & \
+				  VSIP_BIAS_MASK) | \
+				 ((_hvip) & VSIP_NO_BIAS_MASK))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 977e36ab83d3..468918309dff 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -475,8 +475,7 @@ bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 	bool ret;
 
 	raw_spin_lock_irqsave(&vcpu->arch.irqs_pending_lock, flags);
-	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
+	ie = vsip_to_hvip(vcpu->arch.guest_csr.vsie) & (unsigned long)mask;
 	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
 		(unsigned long)mask;
 	ret = vcpu->arch.irqs_pending[0] & ie;
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 99b9107b1ac1..9fe829eed178 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -272,7 +272,7 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
-		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
+		*out_val = hvip_to_vsip(csr->hvip);
 		*out_val |= csr->hvip & ~IRQ_LOCAL_MASK;
 	} else
 		*out_val = ((unsigned long *)csr)[reg_num];
@@ -293,10 +293,8 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 
 	reg_num = array_index_nospec(reg_num, regs_max);
 
-	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
-		reg_val &= VSIP_VALID_MASK;
-		reg_val <<= VSIP_TO_HVIP_SHIFT;
-	}
+	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
+		reg_val = vsip_to_hvip(reg_val);
 
 	((unsigned long *)csr)[reg_num] = reg_val;
 
diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
index 21d8cee04638..8df64314d613 100644
--- a/tools/arch/riscv/include/asm/csr.h
+++ b/tools/arch/riscv/include/asm/csr.h
@@ -163,12 +163,24 @@
 #define HGATP_MODE_SHIFT	HGATP32_MODE_SHIFT
 #endif
 
-/* VSIP & HVIP relation */
+/*
+ * VSIP & HVIP relation
+ *
+ * The bit positions are same between VSIP and HVIP for interrupt
+ * numbers 13-63, where there's a shift for the SSI, STI and SEI.
+ */
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
-#define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
+#define VSIP_BIAS_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT) | \
-				 (_AC(1, UL) << IRQ_PMU_OVF))
+				 (_AC(1, UL) << IRQ_S_EXT))
+#define VSIP_NO_BIAS_MASK	(_AC(1, UL) << IRQ_PMU_OVF)
+#define VSIP_VALID_MASK		(VSIP_BIAS_MASK | VSIP_NO_BIAS_MASK)
+#define vsip_to_hvip(_vsip)	((((_vsip) & VSIP_BIAS_MASK) << \
+				  VSIP_TO_HVIP_SHIFT) | \
+				 ((_vsip) & VSIP_NO_BIAS_MASK))
+#define hvip_to_vsip(_hvip)	((((_hvip) >> VSIP_TO_HVIP_SHIFT) & \
+				  VSIP_BIAS_MASK) | \
+				 ((_hvip) & VSIP_NO_BIAS_MASK))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
-- 
2.50.1 (Apple Git-155)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
