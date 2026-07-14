Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F81C43458
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 11:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4TBS8Bdqm1TJWUsHDVB527nOZxgLP/NWUz5UQ7L4OI=; b=J3yMtlMWflZbqo
	7if+yijhgqDFBpYHF9CcgPfHPE+FYWP/31ywGoBYYVJm5ck6eWKNaQXmqa0rU7znZ0jFfl+5RYbmF
	q5tGGuvFUUeJazSQepmiT7knOcuoFRbwRJ2yfZi2OzB7QZzDjyJc0W+JaAa/0CCs0eapOO9Sy+akp
	OYKDjOyfobgecbq/P6ya7fbsSW6WBjL1jxEMk2yS5GlZSBJecF8lO2Zqku9ahnOIFrmEoFzGjGWJV
	IOr75rPBT8y5ua19uMU2Wyj7HdiN0obdiaR6j4yjyoKWXf1wLObnSZS77CWDV/i9LWe2v6incpPXT
	JvT2I7p5PxCqcoSRe4rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbVL-0000000BhdZ-0x3E;
	Tue, 14 Jul 2026 11:40:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbVJ-0000000Bhcy-1gVW;
	Tue, 14 Jul 2026 11:40:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7EF1B1476;
	Tue, 14 Jul 2026 04:40:43 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AA603F93E;
	Tue, 14 Jul 2026 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784029247; bh=MCWhEFrql7UL36iBX9OZiHoegQ6HAcW6h4DKukQd0P8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MvgpT4ywcE00IxG1JVUyBpm3lJ+pIfECdF6FM/Sc9MXmE2eFpNJRbIz7x2PHnayFc
	 rIEH/1buiyXOZIfInJgpBQRwP/xJTZ/bbTCuLcFjDgZe3iZFv28lVTuFyfnYkwAUXC
	 NhDONHzT6KNdhRrz3tcDrHH80ODV8po7FJy3msTE=
Date: Tue, 14 Jul 2026 12:40:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-mm@kvack.org,
	kasan-dev@googlegroups.com, linux-csky@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-openrisc@vger.kernel.org,
	linux@armlinux.org.uk, akpm@linux-foundation.org,
	ankur.a.arora@oracle.com, rppt@kernel.org, linmag7@gmail.com,
	chleroy@kernel.org, klarasmodin@gmail.com, chenhuacai@kernel.org,
	kernel@xen0n.name, kas@kernel.org, zhangtianyang@loongson.cn,
	wangyuli@aosc.io, tsbogend@alpha.franken.de, ljs@kernel.org,
	jgg@ziepe.ca, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, ryan.roberts@arm.com, pasha.tatashin@soleen.com,
	rmclure@linux.ibm.com, baolin.wang@linux.alibaba.com, tj@kernel.org,
	kevin.brodsky@arm.com, anup@brainfault.org, atish.patra@linux.dev,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, dave.hansen@linux.intel.com, luto@kernel.org,
	peterz@infradead.org, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, hpa@zytor.com, hannes@cmpxchg.org, mhocko@kernel.org,
	qi.zheng@linux.dev, shakeel.butt@linux.dev, kasong@tencent.com,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, ryabinin.a.a@gmail.com, glider@google.com,
	andreyknvl@gmail.com, dvyukov@google.com, vincenzo.frascino@arm.com,
	anshuman.khandual@arm.com, yang@os.amperecomputing.com,
	chaitanyas.prakash@arm.com, ardb@kernel.org, guoren@kernel.org,
	yang.li85200@gmail.com, viro@zeniv.linux.org.uk,
	dinguyen@kernel.org, schuster.simon@siemens-energy.com,
	wangruikang@iscas.ac.cn, junhui.liu@pigmoral.tech,
	muchun.song@linux.dev, vishal.moola@gmail.com, namcao@linutronix.de,
	pavel@kernel.org, djbw@kernel.org, yu-cheng.yu@intel.com,
	baolu.lu@linux.intel.com, Jonathan.Cameron@huawei.com,
	coxu@redhat.com, andreas@gaisler.com, liam@infradead.org,
	vbabka@kernel.org, surenb@google.com, mhocko@suse.com,
	geert@linux-m68k.org, shorne@gmail.com, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <alYgMxKqRnF6_X0A@e129823.arm.com>
