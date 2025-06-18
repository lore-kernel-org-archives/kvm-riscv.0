Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 329D1C71157
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 13:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QbAE7ro8MXPj3gcwiRsH6T2i8UE2ztSZ6tm8Q/9wTr8=; b=RQmU553SSVuKeu
	WGZRzsr62osfAk1kzm4nqApX7fchYjV8iJes1hkefwJzejUXcrotibSck2759XiaEDFNQsnQckteR
	4AmJNqsMbMcDnEdhIHA1AAWM8FUAjtKwk6+/f37ZrPiIc1D6gRCZmIaQArZiWa5TURT1xwIhWYuEX
	SM+tIxbKdRsAoDJaxth5LeIHA0CivxL+TAMO0SzNyUh6ZlrSVwcwwaRMtuCKdrKWyl09K7eIMfj7u
	P/M/vEHSkuq1U3Jt4jcxPECTVORbSfA2aGl+rUVWSIWry3gRr+PE+t7caLfSlafthaUK3hE1WmKI5
	2+qTsdh6l5jJMK6zBRhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRsWi-0000000AEYU-3aOa;
	Wed, 18 Jun 2025 13:08:28 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRr54-00000009xcy-0XQK
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 11:35:51 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2349f096605so91409315ad.3
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Jun 2025 04:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750246549; x=1750851349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=SCVkw2T4lZsvn6r5BgqJfd/+oV1/9qdk7gJAAsMUVpY2m5gm3+bnRMX9rRo8CL6dLg
         OWOrjXAbLMXC95ueoP66uhL6rSr2+wrKPLnB+OF4fIwUmXs9Jgi61KKnzef78LGqkGmd
         HKk7sfsE3FPR8tBcjNMJgr+9J3mygGguH3jw0+WDlLyIFqSO94PLUeO8PaQ7SXOWakTi
         89j68muB+QEaj36127JXytHT8xVnvodRE9cHwEsbSbZGQca1h5nPAdS4i7S1oqkFZcso
         3gwOVa+bfZjSVg3PAzNOk5vlxUd4ajXQpQVNZ29rYCWFRQB0JzsAeqmS4XFwaE6EhRQ/
         638w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750246549; x=1750851349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymMx2/Jj5SWc9oh0oJCNF6LPBe8+NWhSuF7K3lIaf9M=;
        b=w8+Bn88pXM0FyNKvhN48nWipBwa9tJFkueGl/Mf+AwlHzFC76whplJe96eOhrW4DBu
         1FQ+QIQMFRTT0mNWHmZge93YgRsOYr/pqOV9wjWFcYmfeiCwjxKnoDYEWk5YKpqCe+5B
         81DxrWWRwVHrkYCOC2ucFiEyJPWzkKRxovGpXQkxRAOrja/yUiOBvieMxpy0Aq9sF6ys
         2+NONMf/JFAHxipmrzisOPkohqkyUj+cZamdeiK/eQVRitmfPJJvC3GPKQM44vkPfc7N
         Qd0LqQtIdTiTvhSffI4RKS4eQeWDJQu/bvT0CTuunX8ddl6uu9OnQbPqrAzHOXYIPbfc
         5adQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0biSZBeq7FgdBEJKer9SfsVms82guVLwMlxYbb0I5rY7IjhSi9BDVmiix2OE40n6PeZhp/tVq0to=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoV6ULEOcUC4Sr/IrB92Fr1Bq5/TCErkUVfQtgHC8YEZOfXbX6
	/KVkErdMqYGE/CZIw97w3eWz3iFfPx5r3gsKybWgd+Av0aVBg0G63LIrNhLt/VoaAWo=
X-Gm-Gg: ASbGnctCIK46wadO/wRSzL5OkW4PEPhsDlC1/RZHaAPTo5zT6+hcL6us489VjL5yNfE
	x5s/K2euLPEvzKm2joMp96KpH0H2O8NmcWKOWpHfyoy9pdDmAWpF2/5CRgjrIG+AJYXiYJWsgeD
	CsnJ3kk1sGQPoBW0NVuEFfpYGtMVnYihomZs/fozK8TEPk0mUHy09Ps6/v7uqz2USnKkS735cRj
	wfi2ihTOL20Rz4VEV6AQmPn7wIlm0RiG1zKAcWpSgx+SK7zeYSqlJa03m4mo0PhkmISpUIItQYi
	/ThFWU84iOn9hw4Sff8bjOmP5wZHFjHgbfJ3oRF4lGBFHYb9W50Ifb197sNPxD5vNgd2+DlEZQM
	hOKsdT1tUH4pzD0K9pw==
X-Google-Smtp-Source: AGHT+IHpQurN4dARXEVEkELnBd1/eFKHOQXO7K5ZeHZVbZ7n3gcsWaLN1FmavIalixJDtUnrPtlsSQ==
X-Received: by 2002:a17:903:b8f:b0:234:a44c:ff8c with SMTP id d9443c01a7336-2366b329f71mr223770515ad.18.1750246549511;
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
Received: from localhost.localdomain ([122.171.23.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237c57c63efsm9112475ad.172.2025.06.18.04.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 04:35:49 -0700 (PDT)
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
Subject: [PATCH v3 01/12] RISC-V: KVM: Check kvm_riscv_vcpu_alloc_vector_context() return value
Date: Wed, 18 Jun 2025 17:05:21 +0530
Message-ID: <20250618113532.471448-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250618113532.471448-1-apatel@ventanamicro.com>
References: <20250618113532.471448-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_043550_168292_E1371412 
X-CRM114-Status: UNSURE (   9.84  )
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
 arch/riscv/kvm/vcpu.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 303aa0a8a5a1..b467dc1f4c7f 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -148,8 +148,9 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 
 	spin_lock_init(&vcpu->arch.reset_state.lock);
 
-	if (kvm_riscv_vcpu_alloc_vector_context(vcpu))
-		return -ENOMEM;
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
