Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF2AF8FA8C
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 14:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BxhQogB6WYhC+VJzC+JR3+ifegZJ3Kvf2fqjogwUNWw=; b=KEXbXYAz4kvI7z
	c3YrpyBVGxWrLBrLbHvPPRRDwkMFSmP29z1hULSEb5bKcvXXaeB4/DEtxczPBxMXMEBYJ1cpD1kjG
	Wna4dvqdpMhqjWFk0lQ7ay/8jjORU5wGNTFp1XUmx66UzZdcD7RoxsbuiBTWOqzWv0Il6Fr3A9ZMf
	y6a2HEiD6qJwxqwQlItYOZp9TFqigwrlTXDetTMWGiLJf5nwCxlbtpeJ5jr9NwMMI4ClOJxVL15KI
	gLxT7N6bIE7LLAzegZfxTArIhUPDZwE7FmiWlB7u0FTyU1ltBzg0+s5UC5L2OqW9dt6qiKZc9e80k
	CRhwT3CLeICNr3oWcO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVx-00000008n5p-2guS;
	Tue, 21 Apr 2026 14:55:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVv-00000008n4v-3LHU;
	Tue, 21 Apr 2026 14:55:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAF9240A5E;
	Tue, 21 Apr 2026 14:55:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E22EC2BCB0;
	Tue, 21 Apr 2026 14:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783346;
	bh=p/wdV82CM5k36GboR0wr9dwL7I5eqEnXaA6SjWQmRfw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sa1jaqy1uX4ggAIR1nqF3d8IXx0KZGfwmVA6Z8jfMhMthXvBdFJF0Mr9+UyUY8Moo
	 3zTrLZJtIChGJlFtY7o5EFHNQximwR+f2HbTkMlQos1LBTsl6o8xuhIlYqLyYPx4jZ
	 2khgDZ6NrK2mTo6XOpQGXa2NbxzYRBAZhErASFbDeMXHOstYf+3roFObXsM2TUSA/H
	 7ASK6YFsVrRd3GTXsRQlvACe5U7v6a7uOql3uyPhTcGc9OsN6fCEcCZvB1gxWnaSkY
	 8msQfhT63/P+MHfZPj/9fMfiWucnHcmFNgWyfB0J2rzMJHQjaN5HcieUt5WGDZ+OQj
	 3fJeW/qyClWuw==
From: guoren@kernel.org
To: fangyu.yu@linux.alibaba.com,
	cp0613@linux.alibaba.com,
	inochiama@gmail.com,
	me@ziyao.cc,
	gaohan@iscas.ac.cn,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	tglx@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/3] RISC-V: KVM: AIA: Replace global HGEI count with simple enabled bool
