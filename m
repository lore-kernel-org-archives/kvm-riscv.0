Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50CBC606A326
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Nov 2026 02:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sKOOn1X+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HbqvaW22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WiGBsN9meuCNhN7hskmalB0pFsMBoMfHd0nRlOboQng=; b=sKOOn1X+VY1o6TS1nrSzhK5rC8
	YOD53L7KEwiyu8AEmCKO+13Ec/MZDq8fnq6rZqkW+A9lrLQORM31CG4en683yygCwUCB+JT69kDcz
	dPX8c2GXONUy5islS8goDgdKvKz2akdqWTFlual+vQ4OGQMCSAA1HHwRd+FQ+1LvOQIcqw1qNGCp0
	XwYMj0bl6Nr0Oyj4PGuebRrJOANB+tbysrUDb+0ksywJRJg0AIzyQkqOwfe+7hVqGv/Hx7NeMjGeK
	HWumkepdPIWirVuUni2aYXqC2rbnoVyJ3+84Is8NTqjkTUwx48Kx7oKrCBYjgx1XeqgB4r3pmKMge
	VyjPB5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9Il-0000000B1yK-45cF;
	Fri, 06 Nov 2026 02:03:35 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP9Ii-0000000B1xW-49Vw
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Nov 2026 02:03:34 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-cc502d509c0so52123a12.2
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Nov 2026 18:03:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793930612; x=1794535412; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hss8CMdUJlf/6WFGnheIgi73dz4MTpQCYfKabF+VIfc=;
        b=HbqvaW22JYr87NWwY5yEzM73P7qT2/+zkktWYKWq/zK0i/0mdIZZksh8E3b6EZDVkq
         Tw3VDh/68qcfirfglwBRlPwouaWtrzDZQfsKir6FVnXhcfsZbDELN73o+I2yfj9ip+Wq
         iOn/f2YSL76gxO3AjqlEczvzSaigWTxXELECKx5Y1RRxPxFIQyAeNZG8htQyi4/rdQi2
         PFcOkrbRD6MYfpM9Q4E4Q0rsncioVnBwYRgnFWqR3aea39WLjaWiC/CmV3qHUvty/pw4
         HJfTeDy/FqU4gE9JwmzVk33sM1+C38pAk8bg3W5fyD8B+5YjhMgOrsDmVnuLY122yqKN
         hX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793930612; x=1794535412;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hss8CMdUJlf/6WFGnheIgi73dz4MTpQCYfKabF+VIfc=;
        b=qYtCoczWKoVI5kQ9i0PDmP4tGin90NJ35jpTGivtBO10sEOre6YTqFnpbcmlah7A+/
         rK+qHFVJoOHhnmw5FW+A8nzd2ggsm06xNsycCcyLIZDAiWpX/QdyuaRs/1PA2xKBseJu
         1x29OQ0fht1OjNQWx1FI6jIxtR0skY0GlBACjzjpSuAOOs2QRR6DrcRhFyE/DQ6eihth
         Jpzx2I1bEKS2rh93mpn2jhL2J4RjsmPKygBl1d/enl6WQPpe3bEMOCPCYFir7aSwvnz0
         i1LbcoOrC9Ua9SPuNI6fb8yikDVOMxNFOF7qCL3dKh5KZiTSG02J45ogJ2Q3r9xQkaCb
         NiiA==
X-Forwarded-Encrypted: i=1; AL+hErHcbGXN0XPW4zyUJlORmQDztvbPar5SD9ahXIRGIbUeMOyRjVFOztS+I3fmpZVfm5hDfly/KbNE7OI=@lists.infradead.org
X-Gm-Message-State: APuU4Z/bmNo42bnKuvYZ7b0trM8ImP/fLvBKbcYKS2o09Fw5KhQExmju
	do+11aQZQ3fy92gdd0Jj/b7wyxLclACcrEMcZ6yNyZbY7N2NHkV3+Re4
