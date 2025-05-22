Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75210C54ED1
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 20:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=08sFAnUbLoUeEI8kQz7n73GMF2Y2L0/8Fm4Fj7tYt9g=; b=pfy6b5bD6M9HoJ
	25uBXk6wLGSHHXTJTUw091z4+eSpP+W8uWJFxxZMY/94PNziPMEWxbOhhZ9JWFPfH0zQEuU+cRqgK
	HmIqXQRYoW8t+j0gsVVxJlWCTtaSWO/yITRBcCXvEn4Qn6smFui8GwvR9gO1cIfIGo9D23jahPMlF
	6q4diA6fnWG32BRDql5U12lN/avaGd5tTRCIM9wTkx5thQH9ZwQG2NuYes8pR9BovnqcMr32o1XsZ
	FN+9gpVw+XiYtbYKGzzsO2bH28+WUkALCLyH7swyin5f4K07GlBgPXq7T0/XdFGFLfBB5tgmmS+cd
	tZsXz5uh9fjSpPJTn9Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdm-000000028Ah-0t7I;
	Thu, 22 May 2025 20:35:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uICdi-0000000286g-06FR
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 20:35:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-30e57a37294so7971687a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 13:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747946141; x=1748550941; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=xleRcQ5Dxo5cYD5xCTAUuNsY5WsCZWMyXeCNERO5HjV38QNXeEe/Ujtz7puVo+IjHq
         jqo5OY+XABUiYC9/GDA0h8EXrBu3AP69ytp3LTNGUlqArHevFQ/Y0DG+0ZwFXn0/7/IO
         WhtLF/kRbFos3yjShVpUMySSPUBWggSuxMUeZd54u5H2gTcR0HFpf+12u+ZhQUN2hNDo
         x3UABcKXGPoWjiW/8grrzHwiURdqNnWIT3809KA9JcCZngQ6byZuicWJXt21hd+vjHlJ
         MrO4pRdFSnPt+6QoCPP00NkKbW3OB6sUE4AEtsi8rBZRXweDczhwI06UEeE70z75yduf
         arXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747946141; x=1748550941;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VtEdIrem9+Yu9wt2wQL5f6sWXSENwBasckRwFklDCAs=;
        b=DDCHVVZtUBzOLCVTwVKA041EsBpFSH7rX8cRIGGycgNxSvqZzSBNstLPPiyCc4khej
         sg0uF+JlswdIlVBCzAoMJ3hotQ6ZwfnJqttDeAVqEGmlg5Mk+0JAMOe7fzbbYdbRG1w7
         XOae1cl3+F2hAbVaoUyy4kp9NN/+l7EYhvGNWNvAwfiTM4tg4Jizh1a3hChMTYQHbbJh
         1tzN/lqymKkvPL54q4rr2CGIyRoHLs2GT/Ye1todPFF4Lzc67hyI0CCHDXwdHl7HHoNE
         kR6kmbfxTmNYaze0Eh0dzOM+iln7gQEH6pZL5pkdHyX0Sx1BJyl0QWKbPBxcgi5p94r8
         NwBg==
X-Forwarded-Encrypted: i=1; AJvYcCWEu+rrLxRAHBS4dj1QEUfHKPmsOSe9eo04z9fJPZE9DMHjda4a8q6K5FtCBc+wjJklCOxfRsP5V+Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfOZORiryE7LtgoyKLRnUEXAX+lqDXEtMT1CNSWapIG85tq6X3
	TJcRpwURvF+EcpLtvjX9DuDDd7k5niETfwU0jxWQAaRbtf/wkRUl580EPAgal2ho3js=
X-Gm-Gg: ASbGncuZmL1H3H48X3/XqpfcXwiuRkW29eTWn3GZT4f1rzpC/ji1k2Evhy4j66lJC/n
	IoMHi2GA3lpsTGZ3qY6Nvu9VT3u7dqoWfpy8xD6CASIjeHVGwcfTXrVg0Q+t2/23ftnHBTrxCth
	4stkcN9+IIMdguL+H8ypcPMuTQx8VtVK49PsyzGSL2rdJrmrD5J/NgI+V4lEMHlW0ijpcWHGfXr
	nNaRQlV1aCqqflbUbTOBe63RzSx21C0pacEo2X8tWS2qw4k4JRISnUcn83uFoiGM4QMusfW0Say
	FjeIaWAnCU9U3gd8YOqKXjB0fPm0sMv22O6ONndaPMXwrewBZoGKQNGvd7w+F7ex
X-Google-Smtp-Source: AGHT+IGqDOgucStiU9mIVygqIjkW9gQFkzXHNqcolrSvYh0x1SWTXJ0keMr/XGvbvYLot1jB1dLQqg==
X-Received: by 2002:a17:90b:3dc7:b0:310:8d73:d9d9 with SMTP id 98e67ed59e1d1-3108d73da51mr15859023a91.18.1747946141494;
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f365b229csm5932754a91.10.2025.05.22.13.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 13:35:41 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 13:35:29 -0700
Subject: [PATCH v2 5/5] RISC-V: KVM: Remove the boot time enabling of
 hstateen bits
MIME-Version: 1.0
Message-Id: <20250522-kvm_lazy_enable_stateen-v2-5-b7a84991f1c4@rivosinc.com>
References: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
In-Reply-To: <20250522-kvm_lazy_enable_stateen-v2-0-b7a84991f1c4@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_133542_068298_33F58C08 
X-CRM114-Status: UNSURE (   7.57  )
X-CRM114-Notice: Please train this message.
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

All the existing hstateen bits can be enabled at runtime upon
first access now. Remove the default enabling at bootime now.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02635bac91f1..aa8f7f67646a 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -562,16 +562,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
 	    !riscv_isa_extension_available(isa, SVADE))
 		cfg->henvcfg |= ENVCFG_ADUE;
 
-	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
-		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
-		if (riscv_isa_extension_available(isa, SSAIA))
-			cfg->hstateen0 |= SMSTATEEN0_AIA_IMSIC |
-					  SMSTATEEN0_AIA |
-					  SMSTATEEN0_AIA_ISEL;
-		if (riscv_isa_extension_available(isa, SMSTATEEN))
-			cfg->hstateen0 |= SMSTATEEN0_SSTATEEN0;
-	}
-
 	cfg->hedeleg = KVM_HEDELEG_DEFAULT;
 	if (vcpu->guest_debug)
 		cfg->hedeleg &= ~BIT(EXC_BREAKPOINT);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
