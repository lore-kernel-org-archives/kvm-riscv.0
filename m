Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DAF7C55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 06:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X3VXJ14mnVA7BBQNVUfq4OwBZq2PfVeBJ8lP9pr9r1Q=; b=k9SdDv6vYg/6BH
	nvQeGVcc3c30yRqoIF/9ER8kzl4ZX2/cjpBpQtJ00UQPmN8pIVEHyL6gDdWmNCfe6rpmZf13JepGx
	tCPSyggn0snaWLJslXURBE0jL9jL7jAbrKsToqSm2C8MqcLC+fmrgjVqGcgZVQOdp/P7cUJLix6+/
	IKZyr5ynrkLBFhECgJgt6awpaG2T4JjPlUYoZD6AWq3SC/cuJA+nQRoVo2Fl4m+CbHlL+dKSkoS49
	moqxooduJi9iCFfdrs66w+nTNIalul5ewWfmlr7r9M4Phpd1rfg/QAQgc810Pfcl9PXT1vHLtgnKn
	H4Em44Hx+jnJcpw2wetg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgZY-0000000BsaT-3CNL;
	Fri, 31 Jul 2026 06:18:20 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpgZV-0000000Bsa2-3tfW;
	Fri, 31 Jul 2026 06:18:19 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hBG8j3Bc7z8Xrkn;
	Fri, 31 Jul 2026 14:18:13 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl2.zte.com.cn with SMTP id 66V6I0Io068098;
	Fri, 31 Jul 2026 14:18:00 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp03[null])
	by mapi (Zmail) with MAPI id mid12;
	Fri, 31 Jul 2026 14:18:01 +0800 (CST)
X-Zmail-TransId: 2b056a6c3e19e16-710d0
X-Mailer: Zmail v1.0
Message-ID: <20260731141801793hQfTkkNj5hVzU1qUKbRQY@zte.com.cn>
In-Reply-To: <CAAhSdy3bBQTwj80cmBvWYfqWgO1e8_Y85x=QG46UamGEbYy+UQ@mail.gmail.com>
References: 20260707125034.416521-1-wang.yechao255@zte.com.cn,CAAhSdy3bBQTwj80cmBvWYfqWgO1e8_Y85x=QG46UamGEbYy+UQ@mail.gmail.com
Date: Fri, 31 Jul 2026 14:18:01 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAwLzJdIFJJU0MtVjogS1ZNOiBPcHRpbWl6ZSBoZmVuY2UgcmVxdWVzdCBoYW5kbGluZyBmb3IgU01QIGd1ZXN0cw==?=
X-MAIL: mse-fl2.zte.com.cn 66V6I0Io068098
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Fri, 31 Jul 2026 14:18:13 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C3E25.000/4hBG8j3Bc7z8Xrkn
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_231818_127871_74261AB2 
X-CRM114-Status: GOOD (  16.58  )
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

> >
> > This series improves the hfence request handling in RISC-V KVM,
> > targeting scenarios where multiple VCPUs are running an SMP guest.
> >
> > The first patch Introduce make_xfence_request_nodata for FENCE.I
> > requests and moves the hfence data/type validation out of the
> > VCPU loop to avoid redundant checks on every iteration.
> >
> > The second patch fixes a more subtle performance issue: when one
> > VCPU's hfence queue becomes full and triggers a fallback, the
> > current code applies the fallback to all VCPUs indiscriminately.
> > This unnecessarily degrades healthy VCPUs and can cause their
> > queues to fill up prematurely due to lack of processing it.
> >
> > With these changes, fallback is applied only to the VCPUs that
> > actually need it, preserving the efficiency of the normal path
> > for others.
> >
> > Changes in v2:
> >  - Fix the patch01 broken the KVM_REQ_FENCE_I request(Sashiko AI review).
> >
> >  - Link to v1:
> >  https://lore.kernel.org/linux-riscv/20260707113715.413265-1-wang.yechao255@zte.com.cn/
> >
> > Wang Yechao (2):
> >   RISC-V: KVM: Introduce make_xfence_request_nodata for FENCE.I requests
> >   RISC-V: KVM: Separate req and fallback_req masks in
> >     make_xfence_request
> >
> >  arch/riscv/kvm/tlb.c | 46 +++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 35 insertions(+), 11 deletions(-)
> >
> > --
> > 2.43.5
> >
>
> The PATCH2 is a fix independent of PATCH1 so re-order
> and make PATCH2 as first patch which can be applied
> independent of PATCH1
>
> Regards,
> Anup

Thanks for the review.  I will reorder the patches in v3 so that PATCH2 comes first.

Regards,
Yechao

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
