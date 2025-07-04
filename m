Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B134EC83F03
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gNtue2ev6TqLkwfj16j8Gms5bNb7gQaj1FL+tLf50ZY=; b=4lH327VLPgrKbm
	elwmsSNUpsdzaDdzfo3zsfmGD6Rf0efhwvCp6VBBri1U2C/QruwiiIboBx/iZLaLG7yIOEOnkndk+
	rRDjzEi72+sddNhxgQ18OqJhlqqqk3CStpoPCg57UIRL9SCydTxvOkDI1aPS0cUYvEH4TAnHDh3B8
	AvP/cDaiRVC9qz0oN4Z4yCSLlnpPlCtxdcr5bbNIiLXKi1t6pmpK3eHYLJyCC4kRd90TekR+7txiK
	iA7kXdWvOE3rwBpMnu6HA32oujJ7XGoltVV48HaK4AhH/rPypueh89rmveVGmlGNq198xPFPB1Juw
	EJgabvTaCuQb3YfZtJ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiW4-0000000EqrI-1GPh;
	Fri, 04 Jul 2025 15:39:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiV0-0000000EqbU-3Zfb
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:38:51 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2352400344aso10699655ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 04 Jul 2025 08:38:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751643529; x=1752248329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CcyVISN67taC6h/BgRmPM88r/wN68xhaL4uppVs0AxI=;
        b=FarV6+HKwv0msdlvVTJJKElItXEsQd/uGFCNdyn35fWOsADGD7SJQSq/tXEMg69ZPv
         C4FORMu5QdWi8cZClYHYwkm23WgfqoHs1g5kQHwHswYM3BYOWQHqvobteTcJWGTcaGxN
         +oLMfai7b04hAn0oVG932d+JoCAzyD0L9liX5wgp3wNbkVHD+X6bVw8jFLw5BDiFKdDU
         9ndA/VmaulF+DX2SsBl9LlockDDIKjhbx3c/YAkmPtMC6XOK7Y4dpD1lryv0PJ5p1gv8
         k/CgzUw0OTEMFOjsBY8XX/3NodX0zCBWgVsRsYoKFzZAXJF9XWJgFRFrGh5NsTx8baM+
         fwjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751643529; x=1752248329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CcyVISN67taC6h/BgRmPM88r/wN68xhaL4uppVs0AxI=;
        b=WCdfQVYdxPAvzIuTULQNgOPhGZbYovwWZQPmWt+B0xNUk7u/o8LVhohU66Ag4j/ojf
         ZE86oHzs/DH/NTabUAqCX8ge/rz4nBMk/xyWOd10WLCWkzo8zGIvZNcTaBeOaqOR19zu
         EhzptzD5B8arJi+gkpcZw6+9K3kn/D1Z2Nz4c3Sr/C7Tj+pU4Jngi9UI0EFNWWgoXr5g
         GSQFf1VZ8gac/3TnUyqsna3wtEe11nglw96a5VnOuhlOm0gMYTs+oqHkM1pttA9exUMG
         asgkp5T+YPHRal7C8sI636IIZLQLbMH1ujOqHCOR3JsXf+UiJlo/pvmbHI40AW9k+OpT
         RMgg==
X-Forwarded-Encrypted: i=1; AJvYcCWGAEQEsk6PaaOj6EJsnNXTeLXm6rPurXQY7q7D3L2fdVAqQHUH2Lm5CcsyGfLI2jjpMWBFf5TTKUI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy56lm0Hq/0Zt52rQ/PziVUqaY6sg+YPOM590Za/A1ASwqMekCN
	ynRncQkfdqOp/PIZ8+78oeckWXdAwwwkoOvYcFH1KDcPX54YnRdRFIzW20dmW1x2jEtK7ZW2RUf
	VwPQfGyg=
X-Gm-Gg: ASbGncuebK4Iz0EmPKgfaTk5RYZjb/4Js33/G6Q2dZGOpYXen6lnnEWPLEjw8rKxUQu
	21Do0l8Hw5S//k9rXy0FeoR1rxMQ1/NS72iOPGNvmZsbO4taVCG1eqb61hrAez2mXytGNC7mGB6
	JqlVqVMFQ0V67YiWXTuHqoTkXaCFZJp+G2SFu4sdgDByZi/QDrpVTbJ1mO9eeVQURmuKT0tEcvG
	ilIwd+6VbyRafzN/OAXk2entlb0iL5KkkmV99A+KP+g4hns9cBgee6g8Gj83v2OoYDvynPxikrY
	+jOS7a6TnFQFUVWhA1uVs2ITPjpammyEdGROx44L+KcrVOM3hT2OKVols9efm6ZtUDcocb/SLPH
	ulafiwTY9IQFJaSSz5pSc0eWRedOKjg==
X-Google-Smtp-Source: AGHT+IHCoNM/FN2r7kAw4r3sBqbkqR7ZPm3zgW5FYxH7kU0oFHIRlx/vujAnKCk/T1gpdC5+o539qA==
X-Received: by 2002:a17:902:ebc6:b0:231:e331:b7df with SMTP id d9443c01a7336-23c8624cbeemr60131625ad.29.1751643529473;
        Fri, 04 Jul 2025 08:38:49 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee63003bsm2084818a12.62.2025.07.04.08.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 08:38:49 -0700 (PDT)
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
Subject: [PATCH 0/2] Few timer and AIA fixes for KVM RISC-V
Date: Fri,  4 Jul 2025 21:08:36 +0530
Message-ID: <20250704153838.6575-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_083850_880973_1BAB9438 
X-CRM114-Status: UNSURE (   9.87  )
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

The RISC-V Privileged specificaiton says the following: "WFI is also
required to resume execution for locally enabled interrupts pending
at any privilege level, regardless of the global interrupt enable at
each privilege level."

Based on the above, if there is pending VS-timer interrupt when the
host (aka HS-mode) executes WFI then such a WFI will simply become NOP
and not do anything. This result in QEMU RISC-V consuming a lot of CPU
time on the x86 machine where it is running. The PATCH1 solves this
issue by adding appropriate cleanup in KVM RISC-V timer virtualization.

As a result PATCH1, race conditions in updating HGEI[E|P] CSRs when a
VCPU is moved from one host CPU to another are being observed on QEMU
so the PATCH2 tries to minimize the chances of these race conditions.

Anup Patel (2):
  RISC-V: KVM: Disable vstimecmp before exiting to user-space
  RISC-V: KVM: Move HGEI[E|P] CSR access to IMSIC virtualization

 arch/riscv/include/asm/kvm_aia.h |  4 ++-
 arch/riscv/kvm/aia.c             | 51 +++++---------------------------
 arch/riscv/kvm/aia_imsic.c       | 45 ++++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu.c            |  2 --
 arch/riscv/kvm/vcpu_timer.c      | 16 ++++++++++
 5 files changed, 71 insertions(+), 47 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
