Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB52C43602
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 11:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Je6pPMisBXmGk2HWwTuCvKZGFfZAhDjXkVwZOlJ+Wek=; b=365/Y2rcyhPbkf
	BN80N6ax2AXKH93tTICWZdz+tn3URyEiu4PLqDy5NUv6fU+bquXWdoxYSe1OhdGxGt7SQ7sB2gf2i
	0W5yDPrsrI8D8IrD2WpaPj5zcSTVN4q5u3dLIoqR1iX2J9fz9Pf8ZSunzSzZ6XBVoyKKTYqpLh8kA
	kf8fYiTZAoVQjIWHHIyFULNxXRSrA861c5BGTqDI4C6w3YAzpLkZf0TgnbVPaNoRdrrb+fkWtv/Wx
	ZMjbpg7iyl3kCCwLdlTE2wHB9bS8D6QbhLVY0Jv7MohYxsMFL29QhYgOho12/AYMssR73mZoBvFFr
	vBEmxyVML5qhYznF4nLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh48Q-0000000ErzK-1r2w;
	Tue, 07 Jul 2026 11:38:42 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh48M-0000000ErwV-2FMy;
	Tue, 07 Jul 2026 11:38:41 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gvfPD1bDLz57KTs;
	Tue, 07 Jul 2026 19:38:24 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 667BcHxc018822;
	Tue, 7 Jul 2026 19:38:17 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Tue, 7 Jul 2026 19:38:20 +0800
X-Zmail-TransId: 3e816a4ce52b009-636ed
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
Subject: [PATCH 0/2] RISC-V: KVM: Optimize hfence request handling for SMP guests
Date: Tue,  7 Jul 2026 19:37:05 +0800
Message-ID: <20260707113715.413265-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 667BcHxc018822
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 07 Jul 2026 19:38:24 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A4CE530.000/4gvfPD1bDLz57KTs
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_043839_128482_FDCE93E7 
X-CRM114-Status: UNSURE (   7.03  )
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

This series improves the hfence request handling in RISC-V KVM,
targeting scenarios where multiple VCPUs are running an SMP guest.

The first patch moves the hfence data/type validation out of the
VCPU loop to avoid redundant checks on every iteration.

The second patch fixes a more subtle performance issue: when one
VCPU's hfence queue becomes full and triggers a fallback, the
current code applies the fallback to all VCPUs indiscriminately.
This unnecessarily degrades healthy VCPUs and can cause their
queues to fill up prematurely due to lack of processing it.

With these changes, fallback is applied only to the VCPUs that
actually need it, preserving the efficiency of the normal path
for others.

Wang Yechao (2):
  RISC-V: KVM: Move hfence type check out of loop
  RISC-V: KVM: Separate req and fallback_req masks in
    make_xfence_request

 arch/riscv/kvm/tlb.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.43.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
