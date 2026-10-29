Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26246606A31C
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 Oct 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kembZi9n;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=QTfl+5cf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Subject:Cc:To:Mime-Version:
	Message-Id:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=410xoNcOQZwNGnpRdyYijK35n9dmIkLqkW8gke8HsvE=; b=kembZi9nFxC6QGxPSePOA25Agy
	I4TViMwFQnI8u8hl99dsfigb3jxw66XTEkFMvUwyaTspD2h/RP/2AfJqypVkY+p/WNH6XW1/T+6ZO
	L3X0e/AIjdzd+GtyVSeEz0I1BEyhxPhkhd0YuMlNRRUwQNLoNwsqzlDSOC6EdVM1D3/RjYTi96XWY
	c5nAF9uQ6uzGTnoFEoHLj0l5yneQkfFMtomzl5+cgzuGpXpS+6jBetrUesmhx8LMzE5VyBEZyCE1g
	RzlmLN2lRMO0Wlqffdju5TcrrCF39seYNIZEt9nF/NS1bCKQoys+xUl2F3GTommHGp4lT5tHpuAxk
	ossKb/3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOqu-000000096pa-0dcN;
	Thu, 29 Oct 2026 12:03:28 +0000
Received: from va-2-57.ptr.blmpb.com ([209.127.231.57])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMOqo-000000096nX-2MkR
	for kvm-riscv@lists.infradead.org;
	Thu, 29 Oct 2026 12:03:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1793275395;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=AQ6F1B7PzzN9LWkh/7/jVlh/Ytx0nl1frqODP+XOuCg=;
 b=QTfl+5cfTKI55xiAV/b/W8/kya90MeZ7/GkAeO9pOrkafPgH8GsC+NWTF4VIH5jAO5h+hS
 dskQVXFg29wynRy30Nz2ckzJg5/ExH+9Nx+NkIE/XLWY412std1cDt1wrOT2FI0RJDpK6y
 6B/LcdKn4seSEaPj8S/luVgjj3ST7yT88Kj2ZcXhAJJpsoeAp8gNTrP2z2sMFN5njQr79I
 JZOHCRNoMPmFDFnCtYrwn76d8Rynyty9g5aQB6upqZ0mmqjK1oTGh00poa3E4vxfl+8cfV
 ftaNlkz+26wCfvJMDCzxXM3lDofXINgGIdayBYNUUF1I+ruMe+ozKOBEQ2ifeg==
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <20261029120307.721902-1-xiangwencheng@lanxincomputing.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.53.0
To: <anup@brainfault.org>
Received: from lanxin-ThinkBook-16-G5-IRH ([123.120.5.129]) by smtp.feishu.cn with ESMTP; Thu, 29 Oct 2026 20:03:12 +0800
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <xiangwencheng@lanxincomputing.com>, 
	<nutty.liu@hotmail.com>
Subject: [PATCH v3] riscv: KVM: Add hart-to-vCPU mapping for faster MSI injection
Date: Thu, 29 Oct 2026 20:03:07 +0800
X-Lms-Return-Path: <lba+26ae33601+992f56+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_050324_151973_05FCC0E2 
X-CRM114-Status: GOOD (  16.48  )
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

Replace linear searches over all vCPUs in MSI injection paths with a
hart_index -> vCPU xarray lookup table. This avoids O(n) scans on
every injected interrupt and improves performance when the number of
vCPUs is large.

Both kvm_riscv_aia_inject_msi_by_id() and kvm_riscv_aia_inject_msi()
now use the table instead of iterating over the vCPU list.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
Changes in v3:
- Fix format.

Changes in v2:
- Use xarray instead of normal array to handle incontiguous hart_index.
- Link to v1:
  https://lore.kernel.org/kvm-riscv/20260730093614.983508-1-xiangwencheng@lanxincomputing.com/
---
 arch/riscv/include/asm/kvm_aia.h |  3 ++
 arch/riscv/kvm/aia_device.c      | 48 +++++++++++++++++---------------
 2 files changed, 29 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index ab03f853e507..3b075f18e1d6 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -12,6 +12,7 @@
 
 #include <linux/jump_label.h>
 #include <linux/kvm_types.h>
