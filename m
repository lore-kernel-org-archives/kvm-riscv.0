Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23863E7716D
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 16:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C1NXHDCfD942P4OnRAqwz1kkajfIQ+XXZqM3zW1iEQU=; b=GPsTMc74dLj9Mm
	Hk0XZGzM7ZWw0a731FuBlZpbe+ZhFBvT+GXrV9rl/JgCjX9TE4pAoAG2/17hMIuHagCEb1e7xF7aK
	gLgya5CUYxIptFQtq/JxmZ9c5uAnp9A3oqC7dTTvoBfddu4rdaDYDE4TRsTCwlJ5De+F6JJ8kER4v
	SZRDRHfhektUkvE6uUuppR5z6arf8Z8DN4Wmc1Qp7MzfLKKjRU00hY8VeO7IvDzEsYevacG9sakua
	MW23+hG1pUGz2lcSzzOoZJF97wr5ywC/hPOaSaCE7s8ZPtTyVaSriix58ZWMCKV7kEiyDdJL6R7QK
	O9OsCUPHurHx8bIysIcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJESj-0000000GhtW-3fFL;
	Thu, 05 Dec 2024 16:12:21 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJESh-0000000Ghsj-2eTv
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 16:12:20 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-434a1639637so11813085e9.1
        for <kvm-riscv@lists.infradead.org>; Thu, 05 Dec 2024 08:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733415138; x=1734019938; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+3xHwvrZFGkgILsc+8sbeeDFiAlqkrIqdKcR5hFeMk=;
        b=M+MM8nKr5eIw6mHCCtleC5dIKbTQUivmuNpWvpQaVjxSn4HDHMfA83FUEX2sszbCO2
         EWeE3A34aKHsxz2B+0rBNvmutQgjjgHko7scMQuJpKc+jIuZcvV8enBjyewjIX0oarOa
         aSf9b8M9qRG71aDLRL7uZ8ay61rStmZ81K+n9o1F493khjsAppCTcGLAVyYe17ErVAZN
         j4kEjiC91EtlhUc9ibEAj31fXOF8JpckD9YYWbhxvK2A73yUOjwPVkf5W1UVXWIKOfAm
         8rpKEvo6pSshAa0xakgdcGHGXYksnSjUdh7+C5DUz1iCI+l7JU8jpVesFT0V6v21MsCV
         eQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733415138; x=1734019938;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+3xHwvrZFGkgILsc+8sbeeDFiAlqkrIqdKcR5hFeMk=;
        b=P/uwiz7F0oX0XtOOaZm1O17PZ8yUHgUXuwLyYh0IGuIuche29F5wOQ35TCAdYLW9jq
         P2JTTGJIdu3Ue87fMrb274I3mr1CpkLUbJVmMpieCzCK1QLBfoxzLxAXVVRxlOEgDs7M
         iMGGbm+nWwgWz/QKdjltZfucVLI73KH59+sLFhkcFewi4RUDc+oCQNkl2KzozQuaJvc/
         Zuva5TRYOxJAeRZnceI9T5hZJgZZy6xqdH1VnCx9CQxOsyLu/k+aIjbM9KrzvsMlwuvZ
         IE8NQ2KsKnbigqlYV3vOM72QT/7S0XOz6n5rB3/WkwShnwD9dxA9YgeaRIXUxfcHJ7G0
         IQLw==
X-Forwarded-Encrypted: i=1; AJvYcCV+8OFTz95bmWmbN2WlklIHLyRqZcFPTjVeHaCJmd1bkg6IrMsEA59IVV/6Az4o4RCU39oKpZJA2xQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1cNdGVC2VqS9yZ2jdlRtjEgqdVA9fmOGupZQJJE59zXxrs3rT
	ANgBU93/Y1OW6bx0+C+8E4w/5mVr1uIypikvxt4fS0EKt7EVzswRBCwT/dukMuk=
X-Gm-Gg: ASbGncuBv8/y/LQne21IMNgPUJNHyTG6IpijJXD1xwKtbbVQ9XJx99J7OrKEqB62rt/
	UVYbedWTgLkkbw9W+xCJUvucFGNB11BChFYTf0tvd2yfuPR71ASxIbjBnji2XL0mc67/vjJpawk
	He4nFwNfCglIR41xSCU9ur4kFzqkSuT5GCfnWnChuyjL+ZB7G/6/DH/cRMZYMsjESVHTzUG8XDg
	c6LOordyND06lZXO0YkmZQEuRgcDb7iIIvm3qCqs0/qMhoV6X66n4QChZG8AdflsEzUWDhQva4x
	y+hEQrFFirYc3scWsT2yJnhD7cYDAQ7+aAs=
