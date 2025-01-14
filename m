Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385BC02185
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iPulnMVZa6KsjO1NLEs8qh/TrztMLy3J3FSnyellYaE=; b=c+tTKwZeHTiYQS
	ntq3XVvEb/ZmPi1uXaRMzSnQd14PDbCf9i4oWEio6y7vcK2nEocRPli4yiaVEk1BzivhlTlNHWk3/
	U6cceYsfEn7L7RwDIhFS6FjS/+i1b8thSdRwqFaujn/NK4mRwk4f/jm9Hz56VsVEOXbj80arstwSk
	+61qKYEExTAkAtgQgT0ySJHlXtOUi2gIBBKmZD0FZy7RK3hmzxlek9WjFx20h+7bXM44m5JlKPYff
	caXGXx5jNGr96hSkeHBeH23CJfQVY813fbne02S9629f5scP1tEBbB+nWuQc3qGAuD/af2EGv9bQ2
	b59xPPHBvr+UCZ1oUg9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXq0E-0000000A2u6-2iuo;
	Tue, 14 Jan 2025 23:07:18 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprk-00000009ztx-0Fyq
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216281bc30fso129167065ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895511; x=1737500311; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=;
        b=MWjMAqs597lTfa866kir08rNQRJggDW9ayz98Q+PO9Bnei/iiUeheatDCY9DWRO9IZ
         NYplY+0NT4f3cWYLiU86mQpoELl0/PWnBJai+7pxWVr45XGIKwbCWE0QAhtssk0C/ZbZ
         kuc6otg73HuWnko6hpPvmBjFP39ErXqKGecezD7EWYOfWz7t0yDbdXEftfxHmTpBe9ch
         Wm5FgM/yf0cio2clsSBJPxcvLAlRYyT84+bSbaSWdczAyl5913P4XC2MBYvBTVH/3mwp
         iknL8ZOoa41rzhCTf3AD4lAQZMteIuqYKgKsW6Mbm1UaTCnzYS00RVJxPpqQuV7B+4ne
         /pSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895511; x=1737500311;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zp+Ban9UqcPtxcekhEzEgx0H42XNY1XoD8n/tlKqBKQ=;
        b=lqi8WFRdeZznoIxezLoCTc+knqW26xzk1u/ZKogJfglihhy6WRW5ugZGRtjXSguslf
         6934cUTtAXzR+qvP+YIGLWMPEWO8RWibWoRY1SdUV+QT6LKBdkpPsRg8owUjxnbQyBt/
         UiGY1R3pEdpMCuy0iMXUYBEZKGufNfdMSscjteXGbwQH9cNFXSKoWn1A0apctcY/xc8o
         DuQ6sTyWs5mbr5jscgMCXW5EaO69URAqLzEpRfX8ErqZHjejK862YEK32TdXSMi5gpi/
         L9H9I0cQnSZdrl/L3hcUC+GHe9uOay+pZA+MtUQ5L91lEFvLynywj8BwRV3nUczMk5fO
         8AMg==
X-Forwarded-Encrypted: i=1; AJvYcCWZesVxxEz65Jp9bHwNntdrjXyoewg5olpYhjNhe+lMF32yN5nv0KFClVnbpRaLYOvQdfpKpFOry1k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzruGViNKcjaXkFeq+s1RkwBrWZjANRDX2MZ/MPoT1XdBMw3Y7m
	cQbiXpKNkLEZCYj3v+WiPm6s9sihgrVG6IDVdjtsCxM8sy4QRUCfBRzdObRtL8w=
X-Gm-Gg: ASbGncvhEg0k+zCgmTEGACCvYL34OUkRnFygE0LRSlvclHUhjWLa3aH0yDvo50d/Zwu
	zVLPAPUECntZXOxY0K8rCzR+5YBOCwt/x1uB4P13xmGFWXCT6eh68cAEjXRT6EhCvndCDalp7IR
	4pZGka95I0P/vsmayAY75eN5SU+Etl1WyiCIpiSrRmi+JXdY1bSKzccHPsp54lsibkP6d2348FS
	G1Z500IXBz5cLi/uU9kiCx8+Zxd1fr+HrvBWPsAZV2Eh8xdSsicW77TdALUzoLl4VL3VA==
X-Google-Smtp-Source: AGHT+IFw2aOxa/RiLQrRWKk2z3D3w1uFmOOWORKNifbT2/MJ7FdclBZ5ykBjK1s8a/t6cnrYBG/h2Q==
X-Received: by 2002:a17:902:fc8f:b0:216:48dd:d15c with SMTP id d9443c01a7336-21a83f65a79mr399235235ad.27.1736895511537;
        Tue, 14 Jan 2025 14:58:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:33 -0800
Subject: [PATCH v2 08/21] dt-bindings: riscv: add Ssccfg ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-8-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145832_117914_A10B8ABD 
X-CRM114-Status: GOOD (  10.85  )
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

Add description for the Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0cfdaa4552a6..c8685fb1fb42 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+	- const: smcdeleg
+	  description: |
+	    The standard Smcdeleg supervisor-level extension for the machine mode
+	    to delegate the hpmcounters to supvervisor mode so that they are
+	    directlyi accessible in the supervisor mode. This extension depend
+	    on Sscsrind, Zihpm, Zicntr extensions.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -166,6 +173,12 @@ properties:
             interrupt architecture for supervisor-mode-visible csr and
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
+	- const: ssccfg
+	  description: |
+	    The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode. This extension depend on Sscsrind, Smcdeleg, Zihpm, Zicntr
+            extensions.
 
         - const: sscofpmf
           description: |

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
