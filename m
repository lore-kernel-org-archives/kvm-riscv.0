Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E079CD6E7C
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 23:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVjSCTen/nmkbcBuBPKKNa5leKf+EfH+/PB/0MaLbR4=; b=Fgmo5HrUCI3shO
	XLYA7MV/l8m+Y70wTYROkzEhG4YkzXytasA8g2XWOkDVcAteWCcQ4W7fajCpSOGUONB4lMuvTUiNR
	ZzajISuDt+PcTWrTpD4qFAVJUY1jfYuLqHD8SmefX3Ul3QYCU845FZUQ5t+X90wx8GGrFaGzikDTi
	NcJTy9/UEhh8AxYaozdEHQZd2T4EPlurCp1GoBvmgDexbOUh7SO71OoGJNIIE8oJ4lABEOQ6HoTTh
	cKCF3MNFvSIzAt7r1ozP9ItWYsX+xhFE0jYUNQa8QcuBXOkZc+bRI+tCw+MzNkOkFRxgv2dTW989C
	pHnlFl41gDumoX0niRVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7X-0000000HQf8-3IkE;
	Thu, 04 Jun 2026 23:05:03 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7T-0000000HQcn-3lop;
	Thu, 04 Jun 2026 23:05:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hp
	TAP1nL3qYWFA5TtGpFod5MmlFUh4wPDF/QkCHoWUc=; b=NZzRJ8hBgx1Ee/7eDq
	EEqgbdBUD3+vOM0UApoX2xdWpSOtiTFsq+hQczw+r8w+VhbVRMOSpxvZLKW193bQ
	PsBFRlp3jXkHZ0Gj6sobNR+YZjyu/+sNRufkXxQrS+RYM4cnmOE6V7czWDTiPpxc
	Q+LAbbHYMBrsxzF97BNiC1r4o=
Received: from wufei (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3H9tJBCJqsfP6BQ--.26783S4;
	Fri, 05 Jun 2026 07:03:52 +0800 (CST)
From: atwufei@163.com
To: seanjc@google.com,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Wu Fei <wu.fei9@sanechips.com.cn>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range
Date: Fri,  5 Jun 2026 07:03:15 +0800
Message-ID: <20260604230317.30501-3-atwufei@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604230317.30501-1-atwufei@163.com>
References: <20260604230317.30501-1-atwufei@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3H9tJBCJqsfP6BQ--.26783S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF4xKw1kXFWrGrW7JFykuFg_yoW8GF1Upr
	sxCas3Cr1rtwsxZF13tFWkuwsxGrs3KF43try7Za4v9Fn8Xw48Arn7Xr929rW3XF97XayD
	uFWDGFyrur4IqwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsYFAUUUUU=
X-Originating-IP: [240e:38c:8516:b200:1f3:8926:223c:5bc8]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/xtbCzRg622oiBFjtWwAA3W
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_160500_338853_2D28DFFD 
X-CRM114-Status: GOOD (  10.04  )
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

From: Wu Fei <wu.fei9@sanechips.com.cn>

Same as kvm_riscv_gstage_wp_range, the possible valid pages should not
be skipped if !found_leaf. Different from wp case, which can
write-protect more than asked, unmap can't do that, no splitting is
added right now but a warning is logged instead.

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 arch/riscv/kvm/gstage.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 2b141a78ecac..d78f5aeb8b40 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -395,15 +395,19 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
 		if (ret)
 			break;
 
-		if (!found_leaf)
-			goto next;
-
-		if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
-			kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-						ptep_level, GSTAGE_OP_CLEAR);
+		if (!found_leaf) {
+			addr = ALIGN(addr + 1, page_size);
+		} else {
+			if (!(addr & (page_size - 1)) && ((end - addr) >= page_size))
+				kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+							ptep_level, GSTAGE_OP_CLEAR);
+			else {
+				WARN_ONCE(1, "Skip unmap range addr: %#llx, end: %#llx, page_size: %#lx\n",
+						addr, end, page_size);
+			}
 
-next:
-		addr += page_size;
+			addr += page_size;
+		}
 
 		/*
 		 * If the range is too large, release the kvm->mmu_lock
-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
