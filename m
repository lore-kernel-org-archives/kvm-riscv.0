Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97144C4450B
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 17:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YA8paG6RbM5jpQXsitrWoOW3W64cQZown95xXEJwycg=; b=xWIydY/i+JOQfo
	Yx6J3E6cxv2ituF2j227Qdjrv1t60Tw5QnBOzJ4fcBTdPXonthNdIaAlTQ/0WIC8dYwwij+0oP5QC
	J3PObfdO/LlTlq3ct+7P/BNV+1CsZv7/e9wjgg3kF3NoTmtbz/3CqO5RgEykv+zVEB6G0NGb9xz+6
	7nHttUUKbKUdxr0BBncvqEATgwTvrMqLxMi7RhGz/2FyexLa6ydVZke++OR5jI5lB5FDxk3dR5+1T
	qyJ9pmD+7kuZ5S8kkFemDsh1O0YddWAbqm7ll3EeNNMFmg4rnl8bneQ7iwI0w/UJkzLDP9TCrD5OM
	VdlRPupoPAdQmvZ9VzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhPZ-0000000CpKY-0SOO;
	Tue, 14 Jul 2026 17:59:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjhPV-0000000CpJk-3tWM;
	Tue, 14 Jul 2026 17:59:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27E89339;
	Tue, 14 Jul 2026 10:59:06 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13F4F3F915;
	Tue, 14 Jul 2026 10:58:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784051950; bh=YLSO3cj4uznp59HTo6K3Y3qLIJ+ISsuvzTFqOw8DO8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sy24kfg6zd8pNJNRop/ip6vK3z44QuvSe+ei7yBDMgOJ+AmuCVqSqQsYm6AbuGoqC
	 lZJ+hB5IynonlF0Xd5xFhRT6j05I3fGK7eqV9iwp4S7UfNaW857WlXcvL4lT3vU6jA
	 Qslx6H13Q5aAiK/4ThVrFPZNAc560M7EpnY0APes=
Date: Tue, 14 Jul 2026 18:58:57 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Dave Hansen <dave.hansen@intel.com>,
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
Message-ID: <alZ44XdgTEVFX6jU@e129823.arm.com>
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com>
 <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com>
 <alZo9feSrSB_StfO@e129823.arm.com>
 <7cff02d6-d3ce-4315-b667-34911fc6f321@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7cff02d6-d3ce-4315-b667-34911fc6f321@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_105914_161350_B2AB2C5B 
X-CRM114-Status: GOOD (  22.46  )
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

On Tue, Jul 14, 2026 at 07:29:38PM +0200, David Hildenbrand (Arm) wrote:
> On 7/14/26 18:51, Yeoreum Yun wrote:
> > On Tue, Jul 14, 2026 at 05:08:24PM +0100, Yeoreum Yun wrote:
> >> On Tue, Jul 14, 2026 at 07:35:19AM -0700, Dave Hansen wrote:
> >>>
> >>> This is indeed an improvement and a step in the right direction! Thanks
> >>> for looking at this.
> >>>
> >>> But one of my test for whether it's good x86 code is whether there's any
> >>> actually x86-specific logic in it. Isn't this basically a translation
> >>> between the integer level number and whether it is folded?
> >>>
> >>> That seems like a common helper that more than one arch could use. Could
> >>> this be stuck in a helper so that all arch/x86 has to do is:
> >>>
> >>> 	if (mm_pt_level_folded(mm, level))
> >>> 		return;
> >>
> >> Yes. at least the level semantic in ptdump (pgd is level 0,
> >> p4d is level 1, ...) is same to all archs where use ptdump.
> >> So It seems reasonable to add this common helper in ptdump.c
> >>
> > 
> > Furthermore, the effective_prot() need to require to identify whether
> > it's the first pgtable to prevent the inheriting from dummy value.
> > So I think it seems to make a ptdump_pt_level_first() like:
> > 
> > diff --git a/mm/ptdump.c b/mm/ptdump.c
> > index 973020000096c..2ec5700e4be5e 100644
> > --- a/mm/ptdump.c
> > +++ b/mm/ptdump.c
> > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> >         st->note_page_flush(st);
> >  }
> > 
> > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > +{
> > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > +               return false;
> 
> Do we actually ever get !mm ?

Yes. for the case of s390 use mm anyway for folded check.
> 
> -- 
> Cheers,
> 
> David

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
