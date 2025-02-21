Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2819EC021AA
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 11:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Date:To:From:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WvcgLKW9/P2pyhes+hobPmvFJmMK2zh65QVDYl4ZPzc=; b=Z46/mEOb2dys9j
	xzqsUJGhEhbfRndnbSBqdDY7Meq4JoGrcxbCRcTpu5lAU3OEJZ/GD7bwtW0+RnIcUd+qZO7S/Azuk
	H9pm0QSY/GufzyB2LK5G3kzA8Px6urmIW9h6lQ4MZ30o7ZKXD7mcFNHn752suZ+sQCX40QCOTu45P
	Dfarxvw3xKV/7QLKXm6noVNtgHBOZIsgkt/UHWcDsV4QKJI+HtxDbtELEV1qhZ006cMX8d9EubYP8
	bfvRn//2NmBMAUxoopvGn+WUaIa3AoUDj+ilvocQRc82DZydMpCM3eyYgBsga3goYCdFfe4yDlvoa
	KPah2v8Wp1ftiOSi7Etg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQxf-00000005INy-2SOM;
	Fri, 21 Feb 2025 11:12:51 +0000
Received: from va-2-59.ptr.blmpb.com ([209.127.231.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlQYV-00000005ETM-3yGf
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 10:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1740134801;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=vHH1MiexyCpVMoStYJqjt/YqpBbbofWY30poFqJKr2w=;
 b=dDO50Faz4LNVssaZu9LoBhfIUHKix2gGvKa1mfTtYWxCfhXWmZvfqMOgrOBuDgpCOzxfPl
 OGEuq+ePtkiA8wDAj506bYcIX6Jo5RtEHNx46KlDTO2B3uIVJzA9daIduRHoFXUIRtUdKr
 I2TamSH/rFQmwQvxP79uHrxb/wvbdAbZzVCzriQDRk/2VjIJuAMupWr9GLwmJxHHeut9yF
 o1pDXbXWdH3ZM/ugNi5eNci2BXprvVstSxioqbRN5LJptRaguAvK6FFquahFPa+uASp2ci
 a5Q1x9khu1/zN5nuarrEHFvB8BVOFT5alXmXisNqlZGjY6d04Tt5yhuIO/WqBA==
Cc: <ajones@ventanamicro.com>, <xiangwencheng@lanxincomputing.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<atishp@atishpatra.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<rkrcmar@ventanamicro.com>
Subject: [PATCH v2] riscv: KVM: Remove unnecessary vcpu kick
Received: from localhost.localdomain ([222.128.9.250]) by smtp.feishu.cn with ESMTP; Fri, 21 Feb 2025 18:46:39 +0800
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
X-Lms-Return-Path: <lba+267b85990+9cbe86+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-Mailer: git-send-email 2.46.2.windows.1
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: <anup@brainfault.org>
Date: Fri, 21 Feb 2025 18:45:38 +0800
Message-Id: <20250221104538.2147-1-xiangwencheng@lanxincomputing.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_024652_069946_139463A6 
X-CRM114-Status: UNSURE (   7.67  )
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

Remove the unnecessary kick to the vCPU after writing to the vs_file
of IMSIC in kvm_riscv_vcpu_aia_imsic_inject.

For vCPUs that are running, writing to the vs_file directly forwards
the interrupt as an MSI to them and does not need an extra kick.

For vCPUs that are descheduled after emulating WFI, KVM will enable
the guest external interrupt for that vCPU in
kvm_riscv_aia_wakeon_hgei. This means that writing to the vs_file
will cause a guest external interrupt, which will cause KVM to wake
up the vCPU in hgei_interrupt to handle the interrupt properly.

Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
---
v2: Revise the commit message to ensure it meets the required 
    standards for acceptance

 arch/riscv/kvm/aia_imsic.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index a8085cd8215e..29ef9c2133a9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -974,7 +974,6 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
 
 	if (imsic->vsfile_cpu >= 0) {
 		writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
-		kvm_vcpu_kick(vcpu);
 	} else {
 		eix = &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
 		set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);
-- 
2.46.2

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
