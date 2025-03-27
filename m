Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A71AC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2T/MB245nW2fODhyFvExm9WbnYaHlXsTWHrYhKpcBes=; b=rZmNitF4+GZYGF
	8SZpxSnJiTM3YhRsjnlHBvNDwoUlSTIkWtvigwX6P0hMj1vJjDTEuziN1pWYkN3t/S2e9NjgrLgSh
	xxPqMPjJqXgf2bLXyDPTyQvwfUVxZzgeO+DXi3PsXiiTrsrktRRfppIEqE/a1E8RhWYCER4vExbvp
	iuQ+AUL7MWMOm/MKOz88iD97AjSQC0NZiSle4XMkXOnmVpTKjX1uvNd8fR/NvduoirgyuPmsnHkRb
	7FvUQuCrGOr+MAkcDaWLN6Sf5gH29gaj5vJYZiNkHI2kHxoGR3RUd9iJOtygarX3cTY4OCvy6QYay
	Gqjx8Aog7Guu/0CTZy2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtAP-0000000BsGY-37N0;
	Thu, 27 Mar 2025 19:45:29 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1c-0000000BpZB-0IaE
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2264aefc45dso39485255ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104183; x=1743708983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=YT5dUm6WNQ0YcXw1O0GoDkkawjtB5NTI9OJ16GNh0MSa8shr7otHQKhUvfpGht7W25
         mtIdmHQqp3xbG1n07qlUwTHB6w2dif1l0udOxEt6u4qWTaGHVWVugCQAWUkmzK+YutOa
         87Kv0cLD37NoriWrLTQpQ1mku5ASeUjc8Yl4FFjgjRD74a7a7WV0o4wov5jx/cNsh/tA
         ljiwilB+i5L9kIWULzC75+z2oFuITbeAAqiGeWzUopgyYiWfc2pGt2UpqQ87tiDFCX1K
         1hqo3pWQnkBrF4vFzD+yfI1PTC/n4DcXDc/CR6fmmK2R5yhqWahJyV1BcYRUxziYQ5t4
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104183; x=1743708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=Qwb9/RTPh8AlKVucNuwGW2qVX75eO1jXdLImTtfejGShS790rsr33ZVzaJJ9AHGN5q
         Em7yEVqCzDpXnbfi22aqz/Z5CK8F8Gv+02w6kR+5ZZD/Jkmzn3exUlc2DQY/XaxA8ZvQ
         /56SggzkowOhSesQcg7OSvjPbIUIwwjYZvhZL3B9l4MbEzSyPjGcaAluDEZEbnmT7wC7
         OhM+/J0aqF1NIiK+ifavEnxS6Y/oy+a1dpXJwqb6Eqrbis6e+uBcbqwxtq7U3VcwS20n
         fZ2wb6LvL+XvzN751ZPeo1RU36ETxY/wHQDnTYtXWZlDaKaLYR/ebvuzvrl4F1/OjYsW
         BhlQ==
X-Forwarded-Encrypted: i=1; AJvYcCWABIMduESTN6ME8kXcS8MEhIZFlfxQLJQtjkm4LBmuQ40B+FV6JpsNPYcMbDZiQ6ZiQganMSpgym8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxX5XAd5HhnhIv+wwMQ8ObS/2o+MFhHqHnn2PNY2H6hnnqFbfPu
	K9ouZgwTUD2J9r4dmLQ9AghAmK17EnOKvlWIiSfulj0aKSWJ0M7MHYhmg14Y2wI=
X-Gm-Gg: ASbGnctFyGUXLzY2+Lqpo04xXEvFaxzulOq9ei+Sc+I+gzgAsQB9xDils9XFbsvp86I
	efeHHjRxdB7ZfUp9OLmQ3lnFGCUrc1ZJVdvotyGZRjbgSO8fdz97cP4smqNbs3bP0KiR9JtoMOH
	YB2IqRMnkj7rtlnAeyB1NzAl2cL/ftReMTteqg5yDwfVEzL5PA/lON2U/4oGgfE+4DiA/Ug4+vz
	/69FXlHRSX+o9AYqRRKlzT1d/XZwjyXPjWjg/hPv/2SN4dyVyFsdmbc3M5zM17pywlcqtG9ECji
	7z1OO8bBNg5hkxNTTTgYL5dnWv1yv6a5xa8+KKkFhYT2nJgkRkbVrwEUYw==
X-Google-Smtp-Source: AGHT+IELdinWh4rp6i4iXWGA5H/t+4IAyyZGzK+iwJMmKFoXazqziiKFSDj1cayIDmLBdm814eH0Qg==
X-Received: by 2002:a17:90b:5686:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-303a906c678mr7028440a91.27.1743104183029;
        Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:48 -0700
Subject: [PATCH v5 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-7-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123624_148667_FF6D3877 
X-CRM114-Status: UNSURE (   8.88  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0520a9d8b1cd..c2025949295f 100644
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
