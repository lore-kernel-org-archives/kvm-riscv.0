Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BF3ACA0FE7
	for <kvm-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 12:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TFOww+wUUkDMhm4OOICl+sKHQ8EWw4e6q0wKRXVib54=; b=MDxqp8SN5lzIGv
	beZ5SHcUZdIIMxnRoqPBdWIrwDq5Z/DMAZAkUB/tyLy00ufDVHzN/K6K/kUmy1l7gFSc6c+2R1VEs
	omdiOolgrH9boJDr7+TcjXUprsEVPSMrBBG1ysZ8mONJI8BgCJ0GF0JcgwrmQ4Aedlr0AoZS0Qjnd
	P9LTMwb+pF5Sdpmt8mkn4Skg3Upw9XG6ofJGXCBOA9jKwtiojaO3pDGBIuZ+H1w6FGpXB4ICVBR3v
	tGmBnaTtn6o43w/5NcxLUR43H6PDg8InuFYCzPxG7VlFe59CinyvSszGoq3GgAgKfZ+1Tg2X3+/WQ
	Rzg40E+pndVHHnxq/2wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqWgX-00000007yJX-2ATt;
	Mon, 25 Aug 2025 12:52:29 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqVD1-00000007ipb-0trX
	for kvm-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 11:17:56 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-88432e27c77so107546739f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 25 Aug 2025 04:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1756120674; x=1756725474; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i6Nj+duoF70RMGzdcYouFDD8VMssifTIE0BrLQHJWZQ=;
        b=PxLKzeFGBaKVney3KlB5uFWwroJ9RN2zxswueOcFlHuI1jYl43XGJMIPyKDSkeiITQ
         HxdjZKWaFoXzUYNcE2A6sPnFpF+Tt9P7umrNgh0D3lUfsJ8G3ZDDdHBEMBwZNcl8PS1u
         ZjyWtdp5ukeGodv7yRR3McFlpEms4rNX76jZevAoIDBakwN37fbAZJLzKV2XcPsmt0Sb
         Pkn8Gzn9vg0hyYqPfHJ0mL5lFg+dbSaj0sxIzTRDhGaYOPcuWzcCJvKuICUtYeEK5+TA
         dtRpTIyVPL05Rkj2hzYgl2IFg+cHH83bUSm/J+SXUGbRYOfBfYCJpdu6dKzV/sNRji5i
         sS1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756120674; x=1756725474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i6Nj+duoF70RMGzdcYouFDD8VMssifTIE0BrLQHJWZQ=;
        b=XGlJvWTAjYaYSPnF9H6Nmd1kcsnOH/myXwkPqcF22U4x8hXLZ8SNDze2ROa/t3wOJm
         yLDSCpFk2LabrzIJreqyORCvTC79zauzDw02Ks++FmHnWOiV21zQPzB461p/fso5rvEa
         wcbOWfmlUZXMz/655mfWT64QqilM8y3KwKKRoU5v4K69HHvSk0WY/VnyAbXiUGOmssyB
         mCDVQNC9PjSH8ZotFt67h4TzdEl92yketVEuxU+moy5D5hOBpG9MWotXJQJ5PxKSfxv8
         q4sXENJ/2Q1gnOJ60Kq9YoIZlDo2BjsxRAcMEPS67kpRurWrw6JxAoS/i3M7WHjJXpgB
         i7dg==
X-Forwarded-Encrypted: i=1; AJvYcCVv/qkw+roWZ6O+s8XIuejJe6Ju9suCNMf9dvWUW2myDnOFK6ASp3scKpXYHTj71oimCYbXl26f+A0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9RwuDNfJYpbBLwp5RnanwQTV4PU9BG/h1rj0olBvLI9xORCvb
	uCpbE42w2+8FG0lv7SPOitDrMfjzS2TsXzj1AfiCoCA7tFXPbv1a2RAoe5/xVtrP07s=
