Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553C2C7115C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 07:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:Message-Id:
	In-Reply-To:Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t7UyxSqWLHFmLJZYy1/nM/SvcFR5N52d8r4NPZUb46o=; b=T1esxGXvP+ZPI9
	qXwvV/lrsbtNhE0vma36xX60CSurWOpMeW2vOJ05Qfp3urOnTGwMvqbHi7MheHujpSLyxLlnoOFNo
	Ga9W3Tc4qGf8XsXEqR1J8erbd/TkgOitw8Evd5OC58QhcqVO/usz6vkX0cBSKB5+LSwM2ga8PME/R
	rlw58N7XEnOVT7Dgz3Jvakoglno7htXPaitSKlV5vS0Xyu8woDTLqTAFP2k7bMETfMH0XTUjxOJWp
	vbjZwMmtQHe6l9IigdOpv9Talnz/RVp/u3LvF0haF3z4KdLuvCBsTtcjIy021GR4aVA5P8HpJHQwV
	PRlFB5TA1DExYT8AJPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUK92-00000007kc1-0AI9;
	Wed, 25 Jun 2025 07:02:08 +0000
Received: from sg-3-13.ptr.tlmpb.com ([101.45.255.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUJxi-00000007il0-3QDT
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 06:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750834215;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Ik8c1hqRgYzer5tdkB7JgwAmNHMzAh0ECFwpDRHcshI=;
 b=kdTrRPX7l9jj9wagONaE8JwGbAVw8enUSWAQSkl7lDA8lxd78m/5OuG4axM5IYSWMgktYV
 lObLN8+E7Qz0nCRFYd8swpsUsZRfC2MEfDOHXzj86lsqjaR0jafwOJ1daZ7KRlyTRPhnlB
 RExAo/pHkOCUpcle/Pr0G16SUjhpPFrofZTotrfTABjA3q+H8sMZzq08IWSMTZnokLF1dR
 b5OepAA5vx/S7HlgKSMCCMJt2VkSSCXTUuCgEcvCsxCxvwIGSnmed4aaFOSMaq8hkQKjNJ
 oJropYL0TKhPhjU2q5JWlJkFBtWuDJC2gjdbYcIQu2hJWJQc+WfBAPO0byqCJA==
Subject: Re: [PATCH v3 02/12] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Wed, 25 Jun 2025 14:50:10 +0800
In-Reply-To: <20250618113532.471448-3-apatel@ventanamicro.com>
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 14:50:12 +0800
Content-Language: en-US
Message-Id: <44722ec6-b08c-40bd-a612-40d723985aa3@lanxincomputing.com>
Mime-Version: 1.0
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-3-apatel@ventanamicro.com>
X-Lms-Return-Path: <lba+2685b9c25+a22566+lists.infradead.org+liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_235027_268079_7F90BEDD 
X-CRM114-Status: GOOD (  13.25  )
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

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
