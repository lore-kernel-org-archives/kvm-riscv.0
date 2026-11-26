Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEA2606A33F
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IDh/v4ER;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTrh4ivt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4D+J+EVRMU4AUmz29cLq2KgY0PAa0w75CYugAUOD3jo=; b=IDh/v4ERnAxXtSBIWzuhfNYESR
	+VLK5f0OOihJTsvqE8OSXWkgSiDaKPGqngaZtoBtuq2I4OobyZCl/R+ZrrdY6tuL2AshQdziANHXW
	ktBHV6QOwbSZY4TzutRwb2DzURqd09ju+yBnHghc/t4t5LefPfHXnPCqKKGPrNRj1QOvkMxcZ11ba
	sagro9s4Uxdq0fpwu5LpL0UAaGEZjgxdrdWkRQdEzQLyfgZikfIJ5GUD8/OoSX7VFAbF78opWMvDo
	bZ82mu0PvOfKctyAdSCSET4nvJAAYdAUCEyfWZjG9GkcZOiE3fmMns+qZL9BMOukC5ysN9BoDLn31
	RIt/XPAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdw0-0000000E8hI-1Lba;
	Thu, 26 Nov 2026 18:11:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdvz-0000000E8h5-4AYz;
	Thu, 26 Nov 2026 18:11:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3DC174482C;
	Thu, 26 Nov 2026 18:11:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E52761F00AD3;
	Thu, 26 Nov 2026 18:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795716662;
	bh=u9v575CLn7pmoDOzWOn9peb7SoijlK+LbrKGpES9aRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=eTrh4ivtfPOlk36i/Syox5jVW6dXJmhOgZwioO+nYxMKjGShC7TMyjjJl/zzRZ/W3
	 SkP6MLdWC5iwrRV6uvUn6/rKonHWO56PFB3c75THzdQTim1Mri+dYH52nOteGfRTCj
	 M+BZepOCmKNRYHvlRa117MS6yceBdzXjdmtuENyHhISgbQTyWosUB771P8KFuwQKC8
	 pVw08LjMZlVYdDIpRqOeWvsFhzaGdSX4qDT0MagmIoJIq2tNOTskLwvuvj9X76KZmW
	 omTnmVri/xaVPYJp7AvvaZYW/JxAmTrlzAhShiP47YqYQ+fQwkXl5svB+CMxRIbwv0
	 XMDyeevoEqAuQ==
Date: Thu, 26 Nov 2026 20:10:43 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
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
Message-ID: <awh2I4llsjkB7Vds@kernel.org>
References: <20261102-dummy_ptxp3-v2-0-78840b2ec73c@arm.com>
 <20261102-dummy_ptxp3-v2-12-78840b2ec73c@arm.com>
 <awXD4i47F-VAG1tD@kernel.org>
 <awXc0MSZl9t9VW8e@e129823.arm.com>
 <682c765f-332f-4ac2-b448-4201c8fae6fc@kernel.org>
 <awhCnpiUc1R_BLx4@e129823.arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <awhCnpiUc1R_BLx4@e129823.arm.com>
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 02:30:54PM +0000, Yeoreum Yun wrote:
> On Thu, Nov 26, 2026 at 03:19:13PM +0100, David Hildenbrand (Arm) wrote:
> > On 11/24/26 19:52, Yeoreum Yun wrote:
> > > On Tue, Nov 24, 2026 at 07:05:38PM +0200, Mike Rapoport wrote:
> > >> On Mon, Nov 02, 2026 at 11:21:25AM +0000, Yeoreum Yun wrote:
> > >>> The PGTABLE_LEVEL enum values appear to be ordered in the opposite direction
> > >>> from their intended usage.
> > >>>
> > >>> Intuitively, higher page table levels should have smaller enum values,
> > >>> but PTE is currently assigned 0.
> > >>
> > >> That's not what x86 thinks :)
> > >> They even expose it in /proc/vmstat with smaller numbers meaning lower levels
> > >>
> > >> $ grep direct_map /proc/vmstat 
> > >> direct_map_level2_splits 152
> > >> direct_map_level3_splits 4
> > >> direct_map_level2_collapses 0
> > >> direct_map_level3_collapses 0
> > >>
> > >> Just an observation, I don't mind either order.
> > > 
> > > Right. I made this change because a depth-based scheme seems more intuitive.
> > > 
> > > As you pointed out, though, the x86 specification uses smaller
> > > numbers (0) for lower levels (pte), so I think we can leave the
> > > x86-specific direct_map_* entries as they are.
> > 
> > patch #14 depends on this, no?
> 
> Interestingly, x86 documentation numbers the PGD level as 4 or 5,
> whereas helpers such as effective_prot_pgd() use 0 for PGD.
> 
> Anyway, this follows the usage and semantics of effective_prot_pXd(),
> rather than architecture-specific level numbering, which varies across
> architectures.

I asked an LLM and here's what it told me:

  x86, s390, riscv, LoongArch and powerpc count from the leaf. arm64 and
  ARM count from the root, and so does the generic page walk and ptdump.

My guess that the only reason that generic ptdump counts from the root is
because it came from @arm.com :)

> And yes, patch #14 depends on this, although changing the condition to
> level != PGD_LEVEL would remove that dependency.

I think the only real hard dependency on levels numbering is x86's KVM code
that manages secondary page tables, but it anyway does not use enum
pgtable_level but rather x86's own enum pg_level.

> -- 
> Sincerely,
> Yeoreum Yun

-- 
Sincerely yours,
Mike.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
