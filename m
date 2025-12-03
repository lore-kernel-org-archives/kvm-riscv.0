Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47918D15DB7
	for <kvm-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 17:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SICXImdxUjF5L8XnPikaHQ5hU/7nTYkH6tKa17pO0KQ=; b=X4w7Alih9EmCVMw3OTJcB1pGyo
	Ge6uh8ZsRooTEo8SW7L3+OWS82+i/xrpr+CyqH0kMZrrFBIP79cUxJ0kPmoiUwdn1Tm0bkMGI/6IN
	vrvwMAmQ+W06lU3mD2ZmZT7RPGjZnTf7Bt22MMCtWX8wdm1Z1vCZbYxkeWAAdowsvm1PYXh71t7cw
	+ZfyjYsNIYMmgY1OqDw63ylFCFWlTUklVBX/KsBjYxZJxOwflRMdeMqHhiJXUe+/eddQNmvgDZmmA
	WEZxlZhwS9hEc6g6ZtAbIO3V4Y4mDPxFbuygPm2U14n2aR8QTXjBcJeB5gBl364djcEpwe+brd9rG
	fjd/F9Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqba-00000006rSL-2tAY;
	Wed, 03 Dec 2025 17:25:30 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQqbX-00000006rRP-0g3I
	for kvm-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 17:25:29 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7d26a7e5639so7882994b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 03 Dec 2025 09:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764782726; x=1765387526; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Cqj8tfUGUnFRacbGDoJX9RLnVpHR5PEeHJuSOrLWuQ4=;
        b=YHqCT1pU7aDFh9MQZlqi//XCj6kuoJExQ+RExxgsDYW0F3LQtQLUVs2Ka72RJlVIcQ
         NHIcoOhnWPmOVbHM1xPQyNw8if2ctUvIj7RQHAXYJSqQFdXzYWU0kc1191+Pxbp0kjE7
         YCDeTaFKBN0gdcwosBmPkwmMhe+9pQhN5wJRJCHngdPlcvVIoTApfJse/aQX9nkK9yZu
         aCFimMFuHnnCs4CxM4LCaw/i/JRN05SsMMJH3E9+FkYffcEP8eG+EyFso97OxKgAssmF
         8Xs2zPv/j8K2AHpl9iOI4ZbMP0NcPGlbVkkplZolk6xMR063sEhCqBGZxWJ53Uj7y06p
         Bfxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764782726; x=1765387526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cqj8tfUGUnFRacbGDoJX9RLnVpHR5PEeHJuSOrLWuQ4=;
        b=gHYb8QSwyuk0QETRJXjVmXGIl9ZhbUazK6/a0hH1b0mu4WNQgvSZzPQF3c32zSNYxP
         v/Ds6/Yupu34jlU1+b/ULvxJiqAIihRT7uXa9WGcJlBzLeU1i1kHcgWxvRzaKQFsjoTP
         Li21YsDu5688q2iGx5d7wgGue0iMrgaqFlb1UqO7HPJDIw9gf3NSg87nl7N0WfdDrrM3
         xjpS9sVjHm3iq37NxPNztudSHEvfM+JjQxbqXP3Mu7njPrO/3sfUXQsnIzu0IEYaaT5I
         8EvOQXJ0vTO33sVu1qWUGf+Mlwqo5dUo6ootKEdQdTDk9RJhFCbZ6DRZqEdWE7XMShbF
         e5Rg==
X-Forwarded-Encrypted: i=1; AJvYcCUJngUWsJDUxaaFoU+sB7oPNdI9jnWfa4tryzBXz0Qxyc77aG++dDcpKnVyA0FaMlfJk1NM2T2UO74=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5ZtQnCpkm3voxOc2p8j1k0QyG/99ehUVK3zcF5SjrBnDfRSqI
	1Ue23QJJ5f8yDTrBV5J9DZt6JFjVkEyUjHcFNpj6Wn8j+/odFbY2KAl8Mzche78CbXk=
X-Gm-Gg: ASbGncsyAvf7udNDswsYNwmnthWfMcZCeRcwkne9H1LhcepLPaXxunVAVoYYoB285Bn
	6hJtZi/TsTJwLzCGau9WqAOsoiyrbZDVqslTl8bZsAKYpGYwiS9anuquF3dPWI5KM/wqXho60YR
	qI0UkEaLJqwRITi5OTG8OK2rEprLJ/u/W4DX/THQoDQ6+4RrQgdOcdorIAYkMQhXAGFou9FMUE5
	K3s6pn4fXQjfoXG49XzUIgsh6oyO0cWLhHYkaCRESKS+yOzhB2uV6Tuh44qDsHho09pkK2I4Tqg
	KI/kYGFcz9TBytKKVnRbHmTgBh1lG8FWagtIs//iksxTG2Kl+YyB4SHpSGRFqAOel3KEDY8mUKk
	vGkSw49JFNIAuie6TPRkGFeh6xIHgbXeUzr2gXNEk1p1N/ikjtsxAPcUeJFyIUXP2WN28DL/+nf
	S4nPCxtyipmUnOsMfHVyFl
X-Google-Smtp-Source: AGHT+IEj7ZlMVNAKUdrjaY/3GBeXtLDCTgtcha8yiU2InhgEdRjJE8KlYZssUqB4vK/1rSlaM7FdcQ==
X-Received: by 2002:a05:6a00:c89:b0:770:fd32:f365 with SMTP id d2e1a72fcca58-7e00fbcf100mr3450321b3a.25.1764782726388;
        Wed, 03 Dec 2025 09:25:26 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d15e6e6e06sm20796471b3a.43.2025.12.03.09.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 09:25:26 -0800 (PST)
