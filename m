Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6961CC6B34
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VaZXqNPWyc2tQudXXsgRNONKs2dWpmdTXNv13EzeYxg=; b=OEdHiCpQJ8QHZw
	bN/n0r+eXkyyWpnJxD42wIaXZKCFC2AFELpH4Ef5vXS1Bk+tNhnp11csFiTppRaPKmr66qVgqy8Wg
	o6zyKKOYd1iWtMvW1BVccT76r+C9tuReEtD2n/d/L1uRKoTSuYGQAcfR5ak3PfRRrRQdv0P7jcijK
	15xbTQan2OLLJwq7uZSBdXTqzEQRg7x62cwg3KFBD5030Bf4w/qgdRef3CieOI6mIretwkBWey38h
	7KC92lkDycyWeYC9v+q5JaGY0h1CXUF7AP61J50sMdC0FRaRpSNJkXLkRK2NsViCylVbj8q6QATvX
	I0w00LSGVArGe+1a+wKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKy-0000000GyMn-27Ks;
	Thu, 15 Oct 2026 06:53:12 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKp-0000000Gy7i-35tA;
	Thu, 15 Oct 2026 06:53:05 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4j4zKl2GgNz5B15S;
	Thu, 15 Oct 2026 14:52:59 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 69F6qkRW013978;
	Thu, 15 Oct 2026 14:52:46 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 15 Oct 2026 14:52:48 +0800
X-Zmail-TransId: 3e816ad0783f024-555d7
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH 12/12] RISC-V: KVM: Forward MSIs for guests with a vIOMMU
Date: Thu, 15 Oct 2026 14:52:32 +0800
Message-ID: <20261015065232.604503-13-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69F6qkRW013978
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 15 Oct 2026 14:52:59 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD0784B.001/4j4zKl2GgNz5B15S
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_235304_488745_2EDE04A4 
X-CRM114-Status: GOOD (  20.12  )
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

The IRQ bypass names the target vCPU by matching the device MSI address
against the guest IMSIC addresses of the vCPUs, so it only works when the
guest programs the device with those addresses directly. A guest with a
vIOMMU programs an address from its own IOVA space instead, which the
IOMMU resolves through the guest stage-1 page tables before it looks the
address up in the MSI table, so no vCPU can be named at that point.

Falling back to host delivery is not an option either. The device would
keep the host IMSIC address composed at vector activation, and the
guest's own stage-1 page tables do not map it, so its MSIs fault instead
of reaching an interrupt file.

The MSI table already holds the VM-wide IMSIC topology, so the hardware
finds the target vCPU by itself once the address is translated. Forward
such IRQs for the whole VM and program the device with the MSI message
composed by the guest.

Such a producer can reach any vCPU of the VM, so unforward it whenever a
VS-file is released and retarget it whenever a vCPU migrates.

Co-developed-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 arch/riscv/kvm/aia_imsic.c | 67 +++++++++++++++++++++++++++-----------
 include/linux/kvm_irqfd.h  |  2 ++
 2 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 010f9a90f107..862db53c66a5 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -758,7 +758,7 @@ int kvm_riscv_irqfd_unforward(struct kvm_kernel_irqfd *irqfd)
 
 	lockdep_assert_held(&kvm->irqfds.lock);
 
-	if (!irqfd->irq_bypass_vcpu)
+	if (!irqfd->irq_bypass_vcpu && !irqfd->irq_bypass_nested)
 		return 0;
 
 	irq_data = irq_get_irq_data(irqfd->producer->irq);
@@ -775,6 +775,7 @@ int kvm_riscv_irqfd_unforward(struct kvm_kernel_irqfd *irqfd)
 		return ret;
 
 	irqfd->irq_bypass_vcpu = NULL;
+	irqfd->irq_bypass_nested = false;
 	return 0;
 }
 
@@ -788,7 +789,11 @@ static int imsic_vcpu_unforward(struct kvm_vcpu *vcpu)
 	guard(spinlock_irqsave)(&kvm->irqfds.lock);
 
 	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
-		if (irqfd->irq_bypass_vcpu != vcpu)
+		/*
+		 * Nested-forwarded producers can target any vCPU of the VM,
+		 * unforward them on any VS-file release.
+		 */
+		if (!irqfd->irq_bypass_nested && irqfd->irq_bypass_vcpu != vcpu)
 			continue;
 
 		ret = kvm_riscv_irqfd_unforward(irqfd);
