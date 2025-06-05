Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D113DC5AE59
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vaPhY6ZxE85mu/kzPVnIAW7jwPz9fEbZoHMLf4vgpIo=; b=eJJFJ8TC9zQ2UR
	Lz65Sg/bwInRh9guXzpzW2w8F0xAjvpZaa9uPJGddZPTS5tvdP4a9rq1wl5kJjW4QAL+T/H328s5b
	Oq6gmx398cg8IBFpMilxGrzfnbpvLexQLEWYTfn/slKEUm5rG9GepQ9U6pyD7rvlDYj7svw7Xtpc8
	s2fVczsLN6nb+NRaVauMSSN1+1mTGGHf7DG5h1HeyFR/wgBlGhBakIX2FsgVoc2BNqXJJvX4eZ04U
	HFS5jYqhurbsoo8nIqxdRYB2PXqbb7WAtcVHPgZXPg99CcAnQokYfvaicSkFlj1XkY/HnnJjfMvpv
	oncG+Tcf3+EkrVyi8eMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3so-0000000Eot8-2Xbi;
	Thu, 05 Jun 2025 06:15:22 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3sj-0000000Eonk-3zJb
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:21 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-30e5430ed0bso651602a91.3
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104117; x=1749708917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=XwOs533xbJaD9NJ0QsRIhPNJVLFG9hHsM2FWZ5C7LqBOFIGMlfQhM7/8D9wQ/bjC7S
         4ecs2vIKYmDQDiOChTC33ECOFUkCvc/ytt5AgLt0EXErm2IyHciMXJ7etq+hd+zMRiBI
         7ZEH1yiJOPieg5o1DrqUfPOp6gjxmKLt3oAe0fDc7K3qYfK2LDXqECOrw9U+8t1tcAcY
         E/ipIT9EONRiiTooo1sI1gd0oP79LIsOt7nvTR9Ozxcb73PKKF3z0h0NFxT9ejcLvgRe
         OoP/2TFMLSI2GGA87hICHdzwBzY6jqFjVPusXBjnar3X8GxCLPxMAcT6xjfw7w82KYWi
         VyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104117; x=1749708917;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pY/L4bm+P9Rr6i37e8lfQjnEvic7ox3vmCP9UKIlwY4=;
        b=dNFB7D5XsV78AD8TQFodfSn7ICH9iKHyVM3Ocz0Zak7Dqtjbfm7/z6uZgiD9kH2Qa5
         mwDKXCxWhHSyI26buTEHDgUiy+2QKrMaZgXe4lt1f8SJgGBb/jZMGBt2UiQEpY4Hnfk5
         QX+h6U7Fgae5qkUxa1nk+I1lFSOb7sjVO5iGIxRc7k4ua/yxLxHXpsXQHzmFPmjl+6r1
         7dSy01P5AQrFdIdo6tO1yHmeCZLlVkCcQ8KsJj6cCdOKWHc06W2k+JFOVEjZWBCOncUp
         0GN07IZ5gtioqy2KY7xRcaeQrVrkXIh316kLhhoeNvSP3H4nNDB21c+A/quNO/3QNluB
         DxNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsPPC3DR/RVQ2WevXtvTwK4wOUf4RAAGQ5bT4pm6JyjJgakV3klGWh4u/R7IRkEvk1AclNh1zhMEI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwV45X/QcONTQRjGPYV8ZnAcogSkpZ43YaqZ2ioVFnlCjBrReSU
	oXhn1dLBUVWDcRE+GSC3BrzqJ9LNYmHhJnEUCeUa0sYxdtIVWOphfsAzvGEVwijfp4I=
X-Gm-Gg: ASbGnctoIWDA+aPt664kH+zmIBZpWQAlmBJtURkY3IzKXK4ckCf7rdjDRCq+KvWx2GI
	rKeE7eJtHf2sIXAohxp83Y8Gf7hji/Cno8b67QXAMQ9UfN8PUciU7iVA7MZJORGwd/xJQF3BHQJ
	GUKkGwmf5b//g7LHvYDwXnnh2jOBOoKJIFBG9n2qGfdQIs229kJsQMJ0pOFIu2S/h8UlV+qFu1c
	xV5UEWWufAeCltNOdvMNHdWHK1qaQhGCMBahYq0YKvKjFSvUwOC/tV48GKNMn0AQaYMmhjegdZ7
	iD5nYMQrKd9RnWNYH+EI+FTwXaWrNsrdzHeTPyoAGcePieYa8/WA77QbIP6ofKmCbUquzLlDEQP
	UPhGINnnDG5zZKC235R99S1ByjRI=
X-Google-Smtp-Source: AGHT+IH+eTAD19cy9DJlja/MN5YACVJ9sgwSL2k4cnnE8LZ5kPurak1nzFsWixYBq+aRFevEKulw1A==
X-Received: by 2002:a17:90b:5587:b0:311:f99e:7f4b with SMTP id 98e67ed59e1d1-3130cd6d86bmr8229933a91.28.1749104116821;
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:16 -0700 (PDT)
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
Subject: [PATCH 03/13] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Thu,  5 Jun 2025 11:44:48 +0530
Message-ID: <20250605061458.196003-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231517_993601_B632ADEB 
X-CRM114-Status: UNSURE (   9.21  )
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

The kvm_riscv_vcpu_alloc_vector_context() does return an error code
upon failure so don't ignore this in kvm_arch_vcpu_create().

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/vcpu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e0a01af426ff..6a1914b21ec3 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,10 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
+	/* Setup VCPU vector context */
+	rc = kvm_riscv_vcpu_alloc_vector_context(vcpu);
+	if (rc)
+		return rc;
 
 	/* Setup VCPU timer */
 	kvm_riscv_vcpu_timer_init(vcpu);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
