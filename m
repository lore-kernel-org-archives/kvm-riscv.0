Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE8B5C02180
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdxnyfSjCTiZ58yHScEGYfG4dPVYYPrctSerEjbErhE=; b=zMa0wHB4rzZ9I4
	E0xFwm1q/mh3kpuqVhZ6HnHH5wlH/NfJEBHjU5a1MIpx11yeLi9022MgdUVctEagkyjed6MpUN+fz
	xmycH3dvJ3AhoDRweioSx1F7PwSi2FEl+HDEfYForXIRZkS3V0k0hFhjvbuK1icegU8eJ8Sadti2j
	kXIZH9wugGUawwBVv+JV0XLku1iZz+2TtPxkvaVt6Cejz/PcFqa6zvveb7jlqD7gTNpx0SooLmIuM
	0UJQVeK+dntm49B1pwyuvuSpjRmDmOnB6whXXMN+pwau/dy8qokGRk7916m2q/hTjaPslrGkz6nsQ
	wBFbCopWSZ1+BsU+jNxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8Be-0000000Cli1-2JgK;
	Wed, 15 Jan 2025 18:32:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY8AL-0000000Cl8c-0Odd
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jan 2025 18:30:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-216395e151bso1993625ad.0
        for <kvm-riscv@lists.infradead.org>; Wed, 15 Jan 2025 10:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736965856; x=1737570656; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=JbBJhzksa1B1U282EUSJtPqm3lhRTZChH8Mllx1Q9p+tF/FpXh07NDYX0fuZGFB0mX
         Kuu+4FpR7a/91y2HFkLTeB0L0Kr7o5Cg1BeJYkUC8viq5iUoU/mfADXaETiOLXuS7ro3
         zRXB7XbuHSzsLioxtifL4qZD7BwkFIqFI4x3kv80/SVZUp2UWxqGGmo6WLFQHK7EFPBb
         yyFXbhnhwKuxBhspALx+Gw9JBq4TFQLOGWcHRQx0IUYOjSR+MKWRhGJAT9OJJSzRnAAV
         z2SvWg8vCjKPGwE4hUT8lAgNtoPy3wzUWq6a7NjsEkozXUuiw2m42nAVcoVvD+XsReUX
         v8lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736965856; x=1737570656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R6MbfDRCc6A6mGBsw+fhL6wjTkBIFejSaI+SDSiajdA=;
        b=RV3JvVCESUmiPyhek/6AF0Tw7enscpXrn721yCsGeTPM0f1fudWHATMeRp0aQedyJ3
         7JOXyo1XH7p9ivCog2rdrxBqt/7eP7YWNcEOUA7znf6357tzE4sw+AxSG/JkZuzXgt2I
         EF7In/OmuDNoDp0JiXGfrnDYfRXYBMfMq0qaNh9oXqweO020eJnYUPf3wzIGfPr4DRdf
         JjMsKp2lvgV/N3dm8LmEiWNAmN6edI/Fccl7agf2k3XqdKsDuUmA4ivMy9kF8wQvvvZh
         4TQ43ZGiz2TWDCqN3vIXS0Yz/FRFHd72emVjKIGPGQjrR8AQDrYvwu5cHt8p8xsU8qUt
         /LeA==
X-Forwarded-Encrypted: i=1; AJvYcCVNyUj6Rn3H4RDMsAV/7j9bKWnUh9Q2AO+szO7AER4cBRkJoHAavWOL0OygGKNqrzuLksTFOE9hWSw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS3QlNLhvFRYh5l5dAU6xzjQoEAgjpbJuw3+2O+rYG/L2WWECq
	0opA060WoT/Ui1Fg5PrJyd/koW2lEX7sgz/2iaDlh1Y4MMYiw0UwcMvRm4OaRLI=
X-Gm-Gg: ASbGnctVY2z8okDUUVIP0NjWIZEIpcEXkzLIRvBIe0ZlFFyBjs25QkOuOke8FpEoVOE
	awJ5lL14itqITYhdsmEM2dj/a5gPV+FWjchArVY/vmgWXlnO1WNKltb7XriSm/SwdOjGSTrX5yQ
	Qg7U4TPJvalI10t2OhVGwVjY37cjZ4RwJNYhDY1Mytmt+DiU5Yzc4762GklW0nLzw9yCOOcMfyf
	PaiND1dqUKg5DOF2tvQ60l3ar02klSINed1b+0tRZo5TChgCOyCLj58U8RNIj7q8A8/rQ==
X-Google-Smtp-Source: AGHT+IGH5/giAEf8Q/ecUlIbOiNlBZurjf3IoH6KsqiI1EGl06ksaFaVD7yVqQ1dvhjlbV18FEvXig==
X-Received: by 2002:a17:902:c40b:b0:215:ba2b:cd55 with SMTP id d9443c01a7336-21bf0b76a12mr58588755ad.2.1736965856596;
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f219f0dsm85333195ad.139.2025.01.15.10.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 10:30:56 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 15 Jan 2025 10:30:41 -0800
Subject: [PATCH v2 1/9] drivers/perf: riscv: Add SBI v3.0 flag
MIME-Version: 1.0
Message-Id: <20250115-pmu_event_info-v2-1-84815b70383b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250115_103057_155386_43B2AA6D 
X-CRM114-Status: UNSURE (   9.17  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 194c153e5d71..170aa93106b9 100644
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
