Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03945C79FBF
	for <kvm-riscv@archiver.kernel.org>; Thu, 10 Sep 2026 16:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RvtgU0q5aBeI+2olzDpAuclMGap08rLce2kpbWlY5e4=; b=j9nWYzRCdSurlmV+GfE+I43dgN
	E3i+yVRFzf363vCTXvGRAj8ku7jHubCQmPZC9nRpN/VRG6d5EEOCma+9VBXvQ8xPG68jpSGxcWEX4
	oOixkgV+xqpbkkdaHrsHNfweFFUQ8CXUzoPX5Le6yUMWRiK7DkmT1+NJ+ttnIwQTdeGexIEeJpVzZ
	a6g3Eu5ujqS1upW1bO/F2uqGfmBP9BzRPBECOmkFpqAbczr8FvfJJwrj4ENHoLtdHKTR7pCCEB6aN
	z4meS5WIjRf9vsGUnybyM5P3gLzzjHSbRwMliAvh4zbLJhQ3D/bO26fpbW8Cr+1qy6K8wVJAkxePe
	ZSAKTWUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hZW-0000000EwFy-2gkg;
	Thu, 10 Sep 2026 16:24:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hZV-0000000EwEq-0Hsb
	for kvm-riscv@bombadil.infradead.org;
	Thu, 10 Sep 2026 16:24:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=; b=RpyRAKJGZPZb/jT6kB2JwxteW3
	w2JjUx5EkBqlg8e2BVoZw8M2Bqi2k3r2E8M3LDK56pcOw22HBmXMds7MJgnrVaRJp2Auf+LjcEWYu
	G+QTffefgpSnfunVtDs8dr7hPIdwotzP5Rda8TI6zqVNc+J+vJu1PHri3lSLzUj8UUbbezeMGAAkT
	dvlgBGHUZn1h+5nCThH7KF1blBYapW7Z0uvG08JhMFAufSGsj2GF3TG0dO4eSc7CHLqx6MXJD6cQ2
	lcRabrrGEg10txM9Ia8QntDiTnCtp/8DxGSbYq++b92z/zAsC+q3VPykuGdqLa/BAIc93/NtKw8s9
	fd1eMLiQ==;
Received: from mail-pj1-x1046.google.com ([2607:f8b0:4864:20::1046])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4hZS-00000002jvA-0l3R
	for kvm-riscv@lists.infradead.org;
	Thu, 10 Sep 2026 16:24:19 +0000
Received: by mail-pj1-x1046.google.com with SMTP id 98e67ed59e1d1-396638f9a18so7876642a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 10 Sep 2026 09:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057456; x=1789662256; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=;
        b=YklsOATpwj9/qVdOgdOloV7SH9awByVgDf02RzpTZqXLWUtAsABHSrfZ+qdHmAoYGA
         0eC7dcxzP+i8kprS3JX7vOJXOehnncHPpZ71Du2r2/xdBvpn6F+yPF1Y/sgSrh0VtRSG
         9uNd9cjbWkvfGopIb4UEHmXCwfUYh8WLJdUHCG3c0bnDAxjy3ZefiqBqAAM/nlsU4yav
         /1AzNsRpudPZ+A1lZuz9ka1OUMQ099qAxlMOskJArxMmsD4IMLcKPloTHejFIp5l13+E
         6JpXa0xY18s2+sq0XKvcV1IjbSNnucLfgH3vTfPeSzLehYaxjCk7i/1eYPyZ0PUiNLRz
         E7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057456; x=1789662256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=;
        b=c6uCnFuBGAWNZfdGXrGZuORZmJD4shAE32T00sQOdX/EU1FfWlxiMHJ03mpxqltY3N
         tVJ4T7+6ASUIXH0TeqSJeNpj51XNmTC5aNy+3VdryVNeyyZm2EeuuRlZXPAeJfJlDWgo
         g8o2sDWQDfAEEuPn9HFOBaYOdUqmkmv7+YXyMO6ny+Jk9wGtPYl8xq250cOAcUY3w2ZW
         PCjskf2QxcfxUJlDQwi+f3WhRA1l3PycmD/oAJwJvMNKZfyHF0tak5Mf0feb9t052nH1
         q54wLS/4GsddpgDXPHF0KkWljdxbIkg002SFk3IznfHctBppYBlSr0FarzTVbogvnsaJ
         slKA==
