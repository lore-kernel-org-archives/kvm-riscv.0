Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08866C982F0
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Km265oRyL3+gQjjcvR7nYTh/3cbnUnV5jFCcjHOwdew=; b=4TIDLTY5IMAihA
	kkcj0toYOa64hRxtjU6L14yRVTO8MoktcsHAHTofSPiCHMPLEzZQOUIgMZIKOtqWklwGMcUENtPS9
	JYqpY9h9nCI7jMI3phimZEM8nmNbOYUnZWQ/z1yeO9wTp5Fvs+koW6MFKhv3co+n7Pr/4J0TQ3ZcQ
	FGjliuo77t7o7heQ4gg1MjaUOcPwtmeumPgTSiGubKKXl0mfClnlXGE1LbsJe6lpoQzJK2wLRb/F8
	ZCem7+BknXML2kbSeAxJEGN51SL7rf/PxeVz126hV4ULkVG2fltvXt5/xEm2xaTIzdA/pVBYMyW68
	WKVBD0HB0gcDipW+q18A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kbG-00000003L2k-1SmJ;
	Mon, 21 Sep 2026 20:26:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kbD-00000003L2A-2pMx;
	Mon, 21 Sep 2026 20:26:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E89C5176C;
	Mon, 21 Sep 2026 13:26:45 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19DCC3F632;
	Mon, 21 Sep 2026 13:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790022409; bh=YR8KjfryI7McmdGWbe5RjCYF03qe877YQVcwQ4evUyE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZJQgJ1u3+XbrE14CRndMnlfvZodRjo8Owgd4VUfyb4ysv/TCeswI4E1slRGuH0ZC5
	 gEB41b7eQMFvIpiPafng381AyyipSmuL+EUBfZkrewzD7VQyDMaw6gvMc8JJ8U+oLq
	 2RkB+DvgV9b00Ftlc/0AMEXk2kIo1XjoleH7ftTk=
Date: Mon, 21 Sep 2026 21:26:40 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Randy Dunlap <rdunlap@infradead.org>
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
Subject: Re: [PATCH 21/21] Documentation: mm: clarify behaviour of
 compile-time folded page tables
Message-ID: <arGTAMyNaJVjKiuC@e129823.arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
 <20260921-dummy_ptxp3-v1-21-cd40cf68242e@arm.com>
 <c0c67459-6b75-4bcd-b068-3752e23afbf6@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0c67459-6b75-4bcd-b068-3752e23afbf6@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_132651_916086_BF2429C9 
X-CRM114-Status: GOOD (  15.96  )
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

Hi Randy,

> 
> 
> On 9/21/26 3:55 AM, Yeoreum Yun wrote:
> > From: "David Hildenbrand (Arm)" <david@kernel.org>
> > 
> > Compile-time folded page tables are not necessarily easy to understand, and even
> > people the were once familiar with the concept might need to refresh their memory.
> > 
> > Add proper documentation, including a nice diagram, for the current design.
> > Mention details about dummy functions, including the recently changed pXdp_get()
> > helpers.
> > 
> > Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> Documentation/mm/page_tables.rst:197: WARNING: Bullet list ends without a blank line; unexpected unindent. [docutils]
> 
> See below for a fix.

[...]

> > +Note that the arrows from PGD to NOP4D represent page-table-walker
> > +transitions, not pointers stored in the pgd entries.
> > +
> > +Using p4d as an example, `nop4d`/`p4d folded` translates to the following:
> > +
> > +- p4d is considered folded into pgd; both are operating on the same page
> > + table.
> 
>      table.
> (add one more prefix space to align the indentation)
> 

Thanks! I'll fix it!

[...]
-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
