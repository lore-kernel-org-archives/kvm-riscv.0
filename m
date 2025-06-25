Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5CBC77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:Mime-Version:Date:
	Subject:References:Message-Id:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R7agdLa13je3po77nyiDvZz9qH/Yta+izaKRD7QrUk8=; b=TvHjVjjZkV9yrH
	2hNMq62u6b4q8H5i8w9PSM3sPRqid2rgddrCL+S3DI4agFvGUcNk7vOlPTEXTdnbZcckLjA63MP8W
	4CDGUhwQgsC1F9IdtwCTwfGBcJuscHT4TmcsXnByz7Ll4I/UMSx5hZYyoegiojK5iL/kFfgIMOB97
	mO8o6tFtiobOarhSMWxKosKKmV8uCYuhjvNwnbGGHvEOMpzdC7doekxihCaMCdtK7zl9lWcyfhi2T
	Ih7FR6VoyGPZVawCmyTynTxVtOgtuBHJ+PrZdv/BCuZSNyvwCuRJdoCeS8TQNcEIYrJGe9f//x6Gw
	y5aFn3eME5kKrUN5uDWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULVX-00000007xQM-0qB7;
	Wed, 25 Jun 2025 08:29:27 +0000
Received: from sg-3-18.ptr.tlmpb.com ([101.45.255.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKfQ-00000007pms-1c4o
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:35:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750836927;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=CEUqe5ahfZFpVFJnOYxZcTEDjpo1QaA063NLvGo/wqE=;
 b=4GaTykiebG8UNFNWxzI0CcLswfHuuePdzu31ndQJtrBNXMy4B8WQCqIc1vbDAFofS1GWU2
 z0PFgNdpMRTiW/vq+GgDbtpziDRA4Yr0XL6636HYF2aswHkKBSCqJUJr8DKcRK4YfjgGgL
 0t5IJn7BhFQGkXNfis1NlC03x/U9XU3Unpik1KgFlh9fupDoOHSjSBMv4DLrmHxYxfICvw
 dMfkj6u+8RHBb5T6G+Ua9Bw8cyMOfGCIYvUtrA9csuGzL3Y0o+rbMd/P8opCQSBdMsiJh/
 SMoyjYsHio0+TevQ4HTJ7DBzs9pXIi7V5GGqglbpPMS5L/zw8wOXT2L0ctkf8w==
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Message-Id: <794a81fa-41d5-4b1e-816f-6d63b883f935@lanxincomputing.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-5-apatel@ventanamicro.com>
Subject: Re: [PATCH v3 04/12] RISC-V: KVM: Replace KVM_REQ_HFENCE_GVMA_VMID_ALL with KVM_REQ_TLB_FLUSH
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:35:24 +0800
Date: Wed, 25 Jun 2025 15:35:23 +0800
Mime-Version: 1.0
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
In-Reply-To: <20250618113532.471448-5-apatel@ventanamicro.com>
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+2685ba6bd+9e4b5c+lists.infradead.org+liujingqi@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003536_810324_49635469 
X-CRM114-Status: GOOD (  12.93  )
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
> The KVM_REQ_HFENCE_GVMA_VMID_ALL is same as KVM_REQ_TLB_FLUSH so
> to avoid confusion let's replace KVM_REQ_HFENCE_GVMA_VMID_ALL with
> KVM_REQ_TLB_FLUSH. Also, rename kvm_riscv_hfence_gvma_vmid_all_process()
> to kvm_riscv_tlb_flush_process().
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 4 ++--
>   arch/riscv/kvm/tlb.c              | 8 ++++----
>   arch/riscv/kvm/vcpu.c             | 8 ++------
>   3 files changed, 8 insertions(+), 12 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 8aa705ac75a5..ff1f76d6f177 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -37,7 +37,6 @@
>   #define KVM_REQ_UPDATE_HGATP		KVM_ARCH_REQ(2)
>   #define KVM_REQ_FENCE_I			\
>   	KVM_ARCH_REQ_FLAGS(3, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
> -#define KVM_REQ_HFENCE_GVMA_VMID_ALL	KVM_REQ_TLB_FLUSH
>   #define KVM_REQ_HFENCE_VVMA_ALL		\
>   	KVM_ARCH_REQ_FLAGS(4, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>   #define KVM_REQ_HFENCE			\
> @@ -331,8 +330,9 @@ void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
>   				     unsigned long order);
>   void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
>   
> +void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
> +
>   void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
> -void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
>   void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
>   
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index b3461bfd9756..da98ca801d31 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -162,7 +162,7 @@ void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu)
>   	local_flush_icache_all();
>   }
>   
> -void kvm_riscv_hfence_gvma_vmid_all_process(struct kvm_vcpu *vcpu)
> +void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
>   	unsigned long vmid = READ_ONCE(v->vmid);
> @@ -342,14 +342,14 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
>   	data.size = gpsz;
>   	data.order = order;
>   	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
> -			    KVM_REQ_HFENCE_GVMA_VMID_ALL, &data);
> +			    KVM_REQ_TLB_FLUSH, &data);
>   }
>   
>   void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
>   				    unsigned long hbase, unsigned long hmask)
>   {
> -	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_GVMA_VMID_ALL,
> -			    KVM_REQ_HFENCE_GVMA_VMID_ALL, NULL);
> +	make_xfence_request(kvm, hbase, hmask, KVM_REQ_TLB_FLUSH,
> +			    KVM_REQ_TLB_FLUSH, NULL);
>   }
>   
>   void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a2dd4161e5a4..6eb11c913b13 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -721,12 +721,8 @@ static void kvm_riscv_check_vcpu_requests(struct kvm_vcpu *vcpu)
>   		if (kvm_check_request(KVM_REQ_FENCE_I, vcpu))
>   			kvm_riscv_fence_i_process(vcpu);
>   
> -		/*
> -		 * The generic KVM_REQ_TLB_FLUSH is same as
> -		 * KVM_REQ_HFENCE_GVMA_VMID_ALL
> -		 */
> -		if (kvm_check_request(KVM_REQ_HFENCE_GVMA_VMID_ALL, vcpu))
> -			kvm_riscv_hfence_gvma_vmid_all_process(vcpu);
> +		if (kvm_check_request(KVM_REQ_TLB_FLUSH, vcpu))
> +			kvm_riscv_tlb_flush_process(vcpu);
>   
>   		if (kvm_check_request(KVM_REQ_HFENCE_VVMA_ALL, vcpu))
>   			kvm_riscv_hfence_vvma_all_process(vcpu);

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