X-Forwarded-Encrypted: i=1; AKwUvBy1DIB0acKjpQ/Px3UxgQPuNQJ2nD4a580pXBcfiepscYTGqJZMd+uSpJKimdpkFp3rmr/B3parwGo=@lists.infradead.org
X-Gm-Message-State: AFuF++kCkaxfT9erND5xHll2BZD72Xdek+o9h9yPw4DvXLaPKY4rtkey
	rW9eGCPS7epXjSaDAAGYHZInpJUKwus1rMh5O8TV+paKX5tKv5nZI0Z64on4UyVlrDgjsL5RMto
	5BIFoAg==
X-Received: from pjye16.prod.google.com ([2002:a17:90a:ee10:b0:39b:9a0e:78cd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d644:b0:398:9c00:29ec
 with SMTP id 98e67ed59e1d1-39b26245cfcmr66792937a91.20.1789057455320; Thu, 10
 Sep 2026 09:24:15 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:24:14 -0700
In-Reply-To: <5x0d1hj1.ritesh.list@gmail.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-13-seanjc@google.com>
 <5x0d1hj1.ritesh.list@gmail.com>
Message-ID: <aqLZrk6m3NgugzBU@google.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory
 region types with custom memslots
From: Sean Christopherson <seanjc@google.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_172418_374080_D98C3F3A 
X-CRM114-Status: GOOD (  17.87  )
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

On Thu, Sep 10, 2026, Ritesh Harjani wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add and use APIs to override memory region types instead of open coding the
> > logic in tests, partly to dedup test code, but mostly to add some amount of
> > protection against conflicting overrides.  This will allow converting more
> > tests to override memory regions without taking on too much risk of bugs in
> > the long term, e.g. due to silently overriding a region multiple times.
> >
> > Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> > create_main_memslot() to avoid filling all memslots in anticipation of
> > adding an "extra" memslot that is for test use and *only* test use, i.e.
> > shouldn't be configured by core library code.
> >
> > Converting tests to overriding memory regions will allow taking the region
> > type instead of the raw memslot in the physical page allocator APIs.
> >
> 
> May I suggest few changes in the naming of these APIs:
> 
> static inline void vm_override_mem_region(struct kvm_vm *vm,
> 					      enum kvm_mem_region_type type,
> 					      u32 slot)
> {
> 	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
> 		    "Memory region type '%u' was already overridden with slot=%u",
> 		    type, vm->memslots[type]);
> 
> 	vm->memslots[type] = slot;
> }
> 
> static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
> 					    enum kvm_mem_region_type type,
> 					    enum vm_mem_backing_src_type src_type,
> 					    gpa_t gpa, u32 slot, u64 npages,
> 					    u32 flags)
> {
> 	vm_override_mem_region(vm, type, slot);
> 	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
> }
> 
> static inline void vm_override_add_mem_region(struct kvm_vm *vm,
> 					  enum kvm_mem_region_type type,
> 					  enum vm_mem_backing_src_type src_type,
> 					  gpa_t gpa, u32 slot, u64 npages)
> {
> 	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
> }
> 
> Those "_add_" and "_flags" in the function names easily gives away
> the difference in the APIs, rather than differentiating via "__".

I am strongly against postfixes like "_flags".  We do use postfixes for the VM
creation APIs, e.g. vm_create_barebones(), vm_create_with_vcpus(), etc., but only
because there are so many possible combinations that differentiating through
underscores is completely infeasible (unless we forced callers to regurgitate
huge amounts of boilerplace and/or had an absurd number of params), and because
the collection of APIs is tree-like, as opposed to a single linear chain of APIs.

For this, there is a much more finite set of possibilities, and the set of APIs
is a direct liner chain (no underscores => __ => ____).

I agree that not capturing that {,__}vm_override_mem_region() adds a userspace
memory region isn't ideal, but due to the term "memory region" already being
somewhat overloaded, I don't want to have "add" in the name as I think that will
make it harder to differentiate between the "enum kvm_mem_region_type" APIs and
the "userspace memory region" APIs.

And IMO it's totally fine for a function name to express what the API does at a
higher level, without capturing the exact operations in explicit detail.  E.g.
__vm_create() (and even ____vm_create()) obviously does a lot more than literally
KVM_VM_CREATE.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
