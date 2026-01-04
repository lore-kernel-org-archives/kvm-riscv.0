Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15730C2A06C
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KoTl+xgGc2nwySv4ceDJgsCgLTfNw5iNxrK7B1jbKmA=; b=BZ8g0rtLzbcC7X
	/OpBw1KXeRLM3ydKxe8Qc1CvN6RCvIY8P0y6g/kkYHVNocnm8p8vkw340YB5U3J5KgUBKS9bUk14H
	RwgGuc8zok/f4gEfJ+jj3hCTt920Dcz7BKazcWjO7HFrkk9IoEOPtMQmVlIKIO3rAF0XRpMsduWny
	upcdtid+MVIfUL/N1WJE97HH2qV6W1zePM1WvFfxy4iPwWuIIU2onixhEpP/kId58U9whXib5ErYe
	goJj3LhZpIXa9TDvDq0xTZSCGq8NT1OidwKuwHRdEp9I6vkWiuBbH00DvIqM6o4qKvhiN/0aZ3+5l
	x8E6MUchWPtPJVcBfVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOej-0000000AHAr-3k4q;
	Sun, 04 Jan 2026 14:00:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeZ-0000000AH89-3oKX
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2a0a95200e8so111562915ad.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535219; x=1768140019; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqmQmaFNmFjEy7S54wIHblwNMJ9e6UGwg3T65EY/Hjg=;
        b=R1F9Dt1ZIba1aMyqIjHpg5404elEP1VCH1DOvv181pgPUwak90QvVNpPJqqN0AtiWC
         fJ+TZ84vftwAi9awZwlm5sCbn7Gw9hCgRhgM3M//azaqVgO4XpsbAH8yNRBqXDjUtFbp
         KpOXaFuJFMkInYa7K+PgAM/Sf1YAhp5nnAjhSEauObudMXxb+OL3PQ1OYin0ziEmDuSB
         vAE0XPxPpoHUtmslejkY4RaDe+2hHCWMDqFLM6S8fDrwTDjrJCk/kgiQlOakmH+pMeZ9
         lf0ISGXsmhWOX1BUkfn8OruEBuQuM64600lfPetIBo1Lns1TBsdmwuoK8SDDlpuQmvv6
         iF6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535219; x=1768140019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qqmQmaFNmFjEy7S54wIHblwNMJ9e6UGwg3T65EY/Hjg=;
        b=F+ka2A++knfs2gj7WX+6ytGBzIqBvrmu2LnNMaO6hi+PANgHZFH1FxyqE+938ZG1Pa
         xiG7R9/KyXvJdQltrK4O+BbQt/islcjEiYmdZsi2nDvTdGVb7pRjU0S8r4nTDjB27D9P
         /EA/NSokN6A4nSH32qLEsV6uNE/hV3u5F3IvBxyHVMXcCv7YVJxRm13KpN/iwSjQbZmf
         zbWlROVOEIN2xvP7bd/srpk6ynEEOaDIkDOPnEDn1vWvMsXNEko7gzZDre1NQGyhCR+7
         XjXB6r1sxb2JL3zsAcIcVe5JZAtmZhazdmXPu+BFJSGQ5lpTAX84knxBKlakA/19b91c
         kM4g==
X-Forwarded-Encrypted: i=1; AJvYcCWI7c9vAi1mNSBJMBi+e74aTie5Me5aRzGWKx7q5/Mf24OciCjkaf9Rva2SiVW2/ulcxUXuxeZdRQo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLs9JwWtKJqmFrAD7cQq9vo39y1YREFi2BgTyON7Rry8YAqBQN
	pyNeNxy9yxUGSkgLzIp0bPmrhIlekuMQSJP+SYeVQEYXWIqTfnzSdga7
X-Gm-Gg: AY/fxX5sgyvAGiBhpGSmHsGwEyRPNuv/Y3WaAUme1NzaLtd2KfjpiF4onogd0Ocgc3c
	UYZVqrvDhtBr2qC8aztqVhJbEqkX9cKUA3RfkC7a7LZwUv9Z4dSie/u4JumLgjEWXvUWHvM/58O
	1HnKNeC1aVCtlurFGFfB3/J7JPz5/EIJhZJFwn1mQYTVzJbwWIIo1yv0rEj+Upv9FyBt/3YtHvn
	bq+C85so3rmEC9b0uI840xys5+CoNDsmu7kVq3DHFqKt6ru0xjJFA3L2vKKgV7O8FZmTRnagYYR
	cGmvC/BHRj1/kXjRcEDrsKcXMJ1Jy5elkD/nmdopWDZCZWsKIy5XIB8Q3EvKmCRHq1xf8Z+f5Vr
	9q6ZvyxkbElFj3oZnXyNn+3ZQKm99dldQQG6/FQjDJV7BC/hKiriEmpujS/V2QTT+lRjbEA6rQW
	mL7OM7fJsipqeubiC/6sHsJPziOOSNdIkwSirh5cVj0f7qRssRquSKCljJdT8OhV2G
X-Google-Smtp-Source: AGHT+IFF0zPQhAdEGQIhG511RClUe4pVQFBGTYZnIh7qDrj28ymiDIGxnpivMIor8szJu6tv6fbZ2A==
X-Received: by 2002:a17:902:f546:b0:2a0:c84f:412c with SMTP id d9443c01a7336-2a2f2a3be72mr478366475ad.57.1767535219101;
        Sun, 04 Jan 2026 06:00:19 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:18 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 22:59:38 +0900
Message-Id: <20260104135938.524-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060019_949946_DA54070E 
X-CRM114-Status: GOOD (  11.21  )
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

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.

Fixes: ffef54ad4110 ("riscv: Add stimecmp save and restore")
Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 arch/riscv/kernel/suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..aff93090c4ef 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -51,10 +51,11 @@ void suspend_restore_csrs(struct suspend_context *context)
 
 #ifdef CONFIG_MMU
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
-		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, context->stimecmph);
 #endif
+		csr_write(CSR_STIMECMP, context->stimecmp);
 	}
 
 	csr_write(CSR_SATP, context->satp);
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
