Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8701D1D478
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 18:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CRVYBmX1kiK/Gy5t9UJa6hBaffCTGuT7RbJMbt4eCVc=; b=V429ROZRN+eS1iN60Ib27YtqnA
	p8ByVN+e8U094Q9XThrsul6LloVP6/F9t3yH0v/xRO3fbAYh+Xj43Ge+upN0Thqtow/V9SsksQruK
	WOMSmPrUpotzmQAEC0ckIwFTnFjyQmWvVFjpQs5YyQInQm3ZfNMjt9CZaDE5WkHs83ZHbzh2DgrMr
	0kOVxQND3VoDunWwOkBZglKc0vPk9/ZASPsFhF24EmuNdXiwbKvFI2R3jS5gIWxb740HdX3bS3AyJ
	/N80NUW+BD0yJpHBFhQg0Ow9K/B6cpVL8fEVeawgxfrHLqISw9ykbztt6Wiet1kSGWi+RmvAj63XC
	qKfcvdZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdunA-00000000ckx-2Ffo;
	Thu, 08 Jan 2026 18:31:28 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdun7-00000000cis-1hOW
	for kvm-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 18:31:27 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-34c704d5d15so5822629a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 08 Jan 2026 10:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767897084; x=1768501884; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=nY/l54WU76DsZYqDI43j/uSoqA/+4oD9QHehzkck2fM=;
        b=S9aF+3xgWRZEfwTrAgpPFdaszrRUGw/zVqcxuyT+3NL0/tyZBVD+fZOmAACeaGplK6
         Ta73qJ2R3PFujtyc0Ot0izqgYPv/5e3IlCBen8ZmJlJW3ReJdybHg/TgrKQt5mvSsW0z
         UBJm2GJbDaLoib0R5yHqc4/882WvlJ1sOJ7ooS0WmHUlbnCI8WG2a/Q6yZ5gBOWnSxU8
         68Tb/X9SfDNUtQRJ9NmaCREywc8Pb5ossyXQaBts9Nr8TliCAbDhbPaS4QM8pznLGAX1
         tAtxsPRs6jfwtJzENLNHrWG8lnfkbGOKRuSN/7V1XeuniYlYCI34UrSz0iUDotGzfbDZ
         uHbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767897084; x=1768501884;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nY/l54WU76DsZYqDI43j/uSoqA/+4oD9QHehzkck2fM=;
        b=T9RH5qIj4IWtfSWh9ECzRHXQ/Uzd60/6xWSiSRjzvrSZPWFyzGV9yXhe6ubQFD3c9S
         UmvAfhuQJ4jO3e+Z9RwZ6/iUBwYCKuXwExwF7dtkRFC0q0Mrra6IBOVIzjhdJmsMel7N
         wIBDV+L3jHeGk9VGxx4o+GsHkaTnNaPsx96uvcjq9RreElxVo4A1a7JcbVXzSHKvFeXM
         8DfBI86PNKx5KCtGFha0IUxvaWIRte7XUR60um9K3wUBj2sIbPSaJzO/68BrlnU5Ig0k
         QpfxXi/+TH8Fu+PpgtIiGBYyJVBH/Yff+V7FbrhYoBXz7u+qyz6NGj+aE9pLjktJCesX
         QGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn1Wf+Z0k6MJLYolxg1vaNZ3kx9a/YZ0WE+SVSEcwthsSSxYSsBFtJgDXmciphhNpSXFqc2Qg8Thw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6He3ReiOlKqPaWzSoaNEPP7wr+FJYBRN799SeByZbDHiTFY1q
	K2I+QRvVUg+SISf0e+t+G6C+pK9CLTNzyfp23Zi0Uvvq0TJ220LQ7aQpRYTGw6v98HVybA8tU5h
	0e5RPOg==
X-Google-Smtp-Source: AGHT+IHEOdI4r0O9pcHM188bqvdusRA2ROI4oJ6wpZajhgwchTGU2kxOjQW3XQ2z18n6bt3vYCQzcYAxHoc=
X-Received: from pjrx16.prod.google.com ([2002:a17:90a:bc90:b0:34c:6f7a:2ab8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c09:b0:349:2154:eef4
 with SMTP id 98e67ed59e1d1-34f68b83d71mr6555128a91.5.1767897083980; Thu, 08
 Jan 2026 10:31:23 -0800 (PST)
Date: Thu, 8 Jan 2026 10:31:22 -0800
In-Reply-To: <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
Mime-Version: 1.0
References: <20251230230150.4150236-1-seanjc@google.com> <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com> <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
Message-ID: <aV_3-lhnZ-MoKnjv@google.com>
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
From: Sean Christopherson <seanjc@google.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_103125_441238_113ACE23 
X-CRM114-Status: GOOD (  26.30  )
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

On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> On Thu, Jan 08, 2026 at 08:32:44AM -0800, Sean Christopherson wrote:
> > On Fri, Jan 02, 2026, Yosry Ahmed wrote:
> > diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> > index ab869a98bbdc..fab18e9be66c 100644
> > --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> > +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> > @@ -390,6 +390,13 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
> >  	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
> >  }
> >  
> > +uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa)
> 
> nested_paddr is the name used by tdp_map(), maybe use that here as well
> (and in the header)?

