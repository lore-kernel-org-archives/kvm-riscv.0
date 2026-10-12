Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0DEDCA9EDE
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YE/0ob6GSnW/kNWtDNR/yWzsabhz8UEATTY0S3kWcIg=; b=eGThkKAsjEtGUB
	zFTomOMq0MIaBZGGYLuIOnqjLL1pYuxuDIeFwmyEOWF8yEH9i85oFf+t6AkYfN0RdECoGHkjFeVP9
	LrtGx8yD/FwIcY75BC576lxjpUcuS8gWYBkBhQJHRYl6LMXQZN82MDe6YkVLOhBRyo2baSzUSTmsJ
	Wx45NykGCN7C913iK+/ulTIDcnNDLLardCymkXNb4H73v0Fcn6D0r+XXKjh95dKyHXr7QRyclXUF/
	xDQzCwwckqu4ouQwdvksz3H7vWEUP7J7b3dExk6PwKBgCl4PQplNt20dkY3YzlRxBbDxVhQEUpXvp
	C85GvQBU6tX+u2EwjOIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK74-0000000B9HO-2NIy;
	Mon, 12 Oct 2026 17:47:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGK73-0000000B9H5-0lvL;
	Mon, 12 Oct 2026 17:47:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C31260142;
	Mon, 12 Oct 2026 17:47:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67E231F0089B;
	Mon, 12 Oct 2026 17:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791827219;
	bh=+g5TXryhSnKPgSPaqVMSsv6/T+/UMkqlwUebHC3VUds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ihX6vADgFuOE35cu0zGAhteEVahYq066vTf05uMn2wQqi0hmjfZuiiGTMFMR9hWXh
	 xnW7REmcc8e1p3/WcFwjupa8SppqNwX/y9mIjcYy3VHazi7OTmaWgP2V5vUwjHi9I5
	 kNk8dToyKFzBYNV18fU2ztlaDEJQ6Y1VLVwZP7qX7OVegsucIsOL5qeLI+kOAMdpKI
	 5hOyy90zfW/wGKFCnCd4rlbFF+e0fhiASRsSS4s5sjVjyqospM0EHf5F1QM381KtzM
	 1dGRP+bV4orEz850LW6SfHDrkY7tFGGxMVHygnSeQy06A/xo4vxVoddJq6QQzB1LU7
	 8DAZLz8edumdA==
Date: Mon, 12 Oct 2026 18:46:20 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>, Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v5 07/38] mm: add mmap action for discontiguous kernel
 page mapping
Message-ID: <as0S-4wDLCJGEItq@gremlin>
References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@kernel.org>
 <20261009-b4-mmap-prepare-vma-flag-sanify-v5-7-923b70125b1e@kernel.org>
 <56cc2787-134b-48f0-a9e2-840f57b28607@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56cc2787-134b-48f0-a9e2-840f57b28607@kernel.org>
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

On Mon, Oct 12, 2026 at 05:03:02PM +0200, David Hildenbrand (Arm) wrote:
> On 10/9/26 20:04, Lorenzo Stoakes (ARM) wrote:
> > The existing kernel page mapping mmap actions allow for partial and full
> > mapping of an array of struct page pointers.
> >
> > However some drivers require the mapping of discontiguous ranges. Permit
> > this by providing discontig_kernel_page_ops which allows a driver to
> > specify how the operation should begin and how batches of pages should be
> > retrieved.
> >
> > It uses the minimum exposed interface to do so, providing address, page
> > offset and both vm_private_data state and a local private state object.
> >
> > ops->init can establish state for the operation, and ops->get outputs the
> > pages to map and their count. Should an error arise the core unmaps the
> > VMA, invoking vm_ops->close, which is therefore where any state established
> > by ops->init is released.
> >
> > Also update the compatibility layer to do this too via
> > compat_mmap_action_abort().
> >
> > Batches may not exceed the VMA, but may map less than its full range in
> > case the driver wishes to allow the user to map an area larger than the
> > available data.
> >
> > To use it, users invoke mmap_action_map_discontig_kernel_pages() with
> > initial local private state and a set of operations.
> >
> > Users can then use one of the provided helper functions to perform an
> > action:
> >
> > * discontig_kernel_map_abort() - Abort and leave the mapping as it has
> >   been accumulated so far.
> > * discontig_kernel_map_page() - Map a single page, or a compound page given
> >   its head page.
> > * discontig_kernel_map_page_range() - Maps a struct page ** array of a
> >   specified count, mapping only those pages which fit in the VMA.
> >
> > While here, update vm_insert_page() and vm_insert_pages() to assert the
> > mmap write lock is held rather than the bizarre assert !mmap_read_trylock()
> > and use the new VMA API so all code paths are consistent.
> >
> > Also convert a BUG_ON() to a VM_WARN_ON_ONCE() in vm_insert_page().
> >
> > The userland VMA tests are updated accordingly.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
>
>
> Finally finding time to go over this. In the future I want to have more time to
> review such massive series, as it causes severe stress to be forced to review
> this last minute before it goes upstream.
>
> So if I push back in order to give me some more room to breathe in the future
> it's nothing personal, I just have to keep my sanity somehow.
>
> I hate being forced to review because we pick up stuff way to early. There is
> just way too much other stuff going on.
>
> I'm planning on picking up most stuff I maintain in the next cycle. For
> cross-component stuff (esp. VMA) I expect Andrew to pick stuff up until we
> tackle this once cycle later.

