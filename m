Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4727EC02190
	for <kvm-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 05:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLx0hH0wq+8Y2Nm+FYa3m6fhreECnoWY++dEYXtSvPs=; b=QiWMTZ1liDUCgm
	Y2CsrrUzi/wfzyR84OkFOomO/W8ahKF4Qt4bumVOGvN2hUiqlELjA9QleL/VuDZebpk1kgaVNbJku
	39ZCGzf5UNa64Xrmfw6SYEw6BYd62KqGLIQzEG4UboYszkAcCIVHWkH5tngeoUrhKfBoJJWRXYTZd
	b95UQjWV6p1jBNN6AaElLkdIw8MdttKnahW8l0gLQ5gS2b4yAgNCNkTmVlr/Q0aQLz0Aruw15mHkg
	YwX88b7bWUCkWUNqT0+eEd8xArEDEsnR0beZWIiNCvNp6x4s2qAgCs5uWbYfI1Fcb+Fok87Q6VBER
	IRUiX6dem68Pu5davR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepF5-0000000Eb28-2CMe;
	Mon, 03 Feb 2025 05:43:31 +0000
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepF1-0000000Eb11-2jcb
	for kvm-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 05:43:29 +0000
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-3ce76b8d5bcso35601705ab.0
        for <kvm-riscv@lists.infradead.org>; Sun, 02 Feb 2025 21:43:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1738561406; x=1739166206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=Ssh9fvDGwCBcH0vZo8c+EzvCo0BsqIOBT7cxgHyxr7/QQi2B+f5roKDVXKPFHm31rc
         dzSFO57+Vulr1W+9xF+C23DpFtZ5vQyyQx2caArD0ZQ7/Edl63MobHuGH8NQTlOZTq5q
         PMLgP8RHQbpqGwjk38T0V2hueQhuGWqcsh4nbD7wjcXW/XHawKrxjcFj89sF1M0M3snl
         SUZstvewG4ZwoxotPmdWcq3y5NdILMEwOlDrNwmfFZPdy5/JkkQXKa393mA6kSSDqxQv
         FMU0peGTGK3tXDj+ZVjqLJLl30pikZqGlvKh+8C7Ho9V7DX3vs7v+TkZ0qpzXNOkJEy3
         tJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738561406; x=1739166206;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Abrmc3V+wCkg7+h5ECgKA37T7F550/MzIW2BgVmGe00=;
        b=cwXHA8UB+sknmXeRf+jpdXq6NCPCU5Tz4KXtE/SjgP2ftvlGKrzvd2dQIP2JetfAQg
         LWPwbu4HSUxbWadTMlSpr9kkBgVE8wOLRFQSojND4mDQPrWdMIetRluBU/gTfnFTv58d
         SG7vs9V/Z8nCRHmbki1bdO4wC0y/VTfoomsKMeSOLoLJ5CXRlGbwlt0modHAK8LXAK93
         63U+iUwwlMyR40vVtSH38xVRs1EuL2yPcXoo7bxj30xoXDoTFge8SonV+yq6uAqhf/mR
         n8M1NNOqgq2AeRtrAlLcfQG5sXNueXqSTlH4XNKDz63w5slcXLVxGt7s/KjuyTH6OdLZ
         84bQ==
X-Forwarded-Encrypted: i=1; AJvYcCXlfWjj/LPvPov4+C1Nk16/URzMCTmLxsGEVOweIFg3BODi2KsgnjvOPlNME92ACBWAC5DGoGqgpqE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwAOp2Zp5m5MW9tY94Yu0vVvoY2FoTjjZmXRJ2DsGdEy/v+SS7X
	v21TgpYGp8yScyME6B5qrV4LuFvZHdkomg5KC4wfX8A8OE8vwWYJDfvzz34BWwQ=
X-Gm-Gg: ASbGnctnLdEwYHVmQCESUgWZZt2Uu5PVQ/roh+Hox8jeppE8K5VszIxWy9/0/oh2Cun
	70cF7N6ZavFwHRXTi4ROeDaSoP+K0SOwUKSY7ZgF4YuYvDmujsXroAmPrFMl4AR3mFFZmGxWNUv
	91Uh5fEFIn+qMgL6Rwkzvr1Zl2vsy0Drd+KJZBEs/uMY99rC4BTFAhPnRu1BxrMOmI5rhkMKk+I
	2n7n1pC94Y/ge1Y76mJMugstH0RXlzg5y38hNxNKFulTs4qEzGftG96vbIo0tW3Etcpasg2CuZD
	udCypgy/4Sl1L3ONKr+SKFJjG51WtX3VonyLSX4=
X-Google-Smtp-Source: AGHT+IHl4RRDfRdJ9K6Cx6v8dXThe6D880Ogx8BJ2U75l88ormi4P0wAtnHOCwaBHFLWcb6LIw7+7w==
X-Received: by 2002:a05:6e02:1fc2:b0:3ce:78ab:dcd1 with SMTP id e9e14a558f8ab-3cffe4a7bf1mr175908815ab.19.1738561406189;
        Sun, 02 Feb 2025 21:43:26 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.9])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d018c28ea5sm15310115ab.35.2025.02.02.21.43.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 21:43:25 -0800 (PST)
