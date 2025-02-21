Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D76C021AA
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 08:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJFOQBvRZLKc/CTDn4iofZI0nYd012VT+N1RE+Aas2w=; b=QwN+CrtK7qXXkq
	28/886wZgRuyYUigc8vtwyvKLy/rSIdnv39LA2cOHz7eSoITGjTZx6owJhbW/P37jE2kjun24JQ3Q
	g5mnsmWiPMp7UtwMDEidHFf5njr28UScQyyK4wDE4kAxqlWiLXcECtlLnizNwCpngri+erAY8tIG8
	uIGpjPHORdfH1ZZaFGSEnPK/mm8eWLGfxR9PHKGLvOyJNek2MLa/6QJHg96A3DnwtkYwv3+LZKTIT
	Ems8/T/SILcnxMrXQkgjNw6svsfJgPNRmEXBbGJ3ddHs7Rcfxl5QDyTWh95Ynrv9835KcllEyl5IV
	eFCk5DWdCDhk6GVabrIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOkH-00000004mYl-2zgg;
	Fri, 21 Feb 2025 08:50:53 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlOi7-00000004m5K-0tNM
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 08:48:40 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-439a2780b44so11393965e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 00:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740127717; x=1740732517; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eb6L/xHidvDmAG1R9QTqFpwECa6Y0bk51MMmtIvM9Cw=;
        b=Hh392CRR37gtg2Hv72QysNueLd0nh1fM4TGdSRLfq9zhuW2iY0lzP/Y+N7SpgdVRCu
         G61uySRwXusTrt9UVno8C6jVSOV24E1p1Ks0HS0IwShrjSGqk+VIPLcD3fXhR2ONn2/f
         UzhW5kW/rdPMzDcg6iUklwMxgeSerPqsob8yAO0ycYJSUE+4QK9RQZ3vBea5LLUNRZqq
         5a1RI0ailCCT4hF31mkfR5ftlQQUTN2mMfacdhTxv1dLote6qHYT+RQ8hA84+aNN7tau
         k1uddU7FSpFkT86vcpffCBfbX6ZACZ455gosGvbo60dF3J+lE+P+sCGlP3fQOxWEyf9F
         t31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740127717; x=1740732517;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eb6L/xHidvDmAG1R9QTqFpwECa6Y0bk51MMmtIvM9Cw=;
        b=t5OCyGLA1c5ZwqIblaT8FOyhPnkBNViOv+GX+JXF+bF8gujV+sQrOCbJpiZIMyw3w0
         Wqqvyah+0nEZ08/DgKnUJULDMI9ynOolWu5Xj9lq3gr9wWfau37SzkbTdj8eLJaajLVY
         r4BVi+xkCc/haxnyED40aF5BZS8GcFr5mrxTjRZxRCZSJb0zgFCFKjUTPQFmsM8BUWNB
         tRxfbugvHyK2JvshwA1cSNdogpwQwug0gY2meQJF67i3EoGDrNfVPQquGzEisYgHHoJi
         zFjkMt44QZq4HCMg7aA3Clvwswa9yQ4cS4wMzXCSUrcQ45yEZOAAzBqdVPiWMDy0ErTJ
         VX0A==
X-Forwarded-Encrypted: i=1; AJvYcCWm3ykcxar0G1eHu+sc8+qjl8ilBb1+E6a5vuFiHw+O9GqlGj70XUx+Rk2AlKE5bPRQVcfB3LzaOrk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzuwc/oliUepnpwvcshm0g7z8uCuGBFEpaelqbOUvGwRNfhu0Y6
	VtL3R2FscNByzmvEU0Fxbfm9sbzhQO2nq761m9YNaqZ9ycJhrSsyZqQ5QLpQNJ8=
X-Gm-Gg: ASbGnct4sdDd9xPJr0TdQ8GoD9GC68hRZBAlyZOedzG3wr3JU66KbaCHzkrkxcNt0la
	gkaIL6Pk1G3zQ6QLzOL7JjMUt6JkSxO9VfxBqgRFbVuinL+tQrf6BOXqisS5jcs/IYOsiYHy3Jm
	pJ4/sPRdFnmE6kJeTrIhUbtlR7h28p5TwK6sdYGQUQswNyxJAF2Rz0cUFJfDd0zx1wRVyYqOV+Z
	4THX8UZeRclE4pF5ocLIS8B0Pb5a2CT7XkYQ+mBU8DRL3JWV2/4oI+3D0bUwmYO6PVuZ1vbWA3W
	tmbLuSKp7JjjPg==
X-Google-Smtp-Source: AGHT+IEmKwIiCas8gnM3ECDACjRObkNtwFp5OGkI6nJMo+z84lLQ2XlgjtN3xZ0C8moXXb7kNGSbfQ==
X-Received: by 2002:a05:600c:4691:b0:439:88bb:d006 with SMTP id 5b1f17b1804b1-439af7f96e9mr12091815e9.6.1740127717179;
        Fri, 21 Feb 2025 00:48:37 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f771dsm22594105f8f.81.2025.02.21.00.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 00:48:36 -0800 (PST)
Date: Fri, 21 Feb 2025 09:48:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Chao Du <duchao@eswincomputing.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [PATCH v2] RISC-V: KVM: Optimize comments in
 kvm_riscv_vcpu_isa_disable_allowed
Message-ID: <20250221-c503f28d950aa5268874b43c@orel>
References: <20250221025929.31678-1-duchao@eswincomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250221025929.31678-1-duchao@eswincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_004839_255956_F559D5C8 
X-CRM114-Status: GOOD (  17.19  )
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

On Fri, Feb 21, 2025 at 02:59:29AM +0000, Chao Du wrote:
> The comments for EXT_SVADE are a bit confusing. Optimize it to make it
> more clear.

nit: s/Optimize it to make it more clear./Clarify it./

> 
> Signed-off-by: Chao Du <duchao@eswincomputing.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f6d27b59c641..43ee8e33ba23 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -203,7 +203,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SVADE:
>  		/*
>  		 * The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero.
> -		 * Svade is not allowed to disable when the platform use Svade.
> +		 * Svade can't be disabled unless we support Svadu.
>  		 */
>  		return arch_has_hw_pte_young();
>  	default:
> -- 
> 2.34.1

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
