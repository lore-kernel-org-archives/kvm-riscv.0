Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0932BC71136
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 10:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Df2uHmV1pFgLT4Yoi2fn+k4NmZTvsrPBZZoOfbeMxpU=; b=f19QqXvdcgvoYh
	mhceks/Gta5vtFbVyQ2nfTA711Uqy6RVZIc6nStHgyiMTRYQwAIY//cJAXB59jbTQ80z/MNsZpJTA
	e1LrF/n9rt99UUlsmoZ3TfH8weXQ6/Xyf0cl+jCd3JnCmsmYoIKKHf3zQYo8cSyo/0vLqTSGJiEVU
	97A6h0WCy1DuYlAayGgGQqXU9tY0CeMSdztb3bI3dYPzYiNsoOGdR/9eNkPhNiVqGIbZ1U+QSTZxv
	PHZoq/lJMCoHnKeBkRgzpqwup9QoKnW5XaZZvBSKhCl89KcEXlXXXEMF9GbNPGG9PF72RjaOAvJ7F
	grUDNT1134vLHXt6R7aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPfQL-0000000D26R-36Qw;
	Thu, 12 Jun 2025 10:44:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPeS2-0000000CqHq-1ZQ7
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 09:42:27 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-450cfb79177so4013135e9.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 02:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749721345; x=1750326145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MGCZJff9QsWdyC25gI2iQ7ufzGiMMYlGPI7zLficnT8=;
        b=pOL/MxIk1X1V8W8m2+vN7e4Ht5eVLjLgmEagfAin+G/gQp9njZAuB1bvJAF2lD2IQ3
         bL7o6kkCFO/Kp35cx1LTYCaxKkIJp8AUgN05vM595s436hkFCjCkpNSE5bhYM2oBf3Oh
         2lT/upTGF5HmWLP9R6AiFr3l0amY/ORAFa7jv+w7bJl1yig5vSTD4rdPw7p2I5ZOl9yg
         76nne5+P076cGtmtecwPJ4C4IzEtVRok2TwRMQaz3CnYQgKUokiJnfeTGl9/SJ7CjLDR
         rDF4YsD3tv0sExz4y0LZW1M5aRbpf130G+DcYSFWiMJZ9g6KFmt9bsI/+5pnYGGGHZ97
         o4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749721345; x=1750326145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MGCZJff9QsWdyC25gI2iQ7ufzGiMMYlGPI7zLficnT8=;
        b=cJsnUJWjBLMqAHIfDnFOMl6IYlCfFJXI39lyXcjM+pLNbHm7kF/0HAKjcWoK2KNCHx
         M6ECo45xHX8bChHq8/x+zCgn2zVihbrcC30kO4mZ45tOUh0JSOSAg3R6a28KGTF59DPp
         viGw2BPUnbyWxC5aLPWpMy7hbCHY0p9sMR4CHAvgVmMiFzzqv+S3eIBs39m5pVei8G+F
         5NEyAT56lwiAxH4wtV0xBI0YWcg0/+3Pzya0bI0omUFXi2p+IOFUI6dbREpXSF3ccMex
         bqPArY/CxL7i29tP5P4iLOU1fK01BRq8ndaXb/2/gTwJmmcDZKkx/IyS06vBrDqdXe6B
         HXHw==
X-Forwarded-Encrypted: i=1; AJvYcCUS9MMe3I8wmV65RNe9ibI/hUwbfTtghz5EZjiwaX6dtgBXau9qamJG721FTTA+7ZvcK63qrJpiYs0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwO/+yH8REbUMBK+4aotuVlc4Su0bPpO4jwkOIXyGUUD+tA0Se4
	Auw6CVWr/PfIM3xBvFnyRx966E4usbfc+TzLIo+Du18Hrk22aSXZo+1yxHx+naMjgMg=
X-Gm-Gg: ASbGnctFMYM198fxBdybouR9J4s/SdiNoHxhVtBasTXs0pBNP4O/UmlDNvQyPweVXaD
	WuGMNWnfFz3IhZiKuK13hDo3f+MD48gmKctqINmd/S119/CuIEvVgI/bknI4yhWyBe3a4yySdEG
	p5LvmTpoz7dqmlVwhabBmKgCLtCpCawvprRvk2m1fjgyBt2MnghTjMD1TUU7ZAUDhlDmlrk6X/W
	8VxUiaTjHgAM5zPg/6jm+HGHqmYqh2BuWij+jm8r1c1qnDQn3/8XGXztM2vmAGE1OhLlWLOW5tp
	4ZLcVyw+l83dbS8XV08pTFgNrMmTxkqYLH4QTB90zyd/jcU6Kg==
