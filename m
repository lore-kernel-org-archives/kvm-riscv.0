Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF88E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c2bZquAw2G0uW2UZqFzBRFQXCeUFuw+9O0CzpnmPm+E=; b=St/HNwT6Uf6lMB
	a8iNuLhAn46EXHG93lyN+KuZvOk0Or6dA1jH+YpXjJhV6xvYrOfPCxEnE0/EJO8ORPWroOoVt20o+
	9yPWeZHajMCGY2OydfoVzZxBxQt3WPSEPS5yyvyji9GnZQ2qd5K0+j/L6v1TDfSVZHvLLdfs8b9n4
	ojIH0QV8rUtkG75EZ+BmHUKIZmj6VMIcoJ4nfC5NwPqaE4jtKnQxfPswKr9J1hKhce+p1sisgwCGT
	p9M+1135WuLTMv2c+E/GEfCKQo8O4K41RKRV0PTkX5tnD9NawJPjVb7vN9ojF6xdb//vqJLCYQmXJ
	SG0wkpd1MKM1An2IICvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq1Q-0000000A3OY-2nbY;
	Tue, 14 Jan 2025 23:08:32 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpro-00000009zxf-09o2
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:37 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21619108a6bso106387745ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895515; x=1737500315; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RSUuZKac707LuCWRbpc/uEIITHPwqnfXyOde6qyF0KE=;
        b=hIibI6Nlr1ur+7L7XHczZGwErHg1nYHltQGM21xf35ebQlwqgMVhyxGo89T5SDyi0O
         iEcQlU/YanYKjemorRGf0hfwLJOeKY6y90sN9hzVH95too4oklHfby2/g56naOdZ90IN
         VfY1A3jGUDwecodGu5TThoFZjVvHnOi7je50gzr+48tTvVUlW1r0TTtdHRJG5sPmG4Ee
         PvfbR4zrMVRh0rcpqJgl5onHZr7x7EFXhptzjdxm9yUHluvNBXY4eBrf/NbvTOTq2z9x
         aRp9i/9qHg0vh/GbUMbKnvFgP4WhVv+lOhOehaHPQfWDL1YNBLZGSko5QHy3SUyWedAp
         jcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895515; x=1737500315;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RSUuZKac707LuCWRbpc/uEIITHPwqnfXyOde6qyF0KE=;
        b=WmaG+OkW+MKvE5rpQdnokz8cH2b8HdrvX0MRt/0eNdJuq+9hwzDiVqh2m6PNTHE497
         odzxhXKPbpF9NbGe707l8bZgAZsCvZ/j1U/G5ARnUJFy4pVQNmpP3G8k39GvFSIOzZM6
         a1n1uBNRRPXZjmfp7u3w27d890PGv5hbesoBH954VOuFJ1eF/zZ/fM88Vde2kRHqQ1jP
         sJ/CPIG5c1SMuLVL2S1XKk3q52/Wa4yFczwKfgHTc6OSl6+iY2QUKm4Disq7Fj1j052y
         g/9K6ZlOfzjLTfCoOCO8bZyzhIgUSp/RfguuRROxY/PkW2yOWP4LRZiehkfprGsceW0W
         LP5A==
X-Forwarded-Encrypted: i=1; AJvYcCWK+vXNqYPhzK8whJdaaC4BMJTiNcPLmLuNHGDbjMdM/EQJLtsQSoeMSN35Vj4/3hZfBP9RRWanP6Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7CWtw2Z/kZqJe1RPR+iacf8+EtxP6hhP4vLturEDemEXnq+ck
	mJiF47GZfKwhm5Wrp1+7w/rkJIZeoHm3JR2DCFt2R3YfHQyWo6us6+YfpCLIa6Q=
X-Gm-Gg: ASbGnctVt9iq+bp4Ukhn33TG5lfxoob/SSqcNqD9yF8+v7yImSuVTLr9mO4eKU6H6PG
	fMFgvd2YanZV201llEB/cfNQZJhX8CO50A7XVVyqgw772x78sVCZfVtp/OXbq9FIYXpjky2f5M4
	+MTFVEZdJ5GWogBbKFYkxs+slsPpKU4jtNHIhCh04FHFj/oM8YKLvtBqo3QW/ivU4oBOwyXOB0m
	/lkINWvvZN1yooJvU1oM9OvoWFyQovsdgSB+dn55B3BBMt4EZXJ2hEEXcrSeX1DFjIvEQ==
X-Google-Smtp-Source: AGHT+IEVXqMvOPJKvg7ygF7bUQZEZYrWqGn1DZ1M4rQTQIthH3shh5ppL8RzzhsKIbon/t/bsr22sw==
X-Received: by 2002:a17:903:41c3:b0:216:6590:d472 with SMTP id d9443c01a7336-21a83f4e4f8mr388644205ad.21.1736895515542;
        Tue, 14 Jan 2025 14:58:35 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:34 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:35 -0800
Subject: [PATCH v2 10/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-10-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145836_091196_7D0075B3 
X-CRM114-Status: UNSURE (   9.60  )
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

Add the description for Smcntrpmf ISA extension

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c8685fb1fb42..848354e3048f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -135,6 +135,13 @@ properties:
 	    directlyi accessible in the supervisor mode. This extension depend
 	    on Sscsrind, Zihpm, Zicntr extensions.
 
+	- const: smcntrpmf
+	  description: |
+	    The standard Smcntrpmf supervisor-level extension for the machine mode
+	    to enable privilege mode filtering for cycle and instret counters.
+	    The Ssccfg extension depends on this as *cfg CSRs are available only
+	    if smcntrpmf is present.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
