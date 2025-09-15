Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3300CAC592
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97yuQ2h8DDKXJ6OeiEECsytyDHg4Bxy595zLGYopV/A=; b=YOVwvNygms6JEv
	sO2By1Lr5vBEKJn6uVKGtMxUbEspuxlJ0Ajbv8nwBdA+2ie6PjGU1wsDBCjNeHI8P6XuWW20GEtEC
	aZYqZD2n1Au0CS2Mxobk7ONlvcARqUJFhWkdFL4/K20v953Sz+J7Yox9bmHGrVyDJZMCBRu5lFe6M
	ZjFiALsl4+MdVL0x+hD968fTBQU4BI7CQLkCfJfas4goTxJuGmM8TRhWJLBRf+0GaMhhN2FV81uMa
	ewAAgkVHpt/bEf+wlt64EPtmqHYKvo/Jyva1gzIpv48oGKUgycOxYSo7x4sFJLJUhtKz79Bs1fI4G
	luBdCh6ncZEXXLZJ6XWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaN-00000005CJJ-2V1s;
	Mon, 15 Sep 2025 17:01:51 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCaK-00000005CHR-1U2S
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:01:49 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-88776dcac7aso158847839f.1
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 10:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757955707; x=1758560507; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k8pxyW/bjpXpmupAYzyp4FH4PZi8lnxP+pKqyf7C5o8=;
        b=n5QWBeHKzvW8wpGn+f6rg8W1dai4bJxr2HdErGyGSa6NoXAUk0NcRJZ+kZm1yUddJI
         4TvalQke/VQgO0ptD6RvHDpzFbAxxWlfHcYf1NsrN2jxHGa6NnKuJisrQjXEwOLg3nDy
         iJfcwxxi3BXvqBb7HON5QNF9OVE4w8QC5ujL93IQ7oFYezOYpoW7BoptnQTGsqBQFy4I
         qGzzXIFIkQ1EGWCMt7E1GtRBl1rOModv6yzl6pGACHLQmhx2PUuJ2EKK8ouRVNS8WPcG
         zzgEUImFlRtbln8+GacsZjR5qHij05v6FE3MhTh3GWmd6eIE7Qvx8cyu3mG/LaBTWUxi
         tbDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955707; x=1758560507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k8pxyW/bjpXpmupAYzyp4FH4PZi8lnxP+pKqyf7C5o8=;
        b=lzYwgOcafrsCOOaWAl2kAKaVXQmHXIFXqQa+E+AsdjK7xblQF/KeuGfWFWC98LcyVD
         1IYuRo+Zd1/DoatUhiBBqbUij63al4mW3j2Rt7qZ2dT5S7Qt0L93CjvTG3wHyJ5yj6wG
         GER7GVcihYla4y8hX8AqjoiUOZAs2yjNq2WK7015wtX4PaMNkRqDxSFOE+YbSr1CXdjM
         8fhIgbE4sk7OOkjJ41+oZqpgYxqPArZvu3cnamfcPgsfl9voLPIdLHOv3WxLUcjCODyo
         j3TVMJDebPHQ/sXS7bftfxSRIjZBTryKF+hdfG7uyHvvYAnjjq0etMxvZh5srrPUphJ6
         3kHg==
X-Forwarded-Encrypted: i=1; AJvYcCWfUunDxJKrlazJ0/vwZjNq4xeXR6kxWaPlIjcNbTtnymS7qTRTz1AJ2ttQyiJGQPmw/2Ncx9mu2wY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5gdnehQZlHKmeVO3lUwgHz8Uek0AnyvNLEkm88sKGoBa5FDeD
	A7o40xHoasNqKAfywqJ5qiEwSMiMmiEKBF9KFpFrrXCCsnWKX1HAWNOTyJwLFldEB6I=
X-Gm-Gg: ASbGncsxA0xDZo+z3OXBfYwreFHxy6hCYKXqeF9WZdRP0tte6gqZ6Eivtzl4nQf4AhE
	twqTfyG5k8bbS8EG9Tt545McZriM8AqhD2x+2DOHs2Cp21UZXQHmFoDsDVUehzg8LZ+dAsaoMQN
	X3ICTeslfFlp0v1sVRfsMyaT8OW4YciZhXqzb1WU0nf84NdiOBNaKk1XhibRQDGac5VlABSCaoo
	AH5k9W4BfQyR7M35rg9FrAL86yTgH0rwQieH2H3q7lDoAZ7LoskD9GWwXgnDWBt6U4K5Kb6ILPj
	XSjzN/ajbQiK0cxyX+kl8jl1CeegGbK5jnENQS5SAyIdCnDCsQcM5xXVvkXgrvbvycZCNAMuxot
	OSZSql4whYTB5GjIDF5KG1ziq
