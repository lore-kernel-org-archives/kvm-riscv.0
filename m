Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36BCCC4453C
	for <kvm-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 17:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XoUXYCJ/jWt1zBdOO++VWOfu8XF4Dkja7Dlh5SBen+Y=; b=0GY1AsFugVfZk0
	YyttL4G/WuHWKoqpUzfOSTdxX4NSlyyN0FKs9OTETfd7W8vcI07LH0UfmKtouwOUnumTIpWBpP/sn
	tpPmdx1l9Q6qstVfld9/r3BBntR22vKg9ehvMAB1T78n6uB79xhcRo9n5D725XV2JzRJ4gl+NF7tR
	88OmcKZZZKnNdcihCGeNm0pBl2zlOG7n+EUy/vs7ZwpXbMjiN6fZ44/WPonzWhOnUVXgo6OLTBfSm
	/5t89uBlmjggDem1T/GZIpxps8FnqL5dFmQKXS7HbKrb2LMsLzyDZJXd9fMj+SM/940F79/1NO75X
	R1Yt3OpvJRDJvfl2aIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmatJ-0000000CUA3-3ewi;
	Wed, 22 Jul 2026 17:37:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmatI-0000000CU9a-0gj9;
	Wed, 22 Jul 2026 17:37:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9b0lYAChp/dlK8UrMEe9sgRuRXi4DJ+u7ef6sfSwFo8=; b=ZVU9GAXiu8QBjnuTHwYIk1zn7M
	IHdXTcLzvPaYRamKYFIPHKGEWESPJH5XK9jfGLnAm5iN2hgVyd281OLvscWa5s6rLzYmDJuyoYsOy
	1PlJo53L7HfOgXzscH/OVc595Nx4tZFBMLYma5TYzLaZm9Q87e5zhBw+jYDcvWA2/Fkdpwh8B3F9x
	DVyqHWYBpyJIzEbxyEWusPs7jwvK8Wai18ASThporA9Z/ee/I0TeSFMuBt9DpwKU8vqY0i2IR0dCz
	6iMY95iezh+AELPQXXJSwFGLC+LhbFutzWrC6hnr51DpST6dEeimHi//XFHOhbO40fvV4bXY1L+b3
	09Af3XrA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmatF-000000015Cm-0Nvh;
	Wed, 22 Jul 2026 17:37:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4C9A168F;
	Wed, 22 Jul 2026 10:37:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074493F66F;
	Wed, 22 Jul 2026 10:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784741871; bh=JnKvBjo2fOfq9jvwV+JUrWEAgatydjsNYlPbheLKhxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QAyoeG7PKBAcoDg4Vx9aVKdN0VlATPEViq8WVRyZilegBBahIiktHRv2hfoEoCbzO
	 UJkF9NKxVlB1ZkC22HyEA1xzj6R0ZAmD2eyyzrJ2PtRBpEmkwyyZGygxHNSHMhB+yJ
	 cFBkNBXczoT10ntHra7/zJDISGpvjgKKjsxCrn3c=
Date: Wed, 22 Jul 2026 18:37:42 +0100
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
Message-ID: <amD_5r04mzMoZ0-r@e129823.arm.com>
References: <20260722-dummy_ptxp3-v2-0-d9e4bad31e0a@arm.com>
 <20260722-dummy_ptxp3-v2-13-d9e4bad31e0a@arm.com>
 <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d16a8412-acee-4c21-a126-f570d6306983@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_183753_298530_7A772C1F 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

However, mm_pXd_folded() requires to mm for other architecture like
s390. might save the mm instead of first_level and calls the
ptdump_pt_level_first() with static inline version would make the
constant comparison. So it requires to save *mm* structure in here.

[...]
-- 
Sincerely,
Yeoreum Yun

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