X-Gm-Gg: ASbGnctIrtHd1ChhEfORfJY1b6B+T9+/TxtTBd6Hojup8DrN2oT3WYjMh0blByFPbkf
	x6aNiy4CEywg7usIrZtkHAxq/llKiuWID3LuaPquR4MxN8hcxvIhKd/OtlY87tPlRCzJRdgN9S0
	/KWWdOjo9M41U5NuWQCep5HDCNc089vLoZAEUn3svNP0/L18tIupLxV3pzidtCPFqgoNEKwkV0Q
	t9CefdCg8Dy1ngKWo+LVtLraEKdscsaIWx94IkllWoQHpmnIAacNY/B57lXOT9C9LfvPuzeC9tn
	1XV8rZ/0YnA4qr75pS+hKVS/XVMcN/NY5Xxr/M+gcyi7TJvai1hTnLWE/xrqMHVC4aquFyM70/A
	oKV5hJg2qK6FzikcI7Vr4blny3OgOFtqC1T2R
X-Google-Smtp-Source: AGHT+IEigjCbL6EPOUxTZc6hVZl568KpQrRQoMmE5YONwYCGYB+k64Dw2FcHbKRMyeeSPlD17oBMJw==
X-Received: by 2002:a05:6602:13d0:b0:881:8a58:3bc2 with SMTP id ca18e2360f4ac-886bd12e5e5mr1736254339f.6.1756120674148;
        Mon, 25 Aug 2025 04:17:54 -0700 (PDT)
Received: from localhost ([138.199.100.237])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-886c8f0a83esm464303639f.10.2025.08.25.04.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Aug 2025 04:17:53 -0700 (PDT)
Date: Mon, 25 Aug 2025 06:17:51 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: skip csr restore if vcpu preempted reload
Message-ID: <20250825-a30edf6b9d0301b5fdbcfffa@orel>
References: <20250825110708.75474-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250825110708.75474-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_041755_252853_05A89893 
X-CRM114-Status: GOOD (  25.90  )
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

On Mon, Aug 25, 2025 at 07:07:08PM +0800, Jinyu Tang wrote:
> The kvm_arch_vcpu_load() function is called in two cases for riscv:
> 1. When entering KVM_RUN from userspace ioctl.
> 2. When a preempted VCPU is scheduled back.
> 
> In the second case, if no other KVM VCPU has run on this CPU since the
> current VCPU was preempted, the guest CSR (including AIA CSRS) values 
> are still valid in the hardware and do not need to be restored.
> 
> This patch is to skip the CSR write path when:
> 1. The VCPU was previously preempted
> (vcpu->scheduled_out == 1).
> 2. It is being reloaded on the same physical CPU
> (vcpu->arch.last_exit_cpu == cpu).
> 3. No other KVM VCPU has used this CPU in the meantime
> (vcpu == __this_cpu_read(kvm_former_vcpu)).
> 
> This reduces many CSR writes with frequent preemption on the same CPU.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
> ---
>  v1 -> v2:
>  Apply the logic to aia csr load. Thanks for
>  Andrew Jones's advice.
> 
>  arch/riscv/kvm/vcpu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e5640..e50d1f76c 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -25,6 +25,8 @@
>  #define CREATE_TRACE_POINTS
>  #include "trace.h"
>  
> +static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
> +
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>  	KVM_GENERIC_VCPU_STATS(),
>  	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
> @@ -581,6 +583,10 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
> +	if  (vcpu == __this_cpu_read(kvm_former_vcpu) &&
> +		vcpu->arch.last_exit_cpu == cpu)

Why was the vcpu->scheduled_out check dropped? The changelog doesn't
mention that and the commit message still states that it is checked.

Thanks,
drew

> +		goto csr_restore_done;
> +
>  	if (kvm_riscv_nacl_sync_csr_available()) {
>  		nsh = nacl_shmem();
>  		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
> @@ -624,6 +630,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	kvm_riscv_mmu_update_hgatp(vcpu);
>  
> +	kvm_riscv_vcpu_aia_load(vcpu, cpu);
> +
> +csr_restore_done:
>  	kvm_riscv_vcpu_timer_restore(vcpu);
>  
>  	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
> @@ -633,8 +642,6 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
>  					    vcpu->arch.isa);
>  
> -	kvm_riscv_vcpu_aia_load(vcpu, cpu);
> -
>  	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
>  
>  	vcpu->cpu = cpu;
> @@ -645,6 +652,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  
> +	__this_cpu_write(kvm_former_vcpu, vcpu);
> +
>  	vcpu->cpu = -1;
>  
>  	kvm_riscv_vcpu_aia_put(vcpu);
> -- 
> 2.43.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
