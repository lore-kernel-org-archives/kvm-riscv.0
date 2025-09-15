Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B918CAC597
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Cc:Subject:
	From:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=djK5F/M/gLsiVLz5/0pE0JY3lxrlxP2LMYjLAW0CXAU=; b=sZ1vd9hwr7y6Wj
	NJmvd6SWgJKmuXdsFfa8cYqSlo1PHXi3iK+gln90ESl6NIwYW+JnjCH00qv1uVcJz8bF9hrwhmDWp
	wk5Fbny/IFTruBburtKdd1QbYsOR/5ofIqEnxnIXg387w/8hAEvC0vCdOjtC5SyBcSgU565vZW4zH
	Vse0JAwRzr/psz0gEKGdUb/IzCSvTjnBepNhV+A4dVmRByplxUmIxsmgdUJpjzXIzkcYw+/9ILpgL
	ENd4H84TjSCihNHxluSnsneglIHBKLoL45NJa78ckd93NA5M72aN2HR3yo9UV4K74SqfJ8iiBtIdw
	fSIC9ln4zrlv93DWkQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyA46-00000004fhC-0iXd;
	Mon, 15 Sep 2025 14:20:22 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyA42-00000004fft-2v9l
	for kvm-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 14:20:20 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3d6af847306so164354f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 15 Sep 2025 07:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1757946016; x=1758550816; darn=lists.infradead.org;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/HOBdKdBeIE5LskiTRckXQqXZ27Bu0OLdpEVHzR/yBs=;
        b=Nv2vnptE0DFq8q4Sa6SWao0vqtHoG3OqnvG0ey6jo2e3WhXMzMAg9/G12Z3M3p5dOX
         TK1pLTr0XKuLS6wyrcDvsvSJP1vNcSl5k1k1yUmo9R7axKptrIJ73dbkLBp6hd6ubn1q
         /8d1rQEKogxUBguElUoPhNrlMdWWVGxVp74Dnq8ughWTKCfmKAJYpdVBgfPi6V5FIxtw
         YRFGGfVYUIm/Le9yNZp52TxsnDRbv17V0BfhQrPKYCm1PyowAui7HD40huKo1i/essjf
         Uufs7xDcDccrRTGfCQaN3Ldc5Hk/ELsORfDEnzgDLysGzQmbxCbps24Ka0bkWW3ikNmc
         Jf5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757946016; x=1758550816;
        h=in-reply-to:references:to:cc:subject:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/HOBdKdBeIE5LskiTRckXQqXZ27Bu0OLdpEVHzR/yBs=;
        b=QIVFCZZ0rK3JV1qLkcaA3p8n7QQ2XKjtAh6k+7fQBKcpZ0aiZIEjQASwiMLpMnckea
         7WP1nfQJ3LDrSe2jOuJuccDXESVBOfACpvpHfHYvVX/VNQc/mQVD1lFoEMDPcSIs5go9
         B8Eu88gcTa747M1n7xsZ9m0KfXq7h95Mgc4Kxr7oOhk+UYWcTOxY/QhIf/yQ7idOYRJL
         TZ27gfyBU2YeYuxyzo/aBGJZTYMV+73Rf4KkQzzSOQso077msUF/IAfACRoGDR4UUruq
         nwsLkI9ze1qgCyepTLR1RTEUkXkbV2msLmB2WN4a6C140pufNq/Osv1ZnuAU55KNeHt7
         VJbw==
X-Forwarded-Encrypted: i=1; AJvYcCWK6HIvv0nWUbvl3cgGmzWRECwQjwNYPfZYUYesc6Sk0zp6Rh7aEhw93wbEgL9Nc7Yy8VnGjY9HcgE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwrLw9qt0xBOqi2CX5CFCmXKcNIlkQRzmJL9ciJzxiEgX7Wj4Pg
	J3eGYEeyIK5VCixuCudOUt6KOGaYgzmMejMllFH4kiqrtcWKkm1PyK44lmyI4l2uPk0=
