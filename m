Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B129C77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Cc:References:From:To:
	Message-Id:Date:Subject:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QhFLomlkoje19ylnkO3BDoBeC20LUGgk4TwOle7VGkc=; b=ivd0lAjTEL6WWd
	H2Prp+zNBwWuopICg3Xxx3hgZycTz0n8IlvFgMBsVsDsdHDUnRkZD5pAQodcFlC8tTw0pgIKzxj+O
	lIndM+kD9GoZIqYj9wKldCfkPFfm8buCxMaJl5G+DlAuoWHrBmm6ytoMx1xPSi/OZ+qBG5P7N3bee
	4irdh24D0A6bq17WF09rWTqHI3+awzB0NLYwJQ+8lYNglx+q1fD8iApyiqPV7TrCuMuxyadpn/afr
	7vjwoeW83+LawPZqcI68ldGIE0hREjgqO4CLlL99JRZGfiPbJ8h9y8eRk0SEE43+u3dLRuDuNNr9T
	23P0HRA2EsqSuXpu3TXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULcj-00000007yad-0kYe;
	Wed, 25 Jun 2025 08:36:53 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKix-00000007qTU-1yQQ
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837147;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=VYCLNIDhFn58v6NVsiYfx2EHCtJBoqLZUjdlDct+nWU=;
 b=hbDZHriFQtJP3Kr/a7knKEcE8Ehxy3ZjTKmkGvu6zWogQMAYp+Qc6V3AKiG5wfB+dxrfPW
 ClH/moCwn0mDFCYZUK6Oma+66y7LXuxY5b0cn0i/yWLUZeOc6RMhXFoUtHj8/dzZNMALp7
 4uaq+39rK5QSGrpNKDrdK5rvnZC//7WHlcRsYaNwg4qrUiYfJSSz319pZKBoW7V6s3Zo5M
 awJZVx7Pzirap1QrZ+8kNLOUozbcf+j5+PCVMxAQ/snA+H2keDmQEQ7eH6IsDZwbp9fN37
 DKyPj1LqhduV2yJC3CpBOi8kNPGksAzLefkPhdJgdDaPZYWvVJlgXglQ/PCoug==
In-Reply-To: <20250618113532.471448-7-apatel@ventanamicro.com>
Content-Language: en-US
Subject: Re: [PATCH v3 06/12] RISC-V: KVM: Implement kvm_arch_flush_remote_tlbs_range()
Date: Wed, 25 Jun 2025 15:39:02 +0800
Message-Id: <87fda112-4ecd-4631-98be-da420aa59dd5@lanxincomputing.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:39:03 +0800
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
X-Lms-Return-Path: <lba+2685ba799+e1baac+lists.infradead.org+liujingqi@lanxincomputing.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-7-apatel@ventanamicro.com>
User-Agent: Mozilla Thunderbird
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_003915_631984_FF98EB7B 
X-CRM114-Status: GOOD (  14.47  )
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
> The kvm_arch_flush_remote_tlbs_range() expected by KVM core can be
> easily implemented for RISC-V using kvm_riscv_hfence_gvma_vmid_gpa()
> hence provide it.
>
> Also with kvm_arch_flush_remote_tlbs_range() available for RISC-V, the
> mmu_wp_memory_region() can happily use kvm_flush_remote_tlbs_memslot()
> instead of kvm_flush_remote_tlbs().
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 2 ++
>   arch/riscv/kvm/mmu.c              | 2 +-
>   arch/riscv/kvm/tlb.c              | 8 ++++++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index ff1f76d6f177..6162575e2177 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -43,6 +43,8 @@
>   	KVM_ARCH_REQ_FLAGS(5, KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
>   #define KVM_REQ_STEAL_UPDATE		KVM_ARCH_REQ(6)
>   
> +#define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
> +
>   #define KVM_HEDELEG_DEFAULT		(BIT(EXC_INST_MISALIGNED) | \
>   					 BIT(EXC_BREAKPOINT)      | \
>   					 BIT(EXC_SYSCALL)         | \
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 29f1bd853a66..a5387927a1c1 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -344,7 +344,7 @@ static void gstage_wp_memory_region(struct kvm *kvm, int slot)
>   	spin_lock(&kvm->mmu_lock);
>   	gstage_wp_range(kvm, start, end);
>   	spin_unlock(&kvm->mmu_lock);
> -	kvm_flush_remote_tlbs(kvm);
> +	kvm_flush_remote_tlbs_memslot(kvm, memslot);
>   }
>   
>   int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index da98ca801d31..f46a27658c2e 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -403,3 +403,11 @@ void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
>   	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE_VVMA_ALL,
>   			    KVM_REQ_HFENCE_VVMA_ALL, NULL);
>   }
> +
> +int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm, gfn_t gfn, u64 nr_pages)
> +{
> +	kvm_riscv_hfence_gvma_vmid_gpa(kvm, -1UL, 0,
> +				       gfn << PAGE_SHIFT, nr_pages << PAGE_SHIFT,
> +				       PAGE_SHIFT);
> +	return 0;
> +}

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
