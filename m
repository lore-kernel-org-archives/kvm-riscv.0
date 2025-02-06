Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431EFC02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XpdCpbjzIGtW6YkLD4J0LNx9vqvtpJYwuZ2PesurC4c=; b=w/bhQSTnAdDREG
	NGp864AiunMcvr1L/b68RallXu821Wccu9+Nqvk2p/B74HcnNjA76Ab+r5VQK1FshRNjNG4FvRoPz
	cZw6hmofDxajvAIqfYms152HRVAjGsE/7cRbq8+VfiVsBiXCCV4p0Xh0p2oWLk7amVXJ18fsu7h6d
	Pnmi01HBSnsqGbWTHKl5T0l13eflTf6Krfue1oA4qNj6BgcEpS1sbuaw/FTy4fzqyCZ3dENbNk++n
	gnUuvB5TXiOXt1TGLue+mTiXddcLJptVvuFCVNtMW7ppm3taL9/Y9UTprLiaM+OZraFzULZNWX1dC
	I0eCV+e+ZacKWAIY9MTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwgc-00000005eSi-01aC;
	Thu, 06 Feb 2025 07:52:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwFB-00000005YYD-2P74
	for kvm-riscv@bombadil.infradead.org;
	Thu, 06 Feb 2025 07:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=; b=kLOX4u3eiuPS5I89Uw0Q8d7N3i
	BH93Pu1rJ58z9YGeUCGPQuTJ7ZvOgx8+Dxu9gwhftfenEMZdrkoBQuV7leM9NnOseibaT+3n3pGB3
	JlSdZ5vmsFni0ZCkHWgzmcWggBS+OXiqV2L/SVxnV9gW8dPuS77vjCWmoe+UTKfiDYE1qGZ6fCPnS
	jwHDGPXk3hmv6kcWMn3I3WyMxnejlhmXINhm33J1cEPcoJhE0Rnsffiy7+BAmQxwrCNx3SvT1o9mM
	Xfc6sihoAVtA2Vq9ZzGI+dGV1B7Y9LbKB46iJwK0iVoCrmYx3kV/KkMiM4agF8lH6fDeqkzvbIfsa
	PC12h25A==;
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwES-0000000GqmZ-2gSe
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:24:12 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2f43d17b0e3so988163a91.0
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826602; x=1739431402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=;
        b=BrPiFDy76FGI+TDP/fj/cJv/czjB6vwGe7i3zMfTEWSz4F6ryDOQOhJo5t+p3D1QJh
         OQNYh/lDLwsPZ7vVFTXiAU5t4SQaCCYUa8Q44ISRsn/Uv4OcFWF6+OMEr6TFA0B4tGly
         coU4VaJNxo+G8JDxu+m8/FdHlewcGQH87hNEhXCQ25xHvarSFUTEXIdkWSXtTE2gpAXM
         ksO4vLabA0vBIJpieOCrW28T2uQq5nJYEHuAmZ4jUVgtA7PVlx8rFdIBNPbZk99QJwZF
         lum3icJB8LVp5ceJhYL3OOeS9z1h5Tt3cpnN/kDaj+KjUZs8bOEs++7AxJ7CZ/auMtj9
         OELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826602; x=1739431402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p2CXRkSzd4LW5IV8mtGWOkMlVaZyNScQT8kSGB+ZHxc=;
        b=cimM6yFNdgTqC6AoEf5WonpjKwUf1+GUg+dqCQixdE1G3funXZVRhN+suZgpsVJv3U
         UY6IouqJCVI59RcSIi1k1axxP4AWkrKwiHszGE1LyN1IQ5BOgAYHuq1tamUusWATjmcw
         HbEtVwPXAHrsI4i8loBZX+ytbUrlVQ7bciBuEZqMsoV4MdApOP8ifcCIuoaJ0D6/iEgz
         ED5NKgPdubvTKkL0t12qIxXM417+IVzJDfN/qSpp15GOwNnQqyJG5fNwJaoTjwittCmw
         J6zLNMEPN9dcNWrnU/WnWD+NrTeDs0pETOQVG6Pm/7Wv5IY/FAK0KB0iJ1PJ+xIa+NoA
         HGiw==
X-Forwarded-Encrypted: i=1; AJvYcCVYGfO136EZ21vd0Fm1SNNZXlp4a+Kl5NGTaAh3l14ZEH8pLdBz2W8xX81x/iDnqzZqSakKt0BySCA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzi5ADIp55VIa1KZHNZJ35JB0SLTShVXODJP6gxTq53yn5cRzc8
	ATxsnvoK11+L3XjGZzUH1z1MGMe0dg8dzPawTJFPcLWVtj5DiP2SXCi2EhwqNe4=
X-Gm-Gg: ASbGnct+KIDlviN8O2dhR1nwMuZmJS1HRrihY1p91nfd6+siBIw7gVqUZqFtROm1S/a
	LUImY6HZ12+RlA0qgtdEY5/CdCyAMUPa5zn9JSBAJnNxF8mb0ZO9tCiaHRL+yOvuHa4TjeM0+9X
	cw0F4ND7n3hH/W2tBJMKxNRIBAyi2MMXVFTFRDShY/LiPhPHz753wwWV8b9aAshij5LGIJEFQLF
	Ea2hRHf7jUtez7qLXWUiGKANoHgz+s9rSArOubN+JwiRQiuRwg4Ana3B6mWGwFK8ES6YrWXKC1T
	yfHj2pwfyTlaSAP2WKw1f8zVA0ty
X-Google-Smtp-Source: AGHT+IEsdW7e0nnU+hOuQNSvBNjT6hUmPYli2IAeU6lmXJs5V7j20UKpuutlBvTAACwmkO+Xy8ldvg==
X-Received: by 2002:a17:90b:17d1:b0:2ee:df70:1ff3 with SMTP id 98e67ed59e1d1-2f9e06a1b1dmr11330512a91.0.1738826601990;
        Wed, 05 Feb 2025 23:23:21 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:21 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:09 -0800
Subject: [PATCH v4 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-4-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250206_072343_146985_B8397D66 
X-CRM114-Status: UNSURE (   8.92  )
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

Add the S[m|s]csrind ISA extension description.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..42e2494b126d 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -146,6 +154,14 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