X-Google-Smtp-Source: AGHT+IF5zKXW7+MBEotJUUCGt2uWsAMvwtWdDJrZZChMjo4YtbUSO3QK36jfNoOmtsRFwibuOJQU+w==
X-Received: by 2002:a05:600c:8b58:b0:450:d019:263 with SMTP id 5b1f17b1804b1-4532b9076acmr34955535e9.18.1749721344537;
        Thu, 12 Jun 2025 02:42:24 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561976048sm1449140f8f.8.2025.06.12.02.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 02:42:23 -0700 (PDT)
Date: Thu, 12 Jun 2025 11:42:23 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sean Christopherson <seanjc@google.com>
Cc: zhouquan@iscas.ac.cn, anup@brainfault.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Avoid re-acquiring memslot in
 kvm_riscv_gstage_map()
Message-ID: <20250612-70c2e573983d05c4fbc41102@orel>
References: <50989f0a02790f9d7dc804c2ade6387c4e7fbdbc.1749634392.git.zhouquan@iscas.ac.cn>
 <20250611-352bef23df9a4ec55fe5cb68@orel>
 <aEmsIOuz3bLwjBW_@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEmsIOuz3bLwjBW_@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_024226_425079_24B64042 
X-CRM114-Status: GOOD (  45.55  )
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

On Wed, Jun 11, 2025 at 09:17:36AM -0700, Sean Christopherson wrote:
> On Wed, Jun 11, 2025, Andrew Jones wrote:
> > On Wed, Jun 11, 2025 at 05:51:40PM +0800, zhouquan@iscas.ac.cn wrote:
> > > From: Quan Zhou <zhouquan@iscas.ac.cn>
> > > 
> > > The caller has already passed in the memslot, and there are
> > > two instances `{kvm_faultin_pfn/mark_page_dirty}` of retrieving
> > > the memslot again in `kvm_riscv_gstage_map`, we can replace them
> > > with `{__kvm_faultin_pfn/mark_page_dirty_in_slot}`.
> > > 
> > > Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> > > ---
> > >  arch/riscv/kvm/mmu.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> > > index 1087ea74567b..f9059dac3ba3 100644
> > > --- a/arch/riscv/kvm/mmu.c
> > > +++ b/arch/riscv/kvm/mmu.c
> > > @@ -648,7 +648,8 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> > >  		return -EFAULT;
> > >  	}
> > >  
> > > -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> > > +	hfn = __kvm_faultin_pfn(memslot, gfn, is_write ? FOLL_WRITE : 0,
> > > +				&writable, &page);
> > 
> > I think introducing another function with the following diff would be
> > better than duplicating the is_write to foll translation.
> 
> NAK, I don't want an explosion of wrapper APIs (especially with boolean params).
> 
> I 100% agree that it's mildly annoying to force arch code to do convert "write"
> to FOLL_WRITE, but that's a symptom of KVM not providing a common structure for
> passing page fault information.
> 
> What I want to get to is a set of APIs that look something the below (very off
> the cuff), not add more wrappers and put KVM back in a situation where there are
> a bajillion ways to do the same basic thing.
> 
> struct kvm_page_fault {
> 	const gpa_t addr;
> 	const bool exec;
> 	const bool write;
> 	const bool present;
> 
> 	gfn_t gfn;
> 
> 	/* The memslot containing gfn. May be NULL. */
> 	struct kvm_memory_slot *slot;
> 
> 	/* Outputs */
> 	unsigned long mmu_seq;
> 	kvm_pfn_t pfn;
> 	struct page *refcounted_page;
> 	bool map_writable;
> };
> 
> kvm_pfn_t __kvm_faultin_pfn(struct kvm_page_fault *fault, unsigned int flags)
> {
> 	struct kvm_follow_pfn kfp = {
> 		.slot = fault->slot,
> 		.gfn = fault->gfn,
> 		.flags = flags | fault->write ? FOLL_WRITE : 0,
> 		.map_writable = &fault->writable,
> 		.refcounted_page = &fault->refcounted_page,
> 	};
> 
> 	fault->writable = false;
> 	fault->refcounted_page = NULL;
> 
> 	return kvm_follow_pfn(&kfp);
> }
> EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
> 
> kvm_pfn_t kvm_faultin_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, bool write,
> 			  bool *writable, struct page **refcounted_page)
> {
> 	struct kvm_follow_pfn kfp = {
> 		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),,
> 		.gfn = gfn,
> 		.flags = write ? FOLL_WRITE : 0,
> 		.map_writable = writable,
> 		.refcounted_page = refcounted_page,
> 	};
> 
> 	if (WARN_ON_ONCE(!writable || !refcounted_page))
> 		return KVM_PFN_ERR_FAULT;
> 
> 	*writable = false;
> 	*refcounted_page = NULL;
> 
> 	return kvm_follow_pfn(&kfp);
> }
> EXPORT_SYMBOL_GPL(__kvm_faultin_pfn);
> 
> 
> To get things started, I proposed moving "struct kvm_page_fault" to common code
> so that it can be shared by x86 and arm64 as part of the KVM userfault series.
> But I'd be more than happy to acclerate the standardization of "struct kvm_page_fault"
> if we want to get there sooner than later.
> 
> [*] https://lore.kernel.org/all/aBqlkz1bqhu-9toV@google.com
> 
> In the meantime, RISC-V can start preparing for that future, and clean up its
> code in the process.
> 
> E.g. "fault_addr" should be "gpa_t", not "unsigned long".  If 32-bit RISC-V
> is strictly limited to 32-bit _physical_ addresses in the *architecture*, then
> gpa_t should probably be tweaked accordingly.

