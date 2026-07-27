Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512AAC531D0
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 15:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e1vVVeArvOEgv0mPJBCiE0DVQYKEHev66K2yN37zsVY=; b=CsRdsGdOsRZ+hQ
	bnARQJj3Ki/GWAWbJKl6+37a+J0T4FWTG+eBFXKMKhxGtl/li4lb7VnKDIDFVuD0SbPHLAtK0mpar
	hUmnTco89qCZfMDehmW6usJnG/NDUy12qGyxTsHtm9UcvZu1if1BV4RaUPhCE4l8wnq00RUO+sl2e
	SQcwo7ODdZwm9KnBx7dNxbw/xgAz86rpL+O+1Enc7q+erehO06zagXHVS7MlZsvObel14nmi7C++k
	Mm+I8m7vnrCZzy7cfS8dS1WgB+o/kzwxwmVXtT2/lwAtGqUo4r1mxH/Q6Yb100Y0K4moiEu+I88Cl
	xpGPn/WZUg26jtGDnXpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNNe-00000003C2s-3X7X;
	Mon, 27 Jul 2026 15:36:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNNc-00000003C1N-1sUq;
	Mon, 27 Jul 2026 15:36:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4556B15A1;
	Mon, 27 Jul 2026 08:36:29 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 545F83F763;
	Mon, 27 Jul 2026 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785166593; bh=VxwcTpU1zkLTiWJHJFd1+dPEfdXN9pkdJizROxnSPx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=umQaGad50YqGP9/hpR0vblKavVaO/yfzmd6WpBrSu3X1qxzwvAqth8D98RKBUpnRl
	 YBkPW2SI9qXrZ/dhG0U16YoQWNEaqdp7BQq231JeMnCBE+q/DgI9MewD6hJ98T6X/b
	 l61b8+i7MvjGE4JRrEUAFuCexvu/jxEyxkuWD4XU=
Date: Mon, 27 Jul 2026 16:36:23 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Dave Hansen <dave.hansen@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 13/20] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <amd69-dELYw4qlKC@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-13-d9e4bad31e0a@arm.com>
 <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
 <amD_5r04mzMoZ0-r@e129823.arm.com>
 <33c774f6-2750-4831-8eee-e43dc471da32@intel.com>
 <amEvYRs7CjhQdQWT@e129823.arm.com>
 <a1df631b-9854-497b-b7fd-831288fca81e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a1df631b-9854-497b-b7fd-831288fca81e@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_083636_562931_CF0AB792 
X-CRM114-Status: GOOD (  34.60  )
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

> On 7/22/26 23:00, Yeoreum Yun wrote:
> > On Wed, Jul 22, 2026 at 01:20:39PM -0700, Dave Hansen wrote:
> >> On 7/22/26 10:37, Yeoreum Yun wrote:
> >>> However, mm_pXd_folded() requires to mm for other architecture like
> >>> s390. might save the mm instead of first_level and calls the
> >>> ptdump_pt_level_first() with static inline version would make the
> >>> constant comparison. So it requires to save *mm* structure in here.
> >>
> >> I'm having a really hard time parsing that.
> >>
> >> I think you're trying to say that the effective_prot_p*() functions need
> >> to know the first level but they don't (today) need the mm_struct. If
> >> they don't get the (calculated) first_level passed in, they need the
> >> mm_struct instead.
> >>
> >> I think you're arguing 'pg_state' needs a ->first_level or a ->mm.
> >> Having a pg_state->mm doesn't seem bad to me at all.
> >>
> >> But, it's also a little bit silly. It would not be rocket science to
> >> pass an mm_struct down to the effective_prot_p*() functions. It makes a
> >> whole lot of sense to me for a page table walking function to need
> >> metadata from the mm_struct to walk correctly.
> > 
> > Yes. I mean to add pg_state->mm like:
> > 
> > diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
> > index 2afa7a23340e..aaf00f0c6624 100644
> > --- a/arch/x86/mm/dump_pagetables.c
> > +++ b/arch/x86/mm/dump_pagetables.c
> > @@ -38,6 +38,7 @@ struct pg_state {
> >         bool check_wx;
> >         unsigned long wx_pages;
> >         struct seq_file *seq;
> > +       struct mm_struct *mm;
> >  };
> > 
> >  struct addr_marker {
> > @@ -254,7 +255,7 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
> >         pgprotval_t prot = val & PTE_FLAGS_MASK;
> >         pgprotval_t effective;
> > 
> > -       if (level > 0) {
> > +       if (level > pgtable_first_level(st->mm)) {
> >                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> > 
> >                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> > @@ -452,7 +453,8 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
> >                 .level = -1,
> >                 .to_dmesg       = dmesg,
> >                 .check_wx       = checkwx,
> > -               .seq            = m
> > +               .seq            = m,
> > +               .mm             = mm,
> >         };
> > 
> >         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 8c093c119e5a..6e7d0580db99 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -2490,4 +2490,15 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)                           \
> >  }                                                                      \
> >  EXPORT_SYMBOL(vm_get_page_prot);
> > 
> > +static inline int pgtable_first_level(struct mm_struct *mm)
> > +{
> > +       if (mm_pmd_folded(mm))
> > +               return 3;
> > +       if (mm_pud_folded(mm))
> > +               return 2;
> > +       if (mm_p4d_folded(mm))
> > +               return 1;
> > +       return 0;
> > +}
> 
> In that case the function should probably be called
> 
> "mm_first_pgtable_level"
> 
> But now it gets confusing, because we have
> 
> enum pgtable_level {
> 	PGTABLE_LEVEL_PTE = 0,
> 	PGTABLE_LEVEL_PMD,
> 	PGTABLE_LEVEL_PUD,
> 	PGTABLE_LEVEL_P4D,
> 	PGTABLE_LEVEL_PGD,
> };
> 
> 
> But maybe we can make sense of it and do
> 
> /*
>  * The enum values correspond to the numerical page table level,
>  * starting with the highest level being level 0.
>  */
> enum pgtable_level {
> 	PGTABLE_LEVEL_PGD = 0,
> 	PGTABLE_LEVEL_P4D,
> 	PGTABLE_LEVEL_PUD,
> 	PGTABLE_LEVEL_PMD,
> 	PGTABLE_LEVEL_PTE,
> };
> 
> static inline enum pgtable_level mm_first_pgtable_level(struct mm_struct *mm)
> {
> 	if (mm_pmd_folded(mm))
> 		return PGTABLE_LEVEL_PMD;
> 	if (mm_pud_folded(mm))
> 		return PGTABLE_LEVEL_PUD;
> 	if (mm_p4d_folded(mm))
> 		return PGTABLE_LEVEL_P4D;
> 	return PGTABLE_LEVEL_PGD;
> }
> 
> 
> We could even teach effective_prot() and friends to consume enum pgtable_level
> now and have it all be a bit cleaner?

Yes. That would be good for me unless others comment.


-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
