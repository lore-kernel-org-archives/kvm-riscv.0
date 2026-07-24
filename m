Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9B1C531C9
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 10:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	Cc:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z0v5143Ljet2y5VtaAnIckG1uEv6qeS83OtQBII1AXc=; b=LT/ZNHg1NJWsl7
	X5T9X7mWGtoPlEcscMYxFbRHSdnkzunz37WczKNzmFR0NEo1pxSocx7OdI6s+X540AsdCmunNqn7D
	Ne+df1RJ/qoCnsb9AfAlSuWYYGYwpI5w2mPB5Mtto2xAalhKW7OAwevovEMWmpzz/wI2A6mstXZ4D
	ZOJyLBNDcW3JBlVwD3DFPdoCdQGbnHc17a/VaYcH56VulsFqR2zXEnB5VnUGDKeDYGlPRGt/hmPVk
	YPUgrxlQBbg1h9dncorRj2mBw4TN7VX4B/gblz1QvEde5YwTEgekP8j5bwvQ20i0+6P2FxhRNSoh1
	RxnYg8lMV1kasprF8i2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDJH-0000000G8SS-2tQB;
	Fri, 24 Jul 2026 10:39:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnDJE-0000000G8RQ-1wNZ;
	Fri, 24 Jul 2026 10:39:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E56B1477;
	Fri, 24 Jul 2026 03:39:06 -0700 (PDT)
Received: from [10.2.198.93] (unknown [10.2.198.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EF243F66F;
	Fri, 24 Jul 2026 03:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784889550; bh=8ucxzJzKRncGbmLH/iEQkI2exC3zh2zSlJ8zSRx26rg=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=nPz4q9UnTmIpC3f1IrnhhOXc+A/Z2VLc2MvO7S07Y0dMBj6vYrB5Dye4ym8oVNhXD
	 BOcxcXhOs2SceDUmzESNakuvRw/Lz60Kb4I5oFZwEpDHzbiEUv3iW7H4ZPf9e+CZSj
	 HrNea7YK425Wt8aVXd2zUUsc5hB2FRPkxg9XWQf4=
Message-ID: <85146377-9c7a-43d9-a5af-b976d25cb93f@arm.com>
Date: Fri, 24 Jul 2026 11:38:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: usama.anjum@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-arch@vger.kernel.org, linux-mm@kvack.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RFC v2 08/20] mm: vmscan: remove stack copy address of pud
 pass in wallk_pud_range()
To: Yeoreum Yun <yeoreum.yun@arm.com>, Russell King <linux@armlinux.org.uk>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Kairui Song <kasong@tencent.com>, Qi Zheng <qi.zheng@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Barry Song <baohua@kernel.org>,
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>,
 Wei Xu <weixugc@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 David Hildenbrand <david@kernel.org>, Michal Hocko <mhocko@kernel.org>,
 Lorenzo Stoakes <ljs@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Liam R. Howlett" <liam@infradead.org>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-8-d9e4bad31e0a@arm.com>
From: Usama Anjum <usama.anjum@arm.com>
Content-Language: en-US
In-Reply-To: <20260722-dummy_ptxp3-v2-8-d9e4bad31e0a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_033916_772005_937B01A2 
X-CRM114-Status: GOOD (  15.82  )
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

On 22/07/2026 4:30 pm, Yeoreum Yun wrote:
> The behaviour of pXdp_get() will change with generic compile-time folded
> page tables. To prepare for that, replace passing the address of a stack
> copy of a pXd to walk_pmd_range() with passing the pud pointer directly,
> allowing folded entries to be ignored.
> 
> There should be no functional change.
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
Probably my reviewed-by tag was lost in previous version. Posting here again:

Reviewed-by: Muhammad Usama Anjum <usama.anjum@arm.com>

> ---
>  mm/vmscan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/mm/vmscan.c b/mm/vmscan.c
> index 06e103f9781e..0c9c4ac89e09 100644
> --- a/mm/vmscan.c
> +++ b/mm/vmscan.c
> @@ -3727,7 +3727,7 @@ static int walk_pud_range(p4d_t *p4d, unsigned long start, unsigned long end,
>  		if (!pud_present(val) || WARN_ON_ONCE(pud_leaf(val)))
>  			continue;
>  
> -		walk_pmd_range(&val, addr, next, args);
> +		walk_pmd_range(pud + i, addr, next, args);
>  
>  		if (need_resched() || walk->batched >= MAX_LRU_BATCH) {
>  			end = (addr | ~PUD_MASK) + 1;
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
