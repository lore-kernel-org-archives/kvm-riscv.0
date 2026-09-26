Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9FBC98332
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 13:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EaG7uEkLpbkttl7EEs8FFLAU9+KzIeEfwiMm5oe0/c8=; b=13/yp6Ochk/5Dq
	FuAdMKr4bL7vmn4fRZ4IaswmYb1MW8TQ9EL/qOWX6KhyHKdjBQ8Lwp9hEiBw43Q/MNfXaUuMq2g8n
	ZwqJATcglTkanoJQQ7bzXnBB2x1JBTQKSv7eCL9WztKUNogrAsxbucl22BAfA2+VjV/WPsK9x8ch8
	rrkYOtz5rf1gkpgO0egwTe5ULSYlGOvsolUBiQA+NOkn+ywvxzTqiTQ/ZarYBdq7zl9XwbFBfHJBL
	dWDLWBTap7PKrv46QgUhGvTSc/MclyFF+j8IG7JpDmfZqoA8MaoE6UpG0qWlLpdpVXxleNY7isEcn
	CUYeCjaUQFQKFsHbJLlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASMS-0000000FSQG-331d;
	Sat, 26 Sep 2026 13:22:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xASMR-0000000FSQ2-2RCk;
	Sat, 26 Sep 2026 13:22:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DAC1D60514;
	Sat, 26 Sep 2026 13:22:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B984F1F000FF;
	Sat, 26 Sep 2026 13:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790428957;
	bh=Ho6ODA6dlgcOvdPnhowd9GgmBiom3Zlo2XTvzY/VTW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gn1PEczgsD5J29kex3G7noDS0spUTsU0srsr+zO1nZZFuyKKVJFH88OWSVdctFAta
	 v7+cMia70kZ1YiuCIVpgK+S7YUkcgPcfUscXxMIVNy2T0tNen4vpOI9UIX+1BDQbbc
	 ePRW1SWCr2qEbUMLcslI3kLtHSdkz6HzShrhvUDCAIXM9cTBfN59vnzkvSpAY5sH1A
	 HiO3kEDoHq52UM6A/hwkWmFG1rbuJuaaijRW4+S7BnYNa61yNGGxIUvVs8xVjcKOaU
	 2ZsrOuBc7LttfpdBhGRS97sgpAQW2anj2l9mfgb3mnYHtFFH+/VpzMj5GLRW0f0MCb
	 rDkMkQL9UaUiA==
Date: Sat, 26 Sep 2026 14:22:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, "David Hildenbrand (Red Hat)" <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, "Kirill A. Shutemov" <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, peterx <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>, Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH v3 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <arfGmNiEngnO3JKm@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <d4d7d4c2-a1d5-41d0-b1c8-8ea0cc5a0397@app.fastmail.com>
 <areSEI5pWBadkqIe@gremlin>
 <408aef6e-5b0a-482f-8ba8-f8c20ee870e5@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <408aef6e-5b0a-482f-8ba8-f8c20ee870e5@app.fastmail.com>
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

On Sat, Sep 26, 2026 at 03:06:33PM +0200, Arnd Bergmann wrote:
> On Sat, Sep 26, 2026, at 11:40, Lorenzo Stoakes (ARM) wrote:
> > On Sat, Sep 26, 2026 at 12:06:22AM +0200, Arnd Bergmann wrote:
> >>
> >> mm/vma.c: In function '__mmap_region':
> >> mm/vma.c:3083:1: error: the frame size of 1552 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> >>
> >> I don't immediately see anything that you did that would have introduced
> >> something bad that wasn't already there, so it's likely just gone from
> >> just below the limit I was using for my testing to just above. The 1536
> >> byte limit is what I use on 64-bit builds with KASAN and otherwise
> >> still has a clean build (with a small number of local fixup patches).
> >
> > Hmm are you specifying this limit manually somehow?
>
> It's a Kconfig setting upstream, but the way I'm doing it is to have
> patch that calculates a sensible default based on other options that
> is a little smaller than the default (currently 2048 bytes) on x86-64
> to catch more cases where something sticks out.

I see.

So this is an early warning more or less :)

