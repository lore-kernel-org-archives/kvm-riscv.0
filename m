Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD348C87FD2
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 06:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ErVBKh1LnfjKXxXmlvmrB9PB2N/xnlvCq4HvA0megI=; b=RJ6p1ofa8plTiL
	HK9n/9trM8W/Mcm5XB7AZLHOZRrAS50P+BqmLiRQZQcjhjkyLwuOL6SdpTto6xByVHw4wAyY2qZ6m
	BWk159IBHI8WP/b7CSuHFlMaxFiPMJHVCDCd19tmPNZ4H18xtIRwewa0Z4URRykZK0uAFDzvlaQRg
	gjEGuDRy4f9r61Leye50UDrb2e806y7Kbtbk9/hvkz9451mjNOHnLvMwgkxukjpnI9DBENc25CN2b
	gUF80th9w6eEobb9RLrd8scbbofNMUBdTpwbTUM1Am0krs3Ufm3r7hUP+9WhknZHu2Sn5uX7n9l0d
	ZzPUJlNOpb53XK+j/51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkj-00000006ZNQ-1hRG;
	Mon, 11 Aug 2025 06:11:25 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLkd-00000006ZIa-1Aj1;
	Mon, 11 Aug 2025 06:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754892676; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=whyJDouuAuGf1j7b/5M2xWcx/VsvP58NxkP1IN3I0Kg=;
	b=m+NSBNAbwvEI6hnCGbFnB/zClgX0akO+BxXSVAx/lNc/W8GltP6athl7XNo9ABZ7RKf1zRw53v2fQGEPTXNfWko8U2u8JucBwt43mFiPVXm9e1w2IojH04eAfvvsZ9NKOaB6sjI+/cFmLQ/oOgs6jl9UorqPDcxgalX6n3FiQtg=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlP-v9-_1754892672 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 11 Aug 2025 14:11:13 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	atishp@atishpatra.org,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	sunilvl@ventanamicro.com,
	rafael.j.wysocki@intel.com,
	tglx@linutronix.de,
	ajones@ventanamicro.com
Cc: guoren@linux.alibaba.com,
	guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [RFC PATCH 2/6] RISC-V: KVM: Transfer the physical address of MRIF to iommu-ir
Date: Mon, 11 Aug 2025 14:11:00 +0800
Message-Id: <20250811061104.10326-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
References: <20250811061104.10326-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231119_688182_4556CC2C 
X-CRM114-Status: GOOD (  10.19  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

According to the RISC-V IOMMU Spec, an IOMMU may optionally
support memory-resident interrupt files (MRIFs).

When the guest interrupt files are used up, we transfer the
physical address of MRIF to iommu-ir, and enable MRIF  mode
if the iommu-ir supports.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/aia_imsic.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 8f5703d9112a..e91164742fd0 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -21,6 +21,8 @@
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
+static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu);
+
 struct imsic_mrif_eix {
 	unsigned long eip[BITS_PER_TYPE(u64) / BITS_PER_LONG];
 	unsigned long eie[BITS_PER_TYPE(u64) / BITS_PER_LONG];
@@ -717,7 +719,8 @@ void kvm_riscv_vcpu_aia_imsic_release(struct kvm_vcpu *vcpu)
 				 vcpu->arch.aia_context.imsic_addr,
 				 IMSIC_MMIO_PAGE_SZ);
 
-	/* TODO: Purge the IOMMU mapping ??? */
+	/* Update the IOMMU mapping */
+	kvm_riscv_vcpu_irq_update(vcpu);
 
 	/*
 	 * At this point, all interrupt producers have been re-directed
@@ -795,13 +798,14 @@ int kvm_arch_update_irqfd_routing(struct kvm *kvm, unsigned int host_irq,
 
 			read_lock_irqsave(&imsic->vsfile_lock, flags);
 
-			if (WARN_ON_ONCE(imsic->vsfile_cpu < 0)) {
-				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
-				goto out;
+			if (imsic->vsfile_cpu < 0) {
+				vcpu_info.hpa = imsic->swfile_pa;
+				vcpu_info.mrif = true;
+			} else {
+				vcpu_info.hpa = imsic->vsfile_pa;
+				vcpu_info.mrif = false;
 			}
 
-			vcpu_info.hpa = imsic->vsfile_pa;
-
 			ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
 			if (ret) {
 				read_unlock_irqrestore(&imsic->vsfile_lock, flags);
@@ -844,6 +848,13 @@ static int kvm_riscv_vcpu_irq_update(struct kvm_vcpu *vcpu)
 		if (!irqfd->producer)
 			continue;
 		host_irq = irqfd->producer->irq;
+
+		if (imsic->vsfile_cpu < 0) {
+			vcpu_info.hpa = imsic->swfile_pa;
+			vcpu_info.mrif = true;
+		} else {
+			vcpu_info.mrif = false;
+		}
 		ret = irq_set_vcpu_affinity(host_irq, &vcpu_info);
 		if (ret) {
 			spin_unlock_irq(&kvm->irqfds.lock);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
