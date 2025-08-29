Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9174CA0FF9
	for <kvm-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EQe+CEIzwE4zpWrgGqC/RVtR6IdNaHYJYhx924DC9P4=; b=jHA7N8+/vopVE+
	guyW/Usuvjfw73kzzmvSKqeIAJroAFr5p6DRNp5bMbDuOQn27qEyFgAQsqrCUg2evdfqAbA7p55+/
	NCBtWgA5X4jaUFmJR9miCpURsbe8IGilnsdek/xB3c0eVDcW04HwqBpsnBTfG88CmVyPL+WPJU/CE
	1wgU98IPy7uNTXE00H9/Lmmdh2z5hgPGfCRSIe1cIMLuaZiwvIUQPq3pf39ct1vXJ2d/uI/jHj1jJ
	ir+qZ9xZKkBBQzE5atGnAzJAcwmVZhc79TwlyGNcb7H06qn/3roKOVHikJo5+UhxK8LuHu29R9jKa
	AThkO8HvLgvZRwZOCCBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4Ag-00000006fhQ-1kX5;
	Fri, 29 Aug 2025 18:49:58 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0Hw-0000000641o-00gp
	for kvm-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 14:41:14 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-7720b23a49fso2411818b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1756478471; x=1757083271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=ef57SQwlCbzakcaISrlcrrCbUStVlR+4cfWLaZe2oRqWQrgjFvX1mt8GnXQ8scuCAL
         nXu0SSF6sUJdFz44m83Ac7Yx68pA8TczulqRABxxFRlOJqgHbUjQMEtL9iGYZjQoxCdJ
         u2AzGJl7+gbb4Wo1balMwZeKXXqQzoPdCfLY1efhp3MGCg/iIget84osUieYX9egrQhy
         hI8kf8krbWMJDWOusj2AeQ2YlxqiI1mOEUP+PcsU1AJDB/Mk8ZitI+EKOpYx1I5mkoDD
         VvF9Ryo818tapcTqziy0qwl0rqsAvb2kzmdBpIBNlj00cesA48Co70q0FfPG7rgvJIQJ
         kWCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478471; x=1757083271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=goqLKtDob+ZNX+w3rmmnq6+zF8DlfuvYjDiKv2ieDbU=;
        b=frOAfOpfccIhjWJMRgyV/5X8r4GWJa6DBjX9aK4jofcouGDBcWoQhNs1l7B0dyMAPd
         mF6wdaW02xs7V0jfr76p9yJFFe7QqyuPX9W1qPqHQ47gzdGpS47is5Yku7YU5WbCOs16
         LBdPMrYgl2HgLimdQWhirMgQuCK5YVrvvVzKXYZzfvTmN6V8X50a7VXuTM5fBTlHqh0m
         pwchVFz0La/H5OHrezaT9ihBZwI4mYP5btcdSG6ynxXquJjojUwCndIYVrtyzkp2qLFS
         oVOvr1bgzgUxEcekIgTvyeawUGPfxmC/qhx7cNmfGnGIoAmpYZ5vmnIReWXuxSmWdRYn
         OH/A==
X-Forwarded-Encrypted: i=1; AJvYcCWkObrh31kWZWoXIlxCuTXzCOBTEHBGnM4MFpwGX/t4v07oFY1wKCeYnszJBlZCig5wGwFXV9tPtK8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO33p5BHCD/i6/+VNh8aM/skvy7cHg7kDse+EYDvJ1xYimFg6S
	RoruHeioV0TXcvdobczxTGuHplvP5VPFJhlMftYvbo1KAWHCW1Dhs/7LOftKor6M2Mg=
X-Gm-Gg: ASbGncu3hwuFriObLEcXknTnnMeA4rY0e71b6audTTWgCAg0aIN6mWsDZqvPor6Hs0t
	uUPR/Ej/Qg9nJkoZbL2QcDTmwL2MUoeQSr3hYFI999UomnAMj5rLtxn6kgyJko+qYPH9n4lUxvs
	aAD5H1o0aWE9M+cxqbpLeFYzB35lTVVLnHSmhmykGcHWJip6wf2MGK/Ix3bH+6+WwOPbcGZNWm6
	FyR2igqQ0m1S5DEhY/GYJQHXXe9GFXUVWbFPW7wigQchXGhzatPh1igbGMDBJFJvhoQSZhp2Vqh
	2IsX+lv85wGPCCWcnjzCMfhQaibISjrXJysxccyMvGPmxqdXIJwIghelKQp/5xgOdTO2XBwU7XS
	OI/czOWn06DON6WL4ge5UEExrPairhTQup5KOBziUi2quXuzjYXaeOj8S
X-Google-Smtp-Source: AGHT+IEjIYlQyj5LF8L5OMDqDMzS8FXoLsXKsGZxQnXqTFQeAwVRK9v09HJ44UP8l3p9Cu40jXYhVg==
X-Received: by 2002:a05:6a00:4f92:b0:772:38a9:4d98 with SMTP id d2e1a72fcca58-77238a950ebmr927358b3a.13.1756478471237;
        Fri, 29 Aug 2025 07:41:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1f86sm2560999b3a.72.2025.08.29.07.41.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 07:41:10 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Fri, 29 Aug 2025 07:41:04 -0700
Subject: [PATCH v5 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250829-pmu_event_info-v5-3-9dca26139a33@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250829_074112_096388_80CD7A62 
X-CRM114-Status: UNSURE (   9.82  )
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
