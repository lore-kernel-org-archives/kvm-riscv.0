Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB5D8CAC597
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Ac9+rh6vNgi7q3ngOAoc89ZNezGl1q6GwQzXzF6k68=; b=kLzBOCY+geZlbE
	Odaon1046KaFKIitRzmXhtUpzgGYIfi5z043VIkFllOBt0JUoDDqB5j2PVK+A7dESwnGlBKTC1Krr
	QLduZDTjUUdY7nl9QmxPLblNmo2bVNBBiM0mkd9yRixtdoKIj9JjS7z+NXNxfS4AWAJR4KtxQ7/q/
	zATgg50QUmLjIcPs080gI1PPZxI1Oq7big4U6g4f6kHtz9tJ+4EEhjrpyHWsKe+IwScQ9maHwtlFi
	Gj3cN77bHgXDz6Oh0qTy1cqp1aOGk7viYDFJibTqTzfP2OIpwQknwzD7CGLZ7hQtgxyJsUzkCfv+I
	aVAKrPUEw/9lGOWUJK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSe-00000005BNa-1eD9;
	Mon, 15 Sep 2025 16:53:52 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCSc-00000005BMf-3cXc
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 16:53:52 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-45de5246dc4so9645225e9.0
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 09:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757955229; x=1758560029; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QMjc1jYjo0pPUV3IEMrRaUWcTH6UPkM8lTmOpgavsDM=;
        b=F0LWUPEYEz/Qe9uG7w/HQs+uhjspaYdWBBTlJfc7OX6hZYitUXQYe0d5qcO4M6X0uc
         qcAJdWymaYc3RqfZDN4jwNRNc9GGfulWyckHKYG4/GL8cZHxLktGox5iPMTnh1dBNFpb
         icsSX8W+Xh1DOgXqY2JHGNkDcsTfwm5dhJ/NuxGt/7pvWt8tg+cogVH3pXjhIFyhoyaN
         8LDuqc/ULozRp+wzVTXH9lLWyPoY0cC5uF3DOZQcXwn9KS0Occ0huLW04Bh2jlLF9kF7
         T6wxSdoS3pi/RYwKpCMe8WQWiRe9+3JiJhkV8U1lWZ8d2uIoStaj2/9GHeWyFM72Tp95
         gVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757955229; x=1758560029;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMjc1jYjo0pPUV3IEMrRaUWcTH6UPkM8lTmOpgavsDM=;
        b=mAZKmjtNf+wSWMdpsvBVCArL7SiVTlOSyRuytGWs5VaI9Lpgb8/twYrcHrR7Wywy8R
         TbfXHxx2uwUg38EvIvyljndtwJmKngtBio8p+SlpRgFoWnV/O/EWECX+UKgGrop2voU3
         zWxgT7yK0eyuTQks3Y3Bs4rg8FmRlw6IcHikr/X+Tj7H9/tN8pWBAKWRYhqu7RhJhEF5
         Pblh9Q+no3wT+P3XuOgHqqn4BjaW1mYLXTMU3X5qwlhUnKJar5LOcGnqVdoSQuMCBKqU
         aWBLo2Q22VprqQNSS3qUZn3cF23mNrZg/yr2z+WTjjEn2WpAkZOo2sEdMXxZTfXw/miC
         p80A==
X-Forwarded-Encrypted: i=1; AJvYcCXC6y0AsMHNJnmd5Qj9V4gn2jJ+8U3/D+13Qn314M730oLaFTuC1dH9LP4yHWe0wpm/GegPp3g9Oho=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQbUVK4t60UuRNtkHfA1O6L9ZrrB3fABkfLnA8nufznHqIg7mF
	zA+vRHwAnlqXtyom/ThX7GMuRGWkXSa1uPbZf3XaAMsUxpzqIUj8tRPScvnRz7bulIQ=
X-Gm-Gg: ASbGnct6/Sfsmvl3nbAOHLKaS1xQKUgNZqFmjumQfITf2uKso3fJFdR+SrT9b7jcyB2
	aJzaPAPPEJTqUuGo5mcKVHeyrWJIJzjq9R2kzE/omvqDqfJyte20Sfk3hICSPjayLMKwHL+MEtw
	aRmrdQhOQ1Y1WQhESPYKJ6lRwP46uFdRiMEpXrxVa7AL8HrOUTtRe8faBAZUkaWrcKE2amhQbsU
	cv0RRuMuzH0pPDJilq4Yrl/aZs//L76ybYhT6X6LHa9luLFauW3djj7tgGj33GdfTorVE4HXF0n
	qyNc4U1bG6St+xAgSsUbMsxQaV3xmYnySA5TOmrhRLOAAjR75a/6P7YpWmHvC/CvVD4lTSrzdDI
	lMjT+f1+kbbCd2HNVj2r0lQ==
X-Google-Smtp-Source: AGHT+IEBYG+XYWr4vSIUvW4i/gC6ebTomXgFIobLIBRml4hWNT81ZQCvn/NDrF/4mBzDZAjMlg3idw==
X-Received: by 2002:a05:6000:2008:b0:3ea:6680:8fc6 with SMTP id ffacd0b85a97d-3ea668092cemr1990129f8f.3.1757955228923;
        Mon, 15 Sep 2025 09:53:48 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3ec22b16adesm726619f8f.13.2025.09.15.09.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 09:53:48 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 18:52:56 +0200
Message-Id: <DCTJ3N8W4PCL.9XCHFVGS62SF@ventanamicro.com>
Subject: Re: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for
 migration
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "Tianshun Sun" <stsmail163@163.com>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
References: <20250915152731.1371067-1-tjytimi@163.com>
In-Reply-To: <20250915152731.1371067-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_095350_925501_4795C141 
X-CRM114-Status: GOOD (  17.41  )
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

2025-09-15T23:27:31+08:00, Jinyu Tang <tjytimi@163.com>:
> When migrating a VM which guest running in user mode 
> (e.g., executing a while(1) application), the target 
> VM fails to run because it loses the information of 
> guest_context.hstatus and guest_context.sstatus. The 
> VM uses the initialized values instead of the correct ones.
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

I don't think it is...

> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Tested-by: Tianshun Sun <stsmail163@163.com>
> ---
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> @@ -489,6 +489,12 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
>  	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
>  		return -ENOENT;
>  
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus))
> +		csr->ctxsstatus = vcpu->arch.guest_context.sstatus;

Userspace can set guest privilege mode via KVM_REG_RISCV_CORE_REG(mode).

This does propagate to guest_context.sstatus, which is otherwise
internal KVM state, so we definitely shouldn't expose it directly.

> +
> +	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus))
> +		csr->ctxhstatus = vcpu->arch.guest_context.hstatus;

Neither should userspace be able to directly set hstatus.
KVM should derive it from other userspace configuration.

What isn't correctly reflected in hstatus?

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