@@ -902,7 +907,7 @@ static int imsic_vsfile_target_replace(struct kvm_vcpu *vcpu, phys_addr_t vsfile
 	vcpu_info.target.type = RISCV_IOMMU_IR_TARGET_IMSIC;
 	vcpu_info.target.hpa = vsfile_pa;
 	list_for_each_entry(irqfd, &kvm->irqfds.items, list) {
-		if (!irqfd->irq_bypass_vcpu)
+		if (!irqfd->irq_bypass_vcpu && !irqfd->irq_bypass_nested)
 			continue;
 
 		ret = irq_set_vcpu_affinity(irqfd->producer->irq, &vcpu_info);
@@ -931,16 +936,10 @@ static bool imsic_targets_valid(struct kvm_aia *aia)
 	return true;
 }
 
-static struct kvm_vcpu *imsic_irqfd_route_vcpu(struct kvm *kvm,
-					       struct kvm_kernel_irq_routing_entry *irq_entry)
+static struct kvm_vcpu *imsic_irqfd_route_vcpu(struct kvm *kvm, gpa_t target)
 {
 	struct kvm_vcpu *vcpu;
 	unsigned long index;
-	gpa_t target;
-
-	target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
-	if (target & (IMSIC_MMIO_PAGE_SZ - 1))
-		return NULL;
 
 	kvm_for_each_vcpu(index, vcpu, kvm) {
 		if (target == vcpu->arch.aia_context.imsic_addr)
@@ -968,6 +967,9 @@ static int imsic_irqfd_forward(struct kvm_kernel_irqfd *irqfd,
 		.data = irq_entry->msi.data,
 	};
 	struct kvm_vcpu *vcpu;
+	gpa_t target, gpa;
+	unsigned int i;
+	bool nested = false;
 	int ret;
 
 	lockdep_assert_held(&kvm->irqfds.lock);
@@ -988,24 +990,51 @@ static int imsic_irqfd_forward(struct kvm_kernel_irqfd *irqfd,
 	 * The IOMMU writes MSIs straight into the VS-file, so bypass is
 	 * gated by the hardware backing checks below, not the AIA mode.
 	 */
-	if (!imsic_targets_valid(&kvm->arch.aia)) {
-		pr_debug("KVM: IMSIC IRQ bypass requires all VS-files\n");
+	target = ((gpa_t)irq_entry->msi.address_hi << 32) | irq_entry->msi.address_lo;
+	if (target & (IMSIC_MMIO_PAGE_SZ - 1))
 		return -EOPNOTSUPP;
-	}
 
-	/* Leave guest messages that name no vIMSIC to software injection. */
-	vcpu = imsic_irqfd_route_vcpu(kvm, irq_entry);
-	if (!vcpu)
-		return -EOPNOTSUPP;
+	vcpu = imsic_irqfd_route_vcpu(kvm, target);
+	if (vcpu) {
+		/*
+		 * The guest programmed a guest interrupt file address, so every
+		 * vCPU of the VM must be hardware backed for the complete
+		 * topology to be installable.
+		 */
+		if (!imsic_targets_valid(aia)) {
+			pr_debug("KVM: IMSIC IRQ bypass requires all VS-files\n");
+			return -EOPNOTSUPP;
+		}
+		gpa = vcpu->arch.aia_context.imsic_addr;
+	} else {
+		/*
+		 * A vIOMMU guest programs the device with an IOVA-space MSI
+		 * address, which names no vCPU until the IOMMU translates it
+		 * and resolves the target through its MSI table of published
+		 * VS-files. Forward such IRQs for the whole VM. The address
+		 * pattern comes from any published target, as only the
+		 * mask-covered index bits differ between them.
+		 */
+		for (i = 0; i < aia->nr_targets; i++)
+			if (aia->targets[i].type == RISCV_IOMMU_IR_TARGET_IMSIC)
+				break;
+		if (i == aia->nr_targets)
+			return -EOPNOTSUPP;
+		gpa = aia->targets[i].gpa;
+		nested = true;
+	}
 
-	vcpu_info.msi_addr_pattern = (vcpu->arch.aia_context.imsic_addr >> IMSIC_MMIO_PAGE_SHIFT) &
+	vcpu_info.msi_addr_pattern = (gpa >> IMSIC_MMIO_PAGE_SHIFT) &
 				     ~vcpu_info.msi_addr_mask;
 	ret = irq_set_vcpu_affinity(irqfd->producer->irq, &vcpu_info);
 	if (ret)
 		return ret;
 
 	pci_write_msi_msg(irqfd->producer->irq, &msg);
-	irqfd->irq_bypass_vcpu = vcpu;
+	if (nested)
+		irqfd->irq_bypass_nested = true;
+	else
+		irqfd->irq_bypass_vcpu = vcpu;
 
 	return 0;
 }
diff --git a/include/linux/kvm_irqfd.h b/include/linux/kvm_irqfd.h
index ef8c134ded8a..39c73157e086 100644
--- a/include/linux/kvm_irqfd.h
+++ b/include/linux/kvm_irqfd.h
@@ -60,6 +60,8 @@ struct kvm_kernel_irqfd {
 	struct irq_bypass_producer *producer;
 
 	struct kvm_vcpu *irq_bypass_vcpu;
+	/* Forwarded to any vCPU of the VM (guest-controlled MSI target) */
+	bool irq_bypass_nested;
 	struct list_head vcpu_list;
 	void *irq_bypass_data;
 };
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
