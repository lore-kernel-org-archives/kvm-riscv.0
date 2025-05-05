Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0887C3ABB9
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mUIS+czOvzPMuFwRJuZMSI0pdX1WgP2NIlu40mB0FCg=; b=aiW+kcSmzXm9oF
	a4mc6KDBwobS6yV7OmgYocTY8HwFUBdfEA2emtlM/0DP9YzV8Wr0WP6rLVfkIK0b6x8T+yVhJ1LUE
	dtnra8tYNQoI9tGkPSywXxlAoZIPdS6yti2BImHZsrIyBeafQVdP73+OuMgnmAPJuVMi7jOBOUrle
	iFLU8OYNP7QSb909YP4/tbizRFUe2/ZxY7a4wETuwvfZcYQiwFXt/oYq4KnFCpkzsvmW1MwWreebU
	7VsOW3Nqb6e8WDcVtqaFiHHh9dzvIjRzkRDGEFyW1kkbFt1Rjm/5ticq69opHzB3SBpq8txZUWkrR
	RYMQnqgrYDBH/btlGfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yz-00000008drp-1ysa;
	Mon, 05 May 2025 21:41:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XP-00000008dN6-0NLq
	for kvm-riscv@bombadil.infradead.org;
	Mon, 05 May 2025 21:39:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=; b=TCYcWQqGG/dKccNWIk3wdj6WdQ
	mP4TveklMV14+l5IQIybQ+xh2MJR+bIZWj5kPl9zgk8YIFobQbdXTZgXqr7NqBRYN9t5El8BtoWgA
	42DGLW9vRH1lq6G/nVPNVvSjL1hZKCQRmVX1tn/oVfthAAWBR9bZXLaMtFbgnC+WdSD8zfETwB7x6
	e1UuBELp+LPnh4IqP/Uow14qEfPZ6H7WA2RAPpSu9jNvE7K/Ioio6MkkIjstH7nq/DQZ7lX6s5yvZ
	cnf6YMB9C9H2JNh50s5K63st+vfun4Z6zr2+6N59qJKiPYLYIGGPeXcB6BzlbGCJY6n4gKZUwCdX+
	R+PBbdHg==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uC3XL-0000000FYCi-2a2E
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:45 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-227b828de00so56848155ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481180; x=1747085980; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=J6tJm97rYmgYEtSNDtDEa5rPqKqQVzxMWzOFPYYZHJkJbsfVIlopc2vYbxRK3nrq+N
         3zAeVJqtMZP99mRrPK7EnYxrF6kb0zfqBNsuxxZk2PagP3qalJoJDTI177levASD1pMi
         dOIBugxxv2fxQmT20tXv++YakUXuQE1ZR4uDtxHeQiX5swsQTD83GPrlHNxPfPebR7Nr
         5hQ6NQn2H0v1GrN+o5v2UTdX3Nt8UhBLFPpfPos5t/TGN0iwB13yLpWsgvKhrNGOYKwg
         L4YCjCaH4eSIwFlloI8owWTjycFIMWlsU/XN5tNEhV0a8DD+rgIUBCCQrRWli/735UNr
         +gkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481180; x=1747085980;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AS5RZ2dErdCUnakbj1eEwsrgZNqL04KOmjC/MeeOuAI=;
        b=r5u8QNQd7Fnw7WyeJscbp+valw3tQ/GxB35jaMlqJBR48kP9susa3WS21I6MSNU8WH
         OTZMCw0gx2rHcEvT0V1zbY+EDpt0s05YNN14rnK573t8lwA/7cMOyZjBIzEiB2PFnkYG
         cLGYt1WbVJTAY/91hL5bwKFaw3IJFlzPZbkbsdV/WsL2zjtrcW53VHaWPBdlw4ArHlME
         OeUXDoMSTuDoeWJbIpdAlqbgGy/kI5Bx9UgmdPbEU7ebY0CcqtoHSG3VJKdq71r90vHv
         WFhL7dfdaZz164XEL+pd1Es5l9yPuBxPl0Nbgvht+VtKuygt5BaipNLpZ1U4BOzLVnVf
         yBGA==
X-Forwarded-Encrypted: i=1; AJvYcCWedvm7GnzzsdbsEGVG8XrGsxjn7eQCDE9AW7Pel8tEuL4aOQRFYZceQHXHOiWK366Qrm9zRmj2FXw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVXVAy7m9lppJ7PyRb7+QV0yAPKB8Zns8ocdJK2ghFeRRqB5XV
	8Fv32pXJZ5TX4YMtU7S63PksIzP0vIIiXeeJOeazNdfqdpgJTSR6tPvDSnsY5ww=
X-Gm-Gg: ASbGncvcAByGi8Ae4JSvkcG1WFuDUtV8IF5EI8N3MEG+u5d5HZQilBjBD22C3Qz1kPy
	4SoiWMIHaKxa4Imr6sEAZUlGqyHW2dykvQXplIvGQlhKywm67jiepL8N412kTC5abQRkfuWez/i
	+nCtTjJXT9GjS+gwVy+Z1cZM4txft3kJanOtASRvcfaeoDi9QyO17HQy902b9wCEvaurmZXR1xE
	2X7FbVGyW9rLmacexAbsixIDWZTJD3zefne0x2b1+zO9Qr3UIqYNLBWFAvgaitL6qidJ2ESZ53o
	2tWBmy62mCLAZNOx0d0nGGsaywYfor6X/h/ZJ/tm1gQRgbmdXvvHWg==
X-Google-Smtp-Source: AGHT+IF0cdGfyegYWS2h3g8K1ylrRO9RH/TBuX+Z6nJcjOdwQsA79eqmv6Tj/3cv8UZxiuHtVwsgFA==
X-Received: by 2002:a17:903:22c7:b0:225:abd2:5e39 with SMTP id d9443c01a7336-22e3633a6abmr7949715ad.30.1746481180682;
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 05 May 2025 14:39:30 -0700
Subject: [PATCH 5/5] RISC-V: KVM: Remove the boot time enabling of hstateen
 bits
MIME-Version: 1.0
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-5-3bfc4008373c@rivosinc.com>
References: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
In-Reply-To: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_223943_922340_F3FD3307 
X-CRM114-Status: UNSURE (   7.58  )
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
index 60d684c76c58..0aaa9e0e4a01 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -560,16 +560,6 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
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