Date: Tue, 21 Apr 2026 10:54:49 -0400
Message-Id: <20260421145451.1597930-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260421145451.1597930-1-guoren@kernel.org>
References: <20260421145451.1597930-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_075547_878492_F31DAEF4 
X-CRM114-Status: GOOD (  15.56  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Now that HGEI line management is fully per-CPU (via struct
aia_hgei_control::nr_hgei), the global `kvm_riscv_aia_nr_hgei`
is no longer needed. Replace it with a simple `bool
kvm_riscv_aia_hgei_enabled` that only indicates whether HGEI
support is available at all.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/include/asm/kvm_aia.h |  2 +-
 arch/riscv/kvm/aia.c             | 18 ++++++++----------
 arch/riscv/kvm/aia_device.c      |  4 ++--
 arch/riscv/kvm/main.c            |  3 +--
 4 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index b04ecdd1a860..e8749ac6bed7 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -79,7 +79,7 @@ struct kvm_vcpu_aia {
 
 #define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
 
-extern unsigned int kvm_riscv_aia_nr_hgei;
+extern bool kvm_riscv_aia_hgei_enabled;
 extern unsigned int kvm_riscv_aia_max_ids;
 DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 #define kvm_riscv_aia_available() \
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index a23729052cfb..70ff1d25dd99 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -28,7 +28,7 @@ struct aia_hgei_control {
 static DEFINE_PER_CPU(struct aia_hgei_control, aia_hgei);
 static int hgei_parent_irq;
 
-unsigned int kvm_riscv_aia_nr_hgei;
+bool kvm_riscv_aia_hgei_enabled;
 unsigned int kvm_riscv_aia_max_ids;
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
 
@@ -491,7 +491,7 @@ static int aia_hgei_init(void)
 	struct irq_domain *domain;
 
 	/* Skip SGEI interrupt setup for zero guest external interrupts */
-	if (!kvm_riscv_aia_nr_hgei)
+	if (!kvm_riscv_aia_hgei_enabled)
 		goto skip_sgei_interrupt;
 
 	/* Find INTC irq domain */
@@ -524,7 +524,7 @@ static int aia_hgei_init(void)
 static void aia_hgei_exit(void)
 {
 	/* Do nothing for zero guest external interrupts */
-	if (!kvm_riscv_aia_nr_hgei)
+	if (!kvm_riscv_aia_hgei_enabled)
 		return;
 
 	/* Free per-CPU SGEI interrupt */
@@ -631,6 +631,7 @@ int kvm_riscv_aia_init(void)
 {
 	int rc;
 	const struct imsic_global_config *gc;
+	unsigned int kvm_riscv_aia_nr_hgei;
 
 	if (!riscv_isa_extension_available(NULL, SxAIA))
 		return -ENODEV;
@@ -641,21 +642,18 @@ int kvm_riscv_aia_init(void)
 	kvm_riscv_aia_nr_hgei = fls_long(csr_read(CSR_HGEIE));
 	csr_write(CSR_HGEIE, 0);
 	if (kvm_riscv_aia_nr_hgei)
-		kvm_riscv_aia_nr_hgei--;
+		kvm_riscv_aia_hgei_enabled = true;
 
 	/*
 	 * Number of usable HGEI lines should be minimum of per-HART
 	 * IMSIC guest files and number of bits in HGEIE
 	 */
-	if (gc)
-		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    gc->nr_guest_files);
-	else
-		kvm_riscv_aia_nr_hgei = 0;
+	if (!gc)
+		kvm_riscv_aia_hgei_enabled = 0;
 
 	/* Find number of guest MSI IDs */
 	kvm_riscv_aia_max_ids = IMSIC_MAX_ID;
-	if (gc && kvm_riscv_aia_nr_hgei)
+	if (gc && kvm_riscv_aia_hgei_enabled)
 		kvm_riscv_aia_max_ids = gc->nr_guest_ids + 1;
 
 	/* Initialize guest external interrupt line management */
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 3d1e81e2a36b..5b45b1114425 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -71,7 +71,7 @@ static int aia_config(struct kvm *kvm, unsigned long type,
 				 * external interrupts (i.e. non-zero
 				 * VS-level IMSIC pages).
 				 */
-				if (!kvm_riscv_aia_nr_hgei)
+				if (!kvm_riscv_aia_hgei_enabled)
 					return -EINVAL;
 				break;
 			default:
@@ -628,7 +628,7 @@ void kvm_riscv_aia_init_vm(struct kvm *kvm)
 	 */
 
 	/* Initialize default values in AIA global context */
-	aia->mode = (kvm_riscv_aia_nr_hgei) ?
+	aia->mode = (kvm_riscv_aia_hgei_enabled) ?
 		KVM_DEV_RISCV_AIA_MODE_AUTO : KVM_DEV_RISCV_AIA_MODE_EMUL;
 	aia->nr_ids = kvm_riscv_aia_max_ids - 1;
 	aia->nr_sources = 0;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb8a65273c1f..bcfa139f4871 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -169,8 +169,7 @@ static int __init riscv_kvm_init(void)
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
 	if (kvm_riscv_aia_available())
-		kvm_info("AIA available with %d guest external interrupts\n",
-			 kvm_riscv_aia_nr_hgei);
+		kvm_info("AIA available with guest external interrupts\n");
 
 	kvm_riscv_setup_vendor_features();
 
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
