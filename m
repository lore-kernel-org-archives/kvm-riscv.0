Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C5EC369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=13GHTB6fsPx2cTLNb0a4NSQ86lfgcaJuHbYfGR3rBFc=; b=tbIfc6W580V7Io
	nUHOzZ0vZuhLNDip7uQ7uyjFR7PhChOW4B8gA79MgxxJpXC96hTJj/W6fNyVqcjch9LMI/lLlhgGa
	7lMlLyp4zucyGLcAvHUAGP+EehDeSzBIQbFdytfweCETll4/dJ/9KS8eWVzKVbCic5mL6qzTp06j7
	UnWyF5a0JnzKAbSocD2Oocci1Y9Z0LTy8Ana/u2CJJ4gstDjzsppRFIsVY7SVwOIuxzG3KeTGqHvK
	6S/Xr6dLske2w3fhJqcpU1qYipguBCoMI0nYIDcbgMa749hENyt1Rw1j+LZGf4KKwZxS90vTo4BrE
	Ud1o36TsQ778uchupWHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7z6r-0000000EfgC-2eGM;
	Thu, 24 Apr 2025 16:07:33 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7yYk-0000000EVFR-2f0l
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 15:32:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-736b0c68092so987793b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 08:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745508738; x=1746113538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq4t7UW6LQy8HVZqyavJ2lszswgStVhP6cQHkrVx0B4=;
        b=o/g9ZQoQGlvUNwJfPr5A0rLOZYfdBkU6t9agBEZ//PwjUBUrUiL76WS23IuWz/I/tR
         lSDzsQ0/CO9UjmiZXTrd0MoiyM3TvKZuUNmvz5zQ4T0OqOSOQwzl63TAdWwtwxhgZvAi
         TABiKW4T/RCz6JQxGCMNWLwFZmRd1WKm8W66gPxlnoidPng/ILvn3AlJOIPa7B1JbgNi
         Ece6EvZSejoTkwryXQZCeNRu0v4cUcuVxojEJhtGfTDZdIVFqXDhAEM04Yi6vbbTnhp2
         dzXCqaNnatWcxJ7sXhJ7MXpgSj6ZLSISGIdc3ATzk3RcWoVKmYKVfbniB4aMj0+Esm/E
         b8hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745508738; x=1746113538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq4t7UW6LQy8HVZqyavJ2lszswgStVhP6cQHkrVx0B4=;
        b=gabBmp766tF6EvajA1fm2gjkgoUa/rPX1FPmZzrq2H4EEWZicPD/l4/514a4uJoKwF
         d0K+MjA7jzepG6LaDyMZvfngIi/mTJ/iRervk1Om/Vs/RDYwxaP04wxcJeDFq7Xl9jHK
         qe4V5IUiZ/YoMcJebsxzn/9zu8u9MjBJL/yfDRjB+CNAH5zJ/aYGG+bh5PZudezenESl
         sWSM6fBghcQuJoKpYFGEFJ2pkHzl+fuxd5mMY++msQP07FZeSyVZ3pVxbCoiPPHls8FZ
         INs6In3CbDmjxubMGDc9EvvWcEZb7UlCgpTTUjJywrlnZPWXnukmOdSKid/EzqVip+bN
         GBqw==
X-Forwarded-Encrypted: i=1; AJvYcCWOr4SwM9OGyt0VP4TEymXnDEa7E7+qEmqc7AZx8Q4ypdhQ7UFWrRMnjBZqphZ/1gwrazSwcB6CxXg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAUK0il73EG/457824knQLGYC7oKgMUQE8s5hNWeHs8+XLcHL2
	Y5YznnOKS2nMaEgN93Eciuix9LR9UX8z4m9pkR6y4bkpixxkY5PUH8xKzryBW+Y=
X-Gm-Gg: ASbGncuF/Viq299YQUuIsu/UxmdjnWQw+u0xk8S9VrFDnIQNsgbEzY4vC69takM2chW
	9953hTienW3qzOysuadN3oJeovtiicU+TEu916s5wvH73uhH5JeyYkAnu08aJWPgZ0N2MtH1Heq
	Oz2tWUCdxlRuOXJcVQWuPubdpa/HMapRXpqjx7K2yUPmpF9CGup/uvx1eC0emlMQ9Hpq9i8HhKb
	07Pf0C2O5i+L7FWPZFsVip0kMZj5GkKWFteykfXmzcdmouE5uqlBeI81gsdtU3M/RtMlGdEK+rl
	GpBt5+qvjoAD99N+jkceroxlltAm4JP1/60VhXcfTY0850zt/evofw8lwXcnxZJpXU4U1Z5LoRd
	74iaD
X-Google-Smtp-Source: AGHT+IHLx1lBNMSbQnarUYes6btCTNwf/1IXV6SM3KkJ4vOw83GPlyVf2KCTioeOb9jergc1GD2B3Q==
X-Received: by 2002:a05:6a00:ac0b:b0:736:65c9:9187 with SMTP id d2e1a72fcca58-73e245e4080mr4091165b3a.9.1745508737767;
        Thu, 24 Apr 2025 08:32:17 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f8597f5csm1360610a12.43.2025.04.24.08.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 08:32:17 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH v2 02/10] riscv: Add Svvptc extension support
Date: Thu, 24 Apr 2025 21:01:51 +0530
Message-ID: <20250424153159.289441-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424153159.289441-1-apatel@ventanamicro.com>
References: <20250424153159.289441-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_083218_672644_501F04FA 
X-CRM114-Status: UNSURE (   9.11  )
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

When the Svvptc extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 03113cc..c1e688d 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -27,6 +27,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
+	{"svvptc", KVM_RISCV_ISA_EXT_SVVPTC},
 	{"zacas", KVM_RISCV_ISA_EXT_ZACAS},
 	{"zawrs", KVM_RISCV_ISA_EXT_ZAWRS},
 	{"zba", KVM_RISCV_ISA_EXT_ZBA},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e56610b..ae01e14 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -58,6 +58,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-svpbmt",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVPBMT],	\
 		    "Disable Svpbmt Extension"),			\
+	OPT_BOOLEAN('\0', "disable-svvptc",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVVPTC],	\
+		    "Disable Svvptc Extension"),			\
 	OPT_BOOLEAN('\0', "disable-zacas",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_ZACAS],	\
 		    "Disable Zacas Extension"),				\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
