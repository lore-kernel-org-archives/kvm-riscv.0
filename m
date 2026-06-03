Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FB9CD6E55
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 09:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dXzCfwAjBByZ+CSqBoz/+U8NX18LPQWngKam7hJgubc=; b=12TCc6Jx5PldA/
	iL/B0A0l0+t5NgVCDNF/Il+WROVb8iKcoVs+d3czKthV5rXOgU28QOkHlFgvzYCvj/6PLEun6+++b
	r3CHLnv5hCG3fDMcZn4Fb75Gq7PJXZWFKgJlDwQ/Lb0Zb6WWCxR1webKo6RQyUEXLIz4YvDuTbkaC
	0TzFEY0qt/WoaOxHskiIFZLqaXEZHKikktpemR+DITUGCmkIZXjNIpcD5CGvff0db+SCJfici6w9e
	NGDAWPqA3a0nFFA2haAMzaWV2emi9TM8DcW62BdmMvZ89jaJgDwnPD2NKXDY4NrX7zAFz+lb6JwBd
	MA5e9fqmWSI5SYLcbVXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiN2-0000000El7s-2PT3;
	Wed, 03 Jun 2026 09:58:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUiN0-0000000El7S-2wwQ;
	Wed, 03 Jun 2026 09:58:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Subject:Cc:To:From:
	Mime-Version:Date:References:In-Reply-To:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=cKOd+ckXvEpyxGOvmPUT88FhSK2RRA+R3CMNEo/86Ns=; b=WiS4JyP0i5rwKC+DXZO/JkyWj6
	hK2z0gKi+ZQgJkTv7oeiNS/5fDJQC9tkV/d8dDIbK4A4vAfwR+Jy8tgHEYXcwWQ0q+oAtaJetaVw/
	a1g4AthSKIiiZ9ZJRgHSklSMSnyaioGGc+q9zzDoKxCxGWmUB18AHae7/U3kCUB3IvMkWj6H70YtL
	X0YqQYKHkFPw4uUNgkIQ3G62J/jhWJKLo8tbj6CYkn+CsVJdJoV08+sKaSVRULSvKk1cz+eNHenqk
	e6quBZoBettkYu+ILTW/i74kXF0JsUfxXOWA1urW8bzEgLi4y6YWPZsxY43Li2VPN8gOrbsXzxO9W
	fcK3bpoA==;
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUiMx-0000000BmRY-1dGp;
	Wed, 03 Jun 2026 09:58:41 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gVjnm2Zk0z8Xrrn;
	Wed, 03 Jun 2026 17:58:36 +0800 (CST)
Received: from szxl2zmapp05.zte.com.cn ([10.1.32.37])
	by mse-fl2.zte.com.cn with SMTP id 6539wQFX009049;
	Wed, 3 Jun 2026 17:58:26 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 3 Jun 2026 17:58:29 +0800 (CST)
X-Zmail-TransId: 2b066a1ffac536f-f9cd5
X-Mailer: Zmail v1.0
Message-ID: <20260603175829412hzKDF23RSPIQCliiSiIwg@zte.com.cn>
In-Reply-To: <20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn>
References: 20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn
Date: Wed, 3 Jun 2026 17:58:29 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDMvNF0gUklTQy1WOiBLVk06IFNwbGl0IGh1Z2UgcGFnZXMgZHVyaW5nIEtWTV9DTEVBUl9ESVJUWV9MT0c=?=
X-MAIL: mse-fl2.zte.com.cn 6539wQFX009049
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 03 Jun 2026 17:58:36 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1FFACC.000/4gVjnm2Zk0z8Xrrn
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_105839_756317_DAC92DFC 
X-CRM114-Status: UNSURE (   5.14  )
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

Split huge pages on the range specified using KVM_CLEAR_DIRTY_LOG.
And do not split when enabling dirty logging if
KVM_DIRTY_LOG_INITIALLY_SET is set.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/kvm/mmu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 51bd1db74e1a..d04680687f4a 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -149,6 +149,9 @@ void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
 	kvm_riscv_gstage_init(&gstage, kvm);

 	kvm_riscv_gstage_wp_range(&gstage, start, end);
+
+	if (kvm_dirty_log_manual_protect_and_init_set(kvm))
+		mmu_split_huge_pages(&gstage, start, end, true);
 }

 void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
