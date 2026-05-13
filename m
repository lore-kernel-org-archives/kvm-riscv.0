Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96178CD4851
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6RUUpG7xCVptzHx50b3oBdRwYr6trHhPxSs5mt/8ctc=; b=2WmHXWptgqRtj+
	rqY72uzUEKoxmk2W4Mw9w6L0jmaO4IwfM+KtS2CDi71B1k3qrlrv7bA5MLDyw61GozfLemtS7WWNv
	Er+9lucOQ4LoybhQZ7Rl7DnSVFPLTp4mDd+mcae482UE08dBf1KQPzDvXlPqI5V1xHITR6hv6em/l
	QHOUycCWe2dH7c+3SpNTSUk5/rk//BF5YPF8MeRaPsAetyK5Vjkj68ma25QBO8ToulaVC2coPooPw
	AcapsdwSPjBFFd5lpVKeGoAUzDtwIuTxGcQEecNPi8dbOIepoKBbQrIQ4/xJL/HXgSQxTVlo1i1Iz
	OCtQUyW4q7X7oWzTyINQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Bk-00000001bAg-1Ykp;
	Wed, 13 May 2026 07:39:28 +0000
Received: from mxde.zte.com.cn ([209.9.37.142])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN4Bh-00000001b9y-2Yao;
	Wed, 13 May 2026 07:39:27 +0000
Received: from mxhk.zte.com.cn (unknown [192.168.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4gFlhn4HlpzBfcW8;
	Wed, 13 May 2026 15:39:21 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFlhY3fM6z5B0n0;
	Wed, 13 May 2026 15:39:09 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 64D7cxSP050732;
	Wed, 13 May 2026 15:38:59 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 13 May 2026 15:39:01 +0800 (CST)
X-Zmail-TransId: 2b096a042a95c50-ca1cc
X-Mailer: Zmail v1.0
Message-ID: <20260513153901371U0gWZRa45N893VGbU7Gf9@zte.com.cn>
In-Reply-To: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn>
References: 20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn
Date: Wed, 13 May 2026 15:39:01 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDEvNF0gUklTQy1WOiBLVk06IEFkZCB0aGUgc3BsaXQgcGFnZSBjYWNoZSBmb3IgaW9jdGwgY29udGV4dA==?=
X-MAIL: mse-fl1.zte.com.cn 64D7cxSP050732
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 192.168.250.138 unknown Wed, 13 May 2026 15:39:21 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A042AA8.000/4gFlhn4HlpzBfcW8
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_003925_803860_B95A9EB8 
X-CRM114-Status: UNSURE (   7.25  )
X-CRM114-Notice: Please train this message.
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

Add the split page cache for dirty logging enablement and the
KVM_CLEAR_DIRTY_LOG ioctl.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/include/asm/kvm_host.h | 2 ++
 arch/riscv/kvm/mmu.c              | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..e2f40854305f 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -93,6 +93,8 @@ struct kvm_arch {

 	/* KVM_CAP_RISCV_MP_STATE_RESET */
 	bool mp_state_reset;
+
+	struct kvm_mmu_memory_cache split_page_cache;
 };

 struct kvm_cpu_trap {
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..85a3fb2622a4 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -549,6 +549,7 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	kvm->arch.pgd = page_to_virt(pgd_page);
 	kvm->arch.pgd_phys = page_to_phys(pgd_page);
 	kvm->arch.pgd_levels = kvm_riscv_gstage_max_pgd_levels;
+	kvm->arch.split_page_cache.gfp_zero = __GFP_ZERO;

 	return 0;
 }
@@ -572,6 +573,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)

 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+
+	kvm_mmu_free_memory_cache(&kvm->arch.split_page_cache);
 }

 void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
