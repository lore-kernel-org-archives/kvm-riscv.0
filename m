Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700B3CA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 08:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJysyysaNxB/8Qnyp8fCX3IKhOK5wlRPCnR/7p6DvX0=; b=DTFnFj8b56gvar
	MeC6qn9WcQOJ51p29ejtQlddwAwVtTPMdCLbm+P8AYWxtV3k9LHIg4t6pwkonnVH2bbno76aA5rwd
	AhpO2YHm7tyyP/8Rn8baAB3S8jrrnImOfkQTPgL0ZUV4rVjE/5bvaXxU/7pvNlQVdbBLCZS5EyskW
	/XKgNukjjZ5ixGTnkrTNubcZv+78eFSY2b1iji9kRixRK3nb71RgXQmWEEfehm+OC6E/osrlGeRcX
	/74r5/9E3PFTJQ+EibrbFGVUKE5b5coYHXahnVZd5J9V2/pqlFGkOtO8KSDQKTgGtaX827OFK06CY
	Zql5BA4PqbRx2B/2wK2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvtLV-00000005QT8-0eDg;
	Tue, 09 Sep 2025 08:04:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsOB-000000051sx-2kmh
	for kvm-riscv@bombadil.infradead.org;
	Tue, 09 Sep 2025 07:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=; b=jKnS9CoDlyYM/1qECbwe1EZbCZ
	pw8DdTDV71YZ4L5k6/ovacSiyXsWCLYHPnOP6dF9IJIHpufT7HLdi0B3yJTYB1mU8aPWq9xcxhkPJ
	xH5wh6vE2xDicEhZBVv0PPIg2mRkbBACw9X6gPDFmfkP4PgJnHrMwELMQyNOxcEI1V+A28jEqtn36
	TuriK/djZVQVmO9q81j5v0l+JlHxKKWmrcPVlPMkCqrvC45YnM8iaczR1peNdOhbfbQi9SlUfSBxZ
	eLDBGqkNqh9dF5OWevA5kyIyGMDuY3Kfr4/RTTa/7cCApOFh3BeHzU04vgrJoqR7QLJgiKLxIqs92
	R9HkafcA==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO3-00000005ECO-1H8C
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:37 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-772488c78bcso5197712b3a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401406; x=1758006206; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=JPb2Z8jEhADAR4iPnuude3uNpCFL/sOoXb1i4AmQ637VqM015MoFmxN5ebhoHnto4h
         HKOTa9bJMIJXXk5bhgCuOBsIDynWma16guW6cIBhYW8OHUIFEFgxSizfvdb/fPSO6Oww
         4lb1+3ZvzTVsCsR3d6Xmm11tQ1rL96zCHBoIii9IAfqLrhJysTwKfQHQR5CxacGvnGpJ
         4z9tAZIhQwhfSubWWKA60jAWHhUkdq3J/ePHqsQI/FDbFzwiG2p6Kq0+L99hRQMPkp+W
         BdMIs3ENdICEu5O9Z3xxzHIyWbaoetth6zx6gn76gUqipD5hcfUTV4dcbOwOOLaMsc7a
         ibFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401406; x=1758006206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QppemwXg72umVaHol/lc8lTgDOnrssZANvnDyByXBzA=;
        b=ClRzpGwdvV+6nYLnpHEZl3UGxfyJ175jvAIW5OILH/qB0qP3DY0WCOfE/zKte4FFN2
         6kGDHadQwKvXHeBPVlGTRRrKNVJmtLURPXXIFuDLy52wEN/TQHWqYl6FtJ+H8u/4NWK2
         3iWDFRlp2fp8WDvRIp1k9z5sfunsAW09aSaUXeUGbcrTC6YwM9H3Sl+71TxeiTAiWgxj
         pvDRrKb09c9+6levHRVVTAhbO0l4kylL8FbTUiPivZE050Q0aU5LYVvyjIIv+kGIg6Yl
         tuNDIhdPvDi9GQIkNfYA/NCJ333XNHj0aY3d7ldE5YYDCkwsEUxEAUmhF/sm7id5DgnA
         JcFw==
X-Forwarded-Encrypted: i=1; AJvYcCXkf4J7Ah02dBa6ZRlLF25e/ig8+kwz3VoTEVj3+wqpzGnxwP94dcDOtQoc2zf2cH2M3hpwWLBS5iU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwQ9Nhp6JJPH1Fe5VZiKVoKq+0S0OkvQ/4cEpvBwt4/XFpETyi6
	MKZJc6NmAC7L4Trv8WMF4gh32m3/XXHjeUGUT9XjyIIN5CcXLCcSCL9btUB3sg4tW9s=
X-Gm-Gg: ASbGncsUmyn9dYAIXcPQMN6x5jfXarFruGYuEhVTRhYuIha5QOMiyq+nZUKT02qpb/y
	ah1EnSM3YZ3bHAwwQRpXLVmwXydXD4ysMQUFESG65Ox38DyKCMBNnsfnbTePMsJD8KFh52Qm+9n
	QjJvkM0jcboIM3wgk2Jp44rjBZbj3PjikTA1SEEoqGLK7smcOt7dhb8A29/i3SyRxWwXL8N32pw
	kdZQw15uOXljfM2Y/WUTO+/m6JZcOrS4Tb6qvChUxnbGJ5NO9GRwWCvzD6DFl2VJq4fcGQ9KXZS
	QN1QATjX7vW34f9wBN+7LGB3TXKCu0r/A3217rtACXXgZiUqd/6RgFg7Wo22fXygnPCMY53MBDe
	ljcXPkIz6o6sIYtS8uRwHUDSKzF6j72tAWkg=
X-Google-Smtp-Source: AGHT+IGTI0+CANiAOY9dQTvuxmq7UvW41+dk3xf0GTORfOZzG86GOBRQUviZ8wH9nFVkT6u1ya+N/Q==
X-Received: by 2002:a05:6a00:928c:b0:772:4b05:789e with SMTP id d2e1a72fcca58-7742ddadae6mr13433332b3a.2.1757401405716;
        Tue, 09 Sep 2025 00:03:25 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:25 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:20 -0700
Subject: [PATCH v6 1/8] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-1-d8f80cacb884@rivosinc.com>
References: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
In-Reply-To: <20250909-pmu_event_info-v6-0-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_080332_985445_C1D6144C 
X-CRM114-Status: UNSURE (   9.43  )
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