References: <c3edfb13-08ec-419c-bc05-8f3f64186b24@intel.com>
 <ac365196-8ccc-4d8b-83d7-28fec763e75c@kernel.org>
 <710b7eb0-8e0c-4f07-991c-2285c77e1beb@intel.com>
 <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com>
 <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_044049_522401_337A6AD8 
X-CRM114-Status: GOOD (  42.65  )
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

> On 7/13/26 23:40, Dave Hansen wrote:
> > On 7/13/26 14:17, David Hildenbrand (Arm) wrote:
> >>> To me, the double READ_ONCE() is a non-issue.
> >> To other arch maintainers, it is!
> > 
> > Ahh, so it seems like Christophe in ppc32 land was looking at this more
> > like a regression that needed to get fixed.
> 
> Yes, exactly. :)
> 
> And I agree that it is something we should be optimizing.
> 
> > 
> > Christophe, just out of curiosity, was this something that was causing
> > you practical problems like measurable performance regressions, or was
> > it really just insane code generation that seems unacceptably suboptimal?
> 
> I'd be curious about that as well. I mean, looking at the generated code
> it's clear that it is suboptimal.
> 
> 
> The solution space I see:
> 
> 
> (1) Pass the result from e.g., pgdp_get() into p4d_get(), so it can just return 
>     the value with folded p4ds.
> 
> That requires extreme amounts of churn in core-mm AFAIKS, so I don't see that as feasible.
> 
> 
> (2) Rewrite folding code to make p4d_present() be a dummy instead of 
>     pgd_present(), and make p4dp_get() return a dummy value.
> 
> ... a lot of churn across architectures. I'm sure we'll learn soon why it was done 
> ike the way it is today in the first place. Something interesting to look at,
> certainly, but a bit of a stretch just to optimize reads.
> 
> 
> (3) Make folded pgdp_get() use an ordinary read instead of a READ_ONCE / dummy.
> 
> I don't like that, because we couldn't catch easily if the value is then
> actually used some old/new code.
> 
> If pgd_present() etc are supposed to ignore the value, I'd rather have a mechanism
> that enforces that the values are actually ignore in pgd_offset() etc as well.
> 
> 
> (4) What we do in this series, but instead of forbidding set_pgd(), make it only 
>     complain when we are passing in a dummy value.
> 
> The expectation is that it would avoid touching most architecture code in patch
> 12 -> 27 and still prevent mistakes in the future.
> 
> @Yeoreum can you play with that and see what the end result would be?

Okay. I'll try with (4) and let me reply how much we can reuduce
the volume of this patch series.

