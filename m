Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1713FFC6179
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 09:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bUU0s89eI5RwQpBJ0M9Jbwzxqd8VCyDdTLmrIvolfa4=; b=VLlC+uJjSEhOB3
	0qsXV4Jl1UTg0J690c4xIYZmBsvSBXH4gE4uPSNFrfCrVAE/CNMSUSy1Yq8aVPCd2UK84XkOgOBqN
	WHmMal9lsN7EWSvLr81YO2N2ad38y1UkZkMaPhn0htAK3j1xQQRXvbnd3C454Sst69BJkW6UEEt/8
	wzYMkafkjHLAfar6mzaml5t9sLXdA50X5B8067CXQxWXis5+fdm94KwMh3lqIjKhhxpJcy8nO4hTs
	7ImRmWQqrRerTvhZzoPQNwMUCsi/1H19tZm0ZNulH6qLtE0T1nchHf/YvHCxvpV1PeBLepA+tLJ6e
	77wsNoKRzYY0/n0rbfMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDG-00000009ABs-35Qf;
	Sat, 03 Jan 2026 09:46:22 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbyDD-00000009A8Y-0Zc4
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 09:46:21 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a1022dda33so102544775ad.2
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 01:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767433578; x=1768038378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dP0IVTx42h14KuVE1/XaC/JEoSCL6PoSMoPSC6rOH4g=;
        b=cmy12xDJKXQitr4bT6pk96ayrHmCeztK7uuQFxpcjS5+FZnQDe8dY21ebrgg7iCPnu
         aYqpmsx95VwH9XfbfEl2zG4SSu2T/h1cGtyNOdXDBqa0w+uIEJW/0BEmFsMTjlgq2+45
         +A3vnJDJyVy9s0yxGzn6uT6H7ZZtwRFGUAwv9dz5nzcnCZLdGBHMuj/nFW7P5SqZKXyd
         zrSXKczEL07f4pvSnXoXii7cBh+eFnh+6f8ZdebyDrirC6chBNTCvDJaRTdweVXZzlMu
         r2Yd/3Gkn3zPAAcZLGbl/PZbmZqCzbVDhIWV4XhnVTaL2bDI29GytpLaJmptAmHXGdkz
         isOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767433578; x=1768038378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dP0IVTx42h14KuVE1/XaC/JEoSCL6PoSMoPSC6rOH4g=;
        b=EFdmcLaXRfGYIWoakGPmRsYiWkU7L4bfR/lUhdNGyBG5Dh8hhF4Q3cIHqik8t0+rjn
         2YpfpNwnmZPX/Lbk8cVvIKm1Qj1TQsIZ+F15mfks3LxfWQ/STzxlpKVA9hUdSJcGQgFV
         HJ+WYXMo5xMN+cuGTGiu+VqKmZuxFy/2JG8Wf4AhYCEq3M/1qy1rERVYBWwj0WvHXbH7
         Z9I0lDcc7t5MraKIGgmwZJh2bshcioUXKPd9zXUFiG+wvVSpnn76B4KM+eyiGM5aIKyF
         rwt7sjS81VFceyi8ogOM2NOSZsFdGHyzL65Jyf4RkylZHGlUK6CwmU5UlKoNITA3aICZ
         4PAQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVa+oW5VtfQfMzcibntPruskDDmtHLJTV0eST7P5F/NVB3d6+XVfQ1MQJtDqGYGSdRtZgHiPIJ+Uw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIIwNmrSYAw/P8+Dx3l2C+4TaWj4KSJ2vwhSXJL1PfJ4Oah8Lh
	dy4Um5AJOBc28d5S+FUjcSltauWeJBGXcSucH0zlsLfqqfetHuoSEMwV
X-Gm-Gg: AY/fxX5OsSWW02QBpSKGT6voiooTOYXbRUq877SkASTQ6r9QrORxXmpvYmmsaKzgFtK
	xqAW2fPSU4km7WCQGnN3bC9lVbwGWcwQEt2xZcRVPbKjhtl4F1h3XWwAKmEaYE3UOSSFqtWR0aR
	FoMLQ4a9eB6zsh7jMOiIgKZeeEAXAhxq/xRt50Fdf6uGfWsQr3gf1RCovRt07ufIF5qNJ+AhoSa
	Vmt8Co7mLVq79PN8pVk8m4AP+JaWJiRraxdw5Y5mTgmfxuqr5BvcttUzWvqnrGAhvp5lpd0CVDg
	rIjg9lk01UclxasrxcLtg3DkPuparhOCAr0dEvcZQKUyHHFKFBczIhQ1eUw7wTp5aQulBfeEZ1z
	+iy+SwtxScCHoNMD+kjd4q6NqnYrWolHfUSQVa2V6NW2lJMgd6/g5XzeHYch2K6kdfS6mAPZu8x
	VXsv/Zu4R8mjhscbZHVAR8DGNAlZ9PaHPjCHl2PGbbldCOzmmgM3ua4TQnINxhsxxy
X-Google-Smtp-Source: AGHT+IG1CFsdsCyqKZEWFTi8fQu6+83oYv/ThQFQjQRZsNEh4BZNCae/3IqB71uabmFWXjYrwHYsoQ==
X-Received: by 2002:a17:902:f68a:b0:295:99f0:6c66 with SMTP id d9443c01a7336-2a2f2836964mr436024535ad.36.1767433578268;
        Sat, 03 Jan 2026 01:46:18 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cbdasm403124315ad.65.2026.01.03.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 01:46:17 -0800 (PST)
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
Subject: [PATCH 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sat,  3 Jan 2026 18:45:01 +0900
Message-Id: <20260103094501.5625-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
References: <20260103094501.5625-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_014619_213268_B4A4742E 
X-CRM114-Status: UNSURE (   8.06  )
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
