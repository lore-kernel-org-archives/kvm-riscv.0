Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B9DC36013
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mBJkYLShlmhT7+nH379Wn7SzON/QbGx8FMsDiwc6xXo=; b=ZPTFUL2kUXmZXE
	7C2e1ywAT7koAC0WVxh+oI63ezUB44q8dIf5bwpLO+usmP4clWO+VnbaHdOA3KtHgAyWMBGi6t1kp
	9StoOYXkESJwJ8wY/PLhUYvTA9GcEYfMNgXu+2VV/64+UMIzrabOKzeFRtER2ceTBIzHf8VWRlhpv
	piNY8Hyb/BLpg7eK7sLCfOrbKB0Jq/wi7kwRhSds01OISg+ODNGKvK9MMQKbQPlMdnJihQlAzkxiS
	yjR2h9JscCIr+onbLzSMrtevWaJ6/lckBL2O5dgPkrwk1k5a8JL+bb2l4Inv0+SmE8komClzwx5Em
	NqmndvNeTsBW8YE5QYpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8P-0000000BrT7-2Uoe;
	Thu, 27 Mar 2025 19:43:25 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1W-0000000BpVx-3Ina
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3014ae35534so1991839a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104178; x=1743708978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=PwVBWpSGX0jD0UwvozDu0KqNWDPI0iWH8jEEUx0AdQufkmZtOD9VJIWkNL80S+h3LV
         liPxuHKVKUx9Ji/nzhtmaUfExxhp6z6xwwQAH/JMmgFpwqfjsTLZzcuq3FGOmGpSKuti
         mrUaOSOpmvE+areIbpjF2AA7bDImMWWYW5KtcB/DekOtTCCWoSokqbicnAoRBs3SaegB
         37qzt/+AUFxNLG0ePZHClDHP9Z66c1yZJYQfhSGj6dECWDtH9exc5onpi4SYelFmkF0n
         s796QysiCLAb87+hUs1ublyKx+m/KcBpHIE9sPjvPmmSh4dMBXdmQEIYLe0iJXnOyJEN
         2y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104178; x=1743708978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=t17z6+01sfeQ5NJB5PZwnf1Sg75WHFRHaM0ERAaKFoUUSui+ikenLE389kR4LkWWFf
         gQhBY1+yh3R87VKv2StcBzMtafxM9SnH1Co06PT2CPYEYHfNCVvwpNQJ9pDEVkZgKJFr
         IiDqmUPdl7mK5SxzVE3vDk4gMKuKtonxmi25I1CqBOTCyJQaz8SkWUGjU/kI1jGOhVAs
         speCqhWUo3ZZec3CCNe8CXC6YrNf7Usax2vNnuo9WtgP6fnMVWgceu6cJfwR8if4zchY
         gxPLQrNpY7VdTL1kVfWG8DAyrKqDtAlyFtJXWRaiP/cqA8HaAdyrsKJCuN7PJr9GiYet
         2ESA==
X-Forwarded-Encrypted: i=1; AJvYcCUdeGlsr5AM4cpGh+OFdM1mhRGhCkLLxhPXjWVfbKiVToyj28NGYWkb6Ey8WiYWTjGM0rjtrnGCeNI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz49Qp/Tur1DvDcrqC3WB9fegaTIF42UKP4pcWbz0CtQDUj0/s/
	aOdHHFwG0GnHPeqR48sUx9FwPnRzOQnpCr33z+JuFpFPDZi4QkWgHzZ/T3fEVBc=
X-Gm-Gg: ASbGncsoi/K4th2Y2jHDAaBo8dB6/rBsUNJl5voAvhtnLT/9S0oGvUZdGx0aJl7L1Qf
	7EpxE0EvizSh6ICp8a9BPhwP2V/NXjHq9n/mLo/f6vpBzJgBi0Cvsgyj/b0LHjubRtAwoLDGKoJ
	7NcYbGt/twTfU0t6ftmSAetlr4hjrYH0/YBleHnXH+4x9vr+Ymp0wl3xdmx7fthQBovl/Ns2eVR
	AjHGK0b3r6IXMCMlM9eOfSdY0KXca1zLjNGnAK3AZcBEkK7wPhSIpBnAc7iq6RhEDUIHJf+C4py
	wNdgkaLcz4+M+EY+hnYoxKnb9C7L4JWPxfGISqb3OaTNk4zSYKa1kf18AUUMQ43NLH41
X-Google-Smtp-Source: AGHT+IFOxM4SmbXuuTZ7zfbjNBSt3NF5qSX8XxUdDdxMSJ9Gbp2tgCBb+BZDCQPwqEBKt7x+Gq+pcQ==
X-Received: by 2002:a17:90b:2801:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-303a7d5b724mr6622802a91.5.1743104178125;
        Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:45 -0700
Subject: [PATCH v5 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-4-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123618_843896_759A9C1E 
X-CRM114-Status: UNSURE (   8.87  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..0520a9d8b1cd 100644
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