> 
> 
> The problem of how to handle ptdump effective_prot remains. Which is unfortunately an
> x86 32-bit only problem ;) ... and effective_prot is essentially an x86-only thing.
> 
> There are various ways we could handle that, my preferred one would be
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index fb298e2191792..3d56e48fe4151 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -96,7 +96,7 @@ config X86
>         select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
>         select ARCH_HAS_PMEM_API                if X86_64
>         select ARCH_HAS_PREEMPT_LAZY
> -       select ARCH_HAS_PTDUMP
> +       select ARCH_HAS_PTDUMP                  if X86_64
>         select ARCH_HAS_PTE_SPECIAL
>         select ARCH_HAS_HW_PTE_YOUNG
>         select ARCH_HAS_NONLEAF_PMD_YOUNG       if PGTABLE_LEVELS > 2
> 
> 
> Another option would be to keep the behavior unchanged:
> 
> 
> diff --git a/mm/ptdump.c b/mm/ptdump.c
> index 5851096e6f656..ce2cf5e07ac0a 100644
> --- a/mm/ptdump.c
> +++ b/mm/ptdump.c
> @@ -39,6 +39,9 @@ static int ptdump_pgd_entry(pgd_t *pgd, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_p4d_folded(walk->mm))
> +               return 0;
> +
>         if (st->effective_prot_pgd)
>                 st->effective_prot_pgd(st, val);
>  
> @@ -62,6 +65,13 @@ static int ptdump_p4d_entry(p4d_t *p4d, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_pud_folded(walk->mm))
> +               return 0;
> +
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_p4d_folded(walk->mm) && (st->effective_prot_pgd))
> +               st->effective_prot_pgd(st, __pgd(p4d_val(val)));
> +
>         if (st->effective_prot_p4d)
>                 st->effective_prot_p4d(st, val);
>  
> @@ -85,6 +95,15 @@ static int ptdump_pud_entry(pud_t *pud, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       if (mm_pmd_folded(walk->mm))
> +               return 0;
> +
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_pud_folded(walk->mm) && st->effective_prot_pgd)
> +               st->effective_prot_pgd(st, __pgd(pud_val(val)));
> +       if (mm_p4d_folded(walk->mm) && st->effective_prot_p4d)
> +               st->effective_prot_p4d(st, __p4d(pud_val(val)));
> +
>         if (st->effective_prot_pud)
>                 st->effective_prot_pud(st, val);
>  
> @@ -107,6 +126,14 @@ static int ptdump_pmd_entry(pmd_t *pmd, unsigned long addr,
>                 return note_kasan_page_table(walk, addr);
>  #endif
>  
> +       /* Simulate old behavior: all page table levels exist with folded values. */
> +       if (mm_pud_folded(walk->mm) && st->effective_prot_pgd)
> +               st->effective_prot_pgd(st, __pgd(pmd_val(val)));
> +       if (mm_p4d_folded(walk->mm) && st->effective_prot_p4d)
> +               st->effective_prot_p4d(st, __p4d(pmd_val(val)));
> +       if (mm_pmd_folded(walk->mm) && st->effective_prot_pud)
> +               st->effective_prot_pud(st, __pud(pmd_val(val)));
> +
>         if (st->effective_prot_pmd)
>                 st->effective_prot_pmd(st, val);
>         if (pmd_leaf(val)) {

But I think we can get rid of simulation if the x86 allows to modify
(of course, x86 still wants to use PTDUMP) like:

diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
index e32848c7f26d4..aa1277f35773a 100644
--- a/arch/x86/mm/dump_pagetables.c
+++ b/arch/x86/mm/dump_pagetables.c
@@ -29,6 +29,7 @@ struct pg_state {
        struct ptdump_state ptdump;
        struct mm_struct *mm;
        int level;
+       int first_level;
        pgprotval_t current_prot;
        pgprotval_t effective_prot;
        pgprotval_t prot_levels[5];
@@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
        struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
        pgprotval_t prot = val & PTE_FLAGS_MASK;
        pgprotval_t effective;
-       bool first_level = false;

-       /* Ignore folded levels ... */
-       if (((level == 0) && mm_p4d_folded(st->mm)) ||
-           ((level == 1) && mm_pud_folded(st->mm)) ||
-           ((level == 2) && mm_pmd_folded(st->mm)))
-               return;
-
-       /* ... and make the actual first level remember the protection. */
-       if (((level == 0)) ||
-           ((level == 1) && mm_p4d_folded(st->mm)) ||
-           ((level == 2) && mm_pud_folded(st->mm)) ||
-           ((level == 3) && mm_pmd_folded(st->mm)))
-               first_level = true;
-
-       if (!first_level) {
+       if (first_level > st->first_level) {
                pgprotval_t higher_prot = st->prot_levels[level - 1];

                effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
@@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
                .seq            = m
        };

+       if (mm_pmd_folded (mm))
+               st->first_level = 3;
+       else if (mm_pud_folded (mm))
+               st->first_level = 2;
+       else if (mm_p4d_folded (mm))
+               st->first_level = 1;
+       else
+               st->first_level = 0;
+
        ptdump_walk_pgd(&st.ptdump, mm, pgd);

        if (!checkwx)

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
