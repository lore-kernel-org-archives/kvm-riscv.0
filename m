Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803A1C44532
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 16:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xf0CmoJptx3U+Ke2dZXReBJvkSLgxU+IKDWY3CJMEIU=; b=z0yHPrC6ZCfAN8
	DehnQtiWsk2gOevRWVbzqxHCjxTikAXAkikz/GKhR9pi0Fftycb3sJzThidNH/ifV+xWwzg+W8byH
	8pgsNLC/BlRObypGGEGmIetImuGG5zKq8xHMBqdd51FOo1JvHCtEj45m+WDcuzoFHiDQYrPCVrgQe
	nFhUuNi5JIpIi6C4abGLRfCUr3eeVBHv2F9bi1Cob01dLb5DTWQqXTSHvXwM8IPvSYQNEuM3fubOW
	ComzO7+XtImQOqLaUiu5Ba9Y0Lvt/UqhErWGyiJt1ZTHuhrX3870z7k5fLkM/dcU50Ju7lpL1N+/Y
	1He5zeVGQKE+euacBnYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZo7-0000000CLIp-0ity;
	Wed, 22 Jul 2026 16:28:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmZo3-0000000CLI1-48Iw;
	Wed, 22 Jul 2026 16:28:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E16781595;
	Wed, 22 Jul 2026 09:28:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06C6B3F59E;
	Wed, 22 Jul 2026 09:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784737707; bh=zuH7kkmwR8NNpVXMbiFke1P+LUZR0u9QfuY8Dink+x0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b2aLYabgc6yJSyWPRkPzmjeANxGjltEW66WjBcJJ7wrgt0CpZUhi+4VwgQCiFuvZY
	 BiepiPV913zyySxKRUxjs9bzt9QQatorM4bNyswKuSduJDtkRp88U81YsA32gpKv2E
	 vuKaU4EwGuWcGtS6nnlD2rs2LcQdLY6Wx/t2OxuY=
Date: Wed, 22 Jul 2026 17:28:18 +0100
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
Subject: Re: [PATCH RFC v2 13/20] x86: mm: carve out the generic compile-time
 folded pgtable case in effective_prot()
Message-ID: <amDvonIJezy_YQZA@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-13-d9e4bad31e0a@arm.com>
 <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_092828_116050_7BC8F83A 
X-CRM114-Status: GOOD (  22.52  )
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

> On 7/22/26 08:30, Yeoreum Yun wrote:
> >  struct pg_state {
> >  	struct ptdump_state ptdump;
> > +	int first_level;
> >  	int level;
> >  	pgprotval_t current_prot;
> >  	pgprotval_t effective_prot;
> 
> There is zero reason on x86 to hold this value in a data structure. It
> is 100% determined at boot time or earlier. Pre-5-level-paging it's a
> compile-time constant.
> 
> On x86, it never varies per-mm.

Yes once ptdump_pt_level_first() is converted with static inline.
I'll change this.
 
> > --- a/mm/ptdump.c
> > +++ b/mm/ptdump.c
> > @@ -197,6 +197,17 @@ void ptdump_walk_pgd(struct ptdump_state *st, struct mm_struct *mm, pgd_t *pgd)
> >  	st->note_page_flush(st);
> >  }
> >  
> > +int ptdump_pt_level_first(struct mm_struct *mm)
> > +{
> > +	if (mm_pmd_folded(mm))
> > +		return 3;
> > +	if (mm_pud_folded(mm))
> > +		return 2;
> > +	if (mm_p4d_folded(mm))
> > +		return 1;
> > +	return 0;
> > +}
> 
> Having this in a .c file may not be the best design decision. On a lot
> of architectures and configs, this is 100% a compile-time constant.
> Hiding it in a .c file and forcing a call is kinda silly.
> 
> In the worst-case scenario on x86, this ends up being an "ALTERNATIVES"
> patched check. So it's technically variable, but patched at boot-time to
> one possibility or the other.
> 
> If something is making the function larger than a few instructions,
> something is wrong and needs to get fixed.
> 
> IOW, this should be a static inline in a header, not a full CALL'd
> function in a .c file. *That* will make the value visible to the
> compiler at all call sites and let it do all the smart things compilers
> can do with build time constants.
> 
> Also, my original objection was "this function has zero to do with x86".
> Well, it also really has zero to do with ptdump, either. I'd probably
> just stick it in one of the generic page table headers.

Agree. I'll locate in the linux/pgtable.h

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