X-Google-Smtp-Source: AGHT+IHa5lee9Sxqmls08SUxS6uuiGe/lvzblZfbVXScCZEse7mEYCbZITkpv0Vj+gpxQag2jSxbIw==
X-Received: by 2002:a05:6000:18ab:b0:385:e8ce:7483 with SMTP id ffacd0b85a97d-385fd3ccbbfmr9165309f8f.4.1733415137730;
        Thu, 05 Dec 2024 08:12:17 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3861f4a874dsm2290643f8f.24.2024.12.05.08.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Dec 2024 08:12:17 -0800 (PST)
Date: Thu, 5 Dec 2024 17:12:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tjeznach@rivosinc.com, zong.li@sifive.com, joro@8bytes.org, will@kernel.org, 
	robin.murphy@arm.com, anup@brainfault.org, atishp@atishpatra.org, 
	alex.williamson@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach
 irq_set_affinity
Message-ID: <20241205-2ed14db745f00a0ee9be444b@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com>
 <87mshcub2u.ffs@tglx>
 <20241203-1cadc72be6883bc2d77a8050@orel>
 <87a5dcu2wq.ffs@tglx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a5dcu2wq.ffs@tglx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_081219_669460_EBF615F6 
X-CRM114-Status: GOOD (  28.37  )
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

On Tue, Dec 03, 2024 at 05:50:13PM +0100, Thomas Gleixner wrote:
> On Tue, Dec 03 2024 at 17:27, Andrew Jones wrote:
> > On Tue, Dec 03, 2024 at 02:53:45PM +0100, Thomas Gleixner wrote:
> >> On Thu, Nov 14 2024 at 17:18, Andrew Jones wrote:
> >> The whole IMSIC MSI support can be moved over to MSI LIB which makes all
> >> of this indirection go away and your intermediate domain will just fit
> >> in.
> >> 
> >> Uncompiled patch below. If that works, it needs to be split up properly.
> >
> > Thanks Thomas. I gave your patch below a go, but we now fail to have an
> > msi domain set up when probing devices which go through aplic_msi_setup(),
> > resulting in an immediate NULL deference in
> > msi_create_device_irq_domain(). I'll look closer tomorrow.
> 
> Duh! I forgot to update the .select callback. I don't know how you fixed that
> compile fail up. Delta patch below.
> 
> Thanks,
> 
>         tglx
> ---
> --- a/drivers/irqchip/irq-riscv-imsic-platform.c
> +++ b/drivers/irqchip/irq-riscv-imsic-platform.c
> @@ -180,7 +180,7 @@ static void imsic_irq_debug_show(struct
>  static const struct irq_domain_ops imsic_base_domain_ops = {
>  	.alloc		= imsic_irq_domain_alloc,
>  	.free		= imsic_irq_domain_free,
> -	.select		= imsic_irq_domain_select,
> +	.select		= msi_lib_irq_domain_select,
>  #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
>  	.debug_show	= imsic_irq_debug_show,
>  #endif

Hi Thomas,

With this select fix and replacing patch 03/15 of this series with the
following diff, this irqbypass PoC still works.

Based on what Anup said, I kept imsic_msi_update_msg(), which means I
kept this entire patch (01/15) as is. Anup is working on a series to fix
the non-atomic MSI message writes to the device and will likely pick this
patch up along with your changes to convert IMSIC to msi-lib.

I'd like to know your opinion on patch 02/15 of this series and the diff
below. afaict, x86 does something similar with the DOMAIN_BUS_DMAR and
DOMAIN_BUS_AMDVI tokens in x86_init_dev_msi_info().

Thanks,
drew

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 51464c6257f3..cc18516a4e82 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
                return false;
 
        /*
-        * MSI parent domain specific settings. For now there is only the
-        * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-        * possible to stack MSI parents. See x86 vector -> irq remapping
+        * MSI parent domain specific settings. There may be only the root
+        * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+        * be stacked MSI parents, typically used for remapping.
         */
        if (domain->bus_token == pops->bus_select_token) {
                if (WARN_ON_ONCE(domain != real_parent))
                        return false;
-       } else {
+       } else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
                WARN_ON_ONCE(1);
                return false;
        }


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
