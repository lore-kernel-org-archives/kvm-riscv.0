Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DFCBC624D4
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2wc14tGRAfqMprH+7wKO6FTjXXsHWjPQfliqt3dcn0E=; b=4tIsDNGX7wRQTz
	NcmWmC4SopthHv5RYIiv8+b3ikYlwsypP2+aV6qZ3idZqOXLVD00Op53UeqDqwssdrnGuuU7y7hbG
	9mEt0BUpOre4lKNir5ialg8neYu5Uy6skpwhDoDRKD5X4/W3QCXwDoc9sIQ9oAnrm15FBnmKRtHt2
	fPU4RrLveeqkw9EjsYUPromV+nQ3b3rdId8LfMBSISFtNG67j9BdPBiV/AtSox4AAto/M5TdLxfgk
	Fkuo5jUji5ZHCnMjdWJAb/r6prTM9QT1dS8dh1b2QQ8imzaqIMk6UEt4m0ptggbAtjwGA/qlYUdEl
	qXYg0Ghyf9HXrRYjrNfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o8R-0000000FInQ-49ZI;
	Wed, 02 Sep 2026 16:48:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o8P-0000000FImk-3u13;
	Wed, 02 Sep 2026 16:48:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C75B5165C;
	Wed,  2 Sep 2026 09:48:20 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 07F7F3F882;
	Wed,  2 Sep 2026 09:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788367704; bh=U+OH94B40NoTGV5hu0mRvJHuyvI3dakCwtDknNYstOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GnvXWjoxcxOtSQbkJLQQ3GnOKnrJ9nFr10cfwUtCgJWT/roaoVtAf1/mEvzgvikQ5
	 RXVLekBW58kpBfbq00LwbRmlPLU/+FVDFDSMj4JxcQvr3vN8VaI7ommpT64lB9niJ6
	 AjsG8nFfQXvSizHpPhebOyU19vy801Vi2MdIplc0=
Date: Wed, 2 Sep 2026 17:48:14 +0100
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
Subject: Re: [PATCH RFC v3 15/21] x86: mm: skip collapse_pud_page() when
 CONFIG_X86_DIRECT_GBPAGES disabled
Message-ID: <aphTTqhf3yO74JoO@e129823.arm.com>
References: <20260902-dummy_ptxp3-v3-0-5d8f5b17c25c@arm.com>
 <20260902-dummy_ptxp3-v3-15-5d8f5b17c25c@arm.com>
 <fa4acc56-9742-4a5e-abd4-7491ad426940@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fa4acc56-9742-4a5e-abd4-7491ad426940@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094826_057335_E93887D9 
X-CRM114-Status: GOOD (  40.26  )
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

Hi Dave,

> On 9/2/26 04:56, Yeoreum Yun wrote:
> > The behaviour of pXd_page() will change with generic compile-time folded
> > page tables by disallowing its use and triggering a compile-time error
> > when it's used improperly, ensuring that the actual pXd_page() is used
> > instead.
> > 
> > To prepare fot that, skip collapse_pud_page() when
> > CONFIG_X86_DIRECT_GBPAGES is disabled.
> 
> Nit: this doesn't explain how the change actually fixes anything or what
> the specific problem being solved is.
> 
> I think you want to say something along the lines of:
> 
> 	collapse_pud_page() uses pud_page() in a way which will soon
> 	trigger a compile-time error on configs that have a folded pud.
> 
> 	The code which will generate that error is actually unreachable
> 	on those configs because 'direct_gbpages' is always 0 there.
> 	However, the compiler does not know that because
> 	'direct_gbpages' is a normal integer from a separate compilation
> 	unit.
> 
> 	Make the compiler aware when most of collapse_pud_page() is
> 	unreachable by adding a Kconfig check. This ensures it will not
> 	trip the errors when they are introduced. It probably also trims
> 	the kernel image down a wee bit too as a side benefit.

Yes.. Sorry for my poor commit message.

> 
> Maybe I should just merge something like the attached patch. I think it
> would solve your problem and make things generally cleaner too.
> 
> There is an existing variable (direct_gbpages) that says whether the
> kernel can and should use 1G pages in the direct map. It is driven
> by a bunch of other machinery. At least:
> 
>  1. Hardware support for 1G pages
>  2. Kconfig support for 1G direct mappings
>  3. Kernel command line overrides
> 
> Most code just checks the 'direct_gbpages' variable itself. But this
> prevents compiler optimization in cases where 1G mappings are
> compile-time disabled (via X86_DIRECT_GBPAGES).
> 
> Add a helper to replace 'direct_gbpages' checks. Check the Kconfig
> option and base CPU support before looking at the variable.
> 
> This lets the compiler optimize things better, especially
> collapse_pud_page() where most of the function can now be optimized
> away.

Yeap. I've tested with your patch and it works for me!
Thanks!

Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Tested-by: Yeoreum Yun <yeoreum.yun@arm.com>

