Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC29CA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=E3h3TJxZLxGZlgOkuU5VlpmW+cTCOGjFPVZ4cTvwQAo=; b=HcS4+GQBD5PWUt
	Uu21L4q2QiVyrRlqRmFDPXoAo63QCMQLyRM9/ygmAOXNAms1Irn09/yl6bs9jfJpU9L3skrC+VC4E
	12Ktcm4OL/ZPbZZK41KvMPXP03GEC5IoGR4zjMO7KkU7ACI+LXCfK/jhsGSk2R74q0Xby2AulpzXM
	VdH060pm6nPXSYQFcGt/HKj70x6O2IM0dBvjNrC8T9n57p6osydJsdVXwudK0ndxTkYmhsT0WhQzz
	3kH9dXqcd5y0kxNfyRZJkl2qJ6jOYQzxz996Y/i4Y6BVZ/yjOBtysZqX04GBGOWhyEINsnCJ4p22n
	uAhgvLH7SvVll+eUNexA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt4Y-00000005K7r-00cW;
	Tue, 09 Sep 2025 07:47:26 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsNx-000000051fZ-3H1G
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:27 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-77460a64848so670970b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401405; x=1758006205; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNthXv7xmnVgNBJdwKS6Eu1LchZyxPFP+JzXVAI2vr4=;
        b=WvG8pMFMSj8QcM30H1bsSA7/f/zTtnMdDQjUapdr6wfCwgeYnv4qwJbPsbY0i1q5j1
         4TMxDUeycDtUr0aV/HS+UNiWLpcO40zaCjgW5bgwFinhPINHghcT8/m+HJk5wyy17MeZ
         zcOl7OAwp2gc0LmIUEFoiuTfIIZ/wuVhQECWMQ3hGWJuQKVtv/x5oNKE1++uFoExBpd4
         nCZVqEAWUPp+6pNpXQW80Qf84n59j4xUf3ukeI1dR4MMz/10FXWhv6D1dCfzsXPyDrHn
         lsRQx31udKdeMlh0wgnSaxZ16WJ2AuzVrKAhPJUz9LGHv0Kq75tuR/7mjDVsT3ZQIe+o
         A21A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401405; x=1758006205;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RNthXv7xmnVgNBJdwKS6Eu1LchZyxPFP+JzXVAI2vr4=;
        b=qkWqXOKjITsrz2QEoGd9WD6HAJMh5k78dq4IXk+Aq1VpRC7c1LCKD5VEb5pNjR564E
         M5S5sh+5asp64NwGy6tIXUZL6w2nRnuuR/TG0Ypipt6cIHnh5LCJRj9C6+DxtrAjtrVa
         tC/c8ak5ehFKQ0396PfnCiXlS+7Y6R9QuawEBsraCIi0fRdH9v1oSNHUU8q3gu+hjTg+
         9e0MZLiE3ppMvKNSE44a+V15ti1Uc6zunH33eVUUhWAn64Pl34OpBC3ZDYIo8/DD5aRH
         Ib6GLzIoGWBAfr26maNc7hdWuzBRJ2QT9ueRxWFz28HzijHODJxO2fTjy8IpAPWtvD1F
         0HVA==
X-Forwarded-Encrypted: i=1; AJvYcCUXtBKg11he/QuA8Vm9usWQWXkmFX1kIR5fptcauEMH/qzjj3XipH0VNzw58C7zu02MmxGU+e4sdMg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXFyq1MYWJ7RdC0er2edRs+rXpo8UQarj1PWpu550HZ+QlUD4X
	cXSwK/UCrOj4km+BPgWDMgy5icfQ3Xzz6SowHpcFNMXDqwUehmemwBH3AHwp2VlfgCQ=
