Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F610C5DF9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Aug 2026 04:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f6WJjCt9I9cpYO1ZkPxRnZkarkvcnNpxMfgB2ixjVfk=; b=LNX9u757DSFEoK
	Udg7SxEWOUVjdMMybvXt+ZcF8T4phRGOolOtd32n62gmvbyz9fR0Qd0P/XlbMtZt+B/rGusqoeaXj
	STCcrjyXZJfNmSHwC7ihWgsaFfzul7cU+dxi9FbE/M3Y4htOl9FighXiHGhURibVbxSt3CbdeTZDs
	CX113JUbgMDpIH6OhVceD3WK72LdTF7IuVQ9ut+uLlYo+zgz31cMKEnNfwyPHuE44ECfcenJ0/v+D
	Hh48C3MS43z1KzZSTaWdaJWBQT87pPZN1NuyuYooWpPlM+F+0W7CXYZZj12lPxVC6C+ipjMw7ydIX
	bx9Wk4naRdbXn4fkh1tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzRs4-00000003OMv-0wgq;
	Thu, 27 Aug 2026 04:37:48 +0000
Received: from esa1.hc1455-7.c3s2.iphmx.com ([207.54.90.47])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzRs1-00000003OMQ-0vXc;
	Thu, 27 Aug 2026 04:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1787805465; x=1819341465;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NjWJ6dMRbw0kkXr/0njtHxbP59W1uKKAQPA07UgnXFc=;
  b=hYgip6nrRvYeUhy69KTL28sF/XTrrCLSj/PdO1/IKraryWF/Be4rUkhE
   cp3Z9Oyt+MA1ZtMu1tvRRTZ1TPrUCrybOA4/XC0nB640wDfOJ6WRSkFx2
   nk03OvmcPW1KxUYxMqgfVjRtgfjViQSMZH1WTBAN3b4jjmJejRmn10bee
   i7dY6KqB9ymWfwuq1duMtonGLgZt9tZjxKLhyye5KgvLH1CzWoZ3SWWxB
   K6Pbbobh8Rr3wSywRAgD2f8RtIGCah10QB/E1GKyGuk5vPLOE4Ek2VTAH
   MI76knaUchPEDhnvzcsyVcYMpOzzku+mkD2/boDHZY3uq/mKXbdNS8bQz
   w==;
X-CSE-ConnectionGUID: g+v5ojJWRauKG9WKcj5ycA==
X-CSE-MsgGUID: sum/L88DQ5WDJtbTx5uB+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="252818242"
X-IronPort-AV: E=Sophos;i="6.25,246,1779116400"; 
   d="scan'208";a="252818242"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa1.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 13:37:40 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 0C57B820C30;
	Thu, 27 Aug 2026 04:37:40 +0000 (UTC)
