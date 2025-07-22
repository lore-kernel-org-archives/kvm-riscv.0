Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7285C83F25
	for <kvm-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 03:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IDERt1TLZKXTlxJ5msi6giY5ejAOsjJgdco7CEavwUU=; b=ZjlyCefQBTxlTF
	8BcPD0/cwNH7LVW1eLjQE682nhe3+XMi+HFZ0L6FSeugJMDJAWSsI7/UfgShU/dCWkvnEsFdkHBUo
	cj9OwFUFlXs83YVIEplPscSZnSv2V6ktWBvdvnA6zrQSmZ7Wu1d23WldFEEY5wB+EWNUkaFwo/4Vn
	JwDEL9xolZteubmvLJmjs+nE0L4dpi9QDGUIaGWxNEMAYllkCg0TtQfiZsTwYcdh6uj2mcyTST4Px
	Kqn7zSlkEk9qTAaQR698TwVMRkCVM3GNB8RDcsBas+rt7nl1EE9ktfFCV8uo6Oav0WPSNWjyKqnon
	2lqpZ043sNH11lyufwxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3W0-000000019jv-0qEB;
	Tue, 22 Jul 2025 03:18:04 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue3TS-00000001936-1ZtC
	for kvm-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 03:15:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-b34c068faf8so5155360a12.2
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1753154125; x=1753758925; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N3ro4Yyao5uXofBVuxsMuyd3IafrNj++K0PwR4Tt2N0=;
        b=yQHqSx/w1TjFbWVaoQnJt6TvC4Ika00CttVb6Pn3faV8qX1H2nGIhEzeFwV0KeVP1L
         RDYUiksyyStOn8ODQoY5zZoNwfL5Fauk4XxfUFk4IpB0EaW0JXZd9uYl8XoujFtZIvGx
         3DXk8785t+Xcr9RTtvKCQobRzx58lzMpkgBui1OX1Bp4WOy5NDW+W6S8LTvg7Rp6fHNo
         YUZGhSw0I/k+2lEFRh8CAI9j95b347rSVGF+3jqv03/uN7rvZh6iYcNafqRaiRZZTb9N
         Tjkfh8b44hE9dnXt5P6ze0ExKS3ac5cr8YuBs3xJS2q5jVaEQi8HnfkkcHCyEPd0cLk3
         K1rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753154125; x=1753758925;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N3ro4Yyao5uXofBVuxsMuyd3IafrNj++K0PwR4Tt2N0=;
        b=NknzjhDZLt0qO4Yeaakhuoe65tcfmfOHd5232yfQPlQg7s7KJhpOZ91qwJ0fRb8qK/
         wPe3WDIq9QyOlvjrFLV66BsAKWcsK0xGtJ6+iEnKUSV5t3+i9YUAQGonKx6uRliSmnEz
         RC5iZdBj0rzbro3ddIHRymVouiwLio/0Eve21RyrUssoTWAMArmBdP2bHurZxFKI3yj/
         dPm2GP4mqfZtOMwuYpEdt/NEDhYAD94agY9//hpGI3UUZwaTdmssRdzP+Xnmjf4haT8c
         UNegplll8Jsp2t/z8wAscg//vH7V5hvT1pDa65/OdL1/NqD+NRmq2O7ksmGZydXRKrqi
         LuXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfEdO+i5EhPZdzrCSBPf3fv8eqwyOUno7P2La0nEG9GmReqJnRVexB+crUvgjaMMGJcH45a9kvYP0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5mzjPUBGWViB1G62arA/+qJsEstnDIhW5Xce6TS6LRAKVV9Hd
	um4bEOmT2Up6Bdd/igFLr9qU9OtNIXXrYJkYVd7hC36qLcRA6d5wLYT8cBhD0BqQKk2Y1mlT2er
	BEi/2
X-Gm-Gg: ASbGncsVEqFCjLlhIk6K4jfKuXgDybv25qxEwecnZag9AMY2jjpwORuec82ugmNtrKJ
	INzkKGgesk+UiNRC2plPKuaHRByTPIKpWt84L2NzjxCrXKXA8d3+WdxpUenuval8ikQ8d7s3s49
	jJs1ZAd2ysEshAI7FbhE8hhv6vNJuu2TXXzant2C8hvUmswM9kOT7kAJ971gsgvU0dCwXeyd+il
	XeB/jjMtMcDgokXIptYOCPfSH2ldVBpbGgZ8sMNH8GhzHZR0PZjtbLwRq8UUNwO73/SdC5ggQNP
	m5XzQV0WyhMGeaLf/52MeyTnurbGS+g8grCihcsoYgWdohGxAXeSWLHJj3JfFCzToAyz5snHN5M
	00IqARdQe/4VmU++hBNJ2giaL6C7LvCs8iEU=
X-Google-Smtp-Source: AGHT+IE5Vc7OGRx4QhLjcitwZKIWZGvajhiltbo4bWSxvPQDoCrplva3mLaEOWP7EA2twj6pT6oskw==
X-Received: by 2002:a05:6a21:6b02:b0:21f:5598:4c2c with SMTP id adf61e73a8af0-2390db673cfmr29574196637.13.1753154125053;
        Mon, 21 Jul 2025 20:15:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b3f2feac065sm6027612a12.33.2025.07.21.20.15.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 20:15:24 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 0/9] Add SBI v3.0 PMU enhancements
Date: Mon, 21 Jul 2025 20:15:16 -0700
Message-Id: <20250721-pmu_event_info-v4-0-ac76758a4269@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEQCf2gC/23Q3U7EIBAF4FdpuJZNB/oDjTG+hzFNoYPLRekKX
 aLZ7Ls7bWPUXS8PCR+cc2EJo8fEuuLCImaf/BwoVA8Fs8chvCH3I2UmSlFBCYqfpnOPGcPS++B
 mrlWDAiw2ZpSMLp0iOv+xgS+vlI8+LXP83PwM6+lOAehbKgMv+VA53WioBDj1HH2ekw/2YOeJr
 VoW30JdAtR3giBBVQpq05ZSSfOPIH+EWog7QZLgWmOG1o3aOrwRrnvFiO9nmmrZe7IJUxq2qbr
 icasn4De9LdLT7/YPgkRFPWvdiD/80zqgGRJyCpNfuiI3B5A8WkEvX78A6qJO7qwBAAA=
X-Change-ID: 20241018-pmu_event_info-986e21ce6bd3
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_201526_622481_A40C2DAD 
X-CRM114-Status: GOOD (  12.88  )
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
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
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
 arch/riscv/kvm/vcpu_pmu.c             |  75 ++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   2 +
 include/linux/perf/riscv_pmu.h        |   1 +
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
