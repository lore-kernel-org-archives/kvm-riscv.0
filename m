Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 664CBCA0EE4
	for <kvm-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 07:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UOzv77QOWK7pXiRKmgML1PwYf4bYg9lZcB0EY0lBC+Q=; b=S7C3AgKnPo21Oc
	7ZEG7elUfjUvBLOBuAt4wkVZlu6xFi9w+gMl8Vw3Q+mYFY0HjoeubX9ntuHy40kPCS1ujBZRW8lQs
	DgrwWPhFxwO7C/GGC8loPSOgTP5kaIB2hfRc5QAlU/2dwUt4FbStW80Cb4UGhSZYTVXC6hXYqMP5j
	duDZp6qIkMuoPOmqsDhR9AkynrIxf/Z4U0ThOFRU6lkfisTNckJrn5sNk/vTyRjE4h0ybuVVRmmaB
	O4ApJiw//4BB4qf7RkOOjlyQwlFEcregt1m/LnpWUG7YJutqEJHDv2RWun5VSJES8xcxmCsWdTiYn
	VwcvT+DzJo6wFD1eicog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBQM-00000004DmX-3BtJ;
	Sat, 16 Aug 2025 07:33:58 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unBPE-00000004DeB-0UsU;
	Sat, 16 Aug 2025 07:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1755329560; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=Zi3mt6f9DghYW3n1681Tp/+SCUmn8lZ88byVYz6vHiE=;
	b=CD9uCfn91zAZjxb6Vfm58NSpxSsJbPY07wqRGu6sfqIlbvCum9S2hCJxl+ScRSDMY9uP4nK5p2D9f1Vgg2sPzg++2WTI1KP9QLt2eFr5GhCqz9hOEqOHadYja9gLlYhBJDrFfIP+Bu51Mm71vzfG0uoc4kISmqyeaFfuGxEjxeE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wlqzknt_1755329556 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 16 Aug 2025 15:32:38 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@linux.alibaba.com,
	guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Write hgatp register with valid mode bits
Date: Sat, 16 Aug 2025 15:32:34 +0800
Message-Id: <20250816073234.77646-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_003248_859932_798B5B43 
X-CRM114-Status: UNSURE (   7.21  )
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

According to the RISC-V Privileged Architecture Spec, when MODE=Bare
is selected,software must write zero to the remaining fields of hgatp.

We have detected the valid mode supported by the HW before, So using a
valid mode to detect how many vmid bits are supported.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/vmid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 3b426c800480..d176a5c2f9a4 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -28,7 +28,7 @@ void __init kvm_riscv_gstage_vmid_detect(void)
 
 	/* Figure-out number of VMID bits in HW */
 	old = csr_read(CSR_HGATP);
-	csr_write(CSR_HGATP, old | HGATP_VMID);
+	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode() << HGATP_MODE_SHIFT) | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
 	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
