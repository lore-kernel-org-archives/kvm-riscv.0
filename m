Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1DC7C98328
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Sep 2026 09:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xEbyYmcM04iSp8tY/hCKhorA8xcwKbmhBSmPrLYhAEU=; b=Mg3U7EBW7/figh
	PFwhsXdh7kvybLmj3vnsL1OaW44VD5Brpy27A6Cj20/FOqcGRd5AW5877YcNhdypesT64GVT+X9pV
	CRkmzzj79yycrViUbFmKIbb+/emevWUc27w2Jjk6XVvJwALKr2fMw5zU/3iDg2I53TuAdFynwPOSG
	baNwpTnQZ815IfBd6DnykmcS8sZ8ZD0UrZe+G2ePDAadBRfJ7LQtEDnrgkrg7mSjVfXQsQ/LoEEW5
	9Xo+hZoThdsy+D+tbbHw4BgBzbHJH3jRsgKHFCyROVn3zpLJCfTdKhjaZydmayL3m2hlnYAQmZKGd
	ZkoAVkWdNyLXTczweAVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOuJ-0000000FE6K-1s6V;
	Sat, 26 Sep 2026 09:41:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAOuI-0000000FE61-2vMS;
	Sat, 26 Sep 2026 09:41:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C08043E2E;
	Sat, 26 Sep 2026 09:41:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8C81F000FF;
	Sat, 26 Sep 2026 09:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790415681;
	bh=0u13dbBevDvvrKeztStjJV2PV5yx6LiZibgW9CGmgFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jp0AvcBc2qFPX1KUyqat5xOo7kolWDkC6C0w6P6DaUvXm5iSIG2CZI03JVCmdPvQ2
	 vFXKg46qQ6h6qbDwt9b4xtSV8aaaHLKGAB793g+poJ3xMYhkIZo7xqXL5RLvULfLUx
	 vltnCfE9F9DOd8HFLd4r2r4Sg0lUuE/yF336VcdgoJJtQs97NrE8ayt+3eU4eDKxGI
	 oItyuRRw3Cj0jyhydyYqR3Mm1CDYrci/+rQrHCVid7DDrx80EwRj+MiAUgyhESJ7FS
	 iOAhXbJnk5J5uDUKfyr1oX15QJ3wMcCu5lNOsTEzc+QVqHwaov8/ApQZu8GqGu9l4+
	 gmVl8+MdCcOZA==
Date: Sat, 26 Sep 2026 10:40:50 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, "David Hildenbrand (Red Hat)" <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, "Kirill A. Shutemov" <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, peterx <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S . Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, 
 Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev, Takashi Iwai <tiwai@suse.de>, Emil Tsalapatis <emil@etsalapatis.com>
Subject: Re: [PATCH v3 00/40] mm: make VMA flag semantics explicit, eliminate
 VM_SPECIAL
Message-ID: <areSEI5pWBadkqIe@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <d4d7d4c2-a1d5-41d0-b1c8-8ea0cc5a0397@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4d7d4c2-a1d5-41d0-b1c8-8ea0cc5a0397@app.fastmail.com>
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

On Sat, Sep 26, 2026 at 12:06:22AM +0200, Arnd Bergmann wrote:
> On Thu, Sep 17, 2026, at 18:22, Lorenzo Stoakes (ARM) wrote:
> >
> >  mm/vma.c                                   | 246 +++++++++++++++++++-------
>
> Hi Lorenzo,
>
> I see that in linux-next there is a new build failure in some
> configurations in code that you are changing here:

Thanks for the report!

>
> mm/vma.c: In function '__mmap_region':
> mm/vma.c:3083:1: error: the frame size of 1552 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
>
> I don't immediately see anything that you did that would have introduced
> something bad that wasn't already there, so it's likely just gone from
> just below the limit I was using for my testing to just above. The 1536
> byte limit is what I use on 64-bit builds with KASAN and otherwise
> still has a clean build (with a small number of local fixup patches).

Hmm are you specifying this limit manually somehow?

>
> What I see is that this function has multiple structures on the
> stack that have nontrivial sizes:
>
>         VMA_ITERATOR(vmi, mm, addr); /* 104 bytes */
>         MMAP_STATE(map, mm, &vmi, addr, len,...); /* 384 bytes */
>         struct vm_area_desc desc; /* 128 bytes */
>
> The config that caused this is https://pastebin.com/raw/5M95qHy5,
> which is an x86-64 build with CONFIG_KASAN_STACK enabled, and likely
> a few other configuration options that made it a little worse.
> KASAN_STACK tends to double the stack size used by structures
> in order to catch out-of-bounds accesses.

Yeah, there is a lot on the stack admittedly but there is also a lot of state
being used. I'm sure we can reduce it.

>
> If I sprinkle some 'noinline_for_stack' annotations on functions
> called by __mmap_region(), I can get the size down to 1144 in this
> config, but that doesn't sound like a great workaround.
>
> The large stack usage is potentially harmful if this ends up
> in call chains that have additional large stack usage (e.g.
> kmalloc() leading to reclaim). Any ideas for how to reduce it here?

That can never happen :) this call chain is _only_ for an mmap() call.

>
>      Arnd

In general I am absolutely taking this seriously and will find a way to
reduce this, but my only question is whether this is actually something
that needs to be done in this series?

Because it's already huge and I would rather avoid adding yet another patch
to it if possible.

If I can do it as a follow-up that'd be ideal!

Thanks!

--
Cheers, Lorenzo

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