OK I understand, sorry for sending such a large series.

I already delayed it from last cycle and sent early in rc2, but I understand
there's been a lot of volume in this one.

I've been working evenings and weekends myself to keep up with review (and
failing), so I get how thankless it can be (LPC was also unhelpfully timed!)

I will try to split things out more in future, this had a lot of dependencies so
it wasn't clear that made sense + wouldn't just cause more stress over a longer
period otherwise.

>
>
> > +static inline
> > +void mmap_action_map_discontig_kernel_pages(struct vm_area_desc *desc,
> > +		void *init_private, const struct discontig_kernel_page_ops *ops)
> > +{
> > +	struct mmap_action *action = &desc->action;
> > +
> > +	action->type = MMAP_DISCONTIG_KERNEL_PAGES;
> > +	action->map_kernel_discontig.init_private = init_private;
> > +	action->map_kernel_discontig.ops = ops;
> > +}
> > +
> >  int mmap_action_prepare(struct vm_area_desc *desc);
> >  int mmap_action_complete(struct vm_area_struct *vma,
> >  			 struct mmap_action *action, bool is_compat);
>
> There is a mixture of two tab vs. different in your changes.

OK. mm is fairly inconsistent about this, I will convert all to 2 tabs.

>
> >
> > +static inline void
> > +discontig_kernel_map_abort(struct discontig_kernel_page_state *state)
> > +{
> > +	state->action = DISCONTIG_KERNEL_PAGE_ABORT;
> > +}
> > +
> > +static inline void
> > +discontig_kernel_map_page(struct discontig_kernel_page_state *state,
> > +			  struct page *page)
> > +{
> > +	struct folio *folio = page_folio(page);
> > +
> > +	if (folio_test_large(folio)) {
> > +		VM_WARN_ON_ONCE(page != folio_page(folio, 0));
> > +		state->action = DISCONTIG_KERNEL_PAGE_MAP_COMPOUND_PAGE;
> > +		state->__folio = folio;
> > +		state->__nr_pages = min(state->nr_pages_remain,
> > +					folio_nr_pages(folio));
> > +	} else {
> > +		state->action = DISCONTIG_KERNEL_PAGE_MAP_PAGE;
> > +		state->__page = page;
> > +		state->__nr_pages = 1;
> > +	}
>
> Why are both separate? Isn't it sufficient to represent that through _page +
> _nr_pages > 1 ? See below.

Ack yup that works.

>
> > +}
> > +
> > +static inline void
> > +discontig_kernel_map_page_range(struct discontig_kernel_page_state *state,
> > +				struct page **page_arr, unsigned long nr_pages)
>
> Is this actually "map_pages"? A range is rather a number of consectuive pages
> part of the same folio/compound page, no?
>
> (we call insert_pages() later ... )

Sure, can change.

