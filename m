Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E30CA0FFE
	for <kvm-riscv@archiver.kernel.org>; Sat, 30 Aug 2025 00:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uF25/I9hyX0gbf6BmCimCuchdUE+9by73GyYorLkikY=; b=0HYsFIcWqToZHa
	o+QBZt6gZOQO3alZYK0RY2fceUFJ7MCr2EiK6gLyWgGQno5PlQk6EmKAezstFk+cGTYnPO0QYuiIL
	67JgchyBdh1v8uhuca4Uu81dkzskNoqhpM6HQJvWzk3x7kdKG0xEZib2gYwmBNfxP9kj0bvTaDdQ5
	oQC6cGdgfm/zSJ60ZZ3MN0sQKee7tZhsKNsivOMTqyqHy+A+hYViE2GcVpHV4QCwtsZ8r6siTOblz
	n1SaPOcE5R7BSQHZLQzx0FRQsVDAwpCTQXVC3SK4BtixXzcEWt2KOLcOnpdKljB5jnlT/Wgag5+EP
	O6q3f7jb9vlcThM9o8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us9iF-000000076RD-3bGV;
	Sat, 30 Aug 2025 00:44:59 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Ht-000000063zM-1WPG
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:11 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-771fa65b0e1so1171319b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478468; x=1757083268; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oF5TQ5tmAgJotT6TBzfmeh55EB+gENZQcbLkBFQiOtM=;
        b=F+8lBN4F3yVERDnsTcQsqUBiC+lEoCA8PkW/4EhrX2oZWNjTf2UdGJ4ZkjbwABsnVl
         p43geBLnKK3pOoz/VqhFc5kDjtdoP6izL9kWERkTnNoBYlxz9e36APCx2tW38w9CH1nW
         7V830J5/4cqGXWP1Z4AGMM0VwaV+6Oq6m4tEv+cm2RX6xZJYEHDg/k/2k4BzhBl7RylS
         PneXMRW0X7N7XWLgdOIOF84O34Dj0o966wuZt+KgZkYMQm3bsMPJ8S1seiRYZEpz06yG
         c8UPp338HOxVIAmJMnjU8casmR8KsJhunf7xv1pjHSxWi8HQQESZE+W95NOX5JOaLmrT
         6EMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478468; x=1757083268;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oF5TQ5tmAgJotT6TBzfmeh55EB+gENZQcbLkBFQiOtM=;
        b=PInBBSyRc0Dqr+CTFk97+YxU3Hxt38SveJgQQrrVlmZzR3NrQzXfFChokDPMZNhNzJ
         B28YD+/btqvGjojJpDdVznGIgbEGZk5+cAKyj5tB5sDcOhoWS8++Ke2x2Yd9viKCk9r+
         kW2ARgHxyi1VqsfiVTtpDB+Had54sIV80CD6oQgMEBTYBw2I2n+Y0svzOFV9TWRIpLgg
         b3Q/I63nzDwKU5mUuXVbyUHLcy9YJtqiMN9yrYqmDuCpwArK76KKQv2eTdGBnvZHZeRZ
         JEB0WUW4xswmEcmuVcS1xh7XGXJfMI7ROsQCJIJydB6pwgNqY1qKUW7gbzJO4Yl39jAl
         3I+A==
X-Forwarded-Encrypted: i=1; AJvYcCWFoENcc5HtdbNgBZn5aGq+IgdL7snuPN6CCXZi9CyqPF3XWrsKJmLON9SJBVa2qtsl3kf6eJZWRQE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaWcT3L4Lq58rFKy7QZRahxmEUTwLPqpziwArH2OCr70NBL927
	azDLFp+T0zPWfZt+H6M06ziQ07oW98qUA7q+btB195+TwvTl8ebTobHW4oHcpF2YQ5g=