Date: Wed, 3 Dec 2025 09:25:24 -0800
From: Deepak Gupta <debug@rivosinc.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, ajones@ventanamicro.com, atishp@atishpatra.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Allow zicfiss/zicfilp exts for Guest/VM
Message-ID: <aTByhBmo_eOJnzZU@debug.ba.rivosinc.com>
References: <cover.1764509485.git.zhouquan@iscas.ac.cn>
 <103e156ea1f2201db52034e370a907f46edafb83.1764509485.git.zhouquan@iscas.ac.cn>
 <aTBxIBZ0Jwn67OcV@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aTBxIBZ0Jwn67OcV@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_092527_224584_BB0492AA 
X-CRM114-Status: GOOD (  12.22  )
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

On Wed, Dec 03, 2025 at 09:19:28AM -0800, Deepak Gupta wrote:
>On Mon, Dec 01, 2025 at 09:28:25AM +0800, zhouquan@iscas.ac.cn wrote:
>>From: Quan Zhou <zhouquan@iscas.ac.cn>
>>
>>Extend the KVM ISA extension ONE_REG interface to allow KVM user
>>space to detect and enable zicfiss/zicfilp exts for Guest/VM,
>>the rules defined in the spec [1] are as follows:
>>---
>>1) Zicfiss extension introduces the SSE field (bit 3) in henvcfg.
>>If the SSE field is set to 1, the Zicfiss extension is activated
>>in VS-mode. When the SSE field is 0, the Zicfiss extension remains
>>inactive in VS-mode.
>>
>>2) Zicfilp extension introduces the LPE field (bit 2) in henvcfg.
>>When the LPE field is set to 1, the Zicfilp extension is enabled
>>in VS-mode. When the LPE field is 0, the Zicfilp extension is not
>>enabled in VS-mode.
>>
>>[1] - https://github.com/riscv/riscv-cfi
>>
>>Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>>---
>>arch/riscv/include/uapi/asm/kvm.h | 2 ++
>>arch/riscv/kvm/vcpu.c             | 6 ++++++
>>arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>>3 files changed, 10 insertions(+)
>>
>>diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
>>index 759a4852c09a..7ca087848a43 100644
>>--- a/arch/riscv/include/uapi/asm/kvm.h
>>+++ b/arch/riscv/include/uapi/asm/kvm.h
>>@@ -190,6 +190,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>>	KVM_RISCV_ISA_EXT_ZFBFMIN,
>>	KVM_RISCV_ISA_EXT_ZVFBFMIN,
>>	KVM_RISCV_ISA_EXT_ZVFBFWMA,
>>+	KVM_RISCV_ISA_EXT_ZICFILP,
>>+	KVM_RISCV_ISA_EXT_ZICFISS,
>>	KVM_RISCV_ISA_EXT_MAX,
>>};
>>
>>diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
>>index 5ce35aba6069..098d77f9a886 100644
>>--- a/arch/riscv/kvm/vcpu.c
>>+++ b/arch/riscv/kvm/vcpu.c
>>@@ -557,6 +557,12 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>>	if (riscv_isa_extension_available(isa, ZICBOZ))
>>		cfg->henvcfg |= ENVCFG_CBZE;
>>
>>+	if (riscv_isa_extension_available(isa, ZICFILP))
>>+		cfg->henvcfg |= ENVCFG_LPE;
>
>Blindly enabling landing pad enforcement on guest kernel will lead to issues
>(a guest kernel might not be ready and compiled with landing pad enforcement).
>It must be done via a SSE interface where enable is requested by guest kernel.
>
>>+
>>+	if (riscv_isa_extension_available(isa, ZICFISS))
>>+		cfg->henvcfg |= ENVCFG_SSE;
>
>Same comment on shadow stack enable. While usually shadow stack usage is optin
>where explicityl sspush/sspopchk/ssamoswap has to be part of codegen to use the
>extension and not modifying existing instruction behavior (like zicfilp does on
>`jalr`)
>There is a situaion during early boot of kernel where shadow stack permissions
>for init shadow stack might not have been configured (or satp == BARE at that
>time), in those cases `sspush/sspopchk` in guest kernel will start faulting.
>
>So enabling shadow stack should also be done via SSE interface.

I meant FWFT (not SSE), sorry.

>
>That's how user cfi patchsets also do.
>
>>+
>>	if (riscv_isa_extension_available(isa, SVADU) &&
>>	    !riscv_isa_extension_available(isa, SVADE))
>>		cfg->henvcfg |= ENVCFG_ADUE;
>>diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
>>index 865dae903aa0..3d05a4bafd9b 100644
>>--- a/arch/riscv/kvm/vcpu_onereg.c
>>+++ b/arch/riscv/kvm/vcpu_onereg.c
>>@@ -72,6 +72,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>>	KVM_ISA_EXT_ARR(ZICBOP),
>>	KVM_ISA_EXT_ARR(ZICBOZ),
>>	KVM_ISA_EXT_ARR(ZICCRSE),
>>+	KVM_ISA_EXT_ARR(ZICFILP),
>>+	KVM_ISA_EXT_ARR(ZICFISS),
>>	KVM_ISA_EXT_ARR(ZICNTR),
>>	KVM_ISA_EXT_ARR(ZICOND),
>>	KVM_ISA_EXT_ARR(ZICSR),
>>-- 
>>2.34.1
>>
>>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