X-Google-Smtp-Source: AGHT+IFi6vqzi7uBigrs1rkZ7BYQA7tKMwkaIff57LL4Wv+ao8W4QcMhs/+e22hjK6NK5HxClZr37A==
X-Received: by 2002:a05:6e02:188d:b0:3eb:5862:7cef with SMTP id e9e14a558f8ab-420a4173bb3mr104487445ab.22.1757955706965;
        Mon, 15 Sep 2025 10:01:46 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-41dfb240f4fsm58897935ab.43.2025.09.15.10.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 10:01:46 -0700 (PDT)
Date: Mon, 15 Sep 2025 12:01:45 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Radim Krcmar <rkrcmar@ventanamicro.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Tianshun Sun <stsmail163@163.com>
Subject: Re: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for
 migration
Message-ID: <20250915-ad649bd2a0c0b9e98b63c5f4@orel>
References: <20250915152731.1371067-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915152731.1371067-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100148_401386_4E064B05 
X-CRM114-Status: GOOD (  27.77  )
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

On Mon, Sep 15, 2025 at 11:27:31PM +0800, Jinyu Tang wrote:
> When migrating a VM which guest running in user mode 
> (e.g., executing a while(1) application), the target 
> VM fails to run because it loses the information of 
> guest_context.hstatus and guest_context.sstatus. The 
> VM uses the initialized values instead of the correct ones.

Does https://lore.kernel.org/all/20250915070811.3422578-1-xb@ultrarisc.com/
fix this?

Thanks,
drew

> 
> This patch adds two new context registers (ctxsstatus and 
> ctxhstatus) to the kvm_vcpu_csr structure and implements 
> the necessary KVM get and set logic to preserve these values 
> during migration.
> 
> QEMU needs to be updated to support these new registers.
> See https://github.com/tjy-zhu/qemu
> for the corresponding QEMU changes.
> 
> I'm not sure if adding these CSR registers is a right way. RISCV
> KVM doesn't have API to save these two context csrs now. I will
> submit the corresponding QEMU patch to the QEMU community if
> KVM has API to get and set them.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Tested-by: Tianshun Sun <stsmail163@163.com>
> ---
>  arch/riscv/include/asm/kvm_host.h |  2 ++
>  arch/riscv/include/uapi/asm/kvm.h |  2 ++
>  arch/riscv/kvm/vcpu_onereg.c      | 16 ++++++++++++++++
>  3 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index d71d3299a..55604b075 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -161,6 +161,8 @@ struct kvm_vcpu_csr {
>  	unsigned long vsatp;
>  	unsigned long scounteren;
>  	unsigned long senvcfg;
> +	unsigned long ctxsstatus;
> +	unsigned long ctxhstatus;
>  };
>  
>  struct kvm_vcpu_config {
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index ef27d4289..cd7d7087f 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -81,6 +81,8 @@ struct kvm_riscv_csr {
>  	unsigned long satp;
>  	unsigned long scounteren;
>  	unsigned long senvcfg;
> +	unsigned long ctxsstatus;
> +	unsigned long ctxhstatus;
>  };
>  
>  /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index cce6a38ea..284ee6e81 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -489,6 +489,12 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
>  	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
>  		return -ENOENT;
>  
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus))
> +		csr->ctxsstatus = vcpu->arch.guest_context.sstatus;
> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus))
> +		csr->ctxhstatus = vcpu->arch.guest_context.hstatus;
> +
>  	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
>  		kvm_riscv_vcpu_flush_interrupts(vcpu);
>  		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
> @@ -515,6 +521,16 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
>  
>  	((unsigned long *)csr)[reg_num] = reg_val;
>  
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus)) {
> +		if (csr->ctxsstatus != 0)
> +			vcpu->arch.guest_context.sstatus = csr->ctxsstatus;
> +	}
> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus)) {
> +		if (csr->ctxhstatus != 0)
> +			vcpu->arch.guest_context.hstatus = csr->ctxhstatus;
> +	}
> +
>  	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
>  		WRITE_ONCE(vcpu->arch.irqs_pending_mask[0], 0);
>  
> -- 
> 2.43.0
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
