Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456C5C44507
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 09:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RGb1juSG5kWdK5jv5F38ktY7EBAixoN3VRyHwWMvpiw=; b=J5Fh5ZlQ00pJk9
	1YnkZ7Ef4NuP6BzUtywI+cpw69oav6sg0vpMedHd0qEDNcQIirMvdJDCNN0j7XTtaUwSt0Hm0geYt
	K4utzfjIS7kMi05Rl4sqcUmGrdyVs35aaTdyXgdv+9qrkVrLDy/XRwvAUxLjEmHVSzgNwxKTdATj+
	3e17FE4Py8e1f0gi8mw7mlSiKRE79Dkr7uRd4Ih4Qf864IjDzFwq4701ljNySUJSaX0H4AYDqUMj8
	GqcnAsY0xdrJXnRZwWgN2cZB7vahRETN8z+GcV7x81aU+NWSTCR6nXB41cAczgnggZbJA3MhYbJ5Q
	nhN+uV+Q7Sb/6brAAbYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw7x-0000000ELhK-3odh;
	Wed, 15 Jul 2026 09:42:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjw7t-0000000ELfa-2zWo;
	Wed, 15 Jul 2026 09:42:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E6C47153B;
	Wed, 15 Jul 2026 02:41:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C903F915;
	Wed, 15 Jul 2026 02:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784108519; bh=FTxhv/K9xHL17XVl29du51KO0/EQlL+ghCHZmx4gNaE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G0RUjlJz3owlWeTlpPV8u3FIp5RuBGK/3NB7wbcP+UXQAmCYCXmS34xYdScxVlpRC
	 0bRxrex7ATIWiVwavRFx8SXG/TT09iNUF63YzL6JCoJZGGx+GkRwGDdjMbNE7EKjBK
	 y4iGiJK1D0syrrUl+zvzYTCLcyhE/eREzIUSEcVU=
Date: Wed, 15 Jul 2026 10:41:47 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Dave Hansen <dave.hansen@intel.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
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
	shorne@gmail.com, jonas@southpole.se,
	stefan.kristiansson@saunalahti.fi
Subject: Re: [RFC PATCH 10/34] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <aldV23PwIXnFloaN@e129823.arm.com>
References: <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com>
 <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com>
 <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_024202_791701_7789A052 
X-CRM114-Status: GOOD (  30.55  )
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

Hi Geert,

> Hi Yeoreum,
> 
> On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > On Tue, Jul 14, 2026 at 05:08:24PM +0100, Yeoreum Yun wrote:
> > > On Tue, Jul 14, 2026 at 07:35:19AM -0700, Dave Hansen wrote:
> > > > On 7/14/26 04:40, Yeoreum Yun wrote:
> > > > > @@ -254,22 +255,8 @@ static void effective_prot(struct ptdump_state *pt_st, int level, u64 val)
> > > > >         struct pg_state *st = container_of(pt_st, struct pg_state, ptdump);
> > > > >         pgprotval_t prot = val & PTE_FLAGS_MASK;
> > > > >         pgprotval_t effective;
> > > > > -       bool first_level = false;
> > > > >
> > > > > -       /* Ignore folded levels ... */
> > > > > -       if (((level == 0) && mm_p4d_folded(st->mm)) ||
> > > > > -           ((level == 1) && mm_pud_folded(st->mm)) ||
> > > > > -           ((level == 2) && mm_pmd_folded(st->mm)))
> > > > > -               return;
> > > > > -
> > > > > -       /* ... and make the actual first level remember the protection. */
> > > > > -       if (((level == 0)) ||
> > > > > -           ((level == 1) && mm_p4d_folded(st->mm)) ||
> > > > > -           ((level == 2) && mm_pud_folded(st->mm)) ||
> > > > > -           ((level == 3) && mm_pmd_folded(st->mm)))
> > > > > -               first_level = true;
> > > > > -
> > > > > -       if (!first_level) {
> > > > > +       if (first_level > st->first_level) {
> > > > >                 pgprotval_t higher_prot = st->prot_levels[level - 1];
> > > > >
> > > > >                 effective = (higher_prot & prot & (_PAGE_USER | _PAGE_RW)) |
> > > > > @@ -471,6 +458,15 @@ bool ptdump_walk_pgd_level_core(struct seq_file *m,
> > > > >                 .seq            = m
> > > > >         };
> > > > >
> > > > > +       if (mm_pmd_folded (mm))
> > > > > +               st->first_level = 3;
> > > > > +       else if (mm_pud_folded (mm))
> > > > > +               st->first_level = 2;
> > > > > +       else if (mm_p4d_folded (mm))
> > > > > +               st->first_level = 1;
> > > > > +       else
> > > > > +               st->first_level = 0;
> > > > > +
> > > > >         ptdump_walk_pgd(&st.ptdump, mm, pgd);
> > > >
> > > > This is indeed an improvement and a step in the right direction! Thanks
> > > > for looking at this.
> > > >
> > > > But one of my test for whether it's good x86 code is whether there's any
> > > > actually x86-specific logic in it. Isn't this basically a translation
> > > > between the integer level number and whether it is folded?
> > > >
> > > > That seems like a common helper that more than one arch could use. Could
> > > > this be stuck in a helper so that all arch/x86 has to do is:
> > > >
> > > >     if (mm_pt_level_folded(mm, level))
> > > >             return;
> > >
> > > Yes. at least the level semantic in ptdump (pgd is level 0,
> > > p4d is level 1, ...) is same to all archs where use ptdump.
> > > So It seems reasonable to add this common helper in ptdump.c
> > >
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
> > +
> > +       if (mm_pmd_folded(mm) && level == 3)
> > +               return true;
> > +       if (mm_pud_folded(mm) && level == 2)
> > +               return true;
> > +       if (mm_p4d_folded(mm) && level == 1)
> > +               return true;
> 
> Is this order (... && level == ...) the optimal order?
> On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> 
> > +       if (level == 0)
> > +               return true;
> > +
> > +       return false;
> > +}

It is. since the purpose of ptdump_pt_level_first is designed to be used
in the *callback* of pXd_entry(). IOW, if we check level 0 first,
it always returns wrong return in folded case.


-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