32-bit riscv supports 34-bit physical addresses, so fault_addr should
indeed be gpa_t.

> 
> And vma_pageshift should be "unsigned int", not "short".

Yes, particularly because huge_page_shift() returns unsigned int which may
be used to assign vma_pageshift.

> 
> Looks like y'all also have a bug where an -EEXIST will be returned to userspace,
> and will generate what's probably a spurious kvm_err() message.

On 32-bit riscv, due to losing the upper bits of the physical address? Or
is there yet another thing to fix?

> 
> E.g. in the short term:

The diff looks good to me, should I test and post it for you?

Thanks,
drew

> 
> ---
>  arch/riscv/include/asm/kvm_host.h |  5 ++--
>  arch/riscv/kvm/mmu.c              | 49 +++++++++++++++++++++----------
>  arch/riscv/kvm/vcpu_exit.c        | 40 +------------------------
>  3 files changed, 36 insertions(+), 58 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 85cfebc32e4c..84c5db715ba5 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -361,9 +361,8 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>  			     bool writable, bool in_atomic);
>  void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
>  			      unsigned long size);
> -int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> -			 struct kvm_memory_slot *memslot,
> -			 gpa_t gpa, unsigned long hva, bool is_write);
> +int kvm_riscv_gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				struct kvm_cpu_trap *trap);
>  int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
>  void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 1087ea74567b..3b0afc1c0832 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -586,22 +586,37 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  	return pte_young(ptep_get(ptep));
>  }
>  
> -int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> -			 struct kvm_memory_slot *memslot,
> -			 gpa_t gpa, unsigned long hva, bool is_write)
> +int kvm_riscv_gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
> +				struct kvm_cpu_trap *trap)
>  {
> -	int ret;
> -	kvm_pfn_t hfn;
> -	bool writable;
> -	short vma_pageshift;
> +
> +	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
> +	gpa_t gpa = (trap->htval << 2) | (trap->stval & 0x3);
>  	gfn_t gfn = gpa >> PAGE_SHIFT;
> -	struct vm_area_struct *vma;
> +	struct kvm_memory_slot *memslot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
> +	bool logging = memslot->dirty_bitmap && !(memslot->flags & KVM_MEM_READONLY);
> +	bool write = trap->scause == EXC_STORE_GUEST_PAGE_FAULT;
> +	bool read =  trap->scause == EXC_LOAD_GUEST_PAGE_FAULT;
> +	unsigned int flags = write ? FOLL_WRITE : 0;
> +	unsigned long hva, vma_pagesize, mmu_seq;
>  	struct kvm *kvm = vcpu->kvm;
> -	struct kvm_mmu_memory_cache *pcache = &vcpu->arch.mmu_page_cache;
> -	bool logging = (memslot->dirty_bitmap &&
> -			!(memslot->flags & KVM_MEM_READONLY)) ? true : false;
> -	unsigned long vma_pagesize, mmu_seq;
> +	unsigned int vma_pageshift;
> +	struct vm_area_struct *vma;
>  	struct page *page;
> +	kvm_pfn_t hfn;
> +	bool writable;
> +	int ret;
> +
> +	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
> +	if (kvm_is_error_hva(hva) || (write && !writable)) {
> +		if (read)
> +			return kvm_riscv_vcpu_mmio_load(vcpu, run, gpa,
> +							trap->htinst);
> +		if (write)
> +			return kvm_riscv_vcpu_mmio_store(vcpu, run, gpa,
> +							 trap->htinst);
> +		return -EOPNOTSUPP;
> +	}
>  
>  	/* We need minimum second+third level pages */
>  	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
> @@ -648,7 +663,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		return -EFAULT;
>  	}
>  
> -	hfn = kvm_faultin_pfn(vcpu, gfn, is_write, &writable, &page);
> +	hfn = __kvm_faultin_pfn(memslot, gfn, flags, &writable, &page);
>  	if (hfn == KVM_PFN_ERR_HWPOISON) {
>  		send_sig_mceerr(BUS_MCEERR_AR, (void __user *)hva,
>  				vma_pageshift, current);
> @@ -661,7 +676,7 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  	 * If logging is active then we allow writable pages only
>  	 * for write faults.
>  	 */
> -	if (logging && !is_write)
> +	if (logging && !write)
>  		writable = false;
>  
>  	spin_lock(&kvm->mmu_lock);
> @@ -677,14 +692,16 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>  		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
>  				      vma_pagesize, true, true);
>  	}
> +	if (ret == -EEXIST)
> +		ret = 0;
>  
>  	if (ret)
>  		kvm_err("Failed to map in G-stage\n");
>  
>  out_unlock:
> -	kvm_release_faultin_page(kvm, page, ret && ret != -EEXIST, writable);
> +	kvm_release_faultin_page(kvm, page, ret, writable);
>  	spin_unlock(&kvm->mmu_lock);
> -	return ret;
> +	return ret ? ret : 1;
>  }
>  
>  int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm)
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 6e0c18412795..6f07077068f6 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -10,44 +10,6 @@
>  #include <asm/csr.h>
>  #include <asm/insn-def.h>
>  
> -static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
> -			     struct kvm_cpu_trap *trap)
> -{
> -	struct kvm_memory_slot *memslot;
> -	unsigned long hva, fault_addr;
> -	bool writable;
> -	gfn_t gfn;
> -	int ret;
> -
> -	fault_addr = (trap->htval << 2) | (trap->stval & 0x3);
> -	gfn = fault_addr >> PAGE_SHIFT;
> -	memslot = gfn_to_memslot(vcpu->kvm, gfn);
> -	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);
> -
> -	if (kvm_is_error_hva(hva) ||
> -	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
> -		switch (trap->scause) {
> -		case EXC_LOAD_GUEST_PAGE_FAULT:
> -			return kvm_riscv_vcpu_mmio_load(vcpu, run,
> -							fault_addr,
> -							trap->htinst);
> -		case EXC_STORE_GUEST_PAGE_FAULT:
> -			return kvm_riscv_vcpu_mmio_store(vcpu, run,
> -							 fault_addr,
> -							 trap->htinst);
> -		default:
> -			return -EOPNOTSUPP;
> -		};
> -	}
> -
> -	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
> -		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
> -	if (ret < 0)
> -		return ret;
> -
> -	return 1;
> -}
> -
>  /**
>   * kvm_riscv_vcpu_unpriv_read -- Read machine word from Guest memory
>   *
> @@ -229,7 +191,7 @@ int kvm_riscv_vcpu_exit(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  	case EXC_LOAD_GUEST_PAGE_FAULT:
>  	case EXC_STORE_GUEST_PAGE_FAULT:
>  		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> -			ret = gstage_page_fault(vcpu, run, trap);
> +			ret = kvm_riscv_gstage_page_fault(vcpu, run, trap);
>  		break;
>  	case EXC_SUPERVISOR_SYSCALL:
>  		if (vcpu->arch.guest_context.hstatus & HSTATUS_SPV)
> 
> base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
> -- 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
