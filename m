Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A622DC531FC
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 15:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yNfC7jCvg1ctww3uoZg78hgFEIXtvNFgWT+FYg7/TTk=; b=jAAs3zYxjcZ7IX
	Vyq+AjbvZbyb5tG3SAnSCi2d8IzVaAlrfk6aPJAyP5Jc4HQ1pO4w09aDSjQlPEup+pd8Dam0od9ZJ
	7p7JimRYu6bu+BceKVAZdxVryRrVUUU9BAuHq/1lg7UXLME4AiSVtxe77VifTCVS/fitYC/8PpQzd
	O2hgDNjrxRlrWlZjk/FU8YJV8Rh4TF4415zSVndAEB+j0kbavYITY0MpmfK3VNC2drYyu79ffcjH/
	D6tv+NG4Muir/zdPiqyODpJVudwbjMlsCPrsyb1h08AipQlQxdUBCNbEmUKFuU/FfvJPxMZb+Evya
	Gh+9LWT862r6k2IRmnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNbc-00000003ELt-1Ck1;
	Mon, 27 Jul 2026 15:51:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNba-00000003ELT-139H;
	Mon, 27 Jul 2026 15:51:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08E9B15A1;
	Mon, 27 Jul 2026 08:50:57 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3D0923F763;
	Mon, 27 Jul 2026 08:50:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785167461; bh=ppKyIilh92SxJAUCgXnn55E0Ht4c4utSVo8m2JGUl6g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAzb1J3RvS7dAaxGpiUZMcpmhuOLyE3H5eHiBiE2m0YEkDO6qDZ7Lqich6Vv5OhX1
	 EK7wUBI9x0E+2OspOWwN0sF+iBLiRBIV6786feaJHGbBxX4bSwgutgvX/z9p1LCWyl
	 f7iWW8NaSn6UkJF8qxCrYmgmdiKe80Y7r+WCd/TU=
Date: Mon, 27 Jul 2026 16:50:52 +0100
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
Subject: Re: [PATCH RFC v2 00/20] mm: optimize unnecessary loads due to
 ptep_get() and friends out
Message-ID: <amd-XDcvRZJzkLRX@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <0143b927-08c5-4e94-ae6e-2a0d7bfe950f@intel.com>
 <amD-TLGWGdMK2ItC@e129823.arm.com>
 <2a2923e4-6166-4ed6-97ba-2e544a1a2f9d@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2a2923e4-6166-4ed6-97ba-2e544a1a2f9d@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_085102_381999_4FC254AA 
X-CRM114-Status: GOOD (  25.42  )
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

On Mon, Jul 27, 2026 at 05:18:00PM +0200, David Hildenbrand (Arm) wrote:
> On 7/22/26 19:30, Yeoreum Yun wrote:
> >> One of my nits about v1 was that it didn't really frame the series
> >> precisely. It talks about "optimization" instead of fundamentally
> >> changing the way that the kernel deals with folded page table levels.
> >>
> >> The optimization that this *wants* to talk about kinda falls out of that
> >> refactoring. It's not really the core of the series, IMNHO.
> >>
> >> This series effectively changes the rules about where and how folded
> >> page table levels can be manipulated. In doing that, the door is opened
> >> to optimizing out the unnecessary loads.
> > 
> > I see. might the title and the cover letter should be reparsed.
> > Thanks to remind it again :)
> 
> While v1 changed "where and how folded page table levels can be manipulated"
> more drastically, v2 leaves most of set_pgd/... working for now, and really only
> changes how pgd_get() operates.
> 
> With v2, there is mostly only a change for page table walkers that use
> pgd_get(): while the existing model already made all these levels be skipped in
> most places except in ptdump code, we now also have to skip them in ptdump code.
> 
> So yes, that should be clearly spelled out: as long as pgd_get() is not
> involved, set_pgd()/pgd_page_vaddr()... will keep working as is.
> 
> The moment someone switches to pgd_get() with folded page tables (like riscv
> already does), set_pgd() is disallowed, and modifications on the actual level
> must be performed. As discussed, a common helper for vmalloc faults would
> already minimize the pain quite a lot in that scenario.
> 
> While we should make that clearer in the patch description, I am wondering
> whether we should also add some basic MM documentation for folded page tables,
> where we at least explain the current state-of-the-art (what's ignored when
> traversing, why does "no_p4d" actually mean "pgd helpers are dummies and p4d
> helpers implement the real logic").

I see, while I'm trying to spell out those, let me see the MM doc
to check whether we need to explain more about this.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
