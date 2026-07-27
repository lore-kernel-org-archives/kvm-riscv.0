Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F31BC531FC
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 15:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=prc9V/WzQ2qiCts+AKlfEwH7p77OjuQIV9OETaYq2Qw=; b=zJfl8nM0fcD2vr
	M2RG6B+arKmx2CqVqhKWz6jfjKptKbSEDxN0OQCUSAfQs2iD0vggqIXTX7sMOvdKzrPJQigD8+KC7
	NQVLFwW0PlJHLIlXAl+8OcXQhxXIrgVW8UZ3X4ZqiR9Yy5IbIhy4KOZTZHn0nCmmMIN1XRuYwp8PB
	xHW9Bqc/ms3hQ+DeX34w4ggLf8Hk0C1xCvgaxtS5M6du8FzBQKKuVvkwePYwsYUl2AeLAE4E5kTl0
	Croy6Pn/XE+sbYueuxXsnBl2Z+JJ1X0mVqK2274LCuDpBlVFeIcvN4nZIdesHCRmNkm7ZphnpirBb
	PuhJxIDexzlLy5RMPWBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNFU-00000003Aje-3gQ9;
	Mon, 27 Jul 2026 15:28:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woNFT-00000003AjF-31pI;
	Mon, 27 Jul 2026 15:28:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BFB586001A;
	Mon, 27 Jul 2026 15:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 876871F000E9;
	Mon, 27 Jul 2026 15:27:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785166090;
	bh=Yn7THn92ltfwpRSIf8y0JNhszbsvPepGxqi4mlY8vZY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=MpTXTUf1IbaWg0rNqCCbuu5PcPLoQsBp2p6QMOuOa6C67s0n3nqjMhVlRoe5gZoOp
	 +9aLBlLFOAQK+U+e1a/cBUO3wj8+0KDmrYAdAak8VXXbUHQGCyoArrETZVpKuxnhKc
	 84kpzIlC6XXpyg48j/G5uzn147tOg0iJRP3njbel+YBW112yQFQfx4muGjeKrReHmW
	 r2Xwn5pH7jKH2QupVAX0Nog8210kBR9DZuh7FpjJrb0lVwP1W66fZ+De2pTAnxOrsK
	 IKIAMET39ImFYc2PoHOQVINhU4OXYzMcPNunD547s8eqzIr0pQ8Q9+tXOLuKYxmNGu
	 Olgr4Wr0j5tHw==
Message-ID: <a1df631b-9854-497b-b7fd-831288fca81e@kernel.org>
Date: Mon, 27 Jul 2026 17:27:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 13/20] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
To: Yeoreum Yun <yeoreum.yun@arm.com>, Dave Hansen <dave.hansen@intel.com>
Cc: Russell King <linux@armlinux.org.uk>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Dave Hansen <dave.hansen@linux.intel.com>, Andy Lutomirski
 <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-openrisc@vger.kernel.org
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-13-d9e4bad31e0a@arm.com>
 <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
 <amD_5r04mzMoZ0-r@e129823.arm.com>
 <33c774f6-2750-4831-8eee-e43dc471da32@intel.com>
 <amEvYRs7CjhQdQWT@e129823.arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <amEvYRs7CjhQdQWT@e129823.arm.com>
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

On 7/22/26 23:00, Yeoreum Yun wrote:
> On Wed, Jul 22, 2026 at 01:20:39PM -0700, Dave Hansen wrote:
>> On 7/22/26 10:37, Yeoreum Yun wrote:
>>> However, mm_pXd_folded() requires to mm for other architecture like
>>> s390. might save the mm instead of first_level and calls the
>>> ptdump_pt_level_first() with static inline version would make the
>>> constant comparison. So it requires to save *mm* structure in here.
>>
>> I'm having a really hard time parsing that.
>>
>> I think you're trying to say that the effective_prot_p*() functions need
>> to know the first level but they don't (today) need the mm_struct. If
>> they don't get the (calculated) first_level passed in, they need the
>> mm_struct instead.
>>
>> I think you're arguing 'pg_state' needs a ->first_level or a ->mm.
>> Having a pg_state->mm doesn't seem bad to me at all.
>>
>> But, it's also a little bit silly. It would not be rocket science to
>> pass an mm_struct down to the effective_prot_p*() functions. It makes a
>> whole lot of sense to me for a page table walking function to need
>> metadata from the mm_struct to walk correctly.
> 
> Yes. I mean to add pg_state->mm like:
> 
> diff --git a/arch/x86/mm/dump_pagetables.c b/arch/x86/mm/dump_pagetables.c
> index 2afa7a23340e..aaf00f0c6624 100644
> --- a/arch/x86/mm/dump_pagetables.c
> +++ b/arch/x86/mm/dump_pagetables.c
> @@ -38,6 +38,7 @@ struct pg_state {
>         bool check_wx;
>         unsigned long wx_pages;
>         struct seq_file *seq;
> +       struct mm_struct *mm;
>  };
> 
>  struct addr_marker {
> @@ -254,7 +255,7 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
>         pgprotval_t prot = val & PTE_FLAGS_MASK;
>         pgprotval_t effective;
> 
> -       if (level > 0) {
> +       if (level > pgtable_first_level(st->mm)) {
>                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> 
>                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> @@ -452,7 +453,8 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
>                 .level = -1,
>                 .to_dmesg       = dmesg,
>                 .check_wx       = checkwx,
> -               .seq            = m
> +               .seq            = m,
> +               .mm             = mm,
>         };
> 
>         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 8c093c119e5a..6e7d0580db99 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2490,4 +2490,15 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)                           \
>  }                                                                      \
>  EXPORT_SYMBOL(vm_get_page_prot);
> 
> +static inline int pgtable_first_level(struct mm_struct *mm)
> +{
> +       if (mm_pmd_folded(mm))
> +               return 3;
> +       if (mm_pud_folded(mm))
> +               return 2;
> +       if (mm_p4d_folded(mm))
> +               return 1;
> +       return 0;
> +}

In that case the function should probably be called

"mm_first_pgtable_level"

But now it gets confusing, because we have

enum pgtable_level {
	PGTABLE_LEVEL_PTE = 0,
	PGTABLE_LEVEL_PMD,
	PGTABLE_LEVEL_PUD,
	PGTABLE_LEVEL_P4D,
	PGTABLE_LEVEL_PGD,
};


But maybe we can make sense of it and do

/*
 * The enum values correspond to the numerical page table level,
 * starting with the highest level being level 0.
 */
enum pgtable_level {
	PGTABLE_LEVEL_PGD = 0,
	PGTABLE_LEVEL_P4D,
	PGTABLE_LEVEL_PUD,
	PGTABLE_LEVEL_PMD,
	PGTABLE_LEVEL_PTE,
};

static inline enum pgtable_level mm_first_pgtable_level(struct mm_struct *mm)
{
	if (mm_pmd_folded(mm))
		return PGTABLE_LEVEL_PMD;
	if (mm_pud_folded(mm))
		return PGTABLE_LEVEL_PUD;
	if (mm_p4d_folded(mm))
		return PGTABLE_LEVEL_P4D;
	return PGTABLE_LEVEL_PGD;
}


We could even teach effective_prot() and friends to consume enum pgtable_level
now and have it all be a bit cleaner?

-- 
Cheers,

David

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
