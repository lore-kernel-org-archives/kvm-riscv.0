Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED72C021B0
	for <kvm-riscv@archiver.kernel.org>; Thu, 20 Feb 2025 08:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cnMSg3H/z+XHsbAYR4eSgNTkZ1N86Hj0cv/DK4SJJhQ=; b=mkQjDo7sAJrx4D
	AQuT6hI84NrbNYWUzPX53h1+fnWIOlIKgRXMHk1ZwXtoSj8MvoWPOtwaCKByk3i+JRU4jvPap+pFF
	mo3OZm03BrO0at43S8TdKVL27CujqB2tfEluWdBzWFI+N/A5SB6DLhWtqzwTdCBmrI5qE50DKg+zp
	K3hwxIj5rxNXU1AnGtiqAau/qLnKr2Nk8UWwoNO++JuvLNqokY652JDnfFGn4FZ086CQUyKlT+OFr
	xftJ4SmVSjaydZ5nrQhnw7kIIi9j2SO+63mKEupAtqKBWHTDT9Vy1t7fVZpeluIs3sl702RZyzPSj
	+OrK2jMNiDbI41sVqg4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1V2-0000000HGs3-1Xfq;
	Thu, 20 Feb 2025 08:01:36 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl1Uy-0000000HGpY-3fit
	for kvm-riscv@lists.infradead.org;
	Thu, 20 Feb 2025 08:01:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-38a25d4b9d4so318105f8f.0
        for <kvm-riscv@lists.infradead.org>; Thu, 20 Feb 2025 00:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1740038491; x=1740643291; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qd7KqhH3kfPjHtgw/90Ms4Puk/b53LCg7WjeYOFj6kI=;
        b=HwuFtyUJOYWK1+pzoqIJ7TOkal7OmO0y19FhKoVEb524IRlSS7gcfUNenmQ7aeOCzw
         s62GGG5LgnzvYknhdY+iNq5YFWyPovlEtBqf4AsdclX9qoF9hfSbMOoyjFsqBCW0p7go
         Uu4BhJkALWratVIr5P1rdzs9s43fIap23V5xXQlByXyjZk3UqZjQJCZjmCngc+jfEsVD
         o2zqW90IseBrsCYbegVvl63uRyT4PUDSZjXsM3dNVvrQIQVw/W7TGbQuqLYKkT2djkJb
         RNpQD/6JaNUAQi8Mqmi8CqxHk2ceenAdp1jUOeP9lw8Im2wS4Gj2Q0ZYDeLR4Kvcnyvz
         qedg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740038491; x=1740643291;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qd7KqhH3kfPjHtgw/90Ms4Puk/b53LCg7WjeYOFj6kI=;
        b=TrAglxnCbYFTS/nJ2tyT2ZxtzFavMwFM/rhxWCPMwZ3W26lTzd0m0YIVTd4iPUhxaR
         oPD0RaRc2pVU0FubzN5bnj/5jmt/VhiVbgmauABXMTTYQq3VpP86ycPSSg+kXhg1HR/p
         9ysWxIEevfm6LaxCda2jDG+Ipyc9AIO/Qgdnn59j7Dnsmv1GL6NsCovfEiYMGvtrtmVz
         f7XpbEwaLVXjZzk1uSZniwkr21AFxb9I3wIklR6E7s11Vx4O6LhUSja2SZn7VOgufQEa
         Sgwk1TcfmIXoMlAn1dzqstVCO2UohxToahJ8EMExXDc0rpq2PMFtsQjrkdOs/89Olu2m
         6Rqw==
X-Forwarded-Encrypted: i=1; AJvYcCX9ZhHEhCUAAeuZtikFPJMwYby1JOk0QZWfTQsDGYucBXDvt7+Besxp/zQ8nxGLvu6wufYVH2xz+Es=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkU5szBe4xSN66WVFDGdBmn+rtXMTZi8fNN4gQr1P8NhNuz60L
	1ThKrbXjrRPZcUQ97WwtFOC+KKHshwSZdHMedQpCsg1TAkSq9gCG8R28ykdJcD4=
