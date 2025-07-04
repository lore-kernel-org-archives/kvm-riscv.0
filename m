Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1FCC8303D
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 19:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hr7sM5LWLvvhHWdQ0BnoyWjhNakoYpvfOdqlfMBkfuU=; b=xAWs4iXUU22FWH
	CjctkIdOtaUp4YKChOciX7aEuweLXBco0GCohgFZ8tSAxONEvQqJ0b3QUPyKc/dEZs8EsBoFw8com
	xcY0NTLBhX/SCn86VfJMeRCmLMEKkWwx7MfilRYwgFM0Pc3ioXF/rGUeB0FpMGMSU9kkvd1YAm5+V
	L4j0aSp886az6jWImd2FGMD27vnVJ1iGkutlDIqnxNU/u3gzsjQ39PoRC27czq5iAzJQBVw8YIR/K
	BcjpDWl0qpKGiKRHtrodkHlTHTGRflQ1miRyw0AUPw3uSUk8iXaNeRWEZ2AQx/5FmAnrQyqZEq3Rm
	PLCxh9T8zBi3P0hHmA6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXmMk-0000000FNbN-1mU0;
	Fri, 04 Jul 2025 19:46:34 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXmMh-0000000FNa9-22yy
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 19:46:33 +0000
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 6F2EF3F942
	for <kvm-riscv@lists.infradead.org>; Fri,  4 Jul 2025 19:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1751658386;
	bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type;
	b=bjXuYnmnRD3ihiFM/eOtHYiAC+zaYlKamdnlmvgTjhhrT3ev7d/kx/CY7vfQuO164
	 Zupvu6PO7YXtEHExeCjFJu3zElg/SUkc9vxalEcChIS/TPIpC6CgiVUlY8W5c8jL/8
	 EimPiSE1zQXJrn9Ztm7wNA/iZHAYEM8SEIhcQ3fb2e5J7ExmFIIpl38I4WyGHCJE7H
	 hoX8dHDPCATgCDPx9Tau6WVGGfw/SxFT888t57oblb4VfZp35A3ILe9rDbxbHuP8BK
	 e5OfONAor8+F+MU7PcM4NsS2tRWRKJep53A+tIXzsTMkaLzkygdHWcBqfiFbXt9oMG
	 njUhkZcVw4EjQ==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ae0a0683d6dso129530366b.2
        for <kvm-riscv@lists.infradead.org>; Fri, 04 Jul 2025 12:46:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751658385; x=1752263185;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VLrA3L+1opa6K3kyWseF7FHmwqIbcBLyJ0FYSjgmPjU=;
        b=ZcS7Dj+y3JslV0TIopAGk9v4i+28taBXJAm2bYkU31D3zeFLnaLHGiyiSb+YztxiLm
         OjqJCR+33DRq/oYalucp1xkxYUPlLVPuTwSilXjOsMUft0Fzht09I500dJAlGEpIyx8C
         ecwu5enpxnumZeNhang6u2jFbf5kHgDp1kuvsmwVSNU4fpChNMOqYoeklMFNg8EfcYbq
         iYiJXMtMEhYDMLe4UIIqzq1woJmPQbE5rIzZ4wUa7Cvkj44GlHsgQlGd0bHQAUh0IBwT
         FRNSjYCIE+vhORRe+xYFM0WN4sVauznwSiKZcCmquWv2GvMWzkD3eD4E/90rAjkCXACa
         BKAg==
X-Forwarded-Encrypted: i=1; AJvYcCWA7BhJ7k4U1gDOYkkF5wpkMTkKRLOY3FCOYPOUaRExdKUxMgfulOM70zpfUIR79U+bH3qZMy1bTZM=@lists.infradead.org
X-Gm-Message-State: AOJu0YwUG56rQsZ6IOHVKEN+lzfM+Z1VODtqKSx+GKzA+aVxxMoIWstx
	2SsJEJrmkl+u5LE3NxD7I53kAlUVKfAJAzASZEZtvXq455Obpzhoik0G0d5ACo0w6/HakpgUFgG
	ptlT4nkbTb2FtAVuSpkljn5cq6/3jm5sET79oigVRC4pvk3i6aPjS3xYfz1p2HukyDeP2lPTEoi
	QxNWuPhjU=
