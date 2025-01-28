Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92975C0218D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JVKUI1PUwcaFleaf6CAgL0Ur+Wx0gkixIqYbpUdhnq8=; b=pS2oUK99mwBGgs
	0AEY9fkPOz6jYkL3rbG2mactZSzaJfUVMCGxzA+Zvra+rsJkEl7RF8gcdGKKgjYzuA8CkGCxdu2i4
	5i0TfGrDe1gR4tpy+VYz/UHog0/qVwdtEmri1VhxKQ+c4R2dQU0r/UgbCm2oasquU88T4f5XiQ3t+
	YUB7e0MgY9vXY5QDrZXjY7qtfopHkiG3D+HCPx5WkexF8Ryuh3ZAdITlyEp1KMemqfqa9PaNv1sCf
	ruq6xiod7hkkA5Kpp+60cqWBH98pNv/c6jqHpGweDvWInSMLzLn/aO/HrsokAFSx6V2mifTKrrole
	W3UnpcoHBRS8BXqxm90w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tce2Y-000000049Dv-1RPm;
	Tue, 28 Jan 2025 05:21:34 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhx-000000044lV-1lox
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:20 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso7180081a91.2
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040417; x=1738645217; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QcgV78ON7bQjbj8rz+m5AxTl8xJOToNes7SYHJXciAs=;
        b=P3tQzYDsLZ3oEzhEc3dopSglHdtx3Lmzw4Zk/eOuPx4CY20kD58oIRbrK3c4tVkVBQ
         a+qRifkjv1vNKQ06dGq2yESptaKtcwgiwa5C49W9U4dV5fhSl/Q68EnqF2fPTTr9nrqW
         7mc43NY1faDezQ4Oj1BYzffWU2XSMWefHD1oDDgqIDCheyD0j/RtE3NSPFttMZJ4LzKr
         k9Pc2ST36k/AdO1fspxuNDVXmyvM7OQrD2jRsbdPyxErM3buq9rk1p3XPuOGB2NNt4JX
         qUXPFSOVzclXzQ5tQxBOJUSbrMFB5dLkgimljRlDlUVPKDIJdcvwDwLnbmiXt/aT9nkK
         7mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040417; x=1738645217;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QcgV78ON7bQjbj8rz+m5AxTl8xJOToNes7SYHJXciAs=;
        b=eSC6phzeCPhhCH5USVPVzxDWQaEFNoQEfBdAifvDLmEsWhanAVucwsaYCfW7gqNnHw
         Ffp11ogUeNLNDhEQ7rcZkOk4QTg8H6ku5YYxB18PCXsNaKsQ3oOuJeWQm0o3k6DpM6Vk
         u/XrzIvpmcxT35m8v2MTswg88r64x0iaava41ehzWO/X+isQenXR3ldrLi3dIAxAs6BH
         YaJCTv/iaTWnto444yjp/6hnlDBy+ZZlt+H4T+zFjoBHiSRl2Ea7iXIw8gGLuhb08xbd
         xmyB5/8BOGxb9I/5M/FcpOqySI2Bkp6V76DToU6vIx6V4U43HW5Bj8Gp5VkxH7QudpwO
         iDXw==
X-Forwarded-Encrypted: i=1; AJvYcCU8OB4MbarcQuCcrTSrePkKJthZzwRfMRx1W2OBpBDhU/YS3sL97owvCfrRA3v7kK/638/BtOC0gpg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxug1oY4eyeq65snZa7gvVh6t4L9Mc3kqpxOtStD/53vjvzdyhN
	9iJiFdvdWZTsK+stZwmWUukP/OrB4hZPtKP9UAGFyjmWwJWPzQO4u22Unu8E3w8=
X-Gm-Gg: ASbGncvE9w4IrSuADwY40FMM5pEtkalGmsKpHQPaFC1Tn1KrXSiU2qK2YXCoMsBmAum
	2Ja5Bq3LCg44uQ0TPc0yKeUczbuJZ69grNYkODEJ94bdpUtlry1+WIpwMiuJ+us02QKE65d+XQW
	OWJg0ZfI0FiCHNeqgfQOEQPoHo+e8J2EU0HmvGDEVzIvGxzfuioUyn79H+dO5txbJVzVThtvvSw
	PMj2GdY9+wGZUNIHKph76ChTIxv3BiEexIs5BT87fdJdIymHW0gqhafA+XPGj4KiEIgaqiny1tl
	KUROxQpRtihHTvm5VYaSpt+rCc+e
X-Google-Smtp-Source: AGHT+IGCm7GMS3VNtxEaZyWfkLMPbe+hI7KXpym5HHPhVJQX2ASsOYeeTikT15JA57Prj6Ttz9V96w==
X-Received: by 2002:a17:90b:524b:b0:2ee:a583:e616 with SMTP id 98e67ed59e1d1-2f782c8fd41mr65998400a91.9.1738040416850;
        Mon, 27 Jan 2025 21:00:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:58 -0800
Subject: [PATCH v3 17/21] RISC-V: perf: Add legacy event encodings via
 sysfs
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-17-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210017_606145_700ABE42 
X-CRM114-Status: GOOD (  15.37  )
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
index ab84f83df5e1..055011f07759 100644
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
