Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DD24C7EE32
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 09:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Subject:To:
	Mime-Version:Date:From:Cc:Message-Id:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PYXZFw9QJaHO+RaiXglCz21gKlZVWV5I1AV1eG1SMc=; b=OCsuZjkr37BRBa
	XgRRvu2G4ECQyFrtX7acNXnLZXwtH+xRP5TxtffSoDPDJgEFwHzdO8BBlmzqEOG0eYb4HRLcTUumR
	8tRw68i32LaRX95t36QAWuFg5D3lUMmPqCoGwWc8h/RG63FvhHLedOdxMTY+h3w8LyGIFNkjdPgy/
	J6qcggzs2rEJ1UpLGFDhSSZKFYZ52BNHYi2TdZin310Q04R2p8/MBXCU64k/yEZpG0baBa+bG2q0v
	p7Li1lDYuSZhIUt8aHXvTcPRp5lGgj+ZTvrRMScGUsowANrKNOSmIeZN1WALbLzVTNxAuHgvvS4Oz
	qyjHTdzHIlhgStG6RvQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUMpA-00000008DA8-2xOk;
	Wed, 25 Jun 2025 09:53:48 +0000
Received: from sg-3-16.ptr.tlmpb.com ([101.45.255.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKnH-00000007qxO-3fF4
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837409;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=oGnmteCS7Y1cGbRip4TRzIH/m6fa6vD0sYRYRmitVFM=;
 b=AL55rIKM7mvoV3OqGg0WItMPupsay1lsa/aY7NjNvEp7qKQMC72K5CkStaERm0JhpkVFmx
 kQuc85PVKGPja7UMzosma1NFFEdING69ixdAtE36iKJZilzj+2Z7RsCsX4rpXuHOK7FlNT
 RaOHwPSo27Z+5AI10vEK66yFY+rn8IC9sEFUkU5yl9GzOapK94NV6HBNcP42i0ew3NaGJ0
 IQYY6qjzlEdPEDyFLUp7CUOQNpm6C6D4SJcU8fOTsSPqt5+mtLbrUZ4//QSFzavEBoVFuG
 uhoxFzJ7L3NkL9+2NNN8M9dBsJ4OTNF8Gc4j4G7XBDKfWdIgRuD265qg0cWoqA==
Message-Id: <8e8b241b-ef9d-4559-a451-e4cc1067c7fa@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2685ba89f+1bfe08+lists.infradead.org+liujingqi@lanxincomputing.com>
Content-Language: en-US
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Wed, 25 Jun 2025 15:43:25 +0800
Mime-Version: 1.0
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Subject: Re: [PATCH v3 09/12] RISC-V: KVM: Introduce struct kvm_gstage_mapping
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-10-apatel@ventanamicro.com>
In-Reply-To: <20250618113532.471448-10-apatel@ventanamicro.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:43:26 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_004344_288792_3B451416 
X-CRM114-Status: GOOD (  18.40  )
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

On 6/18/2025 7:35 PM, Anup Patel wrote:
> Introduce struct kvm_gstage_mapping which represents a g-stage
> mapping at a particular g-stage page table level. Also, update
> the kvm_riscv_gstage_map() to return the g-stage mapping upon
> success.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
