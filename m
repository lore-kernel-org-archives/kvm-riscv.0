Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D8AFC4453A
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 20:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjMhI0p6LeA7ixdhrZdMIMpHZxGse+fBcxQQsBPRemI=; b=FL2xYVRaIzZjf+
	bl2NMa1jmdqV/VaTCSmyr/Bx0kPJIPN9gIslCk+vafUxTNAq8UeagxIOD4gtt4rDkNQDhoZed4K9a
	Uv/xkZF7hm/L/BfqOBQD+6i7hEmRW3DsacgVoKTWhzcJEpg9BjNd8oYhSboWPzVsKU/Axl39Sen77
	YO1M9wZo88J0rnk5QJp3cW9MZeAvvXUwtv0fdL83q9QhqO6vmWQK6XVNTdB6axm3m7uWCexOKu8mK
	4yrhEU8yBwsR1NIuEaBTamx0xGIsjX0VRuLTGpEtp1xWfvd9cJQIK8qwRtBS3bD2TRLz+W9ze0YKO
	V+9ryUyp1kRGLg7JhigA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdOz-0000000ChMh-0gTw;
	Wed, 22 Jul 2026 20:18:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdOw-0000000ChLl-3vlg;
	Wed, 22 Jul 2026 20:18:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ED3061595;
	Wed, 22 Jul 2026 13:18:41 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 066363F59E;
	Wed, 22 Jul 2026 13:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784751526; bh=ov7c+9CWDC2LAyEksO+C2pB8mXtkAOCi10JJO6wa1g4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aiMgIq3lU/qztGdY5ckcEtoH4sGXiubpcTNstTvwu98UOWWePxdJNyZ59CI4DTUgx
	 yDvv0SQFD+xDj41NppNkZJE85iCi+rKzLxJK7D5KIdXE5wBFK4aLMoc9apSCP5Bf3x
	 lWhfLdLFiXooDHH9+ISqgCgK1LUPPRLrHnct3Y6Q=
Date: Wed, 22 Jul 2026 21:18:36 +0100
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
Message-ID: <amElnEbvRTjv2hyU@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
 <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
 <amD7ab_KuJPdBQBh@e129823.arm.com>
 <6f5060a7-0a64-49fc-81a3-ae88729ef794@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f5060a7-0a64-49fc-81a3-ae88729ef794@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_131847_053939_0492BCCF 
X-CRM114-Status: GOOD (  29.99  )
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

> On 7/22/26 10:18, Yeoreum Yun wrote:
> >>> @@ -1730,7 +1730,8 @@ static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
> >>>  	/*
> >>>  	 * Map everything starting from the Gb boundary, possibly with 1G pages
> >>>  	 */
> >>> -	while (boot_cpu_has(X86_FEATURE_GBPAGES) && end - start >= PUD_SIZE) {
> >>> +	while (CONFIG_PGTABLE_LEVELS > 3 && boot_cpu_has(X86_FEATURE_GBPAGES) &&
> >>> +	       end - start >= PUD_SIZE) {
> >>>  		set_pud(pud, pud_mkhuge(pfn_pud(cpa->pfn,
> >>>  				   canon_pgprot(pud_pgprot))));
> >> This is an OK approach. But there's a way to fix this site *and*
> >> optimize a non-zero amount of other code at the same time. Add this hunk
> >> to arch/x86/Kconfig.cpufeatures:
> >>
> >> config X86_DISABLED_FEATURE_GBPAGES
> >>         def_bool y
> >>         depends on X86_32
> >>
> >> That will turn the boot_cpu_has() check in to something that can be
> >> resolved at compile time. It has the added advantage of compiling out
> >> all of the code under X86_FEATURE_GBPAGES everywhere else in the tree.
> > Does it? when I glimpse check, this wouldn't be compiled since
> > there is no bit for X86_DISABLED_FEATURE_GBPAGES and defining the
> > DISABLED bit for FEATURE_GBPAGES seems odd since bit X86_FEATURE_GBPAGES
> > is already defined.
> 
> x86 is a special snowflake here and all the similarly-named things glued
> together with magic makes them hard to grok.
> 
> Our X86_FEATURE_* bits normally compile down to a bit in a bitmap in
> memory. But, there are also some optimizations in the helpers that
> access those bits. The optimizations turn bit checks like:
> 
> 	if (bitmap[N] & bit)
> 		...
> 
> into a compile-time check:
> 
> 	if (__builtin_constant_p(bit) && DISABLED_MASK_BIT_SET(bit) ? 0:
> 	    (bitmap[N] & bit))
> 		...
> 
> The DISABLED_MASK_BIT_SET() macro magic check if (for instance)
> X86_DISABLED_FEATURE_GBPAGES is around. Some processing of the Kconfig
> variables produces a header with X86_DISABLED_FEATURE_GBPAGES defined.

Sorry. But do you mean check with cpu_feature_enabled() not with
boot_cpu_has()?
IIRC, the boot_cpu_has() doesn't use the DISABLE_MASK_BIT_SET() but
uses REQUIRED_MASK_BIT_SET() and I don't expect it wouldn't make
an optimisation to constant check which is contrast to DISABLE_MASK_BIT_SET().

> > Instead of CONFIG_PGTABLE_LEVEL > 3, as above, would it be better to
> > add check IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES)?
> 
> That would definitely change the behavior. It honestly might be the
> _right_ change, but I'm ignoring that for the moment because even if it
> is best it is fodder for another patch, not this one.
> 
> Please just keep the check against X86_FEATURE_GBPAGES for now.

Okay. In round, we can remove CONFIG_PGTABLE_LEVEL check too since
it wouldn't make a compile error right now.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
