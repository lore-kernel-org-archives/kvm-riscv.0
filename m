Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E2BC624D6
	for <kvm-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 16:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QBWQaQY7mmHIqtbTs5ZQIT5gzfqXRRWRsSvVHI1pbCM=; b=dPOEuY4aiW2b6r
	5aegOX6QNjpg/0bCw8zItkRNpUr72kYkO05QBOmRXaGpJhddxyuJGEtRXmmKurMkRytuIH42vuWmo
	6cpFHo0Tqnjy8IuEPGbsNfFRvDodLVRvx9rTy1mK4Zfk1hkgiVU+m0m7qUHMawF2I2Ava9tRqrFYC
	t89B7wZ+keC5mtLfhFf3E4WcZw2LWugM9dM3UIq1KvnbBR+2zDMVrPty95FBQTiePeRDS17Ie06PJ
	RqOvbbWUKP8DMYDm/0C7mTSEit7RjHoe37CoQYTg0Cn9eZ8E0VD8lLBuiokk4qCgiYRy9R/003Xs7
	CdLFhtvFlrzIptv3HsjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1j-0000000FE6O-115X;
	Wed, 02 Sep 2026 16:41:31 +0000
Received: from mail-pl1-x647.google.com ([2607:f8b0:4864:20::647])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1o1e-0000000FE1g-1IzH
	for kvm-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 16:41:28 +0000
Received: by mail-pl1-x647.google.com with SMTP id d9443c01a7336-2cfa55c9430so12891975ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 02 Sep 2026 09:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788367285; x=1788972085; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=frOgBPC40pi3x0hlZEdVguNDXI4epigXANzoQJEvIq8=;
        b=UyUJVE8gObMLpCyIbjQ4gFZkjDJu6tCUccQ4ubTGcHN5q5TqV1AeuuU0d8gWqpDqpU
         0b1OJN6O38wNlRofUAx+R2znrjdaKGwrKGBRfWJlPst2Ta3Jsn0F4jW8Ojl8U7QBiekf
         TCTZ613oJ6NK4K2cXL3aflvIYOB/2P1fKnDNaksc7LILNgh9VEZ770n1g+8Q3XMvmrF3
         fenTs0oWXa0Zq9mdzXbiEFho+GJ7szyiHDiy7od09e0ZZjHWlDf6t/Xh8zEvA8801eEP
         rtUgtN6uMmHq5sscmWtbp1atAKgDGu53QqfYp6y83+drSU1y86BU2Knj+K+Klxj3/YMP
         /+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788367285; x=1788972085;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=frOgBPC40pi3x0hlZEdVguNDXI4epigXANzoQJEvIq8=;
        b=Buyzo59/F720YaHqVn8+NBrXVlsWDbpx6T8M8xDtuDjFOQjm15Vrlw/JNvjmoL8l8k
         YgDAOJCH6an4ctYlMhPncJPusTw9xMW/jMZR/2rSTkf6dSkVcZw14Sb2b2SNcjLE3pnu
         cKyfKVaEjVwMzHDje5gDjTC66eMYeP1FpAkXvxukYBl+HXf1+YBUOw6M11F/hxPz/Fho
         HXIGmusuMeuEp6DRj30M/OSSuW3jH/YpW0UyztkhrQQjXK5JJgdZLHsXOvqozZAUrLua
         2oT/x/6kFDSRkPkz6U7Jt6/zlVPzRk2WirkQAI1IwVGNlPlvMBj6WpfIoeLOyWjrFo8c
         jXTw==
X-Forwarded-Encrypted: i=1; AKwUvBxHa/sPCx4V1VbY+75uWCoJqeO+bgGtgTykbOohDZlxfP6mjtpYai45LHM3JHbKW5ui4NjMwq0GVEo=@lists.infradead.org
X-Gm-Message-State: AFuF++lOQKOSI/gokCUFTtyMPKPlwVhjNoPaccM3APNnZqgFc/t/5QlO
	PRgxAIo7AfbLPCTG0lcwz+yjjFkM5qq6p0HlBnoTjTimBKu0iLUbHeAd6bFjMlh3Ba1MBwtkU1w
	nEY1UqQ==