Oh hell no :-)  nested_paddr is a terrible name (I was *very* tempted to change
it on the fly, but restrained myself).  "nested" is far too ambigous, e.g. without
nested virtualization, "nested_paddr" arguably refers to _L1_ physical addresses
(SVM called 'em Nested Page Tables after all).

> > +	int level = PG_LEVEL_4K;
> > +
> > +	return __vm_get_page_table_entry(vm, &vm->stage2_mmu, l2_gpa, &level);
> > +}
> > +
> >  uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
> >  {
> >  	int level = PG_LEVEL_4K;
> [..]
> > @@ -133,35 +220,50 @@ static void test_dirty_log(bool nested_tdp)
> >  
> >  	/* Add an extra memory slot for testing dirty logging */
> >  	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> > -				    GUEST_TEST_MEM,
> > +				    TEST_MEM_BASE,
> >  				    TEST_MEM_SLOT_INDEX,
> >  				    TEST_MEM_PAGES,
> >  				    KVM_MEM_LOG_DIRTY_PAGES);
> >  
> >  	/*
> > -	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
> > +	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
> >  	 * affects both L1 and L2.  However...
> >  	 */
> > -	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
> > +	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
> >  
> >  	/*
> > -	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
> > -	 * 0xc0000000.
> > +	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
> > +	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
> > +	 * respectively.
> 
> Are these ranges correct? I thought L2 GPA range [0xc0002000,
> 0xc0004000) will map to [0xc0000000, 0xc0002000).

Gah, no.  I looked at the comments after changing things around, but my eyes had
glazed over by that point.

> Also, perhaps it's better to express those in terms of the macros?
> 
> L2 GPA range [TEST_MEM_ALIAS_BASE, TEST_MEM_ALIAS_BASE + 2*PAGE_SIZE)
> will map to [TEST_MEM_BASE, TEST_MEM_BASE + 2*PAGE_SIZE)?

Hmm, no, at some point we need to concretely state the addresses, so that people
debugging this know what to expect, i.e. don't have to manually compute the
addresses from the macros in order to debug.

> >  	 *
> >  	 * When TDP is disabled, the L2 guest code will still access the same L1
> >  	 * GPAs as the TDP enabled case.
> > +	 *
> > +	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
> > +	 * writable SPTEs when handling read faults (if the Dirty bit isn't
> > +	 * set, KVM must intercept the next write to emulate the Dirty bit
> > +	 * update).
> >  	 */
> >  	if (nested_tdp) {
> > +		vm_vaddr_t gva0 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 0);
> > +		vm_vaddr_t gva1 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 1);
> 
> Why are these gvas? Should these be L2 GPAs?

Pure oversight.

> Maybe 'uint64_t l2_gpa0' or 'uint64_t nested_paddr0'?

For better of worse, vm_paddr_t is the typedef in selftests.  Hmm, if/when we go
with David M's proposal to switch to u64 (from e.g. uint64_t), it'd probably be
a good time to switch to KVM's gva_t and gpa_t as well.

> Also maybe add TEST_ALIAS_GPA() macro to keep things consistent?

Ya, then the line lengths are short enough to omit the local variables.  How's
this look?

	/*
	 * ... pages in the L2 GPA address range [0xc0002000, 0xc0004000) will
	 * map to [0xc0000000, 0xc0002000) when TDP is enabled (for L2).
	 *
	 * When TDP is disabled, the L2 guest code will still access the same L1
	 * GPAs as the TDP enabled case.
	 *
	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
	 * writable SPTEs when handling read faults (if the Dirty bit isn't
	 * set, KVM must intercept the next write to emulate the Dirty bit
	 * update).
	 */
	if (nested_tdp) {
		tdp_identity_map_default_memslots(vm);
		tdp_map(vm, TEST_ALIAS_GPA(0), TEST_GPA(0), PAGE_SIZE);
		tdp_map(vm, TEST_ALIAS_GPA(1), TEST_GPA(1), PAGE_SIZE);

		*tdp_get_pte(vm, TEST_ALIAS_GPA(0)) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
		*tdp_get_pte(vm, TEST_ALIAS_GPA(1)) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
	} else {
		*vm_get_pte(vm, TEST_GVA(0)) |= PTE_DIRTY_MASK(&vm->mmu);
		*vm_get_pte(vm, TEST_GVA(1)) |= PTE_DIRTY_MASK(&vm->mmu);
	}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
