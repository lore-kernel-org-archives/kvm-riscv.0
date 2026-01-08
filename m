Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAB7D1D493
	for <kvm-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 20:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TE/jEKCjdi4PkxQVJuwqoUWMNDYI5BgaQZN2Bxk3JHs=; b=UCzJbDlgp+ahoB
	BLQ1rJI77qMqqnC8LBxZ8qYQvm0cdv6/QgqR+o9/WiAfWoZ3HigerymgPJAy+DUUh8aloCCqT/FCJ
	mYihjcgs4wsF7+BBFfODH2OwaS1mpCCQgxzRKMy302X7brXAqzoRaXjzN7q+b4WT3cSEKlQKbdcTN
	wkRO7VdKhv7YJlBQmrwZU8Xt9tbYygkSLRplT+GPfK9e+FLEUA9kUKMQkMV28EFUmbqmwrLlWRHdR
	pkHuRPy645h9UNb6QRufmXOdXI3lWWbOwRFi0m9jmq193gZiXZXtlUnZZ/OYqTMaYYAuLk6pKHQx9
	ANVjtS+7/TrglgV7jG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwYa-00000000ooP-2B71;
	Thu, 08 Jan 2026 20:24:32 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwYV-00000000omt-2tjd
	for kvm-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 20:24:30 +0000
Date: Thu, 8 Jan 2026 20:24:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767903855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9zTxzfr7fY9EwCt7bK8R02rLevG6g750c5e86uBEiYU=;
	b=DyO/oISx5B9ukqXz/1g2P9vAexKComopUmmQDbNTVuah1ARLtdaBOvpYX6kGvTieHfpp9N
	iur5e+pcLYMO131gG1oLDBMvAzStRW6es6PTvrAFxZDxAFDtn5rTUslZIqDwYCA972DtcO
	6QqR7YxSgL/xWx6X8E/oDnVRZl0izlc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 21/21] KVM: selftests: Test READ=>WRITE dirty logging
 behavior for shadow MMU
Message-ID: <3xrew6ag7pefka7wava4z7ht54e6xlpwbywcm2ivsgnkdbahe4@yqzsaxnhedj7>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-22-seanjc@google.com>
 <t7dcszq3quhqprdcqz7keykxbmqf62pdelqrkeilpbmsrnuji5@a3lplybmlbwf>
 <aV_cLAlz4v1VOkDt@google.com>
 <gzyjze3wszmrwxdwnudij6nfqdxzihm37uappfqxorfjy5vatf@hffzaobbm3g7>
 <aV_3-lhnZ-MoKnjv@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aV_3-lhnZ-MoKnjv@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122427_893818_352002F3 
X-CRM114-Status: GOOD (  32.20  )
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

On Thu, Jan 08, 2026 at 10:31:22AM -0800, Sean Christopherson wrote:
> On Thu, Jan 08, 2026, Yosry Ahmed wrote:
> > On Thu, Jan 08, 2026 at 08:32:44AM -0800, Sean Christopherson wrote:
> > > On Fri, Jan 02, 2026, Yosry Ahmed wrote:
> > > diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> > > index ab869a98bbdc..fab18e9be66c 100644
> > > --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> > > +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> > > @@ -390,6 +390,13 @@ static uint64_t *__vm_get_page_table_entry(struct kvm_vm *vm,
> > >  	return virt_get_pte(vm, mmu, pte, vaddr, PG_LEVEL_4K);
> > >  }
> > >  
> > > +uint64_t *tdp_get_pte(struct kvm_vm *vm, uint64_t l2_gpa)
> > 
> > nested_paddr is the name used by tdp_map(), maybe use that here as well
> > (and in the header)?
> 
> Oh hell no :-)  nested_paddr is a terrible name (I was *very* tempted to change
> it on the fly, but restrained myself).  "nested" is far too ambigous, e.g. without
> nested virtualization, "nested_paddr" arguably refers to _L1_ physical addresses
> (SVM called 'em Nested Page Tables after all).

That's fair, I generally like consistency to a fault :)

> 
> > > +	int level = PG_LEVEL_4K;
> > > +
> > > +	return __vm_get_page_table_entry(vm, &vm->stage2_mmu, l2_gpa, &level);
> > > +}
> > > +
> > >  uint64_t *vm_get_pte(struct kvm_vm *vm, uint64_t vaddr)
> > >  {
> > >  	int level = PG_LEVEL_4K;
> > [..]
> > > @@ -133,35 +220,50 @@ static void test_dirty_log(bool nested_tdp)
> > >  
> > >  	/* Add an extra memory slot for testing dirty logging */
> > >  	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
> > > -				    GUEST_TEST_MEM,
> > > +				    TEST_MEM_BASE,
> > >  				    TEST_MEM_SLOT_INDEX,
> > >  				    TEST_MEM_PAGES,
> > >  				    KVM_MEM_LOG_DIRTY_PAGES);
> > >  
> > >  	/*
> > > -	 * Add an identity map for GVA range [0xc0000000, 0xc0002000).  This
> > > +	 * Add an identity map for GVA range [0xc0000000, 0xc0004000).  This
> > >  	 * affects both L1 and L2.  However...
> > >  	 */
> > > -	virt_map(vm, GUEST_TEST_MEM, GUEST_TEST_MEM, TEST_MEM_PAGES);
> > > +	virt_map(vm, TEST_MEM_BASE, TEST_MEM_BASE, TEST_MEM_PAGES);
> > >  
> > >  	/*
> > > -	 * ... pages in the L2 GPA range [0xc0001000, 0xc0003000) will map to
> > > -	 * 0xc0000000.
> > > +	 * ... pages in the L2 GPA ranges [0xc0001000, 0xc0002000) and
> > > +	 * [0xc0003000, 0xc0004000) will map to 0xc0000000 and 0xc0001000
> > > +	 * respectively.
> > 
> > Are these ranges correct? I thought L2 GPA range [0xc0002000,
> > 0xc0004000) will map to [0xc0000000, 0xc0002000).
> 
> Gah, no.  I looked at the comments after changing things around, but my eyes had
> glazed over by that point.
> 
> > Also, perhaps it's better to express those in terms of the macros?
> > 
> > L2 GPA range [TEST_MEM_ALIAS_BASE, TEST_MEM_ALIAS_BASE + 2*PAGE_SIZE)
> > will map to [TEST_MEM_BASE, TEST_MEM_BASE + 2*PAGE_SIZE)?
> 
> Hmm, no, at some point we need to concretely state the addresses, so that people
> debugging this know what to expect, i.e. don't have to manually compute the
> addresses from the macros in order to debug.

I was trying to avoid a situation where the comment gets out of sync
with the macros in a way that gets confusing. Maybe reference both if
it's not too verbose?

	/*
	 * ... pages in the L2 GPA range [0xc0002000, 0xc0004000) at
	 * TEST_MEM_ALIAS_BASE will map to [[0xc0000000, 0xc0002000) at
	 * TEST_MEM_BASE.
	 */

