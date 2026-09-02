Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 380EFC624D4
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 23:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfVVeNxpbrv6mKgnFoD9q1sGxHRnDxlksDljgD/Euho=; b=XF/b052iZq0Gvu
	wisVgdYcMmMUQPYz/0TudO/QjjwYoYIp7gl02JdWXyJOwNxkfBkjB+S9is7hzeeVvk5ioBSVOHjry
	1meHQggVXxy5a739lRI4gYHoofg6YUOVJC1Nv4fUr14jEMVTB9e6nxhQ4jLtEvXFH+/KSkqOfdyfd
	9JT/yeKGNSg8J13sm3Wd1HE84iubCOG/4mA94FAn/0XNbj34Ki7THNge2aqma9NO0HUgE6VINteLE
	Gtqh/F5ABPt/z3Vv+qfeeHugBTCVjQOPMUw3jEWzB899lLb7Hs3DhhnBjS9JAr+Xq3i/SZCFMOk2X
	klP54ozjTfV5fkqRJmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1u34-0000000G4a5-0t0x;
	Wed, 02 Sep 2026 23:07:18 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1u30-0000000G4ZO-3UHX;
	Wed, 02 Sep 2026 23:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1788390434; x=1819926434;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DGhH14+yE9nyt5xO4fYtNZdDfh3D8lYk97bpxGHpfRM=;
  b=mykIYhVnI0zvw0IjXivNoYB0xaM/J8fQePNtm8h36rv+U6ZaceipP+2A
   prxYxHhNjRWc0ubQe2Ho0GbUgJCnOwDSeb2eTt6vydB4CUKbd1NfgMnVy
   n/bM/CVnLZpylo+4/RrQze9Zdw7f82b3BEC5eYksCzrrhICNkys51ndoN
   UJkoprJBkuEFgAvJJ6+m/ip5RggQ8kPUsSNBCVl2bacU+IaT6tuGtr7+O
   7NXDyGcA/fJPfeQtRPaSiQNF/x2GkZqkEyva5IdlY6eVL2riITMxKRd/5
   eg/lFYdFkHnMBVFiVik3b2shsx6oRHqrXt83w7b2AU2FNJDrbhUui8EYs
   w==;
X-CSE-ConnectionGUID: Ofn1fpTWTbW09R+kIPfXvw==
X-CSE-MsgGUID: D0F/vOykTUKuEDcXBMLDjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="253617833"
X-IronPort-AV: E=Sophos;i="6.25,258,1779116400"; 
   d="scan'208";a="253617833"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2026 08:07:07 +0900
Received: from az2nlsmgm1.o.css.fujitsu.com (unknown [10.150.26.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id BC88E42A309;
	Wed,  2 Sep 2026 23:07:07 +0000 (UTC)
Received: from az2nlsmom2.o.css.fujitsu.com (unknown [10.150.26.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm1.o.css.fujitsu.com (Postfix) with ESMTPS id 5E65FC012A2;
	Wed,  2 Sep 2026 23:07:07 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 9805E18021BF;
	Wed,  2 Sep 2026 23:06:57 +0000 (UTC)
Date: Thu, 3 Sep 2026 08:06:54 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Atish Patra <atish.patra@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	David Hildenbrand <david@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
	Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v2 00/20] KVM: selftests: PPC pre-enabling
Message-ID: <apisDlhdG7xNDVyl@sm-arm-grace07>
References: <20260902164123.2546762-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260902164123.2546762-1-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_160715_450753_FE1F38B7 
X-CRM114-Status: GOOD (  18.36  )
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

On Wed, Sep 02, 2026 at 09:41:03AM -0700, Sean Christopherson wrote:
> This is a big pile of cleanups and refactoring to prepare for PPC support in
> KVM selftests.  PPC has paging modes that require multi-page page tables, and
> those page tables need to be naturally aligned.  The original proposal was to
> plumb in an @align param to the page allocators[*], but I didn't love the idea
> of adding another rarely used param to the allocators.
> 
> v2:
>  - Collect tags. [Itaru, Bibo]

I ran kvm_page_table_test for arm64 again it went ok on HW.

Tested-by: Itaru Kitayam <itaru.kitayama@fujitsu.com>

Thanks,
Itaru.
>  - Use 0x180000 as the min GPA for page table pages on LoongArch, instead of
>    changing every other arch to use 0x200000. [Sashiko, Bibo]
>  - Opportunistically move the vGIC LPI stress test's global "gpa_base" variable
>    into setup_memslot(). [Sashiko]
> 
> v1: https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com
> 
> [*] https://lore.kernel.org/all/df86b5ccdbdafc3509d9538bd5e6796737bab2db.1781093720.git.ritesh.list@gmail.com
> 
> Nicholas Piggin (1):
>   KVM: selftests: Use goto instead of do-while to retry finding unused
>     physical pages
> 
> Sean Christopherson (19):
>   KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390
>     regions/segments
>   KVM: selftests: Use the common minimum GPA for page tables on
>     LoongArch
>   KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page
>     tables
>   KVM: selftests: Rename "num" param to "nr_pages" for physical page
>     allocators
>   KVM: selftests: Extend page allocator to support naturally aligned
>     allocations
>   KVM: selftests: Make the single-page allocator APIs static inline
>   KVM: selftests: Use the innermost page allocator API in the memslot
>     perf test
>   KVM: selftests: Use the innermost page allocator API in s390's IRQ
>     routing test
>   KVM: selftests: Add a wrapper API to allocate multiple page table
>     pages
>   KVM: selftests: Initialize vm->memslots[] with invalid memslots during
>     creation
>   KVM: selftests: Add APIs to override memory region types with custom
>     memslots
>   KVM: selftests: Add TEST_EXTRA memory region type for "special"
>     memslots
>   KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
>   KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
>   KVM: selftests: Use TEST_EXTRA region in set memory region test
>   KVM: selftests: Take the memory region type, not memslot, in page
>     allocators
>   KVM: selftests: Use TEST_ASSERT(), not assert(), in
>     vm_get_mem_region()
>   KVM: selftests: Automatically pick min_gpa for allocations based on
>     region type
>   KVM: selftests: Add arch hook to force page tables to be naturally
>     aligned
> 
>  .../selftests/kvm/arm64/page_fault_test.c     |  18 ++-
>  .../selftests/kvm/arm64/vgic_lpi_stress.c     |  21 ++-
>  .../testing/selftests/kvm/include/kvm_util.h  | 106 +++++++++++++--
>  tools/testing/selftests/kvm/include/x86/smm.h |   2 +-
>  .../selftests/kvm/lib/arm64/processor.c       |   4 +-
>  tools/testing/selftests/kvm/lib/kvm_util.c    | 127 +++++++++++-------
>  .../selftests/kvm/lib/loongarch/processor.c   |   5 +-
>  .../selftests/kvm/lib/riscv/processor.c       |   4 +-
>  .../selftests/kvm/lib/s390/processor.c        |   7 +-
>  .../testing/selftests/kvm/lib/x86/processor.c |  15 ++-
>  .../testing/selftests/kvm/memslot_perf_test.c |   3 +-
>  tools/testing/selftests/kvm/s390/cmma_test.c  |  19 +--
>  .../testing/selftests/kvm/s390/irq_routing.c  |   2 +-
>  .../selftests/kvm/set_memory_region_test.c    |   8 +-
>  .../x86/smaller_maxphyaddr_emulation_test.c   |   9 +-
>  15 files changed, 221 insertions(+), 129 deletions(-)
> 
> 
> base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
> -- 
> 2.55.0.966.g6673acef38-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
