Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D590FC43602
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tq0Uzc1lgMYDMcfF+yDkCrV0OChlKZ7hnI/L4oBc5yc=; b=D0lkWLAOitMH+N
	TWcwmy2WU8vPjOHYECU4pQ0wiIcaZcKtuRlEhVYclH5P8r85C0N1efrEOa2JoV2NDbjK/cjBdQvw0
	JG5CNd5lcLKP39bRlek9mHy4GBMRx9xB7tDW1qZZO64GDFDdRzSps6SuZwbx4b1XbMOIrZf/cwfnm
	cVj4KxE1VMsPq/AI0BU1i++zBN/6o6cJP+5Yj0qeMtF8HjGTc6axUYUte09KOojoOn4cnWKLmUYRf
	g2ovXbuRuv1YGdnL7VmiC5U+6LGFftVkatDcz6eh1TmWiNfLRoU8bNF9iFj1bb25w3m0WnLsDhz/o
	PNqRQpwDjnRZ0O9pXgBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5IQ-0000000F01N-2Of8;
	Tue, 07 Jul 2026 12:53:06 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5IN-0000000Ezz7-0KYn;
	Tue, 07 Jul 2026 12:53:04 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gvh3J6mN6z4yjjH;
	Tue, 07 Jul 2026 20:53:00 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 667CqpoG020731;
	Tue, 7 Jul 2026 20:52:51 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 7 Jul 2026 20:52:54 +0800
X-Zmail-TransId: 3e816a4cf6a6009-66222
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
Subject: [PATCH v2 2/2] RISC-V: KVM: Separate req and fallback_req masks in make_xfence_request
Date: Tue,  7 Jul 2026 20:50:21 +0800
Message-ID: <20260707125034.416521-3-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
References: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 667CqpoG020731
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 07 Jul 2026 20:53:00 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4CF6AC.000/4gvh3J6mN6z4yjjH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_055303_269027_75F95A85 
X-CRM114-Status: GOOD (  12.17  )
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
 arch/riscv/kvm/tlb.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 5a9c75e458013..fd445e9fa3f94 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -355,13 +355,14 @@ static void make_xfence_request(struct kvm *kvm,
 {
 	unsigned long i;
 	struct kvm_vcpu *vcpu;
-	unsigned int actual_req = req;
-	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+	DECLARE_BITMAP(req_vcpu_mask, KVM_MAX_VCPUS);
+	DECLARE_BITMAP(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 
 	if (!data || !data->type)
 		return;
 
-	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
+	bitmap_zero(req_vcpu_mask, KVM_MAX_VCPUS);
+	bitmap_zero(fallback_req_vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
 			if (vcpu->vcpu_id < hbase ||
@@ -371,18 +372,19 @@ static void make_xfence_request(struct kvm *kvm,
 				continue;
 		}
 
-		bitmap_set(vcpu_mask, i, 1);
-
 		/*
 		 * Enqueue hfence data to VCPU hfence queue. If we don't
 		 * have space in the VCPU hfence queue then fallback to
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
2.43.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