X-Gm-Gg: AYBFou3T5/IQuOMZpUjTn5gyxlzggf20TcWYeaDsC63JpjTwzYh3gG/nzzBT4cBIaPV
	b3ziDcC4kWZwYUH6zEGbW7OcpKyhh7FUa0m4nYLWxVrPvrsY2sRzjHsFUTFCjQqWNlXxIdDtno/
	DnP4CSGfXUHBjrM8O6aH4Zmiw4J5A5g5fseIDZ6iu/6YekaH7GYmFwiwrRBxpMzvhJUFdhg2TEH
	VTCbNMc79G2AXN345DqVCnZ7uhgB4Ucx2MkfpBZnc1wxuNN9y/0/C1j5pbtIetAOihxPw0WS88N
	iC1rAVd0H3l4hoAQJFUOswX8h9Pphh3sxudr4L0a3tcPmB0Eh7rpePmOY/T9INecJdQI8Newp3l
	z0EiOks6nl88ZeJ+7S75Vwde4CNegKIidb2hbCImwoIpLOnUK6neBbeS/KK27HSr+BMRWZPA/Rx
	K+L8Jm0ThinP8h743ML6Gi7f/cj0lZSu/h4hPcJFEafgBf9FJl+sqzjw85nuP5RJRl6JHLn7gmz
	axgaC3x11m71i2pXilh36EgPjgKnLjney8l3nEIgL7oagvWiPcg5YEfAqq6RLIwnVAVgZ76oAko
	UiWpDrKTSgEMHGEIjBl4ysCfqw==
X-Received: by 2002:a17:90b:3846:b0:3ab:9f1a:3825 with SMTP id 98e67ed59e1d1-3b0db6218d4mr1002747a91.4.1793930611582;
        Thu, 05 Nov 2026 18:03:31 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32baf86sm5589983a91.17.2026.11.05.18.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 18:03:30 -0800 (PST)
Date: Fri, 6 Nov 2026 10:03:16 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: SeungJu Cheon <suunj1331@gmail.com>, anup@brainfault.org, 
	atish.patra@linux.dev
Cc: tjytimi@163.com, inochiama@gmail.com, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, andrew.jones@linux.dev, 
	pbonzini@redhat.com, seanjc@google.com, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH] KVM: riscv: Only fast-path dirty-log write faults on
 host-writable leaves
