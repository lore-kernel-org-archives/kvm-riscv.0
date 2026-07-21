Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63137C4452D
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 17:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y5yqlNd3+4X5l5zjHXLn/HtObZTrCS79IE64uYFlyGs=; b=HKxo4rQ7YPIS4B
	v7FWIEFIx6HTyACYwonGUTaj34wwwqr+eRWjnxUgUcbc6xBc/7TZD9UNTM72OZ4lwa/dOmiy2cgK2
	ODKZfABE7pGMnMHmiw3EoxWbb+E7ZP2BdB1Gdo2IpF0/rwQRazgMf0FOAzCfzo3JA87YLJf/Xo4mh
	nMC0zyT0G7UpQ2wPHUX7bvI/mVd3nhQVQgduRX9ZMY1sT9RcSJ6YZ7HB3ZiLR6ntjqOlZnIdf5dF1
	0oGRi8v3/cgKwXNcf3qglYUZOLdXVpy25yMQFFaxMfBeP6bPiSJnw1I3XE3fPO3D3xspxFQor5irq
	Iz0xsyGNthxdKFP1s/qA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEXB-0000000A5H3-2S06;
	Tue, 21 Jul 2026 17:45:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmEX9-0000000A5GZ-0Khl;
	Tue, 21 Jul 2026 17:45:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD47A1AC1;
	Tue, 21 Jul 2026 10:45:27 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 873643F58B;
	Tue, 21 Jul 2026 10:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784655931; bh=hrYivZRwvgo4Jln4t+vd90e0saYnNKOsQL0oUJ6U/zA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YcdJ0SMkJGlBA6zcU5v7DCrlzSEWCTP6ZWedBSSkSSjm8uzBucCY02WFFlppbTou0
	 7Vtk7Wne8hYcoyIusG8mtsWATS11C/0DiJBcsPsfedbFHDz9wkKju5sMGuQL/9I8hl
	 uF20WzjU/fp1spnK9FfiincvEjVknHZCmFNVhFQs=
Date: Tue, 21 Jul 2026 18:45:17 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Dave Hansen <dave.hansen@intel.com>, Yeoreum Yun <yeoreum.yun@arm.com>,
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
Message-ID: <al-wLXp0tAv7hNv-@e129823.arm.com>
References: <ac365196-8ccc-4d8b-83d7-28fec763e75c@kernel.org>
 <710b7eb0-8e0c-4f07-991c-2285c77e1beb@intel.com>
 <6007625e-c3f9-4ad6-99a8-61396bccbcec@kernel.org>
 <32d459d1-ad19-4baf-bbb1-0565458001d2@intel.com>
 <3ea30f8a-bb29-4bf5-8400-1c4840d46a88@kernel.org>
 <7e84b200-25eb-43a6-b5e2-5f27f2d82a77@intel.com>
 <31988089-095a-4eed-b5e2-c677c70f79f6@kernel.org>
 <14e250db-1641-4085-8d13-02f819657d5f@intel.com>
 <d83c76b3-ea4d-4c41-b4c5-f5ae558ace55@kernel.org>
 <alYgMxKqRnF6_X0A@e129823.arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <alYgMxKqRnF6_X0A@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_104535_208163_8A7B1816 
X-CRM114-Status: GOOD (  31.15  )
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

Hi,

> > On 7/13/26 23:40, Dave Hansen wrote:
> > > On 7/13/26 14:17, David Hildenbrand (Arm) wrote:
> > >>> To me, the double READ_ONCE() is a non-issue.
> > >> To other arch maintainers, it is!
> > > 
> > > Ahh, so it seems like Christophe in ppc32 land was looking at this more
> > > like a regression that needed to get fixed.
> > 
> > Yes, exactly. :)
> > 
> > And I agree that it is something we should be optimizing.
> > 
> > > 
> > > Christophe, just out of curiosity, was this something that was causing
> > > you practical problems like measurable performance regressions, or was
> > > it really just insane code generation that seems unacceptably suboptimal?
> > 
> > I'd be curious about that as well. I mean, looking at the generated code
> > it's clear that it is suboptimal.
> > 
> > 
> > The solution space I see:
> > 
> > 
> > (1) Pass the result from e.g., pgdp_get() into p4d_get(), so it can just return 
> >     the value with folded p4ds.
> > 
> > That requires extreme amounts of churn in core-mm AFAIKS, so I don't see that as feasible.
> > 
> > 
> > (2) Rewrite folding code to make p4d_present() be a dummy instead of 
> >     pgd_present(), and make p4dp_get() return a dummy value.
> > 
> > ... a lot of churn across architectures. I'm sure we'll learn soon why it was done 
> > ike the way it is today in the first place. Something interesting to look at,
> > certainly, but a bit of a stretch just to optimize reads.
> > 
> > 
> > (3) Make folded pgdp_get() use an ordinary read instead of a READ_ONCE / dummy.
> > 
> > I don't like that, because we couldn't catch easily if the value is then
> > actually used some old/new code.
> > 
> > If pgd_present() etc are supposed to ignore the value, I'd rather have a mechanism
> > that enforces that the values are actually ignore in pgd_offset() etc as well.
> > 
> > 
> > (4) What we do in this series, but instead of forbidding set_pgd(), make it only 
> >     complain when we are passing in a dummy value.
> > 
> > The expectation is that it would avoid touching most architecture code in patch
> > 12 -> 27 and still prevent mistakes in the future.
> > 
> > @Yeoreum can you play with that and see what the end result would be?

If there's no comment anymore for (4), Could I post next version on tomorrow?

Thanks.

[...]

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
