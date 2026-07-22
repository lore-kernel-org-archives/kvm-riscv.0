Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9396C44532
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 16:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRUCGYKIfWuhSBvet889g8LDb9f/kFtxQxUQ0fMl8J4=; b=N6PURfQH215g/8
	nk3lNdsqHXbh4brYKpS8mQ2XhzQFKfcrjyLefpWpNWHlSzv5tRhDkwcCfK2J1aPAooBYyr9GYFQxR
	lpJ219LYvN/p/Emug3CeOGet6+KQWgVE/Wh8woagMdo7KlXskHMp0ujTHGmU3ZRzdgV+8Lu2YfZ8v
	89XZ+4gKAQIeJzTMVgNDBqDVk5jVooIbqJJoCWA8Gu9cq40KiBdyHAZFYJZWimMDSjLzi7taP9UfU
	fuR3xWD++vQO+Sb0hpFSP3F49oBPpXJYdMhYzz1aSW+wpigPeRrT5BXPxw4NN7fKg4nsdtmz+5JHn
	hHAYD3uzJte12euAELSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZtT-0000000CMJb-1TLz;
	Wed, 22 Jul 2026 16:34:03 +0000
Received: from mgamail.intel.com ([198.175.65.14])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZtQ-0000000CMIV-1Yw3;
	Wed, 22 Jul 2026 16:34:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784738040; x=1816274040;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=1QLPxfH8/RN3PQ9UGJYpi0qgjdofCd33BuN7TbSZzXc=;
  b=EFszpw1bmjQKKhcu/A2G/6OtfxBueYzOMAKHEcEic3eSktrKWUap/wZx
   h0XUv8NOmXDaCov4RnDwYVp5rEfXr50o20jkbqJ6iLM7xSP//w7jKI9+i
   UlcjzTbGe2XajL7AYPZQo/PMUS7meuftzFjoieLdVDI0FoMEeaGt5JCDH
   4inLhKmIvI4xzor0eiWyV1WVUQxFulOU5yvSsMq1Yf3YxjZt4zsYDNobQ
   DBHU2pq15UnI/F3qqJyzhne383EgddrRXjMmRlZvXncGFrdCa4G/KwmHu
   f0/n4u/XgjfVrPI8tM08AXfaBgVcHJSq74Kqd/3jKMhQSYQ1YBB8Vfs+9
   g==;
X-CSE-ConnectionGUID: clBFPmG4QzuXi8Ti3GUZ1Q==
X-CSE-MsgGUID: xAFjUxvlTLKP/OqLFxukZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89270581"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="89270581"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:33:57 -0700
X-CSE-ConnectionGUID: N1PqcFg2RGO75tskQrSErQ==
X-CSE-MsgGUID: K5TDUu1dTVeZ26T1hAufkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="296351973"
Received: from sghuge-mobl2.amr.corp.intel.com (HELO [10.125.110.58]) ([10.125.110.58])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 09:33:57 -0700
Message-ID: <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
Date: Wed, 22 Jul 2026 09:33:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 14/20] x86: mm: skip pud setup when using generic
 compile-time folded pagetable
To: Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-openrisc@vger.kernel.org
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
From: Dave Hansen <dave.hansen@intel.com>
Content-Language: en-US
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
In-Reply-To: <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_093400_457848_FB4310CB 
X-CRM114-Status: GOOD (  26.25  )
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

On 7/22/26 08:30, Yeoreum Yun wrote:
> We want to rework how set_pXd() behaves for generic compile-time folded

Please move this all to imperative voice. I think I asked for this
before, but perhaps I didn't. Either way, please fix the whole series.

> page tables by disallowing its use and triggering a compile-time error
> when it is used improperly, ensuring that the actual first-level set_pXd()
> function is used instead.
> 
> The behaviour of pXd_page() will change with generic compile-time folded
> page tables by disallowing its use and triggering a compile-time error
> when it's used improperly, ensuring that the actual.
> 
> To prepare fot that, skip collapse_pud_page() and populate_pud() according
> to CONFIG_PGTABLE_LEVELS.
> 
> There should be no functional change.

If this wasn't done, what would happen? There would be a compile error,
right?

Shouldn't that be said out loud somewhere?

> diff --git a/arch/x86/mm/pat/set_memory.c b/arch/x86/mm/pat/set_memory.c
> index 078689aa7206..91b33a265a43 100644
> --- a/arch/x86/mm/pat/set_memory.c
> +++ b/arch/x86/mm/pat/set_memory.c
> @@ -1346,7 +1346,7 @@ static int collapse_pud_page(pud_t *pud, unsigned long addr,
>  	pmd_t *pmd, first;
>  	int i;
>  
> -	if (!direct_gbpages)
> +	if (CONFIG_PGTABLE_LEVELS == 2 || !direct_gbpages)
>  		return 0;

This is subtly wrong. It probably shuts the compiler up, but it's subtly
wrong.

x86 has 4 paging modes. I'll use the SDM/Intel terminology:

32-bit:
 * 32-bit paging: 2-level
 * PAE: 3-level
64-bit:
 * 4-level paging
 * 5-level paging

But "gbpages" are not available in PAE paging. It's a hardware
limitation. This doesn't cause a functional problem because the pud
level is not folded. But it is confusing and not really an accurate way
to write this check.

The *right* way to do this is probably something like this in a header:

static inline bool direct_gbpages(void)
{
	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
		return false;

	return __direct_gbpages;
}

Which just happens to point readers over to this Kconfig nugget:

config X86_DIRECT_GBPAGES
        def_bool y
        depends on X86_64

which, combined with the knowledge that 32-bit has a 3-level mode, would
make the proposed check obviously wrong.

So I'll take this as a suitable alternative:

	/* Avoid compiling the below code if PUD-level mappings are impossible: */
	if (IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
		return 0;

	if (!direct_gbpages)
		return 0;

That will compile-time optimize the code away in the exact right
conditions *and* fix the (assumed by me) compile error that you were
chasing.

> @@ -1730,7 +1730,8 @@ static int populate_pud(struct cpa_data *cpa, unsigned long start, p4d_t *p4d,
>  	/*
>  	 * Map everything starting from the Gb boundary, possibly with 1G pages
>  	 */
> -	while (boot_cpu_has(X86_FEATURE_GBPAGES) && end - start >= PUD_SIZE) {
> +	while (CONFIG_PGTABLE_LEVELS > 3 && boot_cpu_has(X86_FEATURE_GBPAGES) &&
> +	       end - start >= PUD_SIZE) {
>  		set_pud(pud, pud_mkhuge(pfn_pud(cpa->pfn,
>  				   canon_pgprot(pud_pgprot))));

This is an OK approach. But there's a way to fix this site *and*
optimize a non-zero amount of other code at the same time. Add this hunk
to arch/x86/Kconfig.cpufeatures:

config X86_DISABLED_FEATURE_GBPAGES
        def_bool y
        depends on X86_32

That will turn the boot_cpu_has() check in to something that can be
resolved at compile time. It has the added advantage of compiling out
all of the code under X86_FEATURE_GBPAGES everywhere else in the tree.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
