Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22FB7C7115B
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 07:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NySeeN8X82i5OE8xUI7bEyEBuDYxJdy8ELh9fSJrm6M=; b=Hwk1qDp72oknMy
	8uor8qVcFuSx7GWSN/yVfX/7PiN0OhmYV5upc5Hu9WG3q7dqvamjtsfbQojD46hx/zEiMadTXwV07
	iH0/zFSM75H7zzgWzwsYwsUu0+Of0eHC+7SvOgD6I1cKDjbCvxr6W5cLuf9ystygjlJzLXQpFj0Z3
	mE8USJHL0DdoiSPRS3a9K8q1emFMcs+jVbi3mlcR2l6c8Cuy3YmBImqV40RFtbi3q/DB9M6I68PaV
	tHpRTv+gHe1shkuvHUt0nb/iQOOutu6bqSyYVeSGWH44Fjwqdl3YKi1GSuP79UwtuszYIhKTPpNpt
	EY5PJ+QLMFwF9yhx4bkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnLP-00000009Ip8-2qm6;
	Wed, 18 Jun 2025 07:36:27 +0000
Received: from out-184.mta0.migadu.com ([91.218.175.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnLL-00000009Int-3Saq
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 07:36:25 +0000
Message-ID: <77225fc9-845f-446a-9014-060b5cc73ba2@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750232179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zdvl+pAO+bUqhZRChbu03wIqYl7v9j98HDmfPpTf/2g=;
	b=Qre4+a4dbN6G6Iy3F6FbPzM/ia5gqX926MBxqQQCHJ6admzrUdUlTwZG0CBjOUuRy+T9oH
	CVhP/OE1QFVMOTlZ7Ny6cXYYFAdsFcdvAL/9l0756dMgbj0Jyujm4NpLjKpuMZvYzFy8vT
	EksZYi/NnYfwr7XxdlD0VWYuiUT4VNw=
Date: Wed, 18 Jun 2025 00:36:11 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 09/12] RISC-V: KVM: Introduce struct kvm_gstage_mapping
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613065743.737102-1-apatel@ventanamicro.com>
 <20250613065743.737102-10-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250613065743.737102-10-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_003624_015138_AF38537E 
X-CRM114-Status: GOOD (  19.94  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 6/12/25 11:57 PM, Anup Patel wrote:
> Introduce struct kvm_gstage_mapping which represents a g-stage
> mapping at a particular g-stage page table level. Also, update
> the kvm_riscv_gstage_map() to return the g-stage mapping upon
> success.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_mmu.h |  9 ++++-
>   arch/riscv/kvm/mmu.c             | 58 ++++++++++++++++++--------------
>   arch/riscv/kvm/vcpu_exit.c       |  3 +-
>   3 files changed, 43 insertions(+), 27 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
> index 4e1654282ee4..91c11e692dc7 100644
> --- a/arch/riscv/include/asm/kvm_mmu.h
> +++ b/arch/riscv/include/asm/kvm_mmu.h
> @@ -8,6 +8,12 @@
>   
>   #include <linux/kvm_types.h>
>   
> +struct kvm_gstage_mapping {
> +	gpa_t addr;
> +	pte_t pte;
> +	u32 level;
> +};
> +
>   int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>   			     phys_addr_t hpa, unsigned long size,
>   			     bool writable, bool in_atomic);
> @@ -15,7 +21,8 @@ void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
>   			      unsigned long size);
>   int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   			 struct kvm_memory_slot *memslot,
> -			 gpa_t gpa, unsigned long hva, bool is_write);
> +			 gpa_t gpa, unsigned long hva, bool is_write,
> +			 struct kvm_gstage_mapping *out_map);
>   int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
>   void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
>   void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index c1a3eb076df3..806614b3e46d 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -135,18 +135,18 @@ static void gstage_remote_tlb_flush(struct kvm *kvm, u32 level, gpa_t addr)
>   	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0, addr, BIT(order), order);
>   }
>   
> -static int gstage_set_pte(struct kvm *kvm, u32 level,
> -			   struct kvm_mmu_memory_cache *pcache,
> -			   gpa_t addr, const pte_t *new_pte)
> +static int gstage_set_pte(struct kvm *kvm,
> +			  struct kvm_mmu_memory_cache *pcache,
> +			  const struct kvm_gstage_mapping *map)
>   {
>   	u32 current_level = gstage_pgd_levels - 1;
>   	pte_t *next_ptep = (pte_t *)kvm->arch.pgd;
> -	pte_t *ptep = &next_ptep[gstage_pte_index(addr, current_level)];
> +	pte_t *ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
>   
> -	if (current_level < level)
> +	if (current_level < map->level)
>   		return -EINVAL;
>   
> -	while (current_level != level) {
> +	while (current_level != map->level) {
>   		if (gstage_pte_leaf(ptep))
>   			return -EEXIST;
>   
> @@ -165,13 +165,13 @@ static int gstage_set_pte(struct kvm *kvm, u32 level,
>   		}
>   
>   		current_level--;
> -		ptep = &next_ptep[gstage_pte_index(addr, current_level)];
> +		ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
>   	}
>   
> -	if (pte_val(*ptep) != pte_val(*new_pte)) {
> -		set_pte(ptep, *new_pte);
> +	if (pte_val(*ptep) != pte_val(map->pte)) {
> +		set_pte(ptep, map->pte);
>   		if (gstage_pte_leaf(ptep))
> -			gstage_remote_tlb_flush(kvm, current_level, addr);
> +			gstage_remote_tlb_flush(kvm, current_level, map->addr);
>   	}
>   
>   	return 0;
> @@ -181,14 +181,16 @@ static int gstage_map_page(struct kvm *kvm,
>   			   struct kvm_mmu_memory_cache *pcache,
>   			   gpa_t gpa, phys_addr_t hpa,
>   			   unsigned long page_size,
> -			   bool page_rdonly, bool page_exec)
> +			   bool page_rdonly, bool page_exec,
> +			   struct kvm_gstage_mapping *out_map)
>   {
> -	int ret;
> -	u32 level = 0;
> -	pte_t new_pte;
>   	pgprot_t prot;
> +	int ret;
>   
> -	ret = gstage_page_size_to_level(page_size, &level);
> +	out_map->addr = gpa;
> +	out_map->level = 0;
> +
> +	ret = gstage_page_size_to_level(page_size, &out_map->level);
>   	if (ret)
>   		return ret;
>   
> @@ -216,10 +218,10 @@ static int gstage_map_page(struct kvm *kvm,
>   		else
>   			prot = PAGE_WRITE;
>   	}
> -	new_pte = pfn_pte(PFN_DOWN(hpa), prot);
> -	new_pte = pte_mkdirty(new_pte);
> +	out_map->pte = pfn_pte(PFN_DOWN(hpa), prot);
> +	out_map->pte = pte_mkdirty(out_map->pte);
>   
> -	return gstage_set_pte(kvm, level, pcache, gpa, &new_pte);
> +	return gstage_set_pte(kvm, pcache, out_map);
>   }
>   
>   enum gstage_op {
> @@ -352,7 +354,6 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>   			     phys_addr_t hpa, unsigned long size,
>   			     bool writable, bool in_atomic)
>   {
> -	pte_t pte;
>   	int ret = 0;
>   	unsigned long pfn;
>   	phys_addr_t addr, end;
> @@ -360,22 +361,25 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
>   		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
>   		.gfp_zero = __GFP_ZERO,
>   	};
> +	struct kvm_gstage_mapping map;
>   
>   	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
>   	pfn = __phys_to_pfn(hpa);
>   
>   	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
> -		pte = pfn_pte(pfn, PAGE_KERNEL_IO);
> +		map.addr = addr;
> +		map.pte = pfn_pte(pfn, PAGE_KERNEL_IO);
> +		map.level = 0;
>   
>   		if (!writable)
> -			pte = pte_wrprotect(pte);
> +			map.pte = pte_wrprotect(map.pte);
>   
>   		ret = kvm_mmu_topup_memory_cache(&pcache, gstage_pgd_levels);
>   		if (ret)
>   			goto out;
>   
>   		spin_lock(&kvm->mmu_lock);
> -		ret = gstage_set_pte(kvm, 0, &pcache, addr, &pte);
> +		ret = gstage_set_pte(kvm, &pcache, &map);
>   		spin_unlock(&kvm->mmu_lock);
>   		if (ret)
>   			goto out;
> @@ -593,7 +597,8 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>   
>   int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   			 struct kvm_memory_slot *memslot,
> -			 gpa_t gpa, unsigned long hva, bool is_write)
> +			 gpa_t gpa, unsigned long hva, bool is_write,
> +			 struct kvm_gstage_mapping *out_map)
>   {
>   	int ret;
>   	kvm_pfn_t hfn;
> @@ -608,6 +613,9 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   	unsigned long vma_pagesize, mmu_seq;
>   	struct page *page;
>   
> +	/* Setup initial state of output mapping */
> +	memset(out_map, 0, sizeof(*out_map));
> +
>   	/* We need minimum second+third level pages */
>   	ret = kvm_mmu_topup_memory_cache(pcache, gstage_pgd_levels);
>   	if (ret) {
> @@ -677,10 +685,10 @@ int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
>   	if (writable) {
>   		mark_page_dirty(kvm, gfn);
>   		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> -				      vma_pagesize, false, true);
> +				      vma_pagesize, false, true, out_map);
>   	} else {
>   		ret = gstage_map_page(kvm, pcache, gpa, hfn << PAGE_SHIFT,
> -				      vma_pagesize, true, true);
> +				      vma_pagesize, true, true, out_map);
>   	}
>   
>   	if (ret)
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 965df528de90..6b4694bc07ea 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -15,6 +15,7 @@
>   static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   			     struct kvm_cpu_trap *trap)
>   {
> +	struct kvm_gstage_mapping host_map;
>   	struct kvm_memory_slot *memslot;
>   	unsigned long hva, fault_addr;
>   	bool writable;
> @@ -43,7 +44,7 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
>   	}
>   
>   	ret = kvm_riscv_gstage_map(vcpu, memslot, fault_addr, hva,
> -		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false);
> +		(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false, &host_map);
>   	if (ret < 0)
>   		return ret;
>   
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
