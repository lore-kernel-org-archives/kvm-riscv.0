Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE611C0218D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w/JcZNi6r+Om2Qk9Ftt54F8+LTCOaS+31yp7MlW4jYc=; b=Vt0BXgcBmQX3W1
	zZgFh/pmP50KmT1WdqQt5dy/GOI5yrU3uTopC4GOLPJ2jg+CgzpERgpLTHmSX+wxvFskLh54zqUBf
	t0cE5otKDxsy+N/SYCWgRTF+OwZjHgIi3k5QbQ7h+kcvbr5wpvg5VAgSNw0BCECi+VXuT1Y2xn9iz
	yECUnffDCj0JOtJ5QM+kBjqQ1+Um9yHLqpIJ8+GzbEuN2JB7YdoW8pq9qf9DygyDC2PO5Tvvr1VZz
	GaMaI4a9M7pXTBTtcK9lJ02JItRPFC1dHDb9BRUPyvIkJfK+5lVWXkBxdAxtcF6qI+FK5IqloxhYE
	qqJ9//nhXDhXSOWXb5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcduT-000000047yB-2Fj0;
	Tue, 28 Jan 2025 05:13:13 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhl-000000044Xv-3vjN
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:07 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2f4409fc8fdso7986532a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 21:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040405; x=1738645205; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8nwB5ijQXYUTHkLWAXohil6yVgl/NyKIaGqyFvphby4=;
        b=vcIuZBy8zDTAtQ/fDnv4gkLnTLIaf7QS8Qu0m1JQcn64TMvCRcxB4IyBN8duevhAD9
         nBHds543sJHMxz7Ju7q8ihgsyFdFvL/zP5SqvmQkY5IGoonXfcvV8f0LYFlymKHbWO3N
         vtH+XUxNs9ydsMVNiI6HaTYS/7SUw5P0Ajn2GgFCr0kYDrKeIzFdhR4Budx0zrRIfwBX
         63mwGLANqQ08ERVjmfuByDq1wov/zqrfXh9ID647dQPjuW9NTih/ea1Fk3xDg9N+bv9q
         FnhKLqv2xI4c/BPgKp7Q9bz1Ul6Kid9TpwBazbmCLKamy3Nj2ym+IMD3rkkV7S1qwnZP
         KNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040405; x=1738645205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8nwB5ijQXYUTHkLWAXohil6yVgl/NyKIaGqyFvphby4=;
        b=BwDClQ/xWvDoOOjtTBo9Tbx+AQOJralbJ+uzjIslR8eez0Pi455zzZrgvCZN26JtcW
         UjwSZUHhkz0+GgDN3gFHfne4CUxgEw3p2D/0WaAkzqmpU1smOgT4e2OLIDZcbX0O2fe0
         9Gio8FtTAm18RnaZXgJxzDnmsv3FhRAZCotfxYVVcloePlm+Gd08UKhdDgfbuVkFGztS
         w+6noY8f0D2rQnAJ+mpszAxVqxphKnMR/VJ7aQypENluh22Z3RqSO+6CFdt6JR1E1oZF
         uvROLz8toIP0BpJVIMndyAsVJktU4W2BeV4R5Zjllnl4GomI7JGlpjsY8JVXiThCrkoY
         cybQ==
X-Forwarded-Encrypted: i=1; AJvYcCWaXgy88v6pZIKxQcOnz4TlR1iCZqrqusv9ZU8etaho2kUDqCtYvwuDD46Jo4IeDW9JCGRmTegJdgA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/NcPD1unr2mTbtDbQ7/vXXKhlONZd2vH69FgW4vo13QU1O6xE
	FAGIQZQ5FL7D/9h8w97lnbXMtCObPxP7CVS/DgjAA/JTqinp4mP45dIQjOmJqT8=
X-Gm-Gg: ASbGncueoQ+GHncf25BOcH+osh/AVDcljcLBMc/wkkWvbud7m21X6fbiWqFmXJ7/Jmt
	aPuOnp49PvgFvEe2PEuxRbEtYgrcxVTLv2le1P2BVO8TsDCZXb9SUJcafz5+hdB3CVchBu0acoa
	u49kY2MRdwgQOLsJpWtK7/MFFzdjA+YrSN8qqCrRf4PuGLPV/cbNx0eAI1BogvYPHfVu6av+Axh
	axxl+BP7ShFok9szIcm3XKbEzXiUDnIYk2+/MWmmx9oXn5g59B8O4qOm0Zdl3kAC0/FIbzyJGTc
	1M/G5cXru6PDuU9txQpHzz/r7t+k
X-Google-Smtp-Source: AGHT+IFrXpURXC6IeRPpOGWg3/tFzqB6mJrEgvaEoQuFlLXK7BO3fm1YNKQtwAqXg3g7vbpjjvAXGA==
X-Received: by 2002:a17:90b:54c6:b0:2ef:949c:6f6b with SMTP id 98e67ed59e1d1-2f82c0d31e5mr3090153a91.13.1738040405414;
        Mon, 27 Jan 2025 21:00:05 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.21.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 21:00:05 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:51 -0800
Subject: [PATCH v3 10/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-10-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_210005_990157_E113D6F5 
X-CRM114-Status: GOOD (  10.58  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 1706a77729db..0afe47259c55 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,14 @@ properties:
             20240213 version of the privileged ISA specification. This extension
             depends on Sscsrind, Zihpm, Zicntr extensions.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+            The Ssccfg extension depends on this as *cfg CSRs are available only
+            if smcntrpmf is present.
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
