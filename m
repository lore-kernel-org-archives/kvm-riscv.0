Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A155C44532
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 17:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9fa0L1Gt7cBHHSyjj/dZarHzj+kpgFjGMoxyDWLbXo=; b=WAvfAmOPVtsj1t
	b9c0EZArL+Lpg2OO+KEUacuEyDOQe2OTsyaTDeBuBaIrnGm2NGyJOs/2aJmOHR7zuzevQ0Nvhsb8C
	spQaIvTaNMRshnCw2ypxbqEXovyRY69AE8fArnFJEw8XbdoKu4kpZu1mGe82ddtVa57N958/cx79m
	8OEf37zpsmwS/j6zLxppa80SAJkieBN6uZOMVQDM8Fk1aMpNRMGucb2mNGG+Rq1NUtu5rvgWh5Scy
	bqhH5Uszm6WXny9xp2JQZFCRlnF5/fxjmOTR017LGfIL+WGOnPPY9t+htkZ9XhOYTU/ExXL86kUl9
	xphN2eVSc2N88kazKeeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaao-0000000CRH6-32ZF;
	Wed, 22 Jul 2026 17:18:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmaan-0000000CRGm-31yx;
	Wed, 22 Jul 2026 17:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eqbx1d58EBdjVrypRq3+II0pTdFRmcSYS+DKLbnqzNw=; b=FFelgXR9S+dQRfnB/m5a5Qc8vY
	gAhBZ+ESizHgHZUmhe0a2yM+lPWNfbMusE3SYleWw8+YYtla40O0fWhHvT+riz3Bxxn9t/5jiA8FH
	7JfqUc7XQvJN3VjvsyaBcXO6XnxDktC87W/3V+o8c8BROGQH+96S8mPPUQjUZoFFN1zUua4tmJx6J
	YM676o/2a0CDeXPoY5zjrrWA4nMjir85BURBJ5iG0Z0ox1txsjBP3pxq2AUedADoQxky4Obt53foD
	jgH9SQRqJQ8Cu4oWb+8reVL1Q60WKy3uX3WCHDsg+q6JapwF1hqpObfPPMRHVuN/or8YkLY+9+MWH
	f2wi6xdg==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmaak-000000014HG-0D7Q;
	Wed, 22 Jul 2026 17:18:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E7591595;
	Wed, 22 Jul 2026 10:18:39 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5F8683F66F;
	Wed, 22 Jul 2026 10:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784740723; bh=2NDCcLKodqKCpw2t0NDotrWkpKm4cYytW7/B76Q9mwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Das3j0AmK5wTaHG4tQV+vaD2IuCrxPRNwYvLASUFPiBuUVqMzxuym7Y9yOS6KG2Ei
	 tTEwkxPYF7fgFUJ9zTix5YA8MAxyV/197dUq0IJrrTNTEeD+WwVVI2vp+T9s0F04m3
	 cSuvOYeQfWsSA3qkTMWLNYwUi1xxvOwbv1FzSGdg=
Date: Wed, 22 Jul 2026 18:18:33 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
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
	David Hildenbrand <david@kernel.org>,
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
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 14/20] x86: mm: skip pud setup when using generic
 compile-time folded pagetable
Message-ID: <amD7ab_KuJPdBQBh@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
 <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_181846_768777_5C4E8F1D 
X-CRM114-Status: GOOD (  41.30  )
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

On Wed, Jul 22, 2026 at 09:33:55AM -0700, Dave Hansen wrote:
> On 7/22/26 08:30, Yeoreum Yun wrote:
> > We want to rework how set_pXd() behaves for generic compile-time folded
> 
> Please move this all to imperative voice. I think I asked for this
> before, but perhaps I didn't. Either way, please fix the whole series.

Oh. Sorry, I've forgotten to edit this commit message.
I'll fix in next around.

