Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31DADC54E65
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 May 2025 19:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5c3pHztxGcgbA0C1EyHxDXLmUbmhNwxkMVkEGe+1bs=; b=LrnVswy909UVbZ
	bVESdXbxlxH8TFtvgmPpOu7YXGdKP85Es0K/88Kub2JG6sOH0k00m9KYkSjCygWTPh8uIFqUqh6tZ
	MFCEM8fsVR/I/nQLQkFs2oDDlgmnXDfDvbrqS768Saktr7nsu+52ll/sB+BFpgpSU20SL+6UGcDKv
	28LOu8TidE8OHolciHdh7tEAEtuxMLenLwyjC6GCwuPZmG2X3KKUyn585r9wW/YDo+lpuyTo+x9Ed
	n2ANW59h9WehlN6LBbmTeq8wCxfEGx8ki1PIqtNdBrBj6HEM9mc+3nbEkH11jk88cPc9637MVSIJM
	VnM3w9xxde4EBFf5xxaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBIs-00000001yLD-3wAj;
	Thu, 22 May 2025 19:10:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIBCm-00000001wMC-0kIC
	for kvm-riscv@lists.infradead.org;
	Thu, 22 May 2025 19:03:50 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-23035b3edf1so69334525ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 22 May 2025 12:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940627; x=1748545427; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=vpW5AmjZQI1a/C4mJo2IaJKNZp6z7nVL3hJN5UKqzgb48aSkqbymfLs2M48uIz868S
         xsJo7nTx38S8u+QGTcK9RZjrGd2hCeqRoior2Cvp6YzvZzh4jOduYs8AWwv3D2ydk85k
         dPHUyIWz2pEO+lLrCl/24CaVFMj8kDfkJJtID8+GTsoAoOYPkGFcMg5FBvEWm6eup9I7
         JJqrxFraW6JygcERwS+NRrU62Vs+dfzXBXqtJn6uu6szggL/UOWkbNzDJTlB2WoesMX4
         x6YafTXYWmCSaG4zXYSgUlLXvfiP6Po3kMlGsZBr/RSllBLlHQCCOfo6fVKUco9GGhV6
         izWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940627; x=1748545427;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MgSYDCFyOFl1ODnG5fRD1TrPKu6WyFc6mOzCNie7R+g=;
        b=pSiDLiTooGLp9qu9sGqCiNh464pqFmVFhdFD2nhx3ZW/RssRxST2dySpbm39/wupbz
         GA6dACafCnCtT6TW0FCfapaaZPt8hAVq2KZjHPmxkjsjnjKSVyCmE/lBS31GNe7feeej
         xCJd1RkcnEYTQtC7pv/L3K5Y0uW9GG7NccSsH8YbugPINeH6CaULIitzSW3rczAlZ9Yf
         2L2WdHl7dYoCsFQa6duQ3s6OSi6CB2hTMOh3tlVgVKaWYm4eUdkxG2wLTH3HuqYJBip6
         fitOGlJgfCIHCOg8GWwXyAkVn13oibb+BSN7EUXDO/DyGBvU+bBxtM5En2X7xpbNg0Cr
         1zDA==
X-Forwarded-Encrypted: i=1; AJvYcCWYGMCMq3XmwS7g9a1VjU+0jtpCbOssV2rgU786Cxg3FLIKIXjkv/x1y9Pkf6LL3/zg7+1rHauMYN4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxWE4R/Jv7DA5EC/Zbi8y0bgv1pbrTBUxbpzr9LY1QhVH81ZhD4
	lwDP8IUpQ2hLlFPMU2NYMqyjAu1+ik9Mm72yw4EssPj68bE1KvyBdjA+eBqecLjyXBA=
X-Gm-Gg: ASbGnctK7b+DxRfyY1K+5nA9OVTLRk8PeKldRpm8psrfM0EVB84bj4Oiz1K2f5dX48E
	vDxDUlM5Wwhk4qFSfaFNiTDDv2tLvTUCWPX3X29HWU9BK6/0LPo2bypHNXSR3LazscI6Wi5pvvx
	BPpPX4FHI+nrAUb/RiXGIqzuIbKgZZS4VXJhltwOkf0pKvvsEoB6+aw7Msckbwtdh8WF/N39zZg
	U4HPfsD65bAvx2B6SwZ74CxkCHQZKnSBwf79m/n9GktgqQ8zgwxxNHHDHhuF60KwgydEXQh58cm
	5nEGZk++n3g85ONuLpF+rukCXpNcxobl2OmsCQWnol8RUfzsHjIc3Bw3Er7zWLWW
X-Google-Smtp-Source: AGHT+IGs856eL1BrViuwG7Snet4kjwTZqseUJx/cN/TovXlD6rlR9pixORAh5bRSKluNwVXzmFHaxw==
X-Received: by 2002:a17:903:2301:b0:22e:364b:4f3e with SMTP id d9443c01a7336-231d4562cc5mr379326455ad.49.1747940627664;
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:47 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:37 -0700
Subject: [PATCH v3 3/9] RISC-V: KVM: Add support for Raw event v2
MIME-Version: 1.0
Message-Id: <20250522-pmu_event_info-v3-3-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250522_120348_243986_03EE8545 
X-CRM114-Status: UNSURE (   9.78  )
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