X-Gm-Gg: ASbGncvFOZyvpx1ZPdpfZIuqQNkZCMRyxaU+/SrJQFK7TC/2G7k62r5w79jzTzoP+fq
	ChY3AArqNUebScIgl0jcWHSxzc6B9u2zpA6NUXIBxR0fs8zQDLiHWeV6s2GWT9ckp9DpNusyvdV
	7+LXZk7rL8yOg/HjRX1txHXzym/b7ern21xiA9HLmhcYHKjEdg9EaJMOCgRomGi5zA0ZCG7dxvr
	OGN4Obxgiu78hYUgPWmRyTMPpQADZIam0ETfRtED2+DGGuGD9PPnCeBJxnm0Yxu26EqXguL69LK
	+5vlGAfMA5dS2haPbVTEoVJFYEP1Ix+Z0uKtjcaVoHD8F5fh3Ej9g81isN8lCBQMcVNDY8It2qf
	CY9V7/OMr0gc=
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368752766b.57.1751658384980;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbsxPqPhYYSbtLZBKO2k3ZdPJhfdbdyy0/f6vKPhOggzCylZPnmMjp2Q8zbaJhX5YMtK8lng==
X-Received: by 2002:a17:906:f5a7:b0:ae1:f1e0:8730 with SMTP id a640c23a62f3a-ae3fe78fd44mr368750466b.57.1751658384601;
        Fri, 04 Jul 2025 12:46:24 -0700 (PDT)
Received: from ?IPV6:2a02:3035:6e0:a37c:f324:1674:f46a:492? ([2a02:3035:6e0:a37c:f324:1674:f46a:492])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f6ac5643sm221184466b.74.2025.07.04.12.46.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 12:46:23 -0700 (PDT)
Message-ID: <42c6f9d7-ac1a-4f74-8b0b-ac8fb02de0b0@canonical.com>
Date: Fri, 4 Jul 2025 21:46:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] RISC-V: KVM: Disable vstimecmp before exiting to
 user-space
To: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
References: <20250704153838.6575-1-apatel@ventanamicro.com>
 <20250704153838.6575-2-apatel@ventanamicro.com>
Content-Language: en-US
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
In-Reply-To: <20250704153838.6575-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_124631_859892_7A6E2F6D 
X-CRM114-Status: GOOD (  19.14  )
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

On 04.07.25 17:38, Anup Patel wrote:
> If VS-timer expires when no VCPU running on a host CPU then WFI
> executed by such host CPU will be effective NOP resulting in no
> power savings. This is as-per RISC-V Privileged specificaiton
> which says: "WFI is also required to resume execution for locally
> enabled interrupts pending at any privilege level, regardless of
> the global interrupt enable at each privilege level."
> 
> To address the above issue, vstimecmp CSR must be set to -1UL over
> here when VCPU is scheduled-out or exits to user space.
> 
> Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
> Fixes: cea8896bd936 ("RISC-V: KVM: Fix kvm_riscv_vcpu_timer_pending() for Sstc")
> Reported-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
> Closes: https://bugs.launchpad.net/ubuntu/+source/linux/+bug/2112578
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

Anup and Atish, thanks a lot for investigating.

I built upstream kernel 6.14.9 with the patches of this series and that 
resolved the problem reported in Launchpad bug report 2112578.

Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>

> ---
>   arch/riscv/kvm/vcpu_timer.c | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
> index ff672fa71fcc..85a7262115e1 100644
> --- a/arch/riscv/kvm/vcpu_timer.c
> +++ b/arch/riscv/kvm/vcpu_timer.c
> @@ -345,8 +345,24 @@ void kvm_riscv_vcpu_timer_save(struct kvm_vcpu *vcpu)
>   	/*
>   	 * The vstimecmp CSRs are saved by kvm_riscv_vcpu_timer_sync()
>   	 * upon every VM exit so no need to save here.
> +	 *
> +	 * If VS-timer expires when no VCPU running on a host CPU then
> +	 * WFI executed by such host CPU will be effective NOP resulting
> +	 * in no power savings. This is because as-per RISC-V Privileged
> +	 * specificaiton: "WFI is also required to resume execution for
> +	 * locally enabled interrupts pending at any privilege level,
> +	 * regardless of the global interrupt enable at each privilege
> +	 * level."
> +	 *
> +	 * To address the above issue, vstimecmp CSR must be set to -1UL
> +	 * over here when VCPU is scheduled-out or exits to user space.
>   	 */
>   
> +	csr_write(CSR_VSTIMECMP, -1UL);
> +#if defined(CONFIG_32BIT)
> +	csr_write(CSR_VSTIMECMPH, -1UL);
> +#endif
> +
>   	/* timer should be enabled for the remaining operations */
>   	if (unlikely(!t->init_done))
>   		return;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
