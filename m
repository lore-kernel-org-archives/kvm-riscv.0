Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A20C43458
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 12:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vTgnaK8iBy/1/6xrtB5da7uNoMj6LgLPYtaCZdVOTXw=; b=Tzirkr9ueVltHP
	cEkRE3tHYtVmlcDq2wi/PFw+9jYNnuv0rPbXGw0ki7hQqksoA9Xna3v5NwFohSWhufqyIgDP/eSKb
	YG0jjTBJ77VgkzolQ3v1inqCnP7ItGD4Py/n7225tGs9K4B858jb1UFbLRm1sFrrinedh96vgdd5b
	nicWMVlENdV80buYzp7hAz1DUFy3nk/L+6r6deHJxY4y+A6fMjBFlRVoTZaI3IVtT3sCyWhr70edD
	5J8THWacpybDgo+5XrrclJQ/gjOAJ+QJSvCrz2C941vtQQ2WAzCTmPyXsJDREIJbACZYjTFsfIfQX
	CSHIrtOHlgl8JQXQS4Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5IP-0000000F00j-1oYn;
	Tue, 07 Jul 2026 12:53:05 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh5IM-0000000Ezz5-0UuC;
	Tue, 07 Jul 2026 12:53:03 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gvh3J2Jllz8XrrM;
	Tue, 07 Jul 2026 20:53:00 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl2.zte.com.cn with SMTP id 667Cqntc020728;
	Tue, 7 Jul 2026 20:52:49 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 7 Jul 2026 20:52:52 +0800
X-Zmail-TransId: 3e816a4cf6a4009-66217
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
Subject: [PATCH v2 1/2] RISC-V: KVM: Introduce make_xfence_request_nodata for FENCE.I requests
Date: Tue,  7 Jul 2026 20:50:20 +0800
Message-ID: <20260707125034.416521-2-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
References: <20260707125034.416521-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 667Cqntc020728
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 07 Jul 2026 20:53:00 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4CF6AC.000/4gvh3J2Jllz8XrrM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_055302_312987_FA991D89 
X-CRM114-Status: GOOD (  12.70  )
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

FENCE.I does not need hfence data, but it currently goes through the
generic make_xfence_request() path with NULL data, incurring unnecessary
per-VCPU checks.

Split out a separate make_xfence_request_nodata() function to handle
FENCE.I directly, and move the data validity check to the top of the
generic function to avoid redundant checks.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/tlb.c | 32 +++++++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 993b25ea94d67..5a9c75e458013 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -325,6 +325,29 @@ void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void make_xfence_request_nodata(struct kvm *kvm, unsigned long hbase,
+				       unsigned long hmask, unsigned int req)
+{
+	unsigned long i;
+	struct kvm_vcpu *vcpu;
+	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
+
+	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
+	kvm_for_each_vcpu(i, vcpu, kvm) {
+		if (hbase != -1UL) {
+			if (vcpu->vcpu_id < hbase ||
+				vcpu->vcpu_id >= hbase + BITS_PER_LONG)
+				continue;
+			if (!(hmask & (1UL << (vcpu->vcpu_id - hbase))))
+				continue;
+		}
+
+		bitmap_set(vcpu_mask, i, 1);
+	}
+
+	kvm_make_vcpus_request_mask(kvm, req, vcpu_mask);
+}
+
 static void make_xfence_request(struct kvm *kvm,
 				unsigned long hbase, unsigned long hmask,
 				unsigned int req, unsigned int fallback_req,
@@ -335,6 +358,9 @@ static void make_xfence_request(struct kvm *kvm,
 	unsigned int actual_req = req;
 	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
 
+	if (!data || !data->type)
+		return;
+
 	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
@@ -347,9 +373,6 @@ static void make_xfence_request(struct kvm *kvm,
 
 		bitmap_set(vcpu_mask, i, 1);
 
-		if (!data || !data->type)
-			continue;
-
 		/*
 		 * Enqueue hfence data to VCPU hfence queue. If we don't
 		 * have space in the VCPU hfence queue then fallback to
@@ -365,8 +388,7 @@ static void make_xfence_request(struct kvm *kvm,
 void kvm_riscv_fence_i(struct kvm *kvm,
 		       unsigned long hbase, unsigned long hmask)
 {
-	make_xfence_request(kvm, hbase, hmask, KVM_REQ_FENCE_I,
-			    KVM_REQ_FENCE_I, NULL);
+	make_xfence_request_nodata(kvm, hbase, hmask, KVM_REQ_FENCE_I);
 }
 
 void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
-- 
2.43.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
