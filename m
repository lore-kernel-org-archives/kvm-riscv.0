Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2C6CD6E77
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 23:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mzs+lSgOleZdp5tlk5a7TMDcEMrGBSrWNUj6T2PAIls=; b=N3f8ft9bdHrSda
	LwsjJOoO9B0AQvm8WWCc8xjzQU/ULx3s4kfx8qZoAX1DkESlRiP9XOOdMTpGQhSSKQsnB/0zcjoV3
	V4CmGyGHDaR7klM3P4vVD180vP1wFwJIVieKOwlPLog0j7TX/Tff3Sr1DxrufaFj0xLl+7oE5H6FJ
	hjPOhgL2Cga1k+Txm4wr0FYPh9Ebd0baTWjTM0W2ede2MYz2P0Usbyos6y9TdjgJN6mwIsCTqeehC
	VEtrhsNzyJtq/esUH1bnCSCO3u0Z33VKK4ifeA9IdTT9FaEFInnDjmZUrbnOl/POJU92CP5+SfjzZ
	b6ruiU1OLBefzvs8JGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7W-0000000HQeY-2gVi;
	Thu, 04 Jun 2026 23:05:02 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVH7T-0000000HQcm-0Hh9;
	Thu, 04 Jun 2026 23:05:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=vw
	XeKstSB0GbnzZJywYDxzZVE02bB56coa++tH6Xf6I=; b=JWmUvWsUWhRUWhvgrG
	mUpTBPvQUiyJlJl4SY6AcOVJOP4thhMdMTfftnpKd6PJo+5GcD0vmU9AcfUcTtQG
	q3w+1jl9V8KmeslOTJlg9djUHxt9ux4QrLhTY0OonghIrr1eI32IUUHKeGejcsU3
	QR3g+SMABNecfP6vNbPtkP1SE=
Received: from wufei (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id _____wA3H9tJBCJqsfP6BQ--.26783S3;
	Fri, 05 Jun 2026 07:03:49 +0800 (CST)
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
Subject: [PATCH v2 1/2] RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
Date: Fri,  5 Jun 2026 07:03:14 +0800
Message-ID: <20260604230317.30501-2-atwufei@163.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260604230317.30501-1-atwufei@163.com>
References: <20260604230317.30501-1-atwufei@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wA3H9tJBCJqsfP6BQ--.26783S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7GFyUtrW8Cw4fKFWUKF47XFb_yoW8JF1rpF
	sxuFy5Cr1rJFs3CF13tFZ8ZwsxKrs8Ka15KryUCa409Fn0grWUtrn7XrW29rW3Xr1kXrW3
	uFZ0qFy5ur4xKaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jxgAwUUUUU=
X-Originating-IP: [240e:38c:8516:b200:1f3:8926:223c:5bc8]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/xtbC7xU52moiBFXcQgAA3e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_160459_488654_E8DA9ACB 
X-CRM114-Status: GOOD (  10.12  )
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

The current gstage range walker unconditionally advances by 'page_size'
when a leaf PTE is not found, e.g. when the range to wp is
[0xfffff01fc000, 0xfffff023c000) and page_size is 2MB, if found_leaf of
0xfffff01fc000 returns false, it skip the whole range, but it's possible
to have valid entries in [0xfffff0200000, 0xfffff023c000).

Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
---
 arch/riscv/kvm/gstage.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index d9fe8be2a151..2b141a78ecac 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -429,14 +429,14 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
 		if (ret)
 			break;
 
-		if (!found_leaf)
-			goto next;
-
-		addr = ALIGN_DOWN(addr, page_size);
-		kvm_riscv_gstage_op_pte(gstage, addr, ptep,
-					ptep_level, GSTAGE_OP_WP);
-next:
-		addr += page_size;
+		if (!found_leaf) {
+			addr = ALIGN(addr + 1, page_size);
+		} else {
+			addr = ALIGN_DOWN(addr, page_size);
+			kvm_riscv_gstage_op_pte(gstage, addr, ptep,
+						ptep_level, GSTAGE_OP_WP);
+			addr += page_size;
+		}
 	}
 }
 
-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
