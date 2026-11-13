Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B26606B110
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 10:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NtK5zQ9o;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=CS5T5Imy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Mime-Version:Message-Id:
	From:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=nLNnVwgKQMPGzPsvO5CsOUEgnWBqlTH7z/ntVBPw1r8=; b=NtK5zQ9oQ7l87Kl1AObmlwFsx8
	B8ESAPaEa8ty9HufTjvlLCLJMt/si6u0ZrN5Jq0NRYNa5q32Ba53ZOo4fZJgH6WtKkGOSKqo7xfjN
	wO2W/GD7lkqFf0MWhMclD9AWrlbIlJbjWQf6EibjfVCCii/jBVG/l4BYQwZ4rZqmck85eUpmKVjhS
	Ff7vnGig6PFyj9xjL+AkZlMnK9BDQS0uSlMJmz5xJQy+u6z5uPrUPDhA0Vhzuu3mtVRLTJZ6NI56Q
	RF16QE1PLiqnrvHbGEaVoAjAhkyD7bnXFOqOu7HJ5817bq7Vp6495Ys7wtXiVDfyowl246WcV8tgt
	eOgTnHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoIe-0000000CJyn-0CCU;
	Fri, 13 Nov 2026 10:14:28 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRoIa-0000000CJwp-1Nsv
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 10:14:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1794564858;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=I1JA9FJ/SP/+WEbDXsjWk6ef9MGFbfHr+CbxzhoP4+E=;
 b=CS5T5ImyRIr7b9g1zL7JIDLKYCSNavpZovZeZfKFsTTz2qkF/fSo8VehDdsombFhc6eYHE
 VT/Vy8AtKrp7Y2kWdb0r4O3KHbTOqTIgZyx0XeW/a6jTVre4IbBkv9TJ+NcPYp7TBtLebv
 /07cA6xrKMm0ra52s58PBUlnXG6LZm4+Dj5M37R81jkuM7rw8niYpJ1jZ3OZXPEPBsi+1C
 ssZOA4iWHlNErtVNNvLdB3HZg2vafSuagslKjhx85ZOhA2w7U0BFFCEU52IKtj/Ev22iF7
 U2/0S7mJHhb3waclcFl4jmNxbfHGYCyG63f//zRIcuQNCtWmMrdk12UnaBVqcw==
To: <anup@brainfault.org>
Cc: <xb@ultrarisc.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<pbonzini@redhat.com>, <graf@amazon.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<xiangwencheng@lanxincomputing.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <20261113101358.3007601-1-xiangwencheng@lanxincomputing.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Subject: [PATCH v4] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
Received: from lanxin-ThinkBook-16-G5-IRH.lan ([123.120.4.67]) by smtp.feishu.cn with ESMTP; Fri, 13 Nov 2026 18:14:16 +0800
X-Mailer: git-send-email 2.53.0
Date: Fri, 13 Nov 2026 18:13:57 +0800
X-Lms-Return-Path: <lba+26af6e2f8+719607+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_021424_952647_9ED541ED 
X-CRM114-Status: GOOD (  11.86  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TOPEI read-and-clear must be atomic with respect to
interrupt injection (set_bit in EIP). Otherwise an
interrupt injected between the topei read and the
clear_bit could be silently dropped.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
v4:
 - pass topei value to __imsic_swfile_extirq_update()

v3:
 - fix undefined eflags

v2:
 - fix patch file curruption

v1: https://lore.kernel.org/kvm-riscv/20260923070332.1376132-1-xiangwencheng@lanxincomputing.com/
---
 arch/riscv/kvm/aia_imsic.c | 47 +++++++++++++++++++++++++-------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index c1af23e79ae0..0a6b20f3a28d 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -607,26 +607,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
 		kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
 }
 
-static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu, u32 topei)
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
 
-	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
-	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
+	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) && topei)
 		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
 	else
 		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
+}
+
+static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
+{
+	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct imsic_mrif *mrif = imsic->swfile;
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
+	__imsic_swfile_extirq_update(vcpu, imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis));
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
+			__imsic_swfile_extirq_update(vcpu, topei);
+
+		raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
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
@@ -1034,6 +1040,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 	unsigned long flags;
 	struct imsic_mrif_eix *eix;
 	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
+	struct imsic_mrif *mrif = imsic->swfile;
 
 	/* We only emulate one IMSIC MMIO page for each Guest VCPU */
 	if (!imsic || !iid || guest_index ||
@@ -1050,9 +1057,17 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
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
+		__imsic_swfile_extirq_update(vcpu, imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis));
+		raw_spin_unlock(&imsic->swfile_extirq_lock);
 	}
 
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
-- 
2.53.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