> 
> > >  	 *
> > >  	 * When TDP is disabled, the L2 guest code will still access the same L1
> > >  	 * GPAs as the TDP enabled case.
> > > +	 *
> > > +	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
> > > +	 * writable SPTEs when handling read faults (if the Dirty bit isn't
> > > +	 * set, KVM must intercept the next write to emulate the Dirty bit
> > > +	 * update).
> > >  	 */
> > >  	if (nested_tdp) {
> > > +		vm_vaddr_t gva0 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 0);
> > > +		vm_vaddr_t gva1 = TEST_GUEST_ADDR(TEST_MEM_ALIAS_BASE, 1);
> > 
> > Why are these gvas? Should these be L2 GPAs?
> 
> Pure oversight.
> 
> > Maybe 'uint64_t l2_gpa0' or 'uint64_t nested_paddr0'?
> 
> For better of worse, vm_paddr_t is the typedef in selftests.  Hmm, if/when we go
> with David M's proposal to switch to u64 (from e.g. uint64_t), it'd probably be
> a good time to switch to KVM's gva_t and gpa_t as well.

vm_paddr_t is fine too, I am just against using vm_vaddr_t. tdp_map()
takes in uint64_t for the GPAs, which is why I suggested uint64_t here.

> 
> > Also maybe add TEST_ALIAS_GPA() macro to keep things consistent?
> 
> Ya, then the line lengths are short enough to omit the local variables.  How's
> this look?

Looks good, thanks!

> 
> 	/*
> 	 * ... pages in the L2 GPA address range [0xc0002000, 0xc0004000) will
> 	 * map to [0xc0000000, 0xc0002000) when TDP is enabled (for L2).
> 	 *
> 	 * When TDP is disabled, the L2 guest code will still access the same L1
> 	 * GPAs as the TDP enabled case.
> 	 *
> 	 * Set the Dirty bit in the PTEs used by L2 so that KVM will create
> 	 * writable SPTEs when handling read faults (if the Dirty bit isn't
> 	 * set, KVM must intercept the next write to emulate the Dirty bit
> 	 * update).
> 	 */
> 	if (nested_tdp) {
> 		tdp_identity_map_default_memslots(vm);
> 		tdp_map(vm, TEST_ALIAS_GPA(0), TEST_GPA(0), PAGE_SIZE);
> 		tdp_map(vm, TEST_ALIAS_GPA(1), TEST_GPA(1), PAGE_SIZE);
> 
> 		*tdp_get_pte(vm, TEST_ALIAS_GPA(0)) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
> 		*tdp_get_pte(vm, TEST_ALIAS_GPA(1)) |= PTE_DIRTY_MASK(&vm->stage2_mmu);
> 	} else {
> 		*vm_get_pte(vm, TEST_GVA(0)) |= PTE_DIRTY_MASK(&vm->mmu);
> 		*vm_get_pte(vm, TEST_GVA(1)) |= PTE_DIRTY_MASK(&vm->mmu);
> 	}

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
