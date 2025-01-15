Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D1BC02183
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fc4CdltyjOr1gfKihif3DtGYs9nqQjR6jlqVIqjlLB0=; b=k9sw8O/UTAxFin
	3VcjRdS1nHHHTNsLLBkg3dDN2f+bi9LisJr0RptT91aDP46vY6OmS/R1CJ1xD8n+/qfWmtnRFajL9
	eZnErTxsJ4wvieg6HfKnqmbVJx0Ft2MgdNM4+qsvO0/sb2xo/tSfWXSH3VXur2cjLWLXX3+9ph7hV
	xmZc2o+OTw9T1hwqYPi7/UDSUOm627v6Ek+kZXvbXrj7mbUO9qT+g02oFWpgCCUUPIkNRHOPO2l5S
	RQjQbs7KQj0puGePsc+t7t8joMGOpukwoCsnSymMbWmCgGkLpaI8jtZ1b65i9HZjx5BdI/IuMys74
	A49sSKqUxdVYE8ro3euQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8FS-0000000Cmmb-2mfz;
	Wed, 15 Jan 2025 18:36:14 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AO-0000000ClC4-3Lku
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:31:02 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-216281bc30fso152246715ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965860; x=1737570660; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=h8Yp7TE4M/x2CnoHbrQtjf0sxDOkhXQzJ5XdpO8HWEWW432Xtd6YnFejCEG7e1wWom
         kXN/s7O6jQSpEtKFyKJB4AwD9TaUWJPqajSyDDwSTaTaNrug7mPMbkkGuEWUWKfsBuCO
         lx2soA1Dq9oCKrCAGXKBbLI4B/W+M5I04sLYxkIi52g4NhDc3b8Qsp13YTU4movEWUQH
         mhosY8j/NbmW15LLYi5plThDWbBNrhQgmB4RcMONX/yyNFZnXlkas38nDvCyBgaaGcoj
         wuThcvgqNAQ9PI4lQZDPUgPBypdGZk0BMx52soz6CzMTrVb1UZuu7Ye+dGBrvIFWfrur
         aVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965860; x=1737570660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCeV16Tw9Ue2BbFuxP2Jm0elvtAXwe5u9EmpHjH7wzE=;
        b=ZW9oVnzs8iq4pCxtcL0ku3JITlRtjscHSbf4cni01isJpr1aScx5/r/fJTROLSYemk
         V5Ng7HgRhW+EaFZC0PcF/q2RB2CW5/D6NFWaj+fYJc+Xf+l9MaBu79AP4aZ4M+P0V/QD
         yZsgP3MDEOLBwK06YXGDhJjG0+FpZemY7+37f2FQNKtWYq0Acba4/28m6m8ZOKZaCbb+
         F2MBN1ypeavawDAjpIv1T3nouR4fowAIY+1B0y7FampWLujBRUPwkBmLYGPQSt1F/8+R
         4xIrv/E53t4dKnprurpW4KfZoIcgr734b7onv21OsdwixNh0yKn3z8XV0NuztNfD8Wid
         +YWw==
X-Forwarded-Encrypted: i=1; AJvYcCUVrsQaY0n1UOeUh02w8PyIrB5gwMSfXGsgYFxQu1wsGWzdeJpGOUNkPbaKhgcoQumOigDyWzPyMo8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzLklMOGiWZlvvggagdy3pC62Kbgmh6XksV9Qpsg18FiytPYYBN
	G7DLbuiJbOdqVWm6XPE6Sr0jCvgxTPmmxYgTBER+146tfzGgXgBvIEeEYg/0Acg=
X-Gm-Gg: ASbGncsMsrwN+XuejLHmu7RjWneN/8IohcU21VuLeny0UshHwiHwXklCVpIqWNNwAbg
	O8+eKaiIuebgXd0Q47lJJITUG4jwVWP2m/G+sMbz3ntrHLJNPT3sjlAB5A+RXfqb3j6sVvNf+8N
	K4Y4GJSo7W3Lcc8ELa+BMnUFSYGp70KiFzWdinPAeTSh85nkiGzhktE6TT47MLCSu1lUU2xP7lX
	3KjmLuHpi3kGVlyNDnxD0m7niqpwuatasoYkhXA2K8kRmSM0QojpqxCeDTSt++l1Wd9JA==
X-Google-Smtp-Source: AGHT+IFhv3d+iNN38adFn+dH29zIS7C6pmY5MPy1fONgMvFeK1H10VHPHqcDN6p90NhFpRdpeycXlA==
X-Received: by 2002:a17:902:f68b:b0:216:32c4:f807 with SMTP id d9443c01a7336-21a83fdea82mr472230285ad.45.1736965858786;
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:43 -0800
Subject: [PATCH v2 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-3-84815b70383b@rivosinc.com>
References: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
In-Reply-To: <20250115-pmu_event_info-v2-0-84815b70383b@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_103100_858964_E5711C4F 
X-CRM114-Status: UNSURE (   9.95  )
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

SBI v3.0 introuced a new raw event type v2 for wider mhpmeventX
programming. Add the support in kvm for that.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kvm/vcpu_pmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index 2707a51b082c..efd66835c2b8 100644
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
