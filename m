Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730F4EB7EAC
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 09:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2GCiLtPbHe4GMY8ctU7ElvV6LdQmbb6whmgr54aR4Dc=; b=h8lk6npQn8tc48
	mwRf+G53Thi/GxnYVPWOCp7kOb9YPWWR/0qwosTeKNTyKfX/UbaZejsEZPJGlK8u0KcJykw6UN1sw
	lYjMMlbOJ4uH1DBiQjd6XWhW7kPEpk8atpH8ri+KfAkpR98AOppFzPfUNS/dti7Z/hIzZKZcRwF89
	dGge96C7ek86YiLRk7fonAC98r2ee5aZvdlGLSrYeoL5poDOM8MOhIhTA/d+nfWKSy18xJevipClm
	utmxs8Sf4k1A/bR9PFY9tw5jZcrWgILFZo8bplrCEwFlZiY3PD1h2TNWhNHf5KPJ43LypgiRAUgyZ
	Qsc1KZ6RBH587iZN7oIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiQa-0000000GrTn-0jbu;
	Wed, 04 Mar 2026 09:22:00 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxiQW-0000000GrTP-29L0;
	Wed, 04 Mar 2026 09:21:58 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fQnHG51clz4xQXM;
	Wed, 04 Mar 2026 17:21:46 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 6249LaoC048377;
	Wed, 4 Mar 2026 17:21:36 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 4 Mar 2026 17:21:39 +0800 (CST)
X-Zmail-TransId: 2b0569a7f9a33a2-214cb
X-Mailer: Zmail v1.0
Message-ID: <20260304172139131ChDubMSpGDUB03lY4UCbK@zte.com.cn>
Date: Wed, 4 Mar 2026 17:21:39 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYyIDAvM10gUklTQy1WOiBLVk06IEZpeCBodWdlcGFnZSBtYXBwaW5nIGhhbmRsaW5nIGR1cmluZyBkaXJ0eSBsb2dnaW5n?=
X-MAIL: mse-fl2.zte.com.cn 6249LaoC048377
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 04 Mar 2026 17:21:46 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69A7F9AA.000/4fQnHG51clz4xQXM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_012156_708714_190C3740 
X-CRM114-Status: UNSURE (   4.56  )
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

This series fixes an issue where dirty logging fails to work correctly
with huge pages.

v1 -> v2:
  - fix the lost write protection on huge pages
  - split huge pages before handling the write protection fault.

  - Link to v1:
  https://lore.kernel.org/linux-riscv/20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn/T/#u

Wang Yechao (3):
  RISC-V: KVM: Fix lost write protection on huge pages during dirty
    logging
  RISC-V: KVM: Allow splitting huge pages to arbitrary level
  RISC-V: KVM: Split huge pages during fault handling for dirty logging

 arch/riscv/include/asm/kvm_gstage.h |  4 ++
 arch/riscv/kvm/gstage.c             | 85 +++++++++++++++++++++++++++--
 2 files changed, 85 insertions(+), 4 deletions(-)

-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