Message-ID: <44468c97-06e6-4bfe-930d-444ab7ead90d@sifive.com>
Date: Sun, 2 Feb 2025 23:43:22 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] riscv: kvm: drop 32-bit host support
To: Arnd Bergmann <arnd@kernel.org>, kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, "A. Wilcox" <AWilcox@Wilcox-Tech.com>,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org
References: <20241221214223.3046298-1-arnd@kernel.org>
 <20241221214223.3046298-3-arnd@kernel.org>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20241221214223.3046298-3-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214327_716188_43F6383A 
X-CRM114-Status: GOOD (  24.63  )
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

Hi Arnd,

On 2024-12-21 3:42 PM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> KVM support on RISC-V includes both 32-bit and 64-bit host mode, but in
> practice, all RISC-V SoCs that may use this are 64-bit:
> 
> As of linux-6.13, there is no mainline Linux support for any specific
> 32-bit SoC in arch/riscv/, although the generic qemu model should work.
> 
> The available RV32 CPU implementations are mostly built for
> microcontroller applications and are lacking a memory management
> unit. There are a few CPU cores with an MMU, but those still lack the
> hypervisor extensions needed for running KVM.
> 
> This is unlikely to change in the future, so remove the 32-bit host
> code and simplify the test matrix.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/kvm/Kconfig            |   2 +-
>  arch/riscv/kvm/aia.c              | 105 ------------------------------
>  arch/riscv/kvm/aia_imsic.c        |  34 ----------
>  arch/riscv/kvm/mmu.c              |   8 ---
>  arch/riscv/kvm/vcpu_exit.c        |   4 --
>  arch/riscv/kvm/vcpu_insn.c        |  12 ----
>  arch/riscv/kvm/vcpu_sbi_pmu.c     |   8 ---
>  arch/riscv/kvm/vcpu_sbi_replace.c |   4 --
>  arch/riscv/kvm/vcpu_sbi_v01.c     |   4 --
>  arch/riscv/kvm/vcpu_timer.c       |  20 ------
>  10 files changed, 1 insertion(+), 200 deletions(-)
> 
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 0c3cbb0915ff..7405722e4433 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -19,7 +19,7 @@ if VIRTUALIZATION
>  
>  config KVM
>  	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
> -	depends on RISCV_SBI && MMU
> +	depends on RISCV_SBI && MMU && 64BIT
>  	select HAVE_KVM_IRQCHIP
>  	select HAVE_KVM_IRQ_ROUTING
>  	select HAVE_KVM_MSI
> diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
> index 19afd1f23537..a399a5a9af0e 100644
> --- a/arch/riscv/kvm/aia.c
> +++ b/arch/riscv/kvm/aia.c
> @@ -66,33 +66,6 @@ static inline unsigned long aia_hvictl_value(bool ext_irq_pending)
>  	return hvictl;
>  }
>  
> -#ifdef CONFIG_32BIT
> -void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -	unsigned long mask, val;
> -
> -	if (!kvm_riscv_aia_available())
> -		return;
> -
> -	if (READ_ONCE(vcpu->arch.irqs_pending_mask[1])) {
> -		mask = xchg_acquire(&vcpu->arch.irqs_pending_mask[1], 0);
> -		val = READ_ONCE(vcpu->arch.irqs_pending[1]) & mask;
> -
> -		csr->hviph &= ~mask;
> -		csr->hviph |= val;
> -	}
> -}
> -
> -void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
> -{
> -	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
> -
> -	if (kvm_riscv_aia_available())
> -		csr->vsieh = ncsr_read(CSR_VSIEH);
> -}
> -#endif
> -
>  bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  {
>  	int hgei;
> @@ -101,12 +74,6 @@ bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
>  	if (!kvm_riscv_aia_available())
>  		return false;
>  
> -#ifdef CONFIG_32BIT
> -	if (READ_ONCE(vcpu->arch.irqs_pending[1]) &
> -	    (vcpu->arch.aia_context.guest_csr.vsieh & upper_32_bits(mask)))
> -		return true;
> -#endif
> -
>  	seip = vcpu->arch.guest_csr.vsie;
>  	seip &= (unsigned long)mask;
>  	seip &= BIT(IRQ_S_EXT);
> @@ -128,9 +95,6 @@ void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
>  	if (!kvm_riscv_aia_available())
>  		return;
>  
> -#ifdef CONFIG_32BIT
> -	ncsr_write(CSR_HVIPH, vcpu->arch.aia_context.guest_csr.hviph);
> -#endif
>  	ncsr_write(CSR_HVICTL, aia_hvictl_value(!!(csr->hvip & BIT(IRQ_VS_EXT))));
>  }
>  
> @@ -147,22 +111,10 @@ void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
>  		nacl_csr_write(nsh, CSR_VSISELECT, csr->vsiselect);
>  		nacl_csr_write(nsh, CSR_HVIPRIO1, csr->hviprio1);
>  		nacl_csr_write(nsh, CSR_HVIPRIO2, csr->hviprio2);
> -#ifdef CONFIG_32BIT
> -		nacl_csr_write(nsh, CSR_VSIEH, csr->vsieh);
> -		nacl_csr_write(nsh, CSR_HVIPH, csr->hviph);
> -		nacl_csr_write(nsh, CSR_HVIPRIO1H, csr->hviprio1h);
> -		nacl_csr_write(nsh, CSR_HVIPRIO2H, csr->hviprio2h);
> -#endif

One minor cleanup: since this patch removes all accesses to these 32-bit-only
high-half CSRs, the corresponding members should also be removed from struct
kvm_vcpu_aia_csr in asm/kvm_aia.h.

Regards,
Samuel


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
