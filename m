Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0979CC44501
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 07:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XAhByPras0gy/SP7U/1O+rlW1mJfygQFRpvny0ddrCc=; b=Zrmf6nenW2xxHf
	vN6qZExbAsnrgf9DVlHhzbptcgDWFuKiAoU7vAq55HCHX/Q3HDrJSVIYWiqDMR/70c4Vnx3W93zqw
	bIanwakid8MQspwNsvdgJrNjPCb1ZHKrTjbrbwte8LqvUCF+L7555izw4SZ+fxoPMG8C4svixuocB
	pYizMJDbb8ZrzRAbqZo+eQ+eby3RevC9NuBHwyNpu818YjS81N+Hxmlps9IfDf2zOfdgVZ0JgXqzC
	FKLbhTPZXBMhkOVEO9dZDQHNzLx5kDWOJzQkscQX3pwdGjBs2JmlNr3OztqeDHWxIbyew84KuWDPW
	KevMKL0/fkoKouIouq+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGr8-0000000Ggvm-3KrH;
	Thu, 16 Jul 2026 07:50:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkGr5-0000000Gguu-1KwI;
	Thu, 16 Jul 2026 07:50:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7269C168F;
	Thu, 16 Jul 2026 00:49:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4FEE73F905;
	Thu, 16 Jul 2026 00:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784188199; bh=SezQaQ3kr0/h0JyFQ0VLykJSkvx0NJJphcsYvOpsEN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gQRl7YUQCBVoiNIinaXRRJ6iLdSG3Rzd0xV0hEu2lGo5w6z86vYyNhkSIYX9L3nd9
	 q4q4/O6JNDXm4XNPNif4MOp4E6vcDqWFBACswg6z3701KGFgiJeJvUAoj008c2kew8
	 5BJk9bAjoi8xDDesBwIO6jPMcRzOrdrOp8BTmyaQ=
Date: Thu, 16 Jul 2026 08:49:47 +0100
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
Message-ID: <aliNG7OGphxzH7Wr@e129823.arm.com>
References: <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com>
 <6df814c9-405c-48d8-96ea-929c4b28949b@intel.com>
 <alZe-Cu7yQw9qRXU@e129823.arm.com>
 <alZo9feSrSB_StfO@e129823.arm.com>
 <CAMuHMdUqL=vJFAzYgcRVNbD_VWWwhehwTuhTfwLt_yRR8c+B0g@mail.gmail.com>
 <aldV23PwIXnFloaN@e129823.arm.com>
 <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdVOHm6MmP9QsNVvxLsGp1e0jC9u9RGb6+xee0ZBs4Zwfw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_005003_529079_B313CC8F 
X-CRM114-Status: GOOD (  15.69  )
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

On Wed, Jul 15, 2026 at 12:34:29PM +0200, Geert Uytterhoeven wrote:
> Hi Yeoreum,
> 
> On Wed, 15 Jul 2026 at 11:42, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > On Tue, 14 Jul 2026 at 18:51, Yeoreum Yun <yeoreum.yun@arm.com> wrote:
> > > > --- a/mm/ptdump.c
> > > > +++ b/mm/ptdump.c
> > > > @@ -190,6 +190,23 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> > > >         st->note_page_flush(st);
> > > >  }
> > > >
> > > > +bool pdtump_pt_level_first(struct mm_struct *mm, int level)
> > > > +{
> > > > +       if (!mm || level > CONFIG_PGTABLE_LEVELS)
> > > > +               return false;
> > > > +
> > > > +       if (mm_pmd_folded(mm) && level == 3)
> > > > +               return true;
> > > > +       if (mm_pud_folded(mm) && level == 2)
> > > > +               return true;
> > > > +       if (mm_p4d_folded(mm) && level == 1)
> > > > +               return true;
> > >
> > > Is this order (... && level == ...) the optimal order?
> > > On arm64, mm_pud_folded() and mm_p4d_folded() perform several checks.
> > >
> > > > +       if (level == 0)
> > > > +               return true;
> > > > +
> > > > +       return false;
> > > > +}
> >
> > It is. since the purpose of ptdump_pt_level_first is designed to be used
> > in the *callback* of pXd_entry(). IOW, if we check level 0 first,
> > it always returns wrong return in folded case.
> 
> I meant the order inside the if () conditions.
> E.g.
> "if (mm_pud_folded(mm) && level == 2)" does the expensive check first.
> "if (level == 2 && mm_pud_folded(mm))" does the cheap check first.

Ah. Yeap that would be better. Thanks!

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
