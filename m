Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA45CCD193
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 01:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WarWObf325535vcY7aNx6cb0RdCHKmt86ZpRxC+HBk4=; b=qPbh92sd8/xSt4
	E75oHcDjSMfmxbCrvpn3E6WKUJ8eSkYZDWug60BbRknL5c7cDvhPlapZcdkNSVwH+28MR4XdLKx8m
	wB83f4lCdHKBaGdHwvJ+bgYgI0iCOqUyuHMdIizdq9BaGRNPwKjLbQUlUtnq9mvEojwozVvqBj8SZ
	nOJqpwhl3+UkfsKRK8pKcUnGdW2359B39L1UBxfigVnLWbjyFV4RMdaqARDBp9RY78uTsacEAF0M1
	bwziZDxG1LYhDI1yS0i07TPAPvKnUWMwCOON4iQLqM+s915+wcSWy2/4+3Q5Q8PY6Ca6WEhSHE1VZ
	1V+9yf/tNMxjgFFIbgfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Clv-00000003D2X-2sYW;
	Thu, 16 Oct 2025 01:27:15 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Clr-00000003D25-2JNW;
	Thu, 16 Oct 2025 01:27:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760578027; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=mWoWxsGAtDp0EV2ifeUAQMZcSWDLqLKjj7ZtzpCtdDQ=;
	b=Tcl4ZAr2SsNOYvabpVtobWXXNk385ww+QCryGBt/uk0p7u5t98byX3abVhi5c6PPAhmOkdoTdKmQUlUpil7CyqyrUDHVG/2Rxx0LQT590tipMUh8WX/A7x3ylCr/hU0TcTMIS1F2Aib5AVQKfCP+vSJa2wfI/Q3ItOr31tX2WZk=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WqIKtva_1760578023 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 16 Oct 2025 09:27:04 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Read HGEIP CSR on the correct cpu
Date: Thu, 16 Oct 2025 09:26:59 +0800
Message-Id: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_182712_075457_C5D0DA5A 
X-CRM114-Status: UNSURE (   8.52  )
X-CRM114-Notice: Please train this message.
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

When executing kvm_riscv_vcpu_aia_has_interrupts, the vCPU may have
migrated and the IMSIC VS-file have not been updated yet, currently
the HGEIP CSR should be read from the imsic->vsfile_cpu ( the pCPU
before migration ) via on_each_cpu_mask, but this will trigger an
IPI call and repeated IPI within a period of time is expensive in
a many-core systems.

Just let the vCPU execute and update the correct IMSIC VS-file via
kvm_riscv_vcpu_aia_imsic_update may be a simple solution.

Fixes: 4cec89db80ba ("RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/aia_imsic.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index fda0346f0ea1..168c02ad0a78 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -689,8 +689,12 @@ bool kvm_riscv_vcpu_aia_imsic_has_interrupt(struct kvm_vcpu *vcpu)
 	 */
 
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
-	if (imsic->vsfile_cpu > -1)
-		ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
+	if (imsic->vsfile_cpu > -1) {
+		if (imsic->vsfile_cpu != smp_processor_id())
+			ret = true;
+		else
+			ret = !!(csr_read(CSR_HGEIP) & BIT(imsic->vsfile_hgei));
+	}
 	read_unlock_irqrestore(&imsic->vsfile_lock, flags);
 
 	return ret;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
