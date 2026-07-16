Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00ACC4450A
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IId9JFgKJLwJYJOEFQ/gsHbpSbQgPSUDVP8vFNaOqD8=; b=yJ3hMgqYYEhvPV
	8zEFedNGsy2x9HCCOB0DFuVbafQPRRE8v63UxtbaQ/5fMg1Tbj+VK2cttXit4MG01o4gsNYOji+ZY
	cum5rHEZIHEyALuzMe6Rvgm7/XyV03JRtpO+0SQKeiHj6S2IuqoncGZwtB9ephvylDlIEBQ2gTZfm
	jamqZJMBc6M/GNdDlnjxIGAnwG+tqZydvAM318kvFaTgsdSoQP4/HmLexZbUBVvEeyRrIdY0gVcDb
	Xo1Yn51PakP9fq40Y1duYqQa+jByk37zkUxBgZU5TINKFxJRVbwWStSCREGb5PyWUyNC2CECQ/lav
	1zxv7MMmvdks41YDPM6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgc-0000000Gfnr-0b4n;
	Thu, 16 Jul 2026 07:39:14 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGgZ-0000000GflU-1a2I;
	Thu, 16 Jul 2026 07:39:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=0J
	XU3cAUzaSbuwG+IlW2Ctt3lxfI9p33+cxpVmrZTCY=; b=BpfmbnTxJjIhkGOMH4
	evePfG+TieRPYpeMG7SNLkqTTeuA1k8xRJmqZbjG3CM+xyanBeAa10dvjwGALRw+
	d9mtF3Auf40V8cyk4QvabMEiBdgZdaPWrHZZZaOkHyE6oZizvbxxf9f5IUylarnS
	3z5yiL4qxscG9vju/XdDlscS0=
Received: from thinkpadx13gen2i.. (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wBXvgNdilhqW6A9Jw--.32504S2;
	Thu, 16 Jul 2026 15:38:06 +0800 (CST)
From: Zongmin Zhou <min_halo@163.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zongmin Zhou <zhouzongmin@kylinos.cn>
Subject: [PATCH] KVM: riscv: Fix infinite loop in NACL hfence entry allocation
Date: Thu, 16 Jul 2026 15:37:56 +0800
Message-Id: <20260716073756.44153-1-min_halo@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wBXvgNdilhqW6A9Jw--.32504S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrWrGFy3AF45Gr1UAry3XFb_yoWDWwc_C3
	WxX3yxWrW8ta1jv3Z3Ww4rXF4aya98C34DGr1Iyry7ta4Fq3yaqa4kKw1DGryUAr45Zasx
	Jr1rXr13Z3ZrujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8jiiDUUUUU==
X-Originating-IP: [116.128.244.169]
X-CM-SenderInfo: pplqsxxdorqiywtou0bp/xtbC8x5qFmpYil75OQAA33
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_003911_851164_ED513363 
X-CRM114-Status: GOOD (  10.41  )
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

From: Zongmin Zhou <zhouzongmin@kylinos.cn>

try_count is initialized to 5 but never decremented in the retry path,
making the `if (try_count)` check always true. If all NACL shared memory
hfence entries remain in the pending state after sync, the function loops
forever, causing a soft lockup. Decrement try_count on each retry so the
fallback warning and return become reachable.

Fixes: d466c19cead5 ("RISC-V: KVM: Add common nested acceleration support")
Signed-off-by: Zongmin Zhou <zhouzongmin@kylinos.cn>
---
 arch/riscv/kvm/nacl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/nacl.c b/arch/riscv/kvm/nacl.c
index 6f9f8963e9dd..9aff03c4f667 100644
--- a/arch/riscv/kvm/nacl.c
+++ b/arch/riscv/kvm/nacl.c
@@ -33,7 +33,7 @@ void __kvm_riscv_nacl_hfence(void *shmem,
 	}
 
 	if (ent < 0) {
-		if (try_count) {
+		if (try_count--) {
 			nacl_sync_hfence(-1UL);
 			goto again;
 		} else {
-- 
2.34.1


No virus found
		Checked by Hillstone Network AntiVirus


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