X-Gm-Gg: ASbGncsbpalCTzUxTmFSdTO+plNEpuiMrbTFI4Dl6LhB/GEprBR/qPF7PIfer5adBp5
	rGA5As3ahu50+Ct18Nq9RHQcH95fKy0CNErHRssEiPmxpv7FDFDOHo44r6P7oI1dtGlZpo1H3WT
	5Am2hXt45VYmyu1qilc/+C+CIWvtGT0heXx3OvaoFW/jZ1fZSxTp3xlJoNm0EnZd4LzcYK8SHur
	BEHqRpS6ZrUULe9yys/7hFwxxkIp5iwOf5p+uiLwEupoodCGXGLQBLHlr/qG/um6NKcEeelpkoi
	0E0ZepkloPAnhSaLUNirXG1manSB58s9AAzqbiKSpAwWpUxGA3Zw9RPa4F3+1VH8BMzIbRom947
	CLDZRn+VAhB+SaU6VO3v4lQE/xq7qtGNcJXg=
X-Google-Smtp-Source: AGHT+IFVlHtNE2LMGS7gSQLQT0W4LugB0ERiut2YB2J1SVxQq4kRk0S88rF/oo0Map16D7hoJpjjYQ==
X-Received: by 2002:a05:6a00:c94:b0:772:332c:7976 with SMTP id d2e1a72fcca58-7742db6308dmr11948119b3a.0.1757401404738;
        Tue, 09 Sep 2025 00:03:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 0/8] Add SBI v3.0 PMU enhancements
Date: Tue, 09 Sep 2025 00:03:19 -0700
Message-Id: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIADfRv2gC/23R32rDIBQG8FcJXs+Sc/wTLWPsPcYoxujqRZJOU
 9koffeZhNGt6eUR/On5vgtJLgaXyL66kOhySGEcyiCfKmKPZvhwNHRlJlgjhxoUPfXng8tumA5
 h8CPVSjoE62TbMVIunaLz4WsB397LfAxpGuP34meYT1cKQN9TGWhNDfdaauAIXr3GkMcUBruzY
 09mLeOvIGoAsRGwCIorEG1TM8XaBwK7CQJxI7Ai+KZtTeM7bb17IPCb0CBsBD5vYRvZCGU4Sv1
 AEDdB4TYHUQTdWYMSmDaM3QnXNeboPs+lrmnNmvQuJbPUta+el4gR/q63tHIoCa0hAXPle15oi
 f/4l7nE1iRHy9CHaV9luQNGo8Xy8vUHDuHwgjACAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>, 
 Sean Christopherson <seanjc@google.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_000325_829452_96FF5256 
X-CRM114-Status: GOOD (  13.73  )
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
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v6

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v6:
- Dropped the helper function to check writable slot 
- Updated PATCH 7 to return invalid address error if vcpu_write_guest fails
- Link to v5: https://lore.kernel.org/r/20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com

Changes in v5:
- Rebased on top of v6.17-rc3
- Updated PATCH 6 as per feedback to improve the generic helper function
- Adapted PATCH 7 & 8 as per PATCH 6.
- Link to v4: https://lore.kernel.org/r/20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com

Changes in v4:
- Rebased on top of v6.16-rc7 
- Fixed a potential compilation issue in PATCH5.
- Minor typos fixed PATCH2 and PATCH3.
- Fixed variable ordering in PATCH6 
- Link to v3: https://lore.kernel.org/r/20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com

Changes in v3:
- Rebased on top of v6.15-rc7 
- Link to v2: https://lore.kernel.org/r/20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com

Changes in v2:
- Dropped PATCH 2 to be taken during rcX.
- Improved gpa range check validation by introducing a helper function
  and checking the entire range.
- Link to v1: https://lore.kernel.org/r/20241119-pmu_event_info-v1-0-a4f9691421f8@rivosinc.com

---
Atish Patra (8):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      RISC-V: KVM: No need of explicit writable slot check
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  74 +++++++++++--
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   9 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/perf/riscv_pmu.h        |   1 +
 8 files changed, 229 insertions(+), 67 deletions(-)
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
