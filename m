Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6999FF8867
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 09:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkhkiGnD06ddZ9a+GQKwD3JK/nbd1wWY1IyPf7mFQmQ=; b=1JKQ0xpzDvLDeX
	l/6AvJc5wNa3QH6Aa2y8uPVKw8/GO7hKPMyMh/NsdA2C8rx+ZUWyhJABdJEmiRXt/hPspEmLJG847
	S7n9+HkvJiRP28S9wDjwPVXP25lFCK3/C+Q1/+N4/BpCVQQ+MwZUo5a7CaWO9Nd6gWj94qD/e+ldS
	b3Hlo6zfWJoJBjGrov2fd+b/7p3ijh28ruusGwY9judrYR8Rzqw4+kTf2nBAWwJWc3p0xU5C5pbRa
	kPZKpRPougzE0KRlppOm7YUPWD87UAeoV8K5ogx8Ze0KL02EvFYyGP3L5W2K0+mFQdBBdIvXeipIQ
	LS2wWdrQS47ikITNkRvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1KW-00000003Lwo-27e4;
	Wed, 29 Apr 2026 09:35:40 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1KU-00000003LwM-2G5C;
	Wed, 29 Apr 2026 09:35:39 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4g5BxK0Pmgz510Y1;
	Wed, 29 Apr 2026 17:35:33 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl1.zte.com.cn with SMTP id 63T9ZQKw066185;
	Wed, 29 Apr 2026 17:35:26 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 29 Apr 2026 17:35:29 +0800 (CST)
X-Zmail-TransId: 2b0569f1d0e15e3-a2163
X-Mailer: Zmail v1.0
Message-ID: <20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn>
In-Reply-To: <20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn>
References: 20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn
Date: Wed, 29 Apr 2026 17:35:29 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvM10gUklTQy1WOiBLVk06IFJlZmFjdG9yIGt2bV9hcmNoX2NvbW1pdF9tZW1vcnlfcmVnaW9uKCk=?=
X-MAIL: mse-fl1.zte.com.cn 63T9ZQKw066185
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Wed, 29 Apr 2026 17:35:33 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69F1D0E5.000/4g5BxK0Pmgz510Y1
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_023538_766483_1483A07D 
X-CRM114-Status: GOOD (  10.28  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

Refactor kvm_arch_commit_memory_region() as a preparation for a future
commit to look cleaner and more understandable. Also, it looks more
like its arm64 and x86 counterparts.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/mmu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..dc6a8efde99e 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -141,12 +141,22 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 				const struct kvm_memory_slot *new,
 				enum kvm_mr_change change)
 {
+	bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
+	bool read_only = new && new->flags & KVM_MEM_READONLY;
+
+	/*
+	 * Nothing more to do for RO slots (which can't be dirtied and can't be
+	 * made writable) or CREATE/MOVE/DELETE of a slot.
+	 */
+	if ((change != KVM_MR_FLAGS_ONLY) || read_only)
+		return;
+
 	/*
 	 * At this point memslot has been committed and there is an
 	 * allocated dirty_bitmap[], dirty pages will be tracked while
 	 * the memory slot is write protected.
 	 */
-	if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
+	if (log_dirty_pages) {
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
 		mmu_wp_memory_region(kvm, new->id);
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
