Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D0D4CA0EF5
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 19:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3BsG38eQUp+MCsijtgm/yAgXzvWZaqBVLaHeofTv4O8=; b=Hw9AL2DlXPPHJa
	lNMZ/Yx5RbUnJInKqLRItvLSpUa6xM84sKR77hFiDtAzLC/jCt2o1bzHDmy1gMY2jiWmxqED6smR2
	Xz7ITRZArLjyRTgsf8oArFvC59s0fHNXgE4e59eVmbsGx6AOLSjlzLph6Mx44XRI62MkRUD4a/Cyu
	BcAF9bMnzjrxehJGnVhR4AvxqM5izGedZpsMmBeTFX111OXkB4PVlwZlPCIV1v0LAhAV/NNB5GhEc
	50EOZNtERdecCRDYpMuyJUwKdqk+FNY4wnR9Ap8Pxxs2EhAZrxoLjpj7mBFVIdA+NNg+plkM9EPlb
	Oh4VtLWmuNpvCbOj8xXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoRv1-0000000BObA-1Z8M;
	Tue, 19 Aug 2025 19:22:51 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoOoV-0000000AxyA-3uad
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 16:03:58 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-435de70ed23so2997997b6e.1
        for <kvm-riscv@lists.infradead.org>; Tue, 19 Aug 2025 09:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755619434; x=1756224234; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yC88mGoSbqZk1f9KFdafn4QiNyHx2q3f5J/pFIXzL8g=;
        b=HPHk/+8Fy3CezKj9VRFfG6xjAr+Q+vX1TIGqRtQmkZKMJtSjkolsawdzfCo73Wq+Ik
         LCP7GMQ1uy9t1AX54KZ003o8CJ2n8g0I+MYKqkXFqaDlEV2NqGsrqhZCcwJ9AGvJINRv
         81DDLigUwqoS01xGm9UYn0Du+SDL5HrqGuBmDCgw+KqHW2hsXvcJGzYM9IBSuA/uuVZp
         gDtMkl6HfnxFpcOwAtGXOEHe5k9r0zdvvCpHsJYmtnixmhnIq4x2tz3IcHzRQCDu8kgC
         LD0qP3Dj3GY60OzbN/SDdgauflNeBluLZKg5Kbk9OftpL9jUcnjNy4mwapLHWXqxr72D
         A8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755619434; x=1756224234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yC88mGoSbqZk1f9KFdafn4QiNyHx2q3f5J/pFIXzL8g=;
        b=q7PPWZM+7XePI597roYbNEbHa6VwQk/aHLPrQrtPQSfl07TxEyetAGO2k0Xy35AmWb
         SSQJyeJqGXyk7Qmnyhmbgko3Pl9OUBJkPgRECyhzTc2o3ergbuLWIYApccC5PAeo+jcY
         YqkOsmq50N6FalTRpEDLOPu8J4lt8V6NUxiegTrr0X7PHLE63ZCKFmQ3fizKXZIEWC0P
         traAphRuKQqgd+uf0ocgrR/d5gclf1tCvjTFk2NnKV2t4vQFU/7rnkUCLOV4OcWzVOJy
         Ip0m22oMxPDBpXvau2lumGGrZ14UB9Mn79yRYvPcgQV1y8aRC1WKNIqs4X9xdDf8KiUm
         LA8A==
X-Forwarded-Encrypted: i=1; AJvYcCVzyvuiAeDaYeoMyxOK66Jy5Vmqb/PTP+wcH84/BAhlROnKWgadX+Jt7TTN7X8qONYZ1/Y7fXLtcf0=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSsAyD+hAMv2xG5qPfjoIs8g/rrMuv4nuy5aKRDHHUSWCj+js2
	n7/4jIvi5pVhD7oxkCM9Brx+flS9QDr4Q4P7g8a6oYCNTgmdk0NX9Iz2GEOzcO1Le9g=
X-Gm-Gg: ASbGncvV8+Nk9LjsjyXe9MReyfgvkETTbrZ0uPcS3C9NG6/UGG+UkS+QKZbWgo0ErTg
	O9R5oScHAMqybUWxor8EJh/i7afOPg2ikW8jhwoMRWk5geEI9gMpwb+nOsaTsu4yirXvAHkhdMY
	ul4TLvipdIW46+i8woOiCXLgfMtTAs1nrMDVwSayn83chbopPduaYu5PCpiQyGOxvyEEAxJqfyh
	soVuMrW7SRBfdkpzaENHhs64J+Jc7cQEm5L7tz/memFCWXnIxphRFS210CLGgwSWo9pwBFDetw4
	geGzpWPCA3elxwsaNdc6Nc78wRYiTStWq7nkIpwIviA0FlQCEAfxmLiwqISqOiiEXCgLiAMlNG7
	8Opv/HvRCNN5jdijlbcuy7xRxRlOptjU0Wjs=
X-Google-Smtp-Source: AGHT+IG/y8PrsSJqgoq3CvRF+MG0X5iWsQigK66jrK0xGiIjJMRnFVwGXiYkN7AL+ccvUXU/i/hDzw==
X-Received: by 2002:a05:6808:1b0e:b0:435:744c:9297 with SMTP id 5614622812f47-436cdca93famr1950579b6e.16.1755619434540;
        Tue, 19 Aug 2025 09:03:54 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-50c949f75d1sm3510509173.79.2025.08.19.09.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 09:03:54 -0700 (PDT)
Date: Tue, 19 Aug 2025 11:03:53 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Conor Dooley <conor.dooley@microchip.com>, Yong-Xuan Wang <yongxuan.wang@sifive.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: skip csr restore if vcpu preempted reload
Message-ID: <20250819-62ec62e0ef8ed3d928f56ddc@orel>
References: <20250807114220.559098-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250807114220.559098-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_090355_967093_A1E72230 
X-CRM114-Status: GOOD (  23.73  )
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

On Thu, Aug 07, 2025 at 07:42:20PM +0800, Jinyu Tang wrote:
> The kvm_arch_vcpu_load() function is called in two cases for riscv:
> 1. When entering KVM_RUN from userspace ioctl.
> 2. When a preempted VCPU is scheduled back.
> 
> In the second case, if no other KVM VCPU has run on this CPU since the
> current VCPU was preempted, the guest CSR values are still valid in
> the hardware and do not need to be restored.
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
> ---
>  arch/riscv/kvm/vcpu.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index f001e5640..1c6c55ee1 100644
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
> +	if (vcpu->scheduled_out && vcpu == __this_cpu_read(kvm_former_vcpu) &&
> +		vcpu->arch.last_exit_cpu == cpu)
> +		goto csr_restore_done;
> +
>  	if (kvm_riscv_nacl_sync_csr_available()) {
>  		nsh = nacl_shmem();
>  		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
> @@ -624,6 +630,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	kvm_riscv_mmu_update_hgatp(vcpu);
>  
> +csr_restore_done:
>  	kvm_riscv_vcpu_timer_restore(vcpu);
>  
>  	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
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

This looks like a good idea, but can't we also apply it to
kvm_riscv_vcpu_aia_load()? And, if we could track whether or
not the kernel uses FP and/or vector then we could also avoid
restoring those registers when they haven't been used.

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
