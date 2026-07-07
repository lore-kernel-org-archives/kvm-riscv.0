Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26F6BC44500
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 11:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b/8N4GLqKfILxFk5X9qaXrX2DaFxLuYvXql+WYlMgQE=; b=vBssAMiSXEpnho
	ELLyB48G6FLm0IgD8xAmsHDI9Y8xH5G7N6BJx04eJyGcrXaSGyXvfjzLhDGltJZhsbIiZ6cGM20cr
	pqQBfMITE4ERDqWeRWcRMjC9RjiKEFjMSwXXegwj7uUoi65+I5Dtq3ZNg4EwxdYoj9VPQBt5JlW8w
	Cpr1n1C+/XtWbDcU0De+jYazjqGF2ZF2gspthvGUf4/D7Dw4cQJOxj4xXcSOEN8UJtPBT61aMBPPX
	k2Brh53fD+07dJb3S9apWiRqdr7RQTf6rBAuvB6S83oFleQq1dZ7EJg9Qar+HzXMqH5eDw6JR8pkk
	1XD75xFJagqAB+VrFNAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh48Q-0000000Erze-2YyP;
	Tue, 07 Jul 2026 11:38:42 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh48M-0000000ErwU-27BA;
	Tue, 07 Jul 2026 11:38:41 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gvfPB5VnVz57KTp;
	Tue, 07 Jul 2026 19:38:22 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 667BcK5b063386;
	Tue, 7 Jul 2026 19:38:20 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 7 Jul 2026 19:38:22 +0800
X-Zmail-TransId: 3e816a4ce52e009-636fb
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
Subject: [PATCH 1/2] RISC-V: KVM: Move hfence type check out of loop
Date: Tue,  7 Jul 2026 19:37:06 +0800
Message-ID: <20260707113715.413265-2-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260707113715.413265-1-wang.yechao255@zte.com.cn>
References: <20260707113715.413265-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 667BcK5b063386
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Tue, 07 Jul 2026 19:38:22 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4CE52E.000/4gvfPB5VnVz57KTp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_043839_097702_D92FFCF8 
X-CRM114-Status: GOOD (  11.32  )
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

Currently, the check for `data` and `data->type` is performed inside
the loop iterating over each VCPU. Since these values are invariant
during the loop, this check is redundant and adds unnecessary
overhead.

Move the validation to the beginning of the function, returning early
if the hfence data or its type is invalid. This avoids repeated
checks and reduces CPU cycles, which is particularly beneficial for
SMP guests with a large number of VCPUs.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/tlb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index 993b25ea94d67..a67b44a4d1d7a 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -335,6 +335,9 @@ static void make_xfence_request(struct kvm *kvm,
 	unsigned int actual_req = req;
 	DECLARE_BITMAP(vcpu_mask, KVM_MAX_VCPUS);
 
+	if (!data || !data->type)
+		return;
+
 	bitmap_zero(vcpu_mask, KVM_MAX_VCPUS);
 	kvm_for_each_vcpu(i, vcpu, kvm) {
 		if (hbase != -1UL) {
@@ -347,9 +350,6 @@ static void make_xfence_request(struct kvm *kvm,
 
 		bitmap_set(vcpu_mask, i, 1);
 
-		if (!data || !data->type)
-			continue;
-
 		/*
 		 * Enqueue hfence data to VCPU hfence queue. If we don't
 		 * have space in the VCPU hfence queue then fallback to
-- 
2.43.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
