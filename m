Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 074A9C88E40
	for <kvm-riscv@archiver.kernel.org>; Fri, 11 Sep 2026 02:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z7VCWNoFx/X0fJJYP5sDxaVTlWGWF+vkLOScchNz9WU=; b=M4xf9HR+qaz2FY
	bxyxMAlC7qjKuBx2kOizFKZzuSCzkKr5kp3EzhTKv5f4vixfNLnVim9n/orFm4e2G4BrhoYPSv2OC
	EAeFyZnKynmzJyEtGQYKoevaXDc238pkRfBZmdZL+XI9GOML30FlXj5nqTjrmFVaZFZk2vdQYWOG1
	qtyGTE5xGuu8t6nFw/Dq4HCEpuCNzMJPQhhWLdBDtniO9mrYD7GNf5Ns9n7l20YYlN1VfWNsh0RC1
	/MZYiUephzPV8xTU+s5bDy30VEaR2B04KBXGmpq3CubDAWlUGp5BZbYOGQUNxFUSMK0zGoIgvOYa+
	jZUL7apNGSO08bZM6cvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qh6-0000000Fgl1-2GMm;
	Fri, 11 Sep 2026 02:08:48 +0000
Received: from esa12.hc1455-7.c3s2.iphmx.com ([139.138.37.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4qh3-0000000Fgk8-171I;
	Fri, 11 Sep 2026 02:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1789092525; x=1820628525;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AaXl/L7lLDt00UQl/RtkISnRqi4t27mRDo6Utp1VaFI=;
  b=oNtLqRpJK73GqGvX35mLQdFJ1qg7ufjUdpO704FNSn2jSnw0hUiAUt6h
   GUoyW4U5rh1t8a8ci5vfcL/HsDJyEAbu5WwPBWT6Rv0OJ1lB/MlZcSdxb
   MqQSCVqMWofEvEnn1/Hc2+8AOuvlXAhq8b6tDU5yxzJXL79u3zXW38eCN
   LaofY9uhlhEaG0x0nd0CluzJj27MSbmmqRsRP3eW3J++zh+wYY0lFGA7M
   BzxFGkbgkjjkrVea46VnfouegPa0HuKz2a1e3ec9/opP8lBB1SnpAz79x
   o7NUObI/QpZLqHlglxwNQiv7tBxT/Dl70U8WH8bvhHmamyufQGD4dZVZC
   g==;
X-CSE-ConnectionGUID: BBEbD1LxSieqD4MfS6ffeQ==
X-CSE-MsgGUID: 3IMWLGJpRVaF9ufQFFAOQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11901"; a="232394148"
X-IronPort-AV: E=Sophos;i="6.27,96,1786978800"; 
   d="scan'208";a="232394148"
Received: from gmgwuk01.global.fujitsu.com ([172.187.114.235])
  by esa12.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 11:08:41 +0900
Received: from az2uksmgm2.o.css.fujitsu.com (unknown [10.151.22.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gmgwuk01.global.fujitsu.com (Postfix) with ESMTPS id 05511821129;
	Fri, 11 Sep 2026 02:08:41 +0000 (UTC)
Received: from az2uksmom2.o.css.fujitsu.com (unknown [10.151.22.203])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmgm2.o.css.fujitsu.com (Postfix) with ESMTPS id AF3391800254;
	Fri, 11 Sep 2026 02:08:40 +0000 (UTC)
Received: from sm-arm-grace07 (unknown [10.124.178.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by az2uksmom2.o.css.fujitsu.com (Postfix) with ESMTPS id 7F15A14000E9;
	Fri, 11 Sep 2026 02:08:31 +0000 (UTC)
Date: Fri, 11 Sep 2026 11:08:28 +0900
From: Itaru Kitayama <itaru.kitayama@fujitsu.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
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
	linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory
 region types with custom memslots
Message-ID: <aqNinDKVoKUSNwXe@sm-arm-grace07>
References: <20260902164123.2546762-1-seanjc@google.com>
 <20260902164123.2546762-13-seanjc@google.com>
 <5x0d1hj1.ritesh.list@gmail.com>
 <aqLZrk6m3NgugzBU@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aqLZrk6m3NgugzBU@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_190845_796279_89BE3361 
X-CRM114-Status: GOOD (  20.04  )
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

On Thu, Sep 10, 2026 at 09:24:14AM -0700, Sean Christopherson wrote:
> On Thu, Sep 10, 2026, Ritesh Harjani wrote:
[...]
> > May I suggest few changes in the naming of these APIs:
> > 
> > static inline void vm_override_mem_region(struct kvm_vm *vm,
> > 					      enum kvm_mem_region_type type,
> > 					      u32 slot)
> > {
> > 	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
> > 		    "Memory region type '%u' was already overridden with slot=%u",
> > 		    type, vm->memslots[type]);
> > 
> > 	vm->memslots[type] = slot;
> > }
> > 
> > static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
> > 					    enum kvm_mem_region_type type,
> > 					    enum vm_mem_backing_src_type src_type,
> > 					    gpa_t gpa, u32 slot, u64 npages,
> > 					    u32 flags)
> > {
> > 	vm_override_mem_region(vm, type, slot);
> > 	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
> > }
> > 
> > static inline void vm_override_add_mem_region(struct kvm_vm *vm,
> > 					  enum kvm_mem_region_type type,
> > 					  enum vm_mem_backing_src_type src_type,
> > 					  gpa_t gpa, u32 slot, u64 npages)
> > {
> > 	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
> > }
> > 
> > Those "_add_" and "_flags" in the function names easily gives away
> > the difference in the APIs, rather than differentiating via "__".
> 
> I am strongly against postfixes like "_flags".  We do use postfixes for the VM
> creation APIs, e.g. vm_create_barebones(), vm_create_with_vcpus(), etc., but only
> because there are so many possible combinations that differentiating through
> underscores is completely infeasible (unless we forced callers to regurgitate
> huge amounts of boilerplace and/or had an absurd number of params), and because
> the collection of APIs is tree-like, as opposed to a single linear chain of APIs.
> 
> For this, there is a much more finite set of possibilities, and the set of APIs
> is a direct liner chain (no underscores => __ => ____).
> 
> I agree that not capturing that {,__}vm_override_mem_region() adds a userspace
> memory region isn't ideal, but due to the term "memory region" already being
> somewhat overloaded, I don't want to have "add" in the name as I think that will
> make it harder to differentiate between the "enum kvm_mem_region_type" APIs and
> the "userspace memory region" APIs.
> 
> And IMO it's totally fine for a function name to express what the API does at a
> higher level, without capturing the exact operations in explicit detail.  E.g.
> __vm_create() (and even ____vm_create()) obviously does a lot more than literally
> KVM_VM_CREATE.

As I have been looking at the direct liner chain of vm_create() for some
time, I agree with Sean. To create with a non-default guest mode ID, we have to
start with those underscored functions, but I still prefer short function
names.

Thanks,
Itaru.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
