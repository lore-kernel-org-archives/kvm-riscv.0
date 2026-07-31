Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BE6C55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nffNo7krDjMoBdDRW6+NPY99T/KaMotmWFq3scfVVA0=; b=LqTqwR3nvyU2Iv
	/EVTjtdzFNp4DRpMleAlTxxTNQDmzWaE83glb1XkPhSxC6ugEfM24BT0CN05Dpmgl8y8FIt8WP2aa
	4xv8byGCEC7lchLmmNJ2durGMZKCFouV+haRLX/z52I5WPF4I3hxMsekY/xnbOd41Yten8VsL/8ey
	RZCRKTc0f1YofZ3s+iA0wjJ+iQV/kTI9vi/0x+nkMfDFnOS98cuiK3sdYLv2K61spSZ94rOQaRvwz
	ydvqPtG2+NsmJbrasiFJ4ifJrUzdirKxvdX4I1InIevYVSHjoMOnytcQ6dRZKsmYguzfbv2vkBGan
	+6qWSHLmGMK8OslWuJww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkn-0000000CD2Y-2XjC;
	Fri, 31 Jul 2026 09:42:09 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkl-0000000CD1D-0spt;
	Fri, 31 Jul 2026 09:42:08 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hBLgw67mtz5B0wH;
	Fri, 31 Jul 2026 17:42:04 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 66V9ftFZ009379;
	Fri, 31 Jul 2026 17:41:55 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:41:58 +0800
X-Zmail-TransId: 3e816a6c6de5010-3f314
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v3 1/2] RISC-V: KVM: Separate req and fallback_req masks in make_xfence_request
Date: Fri, 31 Jul 2026 17:38:27 +0800
Message-ID: <20260731093833.1551341-2-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 66V9ftFZ009379
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 17:42:04 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C6DEC.002/4hBLgw67mtz5B0wH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024207_436196_71F829B6 
X-CRM114-Status: GOOD (  12.51  )
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

When handling hfence requests in make_xfence_request(), the current code
uses a single 'actual_req' variable and a single vcpu_mask. If any VCPU
fails to enqueue the hfence data (because its queue is full), the request
falls back to 'fallback_req' for all VCPUs, even if other VCPUs still
have available queue space.

This can cause unnecessary fallback for healthy VCPUs, and more seriously,
those healthy VCPUs will not process their already-enqueued hfence
requests because no 'req' is set for them. As a result, their queues will
quickly become full as well, degrading performance for SMP guests.

Fix this by maintaining two separate bitmaps: one for VCPUs that
successfully enqueued the hfence data (req_vcpu_mask) and another for
those that failed (fallback_req_vcpu_mask). Then send the appropriate
requests to each group. This ensures that fallback is only applied to
VCPUs that actually need it, preserving the efficiency of the normal
path for others.

Fixes: 13acfec2dbcc ("RISC-V: KVM: Add remote HFENCE functions based on VCPU requests")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/tlb.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 993b25ea94d67..c54522decaa64 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -332,10 +332,11 @@ static void make_xfence_request(struct kvm *kvm,
 {
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
-	unsigned int actual_req = req;
-	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+	DECLARE_BITMAP(req_vcpu_mask, KVM_MAX_VCPUS);
+	DECLARE_BITMAP(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 
-	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
+	bitmap_zero(req_vcpu_mask, KVM_MAX_VCPUS);
+	bitmap_zero(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
 			if (vcpu->vcpu_id < hbase ||
@@ -345,10 +346,10 @@ static void make_xfence_request(struct kvm *kvm,
 				continue;
 		}
 
-		bitmap_set(vcpu_mask, i, 1);
-
-		if (!data || !data->type)
+		if (!data || !data->type) {
+			bitmap_set(req_vcpu_mask, i, 1);
 			continue;
+		}
 
 		/*
 		 * Enqueue hfence data to VCPU hfence queue. If we don't
@@ -356,10 +357,13 @@ static void make_xfence_request(struct kvm *kvm,
 		 * a more conservative hfence request.
 		 */
 		if (!vcpu_hfence_enqueue(vcpu, data))
-			actual_req = fallback_req;
+			bitmap_set(fallback_req_vcpu_mask, i, 1);
+		else
+			bitmap_set(req_vcpu_mask, i, 1);
 	}
 
-	kvm_make_vcpus_request_mask(kvm, actual_req, vcpu_mask);
+	kvm_make_vcpus_request_mask(kvm, req, req_vcpu_mask);
+	kvm_make_vcpus_request_mask(kvm, fallback_req, fallback_req_vcpu_mask);
 }
 
 void kvm_riscv_fence_i(struct kvm *kvm,
-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
