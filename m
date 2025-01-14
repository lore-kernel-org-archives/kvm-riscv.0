Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1D1C02185
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CLmi3ROQLXjgQMRmU1lOh/H5jeRYugQnrbAoaklf4SY=; b=JkmKzjZ3eDWC1j
	i70r0KVqXcRQAP99IawCyamHTdDAta0lunXOmhe3bd2BlEQ6z5tyEyFuJQwDqtYy651sPWXVvb4L1
	/0BrBrL8LBhtmlms4aQ/Bw2uq1BFWjAxRc3I3mYsE1FHz2yx6461og4vGw/p5QuEIxz79eacWuPUa
	PWgme/IyI7F4KhNB8igWc2QdSHYdYRJyMoaXF6U6JZJCuuT1TFTr2SDY9NefPNxDNyFyX1Uxtvsg3
	5jevCKfoycVyG7vqUOV6Uqdb+i4on5e1Zg3j9JG8C1R6bK+bX+g6i2HJ2gO87tO2+WYK2cvbBFq3d
	BGTcF22t3d9XV55S9Efg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqDY-0000000A5Lh-17Gt;
	Tue, 14 Jan 2025 23:21:04 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps0-0000000A09j-2p9a
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:50 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-216401de828so100946305ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895528; x=1737500328; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lFaqQYFa0i4Hi1540ZaNWub9sunz3Nl340tvz0aVjzo=;
        b=W3qo/sSJEC763jbmA+dzv3Tz0POilV+qubzTuN/Mh8UDzNyk/y00f7CE+OvflJET9X
         lTfp8ha23XIY+aveuIs2DOZOqdcUjljkYmBtMG/iqPa5fkGOmv6UtsKrQBIP72HirhU2
         SrHY/JVFE3iS9ohVbuKYSIRG5NWR2FIFd4niMcP9Gr4MK3EmQaDTJv2FxIbZKRXYrpOi
         yz5x6307ycqwan60o7mwx/3+X5TCr2qCEEq7C7UHApubpX7oMFhYYVtLHwLzUgOQ2aJS
         IvcaFDmRh/A1AX4exJZMPfz9tcIcNAmjqRbgLIZSMf5nMID7rDQWFY6L+aM+KveckUc+
         2B1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895528; x=1737500328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lFaqQYFa0i4Hi1540ZaNWub9sunz3Nl340tvz0aVjzo=;
        b=BSczb/gHak0lwKZo4WxjGP7LK2QLTUv9905QPQnW6bnEXBVTbG6iGOabFPYlsrzG0R
         l4bpoTYQF9SVgw8ohYLpEURSVn8P/4SoWVFE0WHV+oKLD1P2CGV/yiIV16chX3laa+Tj
         qB3YD4RND9kCAChSKOvHrs3/DV2UlZetdjZh5NezdQ6zC4La3zvb4sDKXgFl+iyIDl5l
         oKl7JMq+sdQmeSru64quivGuCRT1hpJYfTlSkLeyyHxfKvj7Xp5dE+TfCfG+9xwQvF5z
         CE9WhUa8JE6/ZwNGSZU7eTWT3MOlqJgquEJWDzyKH9MBvu6fvkR6fWjbwIgnlQa0pu5p
         zIiA==
X-Forwarded-Encrypted: i=1; AJvYcCWxI6ekDuvEjA8fM2HCvULXi0FFwxjDBhxpspAyRhZsDJRVy1cUuj2iAcpL2mgPXWgZAIS4dxEbTBo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8x3EDsFFmUkxSMSf+rdKWrjK7OfQciSSVFkwSVOQ4O3fe1OWr
	/FRN875OAL2hI63LamsZjyNUxAV8II7vTo0viQ0yS6k9u+v6jZ9qSjmH6uY+13Bfi9RJmYBIIz4
	4
