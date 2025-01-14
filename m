Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC739E77188
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jan 2025 00:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wEG4JwNg+KKWX2PJTOZnS5lYWaKxTizvtBScCdxJWYw=; b=KgWViFuyxvZwlC
	wGauT7oi89yr2HZSBdWaQFyVU1OtZCjF7DYhNl9uW708zvM1frs03IDwZOPpPM6USeVF3RewHRLmg
	8xm0ateSo2wmO+CTyUUQEFE6X6H4qHdH9+EFbJ6LcaBGYN1olAKpTKg5xxB7uF5ipn1wMbg+8V5sp
	3Yq2Sa92ewvpslPyrWClsGJgZJtbnCBBj2Z150iFj0hn9u9pVU9641bOAnBWHHJq9i/XH7q74v0aA
	wgBgc9OtWEyFJ7uwVeKB5iaL6zB7mGoj/Dcqz2lYFgmpwJY7AOodMZQTSuhrE8YYJ+RZGR3S9g7Tc
	b9KfQNzFzTKt1qRGG0TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXr6A-0000000ABTJ-1ggA;
	Wed, 15 Jan 2025 00:17:30 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprc-00000009znA-3VDI
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:26 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21a7ed0155cso105144315ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895504; x=1737500304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nuV14UWlVLpKqlK5QJyBaxP+s4wgcBZS80Qr+dhQF8=;
        b=c1RaLdvo+aIWIlyDyFlBJcIouc2F0D+SyJHodeeL8yiv2CiyCpjZfpdXc0kJZ3PDBN
         EXUbKqPZPYBX1dC39CMM/D7YAdGdfIdscP+HdytM8LxAy1O5u0kAtrxNZ5DBkZDp4sCO
         2L94r7FqD6AzhdkC4SheeImULxZuSDQALzsx0qy1d+epNrEzvIg1apGstT6C5ZROwW9K
         dDfeR2K9uSN0JSAp9rXzlQ/b4iuMJ429xRdCyvDS3OvCtlxq8SmMMwbftqI/ANGGo8hH
         BJvNDAecwoPYDRu3RyE3DojmUO5pJFxFFbc7pVJDrJ5gHZbipM4psVP6v4GlQDQ5Yvg8
         B9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895504; x=1737500304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nuV14UWlVLpKqlK5QJyBaxP+s4wgcBZS80Qr+dhQF8=;
        b=G2Y0NOFxtQC5uzEV/w3E4vsZCaGdutf8Bnh+XpxmOnd6LY9jGgZJgVvJQCdlpBefY/
         eA9LJYlaH+syxuaYwV8IJjOQl9vPex7acCPzXMnnMLfwPKY0uN32ein6ceZ6zYHbMQA3
         zvC0zM41A/UHwdhQ+nceGq/yEgy9gpxSGZyS4VMYYWgGk8/9noVKBdsEOUoM9BngmWcs
         N+FLZiz5/hezSM+CNMco/tTG749R43trsy4Yj6Sa7aKCpUlzn+9niurdw2wfKbvuzzEI
         2+yoFyGZ6sfJUzDN4AvnXbWiy8XEH7T9UBztSmFIwd1XrDYgKL5yO4sJrigOy5Lz8RZD
         zY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUSyljR4esGmc+Pk4ob5yPRDc5KYLlZQUpAwRquQr0HzIQAuFsEUij0Ka4kmmIHwseczh0JNQRPhQg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwO7nbiIaAbjR41gBW8/QJnMshgwXpW2YAl9iHGCTBCEDSK1ySd
	TVVRZ+0yLFxRrgZkHxvifuwxzcBI/tLdyHIaaP9I3G+qqberMrVT/HU5wdLvoEM=
X-Gm-Gg: ASbGncvZmmIUD4hMXALMC2EKrJGTyCBotP7LfLr2vfhl21WyOCUpplBXaJ65tjm5/jF
	ZJ51RMJrzzrwsM1Ehxe9GlxnCkMQWaAAcu8KpsOc6trylWZEx7CBhJYtQXbHglehqLaVnhpGVjh
	59+iJx+9ef+UxSm4hjvdGsgW5zgnlcEZAe79IKCUNFbTOORhCy3YWBE+kTjzRWbPze6yQv6gI6v
	ZkdBddybmph7f9ZdXBBLHeMBA/Pat4ldPJnjaCgH6Bbzawzl9kjrNIm5SsnyAZqFebcvA==
X-Google-Smtp-Source: AGHT+IEV9xqrGE2EwbwN10kTDKoQE5y094MCv+vKIzLtISYj8DvmatP2DVPnEqTLBoPDrnLS9ZbWpg==
X-Received: by 2002:a17:902:d2ca:b0:211:8404:a957 with SMTP id d9443c01a7336-21a83fc0619mr405796975ad.41.1736895504307;
        Tue, 14 Jan 2025 14:58:24 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:29 -0800
Subject: [PATCH v2 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-4-8ba74cdb851b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250114_145824_913426_9881ED86 
X-CRM114-Status: UNSURE (   9.15  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..0cfdaa4552a6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -146,6 +146,20 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+	- const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Smaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in M-mode.
+
+	- const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Ssaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in S-mode.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
