Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD447C9830E
	for <kvm-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 09:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9KEdoqF8+9VikJqm8U6PV1xnfoYTJEj58O75eF8nDIc=; b=GVNapftsQQBI6i
	encesCSTuVtqFEtV+nlmY8q9zaQO7lhC6hHru+1c7CURQko5bdgyF1c6oWa6lQs0Ds2DZOWWD25Zs
	TQvNMUt56YeHoWXXdNdY6EurRA+D54v+sE7qFtomLT4S+BiPqMeE+6br+phNgsKSXAD8R4W1B/Qab
	GUT/XJip+eYjWOMLll1LjCKKWwhgdeJPVKTUtdlhJEegePxlV1TDtNkssJGYEm0HgSiP6Qf6jVvzK
	nYxcZa1/rxYG1HSYPmzmuUuJAICARyG239mPIsvCzEtjBby5DdY3cd4D09p0hp+jgtoIKxKJJaH3d
	W/EQQSFRhMsd9R6smoyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2eV-0000000D46e-1wDy;
	Fri, 25 Sep 2026 09:55:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA2eT-0000000D45s-1vV3;
	Fri, 25 Sep 2026 09:55:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE0F340AC5;
	Fri, 25 Sep 2026 09:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C76A1F000FF;
	Fri, 25 Sep 2026 09:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790330132;
	bh=wHcL5jPNS47s6Ul8XnEo1uFsA8Y0TKv8vyd/Iuc4jW8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HxJQcEvnuhUOHH3Z6mzmWye1CE1PjDtpVrPBVFbcNDGyG6yBkjOShg1wXTRxmQKyc
	 TCJMHEkTxA8Sxw4HyLR7LdXQhRJb+9udY3QgV8ET7cug6AZBPLxgIFx/TdmYGQ8bVU
	 ptEgwP56FVQ2pJrDbYSWaP8xyRORQKPPWrshPWAAjxwWnAwT2YIoJgfyo9wv4EO7c3
	 7ozDd+omlnSWJmwSq3s1563JOKXMeNxa13jAxu5Ee20miDdmPGzcEIeZWGgnBBy5y6
	 eWzAFHQy56s+qgvvgTG8xUGQUmf5tQzyaZcP9CgdenUpWl9R2UycwCgDON1sf75KvU
	 KkanjhxFaUGcw==
Date: Fri, 25 Sep 2026 10:55:01 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, Doug Gilbert <dgilbert@interlog.com>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>, Jaya Kumar <jayalk@intworks.biz>, Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>, Sebastian Reichel <sre@kernel.org>, John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rik van Riel <riel@surriel.com>, Harry Yoo <harry@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Will Deacon <will@kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nick Piggin <npiggin@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, "David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>, Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, Baoquan He <baoquan.he@linux.dev>, Youngjun Park <youngjun.park@lge.com>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Chengming Zhou <chengming.zhou@linux.dev>, Michal Hocko <mhocko@kernel.org>, Miklos Szeredi <miklos@szeredi.hu>, Xu Xin <xu.xin@linux.dev>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-usb@vger.kernel.org, linux-rdma@vger.kernel.org, selinux@vger.kernel.org, linux-sound@vger.kernel.org, bpf@vger.kernel.org, linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, sparclinux@vger.kernel.org, fuse-devel@lists.linux.dev
Subject: Re: [PATCH v3 05/40] mm/vma: ensure mmap_prepare doesn't set actions
 on a mergeable vma
Message-ID: <arZE4aXD0yIbXVFU@gremlin>
References: <20260917-b4-mmap-prepare-vma-flag-sanify-v3-0-4583d8a23bca@kernel.org>
 <20260917-b4-mmap-prepare-vma-flag-sanify-v3-5-4583d8a23bca@kernel.org>
 <DLNSM8R8JS9A.1850RMXAG9NSR@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DLNSM8R8JS9A.1850RMXAG9NSR@nvidia.com>
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

On Thu, Sep 24, 2026 at 03:28:10PM -0400, Zi Yan wrote:
> On Thu Sep 17, 2026 at 12:22 PM EDT, Lorenzo Stoakes (ARM) wrote:
> > When a user requests an mmap_action be performed in mmap_prepare, this
> > involves populating the VMA range with data.
> >
> > However, if the VMA is mergeable, it might then mistakenly be merged with
> > another VMA without having populated the range.
> >
> > Every mmap action currently available sets VMA flags such that the VMA
> > cannot be merged.
> >
> > However, to ensure that no future mmap action falls foul of this, assert
> > that this is the case upon mmap_prepare validation.
> >
> > Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> > ---
> >  mm/vma.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/mm/vma.c b/mm/vma.c
> > index d6ed10cefc8f..62f2ce1ad5a1 100644
> > --- a/mm/vma.c
> > +++ b/mm/vma.c
> > @@ -2809,6 +2809,15 @@ static int mmap_validate(unsigned long prev_start, unsigned long prev_end,
> >  int mmap_prepare_validate(const struct vm_area_desc *prev_desc,
> >  			  const struct vm_area_desc *desc)
> >  {
> > +	/*
> > +	 * It is not valid to execute mmap actions for VMAs which can be merged,
>
> Is it better to say "for VMAs ... after mmap_action_prepare()"? When I
> first read this, I wonder why the check is done after
> mmap_action_prepare(), which does some work based on action.type. Then,
> I realize mmap_action_prepare() changes desc->vma_flags and affect its
> mergeablitiy.

Ack, good point will update!

>
> > +	 * as any such merge would leave portions of the mapping incorrectly
> > +	 * unmapped.
> > +	 */
> > +	if (vma_flags_can_merge(&desc->vma_flags) &&
> > +	    WARN_ON_ONCE(desc->action.type != MMAP_NOTHING))
> > +		return -EINVAL;
> > +
> >  	return mmap_validate(prev_desc->start, prev_desc->end,
> >  			     desc->start, desc->end,
> >  			     &prev_desc->vma_flags, &desc->vma_flags);
>
>
> Otherwise, LGTM.
>
> Reviewed-by: Zi Yan <ziy@nvidia.com>

Thanks!

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