X-Gm-Gg: ASbGnctaQsV+j8aBxSF3Q5VmeKbJa8BuVpKICCTpThLKMqYt4WofzJq5AUsCcY1/w0c
	P/sTSCjCUWdeQlbqyN83Q64nLbc5fU9tynEPw7jn/Ub+gswjC096Q811jBA4fdhYVYiareqjdFH
	KOfctq2Dm4l269MksaA2din5Nj4RlscARrvz4lB7rlEdQI/Q7OgF+Qp0tADzXDIEjlgiZDVU/aj
	V18zEESXqBQjn8LZjMOeHx73LNTz5OOwlVpm2BiKvjYm2kEcx4pq2qmchrPwyAtRMI7ShnmLTod
	Jjx+lxkh4lYpwEVDa/vSpkkp+sTw7ONMHaeBrrzUOKdZH+MLb9mGSnrL6Tjzh24Pmx3MUjPRljY
	V2r+9Co84s8s=
X-Google-Smtp-Source: AGHT+IEr9ywKHT8W8C37v/Lf/D76aQexJpKD96gz1cziMZ3TMNCvKPnp0aeaGYo/6Ls07zNiG8J5VQ==
X-Received: by 2002:a05:6000:2008:b0:3ea:6680:8fc6 with SMTP id ffacd0b85a97d-3ea668092cemr1775272f8f.3.1757946016139;
        Mon, 15 Sep 2025 07:20:16 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::bfbb])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3e9c2954b10sm6780169f8f.50.2025.09.15.07.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 07:20:15 -0700 (PDT)
Mime-Version: 1.0
Date: Mon, 15 Sep 2025 16:19:21 +0200
Message-Id: <DCTFU1UCDSZZ.3J6L3T6TYTELM@ventanamicro.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>
Subject: Re: [PATCH] KVM: riscv: Power on secondary vCPUs from migration
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
To: "Jinyu Tang" <tjytimi@163.com>, "Anup Patel" <anup@brainfault.org>,
 "Atish Patra" <atish.patra@linux.dev>, "Andrew Jones"
 <ajones@ventanamicro.com>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Yong-Xuan Wang" <yongxuan.wang@sifive.com>, "Paul Walmsley"
 <paul.walmsley@sifive.com>, "Nutty Liu" <nutty.liu@hotmail.com>, "Tianshun
 Sun" <stsmail163@163.com>
References: <20250915122334.1351865-1-tjytimi@163.com>
In-Reply-To: <20250915122334.1351865-1-tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_072018_774162_5EA8B38A 
X-CRM114-Status: GOOD (  20.20  )
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

2025-09-15T20:23:34+08:00, Jinyu Tang <tjytimi@163.com>:
> The current logic keeps all secondary VCPUs powered off on their
> first run in kvm_arch_vcpu_postcreate(), relying on the boot VCPU 
> to wake them up by sbi call. This is correct for a fresh VM start,
> where VCPUs begin execution at the bootaddress (0x80000000).
>
> However, this behavior is not suitable for VCPUs that are being
> restored from a state (e.g., during migration resume or snapshot
> load). These VCPUs have a saved program counter (sepc). Forcing
> them to wait for a wake-up from the boot VCPU, which may not
> happen or may happen incorrectly, leaves them in a stuck state
> when using Qemu to migration if smp is larger than one.
>
> So check a cold start and a warm resumption by the value of the 
> guest's sepc register. If the VCPU is running for the first time 
> *and* its sepc is not the hardware boot address, it indicates a 
> resumed vCPU that must be powered on immediately to continue 
> execution from its saved context.
>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Tested-by: Tianshun Sun <stsmail163@163.com>
> ---

I don't like this approach.  Userspace controls the state of the VM, and
KVM shouldn't randomly change the state that userspace wants.

> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> @@ -867,8 +867,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	struct kvm_cpu_trap trap;
>  	struct kvm_run *run = vcpu->run;
>  
> -	if (!vcpu->arch.ran_atleast_once)
> +	if (!vcpu->arch.ran_atleast_once) {
>  		kvm_riscv_vcpu_setup_config(vcpu);
> +		/*
> +		 * For VCPUs that are resuming (e.g., from migration)
> +		 * and not starting from the boot address, explicitly
> +		 * power them on.
> +		 */
> +		if (vcpu->arch.guest_context.sepc != 0x80000000)

Offlined VCPUs are not guaranteed to have sepc == 0x80000000, so this
patch would incorrectly wake them up.
(Depending on vcpu->arch.ran_atleast_once is flaky at best as well.)

Please try to fix userspace instead,

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
