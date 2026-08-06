Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A988C55838
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 07:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vl/l3cfJtNpR+BSw1LJwqccvT3xoEJy1wKy9znvOrbw=; b=mWyusrEKqoqyrU
	vOZ+jQWU84rNggfQnZzeiPse4qAX15WnLkUi9+PqX8iwj9AAiKOjIxwxsVr3mm8sszsQFYn4YrSwp
	JLSSprRL0GXK1gMu2fwLNQJj8spZOH5ojaq30Uo3+CYPNfm9+EGAXh0pprraNvSMR3LRdDoaNzP8C
	X3dW+V62HZZdREdZqFw0fQhxNwXRAuY+Ls21zwhwxzMmBExRIRsCvfnplmdtvqPyqQudUjbuWWITF
	sppuBj/U6may9ll8Rlw2e6+6+/XYXyitdRX8YW54LPu4mJyNgCEJTTYyUUt9V1quA2wh1HqdM1DbQ
	J6CPcCNWlQw3UoA5/fGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrscn-000000059FI-3WPm;
	Thu, 06 Aug 2026 07:34:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrscl-000000059En-3enf;
	Thu, 06 Aug 2026 07:34:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A43C60A9D;
	Thu,  6 Aug 2026 07:34:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA9D1F000E9;
	Thu,  6 Aug 2026 07:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786001682;
	bh=y3wUW9A5onn8mXoBrGXcecd/b5GN4A+lRTgjr2p0JTI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gRtWObilZ/zqY2xNJFCFGkSOxfW+x1vY1mLHvaVfFn3nCz/YO+ctLWfNTTs4szgnu
	 yTVCVopxmFl5NcnYpG991e8Bt2Ezz8pE1lZATTWxE8x5kpf0Cga4wRPeWCS7E5HqWv
	 XYFKlbUMhZXVnLOpWi/i+ZQVJSvS2hDlXe0DDN6dURjWleKZWV49tMZzt2Af3x0wCx
	 girzSHfnN2fGQM3POEWVr+brhoQK6GI2hxA4PAd23gY3P1IVF+HqesJZch2/8pByI2
	 /EHEMqZTbBwqX/8U8p+wI2vggLbJGqS41xPiSDTkTcAYl1PUWUd+oug/OamioWoiLi
	 FVdw8NszJIKKQ==
Date: Thu, 6 Aug 2026 08:34:22 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: linux-riscv@lists.infradead.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v2 10/15] mm/gup: add fast-GUP specific lockless PTE
 helpers
Message-ID: <anQ2bW3JxraT6PFY@lucifer>
References: <cover.1784201104.git.cuiyunhui@bytedance.com>
 <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <138d74aa9863ae8ff445e16a2798d062895b75bc.1784201104.git.cuiyunhui@bytedance.com>
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

+cc literally everybody you failed to contact...!

Why on earth are you doing sending a series like this which changes core mm,
non-RFC and at v2 to boot, without bothering to Cc relevant people?

I am also very confused as to why you are sending an ostensible RISC-V series
then changing how core mm works to fit it, that's not how that works.

And if you're seeking to change core mm send it as an RFC!

On Thu, Jul 16, 2026 at 08:41:45PM +0800, Yunhui Cui wrote:
> fast-GUP snapshots a PTE without holding the PTL, pins the page, and
> then revalidates that the PTE did not change. Keep both reads under the
> same lockless PTE semantics by defaulting the fast-GUP revalidation to
> ptep_get_lockless().

Why?...

>
> Introduce fast-GUP specific PTE snapshot and revalidation helpers. The
> default implementation preserves the existing ptep_get_lockless()
> semantics, while allowing architectures to override the helpers when the
> public lockless getter provides extra semantics that fast-GUP does not
> consume.
>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  include/linux/pgtable.h | 18 ++++++++++++++++++
>  mm/gup.c                |  6 ++++--
>  2 files changed, 22 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index da14328093a86..62943fcbf7046 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -813,6 +813,24 @@ static inline pte_t ptep_get_lockless(pte_t *ptep)
>  }
>  #endif
>

Of course, no comments, helpful!

> +#ifndef gup_ptep_get_lockless
> +static inline pte_t gup_ptep_get_lockless(pte_t *ptep, pte_t *rawp)

rawp? This is terrible naming.

And 'gup_ptep_get_lockless()' is worse. What on earth is this function meant to
do? And why is 'gup lockless' considered different from lockless?

And you return the value twice, because of course you do. Why? Who knows.

> +{
> +	pte_t pte = ptep_get_lockless(ptep);
> +
> +	*rawp = pte;
> +
> +	return pte;
> +}
> +#endif
> +
> +#ifndef gup_ptep_revalidate
> +static inline bool gup_ptep_revalidate(pte_t *ptep, pte_t raw_pte)
> +{
> +	return pte_val(raw_pte) == pte_val(ptep_get_lockless(ptep));
> +}

Again this naming is utterly terrible and I'm at a loss as to why on earth
you're doing this?

We don't need to abstract equality checks?

> +#endif
> +
>  #ifndef pmdp_get_lockless
>  static inline pmd_t pmdp_get_lockless(pmd_t *pmdp)
>  {
> diff --git a/mm/gup.c b/mm/gup.c
> index 99902c15703b0..72fb147193e55 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2842,10 +2842,12 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  	if (!ptep)
>  		return 0;
>  	do {
> -		pte_t pte = ptep_get_lockless(ptep);
> +		pte_t raw_pte, pte;

What on earth is a 'raw' PTE?

>  		struct page *page;
>  		struct folio *folio;
>
> +		pte = gup_ptep_get_lockless(ptep, &raw_pte);
> +
>  		/*
>  		 * Always fallback to ordinary GUP on PROT_NONE-mapped pages:
>  		 * pte_access_permitted() better should reject these pages
> @@ -2871,7 +2873,7 @@ static int gup_fast_pte_range(pmd_t pmd, pmd_t *pmdp, unsigned long addr,
>  			goto pte_unmap;
>
>  		if (unlikely(pmd_val(pmd) != pmd_val(pmdp_get_lockless(pmdp))) ||
> -		    unlikely(pte_val(pte) != pte_val(ptep_get_lockless(ptep)))) {
> +		    unlikely(!gup_ptep_revalidate(ptep, raw_pte))) {

Why do we need to refadctor a comparison between a local variable and a lockless
get?

I'm just so confused by what on earth this patch is meant to be or why it's here...

>  			gup_put_folio(folio, 1, flags);
>  			goto pte_unmap;
>  		}
> --
> 2.39.5
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
