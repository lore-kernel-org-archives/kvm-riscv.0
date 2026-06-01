Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05E81CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 07:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zW62Jrm4oDfhCBBU4dLhZIzISVfoJ8n5MePmO1xplxg=; b=RTNm7UHNbbz1mR
	lXFxyPXpaonrCAPRFHiYkhqx9We5pSy63mPElIJ8QmqlRViFFZpT8EjSfe01xImgjArOVNDO8wiAC
	hp60W7BBo/LXpmhgxrsONUfkzB3Nh0H4e3mOKeSxSUABe1tPmJIIAk76qNLenSB4YVMXr5FpC9LFA
	HvZbL22nXnKVmBgm38QkOYsuPpE4wAs970mqJ0+b0DVBKoUg0FEmEyl/rhEqHw5iBzwqgeWywCjcs
	3UMK0bD1Z88eTZOswuicRCeflMQZSEGOOoFix/+swLBn+YonEgC6If4vgreCRGKLEO4tgDcutYSiP
	tCm+2ipIgWWYGwH3KTTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwiO-0000000AGxQ-2gQz;
	Mon, 01 Jun 2026 07:05:36 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwiL-0000000AGvr-0n94;
	Mon, 01 Jun 2026 07:05:34 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4gTQ2k5x09z57KTr;
	Mon, 01 Jun 2026 15:05:18 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 65175AlE087119;
	Mon, 1 Jun 2026 15:05:10 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp07[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 1 Jun 2026 15:05:12 +0800 (CST)
X-Zmail-TransId: 2b096a1d2f28ce9-70dc3
X-Mailer: Zmail v1.0
Message-ID: <20260601150512301NeokJXDe2YUikK2-C1yKG@zte.com.cn>
In-Reply-To: <CAAhSdy2qqpZ6qucwsuRZWnKgno03Ok4czv8RTgpjA73i+yFhng@mail.gmail.com>
References: 20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn,20260429173534386Dfz8RALJT73-jMfif0nSb@zte.com.cn,CAAhSdy2qqpZ6qucwsuRZWnKgno03Ok4czv8RTgpjA73i+yFhng@mail.gmail.com
Date: Mon, 1 Jun 2026 15:05:12 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IMKgW1BBVENIIHYyIDIvM10gUklTQy1WOiBLVk06IGFkZCB0cmFjZXBvaW50cyBmb3IgZ3Vlc3QgcGFnZSBmYXVsdHM=?=
X-MAIL: mse-fl2.zte.com.cn 65175AlE087119
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 01 Jun 2026 15:05:18 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1D2F2E.001/4gTQ2k5x09z57KTr
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_000533_382188_1E33F4F3 
X-CRM114-Status: UNSURE (   5.69  )
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

> > From: Wang Yechao <wang.yechao255@zte.com.cn>
> >
> >
> > Add the kvm_page_fault event tracepoints to count the number of KVM
> >
> > guest page faults.
> >
> >
> > Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> 
> Lot of redundant newlines in this patch. Looks like this patch
> was not sent using "git send-email".
> 
Sorry for the messy formatting. I'll resend the patch properly with git send-email
in the next version.

Best regards,
Yechao

> Regards,
> Anup

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
