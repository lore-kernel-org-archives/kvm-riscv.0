Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EBE4C7EE30
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 06:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:To:
	Mime-Version:Message-Id:Subject:From:Cc:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lJsOmlETJgwKg7c9lTptc4a4+Dimi5DOwcCHkdH9tNE=; b=2UQ6j7BFgcxDWyoWX7+OaCcLg1
	1dOF0mLaB31ag9iOYBAEYwG3Pl89FjPzAhu1pwzc7h/sG6FJLM5rxcLscqXhykwHLUeRdMZP9fI1J
	nPDEiNEj1KZ458b+FIpW34GiGtJNhLReiMmXfMqjihiWH7SVcIVXNSZGdy3mG5xHRjmsRDVUscp6M
	xQ3Ol0qDrgkcg6yCTUX7Vege+AZFngM0rj0WWF1y3mJUDO+mYF1PA97B1TH6fOTZl1f5tcNaAWrM+
	osIy2TTrlwdYYRfZXs2hH1v+u5MCime4bQagqXrF/9iStDfKLpUyjv19g3idApQgAFHO6LoZGRs/C
	WgPO6mHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJzy-00000007jNn-0PjO;
	Wed, 25 Jun 2025 06:52:46 +0000
Received: from sg-3-16.ptr.tlmpb.com ([101.45.255.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJwT-00000007iMg-1sds
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 06:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750834135;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZdyKk+Fy17cw6lY7tU2GyRG5lXYFtVObREE3n5Owp1c=;
 b=ZRmaBLsoa5fT3LhiTZLX+QT+5M+0CHX9SmRIWOxTDYA+vr7DlGO/tt1JxhGhAaB7nEDA+I
 W7+9Fak9aDRliKuut9Rg1z5MFRa2l2RqSZeNFNmAV8HW3xoE2Aak6JO7uAb5YlZSRLdZoV
 43GBfWowPzSu5KZyPyCHjvVDFasuKYOuSuOetkIpPDvxnFGZTFD4BHAhufFsjr0EggIVRS
 Wj1dFyt5jWeKJNSHl09TVQl0yWiLs9UA7BXHZHHLu2995s8uFrWe/l71FrxesP/QiL1PZr
 OU5zoFNR5XfDc29Q4WdiaOac8Wd5I4ih2ORfHxEmed875M+LdIhXRQWz7vO3pQ==
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 14:48:52 +0800
Message-Id: <f8fecbf5-6c6b-4cc3-8694-356b17be8c70@lanxincomputing.com>
Mime-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Content-Language: en-US
X-Lms-Return-Path: <lba+2685b9bd5+22dfaa+lists.infradead.org+liujingqi@lanxincomputing.com>
Date: Wed, 25 Jun 2025 14:48:50 +0800
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
In-Reply-To: <20250618113532.471448-2-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_234909_850817_2CA2C549 
X-CRM114-Status: GOOD (  10.80  )
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
> The kvm_riscv_vcpu_alloc_vector_context() does return an error code
> upon failure so don't ignore this in kvm_arch_vcpu_create().
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/kvm/vcpu.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 303aa0a8a5a1..b467dc1f4c7f 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   
>   	spin_lock_init(&vcpu->arch.reset_state.lock);
>   
> -	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
> -		return -ENOMEM;
> +	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
> +	if (rc)
> +		return rc;
>   
>   	/* Setup VCPU timer */
>   	kvm_riscv_vcpu_timer_init(vcpu);

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
