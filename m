Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE005CA9EDE
	for <kvm-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 18:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SnpkJ0lVkKChz8CCA7siLuPQRtV9bgGl8YsDq5nUlHw=; b=FEYyYVlCeR4HOA
	b+aXDrSWpgoG88QdLm21R5rvLua9HgmUcSjPTZ3pG1vSObcWF3fgGjF1nr18aOX+gO6DPS4E4M0+H
	9BEriun7OWHID/wrK/gqIE1zHWvXeqA5iabHbNHcnrPd2IqBorP5f9DRzEQQkPLA+o4xB9GSqteO9
	6FnNxjhSqBXapyNSDAvZrSSE7miNxM2NGK0lpj2o35ORL82kcdM1ZairtbfOOpOqOpeNoFI8m01qW
	DGs94nriA+ZyGxNknhbH+CDOWVkeLbxxRQgoqnDJbntI8exHiSO/+c6gJvxE7GagTJn3YbtUsawsP
	JKyi6GWJu486x4p+N8lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKZ5-0000000BCBs-2oo9;
	Mon, 12 Oct 2026 18:15:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGKZ4-0000000BCBX-0G5n;
	Mon, 12 Oct 2026 18:15:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C783341179;
	Mon, 12 Oct 2026 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21CAA1F008A1;
	Mon, 12 Oct 2026 18:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791828957;
	bh=UYY0MSTSV/lzjFZVBtMBYKll1hhz2HZYmEB77bYYO8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NGNHymLwZKbCWsslcnEUwI//+cq6FM4jrs7Ia4F+jhzWDXKoZWIgGKDTaly/zYCVy
	 N+u1mw2NdZ92jr/bNvHzwEkIWzCVEzwNXu6gIE00aKEVtClmyPdMax8rEr8S6UODpC
	 MfmedbtTEJ2mNqfIHxKYTlHH73Y0G/oSXblggh9QGAyRRxb0CLwIMwpqJGM504CZ5X
	 XwlQ7niweJ7YuNmIIZV2JU+6rjKnr6s7+UcK552McrgXS+YYD9hU/Z7lWoVtfyFXTP
	 ASpYZzxjtE9xK7MNYdM2ZPWWDVodgdmtgIzCRz75qkJRgDq3yVLOYqSo2cDEsvTtrz
	 dXghVzOn8w/Qg==
Date: Mon, 12 Oct 2026 19:15:10 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Ihor Solodrai <ihor.solodrai@linux.dev>, Bert Karwatzki <spasswolf@web.de>
Subject: Re: [PATCH v5 14/38] mm/vma: add vma[_flags]_is_mm_managed()
 predicates
Message-ID: <as0jWKT3NgK7NP7i@gremlin>
References: <20261009-b4-mmap-prepare-vma-flag-sanify-v5-0-923b70125b1e@kernel.org>
 <20261009-b4-mmap-prepare-vma-flag-sanify-v5-14-923b70125b1e@kernel.org>
 <7554094f-d853-482f-ba82-3e2f7b1cf4a0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7554094f-d853-482f-ba82-3e2f7b1cf4a0@kernel.org>
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

On Mon, Oct 12, 2026 at 08:06:41PM +0200, David Hildenbrand (Arm) wrote:
> On 10/9/26 20:04, Lorenzo Stoakes (ARM) wrote:
> > Rather than referring to VMA flags with uncertain meaning, add a new
> > predicate that explicitly describes what absence of the VMA_PFNMAP_BIT and
> > VMA_MIXEDMAP_BIT flags means, and then refer to that function for
> > determining VMA mergeability.
> >
> > If neither of these flags are set, that means the contents of the mapping
> > are managed by core mm.
> >
> > Otherwise they are instead owned by some other kernel component, usually a
> > driver: the memory may be MMIO, kernel-allocated pages or even ordinary
> > pages the driver maps itself, but core mm must not populate, reclaim,
> > migrate, copy-on-write or merge the range itself.
> >
> > We initially also treat VMA_IO_BIT as implying a mapping is not mm-managed,
> > as by implication it cannot be. (mlock() also sets VMA_IO_BIT transiently
> > on ordinary VMAs while locking them, which is addressed later in this
> > series.)
> >
> > However the intent is to in future remove this, as no mapping should be
> > marked as an I/O mapping without also being marked with VMA_PFNMAP_BIT.
> >
> > This forms the basis of further work intended to improve how we express VMA
> > properties such as this.
> >
> > Also update the VMA userland tests to reflect the change.
> >
> > No functional change intended.
> >
> > Reviewed-by: Zi Yan <ziy@nvidia.com>
> > Reviewed-by: Suren Baghdasaryan <surenb@google.com>
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  include/linux/mm.h              | 53 ++++++++++++++++++++++++++++++++++++++++-
> >  tools/testing/vma/include/dup.h | 29 +++++++++++++++++++++-
> >  2 files changed, 80 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 97e1eb4fe3a4..83953757735a 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -1612,6 +1612,41 @@ static inline bool vma_is_shared_maywrite(const struct vm_area_struct *vma)
> >  	return is_shared_maywrite(&vma->flags);
> >  }
> >
> > +/**
> > + * vma_flags_is_mm_managed() - Do the specified VMA flags indicate that the
> > + * contents of the VMA are managed by core mm?
> > + * @flags: The VMA flags to test.
> > + *
> > + * Such a mapping is one established by a simple mmap() or brk() with no driver
> > + * or other kernel component involved.
> > + *
> > + * They are rmappable, and core mm services rmap operations including reclaim,
> > + * as well as population, CoW and merge/split (if eligible).
>
> I assume ->fault returning some kernel allocations (VM_DONTEXPAND set but none
> of the others) will currently contradict to that. But hopefully we'll clean that
> up in the future (or improve the documentation to cover them as well).

They really shouldn't be, but that's one for the future I guess. I hate that we
allowed ->fault to be that 'flexible'.

VM_DONTEXPAND is already a weird case that needs rethinking/renaming I think
anyway.

>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>

Thanks!

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
