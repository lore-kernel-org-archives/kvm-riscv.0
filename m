Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C2CC56208
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Aug 2026 17:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgfQM2wN3QdOdo2ezaNH6N/FjSlEpvV0hLavQVRcNVg=; b=qTR2/zleZCMbdC
	inltVVM9JHYdonHq/k6gYlHeTK8tPbJS6apjh9PrZS3xyDyx1FbrHWXjnhWaxyvrFiyYJ1ZOnWFtM
	xqmFVvVhURA6Q6dT17E8kgIS9ryWKYiRU8Eer7d5A+E9iVjtgGnIoMo4t3FVl/vpJT1CN00qP72st
	+kMlDToN87xG4fS9hI+h2zeDCiJNIgiCGC3MMnA9gSAC3A9TWySZ2GcN29k9U6d/RwzYvRyG3eA9I
	peFvC51y+KrzVQs7khr331Eyhb1apNfuGpwr3Cd/kdvhQJ+Fh359LWA63BtjFaXGHs2D2K+fV3vsE
	ufZCpQFlJfx/dIobfmpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1e7-00000006L6O-3IbG;
	Thu, 06 Aug 2026 17:12:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1e5-00000006L3p-3Vvv;
	Thu, 06 Aug 2026 17:12:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4556760AB1;
	Thu,  6 Aug 2026 17:12:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BA71F000E9;
	Thu,  6 Aug 2026 17:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036361;
	bh=i2yjrrVc+H/dOZF8X/JCAszDBzatuRJpY6enVbVkXDU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c8OYpXn/lbymZWYNNGPbBk8+3HfighE8u/aLjR6Id3SpcMlVswuIxuoFT6i8+sJVG
	 33bgpDZK07lgJdRnLMQQM5x5OHdfGvrUlwrg07n1Vrb5Uhrfcf7XF85qEDFGTpmbzJ
	 qifqGwAx2bDkh0NXTIgleM+IkLM3PHw2BFHX6yZMbeRqljFQbSRqJcqKkhvmOKwx4y
	 8hBZqfwDXrrUJpo3Surfw1/jC6G5IUWLTS95IreVfJCJJxrzmp1dOhdDQ+kcloC6rE
	 eCHWu6iyOrudRbovBNdMtzXkfpZdjrLsc4CWBTA/u9nkgylUVc+I/jIl/BOLL8csMs
	 892czlr7RY3TA==
From: Will Deacon <will@kernel.org>
To: Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	David Hildenbrand <david@kernel.org>,
	Michal Hocko <mhocko@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	Yeoreum Yun <yeoreum.yun@arm.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 00/20] mm: optimize unnecessary loads due to ptep_get() and friends out
Date: Thu,  6 Aug 2026 18:11:50 +0100
Message-ID: <178601690203.388302.5785771709606318463.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
MIME-Version: 1.0
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

On Wed, 22 Jul 2026 16:30:08 +0100, Yeoreum Yun wrote:
> Using ptep_get() and its counterparts in common code is suboptimal on
> kernel configurations with generic compile-time folded page tables.
> By default, ptep_get() and its friends expands to READ_ONCE(),
> forcing the compiler to emit a load even when the value is not used afterwards.
> 
> This issue was recently reported by Christophe Leroy [1] for ppc32
> preventing futher code conversion to ptep_get()/pmdp_get()/... helper
> and the same behavior can also be observed on arm64 when built with
> 2- or 3-level page tables
> 
> [...]

Applied the arm64 patch on the end to arm64 (for-next/mm), thanks!

[20/20] arm64: pgtable: convert pte_present() from macro to static inline
        https://git.kernel.org/arm64/c/3b56ebafecc4

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
