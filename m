Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46D0C0218F
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jan 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kui1Yg1vAoaJzTDYVUU1HEXA0Xo2VCgp+i8y85c22Vc=; b=V4vd5rMjehjrKB
	b4aytOtn/zLqpCqP7pv0WudJ+dAm/d0P1y5Hk1ouoOjQW25FWubsUf7gFC6oNM41vb0qomxlU1MPC
	rD0YYu3xvMir1QyBchk6O+oWEP/gS9Hs5r6l9Ggt/ybVGBHOPfhM8UqQM/jUsPJ9g2JIlS4aMDefn
	FwvQ+VqLuHPenbfd7cWd00O3l9RmcztTRpiDN1C0+kSzm+yVEu6c0bPVes15LEdFktWfi0/BLn6ky
	cXIwX+4Cjm2EZVwrI/cfQCoLhh4WqHeslX0Z9ASZJ4dj+Z2YczvvtByOnTtwDzr7l8dFz178nbZyC
	8t13FKBNptCwTvfGmhsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tduGp-0000000B34X-225H;
	Fri, 31 Jan 2025 16:53:31 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tduGl-0000000B33V-3931
	for kvm-riscv@lists.infradead.org;
	Fri, 31 Jan 2025 16:53:29 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4362f61757fso22746165e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 31 Jan 2025 08:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=virtualopensystems-com.20230601.gappssmtp.com; s=20230601; t=1738342406; x=1738947206; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=O/7pqHwaAnIanm04GYyRhADDzqvnZ5TFeSSUZVbAlv0=;
        b=LIAwpLJUsChnZaD/7GK3kzWZrt5Z0Bx9Spq1VBBCVAfxcAoYrjRBsjTY19x7+xcRJs
         Schzc9NqYbhCTCL+Lr94O49hYM5eZPR53vUBUyy8UjEQWELGPs7E4IJOll1n2aFTFsEW
         w7Zmt+9kNkFwwgOdir/AXF0397iOmOtlQBdDih4FrdZmoFInQrF/i2kKKDV7WcHnpn6V
         Hm10w0p73mq32/bQFtRGT7D+8MRx1GZmxnawm6mpS//5oZTuPP1+JhImzN2xd56rBIG9
         UCDyICpMekGsjM0SYkq+DYqTW4DEvjLsKKIOLgYcjJFoHQolyIXe0Ou1FoIUA+/BvlGz
         Ev2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738342406; x=1738947206;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O/7pqHwaAnIanm04GYyRhADDzqvnZ5TFeSSUZVbAlv0=;
        b=e6hbuzSmZcLnLQHEybr12G9ZS0emOh425FhW2ZJoYhUUh6uQHlggoi7zE47rCX2cXy
         PS2ZfKbN+l9k78BNllqQ/Xldl21SddJiFZwq8yCm5F5fB31paqJbL+bwfqCQ1Xi7JO4m
         eMLOpdGhBFdLG5STBdkX09H/vZLIgh0f2QYvZM7auQSnvCmP4YtMtSUUiSMTxsbiFKUT
         0DCcg6PkaSCouFWnLDpXff91zt2caGh0PQZwghadPJ0qmDIDyVFkbmMaY8kSdfNfwqRm
         FFMs28FuHGF8Uxei4SVrzHSu6O6RfQwZtk2m35fGpz+Z02Vst9e2t16iQVkDSNCLiW3d
         Vzfw==
X-Gm-Message-State: AOJu0YzcRKMqod2HLcUFWamd7hgdWQYgWsFVIiIO8J22S6bk68JhoWmR
	kUJDY5z1AtfYUbIqdRXdSu+bm+1qfN0IREFNUOS2SKAKZHjTk8B34IiZEgKQW+r8HfcTHFDHRlK
	e/yvAfA==
X-Gm-Gg: ASbGncssBpOLnLtZsFtt5Dej/GgLfKCBNL+3lj+a51iscbR4TjY8dz3/dLdyieO5HzO
	abiDCOKZrL6QVJOBnvG/pRcbBrOiMjfaz9LaSSXUQNbkXDyaHQpgcCpSgQgGA4Dk4u48DnXsDe4
	LJ+MHfsc12g4a8QuD3GhzusWxQeTmrjcRXbL+CKHpv6SLkDbkicdbFMXKGhh6eseOlFxYpkGb16
	j7TzM0zjGz/vUIlGpYWJrwwXn9AxuAOsRuK3Nnau8AuFBF1E5lfWLzFPqD9lk27RZ47lvzOSxas
	cEBtyzxG147cykxNhDEvJqvwbZq8HdsJZbIc8OdFvxkYCeRhA9wEH/m+Mw0EKM6BqMbMB3a3wzx
	alQ==
