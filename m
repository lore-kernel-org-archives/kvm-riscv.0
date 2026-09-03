Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 210C4C624A4
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Sep 2026 04:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:To:
	Mime-Version:Date:Subject:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeC4STV6P/2DAJkf4YqFe2mwmeylGqAAqq7FQDgDyuY=; b=AwTV+W7DT0ukYz
	ZQIzYN/teRxxV2aCMoyujrVTKw4zGFBvNQv9rMY6dG1dQJlfAAMSuCYwF6mEJJW+YiLUJ2MdlJJJt
	EXzmPynXBS77RUcfWQbj0UdaXdfAGvnnEFtHG1zKmE1b+TSAQDQ2gByMabfnUUCbTrHbWOa/X31x+
	AIeENDaAw+VXwQNCOG+zPSInaMygHxpXe6u5iXkPIE7TLf99u3RNPdmhGyhWnkN46nMmbj+ejNjEh
	M9Wevx381aNknkvqQCcR3laEy1Fgsh4Ke35tydLT3tCbqY4vIFA2SNq8dOCfedd+RelnbYrFp7BT5
	Dr82+e7bDq13zxZ1Lulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1yh2-0000000GJPN-2umz;
	Thu, 03 Sep 2026 04:04:52 +0000
Received: from va-2-40.ptr.blmpb.com ([209.127.231.40])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1ygz-0000000GJOR-1O4D
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Sep 2026 04:04:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788408283; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=2OZBaXoAwW7EqSgHAZPCMtP91U5/EchCYsUN3g8ScgE=;
 b=arIiyyN+wRvH3ue9Jj3QiX0hGL6wQvpBp7RyEptjqusbXCx+dQBfs1hN5ricIgaqqFjHvu
 AJDeQECF3wJuDcE0XuTJxZ2ldUx9Zt6GzcrtSxLRduHuuNbJcFTO7Qc3Ofb5ABwkyr2Fol
 3rTwICfR/2l6SAbptjS0gFB7/anyqJFBHxaY4f1Eq8Mj9Aoy0GTNJeqIN8lZaJdngyoJwn
 da85M2KmQ8igjV6tNatKLX+8n4hh1FUL6PMyIhBfyQvBtuT1xG6t7FQg8gS0Nuo1qIYGT8
 vq7W1w38jHkfJfLg2ct+GG5FeOKSQ/U2tWDANIggRnZwhhynjzre7PilgYzXhw==
Cc: <yang.yicong@picoheart.com>, "Paul Walmsley" <pjw@kernel.org>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH] RISC-V: KVM: Preserve LCOFIP when checking pending interrupts
Date: Thu, 3 Sep 2026 12:04:38 +0800
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26a98f1d9+528b20+lists.infradead.org+yang.yicong@picoheart.com>
To: "Pengpeng Hou" <pengpeng@iscas.ac.cn>, 
	"Anup Patel" <anup@brainfault.org>, 
	"Atish Patra" <atish.patra@linux.dev>
Message-Id: <7504634a-b2bb-4a17-95f0-3542065810b2@picoheart.com>
In-Reply-To: <20260901080610.91993-1-pengpeng@iscas.ac.cn>
Received: from [100.86.218.63] ([120.234.91.229]) by smtp.feishu.cn with ESMTPS; Thu, 03 Sep 2026 12:04:40 +0800
User-Agent: Mozilla Thunderbird
References: <20260901080610.91993-1-pengpeng@iscas.ac.cn>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_210449_580896_B4A0C243 
X-CRM114-Status: GOOD (  18.12  )
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

Hi,

On 9/1/26 4:06 PM, Pengpeng Hou wrote:
> KVM injects the guest counter-overflow interrupt into HVIP bit 13 and
> records the same bit in irqs_pending. The guest enables it through VSIE
> LCOFIE, also at bit 13.
> 
> kvm_riscv_vcpu_has_interrupts() shifts the complete VSIP valid mask by
> VSIP_TO_HVIP_SHIFT before matching it against irqs_pending. That maps
> SSIP, STIP, and SEIP to VSSIP, VSTIP, and VSEIP, but incorrectly moves
> LCOFIP from bit 13 to bit 14. The following high-interrupt term excludes
> all local interrupt bits, so it cannot recover LCOFIP.
> 
> As a result, kvm_arch_vcpu_runnable() can report false for a vCPU waiting
> in WFI even though an enabled PMU overflow interrupt is pending.
> 
> Keep LCOFIP in place while shifting the three interrupt classes that have
> distinct VS-level bit positions. This makes a vCPU halted in WFI runnable
> when its PMU overflow interrupt is pending.
> 
> Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

i suppose it's a vsip/hvip conversion bug but currently only lcofi will
trigger this. a fix for the conversion:

https://lore.kernel.org/linux-riscv/20260804134018.85497-1-yang.yicong@picoheart.com/

> ---
>  arch/riscv/kvm/vcpu.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index e062ca1..c6eb3bd 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -487,12 +487,14 @@ int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
>  bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
>  	unsigned long flags;
> -	unsigned long ie;
> +	unsigned long ie, vsie;
>  	bool ret;
>  
>  	raw_spin_lock_irqsave(&vcpu->arch.irqs_pending_lock, flags);
> -	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
> -		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
> +	vsie = vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK;
> +	ie = ((vsie & ~SIP_LCOFIP) << VSIP_TO_HVIP_SHIFT) |
> +	     (vsie & SIP_LCOFIP);
> +	ie &= (unsigned long)mask;
>  	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
>  		(unsigned long)mask;
>  	ret = vcpu->arch.irqs_pending[0] & ie;
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
