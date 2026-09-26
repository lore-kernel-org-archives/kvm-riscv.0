Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51EA9C98318
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 10:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BL8dUdYxXum94QbXRYyb3Q9nvuxr6hxPFQKcXTUJRUg=; b=x2A/vzarn06bDl
	Uko4jcpCveQlrL1NorUjZWiDVtQPSBNsARYkyvKIkcP6Kt1pWkHZ7FGzioqXYg8cDKkj5qro82dV5
	kJewWCJCYvkkEEHnL4S5vpKZ1UaLnKD3dX1fSgw4avUEZTFNPz/+2g7Jo9aXLeGDPyAE2Vd9cKNJy
	fZSosYuFtxBVVg9jG3U0On/P3IIY7z3fVTPK0rUjLM9byQqnl5bNPckbiKO+ARBiyE+FO5dp+9tMA
	B6FKa+B80xylG+xIncms0Ur23W7Z0+pazoiH2wudjOSthyW2n7Rrh5DLxKjBLwji8HBR7DGFpz8UP
	fnChMlzqTCW8ATmXCALQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPJF-0000000FFYK-41MQ;
	Sat, 26 Sep 2026 10:07:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAPJE-0000000FFY7-2JJC;
	Sat, 26 Sep 2026 10:07:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BC0FD429E4;
	Sat, 26 Sep 2026 10:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8511F000FF;
	Sat, 26 Sep 2026 10:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790417227;
	bh=cx2CIfJJRJI8nlg/LkJLWm6mTZk+oyqA+tLDKMt8K64=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PP6PZ9bMZs7e/duxeo/+vo5CsbMP1Rz2+y31gRT9a+0I5x57hx+X0qV3VH6ZT4U4G
	 yJbOFXBGKOb0K1/wzI/4ZVK66vC39At0uE2uwbtQ83oA2SlyEAWclRJagc3OIbbqHm
	 aGWgANkkLmApMwDJ2U+Pphh/en/LxpO06qIoOaCTuD43Ohhox87eyXx7fdho5yNs5A
	 YUbNxgBjyK8Pa4hT+QXLxoaUyk9M5Ul4my8apPo6NoSv0IFMgCIjYXvQDeUqZfUlWm
	 gpsK8pBYkPTzDaunC56zp3EElzUI0dA/SJCNUEjE1vnEPzCd1n7uEW6cQm5qDqJMYE
	 NMKaLYXBxLBUQ==
Date: Sat, 26 Sep 2026 11:06:35 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 16/40] mm/vma: only allow mmap to clear
 VMA_MAYWRITE_BIT if kernel-owned
Message-ID: <areYqRfd7mss9KQG@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-16-4583d8a23bca@kernel.org>
 <DLOVQMACWLZ5.1WFOTGRG8ZG92@nvidia.com>
 <DLOVXY4VFCXE.1RI7ZSD30VHH5@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLOVXY4VFCXE.1RI7ZSD30VHH5@nvidia.com>
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

On Fri, Sep 25, 2026 at 10:17:10PM -0400, Zi Yan wrote:
> On Fri Sep 25, 2026 at 10:07 PM EDT, Zi Yan wrote:
> > On Thu Sep 17, 2026 at 12:22 PM EDT, Lorenzo Stoakes (ARM) wrote:
> >> For ordinary files the only way the VMA_MAYWRITE_BIT flag is cleared is if
> >> the underlying file is itself read-only.
> >>
> >> This means that mprotect() cannot mark a shared mapping of a read-only file
> >> as read/write, as doing so would violate the read only attribute, and
> >> permit writes.
> >>
> >> In general, we do not want file systems to be able to do this for
> >> read/write files.
> >>
> >> Doing so would violate fundamental user expectation of file attributes and
> >> likely break userspace.
> >>
> >> However, drivers pose a tricky problem here - the /dev/xxx file may be
> >> read/write but provide access to a resource which is fundamentally
> >> read-only.
> >>
> >> Therefore we must allow drivers to be able to clear VMA_MAYWRITE_BIT.
>
> IIUC, a file's FMODE_* bear both fd and mmap permissions, e.g.,
> FMODE_WRITE means fd is writable and mmap is writable. At least for
> normal files. But a driver fd might not fit the same pattern. Would a
> new FMODE_MAP_READ and a new FMODE_MAP_WRITE help? Not trying to propose
> anything, but just thinking out load.

Hmm I don't think that's necessarily at the right level of abstraction
though, and these drivers need to do the same thing even if the file is R/W
regardless.

So I'm not so sure that's the right path.

Then again, if the driver could somehow specify these modes at inode
creation or some means of doing that it could help avoid the driver ever
doing this, I'd really prefer us to disallow such changes in the hook in
general.

But I think definitely one for a follow up :)

>
> >>
> >> To achieve both of these things, restrict this ability to kernel-owned
> >> mappings as identified by vma_flags_is_kernel_owned().
> >>
> >> This constrains this ability to drivers which own the mapping's contents,
> >> whether memory-mapped I/O, kernel-allocated pages, or ordinary pages they
> >> map themselves, and so define its semantics.
> >>
> >> Every in-tree mmap hook which clears VMA_MAYWRITE_BIT, some twenty sites
> >> across drivers, filesystems and bpf, establishes a kernel-owned mapping,
> >> with usbmon and the ALSA PCM status page converted earlier in this series
> >> to do so.
> >>
> >> Note that drivers may, if they do not gate on VMA_SHARED_BIT, be able to
> >> disable MAP_PRIVATE-file-backed mapping CoW semantics.
> >>
> >> This is perhaps not always intended, but we retain this capacity to
> >> maintain existing behaviour.
> >>
> >> As all drivers which clear VMA_MAYWRITE_BIT establish kernel-owned
> >> mappings, no functional change is intended.
> >>
> >> Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >> ---
> >>  mm/vma.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >
> > Makes sense.
> >
> > Acked-by: Zi Yan <ziy@nvidia.com>

Thanks!

>
>
>
>
> --
> Best Regards,
> Yan, Zi
>

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