X-Gm-Gg: ASbGnctGHzvmFmuj9AoWYbyfTGUGkjiQeVYPWoe9DZ1sWCwejEckimBEpicADTvhIa8
	U2wuV577rBsEIB9iDb/nyK0cFYyWuLpYJ7NsaGX3VsjfTjGA7s1mhBgb+h0xK92DawywZbeAvJp
	37iNEHd/jvE8gS3cfHGGGa+Cq2SuANyH1W5GiLELicyZQUYp6Ok++FA9aC42Vhjte16kx90qN+/
	VASfXs7mwyULwCtgDttLyFOSMIo7euCNMhDjw2q/RyIPDkLxfSYDBnXHetyIx9UPge9w5Y4+psA
	ivvoP2cvo6KGYbekJ86vS4/6uUzGu0u53UtKxbhO19ewzbyKRrWc67Xzul7Sh3Z7k1O+L7aChzU
	p7rWd9h2xLlOiikJTjNIM2AH7r8wdh8zU8V8=
X-Google-Smtp-Source: AGHT+IGfKLBhrAwQIfIo51JxqP/Uh80E+uh15u67yO328vBecr+7D5ezoUnfonrgJ2TgVx7Oab+e/A==
X-Received: by 2002:a05:6a20:12d1:b0:243:98b1:395c with SMTP id adf61e73a8af0-24398b13d1cmr16044556637.31.1756478468352;
        Fri, 29 Aug 2025 07:41:08 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 0/9] Add SBI v3.0 PMU enhancements
Date: Fri, 29 Aug 2025 07:41:01 -0700
Message-Id: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAP27sWgC/23RTW7DIBAF4KtYrEvkGX4MUVX1HlUV2WRoWNhOw
 UGtoty92FaVNsnyIfHBvDmzRDFQYtvqzCLlkMI4lKCeKuYO7fBBPOxLZlijhBoMP/anHWUapl0
 Y/Mit0YTgSHd7wcqlYyQfvhbw7b3kQ0jTGL8XP8N8ulIA9pbKwGveSm+1BYngzWsMeUxhcBs39
 mzWMv4KqgZQdwIWwUgDqmtqYUT3QBBXQSHeCaIIvum6tvF76zw9EORVaBDuBDlP4RrdKNNK1PZ
 GuKwlRfo8lbKntSnWU0rtUva2el4KQvj7uaXTXZlvHREEFdwrq/Ef/zKvoGsT8RL6MG2rrDcge
 HRYXr78APgRHZ3uAQAA
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
X-CRM114-CacheID: sfid-20250829_074109_477031_588E92AE 
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
[3] https://github.com/atishp04/linux/tree/b4/pmu_event_info_v4

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
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
Atish Patra (9):
      drivers/perf: riscv: Add SBI v3.0 flag
      drivers/perf: riscv: Add raw event v2 support
      RISC-V: KVM: Add support for Raw event v2
      drivers/perf: riscv: Implement PMU event info function
      drivers/perf: riscv: Export PMU event info function
      KVM: Add a helper function to check if a gpa is in writable memselot
      RISC-V: KVM: Use the new gpa validate helper function
      RISC-V: KVM: Implement get event info function
      RISC-V: KVM: Upgrade the supported SBI version to 3.0

 arch/riscv/include/asm/kvm_vcpu_pmu.h |   3 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h |   2 +-
 arch/riscv/include/asm/sbi.h          |  13 +++
 arch/riscv/kvm/vcpu_pmu.c             |  77 +++++++++++++-
 arch/riscv/kvm/vcpu_sbi_pmu.c         |   3 +
 arch/riscv/kvm/vcpu_sbi_sta.c         |   6 +-
 drivers/perf/riscv_pmu_sbi.c          | 191 +++++++++++++++++++++++++---------
 include/linux/kvm_host.h              |   8 ++
 include/linux/perf/riscv_pmu.h        |   1 +
 9 files changed, 245 insertions(+), 59 deletions(-)
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
