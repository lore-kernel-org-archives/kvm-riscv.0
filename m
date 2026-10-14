Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E9ACC6B1D
	for <kvm-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 09:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qU+QR6M9HmdNjhOZkXumhl1DCnbtiwT7OYHOyvp7A8o=; b=MfcGRlfISV+IXI
	2TyIE3LTkGu87GNJQTeq1NQ3kbRQjejaxE6NMnkY5/aA95irtBrd4z46Ki2CPkMdnjBldyURt9nsP
	dTAAG/p/QlGS5UHHU1+qt5swtHvaXrSvAlKFnM2QjZer0Lm/Q7IBt7zUMEk0rouUPK/mYwJlrWmN5
	tN36bj7hma+LdxVHAKFbL679dYDlhUxj8twDkxkqAJ7odHQie20LPtno1kPXtZ/ChrLIQ5fir9WrA
	6wci+G88lYkKkvLoKkpRGkF6iwh9ZSvoqd3/5+oLrk0SlyOk2EC2nJQitdvkAOmVD3nhJOrwgNz6W
	uK1fOzsA5Dw/iYcSccXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvU3-0000000F5L8-1PFb;
	Wed, 14 Oct 2026 09:41:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvU0-0000000F5K6-2mnN;
	Wed, 14 Oct 2026 09:41:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 88C081595;
	Wed, 14 Oct 2026 02:41:05 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2AF293F7B4;
	Wed, 14 Oct 2026 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791970868; bh=IZ8rfk5wxLDPpZ+dPdITJwhlPRFAwVPL9jnNAGRlXks=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V92y/KLn+QFs1dHeT5iQbY8pAfel4csa8XC0I/lkv0KHx1K2TT47ezllvr0uhly/0
	 015KPOYKeVKGO+UgOwsPrd/6b/fuoIlM6ngOfqHLEiWFVMzudL5X5ZAHOlmapDgTxZ
	 T0WIJMCN2wo4aeW9rp9i0FoWrlPYfah9XjcOeeQM=
Date: Wed, 14 Oct 2026 10:40:58 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
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
	linux-openrisc@vger.kernel.org,
	Muhammad Usama Anjum <usama.anjum@arm.com>,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: Re: [PATCH 00/21] mm: change behavior of pXdp_get()/pXd_page() in
 compile-time folded pgtable
Message-ID: <as9OKt7pg-vkJDz9@e129823.arm.com>
References: <20260921-dummy_ptxp3-v1-0-cd40cf68242e@arm.com>
 <as36bbrMVHOESsLd@e129823.arm.com>
 <ef5b6275-d15b-4192-a278-ab23235956a0@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ef5b6275-d15b-4192-a278-ab23235956a0@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_024112_742058_257DA273 
X-CRM114-Status: GOOD (  14.46  )
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

> On 10/13/26 11:31, Yeoreum Yun wrote:
> > Hi all,
> > 
> > May I ask there are any further comments on this series?
> 
> Let's resend after -rc1.
> 
> I think most arch changes are reasonably simple and uncontroversial.

Acked.

> 
> But I'd prefer if riscv maintainers could have a look at
> 
>   [PATCH 11/21] riscv: mm: use proper set_pXd() for generic compile-time folded
>   patable in vmalloc_fault()
> 
> You are working on some general vmalloc_fault() cleanups, but until we have them
> I would hope to get an ACK from riscv maintainers that this temporary solution
> is good to go in.

Hopefully. Thanks!

-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