Received: from az2uksmom4.o.css.fujitsu.com (unknown [10.151.22.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id BB59B18002ED;
	Thu, 27 Aug 2026 04:37:39 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom4.o.css.fujitsu.com (Postfix) with ESMTPS id 17B3F405EDE;
	Thu, 27 Aug 2026 04:37:20 +0000 (UTC)
Date: Thu, 27 Aug 2026 13:37:18 +0900
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
Subject: Re: [PATCH 13/20] KVM: selftests: Add TEST_EXTRA memory region type
 for "special" memslots
Message-ID: <ao--_gaqpfWir9v4@sm-arm-grace07>
References: <20260826230511.972824-1-seanjc@google.com>
 <20260826230511.972824-14-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260826230511.972824-14-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_213745_936076_6F5AED6B 
X-CRM114-Status: GOOD (  30.58  )
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

On Wed, Aug 26, 2026 at 04:05:04PM -0700, Sean Christopherson wrote:
> And another memory region type to deal with extra, one-off memory regions,
> and use the new type to manage x86's SMRAM memslot, as another step towards
> taking the region type instead of the raw memslot in the physical page
> allocator APIs.
> 
> Alternatively, SMRAM setup could simply use the quad-underscore API to
> continue passing in the memslot, but a surprising number of tests use an
> "extra" memslot for a variety of reasons.  I.e. allocating memory from one
> (and exactly one) extra memslot isn't all that rare, and so should be
> treated as normal behavior, not as something extraordinary, as
> quad-underscore functions typically suggest.
> 
> Opportunistically add comments to document the intended usage of the types,
> as the difference between DATA, TEST_DATA, and TEST_EXTRA in particular
> isn't exactly obvious.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../testing/selftests/kvm/include/kvm_util.h  | 37 ++++++++++++++++---
>  tools/testing/selftests/kvm/include/x86/smm.h |  2 +-
>  .../testing/selftests/kvm/lib/x86/processor.c |  7 ++--
>  3 files changed, 37 insertions(+), 9 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
> index 14f87c8a00ec..f4f4f360a10b 100644
> --- a/tools/testing/selftests/kvm/include/kvm_util.h
> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
> @@ -82,11 +82,43 @@ struct userspace_mem_regions {
>  	DECLARE_HASHTABLE(slot_hash, 9);
>  };
>  
> +/*
> + * Memory region types are passed to various page allocators to communicate
> + * various properties and metadata related to the allocation.  Note, the
> + * descriptions below described the primary usage of each type.  Individual
> + * tests may allocate memory for other purposes.
> + *
> + * By default, all regions are mapped to memslot '0'.  Tests can override the
> + * memslot for any or all types, e.g. so that all test data is allocated from a
> + * curated memslot.
> + */

This is helpful as it wasn't so obvious to me. Thanks for adding the comments 
on the default behaviour.

Thanks,
Itaru.

>  enum kvm_mem_region_type {
> +	/*
> +	 * The CODE region is used by lib/elf when loading the test's code into
> +	 * guest memory.
> +	 */
>  	MEM_REGION_CODE,
> +	/*
> +	 * The DATA region is used to allocate core data structures, e.g. vCPU
> +	 * stacks, VM exception tables, x86's TSS, etc.
> +	 */
>  	MEM_REGION_DATA,
> +	/*
> +	 * The PT region, a.k.a. Page Table region, is used to allocate page
> +	 * table pages.
> +	 */
>  	MEM_REGION_PT,
> +	/*
> +	 * The TEST_DATA region is used for allocating test data that is either
> +	 * test specific, and/or isn't considered a "core" data structure.
> +	 */
>  	MEM_REGION_TEST_DATA,
> +	/*
> +	 * The TEST_EXTRA region is for special snowflakes, where a test wants
> +	 * to create and use a one-off memslot, without impacting "normal" test
> +	 * data allocations.
> +	 */
> +	MEM_REGION_TEST_EXTRA,
>  	NR_MEM_REGIONS,
>  };
>  
> @@ -129,11 +161,6 @@ struct kvm_vm {
>  
>  	struct kvm_binary_stats stats;
>  
> -	/*
> -	 * KVM region slots. These are the default memslots used by page
> -	 * allocators, e.g., lib/elf uses the memslots[MEM_REGION_CODE]
> -	 * memslot.
> -	 */
>  	u32 memslots[NR_MEM_REGIONS];
>  };
>  
> diff --git a/tools/testing/selftests/kvm/include/x86/smm.h b/tools/testing/selftests/kvm/include/x86/smm.h
> index 2d1afa09819b..15faaa060126 100644
> --- a/tools/testing/selftests/kvm/include/x86/smm.h
> +++ b/tools/testing/selftests/kvm/include/x86/smm.h
> @@ -8,7 +8,7 @@
>  #define SMRAM_MEMSLOT	((1 << 16) | 1)
>  #define SMRAM_PAGES	(SMRAM_SIZE / PAGE_SIZE)
>  
> -void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
> +void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
>  		 const void *smi_handler, size_t handler_size);
>  
>  void inject_smi(struct kvm_vcpu *vcpu);
> diff --git a/tools/testing/selftests/kvm/lib/x86/processor.c b/tools/testing/selftests/kvm/lib/x86/processor.c
> index ea5fa59888af..b988eea373ad 100644
> --- a/tools/testing/selftests/kvm/lib/x86/processor.c
> +++ b/tools/testing/selftests/kvm/lib/x86/processor.c
> @@ -1468,11 +1468,12 @@ bool kvm_arch_has_default_irqchip(void)
>  	return true;
>  }
>  
> -void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, u64 smram_gpa,
> +void setup_smram(struct kvm_vm *vm, struct kvm_vcpu *vcpu, gpa_t smram_gpa,
>  		 const void *smi_handler, size_t handler_size)
>  {
> -	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS, smram_gpa,
> -				    SMRAM_MEMSLOT, SMRAM_PAGES, 0);
> +	vm_override_mem_region(vm, MEM_REGION_TEST_EXTRA, VM_MEM_SRC_ANONYMOUS,
> +			       smram_gpa, SMRAM_MEMSLOT, SMRAM_PAGES);
> +
>  	TEST_ASSERT(vm_phy_pages_alloc(vm, SMRAM_PAGES, smram_gpa,
>  				       SMRAM_MEMSLOT) == smram_gpa,
>  		    "Could not allocate guest physical addresses for SMRAM");
> -- 
> 2.55.0.887.g758fc8c411-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
