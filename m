Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD8AC02196
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QNu8gjOegnKFjwrII5GS1jcB4e88JPCKeIjUlWmmzaY=; b=tOoxi0wot8ErOH
	ae+cX+a+wzPoSHgq77RfSrNQCKvjwCoBd1IJqA+gQBfTbJCxMRweu5/YZd1YdaWJPoLucAWmPiHNp
	/13647iMAiLHuAJ0TrLie2QgzFjDuJx2oFjSsFJ2xpqJPAEkhNCwV6z0zH/WbaViK6+LIAn7F7FqZ
	HUrMEsTaqH4DW2HFBHMM/6eJrQpotD2FIfPcr72PawGtMalLABWYpK7wtykzWSHcLV4/PJpfl4mMV
	9q+7pmuyfgW571Edi/9/vgsBgl3lRW3rQSQDHdvjrFgmmCdYDxvUln4E6Xj9lXqRdcEP+qnCeeNlb
	9KD1YbviuMpPl3s95cqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwMQ-00000005b2V-0r2L;
	Thu, 06 Feb 2025 07:31:42 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwER-00000005Y2Q-1cSP
	for kvm-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:28 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-2f9f6a2fa8dso783015a91.1
        for <kvm-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826607; x=1739431407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=ox2hM89X/h2Q7gAIvwpIenb6JJX5gJwZJPK2rjhnMlfNNrR8z1ab1XIcxjE8MltzIL
         YddkLF2u3Zz8ZLKfCxa7gv6A6LUV6HNtHUBP8VYGdf3a7B9dpmv1J6Sk7K80Bb7QPSS1
         BA6nSsokEKc9oGDyK/AYa+04LMJnXEaI6y7sBJ2FTRzfgQE8SU7cBAxCfeLUUV6Lwh+N
         nH6SH1uwsr+uOgO3BZ0uUYOW/xWTvAPT8XBm+6uJldMCDwKSoQrqRy2iptrLAhUquCyW
         07SA3JMfzlDbN8Ixx7xEZGELPhnjMz9DUbUJQ3adj+7q1lkEP0RGoC+mjLqZkubyfPXV
         tGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826607; x=1739431407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=mVZoloslUB8A9SCRGH7BCqI3f6H+8AVYIkC6+i/sZzwn2Bs16lUZPrh63Hax8CM+XB
         KRo+YhhoETtMsOCHzj+bJ6JLdW6UydQnRLkpLkBUfJk3fBudNY0tNgpOjwsMEbNO6uU5
         7/FZJLi9F9nBniJKAq1OrP22mh01Bmr6f/LG64dhdnlFAljlWFdIQrECuxUOnhIlpIgn
         BKI27X81xBVxV/U1E5y5rHyHdjhvRbuxnkB9mVbDoKESkbE/CF+7W9iQr4OHnYfbgL6R
         XBX/WEggmLgRUry5Zte1o2nbdT9+QNJPh5UOirElKkzARvenn28WFTtbrnfZyYQ8RW4K
         Mn+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfr7TsaqEH6wOhl29mVe9AgenSB/b4zAuDxn+HH1RNASdGtJo+xJSrCGR4s0d2JXGHQb6JEPMMB2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMrBjDG8msdq2ETxzy+RPvGHHH0oQNH+TQ/Vn1GBxm1R89aAcW
	Rc4JxwILNWBG9UQO4fS2GOEYa4Be2uQdplhpfW3WG6a3lfSLkK9tjyYhVLVuuYs=
X-Gm-Gg: ASbGncu5yaIO0vYvTHTp4iaj0OdRIm5JqWO5xsPU/xJ0gQDhAuK131HBkTyrBk/vt28
	C2HxsWlwRGTdXWx2jq/U3jvi0Ta3wmqw2QQL0zJOYTso0XtdsMyMD8yp7a77uY2sa40tu/z/lxH
	7Y4mcc0ZuomBJOwe/eHwlTsg2Ud3v9Y1SwmfAgQS2KDb4NaNbABwMIPE7qDMef5T8vAHxZPE+es
	QZYSemKJ4d7llQfvBBxWmol7L6zuQ6FvVEzzv7uu3agoAxdBb4BYgQZNiwF2669YZqMlRLitnR7
	BMI7fOjX+s9S1ugAmzIy1I/ZW0gs
X-Google-Smtp-Source: AGHT+IFKe2kQczxclY80PslHuvYzWPmjNnKAp1q2ypYQZ9arePKPx5YXWSLFOApkuW37i5EznoN6cQ==
X-Received: by 2002:a17:90a:d410:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f9e08682a8mr9427110a91.35.1738826606814;
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:12 -0800
Subject: [PATCH v4 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232327_475842_4AD8D5D3 
X-CRM114-Status: UNSURE (   9.06  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 42e2494b126d..be9ebe927a64 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,12 @@ properties:
             mechanism in M-mode as ratified in the 20240326 version of the
             privileged ISA specification.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
