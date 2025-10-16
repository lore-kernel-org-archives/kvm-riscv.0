Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D292ACCD183
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jE0LcjYZrC5TcrVJNybqxPEmyY8iJhUwE+3fvF5wCKs=; b=x6HSo8eA+ivAjh
	xaQp240rmXZLatcRjGaKOd5zQVu5wsmgJ045cpaXXgmvH0UTZv1nRsSgBhcIg0jGlJ4IvpHfSAura
	y8Ls2l6iQyv0cCQN2KctiBABiKDlB8ObfhV99EWJhm4yOjUFGDCJ+QNfepXemflRVIlE6XSYlFXby
	unMDRdSu7tq5vGf4iR+UDHvL4WaOUPIeWDd8aA/g0q6c0cROqo/WkzsD6HlSe5pO3FGbLJXoBc73P
	oVQaPEL9rhcYYdxC4D+1fSsGhykS8cBQcRxgce/eXNvckE/Uuuid5VGfzd/I57DAp7vcU7agSD/Ba
	Yb/TdLwElBeKYWTXSvhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KVE-00000004G4f-0zOt;
	Thu, 16 Oct 2025 09:42:32 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9KVB-00000004G2z-1Wge
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 09:42:30 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-780fc3b181aso319737b3a.2
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 02:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760607747; x=1761212547; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XT2WFxsGOH83YnSrOTwI7TIxuKSwIlmbX1n8UfKEr10=;
        b=QeS3ay9l89BbrCpT1S3myYPngVYKRTp5PkThGNC/kpmwB9KfmCRrXWF8kuYoW7mN7O
         mCujkkIBdh2q38x+YOZVpiJOl2Pvy1+wyG6ZEfRVpXPeatptjEGqPMyYap3TKPgoUTJr
         ZMOVz9osHkWefwRAIqS+T3ijrseMbyLA4oPLJfG0mE4xeB0b6ERzJ/r8+WlzMzROBoPM
         42HGffr53caTVGIWcxPoDhBsMJ/0QgF7dW65PmA+3Ot+I/nz/DNH5OJiyVbkHZJNO7WB
         vW8JLcO2dt8WMeXgfPC4HtorgN2qEYYy7NLhoEvyJbjLW6QvT299x0mZYps+sGToz5B/
         pA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760607747; x=1761212547;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XT2WFxsGOH83YnSrOTwI7TIxuKSwIlmbX1n8UfKEr10=;
        b=JumOLDe8pQugp39eRoaOTITJSlk1YDvo2kcqQKTVIWmxLVqMDmPsb5ber/QlkdbkEb
         s2mrbodYaIB79Gkm0wZWuAp58bk2f/1tr+LTGZNSRTyxOf8M5TNyt7Y9eK1adKMl46qT
         D/qjRYn7f/pTTkao2zKDz7UHhTzzqig1KFciqsWxr6jkNzc4vrMY9SSCN787A8QHtswW
         Z624DldCrImvvwOEzhrnqLJQFBczqF/TynWvjIdFOIdTjp/Qj30ukjbotljG6NHUqsG+
         ml+DQkhTScbrASu3GoLCzYVezm57mHWnLA2arBISj6JLa1wWTzd3zSnrfpygg7raqdPE
         2Iig==
X-Forwarded-Encrypted: i=1; AJvYcCXGRznEDrxpAdDoIpGJpyTW0YaQWKcR170AytTduGK8I4sdAr7mKoSnupAxaFuuPtS6Tpe7SPmUU0s=@lists.infradead.org
X-Gm-Message-State: AOJu0YwGpMpeu3jfds45qRJEfSFXvUS664sephtp0RviqNg2r3moHipc
	lqeBZpZZOUBKMJ3xc8+6r81vu66xaawGhuUl/k3pZaIPuhuHGg6oHv4GexuhgzubAK0=
X-Gm-Gg: ASbGncuRnQ0A4QKuEZq6g0z8q5cE5EcHyAyEpMBpvigzeV7r9Y9wX/bSH005Sq5Ta2W
	2Qn22wYoRF2ksIGT/IJ/tYMnphHvqPsyfxsDFpad64Hdje/JAQGycgsRyX6b69xQ+KSVYVGA+1u
	N72qtnV1RjaXPeWbd68fiUAOus1yFGWauAFNAWMTZcVuED3La1ypdmDT6LK4MA25u+i2FCWW72r
	awbhoTcATx8ioYT5NAGihJn6vDDLXDsZ6pEFeCSGdplcKw4VIBfM0EBsoI5BIh9wDE6lLydV/Fu
	ZLRHPciVJZnvm/56WdPQ2aKcbm/37ZJGlAXPTDf6TJQyCiTuYemBj2GqKbqQUnrDz/JRN8Ht7VM
	uoTeEd8wgJmidB7CKRoJMHWovbIpBZgdSxIZXOjoMK6pekP9hwZg+/BF/mikoUU0qzSiGIQ+KSC
	tffqIH5381KKvJ
X-Google-Smtp-Source: AGHT+IHCkThTNuYCNDPFDMoaZ326MNb+xnCy44BX/ER0JzSky2C3Wp9VABYjJvXunm9KzBwzZGmmPw==
X-Received: by 2002:a05:6a00:179b:b0:782:2b62:8188 with SMTP id d2e1a72fcca58-79387242eeemr41932448b3a.15.1760607747335;
        Thu, 16 Oct 2025 02:42:27 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d9932edsm21496728b3a.73.2025.10.16.02.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 02:42:26 -0700 (PDT)
Date: Thu, 16 Oct 2025 04:42:25 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
Message-ID: <20251016-7a89633477ad3dd0ae6eb969@orel>
References: <20251016001714.3889380-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251016001714.3889380-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_024229_503362_8BA0408C 
X-CRM114-Status: GOOD (  15.02  )
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

On Wed, Oct 15, 2025 at 05:17:09PM -0700, Samuel Holland wrote:
> To set all 64 bits in the mask on a 32-bit system, the constant must
> have type `unsigned long long`.
> 
> Fixes: 6b1e8ba4bac4 ("RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index bccb919ca615..5ce35aba6069 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -212,7 +212,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
>  
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
>  {
> -	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1UL) &&
> +	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1ULL) &&
>  		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
>  }
>  
> -- 
> 2.47.2
> 
> base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
> branch: up/kvm-aia-fix

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
