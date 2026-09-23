Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B461C982EA
	for <kvm-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 08:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Cc:To:Mime-Version
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tt4Bd8ICcMC53O/wMoNqqZ7mmwGFwRZ9GRaeqzKenSI=; b=EmEbhEdLXYaXyg
	915zdq7N0mRzrdlea3bNKaCnS/fr5jziOhcg3j52Zud8oNDqF76RcFTGqnfbfV5fzhgaBQEMAi/Qk
	jghq1QIaiRnd+6oj3xDnNmlkRC3UZZ589j9JFmJ4yPqq+xzC7Gej7jIwRZQgzO8j/hygt9cTpGA3V
	3tNiFRYYtPZlM3i61G+WFnsvB1fPsFVzMdenXDOh39j8tgGx0/cuWeJeqF4qJxKUPUVSk0wa0mW3M
	OKirRpCNxm085KxK+3i5mzW0LV5erW6F5/jFD1ycysXV11S58JSJSgcf67V8thT3sHB2HY7a75vMq
	3nB9ylWcWOVAjdU2snfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Iml-00000007cyW-3eMG;
	Wed, 23 Sep 2026 08:57:03 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Imi-00000007cxZ-2llE
	for kvm-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 08:57:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1790153815;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=RjYsFA+LmVEfysjLvCalbDJ75mUBdBuLNBKFMkkYENE=;
 b=U1lhT1cQUMbf/1D1Hym24eK+0N7ZdaWruSnoniAi/+M+KHmSWDH+zbGp+srry/TapNArrk
 tHi+ZS6O09hFagSrxgzKzfFq5BmPiDqzc3mMycyYowRyhm8sQw2N5QHSB6gNMbE+SgnGp9
 csnCA2JbSz+EAKHiu6fEwqrLmmOm5OvUw2UCYYTBPNVxaPD+IdLGlHriUvUMP3vWu2UF/n
 rTlmbgZBNbt8boKRsNd83mHb/aHFeTpz7/ur3x8qGYE7xbG1MtFymYCnjwyJ+A7U/3m+Fw
 zoUTwBLvgd9E6Vc2LAXDYdYm2/A2aClLCqflsDIry5+LJZB3Cn+m28609Cra3g==
Subject: [PATCH v2] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
Mime-Version: 1.0
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Wed, 23 Sep 2026 16:56:52 +0800
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
Cc: <xb@ultrarisc.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<pbonzini@redhat.com>, <graf@amazon.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Date: Wed, 23 Sep 2026 16:56:31 +0800
Message-Id: <20260923085631.1384021-1-xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+26ab39455+5a6d8b+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.53.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_015700_777194_CC875386 
X-CRM114-Status: GOOD (  12.06  )
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

The TOPEI read-and-clear must be atomic with respect to
interrupt injection (set_bit in EIP). Otherwise an
interrupt injected between the topei read and the
clear_bit could be silently dropped.

v2:
 - fix patch file curruption

v1: https://lore.kernel.org/kvm-riscv/20260923070332.1376132-1-xiangwencheng@lanxincomputing.com/

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
 arch/riscv/kvm/aia_imsic.c | 42 +++++++++++++++++++++++++-------------
 1 file changed, 28 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..490c55419eb2 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -607,26 +607,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 		kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
-static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
 {
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
 	struct imsic_mrif *mrif = imsic->swfile;
-	unsigned long flags;
-
-	/*
-	 * The critical section is necessary during external interrupt
-	 * updates to avoid the risk of losing interrupts due to potential
-	 * interruptions between reading topei and updating pending status.
-	 */
-
-	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
 
 	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
 	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+}
+
+static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+	__imsic_swfile_extirq_update(vcpu);
 	raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
 }
 
@@ -912,12 +911,15 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 	struct imsic_mrif_eix *eix;
 	int r, rc = KVM_INSN_CONTINUE_NEXT_SEPC;
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	unsigned long flags;
 
 	/* If IMSIC vCPU state not initialized then forward to user space */
 	if (!imsic)
 		return KVM_INSN_EXIT_TO_USER_SPACE;
 
 	if (isel == KVM_RISCV_AIA_IMSIC_TOPEI) {
+		raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+
 		/* Read pending and enabled interrupt with highest priority */
 		topei = imsic_mrif_topei(imsic->swfile, imsic->nr_eix,
 					 imsic->nr_msis);
@@ -934,16 +936,20 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
 					  eix->eip);
 			}
 		}
+		if (wr_mask)
+			__imsic_swfile_extirq_update(vcpu);
+
+		raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, eflags);
 	} else {
 		r = imsic_mrif_rmw(imsic->swfile, imsic->nr_eix, isel,
 				   val, new_val, wr_mask);
 		/* Forward unknown IMSIC register to user-space */
 		if (r)
 			rc = (r == -ENOENT) ? 0 : KVM_INSN_ILLEGAL_TRAP;
-	}
 
-	if (wr_mask)
-		imsic_swfile_extirq_update(vcpu);
+		if (wr_mask)
+			imsic_swfile_extirq_update(vcpu);
+	}
 
 	return rc;
 }
@@ -1050,9 +1056,17 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
 	} else {
+		/*
+		 * Serialize the EIP set + external-irq update against the
+		 * TOPEI read-and-clear path so that an injected interrupt
+		 * cannot be silently lost when the guest acknowledges a
+		 * different (or the same) interrupt concurrently.
+		 */
+		raw_spin_lock(&imsic->swfile_extirq_lock);
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
-		imsic_swfile_extirq_update(vcpu);
+		__imsic_swfile_extirq_update(vcpu);
+		raw_spin_unlock(&imsic->swfile_extirq_lock);
 	}
 
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
-- 
2.53.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
