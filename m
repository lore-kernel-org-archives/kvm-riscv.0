Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E08DFCCD193
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 00:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqDIqaM0+My712Q69BaPIAaejIj+NXTf1ecB3LbQzdg=; b=rJ/omjBVvNitNu
	EHcWLG9E19xYa7iwVEHjKNdr1QQAA30pYdA/QJweSE5iEayM/wcZ3MrvgHfcGG1vTRSvJOdTypw1N
	P/MPZ4ABQoYnaJ7mjrZaB3Nsc1IQjRAFv+HV3Zty7HK7zqRFGWLgxoqo7vM/xwCKkkgK36DGPsVJK
	OfyuSu7RFYdIx99GkZ4rSo3KJD1Y6iWDuzVVLJMvNJc9Y6PjbaU/C78SR6S4yQkxgpDfvdRQ8+I0o
	j0VWW/MLNpGIHJl/in6F1A9qxcS4wJ3dk7gA65f9ISqrEaZxOdx9qhHb9s17WcUaw4ZNNmjCNOB7J
	/PpdIXjofakrhrp51idQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BgF-000000038Mk-1qCq;
	Thu, 16 Oct 2025 00:17:19 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BgD-000000038M5-0fzQ
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 00:17:18 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-b57bf560703so61326a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Oct 2025 17:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760573836; x=1761178636; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bwptj4G5KoYvNAhjikL6LhizMbH7cKsoQglRkksgDsw=;
        b=QpXI75rgVyrbeDoQk9EVgYONBF/7hQeKw12z/iiVqkq2OEOvCtmLmNxXSG3RROoEtK
         uVST0R24gAR1oVzotvJASWFvPcEUk8lYeWQe3W0mMDQNdEoJ2NLxmOMuxxFy1hpFCzYF
         9Pt7AZRsAYxo85wFnrtYgenImXxo8f18UcxnXYq0Zi+XWvwckoaaEhs8fTlo4gQJHblo
         15hg+HGo9AGsfEEeGDA3cM0fIRskVBl9MLrQTnYG+30f92mHkW3sfD5PWdG0DWRdgPvl
         pAa0yHMoxSzOvMtCD/4rj/laDkOVzUKpzY4emX0TH3o7iA+HgXhd4A7hS20jzeqGkNGy
         niSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760573836; x=1761178636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwptj4G5KoYvNAhjikL6LhizMbH7cKsoQglRkksgDsw=;
        b=suia4rXpbgN84IU3k5Ntmd1++88aKCzkMSzw0MVtM2l5zOHJHS7LrPGMox49rCBjM0
         P/TNbuUr/nOay1sv5UKEBvrGGGuJs7cUJ+8q8gGoMrDwaukApJfrnThpzUFfLBIYbDMG
         oGhoI/+HTUJa6IK+H/2IqDceKtyPNCuBQF8j90P9mE/hURvUkRw+WqnOqybHDaEYvHzy
         QoYUd8pVhaOeo43w0iSOXqWY0woC4kZG6llvwMyen3JIe03q5pTAFBRAfj7QcyZyKTb7
         AO4ERpItaYndyDzFQ7xRywv7qx8Z0r7MVcSbkowRv4AAmY1hzDFz/EkJZ0BYdV8AAlpa
         baFA==
X-Forwarded-Encrypted: i=1; AJvYcCXpLkaURj3Cxer5SUOmygYJ52xJynfmO/dZF2ztPqOHiAiCGuyXXUuycYfr3QMxP7xnVRaTlQ8J8Bo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU4YP8KKIs+/o7T0IwBRAOLh473T4IJuBuMQm++kh6T/gQsFBM
	+SOV4yknfxiit/g9o12BzlLrl4iyVqFuldwpDBpOec34I7V7vamQCReNdKtHf43hgvI=
X-Gm-Gg: ASbGncuhSCynCggGDRYA+4HfiqlFp0eQ9CtVtRxTBj/g6YYVh9rwerUPXGvJ+Eb8oTO
	78m0FE70sH1I28biLPWMzG1jIcgYWzKlfZ+x1vmcy8DZYF3650MLRAt2RW3r3tk7e9lE5arYhAG
	uijQEPHPqv9rYrYNtxi3S68tJZ4FC++2YXlgqXc4akrMmWsw5ilegrMb35EnY2AvPnHZRH+o6jU
	EyGYoKhYnSa++Z83pUorBk5uGKh/mMufUpL7n7I4hf+ByIrFBFltCUq09M9kVbPxcvGBepliLvB
	86F47posTMc3pmhGcXXpRvwAJYZeMiVMnsE6eBASv1jIfbjBZVzMeiycAXO/h+aynGMpBjGbLpV
	Cz0CiHTO421oiCSiNLzNP2oRzSJeYfWnuzPPVXh7jKy2HfBDgD9+tghP+R+fcv2OY+3Vhtc4lsm
	uUGwW8qckksDTolJL/7BOabg==
X-Google-Smtp-Source: AGHT+IF8Txz7jrNpsSTJjE/JSeJk6k3fgDPYMzVbvQKqjcn0cbcXxdsvxtPavIzWrNBmcH4D/9ElyQ==
X-Received: by 2002:a17:903:2381:b0:275:c1e7:c7e with SMTP id d9443c01a7336-29027356a08mr313186275ad.4.1760573836372;
        Wed, 15 Oct 2025 17:17:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099afbdb5sm8484645ad.104.2025.10.15.17.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:17:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] RISC-V: KVM: Fix check for local interrupts on riscv32
Date: Wed, 15 Oct 2025 17:17:09 -0700
Message-ID: <20251016001714.3889380-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_171717_225939_733AB6F2 
X-CRM114-Status: UNSURE (   9.77  )
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

To set all 64 bits in the mask on a 32-bit system, the constant must
have type `unsigned long long`.

Fixes: 6b1e8ba4bac4 ("RISC-V: KVM: Use bitmap for irqs_pending and irqs_pending_mask")
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kvm/vcpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index bccb919ca615..5ce35aba6069 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -212,7 +212,7 @@ int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
 
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 {
-	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1UL) &&
+	return (kvm_riscv_vcpu_has_interrupts(vcpu, -1ULL) &&
 		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
 }
 
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/kvm-aia-fix

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
