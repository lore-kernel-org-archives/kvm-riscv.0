Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F37AC02185
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:32:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fQo4mkwRHYRrAGVO+ZNpVPHMb7mPY1ThH3IkG5A0D8w=; b=RJKrj+FCVgkyFr
	TispE10tyBioB9vifr+sVQvml07Ot+aXuyTvDgoaSFfznMdLxuXrKwOTjXx4s8Kewh3yDHwo2s83/
	pqgP9blYl/gfWG46zRIR/+MIs8ni4uQETxebgaPJ+E6k4f/qdJh5iyXbuqITTh233uIUtetsNHW7v
	bZTHD873EBO8hSaKG3LAtSL/5TQGKq/S/u3ulKc4jddY/sjVRwvIO0Homz05RQP5dFCnw5vVpCbrs
	EI5vrnvnYHiAqSBUqX3+AN7fLkEaZQXe9IAqiUPUWis6aihBFb7DOcg5hSL4Em4HtgY5Cdp9SSstq
	NDm3p5s9KAWrzBJ1if/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXrKi-0000000ACwd-0lJL;
	Wed, 15 Jan 2025 00:32:32 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps4-0000000A0Ct-1666
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:53 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2167141dfa1so4673295ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895532; x=1737500332; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=JtdP3EMSxjdgE830+2na1pqRDrQutHtS2lztPd8QitmuJ0Kubn5dIdzFuoA8/h5L7F
         7aGQRsCVm+CzlXI8A6ubWSD1vJdltGy8+hU2OEm5gtYlra5qEwwE3GjSEqsCoI/xfwzK
         GrvG7rIi13mzs5T4YAGZ2ABM7/Rjtv+/7A+NgSTXEEe2FTRtbbtP7IXLmx/pWTDnfHG5
         q7nWHdNE/yUVH4goGGHYg8qcgKu2WRZPiQuLmHJXOgnvkjXpEZZT+0xLgqUs2BDVH0lJ
         8WVcUPMcsLG3jGWmlO1uK6qjbC3LOXSAC9xBeADdL22styzCrY5LoIii2KwsV3IHuyZT
         MW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895532; x=1737500332;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/NGMQ1cPPzFcGB6lbht2UloHcbpdvl9Eg+C6+XEyyV4=;
        b=YIJM35V501IBINEi8Y1aT361a7VfTWqZ6fDg3sRNymT/PyWKi/LYELZEFo9zUcNCmj
         XMVlZ85Nnhm2J+HQNo3DsuX8WeueuW5N3w0muPQh54DJBxurX5cv/BQ8J3ZbvkoPeXLg
         GVk5v4hDsQVw8s0REJE4g3ILcdu7NRaIqbOq9BMiO2fi6jZnmxWmZGzakBWc0wRFrvYT
         IiSULAZfIEZXzsPpU2Og/LEU/19Nu47Dbw2ohSidqh8U98QY00/Yb6JUoWsZVsE1kvic
         G1NW7dMhPYFxZIPI2A2jLiGmlcyFk0Fg2f7X2defvslZHhKCY6L8QtDKxdD6iU/4Q8TA
         Cipg==
X-Forwarded-Encrypted: i=1; AJvYcCU/srThFpD8qvAbCstAPZa6xtrTy81UEYcuJGV6HOasdbexvQAB417STRjfIuUmB4qgvTgRbSkOE4Y=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKA5plmW7zobWG64yf1wQSOawHlvchZt8+a0Ev0lqERHAbuwlK
	MUOhVtsWSMlPDWBUsxvmb1QQf7hlc0yFdu2uyepVWt03+jm44cyj3bg9AAh2w6I=
X-Gm-Gg: ASbGncsNJUTlj5fGpz1Kz5kQ1vBBIwVA2O0upbV74Wu4SsuOxJX5qwse0FVLq3EEyJT
	uReZ4I9mPVvpp+QimMtk6ZFEKWFNKkw9I69fJ1bL0P4k4A2BjjGxVEg3c0duRiu4RKAGI8VPPbV
	19QpzydRESAj5cwSzAFOxzaH11kvWviwig3SQ2VCGYXpllRNy0bda6pIL+sX/ICefA97K1t+N1r
	AD0mHN4RPPKsK3qCUIzxKTiJ3W+I93pynbd4wU22CkqGKjtZBgdZyzKNJKYbulEXoErTg==
X-Google-Smtp-Source: AGHT+IGY7+84arGT8AswRpB+pqwECCjX/DmctkDVIPDIQHV61usZj0/p7BRGYknWv9dWJ1AzycUGOg==
X-Received: by 2002:a17:902:e892:b0:215:6c5f:d142 with SMTP id d9443c01a7336-21bf0d16349mr10455835ad.20.1736895531696;
        Tue, 14 Jan 2025 14:58:51 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:51 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:44 -0800
Subject: [PATCH v2 19/21] tools/perf: Support event code for arch standard
 events
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-19-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145852_312738_F7F9B003 
X-CRM114-Status: GOOD (  16.12  )
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
index 5fd906ac6642..28acd598dd7c 100755
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
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
