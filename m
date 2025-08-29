Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F224CA0FF0
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJysyysaNxB/8Qnyp8fCX3IKhOK5wlRPCnR/7p6DvX0=; b=WOD/Mi+GdOM1tp
	7L4YQvgjCNNVGxcbQXbSzGWK9SGJOOIElgnc+uHNHv8si/RnrtirEDaEjMMAt5vc3A0pVO/cn2hPj
	AFgBXakqv/ZOsHhtWRlOXZ3voYfdCohK2XgAigI5L804yEP7LOeZWoRy4JezOQqS3hy4X5M43KNKL
	WepwbKbU20L0mvjqjXV/b1INPJXSyAUZ0kE/pxQlCrFE+sP9YQg1LAAmD65fC4AXKUxMLNKYmHXm3
	TFvitgNdpAvfZKlyT58gd9tLTW0nYkRMTi1eQCtwfVVfg88fNfgWrtSipdKbOSPZIPs3Qj0IHt3MW
	skmEwjxqn69sLvRg5rvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ad-00000006fdo-06MV;
	Fri, 29 Aug 2025 18:49:55 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hu-00000006406-125V
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:12 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7721b8214d4so1879340b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478469; x=1757083269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=YuvlSVGvaAm6liLZ9WmL77dXRFZfVzqLIoKAnDrSL+kvb3QZhGhSoUJlhssEPoBSmr
         WB83hcVr5LxGnff8YrqHtnb1rXz33f1yId1XtWMHH+tvYdcT5iOAC0pz7WaYTsYVTU9d
         27ugoCTl/WRWMZtSRgqW/6VDXZ8ma1j0Q1rlbOM5WqMOcaSze41Bgpw5JEwYKpmwsg72
         WW0ri/O+8yrdS8Ofj5mJAPPCjnv4iiujsQq8XNATZAT85NLMUrngy6ExedPYP/BnFKwn
         8Af/mv/9fYa2xLrHpbbUJ/O6j6xTPA1xUzNabEFtg9bpM5xngpSrseT9EZD10HNZpSom
         XVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478469; x=1757083269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=mtmcpm219BUdNlX5XAD6UV+OuAC6vJT9LkTfR39nQ36iAMggXoVFa6WMQA7bvy7Qtz
         Yc12ZadIUtDeqgawsPYkCh3MM/nDRanaZBs6jPRbAaosbf7Fnalb9B9YD2D6Yk6NSVHD
         h8yK15+C8d98FjtJcXBu5iGk1ZfkdHTqkE1siQ5z5bwMMQqE/3reXP3jaephsCWvXzZP
         wBs27f6uMclaVGAhVPZ7vJFZfm8gVFJWbS7Xots/cHGgDgYQo+7xMyT0qrACNUwXTR8M
         NIlIT/qILcmyJgG7aYw3v4gnZp66clEJqOV0e7ZL0151nfrZrNYJO5iwC/fGWejOUCc/
         GCFw==
X-Forwarded-Encrypted: i=1; AJvYcCUDiTyQ67vwcmzhXdpZfUKlp0rq2KaqoqEc1HJLHvE421VZxQhg0KrMgEaQyK6TtL9qf0G1J8vIZYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzaxSQVq9jHvPHGBDYfYHTZhbDTNe+Sz/1yiyw0Yfm5ab5J77/W
	6FOhGDsdjgNrWrd9iO9wHYsgebOZE4h6xYzW5OGqEExz1DZxiVLqnoKYF7cy9rFzvjc=
X-Gm-Gg: ASbGncuXuIlYpkNVwhG3uTp/M00lWD7RqHZCRP+mIpQBJBRBa/iQAPm9LikYx+lsvzM
	LK0OHmQ5BvuTiUFhJIsSA9xGMXTK7qK3pOn3/4r17bOgu6ouBl6z3XaTytTjvEU5XdcvU45b1TW
	6nLR4cwUHt7hVnl/hyg7lXeAGhJFaXa0G1XFFVQwKSWS2/0ya1S02fLKjgXAXjjf0T3pP0z1m51
	wxE/mCulf1yVXePwVuP3JXwuPGNUFrPytZyMG2+M45GwXber6hVSjqonn9dz9mlg7caTQtYIdgA
	peJD3PMG9+YHsHA7X+e8Ia3Hqkcg5m6y3a8JLSiwJO65cCJBaRv/B49f8mISqrynRZbl5TrnebU
	wh8L1TkH25dYh8FwXRGdHd1essDKgM1AJAbg=
X-Google-Smtp-Source: AGHT+IEyDQaVO7hw6M+jmWcVL/199fQHjMH7i3C/32jO0Trqcu+fqIoi/CB4Tct+03RcyOTn/ZKedg==
X-Received: by 2002:a05:6a00:2306:b0:76b:e868:eedd with SMTP id d2e1a72fcca58-7702fc059c7mr38073588b3a.24.1756478469428;
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:02 -0700
Subject: [PATCH v5 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-1-9dca26139a33@rivosinc.com>
References: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
In-Reply-To: <20250829-pmu_event_info-v5-0-9dca26139a33@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-50721
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_074110_290633_BF31ED22 
X-CRM114-Status: UNSURE (   9.08  )
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

There are new PMU related features introduced in SBI v3.0.
1. Raw Event v2 which allows mhpmeventX value to be 56 bit wide.
2. Get Event info function to do a bulk query at one shot.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 698de8ddf895..cfd6946fca42 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -63,6 +63,7 @@ PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:62-63");
 
 static bool sbi_v2_available;
+static bool sbi_v3_available;
 static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
 #define sbi_pmu_snapshot_available() \
 	static_branch_unlikely(&sbi_pmu_snapshot_available)
@@ -1452,6 +1453,9 @@ static int __init pmu_sbi_devinit(void)
 	if (sbi_spec_version >= sbi_mk_version(2, 0))
 		sbi_v2_available = true;
 
+	if (sbi_spec_version >= sbi_mk_version(3, 0))
+		sbi_v3_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