X-Google-Smtp-Source: AGHT+IG5MUb24gxL2Hj4S45s41ftGPvZJE3KP+mS1kM8iWNvamZyUtHGZGDfaF+azfvopCcp0AJwcg==
X-Received: by 2002:a7b:c40e:0:b0:436:17e4:ad4c with SMTP id 5b1f17b1804b1-438dc3aa77amr104090405e9.6.1738342405668;
        Fri, 31 Jan 2025 08:53:25 -0800 (PST)
Received: from ?IPV6:2001:861:8b82:e3f0:652b:a6a1:f717:23c3? ([2001:861:8b82:e3f0:652b:a6a1:f717:23c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc265c0sm95944065e9.10.2025.01.31.08.53.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 08:53:25 -0800 (PST)
Message-ID: <3c661b0f-1ec7-4e4c-9998-9e07b7a3bf2c@virtualopensystems.com>
Date: Fri, 31 Jan 2025 17:53:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] Understanding in-kernel irqchip (APLIC + IMSIC)
 behavior with multiple devices and interrupt handling
From: Samuele Paone <s.paone@virtualopensystems.com>
To: kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>,
 andrew.jones@linux.dev
Cc: Alvise Rigo <a.rigo@virtualopensystems.com>
References: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAK9SO09LZBL_tQpGX2f2PcZmEsSiaGcUg3yB6vGvQWWT3ze1XA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_085327_971928_93BBE0E2 
X-CRM114-Status: GOOD (  21.21  )
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

Hello,

I was just wondering if you had the chance to take a look at this?

Regards,

Samuele

On 1/7/25 5:36 PM, Samuele Paone wrote:
> Hello everyone,
> I have a few questions regarding the in-kernel irqchip
> implementation, specifically in the context of APLIC and IMSIC for
> RISC-V:
>
> 1. **Behavior with Multiple Devices**: Does the current implementation
> support the creation of a VM with both PCI devices (that use MSI) and
> MMIO devices (that use wired interrupts)?
> If such a scenario is not supported, how can I configure an MMIO
> device to use MSI interrupts? Would it all boil down to some device
> tree configuration
> (i.e., the MMIO device tree node "interrupts" property referencing the
> IMSIC rather than the APLIC directly)?
>
> 2. I find unclear how the variable `level` is used inside function
> `kvm_riscv_aia_aplic_inject` in `arch/riscv/kvm/aia_aplic.c`
>
> ```
> switch (irqd->sourcecfg & APLIC_SOURCECFG_SM_MASK) {
> case APLIC_SOURCECFG_SM_EDGE_RISE:
> if (level && !(irqd->state & APLIC_IRQ_STATE_INPUT) &&
>      !(irqd->state & APLIC_IRQ_STATE_PENDING))
> irqd->state |= APLIC_IRQ_STATE_PENDING;
>                  level = 0;
> break;
> case APLIC_SOURCECFG_SM_EDGE_FALL:
> if (!level && (irqd->state & APLIC_IRQ_STATE_INPUT) &&
>      !(irqd->state & APLIC_IRQ_STATE_PENDING))
> irqd->state |= APLIC_IRQ_STATE_PENDING;
> break;
> case APLIC_SOURCECFG_SM_LEVEL_HIGH:
> if (level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
> irqd->state |= APLIC_IRQ_STATE_PENDING;
> break;
> case APLIC_SOURCECFG_SM_LEVEL_LOW:
> if (!level && !(irqd->state & APLIC_IRQ_STATE_PENDING))
> irqd->state |= APLIC_IRQ_STATE_PENDING;
> break;
> }
>
> if (level)
> irqd->state |= APLIC_IRQ_STATE_INPUT;
> else
> irqd->state &= ~APLIC_IRQ_STATE_INPUT;
> ```
>
> Considering `edge_rise` interrupts, as far as I can see, the
> APLIC_IRQ_STATE_INPUT is set only in the code above
>   but prevents edge_rise interrupts from being set pending.
> Moreover, in a system emulator implementation that uses in-kernel IRQCHIP and
> IrqFd, this variable is hard-coded (`virt/kvm/eventfd.c` in function
> `irqfd_wakeup` when it calls `kvm_arch_set_irq_inatomic`)
> in the kernel as 1.
>
> 3. **MSI-only Support in the irqchip**: The in-kernel irqchip
> documentation states that it only supports MSI. However, the RISC-V
> hardware documentation mentions that APLIC can take wired interrupts
> as input and convert them to MSI to forward to IMSIC. Could someone
> clarify what is meant by "MSI-only" support in this context? Are there
> specific constraints or implementation details that limit the irqchip
> to only support MSI for virtualization?
>
> 4. **Device tree node differences**: How would a device tree node backed
> by MSI interrupt differ from a device backed by a wired interrupt?
>
> Samuele

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
