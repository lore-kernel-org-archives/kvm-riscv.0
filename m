Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F09CC4453C
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 17:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GtDgGdMDIJ/2beipBT6ctLnntkoCsAIc5yGVTfjfLA=; b=DwAZun/f7IGfaZ
	KAG/NdNbh63HvGzxh+LfzJjVg0G7+QcFKIk/JgcgiKxiXoptUJNaDAAGS+PzL3F/d2Aq+Vl7p9Q6S
	Rx8iptMO3VctyirHqbQ+df4O5sBdxnH0H+vTe3OYiXBo6TyU5q0AFXwAXAx14tgzyr24fAnBwHJEc
	u9NhYChGP1jHwqrBSW3dVr0cxefBEyxq8h2aCp3w21ySsCc0Ny5nVvaLe1SRU42zZf1Emk32VUyJo
	XNXHUL0AmXfdk8cg0W35aoMbZwyfyY19k8k+ZwL2Ftq5BIM81pTejx9gsaooj1G7gUYQjYpvXRbfN
	RIspboFGFULh5cI01Bgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmajX-0000000CSvz-2tmf;
	Wed, 22 Jul 2026 17:27:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmajW-0000000CSvd-2z7S;
	Wed, 22 Jul 2026 17:27:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=M5Y7D3saet3lwRTR1iYvW2JWs6T6gFdbJ6BwZVaxCLY=; b=FKTYYtGg5KofoGE6RMzv7N3kNo
	g4Orxixf/fuH12zcxf7FyGsKu3h2GfHB4E8uQLb570Sdl3mtnTxk7kV4R6wZ1OPbO00m+xbuJBVie
	FDyWUyw4IhmwlXlucS0UMlNbg78jzfJnZqZNfSpIrgiMhk+bCs2/Y20M7d+8PwRXmx53fjx9KxKDQ
	Th23xHU907nPO/JjjPOU4swqN/NP8GTXUiwsfuIFfQnnBV0A14PzpNK+pvZgZIGeyYzkNkjItQ3Ka
	Uqsq8643tFo7OXmgigF5D+a8CgtSrUqIqxqps9lXoSsu1Ysd8/PS5nRn6Egh4I55FvHCn4hJWKC50
	zoZ/UpJA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmajT-000000014l1-228v;
	Wed, 22 Jul 2026 17:27:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B2D7B1595;
	Wed, 22 Jul 2026 10:27:41 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B55B63F66F;
	Wed, 22 Jul 2026 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784741265; bh=UJJJ6gDdFfQhPAspitY0ExVcYQKJakkmR/X3IOo4bZM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SoeZpZp+wsxHy2IPoBPIESiHfIlciJelBcAUO0h9BaNgywgcLRKe59vGZr1KsfOtU
	 zXqwnNHi8fnyFJ4Z4tV45RCq4+uQHINF4Mo8FApJ3gK1YQgEZ3tQYqJ6ysDA6eAPD+
	 h3LKbzFF1zV5s5ibd/Q5KVSGVirnUpwJnXEtiFKM=
Date: Wed, 22 Jul 2026 18:27:36 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 12/20] x86: mm: define pudp_set_access_flags()
 when CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD is enabled only.
Message-ID: <amD9iD7rjmU__9b6@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-12-d9e4bad31e0a@arm.com>
 <188623a9-dba0-4229-a7ff-5feb2ef0c088@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <188623a9-dba0-4229-a7ff-5feb2ef0c088@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_182747_802675_B587F3D7 
X-CRM114-Status: GOOD (  17.52  )
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

Hi Dave,

> > diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
> > index f32facdb3035..edad847a2ecd 100644
> > --- a/arch/x86/mm/pgtable.c
> > +++ b/arch/x86/mm/pgtable.c
> > @@ -411,6 +411,7 @@ int pmdp_set_access_flags(struct vm_area_struct *vma,
> >  	return changed;
> >  }
> >  
> > +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> >  int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
> >  			  pud_t *pudp, pud_t entry, int dirty)
> >  {
> > @@ -430,6 +431,7 @@ int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
> >  
> >  	return changed;
> >  }
> > +#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> >  #endif
> >  
> >  bool ptep_test_and_clear_young(struct vm_area_struct *vma,
> 
> #ifdefs in .c files are evil.
> 
> The changelog doesn't make a strong enough case for why this evil should
> be tolerated.
> 
> These are also _precisely_ the kind of #ifdefs that cause compilation
> problems. This one is:
> 
> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> /// function here
> #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> /// another function here
> #endif
> #endif
> 
> So there end up being a couple of dependent config options in play. If
> there are compile problems, this makes them harder to find.
> 
> What is the _actual_ goal here? Saving 50 bytes of kernel text?

TBH, this came from for v1's change of behavior set_pud() where
triggered compiliation problem with v2 this change wouldn't require.

However, wrappering pudp_set_access_flags() with
CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD seems reasonable for not only
saving a kernel text but also keeping consistency with the other pattern
like pudp_invalidate(), pudp_establish() and etc.

Am I mising something?

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