Message-ID: <au01Qocxd1gsXs42@inochi.infowork>
References: <20261017030927.345454-1-suunj1331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261017030927.345454-1-suunj1331@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_180333_045585_2051991E 
X-CRM114-Status: GOOD (  29.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 17, 2026 at 12:09:26PM +0900, SeungJu Cheon wrote:
> The dirty-log write fault fast path sets _PAGE_WRITE without checking
> whether the backing page is host-writable. A read fault can install
> a read-only mapping to the shared zero page. A subsequent guest write
> then takes the fast path and writes into the zero page instead of
> going through the slow path to break CoW.
> 
> Use RSW bit 9 to record host writability before dirty logging forces
> the mapping read-only. Preserve this bit across write-protection and
> fall back to the slow path when it is clear.
> 
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/sashiko-outbox-174168@kernel.org/
> Fixes: 7705be59eb2d ("KVM: riscv: Fast-path dirty logging write faults")
> Cc: stable@vger.kernel.org # 7.2+
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
> Testing:
> 
> 1. HiFive Premier P550
> 
>    A selftest makes the guest read an untouched page, then write to
>    it with dirty logging enabled. Before the fix, the write corrupts
>    the host zero page. After the fix, CoW allocates a private page
>    and the zero page stays zero.
> 
>    dirty_log_perf_test -v 3 -b 256M -i 3 shows no noticeable
>    regression (14-21s per iteration before and after).
> 
> 2. QEMU (-cpu rv64,h=true)
> 
>    The same selftest reproduces the zero-page corruption before the
>    fix and passes after it.
> 
> This patch applies on top of the Accessed-bit fix [1].
> 
> [1] https://lore.kernel.org/all/20261016101458.221648-1-suunj1331@gmail.com/
> 
>  arch/riscv/include/asm/kvm_gstage.h |  5 ++++-
>  arch/riscv/kvm/gstage.c             |  5 ++++-
>  arch/riscv/kvm/mmu.c                | 15 +++++++++++++--
>  3 files changed, 21 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> index aaf080ba1b77..0d19ad6d7dfe 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -35,6 +35,9 @@ extern unsigned long kvm_riscv_gstage_max_pgd_levels;
>  #define kvm_riscv_gstage_pgd_xbits	2
>  #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
>  
> +/* RSW bit 9: the host mapping behind this leaf is writable. */
> +#define KVM_GSTAGE_PTE_HOST_WRITABLE	BIT(9)
> +
>  static inline unsigned long kvm_riscv_gstage_gpa_bits(unsigned long pgd_levels)
>  {
>  	return (HGATP_PAGE_SHIFT +
> @@ -61,7 +64,7 @@ bool kvm_riscv_gstage_try_update_pte(struct kvm_gstage *gstage, u32 level,
>  int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
>  			      struct kvm_mmu_memory_cache *pcache,
>  			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
> -			      bool page_rdonly, bool page_exec,
> +			      bool page_rdonly, bool page_exec, bool host_writable,
>  			      struct kvm_gstage_mapping *out_map);
>  
>  bool kvm_riscv_gstage_split_huge(struct kvm_gstage *gstage,
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index be70607a33ea..d9bfd0c6d5fd 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -207,7 +207,7 @@ static void kvm_riscv_gstage_update_pte_prot(struct kvm_gstage *gstage, u32 leve
>  int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
>  			      struct kvm_mmu_memory_cache *pcache,
>  			      gpa_t gpa, phys_addr_t hpa, unsigned long page_size,
> -			      bool page_rdonly, bool page_exec,
> +			      bool page_rdonly, bool page_exec, bool host_writable,
>  			      struct kvm_gstage_mapping *out_map)
>  {
>  	bool found_leaf;
> @@ -246,6 +246,9 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
>  			prot = PAGE_WRITE;
>  	}
>  
> +	if (host_writable)
> +		prot = __pgprot(pgprot_val(prot) | KVM_GSTAGE_PTE_HOST_WRITABLE);
> +
>  	found_leaf = kvm_riscv_gstage_get_leaf(gstage, gpa, &ptep, &ptep_level);
>  	if (found_leaf) {
>  		/*
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 042d1e3b3547..196cde6c40cd 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -586,6 +586,12 @@ static bool kvm_riscv_mmu_dirty_log_write_fault_fast(struct kvm *kvm,
>  			break;
>  		}
>  
> +		/* Let the slow path handle host-side write protection and CoW. */
> +		if (!(pte_val(old_pte) & KVM_GSTAGE_PTE_HOST_WRITABLE)) {
> +			ret = false;
> +			break;
> +		}
> +
>  		if (!dirty_marked) {
>  			mark_page_dirty_in_slot(kvm, memslot, gfn);
>  			dirty_marked = true;
> @@ -630,6 +636,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  	bool is_hugetlb;
>  	bool unused = false;
>  	bool writable;
> +	bool host_writable;
>  	unsigned int vma_pageshift;
>  	gfn_t gfn = gpa >> PAGE_SHIFT;
>  	struct vm_area_struct *vma;
> @@ -714,6 +721,8 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  	if (is_error_noslot_pfn(hfn))
>  		return -EFAULT;
>  
> +	host_writable = writable;
> +
>  	/*
>  	 * If logging is active then we allow writable pages only
>  	 * for write faults.
> @@ -739,10 +748,12 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  	if (writable) {
>  		mark_page_dirty_in_slot(kvm, memslot, gfn);
>  		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
> -						vma_pagesize, false, true, out_map);
> +						vma_pagesize, false, true, host_writable,
> +						out_map);
>  	} else {
>  		ret = kvm_riscv_gstage_map_page(&gstage, pcache, gpa, hfn << PAGE_SHIFT,
> -						vma_pagesize, true, true, out_map);
> +						vma_pagesize, true, true, host_writable,
> +						out_map);
>  	}
>  
>  	if (ret)
> -- 
> 2.52.0
> 

I guess this fix miss a part:

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 53bb25a5a60b..1b35ab980a10 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -761,7 +761,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
 
 out_unlock:
 	kvm_release_faultin_page(kvm, page,
-				 unused || (ret && ret != -EEXIST), writable);
+				 unused || (ret && ret != -EEXIST), host_writable);
 	write_unlock(&kvm->mmu_lock);
 	return ret;
 }

Regards,
Inochi

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
