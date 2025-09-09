Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B179FCA0FED
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 07:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQe+CEIzwE4zpWrgGqC/RVtR6IdNaHYJYhx924DC9P4=; b=t8TYWvdkByFba+
	xQymX7wQu+zksd713TgowZ0RGIFIXFAfYsbx3Rd0DbAOWFHEnluA7psbcD9POmxR59wZRtZuSLDYL
	KKYkdzShyBSs3lo/RucmNCHo+73x3eu1SmhQpb7zOcnSQQNPcLqtaqwHwCwvsKwKtlq9mMXnV3YGn
	4iQb8gUB/qszg/Dmdi5IimU0pfI04zfmJOBywvP29rGzpKTWYqot2YXfV6ooXQ3CtRVZUhhbTeaVS
	NEm+ja9KGhQO183xPpprvc615Jp2xPs0Nrix+am8MRrKEfLtX0okpWOuCUmUA/ZEtoJs+VGotUoS9
	NpLz5lYwQKyfEDriKbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvt7H-00000005Kyp-1xOE;
	Tue, 09 Sep 2025 07:50:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsO0-000000051iM-152C
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Sep 2025 07:03:29 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7724df82cabso5992416b3a.2
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Sep 2025 00:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1757401407; x=1758006207; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=RaH982WwrOSE+5OQ2eCOL3T1GxYBNY4B5jSnD9SjBQ5gw70A2EfqvK5q+1mjRnUGSv
         Jwukp2HXvyN0QPXfxGYYn+tz1Fynu7a3jw6LDHRmplu7sVL4M7e+RSYmsJzYbjDklUhl
         PsNQwRGh7uv97ThD3sUfsSAsAfOgxEvg3USFaWIdlBNxdF9A3E2pO1GHLbEI+zPJTzv7
         +AzhsqDLuaSRW3RAe0ENQccaeWzO9T5IpLzGmhlPgECjRKM1t7aHJgYiSQ4gASXQyb9X
         5sKSXSl08W6HOdBQ6x0YHuLdKwbhdPzSEOcJEX5NfiA0OyNlwqkWViu4lWQiRC2a/qrc
         ZI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757401407; x=1758006207;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=L5+KsiLwkCNNBM/2e+ox9fUAD0TEiWh5zTzxxpKzAg+yhMC4L1X4vtcw4fhEnQfhHG
         opLRe3QRMwc8Lvs/+o00AwsXQTwT3Qb5pHk5sxeXZnhGSuyk070kOd3R3jWdFHAwVvzm
         8KX06kl3hCkiVOglZTwP//gs+JF4iyutq1lKK3g+6IVjHFj8q/D4Q51IOBll51uxWURI
         lhFk8nhTgi+OZPcTIBtA88lP7wUxYiJ4UtHT1R1eGaUkdSBHN82Ye6FB3qzFBKX6NMYQ
         IaOjpBJE6J8QEQ9CskDMkbpyPIXY77yDghled2U11AOQDj1CoeKdl0uQJrn4t0eNe/8F
         2vCw==
X-Forwarded-Encrypted: i=1; AJvYcCVDTSfbzih5b9IVpc03Sw0btLVRXvkwcdcmJ2odgaJkMCziNeUsUY48zSZhQS0XKjb+E5gfpp8z8bk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwEj0TLEneCO/JPmUWTliRuIV5utZW2/5LqMMhLgQy39Vzjdw7X
	Xol6JJarFDA4s9hnUHomSFs0x+dDp9VrEUYuLQVOf5MAgGnFaslXt8UdVUK8p/511xY=
X-Gm-Gg: ASbGncv/D1BWjpVlR2bdvRzGvONoF0lIzdv5nC/r7i4c22zN1gfU/j2YwPLvMRS3uUQ
	D5iAMq1lFJm15NWt7oBVsdY6P5a8hOWcvGBWtjQBsmGfDwveCAkXaXajkCAYyzeF9bIadkKQsTd
	qd6674VzJok1k61aZJ9zgw3UV2e4iPytXLM+k5OjcQX1A0R2XhbFw3e2Y8E7q40aNaglOvDetp6
	eJve1pzZIIJ+kxk0dD3Bo2+cNhbSd505IUCiIeHaaHnGzlkTC5nR0tXWFqOyhI6JN0YZn32f2N+
	hv0SL2kfjfahwUF5t2pBlY539tkjZrFufV8nbY0yW2rmtjIiwsh8csusVeV8Fl3s2gCUOzV4miH
	JgcYbHue6cHCTD/YFFNOv+gbKqdzvsJrLsBg=
X-Google-Smtp-Source: AGHT+IGJbDnkT5SHhTAhiO5Q6ljc1ugcvXc+gcWNPs7wch9qaoN42+cmkfKz9M/HNQWQv+Jtvr6PpA==
X-Received: by 2002:a05:6a20:3d83:b0:250:429b:9e56 with SMTP id adf61e73a8af0-2533e9476eamr16763215637.8.1757401407457;
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-774662c7158sm1025535b3a.72.2025.09.09.00.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 00:03:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 09 Sep 2025 00:03:22 -0700
Subject: [PATCH v6 3/8] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250909-pmu_event_info-v6-3-d8f80cacb884@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250909_000328_330385_F610B23D 
X-CRM114-Status: GOOD (  10.14  )
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

SBI v3.0 introduced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 78ac3216a54d..15d71a7b75ba 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -60,6 +60,7 @@ static u32 kvm_pmu_get_perf_event_type(unsigned long eidx)
 		type = PERF_TYPE_HW_CACHE;
 		break;
 	case SBI_PMU_EVENT_TYPE_RAW:
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
 	case SBI_PMU_EVENT_TYPE_FW:
 		type = PERF_TYPE_RAW;
 		break;
@@ -128,6 +129,9 @@ static u64 kvm_pmu_get_perf_event_config(unsigned long eidx, uint64_t evt_data)
 	case SBI_PMU_EVENT_TYPE_RAW:
 		config = evt_data & RISCV_PMU_RAW_EVENT_MASK;
 		break;
+	case SBI_PMU_EVENT_TYPE_RAW_V2:
+		config = evt_data & RISCV_PMU_RAW_EVENT_V2_MASK;
+		break;
 	case SBI_PMU_EVENT_TYPE_FW:
 		if (ecode < SBI_PMU_FW_MAX)
 			config = (1ULL << 63) | ecode;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