X-Gm-Gg: ASbGncvCfE1B/eg1m89NofEyuiih1Vv3sHkWDJRlM2wuDXodWcxHA5QDmGvLtEWa8Se
	Xagk6WqA6fxiAhkJbFfTh5NzZufwCz5haLhzGp3x5QQUmBxBiuP2Fxa5O/9xZ2ur1zJF4mgWooO
	LONzo85GwYjpKxfv6W6RCHFoj0NtiYNxnkk+ajhVA+58NGuknNlbPDtOK8rl4Bf2wTwIcA2CBUh
	RgkmntnD0uSmgezKNg7heMBfpDeRmZGUbdxKlYAX3n8ZK2OmlOogP+xIG3wC7ZSeNEpTaRZWNzb
	3nQ=
X-Google-Smtp-Source: AGHT+IFM6700LK+74HpOeXyoMgkggOf0cRqXu8y6ZzQbVQm2qqlIWdH1erTmldYEmvvOPb18VleqSg==
X-Received: by 2002:a05:6000:1f87:b0:38d:e6b6:5096 with SMTP id ffacd0b85a97d-38f33f3d4bamr20173510f8f.15.1740038490670;
        Thu, 20 Feb 2025 00:01:30 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::766e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5e9esm20195560f8f.61.2025.02.20.00.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2025 00:01:29 -0800 (PST)
Date: Thu, 20 Feb 2025 09:01:28 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: xiangwencheng <xiangwencheng@lanxincomputing.com>
Cc: Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>, 
	anup@brainfault.org, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, atishp@atishpatra.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Subject: Re: [PATCH] riscv: KVM: Remove unnecessary vcpu kick
Message-ID: <20250220-f9c4c4b3792a66999ea5b385@orel>
References: <20250219015426.1939-1-xiangwencheng@lanxincomputing.com>
 <D7WALEFMK28X.13HQ0UL1S3NM5@ventanamicro.com>
 <38cc241c40a8ef2775e304d366bcd07df733ecf0.f7f1d4c7.545f.42a8.90f5.c5d09b1d32ec@feishu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <38cc241c40a8ef2775e304d366bcd07df733ecf0.f7f1d4c7.545f.42a8.90f5.c5d09b1d32ec@feishu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_000132_963010_C9928BFD 
X-CRM114-Status: GOOD (  12.64  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Feb 20, 2025 at 03:12:58PM +0800, xiangwencheng wrote:
...
> As "KVM:=A0 WFI wake-up using IMSIC VS-files" that described in [1], writ=
ing to=A0
> VS-FILE will wake up vCPU.
> =

> KVM has also handled the situation of WFI. Here is the WFI emulation proc=
ess:
> kvm_riscv_vcpu_exit=A0
> =A0=A0=A0 -> kvm_riscv_vcpu_virtual_insn=A0
> =A0=A0 =A0 =A0 =A0 -> system_opcode_insn=A0
> =A0=A0 =A0 =A0 =A0 =A0 =A0=A0 -> wfi_insn=A0
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> kvm_riscv_vcpu_wfi
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> kvm_vcpu_halt
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> kvm_vcpu_block
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> kvm_arch_vc=
pu_blocking
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ->=
 kvm_riscv_aia_wakeon_hgei
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 -> csr_set(CSR_HGEIE, BIT(hgei));
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> set_current=
_state(TASK_INTERRUPTIBLE);
> =A0=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -> schedule
> =

> In kvm_arch_vcpu_blocking it will enable guest external interrupt, which
> means wirting to VS_FILE will cause an interrupt. And the interrupt handl=
er
> hgei_interrupt which is setted in aia_hgei_init will finally call kvm_vcp=
u_kick
> to wake up vCPU.
> =

> So I still think is not necessary to call another kvm_vcpu_kick after wri=
ting to
> VS_FILE.
> =

> Waiting for more info. Thanks.
> =

> [1]=A0 https://kvm-forum.qemu.org/2022/AIA_Virtualization_in_KVM_RISCV_fi=
nal.pdf
>

Right, we don't need anything since hgei_interrupt() kicks for us, but if
we do

@@ -973,8 +973,8 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vc=
pu,
        read_lock_irqsave(&imsic->vsfile_lock, flags);

        if (imsic->vsfile_cpu >=3D 0) {
+               kvm_vcpu_wake_up(vcpu);
                writel(iid, imsic->vsfile_va + IMSIC_MMIO_SETIPNUM_LE);
-               kvm_vcpu_kick(vcpu);
        } else {
                eix =3D &imsic->swfile->eix[iid / BITS_PER_TYPE(u64)];
                set_bit(iid & (BITS_PER_TYPE(u64) - 1), eix->eip);

then we should be able to avoid taking a host interrupt.

Thanks,
drew

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
