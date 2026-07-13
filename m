Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14EDBC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 15:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SA2L2JdC6uN9eoPDaUmJ+15dXp/6o9d+99vGqwFnWDE=; b=zPxLdGJgGfTYyv
	XWshQ4g4s1xwHm/YVHr+n/075/yHDqiGdc4RVQZ9jIE6Kbxa4ONBVsCoZS+I5b6ltdZm2ordR7pgl
	axOu2HhDtywdwlgloEbKxCOf8r7BGZE9J2spf5qFfpEegveJNo4Lf8qwm6utIYgztIDPJBcA1DdVl
	TxkSU/51c4CFLa4XxAlKkIax57M6kQ2mtOpimOyacEdT+Zp2B2bD5cJM5TGE3Aa5xoAh+v4Cg5XyY
	nLUGwmjS6zF51XCl8ZGybXBBmJKqwWEPM6lKDfcWHKTxki7KXDgj1wYqBFW+xkImMwzF45K5DEk49
	nI6gwjf+8rimpzAYFarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIAM-00000009iAZ-109Y;
	Mon, 13 Jul 2026 15:01:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIAK-00000009iAD-3OWo;
	Mon, 13 Jul 2026 15:01:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=T9wlJNyXrR8GTVkkRjtiW/9U1+QEO/QSF6SVmBxc19k=; b=jGYTZyz9Cnp1ZUiXl+G7Kd8inn
	ToV8mm/lwp57izKmmtOEenoBUGIPwzigVaBKAj2alvc3nE4FO3Eq/9627SFQr6+s+ldGuaCVm7koo
	YVxP2VwjOlAAcwt23MmHJB9I56hQlVpGld/1LdKboIq8uJeykIlGVQfqbpR6LUdw53zHtnHka+gxy
	9xD/nboInH0DmaaTRFdhT5HI4fGGESWZGhVob34KwKqEmVvserNHKQCoQlE4oohAk4jIARUQh/im4
	nYBiLQtyqwiBuy5xklQA0VyN8HsofcwFN2nuMd98xlc7j9OfTHt3p9c6EOb+3djQcesbEGKkCL9cs
	mD8FYe/g==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIAG-0000000BkUK-1J0F;
	Mon, 13 Jul 2026 15:01:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A67B1576;
	Mon, 13 Jul 2026 08:01:42 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 161493F7B4;
	Mon, 13 Jul 2026 08:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783954906; bh=9w80m56EnZdV2ckCQq9WOh+dgxbLKrdljH3QH/Zl0XA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W5eOVh/zOqm17OUoBLtYwVfeD63WSFSCtTMrWpLtRFIn78Q4rc+1NKCnG4FVAdhdB
	 /ca8if0c03QwXj0RcqJO2zYZXUUTyt5Zzn3asCiVnRZHfwC3awBIneOdO0AiWLfqtf
	 i8rHL6kn8R+poGRr0mrVPUMuZFgH8TTvhOQBLcCk=
Date: Mon, 13 Jul 2026 16:01:31 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org, linux-arch@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	x86@kernel.org, linux-mm@kvack.org, kasan-dev@googlegroups.com,
	linux-csky@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-openrisc@vger.kernel.org, david@kernel.org,
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
Subject: Re: [RFC PATCH 19/34] x86: power: use proper set_pXd() for generic
 compile-time folded patable in resume_one_md_table_init()
Message-ID: <alT9y_JRznnBq8sQ@e129823.arm.com>
References: <20260713135614.1618183-1-yeoreum.yun@arm.com>
 <20260713135614.1618183-20-yeoreum.yun@arm.com>
 <595e5ba5-0bc4-4630-b8f0-8637298076ce@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <595e5ba5-0bc4-4630-b8f0-8637298076ce@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160148_701441_253D0A39 
X-CRM114-Status: GOOD (  22.68  )
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

> On 7/13/26 06:55, Yeoreum Yun wrote:
> > @@ -134,11 +129,12 @@ static inline void resume_init_first_level_page_table(pgd_t *pg_dir)
> >  {
> >  #ifdef CONFIG_X86_PAE
> >  	int i;
> > +	pud_t *pud = pud_offset(p4d_offset(pg_dir, 0), 0);
> >  
> >  	/* Init entries of the first-level page table to the zero page */
> >  	for (i = 0; i < PTRS_PER_PGD; i++)
> > -		set_pgd(pg_dir + i,
> > -			__pgd(__pa(empty_zero_page) | _PAGE_PRESENT));
> > +		set_pud(pud + i,
> > +			__pud(__pa(empty_zero_page) | _PAGE_PRESENT));
> >  #endif
> >  }
> 
> If this is the way forward, it's going to require the retraining of some
> awfully old brain cells.
> 
> It also doesn't really read correctly. Loop over each PGD entry:
> 
> 	for (i = 0; i < PTRS_PER_PGD; i++)
> 
> ... and set a pud?
> 
> 		set_pud(...)
> 
> I'm not sure how I'd ever learn the rules to write this code from
> scratch. Right now, the code says: "The pgd_t is the top level of the
> page tables. I know there are PTRS_PER_PGD of those top level entries
> entries I need to 'zero'."
> 
> You don't have to know what is folded, just that you're dealing with the
> top level.
> 
> But *this* code says:
> 
> 1. The pgd_t is the top level of the page tables. Start there.
> 2. "Walk" down *two* (folded) levels
> 3. Set the third-level (pud) entries to 'zero'
> 
> So the code now *has* to know how the folding occurs.
> 
> This seems really hard to work with to me.

Actually, This is what the patch series want.
IOW, the "code" need to consider the folded pgtable level and
use a proper APIs.

Might for the clarification, change a PTRS_PER_PGD to PTRS_PER_PUD
seems better. but the using set_pgd() seems much more worse since
second argument type is p4d_t which doesn't exist in the p4d folded case.

IOW, this patch wants to use proper API for the real first page table
level. for example, X86_PAE's pgtable level is 3 so not use pgd friends function
but use a pud to setup first page table entries.

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
