Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24875CD6E55
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pko1K5vfI9oJnHr6oYl1jVQVyv68SAqutKuLggHxdug=; b=A6gfH0kfDTz/F1
	skxhVkWpsnPNUpTC6ud0zJfSkFgJi9JbxeQYbTHA3wgYwWKrUw9JhOy73nRPBzth5D6lguJsfkn2Q
	xLmFcYJS6OTvIcF9dmagnk+QoZHrCPW8YCWRa/2+Z1urZ9E4eWp7TfZkWcZWqPcYNLQALjwln0Nfg
	TFW0u44tDp7F3bizbs6yXoLw/nB9KR4p9/ixfarhskkaYXGxFYJVSupwxlI720glckVKvQ6+GC3MP
	oFh2JqGREVFdxi0L/CoNBAhPFrejkuQ3/rA0c7CNaaXDlPkRNK/uQ24IzIlGDRcT299lMT+HXMF3k
	tqXL+jgc0EvYVOe/fSgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiJP-0000000EkqA-3jyt;
	Wed, 03 Jun 2026 09:54:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiJO-0000000Ekpv-3Tp2;
	Wed, 03 Jun 2026 09:54:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qnPFxC7Hphl5XSbHLNMyCvcdyO0h1Pnz/kUL/RPdqrc=; b=hfl5g70SvpQwCJu4/W+Gz9MfYi
	RYaB+IlGlOVL2+9BAdjAUoP8gcY33wRjvQn3mViVR+6a6tlJlnH+AVEC91IfQ3IV5YLbITTzff5k9
	jVCR6bFg18ZPdIDfXCN27KdS4q2bTVpzWWXGPTiN86x+9flr9gxIH4sXAeHtiKoYLprpWBFrk0jGv
	rsApxGdDw6iY6BI9D6XZZSHzjq04ZyBlR21KtVjhSHz1TBIKcDXIdETEAJ3PENphV8urKE1pZjQCy
	rQAA8QpS7z3URHYVl/A9nir4yNPZH192UPZoTWvG3D3UH4MrG3fDiL41D3Rx/1HXbxwG9oiYUlzOR
	ZvFpdrXA==;
Received: from mxct.zte.com.cn ([183.62.165.209])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUiJL-0000000Blo5-0yZD;
	Wed, 03 Jun 2026 09:54:57 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gVjjH10FWz58fdM;
	Wed, 03 Jun 2026 17:54:43 +0800 (CST)
Received: from szxlzmapp04.zte.com.cn ([10.5.231.166])
	by mse-fl1.zte.com.cn with SMTP id 6539sa0H073074;
	Wed, 3 Jun 2026 17:54:36 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 3 Jun 2026 17:54:39 +0800 (CST)
X-Zmail-TransId: 2b046a1ff9df49a-28dd2
X-Mailer: Zmail v1.0
Message-ID: <20260603175439237VrPTLz6fG79fXRYAu-JFW@zte.com.cn>
In-Reply-To: <20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn>
References: 20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn
Date: Wed, 3 Jun 2026 17:54:39 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDEvNF0gUklTQy1WOiBLVk06IEFkZCB0aGUgc3BsaXQgcGFnZSBjYWNoZSBmb3IgaW9jdGwgY29udGV4dA==?=
X-MAIL: mse-fl1.zte.com.cn 6539sa0H073074
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Wed, 03 Jun 2026 17:54:43 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1FF9E3.000/4gVjjH10FWz58fdM
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_105455_707350_17604C24 
X-CRM114-Status: UNSURE (   7.28  )
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
 arch/riscv/include/asm/kvm_host.h | 1 +
 arch/riscv/kvm/mmu.c              | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 75b0a951c1bc..0ee778f0f086 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -84,6 +84,7 @@ struct kvm_arch {
 	pgd_t *pgd;
 	phys_addr_t pgd_phys;
 	unsigned long pgd_levels;
+	struct kvm_mmu_memory_cache pgd_split_page_cache;

 	/* Guest Timer */
 	struct kvm_guest_timer timer;
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 2d3def024270..0676937bd9a1 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -549,6 +549,7 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
 	kvm->arch.pgd = page_to_virt(pgd_page);
 	kvm->arch.pgd_phys = page_to_phys(pgd_page);
 	kvm->arch.pgd_levels = kvm_riscv_gstage_max_pgd_levels;
+	kvm->arch.pgd_split_page_cache.gfp_zero = __GFP_ZERO;

 	return 0;
 }
@@ -572,6 +573,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)

 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
+
+	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }

 void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