> 
> ---
> 
>  b/arch/x86/include/asm/pgtable.h     |   14 ++++++++++++++
>  b/arch/x86/kernel/cpu/common.c       |    2 +-
>  b/arch/x86/kernel/machine_kexec_64.c |    2 +-
>  b/arch/x86/mm/init.c                 |    2 +-
>  b/arch/x86/mm/pat/set_memory.c       |    4 ++--
>  5 files changed, 19 insertions(+), 5 deletions(-)
> 
> diff -puN arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime arch/x86/include/asm/pgtable.h
> --- a/arch/x86/include/asm/pgtable.h~direct_gbpages-compiletime	2026-09-02 06:53:57.835733398 -0700
> +++ b/arch/x86/include/asm/pgtable.h	2026-09-02 08:17:01.434727771 -0700
> @@ -1163,6 +1163,20 @@ static inline int pgd_none(pgd_t pgd)
>  #ifndef __ASSEMBLER__
>  
>  extern int direct_gbpages;
> +static inline bool direct_gbpages_enabled(void)
> +{
> +	/* Check the direct map config option: */
> +	if (!IS_ENABLED(CONFIG_X86_DIRECT_GBPAGES))
> +		return false;
> +
> +	/* Check the CPU feature: */
> +	if (!cpu_feature_enabled(X86_FEATURE_GBPAGES))
> +		return false;
> +
> +	/* Check the command-line and early setup variable: */
> +	return direct_gbpages;
> +}
> +
>  void init_mem_mapping(void);
>  void early_alloc_pgt_buf(void);
>  void __init poking_init(void);
> diff -puN arch/x86/mm/init.c~direct_gbpages-compiletime arch/x86/mm/init.c
> --- a/arch/x86/mm/init.c~direct_gbpages-compiletime	2026-09-02 06:55:01.004094924 -0700
> +++ b/arch/x86/mm/init.c	2026-09-02 08:20:36.759992562 -0700
> @@ -251,7 +251,7 @@ static void __init probe_page_size_mask(
>  		__default_kernel_pte_mask &= ~_PAGE_GLOBAL;
>  
>  	/* Enable 1 GB linear kernel mappings if available: */
> -	if (direct_gbpages && boot_cpu_has(X86_FEATURE_GBPAGES)) {
> +	if (direct_gbpages_enabled()) {
>  		printk(KERN_INFO "Using GB pages for direct mapping\n");
>  		page_size_mask |= 1 << PG_LEVEL_1G;
>  	} else {
> diff -puN arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime arch/x86/kernel/cpu/common.c
> --- a/arch/x86/kernel/cpu/common.c~direct_gbpages-compiletime	2026-09-02 06:57:47.935849397 -0700
> +++ b/arch/x86/kernel/cpu/common.c	2026-09-02 06:57:57.299617535 -0700
> @@ -2660,7 +2660,7 @@ void __init arch_cpu_finalize_init(void)
>  		 * Right now we don't do that with gbpages because there seems
>  		 * very little benefit for that case.
>  		 */
> -		if (!direct_gbpages)
> +		if (!direct_gbpages_enabled())
>  			set_memory_4k((unsigned long)__va(0), 1);
>  	} else {
>  		fpu__init_check_bugs();
> diff -puN arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime arch/x86/kernel/machine_kexec_64.c
> --- a/arch/x86/kernel/machine_kexec_64.c~direct_gbpages-compiletime	2026-09-02 06:57:58.462712975 -0700
> +++ b/arch/x86/kernel/machine_kexec_64.c	2026-09-02 06:58:05.219267514 -0700
> @@ -257,7 +257,7 @@ static int init_pgtable(struct kimage *i
>  		info.kernpg_flag |= _PAGE_ENC;
>  	}
>  
> -	if (direct_gbpages)
> +	if (direct_gbpages_enabled())
>  		info.direct_gbpages = true;
>  
>  	for (i = 0; i < nr_pfn_mapped; i++) {
> diff -puN arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime arch/x86/mm/pat/set_memory.c
> --- a/arch/x86/mm/pat/set_memory.c~direct_gbpages-compiletime	2026-09-02 06:58:43.518414555 -0700
> +++ b/arch/x86/mm/pat/set_memory.c	2026-09-02 06:59:27.252015369 -0700
> @@ -130,7 +130,7 @@ void arch_report_meminfo(struct seq_file
>  	seq_printf(m, "DirectMap4M:    %8lu kB\n",
>  			direct_pages_count[PG_LEVEL_2M] << 12);
>  #endif
> -	if (direct_gbpages)
> +	if (direct_gbpages_enabled())
>  		seq_printf(m, "DirectMap1G:    %8lu kB\n",
>  			direct_pages_count[PG_LEVEL_1G] << 20);
>  }
> @@ -1340,7 +1340,7 @@ static int collapse_pud_page(pud_t *pud,
>  	pmd_t *pmd, first;
>  	int i;
>  
> -	if (!direct_gbpages)
> +	if (!direct_gbpages_enabled())
>  		return 0;
>  
>  	addr &= PUD_MASK;
> _


-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