X-Received: from pjbbh12.prod.google.com ([2002:a17:90b:48c:b0:381:171e:961c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d4f:b0:37f:e1b6:4c7d
 with SMTP id 98e67ed59e1d1-39aedf1aec2mr9689222a91.6.1788367284482; Wed, 02
 Sep 2026 09:41:24 -0700 (PDT)
Date: Wed,  2 Sep 2026 09:41:03 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.966.g6673acef38-goog
Message-ID: <20260902164123.2546762-1-seanjc@google.com>
Subject: [PATCH v2 00/20] KVM: selftests: PPC pre-enabling
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Atish Patra <atish.patra@linux.dev>, 
	Alexandre Ghiti <alex@ghiti.fr>, David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Ritesh Harjani <ritesh.list@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_094126_353065_E4E5F877 
X-CRM114-Status: UNSURE (   9.99  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

This is a big pile of cleanups and refactoring to prepare for PPC support in
KVM selftests.  PPC has paging modes that require multi-page page tables, and
those page tables need to be naturally aligned.  The original proposal was to
plumb in an @align param to the page allocators[*], but I didn't love the idea
of adding another rarely used param to the allocators.

v2:
 - Collect tags. [Itaru, Bibo]
 - Use 0x180000 as the min GPA for page table pages on LoongArch, instead of
   changing every other arch to use 0x200000. [Sashiko, Bibo]
 - Opportunistically move the vGIC LPI stress test's global "gpa_base" variable
   into setup_memslot(). [Sashiko]

v1: https://lore.kernel.org/all/20260826230511.972824-1-seanjc@google.com

[*] https://lore.kernel.org/all/df86b5ccdbdafc3509d9538bd5e6796737bab2db.1781093720.git.ritesh.list@gmail.com

Nicholas Piggin (1):
  KVM: selftests: Use goto instead of do-while to retry finding unused
    physical pages

Sean Christopherson (19):
  KVM: selftests: Use MEM_REGION_PT memslot instead of '0' for s390
    regions/segments
  KVM: selftests: Use the common minimum GPA for page tables on
    LoongArch
  KVM: selftests: Use vm_alloc_page_table() to allocate LoongArch page
    tables
  KVM: selftests: Rename "num" param to "nr_pages" for physical page
    allocators
  KVM: selftests: Extend page allocator to support naturally aligned
    allocations
  KVM: selftests: Make the single-page allocator APIs static inline
  KVM: selftests: Use the innermost page allocator API in the memslot
    perf test
  KVM: selftests: Use the innermost page allocator API in s390's IRQ
    routing test
  KVM: selftests: Add a wrapper API to allocate multiple page table
    pages
  KVM: selftests: Initialize vm->memslots[] with invalid memslots during
    creation
  KVM: selftests: Add APIs to override memory region types with custom
    memslots
  KVM: selftests: Add TEST_EXTRA memory region type for "special"
    memslots
  KVM: selftests: Use TEST_EXTRA region in arm64's vGIC LPI stress test
  KVM: selftests: Use TEST_EXTRA region in x86's smaller MAXPHYADDR test
  KVM: selftests: Use TEST_EXTRA region in set memory region test
  KVM: selftests: Take the memory region type, not memslot, in page
    allocators
  KVM: selftests: Use TEST_ASSERT(), not assert(), in
    vm_get_mem_region()
  KVM: selftests: Automatically pick min_gpa for allocations based on
    region type
  KVM: selftests: Add arch hook to force page tables to be naturally
    aligned

 .../selftests/kvm/arm64/page_fault_test.c     |  18 ++-
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  21 ++-
 .../testing/selftests/kvm/include/kvm_util.h  | 106 +++++++++++++--
 tools/testing/selftests/kvm/include/x86/smm.h |   2 +-
 .../selftests/kvm/lib/arm64/processor.c       |   4 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 127 +++++++++++-------
 .../selftests/kvm/lib/loongarch/processor.c   |   5 +-
 .../selftests/kvm/lib/riscv/processor.c       |   4 +-
 .../selftests/kvm/lib/s390/processor.c        |   7 +-
 .../testing/selftests/kvm/lib/x86/processor.c |  15 ++-
 .../testing/selftests/kvm/memslot_perf_test.c |   3 +-
 tools/testing/selftests/kvm/s390/cmma_test.c  |  19 +--
 .../testing/selftests/kvm/s390/irq_routing.c  |   2 +-
 .../selftests/kvm/set_memory_region_test.c    |   8 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |   9 +-
 15 files changed, 221 insertions(+), 129 deletions(-)


base-commit: 76671054f9a1ff6abb976583cd8da37650acdc97
-- 
2.55.0.966.g6673acef38-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
