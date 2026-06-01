Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8631DCD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 07:18:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KY000KDQbYRE2nP33wd4Flwzwqgx1kSbSDVkQm/NYhE=; b=AnEUb2zJe2hais
	rxjLAXi/Gz24ObF1c57jeOvsHk8BYOC/szRUBs/PR/Umr5hMu2Hh80D475rqkpQ0ehLmX30QNcnte
	W09aTD118A9cKnf45YBSuxOY1LAgyNc6Wg34P77bcgY6QM1xzARlL3eY2T5A2erwTtGBuS1tX13xG
	/2v5LpGqFu/s8/SSXzRTo5wOmQK4+fs9BNkhw9JdsC2WpTz6FTcnX3z7Yu7sSwUdBz0LwzORaOIen
	Qq/ziuZrdpARI8xJchGUyQMRLwPlLDHKCqfV4gFpj1zddTwJy6XsD3Sn5O/Gvevc+SIXustEWtxvm
	D/1HW3OGAg9WhoD+BTmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwv0-0000000AIHD-0dcZ;
	Mon, 01 Jun 2026 07:18:38 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTwux-0000000AIGP-2YI3;
	Mon, 01 Jun 2026 07:18:37 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gTQL02cfMz5B13X;
	Mon, 01 Jun 2026 15:18:32 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 6517IPnr005080;
	Mon, 1 Jun 2026 15:18:25 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 1 Jun 2026 15:18:27 +0800 (CST)
X-Zmail-TransId: 2b076a1d324392a-859ef
X-Mailer: Zmail v1.0
Message-ID: <202606011518277289v9DwCtREfa34rRwjUhqn@zte.com.cn>
In-Reply-To: <CAAhSdy3W4U_wYuH_pKq-V6iP6UE7e9h9Zhv=hKLykvWpiTEGVg@mail.gmail.com>
References: 20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn,20260429173529259zFOx-ZsqSl_DS82KLXv0S@zte.com.cn,CAAhSdy3W4U_wYuH_pKq-V6iP6UE7e9h9Zhv=hKLykvWpiTEGVg@mail.gmail.com
Date: Mon, 1 Jun 2026 15:18:27 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCB2MiAxLzNdIFJJU0MtVjogS1ZNOiBSZWZhY3RvciBrdm1fYXJjaF9jb21taXRfbWVtb3J5X3JlZ2lvbigp?=
X-MAIL: mse-fl2.zte.com.cn 6517IPnr005080
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Mon, 01 Jun 2026 15:18:32 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A1D3248.001/4gTQL02cfMz5B13X
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_001835_801780_92710485 
X-CRM114-Status: GOOD (  22.19  )
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
> > Refactor kvm_arch_commit_memory_region() as a preparation for a future
> > commit to look cleaner and more understandable. Also, it looks more
> > like its arm64 and x86 counterparts.
> 
> This claim of making it similar to arm64 and x86 is incorrect. See below.
> 
> >
> > Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
> > ---
> >  arch/riscv/kvm/mmu.c | 12 +++++++++++-
> >  1 file changed, 11 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > index 2d3def024270..dc6a8efde99e 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -141,12 +141,22 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
> >                                 const struct kvm_memory_slot *new,
> >                                 enum kvm_mr_change change)
> >  {
> > +       bool log_dirty_pages = new && new->flags & KVM_MEM_LOG_DIRTY_PAGES;
> > +       bool read_only = new && new->flags & KVM_MEM_READONLY;
> > +
> > +       /*
> > +        * Nothing more to do for RO slots (which can't be dirtied and can't be
> > +        * made writable) or CREATE/MOVE/DELETE of a slot.
> > +        */
> > +       if ((change != KVM_MR_FLAGS_ONLY) || read_only)
> > +               return;
> > +
> 
> I don't see how this is same as what x86 and arm64 does. There is
> no special casing for KVM_MR_FLAGS_ONLY in x86 and arm64.
> 
This is closer to the `kvm_mmu_slot_apply_flags` function on x86, so perhaps
it would be better to refer to the arm64 implementation to modify this function.

> >         /*
> >          * At this point memslot has been committed and there is an
> >          * allocated dirty_bitmap[], dirty pages will be tracked while
> >          * the memory slot is write protected.
> >          */
> > -       if (change != KVM_MR_DELETE && new->flags & KVM_MEM_LOG_DIRTY_PAGES) {
> > +       if (log_dirty_pages) {
> 
> Why drop "change != KVM_MR_DELETE" ?

The above condition "change != KVM_MR_FLAGS_ONLY" already filters out the
condition "change != KVM_MR_DELETE".

Best regards,
Yechao
> 
> >                 if (kvm_dirty_log_manual_protect_and_init_set(kvm))
> >                         return;
> >                 mmu_wp_memory_region(kvm, new->id);
> > --
> > 2.43.5
> 
> Regards,
> Anup

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