+#include <linux/xarray.h>
 #include <asm/csr.h>
 
 struct kvm_aia {
@@ -47,6 +48,8 @@ struct kvm_aia {
 
 	/* Internal state of APLIC */
 	void		*aplic_state;
+
+	struct xarray hart_to_vcpu;
 };
 
 struct kvm_vcpu_aia_csr {
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index efc7c0bcfba9..b76ce0b4669a 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -259,6 +259,8 @@ static int aia_init(struct kvm *kvm)
 	if (ret)
 		return ret;
 
+	xa_init(&aia->hart_to_vcpu);
+
 	/* Iterate over each VCPU */
 	kvm_for_each_vcpu(idx, vcpu, kvm) {
 		vaia = &vcpu->arch.aia_context;
@@ -281,6 +283,11 @@ static int aia_init(struct kvm *kvm)
 		vaia->hart_index = aia_imsic_hart_index(aia,
 							vaia->imsic_addr);
 
+		ret = xa_insert(&aia->hart_to_vcpu, vaia->hart_index,
+				vcpu, GFP_KERNEL);
+		if (ret)
+			goto fail_cleanup_imsics;
+
 		/* Initialize IMSIC for this VCPU */
 		ret = kvm_riscv_vcpu_aia_imsic_init(vcpu);
 		if (ret)
@@ -299,6 +306,7 @@ static int aia_init(struct kvm *kvm)
 			continue;
 		kvm_riscv_vcpu_aia_imsic_cleanup(vcpu);
 	}
+	xa_destroy(&aia->hart_to_vcpu);
 	kvm_riscv_aia_aplic_cleanup(kvm);
 	return ret;
 }
@@ -557,30 +565,25 @@ void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
 				   u32 guest_index, u32 iid)
 {
-	unsigned long idx;
 	struct kvm_vcpu *vcpu;
+	struct kvm_aia *aia = &kvm->arch.aia;
 
 	/* Proceed only if AIA was initialized successfully */
 	if (!kvm_riscv_aia_initialized(kvm))
 		return -EBUSY;
 
-	/* Inject MSI to matching VCPU */
-	kvm_for_each_vcpu(idx, vcpu, kvm) {
-		if (vcpu->arch.aia_context.hart_index == hart_index)
-			return kvm_riscv_vcpu_aia_imsic_inject(vcpu,
-							       guest_index,
-							       0, iid);
-	}
+	vcpu = xa_load(&aia->hart_to_vcpu, hart_index);
+	if (!vcpu)
+		return 0;
 
-	return 0;
+	return kvm_riscv_vcpu_aia_imsic_inject(vcpu, guest_index, 0, iid);
 }
 
 int kvm_riscv_aia_inject_msi(struct kvm *kvm, struct kvm_msi *msi)
 {
 	gpa_t tppn, ippn;
-	unsigned long idx;
 	struct kvm_vcpu *vcpu;
-	u32 g, toff, iid = msi->data;
+	u32 g, toff, iid = msi->data, hart_index;
 	struct kvm_aia *aia = &kvm->arch.aia;
 	gpa_t target = (((gpa_t)msi->address_hi) << 32) | msi->address_lo;
 
@@ -595,18 +598,16 @@ int kvm_riscv_aia_inject_msi(struct kvm *kvm, struct kvm_msi *msi)
 	g = tppn & (BIT(aia->nr_guest_bits) - 1);
 	tppn &= ~((gpa_t)(BIT(aia->nr_guest_bits) - 1));
 
-	/* Inject MSI to matching VCPU */
-	kvm_for_each_vcpu(idx, vcpu, kvm) {
-		ippn = vcpu->arch.aia_context.imsic_addr >>
-					IMSIC_MMIO_PAGE_SHIFT;
-		if (ippn == tppn) {
-			toff = target & (IMSIC_MMIO_PAGE_SZ - 1);
-			return kvm_riscv_vcpu_aia_imsic_inject(vcpu, g,
-							       toff, iid);
-		}
-	}
+	hart_index = aia_imsic_hart_index(aia, target);
+	vcpu = xa_load(&aia->hart_to_vcpu, hart_index);
+	if (!vcpu)
+		return 0;
 
-	return 0;
+	ippn = vcpu->arch.aia_context.imsic_addr >> IMSIC_MMIO_PAGE_SHIFT;
+	if (ippn != tppn)
+		return 0;
+	toff = target & (IMSIC_MMIO_PAGE_SZ - 1);
+	return kvm_riscv_vcpu_aia_imsic_inject(vcpu, g, toff, iid);
 }
 
 int kvm_riscv_aia_inject_irq(struct kvm *kvm, unsigned int irq, bool level)
@@ -647,10 +648,13 @@ void kvm_riscv_aia_init_vm(struct kvm *kvm)
 
 void kvm_riscv_aia_destroy_vm(struct kvm *kvm)
 {
+	struct kvm_aia *aia = &kvm->arch.aia;
 	/* Proceed only if AIA was initialized successfully */
 	if (!kvm_riscv_aia_initialized(kvm))
 		return;
 
+	xa_destroy(&aia->hart_to_vcpu);
+
 	/* Cleanup APLIC context */
 	kvm_riscv_aia_aplic_cleanup(kvm);
 }
-- 
2.53.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
