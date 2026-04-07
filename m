Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7258CEDB7D4
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 09:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6f42VDX4/o/D3iAKbOzckV+bUj3WjEcyP1jCYqk8VQ=; b=2fheS7Cuj69mwt
	Um7Wn4g0hek2xM6OmEOzcyTGEuK2WvHIY/3ccvLps6YbZhGB7E2rW3NmO7scCkQ03VHzzX7bwQR3D
	iRMTkF0HDBRbPGdtlKYnw8ys7C78hZ6Cjcs/Xgwgkai2PXk1KA7mU0zADQDTgu7qzCzETrAutyucP
	zvlzWW27guK0VvbwKsSMSm/mLxpl8Wl8L8NXMRXXV3yZY277hTjPZiWWshaC07pfiPD54hIm4WQT/
	592p8KH8h0kzMkBzqbxV19aglYBxqNp8rKIxoKQsLabb1drRVQqfobQwTD9ZGdqp+C8ffviYuDIkR
	sCYWli5I+qmh5KW4hUMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2VS-00000006Cln-3Ajt;
	Tue, 07 Apr 2026 09:13:58 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2VP-00000006Ckk-2hUg;
	Tue, 07 Apr 2026 09:13:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fqgVN3l4Wz8Xs70;
	Tue, 07 Apr 2026 17:13:48 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl1.zte.com.cn with SMTP id 6379DZhh068225;
	Tue, 7 Apr 2026 17:13:35 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 7 Apr 2026 17:13:38 +0800 (CST)
X-Zmail-TransId: 2b0569d4cac2d33-9076c
X-Mailer: Zmail v1.0
Message-ID: <20260407171338173YQ_-quPfgvXzr9BX4WY-q@zte.com.cn>
In-Reply-To: <20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn>
References: 20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn
Date: Tue, 7 Apr 2026 17:13:38 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDEvM10gUklTQy1WOiBLVk06IFJlZmFjdG9yIGt2bV9hcmNoX2NvbW1pdF9tZW1vcnlfcmVnaW9uKCk=?=
X-MAIL: mse-fl1.zte.com.cn 6379DZhh068225
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 07 Apr 2026 17:13:48 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69D4CACC.003/4fqgVN3l4Wz8Xs70
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_021356_727470_D56A9E86 
X-CRM114-Status: GOOD (  10.43  )
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
index c3539f660142..d2116c09c589 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -156,12 +156,22 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
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
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
