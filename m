Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 852FFFF8850
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zkprTv8RNgtgPl1Vwmm4yW451DiLgPlu21G/lFTlvMk=; b=Lc8b6f4oYSG9aM
	yfq7lMjY506P0juempPixEPao23fvlC2i4ndLN7xrtSyihOorT3fsndwvH/6jL/rn/q+kI3Tlveuf
	wVhwrLqlBjAxovVtGFfNA4byOb+vAsBlCP1i8SrTmz/tl5GKeXmaBY4y5I0R/Pc4JlAgAwpXIpt0v
	8ilsL1vdV2/VJw2Yd0fZxmqpwTA/gxFFqBbtyicJynTL8/UZCF7q/nn8v+++61nGgjmEmJVgfVwGA
	oaxnZe3vw0jfJhfqOrS1I1Zn7stA1MtLsWQKQjBRubxGUkx2h2uqg/Q7FS2GsrgWIg3mIe0RejhDe
	ePgccWzPehVJ40IaAPHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRNL-0000000DwdT-1F9K;
	Sat, 25 Apr 2026 01:00:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRNI-0000000Dwc3-3xGC;
	Sat, 25 Apr 2026 01:00:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 633A860052;
	Sat, 25 Apr 2026 01:00:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A364C19425;
	Sat, 25 Apr 2026 00:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777078800;
	bh=P/xWdbYp78TUgmPmZpbvCjaH6uZ1DZD8kPFRZWdzOHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDKbLWUAnL2XCg9gxeKEyc2mXC8E7299WLTINp8SuZiaodeEbDHdZ15OMfGvHI51r
	 qAAfTAqehCQMylrcSdbrZaRwQ+ER1eT11KhMYuYKY8eYkKDxOiasQgi9gwGbpb3QCt
	 qCFdHKsXzjTd+xcJCn/8TyRFJboFgvedtanFG6xOOVaLJpyJKfh5g9ywbxPm0SWI4Z
	 yx/Hc24Y65Xe0c31BkGvvdqpneCpvSJwGPvB8PkvLET7SBsag/goxIZXVFOpSiebcz
	 gC7W1WoqAHWMz5/QMUjv3qfJoEZmkEiugPU+q07GjlylR7C1FExQUSFm9Dycj43Ztd
	 BHf4O00FBv8DA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	inochiama@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	me@ziyao.cc,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@kernel.org
Subject: [PATCH V2 4/4] RISC-V: KVM: AIA: Use per-HART IMSIC guest files to compute final HGEI count
Date: Sat, 25 Apr 2026 00:59:16 +0000
Message-ID: <20260425005916.3321811-5-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
References: <20260425005916.3321811-1-guoren@kernel.org>
MIME-Version: 1.0
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

Now that `nr_guest_files` has been moved to `struct imsic_local_config`
and is computed per-HART, KVM must respect the actual number of guest
interrupt files available on each HART when setting up HGEI.

In `kvm_riscv_aia_enable()`:

 - Retrieve the per-CPU IMSIC local config
 - Take `min(hgctrl->nr_hgei, lc->nr_guest_files)` as the final usable
   HGEI count for this HART
 - Use the result to initialize `free_bitmap`

This ensures correct HGEI allocation on heterogeneous RISC-V SoCs
where different cores may have different IMSIC guest file counts, and
completes the per-HART conversion series.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kvm/aia.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index 70ff1d25dd99..a5f4b7fe1dce 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -534,6 +534,9 @@ static void aia_hgei_exit(void)
 void kvm_riscv_aia_enable(void)
 {
 	struct aia_hgei_control *hgctrl;
+	const struct imsic_global_config *gc;
+	const struct imsic_local_config *lc;
+	unsigned int nr_hgei;
 
 	if (!kvm_riscv_aia_available())
 		return;
@@ -547,8 +550,13 @@ void kvm_riscv_aia_enable(void)
 	if (hgctrl->nr_hgei)
 		hgctrl->nr_hgei--;
 
-	if (hgctrl->nr_hgei) {
-		hgctrl->free_bitmap = BIT(hgctrl->nr_hgei + 1) - 1;
+	gc = imsic_get_global_config();
+	lc = (gc) ? this_cpu_ptr(gc->local) : NULL;
+	if (lc)
+		nr_hgei = min(hgctrl->nr_hgei, lc->nr_guest_files);
+
+	if (nr_hgei) {
+		hgctrl->free_bitmap = BIT(nr_hgei + 1) - 1;
 		hgctrl->free_bitmap &= ~BIT(0);
 	} else {
 		hgctrl->free_bitmap = 0;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
