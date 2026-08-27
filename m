Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3A98C61DC2
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 08:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RoRPG0lL8C5sGi326rjtcHtWiahGNygnEdTEeeXvc54=; b=z9B1GBV0pl3+K/
	ypFK4DoPxJNIstZCobHpTKx/9+ufIxjK9yAUjJcO2yFBLXCDyvEasJ3O7emGEXiICpedL6uOLmO+y
	2KaqdZf0dqSvEMU47RtufngeDhNlndrILJJ0wV3gS3OuHdwBTbOt1Ib9HCOv6rT1QZWM61q/eqnWV
	9MXo9lLeakH2/Ww8BNzKbyFj+vCkWPF+F5lA5pFVMaA8PA2wc749cOAX+uuT8ytAEEAM4HPLGE2IR
	QEtflqV329/joPPA57Ha3fVxjnK8w1cjOt2tuZrP0jRMNwLRYY5SwShdWsp72gXOlN0LaVVHqXT/A
	+C5k2uiybg3A8UhvV/wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV9S-00000003bUb-1yYM;
	Thu, 27 Aug 2026 08:07:58 +0000
Received: from esa6.hc1455-7.c3s2.iphmx.com ([68.232.139.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzV9P-00000003bU8-2ToH;
	Thu, 27 Aug 2026 08:07:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787818079; x=1819354079;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HfubrEGF3eKsGUawx1MnfZr959FNLY03HrFmRB8niVo=;
  b=F8vKbfRlKUdYUy1yD3yC+fz+uRFTNyZabBy6Usz3m906YspLGD9wWBlO
   MQ/+F9fpKUcW3DBJEfxIpavLe83PsB0Aq7MHxEiS2C2fyk/v15yV2Liua
   ogrGDGhOK+G4i7sMrKDHVsFzLSo8X5qDw8pfOZVMOmoPhlab0uPG10DAJ
   IM5ROensBYZ5OzvtdvI6W4N91fMZ7XaYNQXq47Y1+RpAVup92Ud0ck4Cg
   jOfKYqSG6gNO6ejsjZwsn2z/6/x1suRINZRm3nfwm+Bu1l9YhW581oyeV
   zHTZ89JpMvL2WG9IT0/VBuqK609i6wsyGc6i08gQ/1H70JDQg8fZkoQSJ
   w==;
X-CSE-ConnectionGUID: PAlDcqwxQX+X7KzQzL59dg==
X-CSE-MsgGUID: NaBqTo7CR8mzmPAxpmHdAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="256543813"
X-IronPort-AV: E=Sophos;i="6.25,246,1779116400"; 
   d="scan'208";a="256543813"
Received: from gmgwnl01.global.fujitsu.com ([52.143.17.124])
  by esa6.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 17:07:56 +0900
Received: from az2nlsmgm3.fujitsu.com (unknown [10.150.26.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwnl01.global.fujitsu.com (Postfix) with ESMTPS id 6592640610A;
	Thu, 27 Aug 2026 08:07:52 +0000 (UTC)
Received: from az2uksmom3.o.css.fujitsu.com (unknown [10.151.22.205])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2nlsmgm3.fujitsu.com (Postfix) with ESMTPS id 19474180CCE9;
	Thu, 27 Aug 2026 08:07:52 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom3.o.css.fujitsu.com (Postfix) with ESMTPS id 670BD1004B16;
	Thu, 27 Aug 2026 08:07:43 +0000 (UTC)
Date: Thu, 27 Aug 2026 17:07:40 +0900
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
Subject: Re: [PATCH 00/20] KVM: selftests: PPC pre-enabling
Message-ID: <ao_wTAq6U2bvWzgu@sm-arm-grace07>
References: <20260826230511.972824-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826230511.972824-1-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_010756_016938_154C4B8E 
X-CRM114-Status: GOOD (  21.36  )
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

On Wed, Aug 26, 2026 at 04:04:51PM -0700, Sean Christopherson wrote:
> This is a big pile of cleanups and refactoring to prepare for PPC support in
> KVM selftests.  PPC has paging modes that require multi-page page tables, and
> those page tables need to be naturally aligned.  The original proposal was to
> plumb in an @align param to the page allocators[*], but I didn't love the idea
> of adding another rarely used param to the allocators.
> 
> Reworking the APIs to take a region type requires a fair bit of churn, and was
> more painful than expected as I didn't realize just how many one-off tests did
> weird things, but overall I think it's worth it?  If only to keep cutting down
> on the use of magic memslot numbers in tests.
> 
> This needs explicit testing on s390.  I tested on arm64 and x86, and given the
> number of failures I had to wade through, I wouldn't be at all suprised if I
> broke something subtle on s390 as well.
> 
> I'm less concerned about RISC-V and LoongArch as they don't have any custom
> tests that are affected (which is where I got burned).

I ran kvm_page_table_test with this series applied on Grace CPUs.

Passes across all the arm64 guest modes supported.

Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>

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
>   KVM: selftests: Bump the minimum GPA for page tables to 0x200000
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
>  .../selftests/kvm/arm64/vgic_lpi_stress.c     |  19 ++-
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
>  15 files changed, 219 insertions(+), 129 deletions(-)
> 
> 
> base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
> -- 
> 2.55.0.887.g758fc8c411-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
