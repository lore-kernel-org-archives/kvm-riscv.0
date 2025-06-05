Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED70DC5AE59
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsupEadwYR12mQLQOiak7zpn8aR0cqdl/LLU/TgnsdM=; b=Lwq0kx0Xmw7Lkj
	+N7dWbT8LsHyrhpKNGJFDHAE12z7ok1difDKFkaXAs/prweVqPUhxyIH25cPAEQ0iGOMRGckx09p3
	M3xFTqgQ64CaIgoSnGbFtpERqdj4NdZ4rYZskK9cYIEdKtx87RX5BgiadEnBItn2zPGGIWoO4zglk
	GOpGVUmGvBLMKcF8Tjq3Sw050LJe9mc/PHXO6UzNq7n348oF7lgBJHLW2aJdxIuGWhUOe9j0h+ZX2
	Nm7/oKdgHpnaHoGR0NAXk7b/FMlNQvBqJHQAEvjfySKiUNRuOmD3I4HK7BqTECXWnvO6zyKr1sJoM
	EDWLeExArgULnfpz/KsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3ss-0000000Eox3-2lph;
	Thu, 05 Jun 2025 06:15:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sn-0000000EorD-2ZD2
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:25 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-23526264386so5582255ad.2
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104121; x=1749708921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ete+JrWOt0QHSA4tomw5kPck/IlNBcpn3GaqoFoCnO0=;
        b=F+cHE0ljD0vc9aeQuK0pbcFehZe/weGQPGaDXbJlYAXLO6hkBJGorHHMA6+9CVffyb
         aV+WAOGl3KgvYf4q9FaGlpK6FQ93PY4TgYUtc04HyUiiLgSRTrrNxSRV2jn77tSLKHDm
         gkbSlOHCvP8Gnug8E6JeHplbwWFokuNmzhitZN+VoKg+IonwY9aG2xlKvoSERpuJdwIG
         xUvddA/HBpnCxHz3hlIn7qcEQab0oKW5vAE4XyY8SCLlyV6mSFpSfMXKHn3k3y1TW9Uv
         DMUZOWi66SLPX8PIu/3WDp6e+sHyNsE1UpMul9lWbOK2dweNSLu9V1nGcHX/3v5PfoOy
         JvWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104121; x=1749708921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ete+JrWOt0QHSA4tomw5kPck/IlNBcpn3GaqoFoCnO0=;
        b=Ua1lOh+85fQXKFuIOaJiiTAnMTuWaOOmBgQ8mg5JiMHAvbAfqvvm+36ilnTEMjHivc
         hZHLm96sw7Aesazqh9QnEat+SPlhpaKjCimkQCZDGM4andDtg65mSL7wYGCNlwldet/B
         EtRfoGbwZ73c7GSkGCIGcB2X1wTdWYVfhLNBf8xnPdul1zR/XoVB1XgJ/jDbKALfqO9M
         OZQttqBzZwuJMDvAGM1Ug/6ZS7E76D4UgB0eCr2x13YTI540ofYrbwvpy3Xdchpu9qBb
         pGmj1bKnS/lLmL7SWQnPvCJdAz3UgThIMcNUcYhzXNMC9IluSB30CJXlHivbfOHJcC2E
         dTfg==
X-Forwarded-Encrypted: i=1; AJvYcCUCffLIPEOdjZEW9sSvnFt8JBN9ZOElQPtvX3VKLwGg6wzhtxi0ZdskyNZMv1vWLLA7L8t0MadvTYA=@lists.infradead.org
X-Gm-Message-State: AOJu0YzTbYUklaZQ5c94mje2qKBpbag4RM60GC8iV2xlhZDflaCL4CCN
	bhw2v/1QYtnSt0Lu+bF05D5qhip3cCuRA3iQovzxSolOatlsVpHSaHSAtyoDCRhNY+U=
X-Gm-Gg: ASbGncvnPhZ7mj/g6lO7C373w+/wbZRl3ArUAWfBr3LDm8pOoCaFYzarwENxKLVrYZ1
	rbdml8KwguhzXPs2WNtd7bfIw39zYVUxcQDULGF/Scwhsy6tG6g/st+invuYHCEwZfmKW7Vkuab
	4BcQwPdSwMvB41ZPb3GMHQS3UCxWzWAO8PEHaFddXjGnchM9zf/OnKtxfU4l+XTIWuzFB7DMsvV
	zAtv/u6gcyyN8P9++ajv7EePtBFDvp7j1gkHdEiOIzq2eOwUvQQnuVbVL+pjxdnR2pcfMEXk2OF
	M9v96zl21W6UBce7YPlXpoQxlGou8Ea7fkYIoWn/HFudZY6abMxxu42AoAZYf2KfgTSe4mCpilz
	00UipTQ==
X-Google-Smtp-Source: AGHT+IH4OBU+MycjQPriNgZTJHSLbifpeWqdkPpUgu3tCEdkhvV1zsaXs7ozI9xOz34l1HXvk8nshQ==
X-Received: by 2002:a17:902:da8f:b0:235:f078:4733 with SMTP id d9443c01a7336-235f078524emr28994305ad.8.1749104120604;
        Wed, 04 Jun 2025 23:15:20 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:20 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 04/13] RISC-V: KVM: Drop the return value of kvm_riscv_vcpu_aia_init()
Date: Thu,  5 Jun 2025 11:44:49 +0530
Message-ID: <20250605061458.196003-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231521_667163_F7368E37 
X-CRM114-Status: GOOD (  11.32  )
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

The kvm_riscv_vcpu_aia_init() does not return any failure so drop
the return value which is always zero.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_aia.h | 2 +-
 arch/riscv/kvm/aia_device.c      | 6 ++----
 arch/riscv/kvm/vcpu.c            | 4 +---
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
index 3b643b9efc07..0a0f12496f00 100644
--- a/arch/riscv/include/asm/kvm_aia.h
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -147,7 +147,7 @@ int kvm_riscv_vcpu_aia_rmw_ireg(struct kvm_vcpu *vcpu, unsigned int csr_num,
 
 int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu);
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu);
 
 int kvm_riscv_aia_inject_msi_by_id(struct kvm *kvm, u32 hart_index,
diff --git a/arch/riscv/kvm/aia_device.c b/arch/riscv/kvm/aia_device.c
index 43e472ff3e1a..5b7ed2d987db 100644
--- a/arch/riscv/kvm/aia_device.c
+++ b/arch/riscv/kvm/aia_device.c
@@ -539,12 +539,12 @@ void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_aia_imsic_reset(vcpu);
 }
 
-int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+void kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 {
 	struct kvm_vcpu_aia *vaia = &vcpu->arch.aia_context;
 
 	if (!kvm_riscv_aia_available())
-		return 0;
+		return;
 
 	/*
 	 * We don't do any memory allocations over here because these
@@ -556,8 +556,6 @@ int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
 	/* Initialize default values in AIA vcpu context */
 	vaia->imsic_addr = KVM_RISCV_AIA_UNDEF_ADDR;
 	vaia->hart_index = vcpu->vcpu_idx;
-
-	return 0;
 }
 
 void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6a1914b21ec3..f98a1894d55b 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -160,9 +160,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
 	/* Setup VCPU AIA */
-	rc = kvm_riscv_vcpu_aia_init(vcpu);
-	if (rc)
-		return rc;
+	kvm_riscv_vcpu_aia_init(vcpu);
 
 	/*
 	 * Setup SBI extensions
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
