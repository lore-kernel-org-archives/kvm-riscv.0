Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96CB3C3ABBF
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 May 2025 21:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8VXrprEchUHWjNVXszJewJp8/OR/j4qdBXlYV/rio2I=; b=t9O9YB+2/a6UkE
	LoBRE+vXx2WtgjgD7RQuRoZOCiixh8SexD1pRaUR2YmmjAKZEqqgKbAvJ1taZ2Iea5YvJO2UQL3R4
	OqwbH0NLY5bloDPbBdF2bthajICNzb1DVGAw4AopSbkGAaY/V+//8V4CbEXk5L0bnK5rc0gSlOAq7
	BnCXVIKxj+DVA/BTVUIihGMBGsFQ+61Drz1zHBKqZogGp+S4ssN35mNmexMbIRj0Rkl3Ewf4WhiTL
	C2QZjs9DCStPk6uu4CtYKkFFZ13YQu+XfzQKjz7w5XgkQGVcTv4vE0R1I08BMeVvOLGLxd1Pu9ofZ
	AbNgW8BYgdHxrQ2EEHIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3Yu-00000008dn6-3zH7;
	Mon, 05 May 2025 21:41:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC3XF-00000008dJL-1D8w
	for kvm-riscv@lists.infradead.org;
	Mon, 05 May 2025 21:39:40 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7390d21bb1cso5217976b3a.2
        for <kvm-riscv@lists.infradead.org>; Mon, 05 May 2025 14:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746481176; x=1747085976; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W99fxoPhbzUqm7Gk7SdB4XI9Zg/UKYP4CZESDkaON8c=;
        b=KanRasgjzTd5fxXlJCKox4RN9XyKvUbucH2g/yTaLmcvhsZJ9cdDG2mjCfQKOxELhb
         eMdiUmkpzn7ZDYXha/AZ4LxGgvjkBKFi0HX4eRvfRf8/P2d+m+bQjLYyCkbvGp3k3xhB
         O+zIDQ47GRCAiCLsXEoht5FotbljQiJmwE/qGiUPAm8Rh9Q1RKPhCtAwga7K5PkHky4M
         jZ9hyY5jvEYGGwlb0EAhmbgs5Ib4W5+gZBjTR9yq7x9EMNQSqVwrkcOI2f4+kwQ+DZN+
         R8tUJDepLS0OC2rU/HE3IyvoP/sil+JUjQoUCam/60dgnbDS0p1LeiZDHpbc627iNRql
         KQQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746481176; x=1747085976;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W99fxoPhbzUqm7Gk7SdB4XI9Zg/UKYP4CZESDkaON8c=;
        b=gNZnb9aZgHwizEjGxar1GvBlIPeRe0h/G4NVWuCrfPZ0EpjbnmMcpJng7qUyerJaed
         d0CM4gexYM9Jh3s0Rom/QsaRImiGWHIBPGZVxRTRJVfuQKILByb43QrGXwpRIPS3B478
         UlPNF2cPQYxuQFpq+h1iIHwUvCRuetqQfV1M+57ku4XvKUc4t/rh5fC9cyNbXjOVTdXu
         ijEdYXr8qywsjqGEve7y2dHRYBHFLdbuCa7VMsC3tx9kYoNn1jqoXexsBWBcClC+Z2cD
         D+IjY4iH91Df7Jm8hDJEnLQxa3bHch4Zg0YoRo0ykizPBAJjRxw40NJEPtR9iAadFEKF
         npLA==
X-Forwarded-Encrypted: i=1; AJvYcCVnjVOnm3zNtI9nCut6uYkCo9SUeH8s55edGFSVF6g1Ic6zQK0G5aD67ZSK+MGlXuW8/w8QSQPyHeM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxfWAkFRj22stGORffv4BVQSBUSkpQiAc7qiG2vYx6jJmGHZQo
	4gO0ILM4I7BLr47wETFRe8UEbNJFzL1yF4T6KMh8RODlYH8LygOdu2Pz6ooFWP+xnDxMbcsgw6e
	f
