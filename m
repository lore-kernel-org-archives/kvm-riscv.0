Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BEE5C02185
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kOlsCsjmNYBfm0m0lZjpk5rHlY4Idt5BjSmhmG3xlZs=; b=RVqB08OAkyQD7D
	eVC3VV9dLTJy+ReOeLUmkR6VLWhHM1d7IRfsJpNeW37YeFnbPy33E9NhInOHM2kgkcwaywJDfNOUt
	ylPshDIpuk+9lG7bQFgi8Gv9SczzAwrS4V97F4yX1lbYDuCy0K4oSFsGWEWwuwnosX3e67Xgk5rAZ
	eMNLoDbRKvudKEev6MnZsbYqEsnwRSNm83kcYCZxk8chG1yrch4CzNfgigUNZ0rFvyR0CT/DI1mcx
	WikSKwTGVl/mLAwGVpT/9k480qZpGeH56nHaKA11MJ+/tGZ/2l/d2aUT0/oDmK+mG+HOKhb+05Aps
	vtF9TKrYBb1RmV7Ms/2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXqHB-0000000A5yu-06vU;
	Tue, 14 Jan 2025 23:24:49 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXps6-0000000A0Em-0BLJ
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:56 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2156e078563so90292885ad.2
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895533; x=1737500333; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=If/asOY1B7EePBH9ENIfCTLweb3W0bfmJ7VOYFUCEaRHibiUCKFPB/aAr0eSqKmA9C
         PvK51VsEVp9JDpBROJAQxRyYQwcHRv9wulKq/V1U1uRZg2dCNeGKGzDisS4kcrPOZEZF
         SPu1RLDiDW2o8UPOUVCXHFNz5qCpgfHDy5165ia/9IN/aAt5+BvLDq83dHgBeKlH0rtT
         AVl5GxNOw2b3wKm3/DLs8q5KRiwJ98hFPU2bR7NseQdosGxt88oEld1x65qNata+DfFo
         jL4SIUH6ZUHjZhbJ7DcoGD5G/Ys7NmzfXt/HqC0AANI8D1vTxRvD6p4X3QEvCoP4VRBL
         ZjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895533; x=1737500333;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Msmauk788mzUDGMUfQ29+G0+6TVWgLFLPWjnpzGrxFY=;
        b=JxwZB6NXaXyzUslYDLWjhdKRYukzbOcCtKhM96rBHijqY4Gr4IyVN+OVIN7fEWchGI
         N4PAtRgfL6aQLejJxQIpTdlOU2whWU1H9TzuFWS7DF/4q+tXt3+muYTDGRRP8Vgl67iw
         AkGfwC82sgWngux9CF/31tCJ0tYHXPL+wYKkYXnWAWT/PjR4msUbho5qRdqfYVMNTyOT
         SAzHij6wbIW6fHPahDjlToZTh1uEV2HZjbRx0bHSCYgIUf3AwzDzPOpj+unO4M3AEc2a
         EC/NnlNcgdgXIxzpl+g3MfY6gksrHujz34j0+KqUCU3WL3IcZ4l1xxffQ/8dMPJjHyUs
         /ezw==
X-Forwarded-Encrypted: i=1; AJvYcCVz+RZADdRp9iGtx2p/L/y7AS1UcJ4fD3x4cjxQkaBDy7dEvAujvFOzBEJDYuPymCQtEGL9Dpkkick=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3GmN1BBkOblb0bybomgr8/373oo3E+r+4BA8qiqzFB1BgGSuD
	2bQkqWOWQgIYH51H7KkA1sG9SbeA3Xi643oWI0IV6xxJReadlHql9CyVwAn8Kd0=
X-Gm-Gg: ASbGncsfRYPBGXMc44NeAkOferBV9rT0VbhPb3ra2SlqhWOBOFWxj4lDkg9WCE0zOlT
	73zvdyiaBrfsmLbYMDBDWdwpy9DDpDh6vzTfv81PKt8SzcOztB05CIl8550KSOGZKRfYGLQpe6f
	tosJtG/ZeufYnCptFIZM4e4Wy81LYNUr0/stLHvH2cRXWR5bouM7559KQOjBHP3IoK16hDb9Xh3
	lgRpJgEKc/as4WopBSYbWb1BftqB/1rLQOJsFlFzb5Lm/lycImQS4WZDFZGx+PrJ8NILA==
X-Google-Smtp-Source: AGHT+IHVlOGIv+9Uh+Dng9Z5glMQS7vdErpemdoZ1TuQIxVK5mxZMQQK+rAFLrYfNXcGXxNvYIFeiA==
X-Received: by 2002:a17:903:1cf:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-21a83f4cd36mr432431955ad.23.1736895533476;
        Tue, 14 Jan 2025 14:58:53 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:53 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:45 -0800
Subject: [PATCH v2 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-20-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145854_134972_D56ADB98 
X-CRM114-Status: GOOD (  12.18  )
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

RISC-V doesn't have any standard event to counter mapping discovery
mechanism in the ISA. The ISA defines 29 programmable counters and
platforms can choose to implement any number of them and map any
events to any counters. Thus, the perf tool need to inform the driver
about the counter mapping of each events.

The current perf infrastructure only parses the 'Counter' constraints
in metrics. This patch extends that to pass in the pmu events so that
any driver can retrieve those values via perf attributes if defined
accordingly.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/pmu-events/jevents.py | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index 28acd598dd7c..c21945238469 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -274,6 +274,11 @@ class JsonEvent:
         return fixed[name.lower()]
       return event
 
+    def counter_list_to_bitmask(counterlist):
+      counter_ids = list(map(int, counterlist.split(',')))
+      bitmask = sum(1 << pos for pos in counter_ids)
+      return bitmask
+
     def unit_to_pmu(unit: str) -> Optional[str]:
       """Convert a JSON Unit to Linux PMU name."""
       if not unit or unit == "core":
@@ -427,6 +432,10 @@ class JsonEvent:
       else:
         raise argparse.ArgumentTypeError('Cannot find arch std event:', arch_std)
 
+    if self.counters['list']:
+      bitmask = counter_list_to_bitmask(self.counters['list'])
+      event += f',counterid_mask={bitmask:#x}'
+
     self.event = real_event(self.name, event)
 
   def __repr__(self) -> str:

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
