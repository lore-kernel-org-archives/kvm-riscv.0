Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1B39CA5FE3
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 09:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P/Acmo+3s7sQu9dUiRiG2VV/Jey/xooaINS8bOh8Jjc=; b=3eJPzNXniIJUcu
	TIqrLd2c25Xq+BFPRW9/5aRvwM4IZA7RoyXAJJcZd03tStSXXyBje3NRjw7pYC76K31UfOjKCbFTV
	8UNyAczgFu8f18Dln4BKt1OER/T7Px9O2ULWK0SoF3N1QdlVwG1HYGLys/1o5WxQd74XjGD/uSvUE
	648iMlp0jHY+6xVOlkYPJsQJ/R642csVT1qgrqGwt1K8eUl/140bLxmg5zvmXHehe8aZSqvWBDcy9
	LnUcW722YFozT0yMrsfojI8OEVuVtjhjC8iyFkCCipr20Vx3l0mDsMs3rtWWUxnaCSfiF03nJtin3
	Me84svfRYX9cw99EukPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvf1-0000000DETg-0aM9;
	Sat, 03 Oct 2026 09:04:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCvf0-0000000DETS-0pA2;
	Sat, 03 Oct 2026 09:04:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CCD4343B0C;
	Sat,  3 Oct 2026 09:04:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767B81F0089B;
	Sat,  3 Oct 2026 09:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791018241;
	bh=NITJ8yWQ1OUFlY+k5bUccAdy4sUgfCl1c+vQ6EKuHAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UU+loouHu/X9/2nGZUM3yCjbj4m/KC/TpyT2T7f6ukoZ0E8xdeCQhCux5NhqFywrK
	 emhXMJF4ztWEAjcQUfNwmoOfmxWibJrgcS0Y14+/3QYIKiQ5kMD+QrEiMuTQiog1N8
	 HdzT/Ef9+BC0kDIPVp13fKjpTa3KnJQlYUuTeVVgi+gEshYQcDbogRYzy1bU/u88qg
	 37uls/VRrrDFxVnS7En+EP+D0EmvYFVAJfg454GL12+afZ6I3k3lu7HdNKAXHgZG9u
	 cVstBTuY/reLAY7kfSL/oJgi0aXYVR8zFlCr4BXzJpC7jM5kV2qrlq5ymtar6nRky1
	 2H6/ZXoDRdmXg==
Date: Sat, 3 Oct 2026 10:03:31 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 15/40] mm/vma: add vma[_flags]_is_kernel_owned()
 predicates
Message-ID: <asDDLXqBduWVX0k8@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-15-4583d8a23bca@kernel.org>
 <0623ee06-00e5-421e-a24a-ed605abb559b@kernel.org>
 <ar_CYfkR5Pfb7J9b@gremlin>
 <83bf4650-7339-4fc9-89a6-378a327f4f6e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <83bf4650-7339-4fc9-89a6-378a327f4f6e@kernel.org>
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

On Fri, Oct 02, 2026 at 11:19:32PM +0200, David Hildenbrand (Arm) wrote:

> > So indeed, vs. user-owned.
>
> Right, I read "contents of the VMA are owned by the kernel rather than the core
> mm?" and that confused me, because the opposite of the kernel is to me not core-mm.
>
> Maybe it would be clearer to focus on the opposite direction, then we wouldn't
> have to find a word to describe "not core-mm".

Yeah, it is hard to know how to express that.

> > I think the issue here is you're confusing this with other things like the
> > rmap and refcounting, etc.
>
> I think it all weirdly interacts.
>
> In !vma_is_kernel_owned(), would we only expect ordinary folios
> (anon/pagecache/hugetlb/dax, maybe shared zero folio)?
>
> That's my best guess looking at
>
> 	return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT,
> 				  VMA_IO_BIT);
>
> So one option would be to focus instead on that aspect (folios that are managed
> by core-mm vs. random other stuff not managed by core-mm). But thinking about
> it, I'd prefer if we can leave the "folio" bits out, because COW mappings also
> map (some) folios. See below.

Mostly it does indeed come down to 'can I rely on core mm to do the refcounting,
mapcounting, rmap, etc.'

But folios are not quite there yet until the memdesc stuff is done as you say,
so best to leave that out of any description.

> > VDSO/VVAR, perf ring buffers, shmem mapped via PFN map, uprobes, etc. are
> > all in this category and I doubt people would consider those driver-owned.
>
> Agreed. They are all special things and won't be folios in the future. (shmem
> mapped through PFN tells us to ignore its folio background and treat it just as
> some PFN range).

Yep the shmem mapped via pfnmap is a special case of the 'hands off the folios'
variety.

> > The distinction is - who put them there and who's allowed to change them
> > and who owns the lifecycle.
>
> Lol, I asked AI for better names and it told me "vma_is_special_mapping()".
> Thanks, I guess.

Yeah you see my point? :)

That's why I want to steer away from ordinary vs. 'not ordinary' (otherwise
known as special).

The semantics have to be meaningful more than that.

>
> I assume for the reverse, we really just want to say "just an ordinary core-mm
> vma that you would get from a simple mmap() as long as no weird non-mm drivers
> or subsystems are involved. Core MM fully manages this thing.".
>
> * vma_is_mm_managed()
> * vma_is_mm_controlled()

OK, great, that works!

I think vma_is_mm_managed() works best out of those two.

I'll update v4 to reflect that, I plan to send the respin out today before
LPC :)

> >>> diff --git a/include/linux/mm.h b/include/linux/mm.h
> >>> index 2a92193ac6a5..cab29d6e15c1 100644
> >>> --- a/include/linux/mm.h
> >>> +++ b/include/linux/mm.h

> >>> +static inline bool vma_flags_is_kernel_owned(const vma_flags_t *flags)
> >>> +{
> >>> +	return vma_flags_test_any(flags, VMA_PFNMAP_BIT, VMA_MIXEDMAP_BIT,
> >>> +				  VMA_IO_BIT);
> >>
> >> I thought we have cases where we drivers insert pages and neither set
> >> VMA_PFNMAP_BIT nor VMA_MIXEDMAP_BIT.
> >
> > There were 4 - defio, cmt_speech, uprobes and the bpf arena, and I fixed
> > all of them :)
>
> Great, that helps to identify these things. I didn't look at all patches yet,
> but we should definitely document that.

You mean the fact that this is required? It's documented certainly insofar that
this series makes it a literal WARN_ON() error to do that ;)

I'm not sure exactly where you'd document it in the kernel documentation though.

But having this enforced now as a strict requirement is very powerful, because
it means core mm can assume things that before it couldn't due to drivers doing
'weird stuff'.

Which I think has been a large part of the problem with the VMA flags - not
being certain that VM_xxx means y because hey I remember that driver z does
weird stuff with it suddenly means the flag doesn't have a clear meaning any
more.

So this I think is a very useful step to take.

>
> >
> > Other than the DAX-only case below of course.
>
> Right, as DAX uses real folios.

Yup. And FUSE DAX now too :) Another 'weird byproduct of this series' that :P

> > I could also add a patch to this series to do that too if you wanted?
>
> We can do a follow up. Not giving others the chance to abuse these interfaces
> would be great.

OK cool, will add to todo!

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
