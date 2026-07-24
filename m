Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 972E1C531C9
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 11:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eZm9QA96AEz0n1Il20kQC/mpnRKfzqDbYk0GEjJ7fvw=; b=k5H/iCPPrTgshF
	OtnAvv3owXSNijGEdvUbiOndddQdw5rhwSrz80WxeMMJ6xDfbPlA1ATuA2jpX2p4T/3SOfFo3yjgy
	r1UxDSjO8awtWW7a8ZPfcmzm0mFFFFyVEKn2UApVC9h9vBNP8GqSlC0/n9rzwbEWRKXv551nveRWg
	X0uLVGCGF8uUNQxXvrRgjiE4qgQ00N9xeQ0GJBsCLUPeqNWPQSHgn7g01YXK2ZhJfZfGGqoKhTXJQ
	Ow+IsWMHWhEBbt8q9i/RIH4JrZmoMIWpAfd7Bbg3bJZGTLnVazKjEyuMBqGOjgMtQ7B9QtRhhDcQ3
	dywLdUHM0fxyvOZvfRHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEPo-0000000GKDV-3RlA;
	Fri, 24 Jul 2026 11:50:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnEPk-0000000GKC5-32rf;
	Fri, 24 Jul 2026 11:50:07 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA1941477;
	Fri, 24 Jul 2026 04:49:55 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0F2463F59E;
	Fri, 24 Jul 2026 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784893799; bh=lSGi/T62Qz3zkTtfJoxDSfari9OyrmBQakjPywG4Wwg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onlJqJS22YoDsKaG6SiKSkuKsNv+WmGR0K4ecfdNyqZf1u/+3JEGvSxKfGGrvm5nJ
	 MXCh4HNavE1AO8qDTOoQLnL6W10waJKQJvwWm9dJxKiy7ypA0biilE7i0COMFUcgAZ
	 cBx7VbhxE8imKHXZsbg7suIUPJzdyNKYFStD+n4k=
Date: Fri, 24 Jul 2026 12:49:45 +0100
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
Subject: Re: [PATCH RFC v2 14/20] x86: mm: skip pud setup when using generic
 compile-time folded pagetable
Message-ID: <amNRWR-8BCBNU0sR@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-14-d9e4bad31e0a@arm.com>
 <0ea931f1-4801-4d32-b6ce-4787a8d3daa9@intel.com>
 <amD7ab_KuJPdBQBh@e129823.arm.com>
 <6f5060a7-0a64-49fc-81a3-ae88729ef794@intel.com>
 <amElnEbvRTjv2hyU@e129823.arm.com>
 <3620750c-54d7-45a0-b067-bc813dd3cd9b@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3620750c-54d7-45a0-b067-bc813dd3cd9b@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_045005_046231_9DC3A692 
X-CRM114-Status: GOOD (  14.21  )
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

On Wed, Jul 22, 2026 at 01:22:04PM -0700, Dave Hansen wrote:
> On 7/22/26 13:18, Yeoreum Yun wrote:
> > Sorry. But do you mean check with cpu_feature_enabled() not with
> > boot_cpu_has()?
> > IIRC, the boot_cpu_has() doesn't use the DISABLE_MASK_BIT_SET() but
> > uses REQUIRED_MASK_BIT_SET() and I don't expect it wouldn't make
> > an optimisation to constant check which is contrast to DISABLE_MASK_BIT_SET().
> 
> Ahh, yes. I forgot about that nuance! Moving to cpu_feature_enabled()
> would be great!

When I see again, using cpu_feature_enabled(), this would give a chance
to optimisation when the feature disabled and there would be no harm for
when feature enabled since cpu_feature_enabbled() also fallback to
boot_cpu_has().

So, it might be good to change with cpu_feature_enabled() as we
discussed.

@Dave, Should I send above change separately or include it in this patch?

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
