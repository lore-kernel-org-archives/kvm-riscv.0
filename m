Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED1606A33F
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PuRWotuz;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bni2B9pu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=x59NLpCXuLwJ4NJDut3xPqCNDsnLvhgQsPPXSNe1OVo=; b=PuRWotuzpeUnT6R8jyobUyMdd2
	Nu2UWno3a3/3K74ABCnAekdatPrRtLLUE02naWkmveh1K2SkcRm9P8n0jH4avPG0H7V4hZsqEZJ2B
	u3uy/Uun8bubBbprmhLhVVWPEvORnS8qNZyrXFpgSpQ7lVP/RMuGNs73x7/Imp+IZnt+5aX0LoZIX
	FZZ0oII46mwBIup5LTP5N4ppAaxNp4+nHCEw4Ddkk8p6ACw91jNRAwvUe9pvcWxD5zbEgynd4iGyC
	Fwud9inxszBLSwvPlaH45vPeohTcUyemB96CJL8qbCa0wx5kz2G98O190SN1zmz/s/8PguGge+vge
	4Ubqg9+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtxw-00000007Fw8-0ntl;
	Tue, 24 Nov 2026 17:06:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVtxu-00000007Fvu-32MM;
	Tue, 24 Nov 2026 17:05:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0C6D862572;
	Tue, 24 Nov 2026 17:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1346D1F000C0;
	Tue, 24 Nov 2026 17:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539957;
	bh=cEp/cXDtvYTiH8Vp1GK2CqYt15Bi6PXi0it+ySjQOVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bni2B9puF7kfV9Am5t1Ov8WQVRWkWZkohYhFYaAOCp/DQ8YyK4hiNB/6DDEmutNnx
	 9DItMmeG9wGbsSnTa/2g6Bc+qZD0MoOo2QOCjGO0RuxOqF3Tm1xaa1EZJ9bnO6HeVo
	 aY1UKSh6mwdd27HE+ANXhvMJYuMadmQYUspZ9MtLopcJo2kqu6TZRKLJOQ+VmUeRA8
	 BHSro9BNahirHyqaXlAUVp75XTw4Ei0heRmarVboAGmlnTryJvfEdsallK7L2ZowDl
	 Fuw7NBHUoexrLNsU88p9DA3WymGQjoLqXzSxY/kk/t5a2Ys6NENMpuN8WNAadIMoey
	 tbOkOgbd3/Bhg==
Date: Tue, 24 Nov 2026 19:05:38 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Russell King <linux@armlinux.org.uk>,
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
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-openrisc@vger.kernel.org
Subject: Re: [PATCH RESEND v2 12/21] mm/pgtable: redefine PGTABLE_LEVEL enum
 with ascend order from PGD
Message-ID: <awXD4i47F-VAG1tD@kernel.org>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
 <20261102-dummy_ptxp3-v2-12-78840b2ec73c@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261102-dummy_ptxp3-v2-12-78840b2ec73c@arm.com>
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 11:21:25AM +0000, Yeoreum Yun wrote:
> The PGTABLE_LEVEL enum values appear to be ordered in the opposite direction
> from their intended usage.
> 
> Intuitively, higher page table levels should have smaller enum values,
> but PTE is currently assigned 0.

That's not what x86 thinks :)
They even expose it in /proc/vmstat with smaller numbers meaning lower levels

$ grep direct_map /proc/vmstat 
direct_map_level2_splits 152
direct_map_level3_splits 4
direct_map_level2_collapses 0
direct_map_level3_collapses 0

Just an observation, I don't mind either order.
 
> For consistency and cleanup, reverse the enum value ordering.
> 
> Since there is no current user relies on these numbers to be ascending from
> PTE->PGD, so it can be changed to be ascending from PGD->PTE, in the
> direction of the page table walk.
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
> ---
>  include/linux/pgtable.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index 780fe849ff8b7..a032f95943357 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -2288,11 +2288,11 @@ static inline bool arch_has_pfn_modify_check(void)
>  typedef unsigned int pgtbl_mod_mask;
>  
>  enum pgtable_level {
> -	PGTABLE_LEVEL_PTE = 0,
> -	PGTABLE_LEVEL_PMD,
> -	PGTABLE_LEVEL_PUD,
> +	PGTABLE_LEVEL_PGD = 0,
>  	PGTABLE_LEVEL_P4D,
> -	PGTABLE_LEVEL_PGD,
> +	PGTABLE_LEVEL_PUD,
> +	PGTABLE_LEVEL_PMD,
> +	PGTABLE_LEVEL_PTE,
>  };
>  
>  static inline const char *pgtable_level_to_str(enum pgtable_level level)
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
