Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F2FC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 20:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xc4qSGRzwbPJQfb16Vb1C2LZyUd7AXOG61c4ov3xyZ8=; b=353zeMqHRQVQ8C
	zyduceMHz46TwxmJo8a3LjSuT8ylznYr008Dk58l12FoehzEBa8Zk2eFqeFao3BdPF+cWDsGqPMKE
	jn4tYXjmCJkoeJLjTGgJh1U5k+NPeey9NJCCPdbEnMSa+UT5zTDTNQp5sKKVdzg5lmdJ4h9dSyxJg
	1wVNgVKXvGCTY4xP7R4ue9h4U5y3WMwyhZkpif793cx2PgjRJfbFJPE8N3IbzFBN//pD3L7kfQcEQ
	6PDCcxCINC+Fkbi1lZJ6GdTvKesqq7w/i1Ew+Ar0j5vS7xDebU3TFdduH+CcZNr/Bm66FM2CMaU5A
	xJAFwd1Fb65RDsldyc8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtWe-0000000BvvI-3ooY;
	Thu, 27 Mar 2025 20:08:28 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1v-0000000Bptp-3bKq
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:45 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-301493f45aeso2159014a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104203; x=1743709003; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=sQgCXLjTEAE2+6HEm+4A28fu/v2yXiOunANhBXneopH/0tTx8gbKQDDdXbyDET5wZs
         KRWB6jwXgnpPjx1KYWGxaO4oU6bkCHKaCRGcjjKy4oyCJf0kTj0hBimzf4wWKLBbUqLs
         D+DR4uaB9lK97OhqZWPoXFKxzZORgKEGAQS+ZyfnKf7meHlen+Fb7yioSWtUQi8H3mn2
         amDWnmb0o9MVcG3nW99tJXgqGW4oU5xHi+wfLiR7kfk4nkMYAFBSRRxap46T+pnTHx0M
         DCMfDA76tE83M7pofxDdK8AuinpHWnMNqV4ciXLc4FFbhuwU14VwuNlGoCXeYOsMDS5t
         ERug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104203; x=1743709003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KJwNDXXlYjKjGqwwgKGhwlhZINc8dMq3L7uwB92VzFc=;
        b=IhKv0VXsNmYBgnRxI27lfr98SFVoZEWmfkd4yVnSOrnz9XtAL9iiTph3dVOdgxHtpI
         yWA/+T3BjHXHCnazjABjB0LzM+fM7q1xs1zmK7OQZVpLEqUlYtUDkMjqRKw2WVXPW+EX
         n6ONX4Gdyy/u9gZayo4N82myI+mYAoWZMpolRsTFJPw9PcKe/5rvT3e9ObOc3c449RY2
         GQB6v3+bksDDyvLR4z1F9NUCgCO7l6QOhaGAMO8qrt+2uvvwzU2jSZGfqXOYRv+ydFIF
         B8XNDkoLT/f11hfViYH6zxQrHKEo4VRURRn91HfbCWmruleZYcV9duONnAQbNHWY/SnV
         CtVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrWd9DMhrgR8+yNbeawVv0LOmf9/MTIm0XndPerzPSxcS/Ic6ZMvi+rPyTmajV+ieohPVCSrQhNKM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyjXlU2dZ95qpG7e/W+Myy7KezBWJmpebUKEM9bgOS9rqrZ4gEB
	ne6949wqEPTbHgn+UC4RrqxikpN8chaejoxKPcSc0fIbGViLL99OeZFDLLjIffM=
X-Gm-Gg: ASbGncvCpYtaUMCsA0IJBm9cr1bUJx376EQhPGkq4Cypa1u9cVQrTc5jgYnARPl0GIL
	rlklBtCOwdfD818KZu3wsT0vnwPRBUv0C7bOkt0KpCxqz5+uQuNCqHntzmWx0m9JNcZHrkSMSNS
	41TYdoFxxlFnGMAHy4hw0Rx53i+U6PPsXx6aDhGsOiGFJWJFzrkOpv/5nUysDnoBFiVofVb5oYW
	2SgXRuuL5xKhdi0Lgs1TyWXad+vRVaAjVSiQJiBKpYsgDPEOmC3gP5TaCmm8/vGjTjnAHnTIvXM
	dAgusJu3P7VEtx7oHz1IzAeoXwlUISeaOMlShcDFMm1Cq/m63jPvmMPfUw==
X-Google-Smtp-Source: AGHT+IHr9lkacen5G6bNal8x27vd0zlzKk1gXvQpJoZ6ZU4fSbwcKifIx6nJFU8JTt0ZbyyT81dbnQ==
X-Received: by 2002:a17:90b:4d05:b0:2ee:b8ac:73b0 with SMTP id 98e67ed59e1d1-303a7c5b9eemr7219789a91.2.1743104202835;
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:42 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:00 -0700
Subject: [PATCH v5 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-19-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123643_944139_7EC83881 
X-CRM114-Status: GOOD (  15.80  )
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

RISC-V relies on the event encoding from the json file. That includes
arch standard events. If event code is present, event is already updated
with correct encoding. No need to update it again which results in losing
the event encoding.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/arch/riscv/arch-standard.json | 10 ++++++++++
 tools/perf/pmu-events/jevents.py                    |  4 +++-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/tools/perf/pmu-events/arch/riscv/arch-standard.json b/tools/perf/pmu-events/arch/riscv/arch-standard.json
new file mode 100644
index 000000000000..96e21f088558
--- /dev/null
+++ b/tools/perf/pmu-events/arch/riscv/arch-standard.json
@@ -0,0 +1,10 @@
+[
+  {
+    "EventName": "cycles",
+    "BriefDescription": "cycle executed"
+  },
+  {
+    "EventName": "instructions",
+    "BriefDescription": "instruction retired"
+  }
+]
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index fa7c466a5ef3..fdb7ddf093d2 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -417,7 +417,9 @@ class JsonEvent:
       self.long_desc += extra_desc
     if arch_std:
       if arch_std.lower() in _arch_std_events:
-        event = _arch_std_events[arch_std.lower()].event
+        # No need to replace as evencode would have updated the event before
+        if not eventcode:
+          event = _arch_std_events[arch_std.lower()].event
         # Copy from the architecture standard event to self for undefined fields.
         for attr, value in _arch_std_events[arch_std.lower()].__dict__.items():
           if hasattr(self, attr) and not getattr(self, attr):

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