X-Gm-Gg: ASbGnctdDro1qxgx2SboE1maZ3i5XtFJas3XrAG4O8d0iVI6D2Wc69dlHDdwElye0nF
	9wVQIvO++BGizvAVh0zoTlzWX0TG+daSS5QbEkN+vVQCixdDYSieL15hP2QATyFcbvfWdL+Dcxv
	2HJi4HlSLxl//2ARw9+5IMQQKee9bivDNhE5057JRr4fPr+w4fpAWdg8ngx1XMMas8nx/RYHBT8
	Zys50VXMDrnOSdioeZDI0mhvGP969NnjXYNDtCWpDhuxaQEXiiPGZaNlUrRi+xoHRIPvRffrZdU
	Hws1Ie+bw8qiOHvG7Yy6eFHbC5MaEb0e76PPB2v5gwFYr/rujUTXHZjOWsdLJBvO
X-Google-Smtp-Source: AGHT+IHJOxFm989TcbBZBaCDwcCJ9ebhtRuxodDiEdghNVUEU6LdMQk0DXZ57fAxwh3qFk8n0Wb3MQ==
X-Received: by 2002:aa7:9a8c:0:b0:736:57cb:f2aa with SMTP id d2e1a72fcca58-74058a56837mr21134021b3a.13.1746481176348;
        Mon, 05 May 2025 14:39:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058df12d8sm7388599b3a.78.2025.05.05.14.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 14:39:36 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH 0/5] Enable hstateen bits lazily for the KVM RISC-V Guests
Date: Mon, 05 May 2025 14:39:25 -0700
Message-Id: <20250505-kvm_lazy_enable_stateen-v1-0-3bfc4008373c@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA0wGWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDE2MD3eyy3PicxKrK+NS8xKSc1PjiksSS1NQ8XWPjZIvERMtEYwNzQyW
 g7oKi1LTMCrDJ0bG1tQD9GuCEaQAAAA==
X-Change-ID: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_143937_333077_59E89046 
X-CRM114-Status: GOOD (  12.95  )
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

This series adds support for enabling hstateen bits lazily at runtime
instead of statically at bootime. The boot time enabling happens for
all the guests if the required extensions are present in the host and/or
guest. That may not be necessary if the guest never exercise that
feature. We can enable the hstateen bits that controls the access lazily
upon first access. This providers KVM more granular control of which
feature is enabled in the guest at runtime.

Currently, the following hstateen bits are supported to control the access
from VS mode.

1. BIT(58): IMSIC     : STOPEI and IMSIC guest interrupt file
2. BIT(59): AIA       : SIPH/SIEH/STOPI
3. BIT(60): AIA_ISEL  : Indirect csr access via siselect/sireg
4. BIT(62): HSENVCFG  : SENVCFG access
5. BIT(63): SSTATEEN0 : SSTATEEN0 access

KVM already support trap/enabling of BIT(58) and BIT(60) in order
to support sw version of the guest interrupt file. This series extends
those to enable to correpsonding hstateen bits in PATCH1. The remaining
patches adds lazy enabling support of the other bits.

I am working on a followup series to add indirect CSR extension and move the
siselect/sireg handlers out of AIA so that other features(e.g CTR) can leverage
it.

Note: This series just updates the hstateen bit in cfg so that any update
would reflect in the correct VM state during the next vcpu load.
Alternatively, we can save the hstateen state in vcpu_put to achieve this.
However, it will incur additional cost on every VM exit while the current
approach just updates the configuration once per VM life time upon first
access.

To: Anup Patel <anup@brainfault.org>
To: Atish Patra <atishp@atishpatra.org>
To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Atish Patra (5):
      RISC-V: KVM: Lazy enable hstateen IMSIC & ISEL bit
      RISC-V: KVM: Add a hstateen lazy enabler helper function
      RISC-V: KVM: Support lazy enabling of siselect and aia bits
      RISC-V: KVM: Enable envcfg and sstateen bits lazily
      RISC-V: KVM: Remove the boot time enabling of hstateen bits

 arch/riscv/include/asm/kvm_aia.h       | 14 ++++++-
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 ++
 arch/riscv/kvm/aia.c                   | 77 ++++++++++++++++++++++++++++++++++
 arch/riscv/kvm/aia_imsic.c             |  8 ++++
 arch/riscv/kvm/vcpu.c                  | 10 -----
 arch/riscv/kvm/vcpu_insn.c             | 52 +++++++++++++++++++++++
 6 files changed, 154 insertions(+), 11 deletions(-)
---
base-commit: 01f95500a162fca88cefab9ed64ceded5afabc12
change-id: 20250430-kvm_lazy_enable_stateen-33c8aa9a3071
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
