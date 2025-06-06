Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA09EC5AD49
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 04:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Subject:To:From:In-Reply-To:
	Mime-Version:Message-Id:Date:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2cP8Xh0OD2fknveTTtok4kW8pSFx0qTIW5PAClqALE=; b=bC+jQ8A2zQ6701
	gGX9uV8CQz2/PHx6+gkmySpKNDJte4C2z50vGuy6VmTRX2pP42kzEDJBW45uB/Qtv/dRnDk0mJTgb
	xL+WTPQ3uzcxzeyjhDkqJrt8pO0mI8b9NFhHKQdpDG5PzLeLbnQVkEinodkCoizPHPLZosye1Q4HG
	9/frteDHSMakNZCvjlHs9efXgFL5jjmV74JFcj5UlhLT5I6v2XJYMr3NZlGsuUaiw/3oHAeKF3IrT
	qFIzhfWvQxnA3zK9oaz8joIkMgiBWG4RZfn3j0X38aBGWrQz+9tMFy4R/wPZNQNdfGwcOd3RIgyB2
	LTTuLwjtEiIQ3T6N/Cjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNOTw-0000000H4kI-3sMZ;
	Fri, 06 Jun 2025 04:15:04 +0000
Received: from sg-1-23.ptr.blmpb.com ([118.26.132.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNOTs-0000000H4j3-2iWH
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 04:15:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1749183289;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=bxW97WAtWMI/gihYEj6Ht7PAyVXQrYH3mCMOcOfQ04s=;
 b=tiKxe8TlLzaSpftlkKEpF8OWyyY6pKZ27yIdGyAK+Kbd6dB0QZNd5FxI6mAWs79O7n92/p
 IYsmuk7woUc/zMnRRRaAsh6vISLeElv+E+ct5C0DbxK087f70FtCmY5YUPEl+IL1e8jpjh
 27r/sNpvVacdHzVbRvb6fduyZRP8OCe/2eadEC7muBnieLplfYDUpAQY0nZLL5WOv5B10L
 lky+mWeHC2NzSpe0HxbSYQBia0v3fo2urov21PrA+IbZmlDZZM1Bez4q8gBgZXunYmbdVw
 G+TE4jiIp9vVneN9+4wetUjpAXuuPQHeKRdKRg0cXNkhJ3AElqSLQkWAmTh5jA==
User-Agent: Mozilla Thunderbird
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
Date: Fri, 6 Jun 2025 12:14:43 +0800
Message-Id: <670cf57f-775e-43e1-abc3-189f3e0dc35c@lanxincomputing.com>
Mime-Version: 1.0
In-Reply-To: <20250605061458.196003-5-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Received: from [127.0.0.1] ([180.165.23.184]) by smtp.feishu.cn with ESMTPS; Fri, 06 Jun 2025 12:14:45 +0800
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Subject: Re: [PATCH 04/13] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Content-Language: en-US
References: <20250605061458.196003-1-apatel@ventanamicro.com> <20250605061458.196003-5-apatel@ventanamicro.com>
X-Lms-Return-Path: <lba+268426b37+5aff4d+lists.infradead.org+liujingqi@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_211501_414178_92CCB687 
X-CRM114-Status: GOOD (  12.36  )
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

On 6/5/2025 2:14 PM, Anup Patel wrote:
> The kvm_riscv_vcpu_aia_init() does not return any failure so drop
> the return value which is always zero.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_aia.h | 2 +-
>   arch/riscv/kvm/aia_device.c      | 6 ++----
>   arch/riscv/kvm/vcpu.c            | 4 +---
>   3 files changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
> index 3b643b9efc07..0a0f12496f00 100644
> --- a/arch/riscv/include/asm/kvm_aia.h
> +++ b/arch/riscv/include/asm/kvm_aia.h
> @@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
>   
>   int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
>   void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
> -int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
> +void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
>   void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
>   
>   int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
> diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
> index 43e472ff3e1a..5b7ed2d987db 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -539,12 +539,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
>   	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
>   }
>   
> -int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
> +void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
>   {
>   	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
>   
>   	if (!kvm_riscv_aia_available())
> -		return 0;
> +		return;
>   
>   	/*
>   	 * We don't do any memory allocations over here because these
> @@ -556,8 +556,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
>   	/* Initialize default values in AIA vcpu context */
>   	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
>   	vaia->hart_index = vcpu->vcpu_idx;
> -
> -	return 0;
>   }
>   
>   void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 6a1914b21ec3..f98a1894d55b 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -160,9 +160,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   	kvm_riscv_vcpu_pmu_init(vcpu);
>   
>   	/* Setup VCPU AIA */
> -	rc = kvm_riscv_vcpu_aia_init(vcpu);
> -	if (rc)
> -		return rc;
> +	kvm_riscv_vcpu_aia_init(vcpu);
>   

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

This seems more reasonable.
Thanks,
Nutty

>   	/*
>   	 * Setup SBI extensions

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