>
> >> If I sprinkle some 'noinline_for_stack' annotations on functions
> >> called by __mmap_region(), I can get the size down to 1144 in this
> >> config, but that doesn't sound like a great workaround.
> >>
> >> The large stack usage is potentially harmful if this ends up
> >> in call chains that have additional large stack usage (e.g.
> >> kmalloc() leading to reclaim). Any ideas for how to reduce it here?
> >
> > That can never happen :) this call chain is _only_ for an mmap() call.
>
> I mean more functions called /from/ here, something like
>
>   __mmap_region()
>   __mmap_new_vma()
>   vm_area_alloc()
>   kmem_cache_alloc(..., GFP_KERNEL)
>   slab_alloc_node()
>   allocate_slab()
>   alloc_slab_page()
>   __alloc_pages_slowpath()
>   __alloc_pages_direct_reclaim()
>   __perform_reclaim()
>   try_to_free_pages()
>   shrink_zones()
>   shrink_node()
>   lru_gen_shrink_node()
>   shrink_many()
>   shrink_one()
>   try_to_shrink_lruvec()
>   evict_folios()
>   shrink_folio_list()
>   pageout()
>   shmem_writeout()
>   swap_writeout()
>   swap_add_folio()
>   swap_write_submit()
>   nfs_swap_submit_write()
>   nfs_file_direct_write()
>   nfs_direct_extract_pages()
>   nfs_do_recoalesce()
>   __nfs_pageio_add_request()
>   nfs_pageio_doio()
>   pnfs_generic_pg_writepages()
>   pnfs_do_write()
>   pnfs_try_to_write_data()
>   filelayout_write_pagelist()
>   nfs_initiate_pgio()
>   nfs_local_doio()
>   nfs_local_do_write()
>   nfs_local_call_write()
>   ->write_iter()
>   generic_file_write_iter()
>   generic_write_sync()
>   vfs_fsync_range()
>   ->fsync()
>   xfs_file_fsync()
>   file_write_and_wait_range()
>   filemap_fdatawrite_range()
>   filemap_writeback()
>   do_writepages()
>   ->writepages()
>   xfs_vm_writepages()
>   iomap_writepages()
>   iomap_writeback_folio()
>   iomap_writeback_range()
>   ->writeback_range()
>   xfs_zoned_writeback_range()
>   iomap_add_to_ioend()
>   ->writeback_submit()
>   xfs_zoned_writeback_submit()
>   xfs_zone_alloc_and_submit()
>   xfs_submit_zoned_bio()
>   submit_bio()
>   submit_bio_noacct()
>   submit_bio_noacct_nocheck()
>   __submit_bio_noacct()
>   __submit_bio()
>   blk_mq_submit_bio()
>   blk_mq_run_dispatch_ops()
>   blk_mq_try_issue_directly()
>   blk_mq_run_hw_queue()
>   blk_mq_sched_dispatch_requests()
>   blk_mq_do_dispatch_sched()
>   __blk_mq_do_dispatch_sched()
>   blk_mq_dispatch_rq_list()
>   ->queue_rq()
>   scsi_queue_rq()
>   scsi_dispatch_cmd()
>   ->queuecommand()
>   ata_scsi_queuecmd()
>   __ata_scsi_queuecmd()
>   ata_scsi_translate()
>   ata_scsi_qc_issue()
>   ata_qc_issue()
>   qc_issue()
>   ata_sff_qc_issue()
>   ata_sff_queue_pio_task()

Ugh delightful :)

>
> There are many ways the call chain can go of course, but the actual
> stack overflows do tend to follow this pattern where you are at a
> function with high stack usage and call kmalloc() during low memory
> condition and that ends up waiting for a block I/O down the line.
> (you normally don't go through swap and nfs, I was just looking
> for the worst case I could easily see in the code)

You certainly found quite the example haha.

>
> > In general I am absolutely taking this seriously and will find a way to
> > reduce this, but my only question is whether this is actually something
> > that needs to be done in this series?
> >
> > Because it's already huge and I would rather avoid adding yet another patch
> > to it if possible.
> >
> > If I can do it as a follow-up that'd be ideal!
>
> What I was hoping for is that as you are already deep into the
> exact code that caused the warning and you can already see something
> in there that may help.
>
> I don't think it's urgent, I just don't want it to be forgotten.

It won't be, it's now on my TODO and I see it as a relatively high priority
thing to follow up with.

Will likely send a patch for it next cycle (this is about the worst cycle I've
seen workload-size for mm so I don't really want to send anything more this time
around).

>
>      Arnd

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