> 
> > page tables by disallowing its use and triggering a compile-time error
> > when it is used improperly, ensuring that the actual first-level set_pXd()
> > function is used instead.
> > 
> > The behaviour of pXd_page() will change with generic compile-time folded
> > page tables by disallowing its use and triggering a compile-time error
> > when it's used improperly, ensuring that the actual.
> > 
> > To prepare fot that, skip collapse_pud_page() and populate_pud() according
> > to CONFIG_PGTABLE_LEVELS.
> > 
> > There should be no functional change.
> 
> If this wasn't done, what would happen? There would be a compile error,
> right?
> 
> Shouldn't that be said out loud somewhere?

Yes compile error for using pud_page(). I'll shout out detail in the
commit message.

> 
> > diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> > index 078689aa7206..91b33a265a43 100644
> > --- a/arch/x86/mm/pat/set_memory.c
> > +++ b/arch/x86/mm/pat/set_memory.c
> > @@ -1346,7 +1346,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
> >  	pmd_t *pmd, first;
> >  	int i;
> >  
> > -	if (!direct_gbpages)
> > +	if (CONFIG_PGTABLE_LEVELS == 2 || !direct_gbpages)
> >  		return 0;
> 
> This is subtly wrong. It probably shuts the compiler up, but it's subtly
> wrong.
> 
> x86 has 4 paging modes. I'll use the SDM/Intel terminology:
> 
> 32-bit:
>  * 32-bit paging: 2-level
>  * PAE: 3-level
> 64-bit:
>  * 4-level paging
>  * 5-level paging
> 
> But "gbpages" are not available in PAE paging. It's a hardware
> limitation. This doesn't cause a functional problem because the pud
> level is not folded. But it is confusing and not really an accurate way
> to write this check.
> 
> The *right* way to do this is probably something like this in a header:
> 
> static inline bool direct_gbpages(void)
> {
> 	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
> 		return false;
> 
> 	return __direct_gbpages;
> }
> 
> Which just happens to point readers over to this Kconfig nugget:
> 
> config X86_DIRECT_GBPAGES
>         def_bool y
>         depends on X86_64
> 
> which, combined with the knowledge that 32-bit has a 3-level mode, would
> make the proposed check obviously wrong.
> 
> So I'll take this as a suitable alternative:
> 
> 	/* Avoid compiling the below code if PUD-level mappings are impossible: */
> 	if (IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
> 		return 0;
> 
> 	if (!direct_gbpages)
> 		return 0;
> 
> That will compile-time optimize the code away in the exact right
> conditions *and* fix the (assumed by me) compile error that you were
> chasing.

I thought the same. but It seemed odd at the time since direct_gbpages is
always 0 when !CONFIG_X86_DIRECT_GBPAGES.

Howver, I've missed the X86_DIRECT_GBPAGES is for X86_64 only and It was
wrong totally.

I'll follow your suggestion.

> > @@ -1730,7 +1730,8 @@ static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
> >  	/*
> >  	 * Map everything starting from the Gb boundary, possibly with 1G pages
> >  	 */
> > -	while (boot_cpu_has(X86_FEATURE_GBPAGES) && end - start >= PUD_SIZE) {
> > +	while (CONFIG_PGTABLE_LEVELS > 3 && boot_cpu_has(X86_FEATURE_GBPAGES) &&
> > +	       end - start >= PUD_SIZE) {
> >  		set_pud(pud, pud_mkhuge(pfn_pud(cpa->pfn,
> >  				   canon_pgprot(pud_pgprot))));
> 
> This is an OK approach. But there's a way to fix this site *and*
> optimize a non-zero amount of other code at the same time. Add this hunk
> to arch/x86/Kconfig.cpufeatures:
> 
> config X86_DISABLED_FEATURE_GBPAGES
>         def_bool y
>         depends on X86_32
> 
> That will turn the boot_cpu_has() check in to something that can be
> resolved at compile time. It has the added advantage of compiling out
> all of the code under X86_FEATURE_GBPAGES everywhere else in the tree.

Does it? when I glimpse check, this wouldn't be compiled since
there is no bit for X86_DISABLED_FEATURE_GBPAGES and defining the
DISABLED bit for FEATURE_GBPAGES seems odd since bit X86_FEATURE_GBPAGES
is already defined.

In stead of CONFIG_PGTABLE_LEVEL > 3, as above, would it be better to
add check IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES)?

Thanks.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