>
> > +{
> > +	state->action = DISCONTIG_KERNEL_PAGE_MAP_PAGE_RANGE;
> > +	state->__page_arr = page_arr;
> > +	state->__nr_pages = min(nr_pages, state->nr_pages_remain);
>
> So we expect all of them to be non-compound?

Yup this matches existing insert_pages() behaviour.

>
>
> [...]
>
> > diff --git a/mm/internal.h b/mm/internal.h
> > index fc4e249e2343..557e629db8c5 100644
> > --- a/mm/internal.h
> > +++ b/mm/internal.h
> > @@ -1515,6 +1515,9 @@ int simple_ioremap_prepare(struct vm_area_desc *desc);
> >  int map_kernel_pages_prepare(struct vm_area_desc *desc);
> >  int map_kernel_pages_complete(struct vm_area_struct *vma,
> >  			      struct mmap_action *action);
> > +int map_discontig_kernel_pages_prepare(struct vm_area_desc *desc);
> > +int map_discontig_kernel_pages_complete(struct vm_area_struct *vma,
> > +					struct mmap_action *action);
> >
> >  static inline int io_remap_pfn_range_prepare(struct vm_area_desc *desc)
> >  {
> > diff --git a/mm/memory.c b/mm/memory.c
> > index 448342883e9d..e5c1d1c35bc7 100644
> > --- a/mm/memory.c
> > +++ b/mm/memory.c
> > @@ -2599,27 +2599,34 @@ int vm_insert_pages(struct vm_area_struct *vma, unsigned long addr,
> >
> >  	if (!range_in_vma(vma, addr, end))
> >  		return -EFAULT;
> > -	if (!(vma->vm_flags & VM_MIXEDMAP)) {
> > -		VM_WARN_ON_ONCE(mmap_read_trylock(vma->vm_mm));
> > -		VM_WARN_ON_ONCE(vma->vm_flags & VM_PFNMAP);
> > -		vm_flags_set(vma, VM_MIXEDMAP);
> > +	if (!vma_test(vma, VMA_MIXEDMAP_BIT)) {
> > +		mmap_assert_write_locked(vma->vm_mm);
> > +		VM_WARN_ON_ONCE(vma_test(vma, VMA_PFNMAP_BIT));
>
> I would prefer to have these changes in a separate patch. Or is it strictly
> required to have this in this very patch?

That was because Suren raised the 'assert on mmap_read_trylock()' thing and I
wanted to get the other cases here to be consistent.

I will split it out into another patch.

>
>
> > +		vma_start_write(vma);
> > +		vma_set_flags(vma, VMA_MIXEDMAP_BIT);
> >  	}
> >  	/* Defer page refcount checking till we're about to map that page. */
> >  	return insert_pages(vma, addr, pages, num, vma->vm_page_prot);
> >  }
> >  EXPORT_SYMBOL(vm_insert_pages);
> >
> > +static void __map_kernel_pages_prepare(struct vm_area_desc *desc)
> > +{
> > +	if (vma_desc_test(desc, VMA_MIXEDMAP_BIT))
> > +		return;
> > +
> > +	mmap_assert_write_locked(desc->mm);
> > +	VM_WARN_ON_ONCE(vma_desc_test(desc, VMA_PFNMAP_BIT));
> > +	vma_desc_set_flags(desc, VMA_MIXEDMAP_BIT);
> > +}
> > +
> >  int map_kernel_pages_prepare(struct vm_area_desc *desc)
> >  {
> >  	const struct mmap_action *action = &desc->action;
> >  	const unsigned long addr = action->map_kernel.start;
> >  	unsigned long nr_pages, end;
> >
> > -	if (!vma_desc_test(desc, VMA_MIXEDMAP_BIT)) {
> > -		VM_WARN_ON_ONCE(mmap_read_trylock(desc->mm));
> > -		VM_WARN_ON_ONCE(vma_desc_test(desc, VMA_PFNMAP_BIT));
> > -		vma_desc_set_flags(desc, VMA_MIXEDMAP_BIT);
> > -	}
> > +	__map_kernel_pages_prepare(desc);
> >
> >  	nr_pages = action->map_kernel.nr_pages;
> >  	end = addr + PAGE_SIZE * nr_pages;
> > @@ -2640,6 +2647,98 @@ int map_kernel_pages_complete(struct vm_area_struct *vma,
> >  			    &nr_pages, vma->vm_page_prot);
> >  }
> >
> > +int map_discontig_kernel_pages_prepare(struct vm_area_desc *desc)
> > +{
> > +	const struct mmap_action *action = &desc->action;
> > +	const struct discontig_kernel_page_ops *ops =
> > +		action->map_kernel_discontig.ops;
> > +
> > +	/* At minimum need to be able to get pages. */
> > +	if (WARN_ON_ONCE(!ops || !ops->get))
> > +		return -EINVAL;
> > +
> > +	__map_kernel_pages_prepare(desc);
> > +	return 0;
> > +}
> > +
> > +static int apply_discontig_action(struct vm_area_struct *vma,
> > +				  struct discontig_kernel_page_state *state)
> > +{
> > +	unsigned long nr_pages = state->__nr_pages;
> > +	unsigned long addr = state->addr;
> > +	unsigned long i;
> > +
> > +	if (state->action == DISCONTIG_KERNEL_PAGE_MAP_PAGE)
> > +		return insert_page(vma, addr, state->__page,
> > +				   vma->vm_page_prot, /*mkwrite=*/false);
> > +	if (state->action == DISCONTIG_KERNEL_PAGE_MAP_PAGE_RANGE)
> > +		return insert_pages(vma, addr, state->__page_arr,
> > +				    &nr_pages, vma->vm_page_prot);
> > +
> > +	/* Compound folio - have to iterate through each page. */
> > +	for (i = 0; i < nr_pages; i++, addr += PAGE_SIZE) {
> > +		struct page *page = folio_page(state->__folio, i);
> > +		int err;
> > +
> > +		err = insert_page(vma, addr, page, vma->vm_page_prot,
> > +				  /*mkwrite=*/false);
> > +		if (err)
> > +			return err;
> > +	}
>
> Summarizing some of my comments below, I wonder if this could be:
>
> DISCONTIG_KERNEL_PAGE_MAP_PAGES - array of individual apges
> DISCONTIG_KERNEL_PAGE_MAP_CONTIG_PAGES - 1..N contiguous pages

OK.

>
>
> if (state->action == DISCONTIG_KERNEL_PAGE_MAP_PAGES)
> 	return insert_pages(vma, addr, state->__page_arr,
> 			    &nr_pages, vma->vm_page_prot);
>
> VM_WARN_ON_ONCE(state->action != DISCONTIG_KERNEL_PAGE_MAP_CONTIG_PAGES)
> for (i = 0; i < nr_pages; i++, addr += PAGE_SIZE) {
> 	struct page *page = state->__page + i;
> 	int err;
>
> 	err = insert_page(vma, addr, page, vma->vm_page_prot,
> 			  /*mkwrite=*/false);
> 	if (err)
> 		return err;
> }
> ...

OK. Will respin for v6.

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
