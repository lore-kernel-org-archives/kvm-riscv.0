Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50827C98310
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 06:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qx8wh55VcsJso6NBKsluNgjH1SvPJToNVjI3fozVoRg=; b=fjkCjCHU8vsh+4
	AuhZAi8K7mTX+d1AZkoPariHvSDBfsHczf29R7Sjd+WeBYcJ1d+uYfm0OZM8q3xdIEX+D0aiqo/gm
	ryvk2A6CjfiVNymKcpMGhMRb6bsFSD0lcxFRX2VMxDKRq9Q72MoT/eUr5u3YUOVHHqL0aGw4m8bC8
	GQ7HbdvFXvY/+f+5UnZ+Kc4HdWOM1+c61WIDBTg8QDjtExg+UsNGAEoTUa3QvM6ENOkU5Y5Mqhrd1
	LvoFey+XqamMwXpxX0MIe/qr/YpUDpacW2kC6sVEY78JZOkj84w4qxfdIBVHMIwTRZ5kODPWjHCuR
	oqfrfNJTGPs10NZ60KVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cYz-0000000A6R1-3ifj;
	Thu, 24 Sep 2026 06:04:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cYy-0000000A6Qq-3o59;
	Thu, 24 Sep 2026 06:04:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E01B4601FF;
	Thu, 24 Sep 2026 06:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FEF41F000FF;
	Thu, 24 Sep 2026 06:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790229847;
	bh=r85Nf4Srb/iBhnlbT0L3eStB1iPLgO4vX4v+Ock+8jo=;
	h=From:Date:Subject:To:Cc;
	b=I/ttgRO4a5bMMWnm/y3e1sP4hi2WGbt9DePQDXc8NPj2KY2amjK2aqloQjFBK7jUS
	 mRWkN1RFvjHxLpfmv1d2dJwEpHWC8oH+ONCKN9Cq1D+AqNRgq1AfOJH82vP05g54JY
	 6tPj68kqZkeG1TD5GgnsLNP/veY173h7HbdbfEEAer2eO45y6H2+dffju1kzmPqd/d
	 d/lqnAsjZmbbqd+McD/HZ29GmtC7i3kfifvrMV7Oop6R2hLIhZxIqPZSWoF6vt6uRG
	 QUrW6cMMo0mMD+HGL8moXHwum7vC0/hEiqgrDAPgrkagxD5IylvQdCKGWSRz04scXO
	 yPa/aU68oJ8vA==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Thu, 24 Sep 2026 06:03:49 +0000
Subject: [PATCH] RISC-V: KVM: AIA: Initialize per-CPU HGEI free_bitmap only
 once
MIME-Version: 1.0
Message-Id: <20260924-free_bitmap_initialized-v1-1-4cfb73a0d04b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAES9tGoC/yXMQQ6CMBBG4auQWdsEGyTgVYwh03aKv9FK2mqMh
 LtbYPkt3pspSYQkOlczRfkg4RUKjoeK7I3DKAqumHSt27rXjfJRZDDIT54GBGTwAz9xio2zfcM
 n3XlDpZ6ieHy38+W6O73NXWxed7Qsf6JY0Ut7AAAA
X-Change-ID: 20260924-free_bitmap_initialized-abdc94a528fb
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

kvm_riscv_aia_enable() may run more than once on the same CPU.  The
per-CPU free_bitmap only needs to be initialized once, from the HGEIE
width discovered on that CPU.  Perform the HGEIE probe and bitmap
setup only on the first call, and set free_bitmap_initialized after
the bitmap has been populated.

Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 arch/riscv/kvm/aia.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index b3b466e4db33..a65748321f7d 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -610,6 +610,9 @@ void kvm_riscv_aia_enable(void)
 	lc = (gc) ? this_cpu_ptr(gc->local) : NULL;
 	hgctrl = this_cpu_ptr(&aia_hgei);
 
+	if (hgctrl->free_bitmap_initialized)
+		goto skip_hgctrl_init;
+
 	/* Figure-out number of bits in HGEIE */
 	csr_write(CSR_HGEIE, -1UL);
 	hgctrl->nr_hgei = fls_long(csr_read(CSR_HGEIE));
@@ -634,12 +637,11 @@ void kvm_riscv_aia_enable(void)
 	} while (!atomic_try_cmpxchg(&kvm_riscv_aia_nr_hgei, &aia_nr_hgei, hgctrl->nr_hgei));
 
 	raw_spin_lock_irqsave(&hgctrl->lock, flags);
-	if (!hgctrl->free_bitmap_initialized) {
-		hgctrl->free_bitmap = (hgctrl->nr_hgei) ? GENMASK_ULL(hgctrl->nr_hgei, 1) : 0;
-		hgctrl->free_bitmap_initialized = true;
-	}
+	hgctrl->free_bitmap = (hgctrl->nr_hgei) ? GENMASK_ULL(hgctrl->nr_hgei, 1) : 0;
+	hgctrl->free_bitmap_initialized = true;
 	raw_spin_unlock_irqrestore(&hgctrl->lock, flags);
 
+skip_hgctrl_init:
 	csr_write(CSR_HVICTL, aia_hvictl_value(false));
 	csr_write(CSR_HVIPRIO1, 0x0);
 	csr_write(CSR_HVIPRIO2, 0x0);

---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260924-free_bitmap_initialized-abdc94a528fb

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