X-Gm-Gg: ASbGnct/HvR6iTZb4B0TXR1nkcIWbIk5Zj2yH5o32CTg8FpyhVxM6xeQBTFECL079t0
	SbU/DWu4GIHs4KzQKhXx/LXW+1+t/uqwZoyUeazBRpCaN1jW+pNX7BRRs3s5XIcnKrso54TF5M5
	Tyc+RtvfhXeQVEKXZGCJ+DeFkg14ZETmspm73c2KnTrXjDfa6Slg0W0cdvT07ObNAF1b82zB6Pz
	SzreEG98DwF0DnPHFuCKj85kTupku2A+Ng93is/8KSPsC0FIa7mL0DrT37uUfsAGlGcAQ==
X-Google-Smtp-Source: AGHT+IHCQ6qV+IZREHZOksM8g070R45gqC24v2Ey2b78fnINPv3h7b/5YKzuEF3OHMLV4KVWpbWi3w==
X-Received: by 2002:a17:902:c941:b0:216:7cbf:951f with SMTP id d9443c01a7336-21a83f4f096mr419065225ad.21.1736895528131;
        Tue, 14 Jan 2025 14:58:48 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:42 -0800
Subject: [PATCH v2 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-17-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145848_751465_BE667517 
X-CRM114-Status: GOOD (  15.29  )
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

Define sysfs details for the legacy events so that any tool can
parse these to understand the minimum set of legacy events
supported by the platform. The sysfs entry will describe both event
encoding and corresponding counter map so that an perf event can be
programmed accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_dev.c | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
index 8c5e2474fb7d..8c5598253af0 100644
--- a/drivers/perf/riscv_pmu_dev.c
+++ b/drivers/perf/riscv_pmu_dev.c
@@ -122,7 +122,20 @@ static struct attribute_group riscv_cdeleg_pmu_format_group = {
 	.attrs = riscv_cdeleg_pmu_formats_attr,
 };
 
+#define RVPMU_EVENT_ATTR_RESOLVE(m) #m
+#define RVPMU_EVENT_CMASK_ATTR(_name, _var, config, mask) \
+	PMU_EVENT_ATTR_STRING(_name, rvpmu_event_attr_##_var, \
+			      "event=" RVPMU_EVENT_ATTR_RESOLVE(config) \
+			      ",counterid_mask=" RVPMU_EVENT_ATTR_RESOLVE(mask) "\n")
+
+#define RVPMU_EVENT_ATTR_PTR(name) (&rvpmu_event_attr_##name.attr.attr)
+
+static struct attribute_group riscv_cdeleg_pmu_event_group __ro_after_init = {
+	.name = "events",
+};
+
 static const struct attribute_group *riscv_cdeleg_pmu_attr_groups[] = {
+	&riscv_cdeleg_pmu_event_group,
 	&riscv_cdeleg_pmu_format_group,
 	NULL,
 };
@@ -362,11 +375,14 @@ struct riscv_vendor_pmu_events {
 	const struct riscv_pmu_event *hw_event_map;
 	const struct riscv_pmu_event (*cache_event_map)[PERF_COUNT_HW_CACHE_OP_MAX]
 						       [PERF_COUNT_HW_CACHE_RESULT_MAX];
+	struct attribute **attrs_events;
 };
 
-#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, _cache_event_map) \
+#define RISCV_VENDOR_PMU_EVENTS(_vendorid, _archid, _implid, _hw_event_map, \
+				_cache_event_map, _attrs) \
 	{ .vendorid = _vendorid, .archid = _archid, .implid = _implid, \
-	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map },
+	  .hw_event_map = _hw_event_map, .cache_event_map = _cache_event_map, \
+	  .attrs_events = _attrs },
 
 static struct riscv_vendor_pmu_events pmu_vendor_events_table[] = {
 };
@@ -388,6 +404,8 @@ static void rvpmu_vendor_register_events(void)
 		    pmu_vendor_events_table[i].archid == arch_id) {
 			current_pmu_hw_event_map = pmu_vendor_events_table[i].hw_event_map;
 			current_pmu_cache_event_map = pmu_vendor_events_table[i].cache_event_map;
+			riscv_cdeleg_pmu_event_group.attrs =
+							pmu_vendor_events_table[i].attrs_events;
 			break;
 		}
 	}

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
