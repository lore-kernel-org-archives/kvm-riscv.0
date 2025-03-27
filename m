Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8EFC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 21:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mh+8Tdmf4EtwRgl9fu86r9PZLe2j2pnQWsIwAzAVZig=; b=DKvBfEv6nlGWp4
	aGFHG6GS86RM2QGSHIt/6QsG00cFqs1OY5jMzlqRqdNF3kSJAGnWmaRzAziKlqlroega/KtliOWgW
	Ga35jXyoxZLazFcFQbmTp+OZW2/I5x6NGD7lMXnV9pirqYdPfV/BsuMvDmY4gUtbI+a5DMKslvO/i
	KHxxyP6nKmHFNjrr1tqF1/4F8Ci2M3J5Dpn1k4e2JFZfiutPO32tqZBSDTc5gtsnty3I45EXldri2
	SwVE7qr1WuyDJR1NaqMZsWsSbCSv2N/kwKHHybqsjQvWkOOYDgbYT8sFJERzkLbWgkftDVK+2nia0
	l6Ow5G4t84ij6HmXxrpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txuhg-0000000C4C3-09wv;
	Thu, 27 Mar 2025 21:23:56 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1x-0000000Bpvl-0XE1
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:46 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-30332dfc821so2018188a91.3
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104204; x=1743709004; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=WmT5DqthND+pjKic26cmthSC3RR9tqQHHwX1OQ+ci6w4D5MYoW2aYccRDknpClMV8R
         AON28wGSOdyADemHRVeM1jnaRjukuRyJDQ9RCe/SvInFiiKqAGZmgCtGYSDyM45jSlZ7
         dWpTCcl2vzq+A0tyBICfyadWhCF0L4sYsqjE7XkqzbbeDBEMjy3ctSr7D8Sfdni5UQ7A
         EhAXIL4kVDHAfyKTEN1Shr083uLOJKuiSTMCmxcvmXgQ/kVt3iKdjM+qSA7z6YI70quY
         Oua+HtTEmcAZ/t/KGQtC67ptUsnnQfFpuXGH/AA+Fq3zlOyZdfPgTO3sybWOMsMEzJk7
         ZxlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104204; x=1743709004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=prlp5XqgI/Khif6kUiv5FMK3OMCI6nzVA7nLGH/Y3s4=;
        b=aGN8ILED1ok8vVn7YtylOSy0IVsypOZjIzmSSTGSz2E+kvsgkZgjR3ZRmxLk1kgsTo
         Ke3xTj3vMMEV6e8MQfMLXqy0FP7ZYWKjnIswju1bpcMNbMoxBhTnFbDEX13Othx0POkH
         AtThLBP9oy+QwZQ+PULgszVRr2o8kwkNbhaZYYSvupLj7qFoRPEfniQBXXkQqdfEfcaQ
         NDV13Bsb0/qQmB81yrDI6FUx1qxYCdLMWdnmv1t9zWhY08EgKj842NH4aXIH2r+VHNTx
         iP8j7x1xwSGIgTXsBU+ZPr4mIrNRu/qtHDLwEYWY8CqBBGomgeoCcl8dEONCeb4CrEBS
         giNw==
X-Forwarded-Encrypted: i=1; AJvYcCXMGCDorTZFj7/SAccMofaKt63MoJ4/RbUAPCqWWIes3sfxZObUm5IVNBIaFldltPeAcMqTPy5u8ho=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjgNuWkfaRAqhjtfd9IcunLdmYlUoA3LUIgSvn+j7je0nnWKR+
	h/F90BskqoBQWjXZmxImpDIqWpcJ3KPOT4oHgHVX05/QoLjV6E6YcD42+rE1ZBU=
X-Gm-Gg: ASbGncvLxkcJ1kfLiqnpe2+ejMpi3lmHvV0X0c+4smPdgsOeq3bJMfqWYhqwpS5lW8S
	OrrTbQdxfOb5CbIrf+fEpIIUjLI2q6nGWdk9p3QO/sxNiM178yQoYCDQKEVRsCkT7G1ZP+QJq5L
	An9IhibG+dZPAm2c0J7BCg8OlM/QX18d217AVH7gtoz2ahIq8yd16svX/djaqWBSng+o75+ACzn
	K9XI+CCfLCmz3InYnKBtUXQzpgmTFnHwDIZbRUYWuXAEG6BQuAAZUtsNKXck4uDxOelh4ozv1eF
	PWhrMMEo85fp9iO/KzyfAJu1HT6YIuwtJ+nuYJBBTLnE3b0WEnMZgSD/5IsQKQTbloLR
X-Google-Smtp-Source: AGHT+IE9RAtJmcVuiq+zzbza3XZnuj5S63rmVXq5BX9kQPkvxkIEVWCCAKOhZGnJte5v86VybNNn7Q==
X-Received: by 2002:a17:90b:2dd2:b0:2f6:d266:f45e with SMTP id 98e67ed59e1d1-303a7d5b6b6mr8384578a91.2.1743104204412;
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:36:01 -0700
Subject: [PATCH v5 20/21] tools/perf: Pass the Counter constraint values in
 the pmu events
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-20-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123645_279615_0EE08EC9 
X-CRM114-Status: GOOD (  11.75  )
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
index fdb7ddf093d2..f9f274678a32 100755
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
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
