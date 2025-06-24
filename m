Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07868C77B7C
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 03:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gPoMY6CxMb/kPUSl1pGxcUdlX4O6siY6FR6SG1ZtwPY=; b=dsi+Ui2It3RDvv
	kkGqRVdem+0Ob4r+f/jIBOSoJIk5JxLFM3rELAqkhvprmVm9bhPFsjlzXuD3vpLVIrVH9DNj25Fbp
	YxpKb9p3Zkm3lqUQ53W0vq3pdNjWfpUzifpLJWsk0l7x6pRP+E0khJFfG/TNUiFzO0JSbHU9VuGu+
	03AhA4W/CpoO61zf+FK5KjOvJTGcJUMVdjWKUtox9kRxFRT72hwk3AhDTgup5xDDvN33WnHFgMLwR
	DCrtCGlC/0OH7IhTX3ZMOWO8xQfX7lbxxR4SejkfxbemINSIQ5z5s5NzCOQfXjzmTAZcQJ8ZilX+Z
	9yoNahO90fwzyNZtLdrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuRS-00000004YVe-2Ukf;
	Tue, 24 Jun 2025 03:35:26 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTuRQ-00000004YUZ-1CnE
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 03:35:25 +0000
Message-ID: <b2d54872-1f09-41cb-9c58-1224bdb40793@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750736112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hZuOLpZ68g5i7iHvT9FAlUSft9dBr5Tjt7zYFAkD4lc=;
	b=VSP3bsz6NiMLFUIi/hf0SKIpFZtYOxrYazmTwVLoy7kNHJnwmuITH/RXsI5ce2gUmt98sm
	MbWxufR4ZbZcP6ULYOknO1Qns3aRyWRZvVDFdtM0p7oJ0IW6fiSg94x+b4uOuo82wk6j8g
	yHiZD5sqxyzHYs4yueDjfRBNs18WdJM=
Date: Mon, 23 Jun 2025 20:35:04 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v3 02/12] RISC-V: KVM: Drop the return value of
 kvm_riscv_vcpu_aia_init()
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Nutty Liu <liujingqi@lanxincomputing.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
 <20250618113532.471448-3-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250618113532.471448-3-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_203524_467027_CAB90C64 
X-CRM114-Status: GOOD (  13.88  )
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


On 6/18/25 4:35 AM, Anup Patel wrote:
> The kvm_riscv_vcpu_aia_init() does not return any failure so drop
> the return value which is always zero.
>
> Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>
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
> index 806c41931cde..b195a93add1c 100644
> --- a/arch/riscv/kvm/aia_device.c
> +++ b/arch/riscv/kvm/aia_device.c
> @@ -509,12 +509,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
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
> @@ -526,8 +526,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
>   	/* Initialize default values in AIA vcpu context */
>   	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
>   	vaia->hart_index = vcpu->vcpu_idx;
> -
> -	return 0;
>   }
>   
>   void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index b467dc1f4c7f..f9fb3dbbe0c3 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -159,9 +159,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
>   	kvm_riscv_vcpu_pmu_init(vcpu);
>   
>   	/* Setup VCPU AIA */
> -	rc = kvm_riscv_vcpu_aia_init(vcpu);
> -	if (rc)
> -		return rc;
> +	kvm_riscv_vcpu_aia_init(vcpu);
>   
>   	/*
>   	 * Setup SBI extensions
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
