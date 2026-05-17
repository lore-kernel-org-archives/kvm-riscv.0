Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFECD37AC
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 12:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S9Z8pJynEOk+tpkAG0e8igRhow4Pup+OhuhxWHgVySs=; b=oQ2CUCwQHkQ4uA
	5xBkX/tsAckqbAdFO6JVSH8MW25SXaQn3VzDJ3Z+WiSBNoTvC0UGuvvihEdgsOoEysibPeWdr5afP
	TyWla7m9az5yi8PvjfeBcES3wOoQb0yz8tRfP3K+76e5EXW2mKzd05p1JX3Vrhk6KQd3b9s/jmyIh
	nUw1dNB+29vSBXnRGkcRSeOfQe2HuTiVP0jbM9GU75cWY/KPmFasQ5Zt42pq85dfW9NdSl0CvH5Q9
	HTuo+5FnjluJEcIvHZuQskbqK2uqv5D/oVg0p3+2dHEuTYl5SftU2pikauvRIVuFp6wggOzxf/Z3R
	uP/Iu5LFKVbfvYcg+N1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOamI-0000000Ci1D-0hDi;
	Sun, 17 May 2026 12:39:30 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOamE-0000000Ci0U-40DS;
	Sun, 17 May 2026 12:39:29 +0000
Received: from fric.. (unknown [36.110.52.2])
	by APP-05 (Coremail) with SMTP id zQCowADXaw_jtglq5ZqHEA--.31390S2;
	Sun, 17 May 2026 20:38:59 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	jiakaiPeanut@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	xujiakai2025@iscas.ac.cn
Subject: Re: [PATCH] RISC-V: KVM: Fix NULL pointer dereference in SBI v0.1 SEND_IPI handler
Date: Sun, 17 May 2026 12:38:59 +0000
Message-Id: <20260517123859.409709-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAAhSdy08enoCH83begksrSA4strPG5n5Wd4i+ext0Z+Wmz_OAA@mail.gmail.com>
References: <CAAhSdy08enoCH83begksrSA4strPG5n5Wd4i+ext0Z+Wmz_OAA@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXaw_jtglq5ZqHEA--.31390S2
X-Coremail-Antispam: 1UD129KBjvdXoWrCr4DXr47Jw4UGF4UWr15urg_yoWxXFc_Gw
	s7Aay5WrW8ZF1FvF1DKwn3WFnxJw4kX3yktrnxAr95C34kArW7Kws3WF1DXr15Jrn8Ja93
	CrnYv34fJ3909jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbfkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64
	vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8G
	jcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2I
	x0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK
	8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I
	0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-Originating-IP: [36.110.52.2]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAgKCWoJMy-L8wAAsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_053927_368812_D31915CD 
X-CRM114-Status: UNSURE (   7.71  )
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

Hi, Anup!

Thanks for your review!

> > diff --git a/arch/riscv/kvm/vcpu_sbi_v01.c b/arch/riscv/kvm/vcpu_sbi_v01.c
> > index 188d5ea5b3b85..98ecfcb2469e6 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_v01.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_v01.c
> > @@ -55,6 +55,8 @@ static int kvm_sbi_ext_v01_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >
> >                 for_each_set_bit(i, &hmask, BITS_PER_LONG) {
> >                         rvcpu = kvm_get_vcpu_by_id(vcpu->kvm, i);
> > +                       if (!rvcpu)
> > +                               break;
> 
> Instead of break it is better to continue here so that non-existent
> VCPUs are ignored.

You are right. I'll send the v2 patch later.

Jiakai


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
