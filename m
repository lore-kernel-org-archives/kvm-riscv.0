Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8A2DC54E90
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3TfInc7lY9suLwNEU6nDNIbdQntgP8ii5YJ/MLAmmC0=; b=dJUJpQidvw4ljv
	MtsSI0LFxbzNFqt/AGBiiqgdEEJwijN8iWJm9rWnP8I7zaIxXw3mWZV1M46baRp57ncLtRjbmgD4a
	plva1pw5l3CjFoEnGbKG7R10TPj2dpOwQV4CAEGjH8MGNPgEDouOPtf0oN2dRtV3c2v0KkusRBpqn
	jejk8cK0gRsDPjpCOxlBk4I+HiMjrmSv2sgcWUtHK6m+JZn1wkyF0t47Ww1PdbWdjGvPPesAboI67
	FXNE4eLz0HQrbypzzMbGvA7uXZeZ7E/tHLXRFCUHsQIapPaFAihRXgHTZgXtG+WbQ3GLAsCInXfWS
	lAjSzyTubQtqRhaJTKxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCn-00000001wNb-2WHJ;
	Thu, 22 May 2025 19:03:49 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCj-00000001wJu-3569
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:48 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so196053a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940624; x=1748545424; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q41hxKdl7GpCXig+z3ZJK+daPo0DZNkeUAk+O8lvGEs=;
        b=mDNCDEEVWRv8VzWfon2jtA9p5YTv+xIbSQNgrfQC7O8ntiYrG0l+eEm9G9bs7KK07z
         ggsvdnZ4fDPU9h9dFIXm5kLwxZ4cezJoeuWrT8DI584oHI/819vmMDzShQzmiy56jYbQ
         pQj4Xz+YPOHiPTg58twP4d01dYy4VR2gt72HTuP/hSEW1qglu4KhIBP8DlX3ed+Z+mHP
         bZVILM6ZqNG1lLU3RVCNkXchmlIyPboPzGeU0xEPFiOPVbSSD27/Mbe7HqiyBLRFYuLO
         4DA38Sd6ZvWWSxHaOxQDaI/ShXubfFj0Pp1SX8Qzo8fKrXUqXRsUZ7CUsJbcUkP+TUxC
         30jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940624; x=1748545424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q41hxKdl7GpCXig+z3ZJK+daPo0DZNkeUAk+O8lvGEs=;
        b=JCbEeuUVNS10YA7qRJCuUV3Mq+gNgxdi2q5YBT0vcVk6rhcZoZMh06E3+8xDVe4MEf
         DlNShCXvmsdXF8PrOHG0/fykZc11KFIEOFDvKO37O4Qh7rIHwYnWhHUkUWKPM3nF1W8M
         ytKjZcRyotrY5q3vvtPBV+UUcXcsUuic6ydUu1mk/aWAwahARr+nfHv2e1WQuDa8P/Lm
         PmOCQP870YQ0khXXjYvqb5C92UKCQpPJ8jShalMg7Ahkgy3KQePNnsLH4qTs0K5y/4yH
         flLpeWMtuxN9zVXtWkPc15mENTYrncZVhs69LauWCBBSCs1alGd8E+4YSuW79UsQZSxU
         yA+A==
X-Forwarded-Encrypted: i=1; AJvYcCXkS4y59SitrKs/FPYXu3YOPkl2E1tfNFm6H31j1sNsZi6b/SdUq0BR2jZAqU22oU1xx0I4Fgk/YX4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywlgh+iDikksAKpGXSJhAcEoe92m9Ox3hah2BiLHBoqX27Xrby0
	zov8aPvEfDOvW/jDq3dJcaza9ltwLpdbpxvcIzUa6TQT20o8OFzP0Wc1CWbCfjReXTY=
X-Gm-Gg: ASbGncs1Q4Fk6jyqA615+7kOYfr2rDNKtn919EiNPtqYV96eBMvfHdy1/8PUGhNFOM6
	q8iVk2BfShFaDHFfEa/FyZpPa+5Cz0WeF6zqYJwqczNJTrYA4XCPKviT/G84Ng0bNW2VBHcJIDe
	Jbk7Wh4NDo2TAdItSrpnSvfYtepL4hAQ9J8Nq+1HfAnrn9oBMoXp4OVM25nTt0KDbnRdnFZOUO8
	3mKuy2hNskUvcUaGA4nu8KhFuRObv1imBSbnHrIkIdUvCJar4k5gU9uKM+qejs5Jg0O1ZI4CVTn
	ZsiQ1bVVGjOVajL9Jht3ny++arItZ35ywBzNBivqja8v0gQ/bjMtEExhuTOBA/e08KJ3NrXpakY
	=
X-Google-Smtp-Source: AGHT+IH0XTtZ6vXfmNFlJ8VYIVuVh9eBxn82FNJcr3b/rfTYclBEaVjmuMwZtiIxan0l+gDP3Oex1A==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6085425ad.15.1747940624480;
        Thu, 22 May 2025 12:03:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 0/9] Add SBI v3.0 PMU enhancements
Date: Thu, 22 May 2025 12:03:34 -0700
Message-Id: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAd1L2gC/2XP0U7EIBAF0F9peJYNAy1CY4z/YUzTslOXh8IKX
 aLZ7L87pTHR9fGScObeK8uYPGbWN1eWsPjsY6CgHhrmTmN4R+6PlJkUsgUBhp+Xy4AFwzr4MEd
 ujUYJDvV0VIw+nRPO/rOCr2+UTz6vMX1Vv8D2ulMA9p4qwAUf29lqC62E2bwkX2L2wR1cXNimF
 fkjdAKg+ydIEkxroJsehTJquhNue8GEHxcauu4t2YI5j3Vo3zzVchLkL7ruGcjeeVBoqGVntfz
 DP2/zpzEjp7D4tW+KPoDiyUm6fPsGhkIWh2oBAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_120346_028102_50BEDA36 
X-CRM114-Status: GOOD (  12.36  )
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

SBI v3.0 specification[1] added two new improvements to the PMU chaper.
The SBI v3.0 specification is frozen and under public review phase as
per the RISC-V International guidelines. 

1. Added an additional get_event_info function to query event availablity
in bulk instead of individual SBI calls for each event. This helps in
improving the boot time.

2. Raw event width allowed by the platform is widened to have 56 bits
with RAW event v2 as per new clarification in the priv ISA[2].

Apart from implementing these new features, this series improves the gpa
range check in KVM and updates the kvm SBI implementation to SBI v3.0.

The opensbi patches have been merged. This series can be found at [3].

[1] https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/v3.0-rc7/riscv-sbi.pdf 
[2] https://github.com/riscv/riscv-isa-manual/issues/1578
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v3

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v3:
- Rebased on top of v6.15-rc7 
- Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com

Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (9):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      KVM: Add a helper function to validate vcpu gpa range
      RISC-V: KVM: Use the new gpa range validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  75 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 190 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   2 +
 virt/kvm/kvm_main.c                   |  21 ++++
 10 files changed, 258 insertions(+), 59 deletions(-)
---
base-commit: e32a80927434907f973f38a88cd19d7e51991d24
change-id: 20241018-pmu_event_info-986e21ce6bd3
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
