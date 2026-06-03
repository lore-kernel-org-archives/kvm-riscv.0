Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2D1CD6E64
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 10:00:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zn1kkdoTS3uwS0k6tge30B9J/DGlvXSDnjHGaR3ZD18=; b=J/d/2yuOBjKeCn
	AdRFmKltVhLcHLK57ByRsmwbuiOYkSJ0i2i/OqnC00uaZt/X4kRINXy/GINVHQQGjnp6CB/ZLJns2
	l4pWQ/bV1D1bvcDP7tZ/1pMJvAW7ntf8z+bs1I8Binr8rYPrKfDSA/lJnB0vScqnlXULLrT+oDX/c
	rMVNrdweDSr2gSxYjub/RYlxBPnZBTbDvb0GJaAJ/EDIGyh+0SUiKOt9w0vL2F50RMZrL+ccqnmVB
	Cd7mZOWyuyUOE8yUcC/ZHmzMHik2pKoAKV/zjA2F4+iMjYA0vc0SfCrllUn8HiGBC0XK4IGkO3LNW
	QXEdBFDZIBV4fwM0xtbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiOi-0000000ElMl-3Yzt;
	Wed, 03 Jun 2026 10:00:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiOi-0000000ElMV-1Uup;
	Wed, 03 Jun 2026 10:00:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Scz51yveqwaDBDofuY3Bs0Ggod5cmqUmG8YFW6eh2UE=; b=CsBFin8HCTbZ3VNDefvIH028yJ
	IXTXYgKozegJMgsOuK2EeQjGgrIUKsknqiwxhH8xpPBynafjmM3bb6T2AEoBpxDx4//aUIkxWlZ0r
	c4AFsW5/d6Wi6HRPZgh2sVt35/Fx+jmRw1w8MEU5tdQhBFAQjnYvOCEOnla8Ne1QBnki5dZrV/YlK
	D9ip08Zk+cYDbnagQDSuK8xj8LGW0vIRVip0wzL0TlajrSbcmMT1y8wnPYL5FEM1WrvSsr16du5KT
	n3F8LXKIDVUb20jg1Zq67TYimIvFsVVTZyk9ghrk1zzBZKaOB5S2MMQQB4vrMdXhJiR7J/HDXu5l1
	UuawcS+w==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUiOf-0000000BmjW-0ZRl;
	Wed, 03 Jun 2026 10:00:27 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gVjqj4Sq7z59ys5;
	Wed, 03 Jun 2026 18:00:17 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl1.zte.com.cn with SMTP id 653A082J081933;
	Wed, 3 Jun 2026 18:00:08 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 3 Jun 2026 18:00:11 +0800 (CST)
X-Zmail-TransId: 2b086a1ffb2bbd8-e8550
X-Mailer: Zmail v1.0
Message-ID: <202606031800111580inoldUz6HzVPmAbLW2SX@zte.com.cn>
In-Reply-To: <20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn>
References: 20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn
Date: Wed, 3 Jun 2026 18:00:11 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
        <linux-doc@vger.kernel.org>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDQvNF0gUklTQy1WOiBLVk06IEFkZCB0aGUgZWFnZXJfcGFnZV9zcGxpdCBtb2R1bGUgcGFyYW1ldGVy?=
X-MAIL: mse-fl1.zte.com.cn 653A082J081933
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 03 Jun 2026 18:00:17 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1FFB31.000/4gVjqj4Sq7z59ys5
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_110025_575864_55028498 
X-CRM114-Status: GOOD (  10.94  )
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

Add an eager_page_split module parameter for RISC-V KVM, following
the same approach as on x86. This parameter controls whether eager
page splitting is enabled. The default value is on.

When eager page splitting is enabled, KVM proactively splits large
pages (huge pages) into smaller pages when needed for dirty logging
or other operations. Disabling it can be beneficial for VM workloads
that rarely perform writes, or that only write to a small region of
memory, as it allows huge pages to remain intact for read accesses.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++--
 arch/riscv/kvm/mmu.c                            | 13 ++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4d0f545fb3ec..d443b5313b79 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3059,7 +3059,7 @@ Kernel parameters
 			Default is 0 (don't ignore, but inject #GP)

 	kvm.eager_page_split=
-			[KVM,X86] Controls whether or not KVM will try to
+			[KVM,X86,RISCV] Controls whether or not KVM will try to
 			proactively split all huge pages during dirty logging.
 			Eager page splitting reduces interruptions to vCPU
 			execution by eliminating the write-protection faults
@@ -3079,7 +3079,10 @@ Kernel parameters
 			the KVM_CLEAR_DIRTY ioctl, and only for the pages being
 			cleared.

-			Eager page splitting is only supported when kvm.tdp_mmu=Y.
+			On x86, eager page splitting is only supported when
+			kvm.tdp_mmu=Y.
+
+			On RISCV, eager page splitting is supported by default.

 			Default is Y (on).

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index d04680687f4a..7a910c5a61fe 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -16,6 +16,9 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>

+bool __read_mostly eager_page_split = true;
+module_param(eager_page_split, bool, 0644);
+
 static void mmu_wp_memory_region(struct kvm *kvm, int slot)
 {
 	struct kvm_memslots *slots = kvm_memslots(kvm);
@@ -150,8 +153,10 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,

 	kvm_riscv_gstage_wp_range(&gstage, start, end);

-	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
-		mmu_split_huge_pages(&gstage, start, end, true);
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm)) {
+		if (READ_ONCE(eager_page_split))
+			mmu_split_huge_pages(&gstage, start, end, true);
+	}
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
@@ -216,7 +221,9 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 		if (kvm_dirty_log_manual_protect_and_init_set(kvm))
 			return;
 		mmu_wp_memory_region(kvm, new->id);
-		mmu_split_memory_region(kvm, new->id);
+
+		if (READ_ONCE(eager_page_split))
+			mmu_split_memory_region(kvm, new->id);
 	}
 }

-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
