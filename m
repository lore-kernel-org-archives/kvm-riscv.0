Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36834E77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMDz1A5zUgE3yCU9jM69vfQ0zb2mO6cL9Er2sVdhIT4=; b=H820e4VWTFLSj+
	YaV9GYlz3HWIotmhVs/3HPDRyFBb94lpmoxW4O1rMKTtDR6zhsUpDRpFSxA04UKszeWKPkmzTESRU
	Td1kik4IY/juOjNTFHvx9kuvuP4VzeUGjyxPhY2UbNiGUPChwpMAyUlPGKR7n8emJjqHwK4TmSNqj
	qIckpquDZVh7guccHc+0fHg6zWfphGE8rSipGveRdwnIqhMtnX4rErAQLeo/iOddu9CRzrM/FE74A
	RUNBDEU13TxJHAVA259/vU5lbcbBs6fYpFu9+1GxtVSqwYIN37DfgW5Q7kZMFtHZ7hLvWzSW/IWZS
	9+BVOrkOcM3pbV1UN0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpu4-0000000A0w8-44pT;
	Tue, 14 Jan 2025 23:00:56 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprZ-00000009zkX-2Q2o
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21bc1512a63so44253865ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895501; x=1737500301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=eKomhOKXC0X0PxDcx0XDbCeQkjlycL0kuSEliqEOQqVaL1gh/94ABIpKyVaBvL4LUn
         waFSWYDGiEZEJVPxdqZqrknAU9RcP1z+0wkb9TDciCT9aj9jyxToQ+PwnDdKllyK5rsJ
         rK0SmTQA66n/DKaUik7UqK/9mwIQvrbWlyCw/bDxoBqSk5pVnQz6xZHax2uXViVWhZpu
         hBo0+FtZ5b9gjJwrV0mhN2nQz/NBcfCf1CbWREg+7z3n9TWifReNR1vqFxjIPAuUfxkf
         jS58xz83HitSuMOgL4sWNVVu7Eq9M8P4qfst60enuSEeFTU9ovI8Bqs9mGgzTb8S6hPQ
         4oIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895501; x=1737500301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NxfKG65dTTWELGQSY1XBUvmc4ww6DrMBB5fk3tB2Lpw=;
        b=RYZlnRudiV5uQjXQBmsy5E67XEtFQj4gU5xDvJSX6vzRLG5gtBwgxQqSw7MztWMujO
         4AooDfwqskX08dCL1AjHXFzPjktOXW571eXGiv2xKVBOF+ZnS7l/vFk+Lt742/n03QLy
         UBPFdr7I3RY1H4/vNnucVIocPXXyesS6z7JDD0TD50hz2xHFlai/PQAB+FcfdGN6aNvt
         /CN+oe3dx0rBkMzII4nSi18+WPa2zrwIeBcuEzZv+EkKZr8THZr1Plu0runiK+m3wB/H
         QxyyfEZdiYzrnTZYuU+fxOmdqC0wh4Cs29Jbbr/jveQ3yx6noiTaXT7PACQp5vs5fgC3
         q5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUcFB4RV4cOdV6FJ0UOMyfPU6gX2Sen6VDjoryyPR3nRcB/lcC0aNty0ElzT430CgWLXuqKLf/CPPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYFMwTmzUVWwW8scGEZP4rTzMko8TIaekXYrHEi3jpxu+SUsi0
	7JhNR81PEPTWSZR4eNYpeZ1DcIR552QBH3BTZuxhhiZqz7HeXvGKn3DmTlNwsG8=
X-Gm-Gg: ASbGncug9sD9vn0D3MGIcY1qoE37eCAwLGQ6MFaaBgBJFHmmNeOUeQj02XUCkmcbtkK
	KSMIUDcTCqaCx5tqo6SMVMFgIZTv19anAtc60d6FWsSw2KEVQU3oeh7r+6PkDqi7V9ZZCb3ji6F
	sUU8QU0OJtx8ZuUY7XqucQX9VL51tYTUlxJd750KKHQJvPLa8rhOwsOs/FOi5Q1ntpcKfpMkvD7
	KOLsHIFEVreN/L9hVErdGFSRbTPsOf42esnQgYmlmMqiPAiLfxG2lPmuFRRNhritr5tcw==
X-Google-Smtp-Source: AGHT+IEFzn+BQGP9HoY9wlfnVhVEePoikrfOCZH8FHyJCqYtdMpQEJ0WBuydKODT01yP3q133TXafQ==
X-Received: by 2002:a17:903:191:b0:215:a964:e680 with SMTP id d9443c01a7336-21a83f65330mr394967985ad.25.1736895500674;
        Tue, 14 Jan 2025 14:58:20 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:20 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:27 -0800
Subject: [PATCH v2 02/21] RISC-V: Add Sxcsrind ISA extension CSR
 definitions
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-2-8ba74cdb851b@rivosinc.com>
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
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
 Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145821_640741_623BA5DF 
X-CRM114-Status: UNSURE (   9.79  )
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

From: Kaiwen Xue <kaiwenx@rivosinc.com>

This adds definitions of new CSRs and bits defined in Sxcsrind ISA
extension. These CSR enables indirect accesses mechanism to access
any CSRs in M-, S-, and VS-mode. The range of the select values
and ireg will be define by the ISA extension using Sxcsrind extension.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8..2ad2d492e6b4 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -318,6 +318,12 @@
 /* Supervisor-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_SISELECT		0x150
 #define CSR_SIREG		0x151
+/* Supervisor-Level Window to Indirectly Accessed Registers (Sxcsrind) */
+#define CSR_SIREG2		0x152
+#define CSR_SIREG3		0x153
+#define CSR_SIREG4		0x155
+#define CSR_SIREG5		0x156
+#define CSR_SIREG6		0x157
 
 /* Supervisor-Level Interrupts (AIA) */
 #define CSR_STOPEI		0x15c
@@ -365,6 +371,14 @@
 /* VS-Level Window to Indirectly Accessed Registers (H-extension with AIA) */
 #define CSR_VSISELECT		0x250
 #define CSR_VSIREG		0x251
+/*
+ * VS-Level Window to Indirectly Accessed Registers (H-extension with Sxcsrind)
+ */
+#define CSR_VSIREG2		0x252
+#define CSR_VSIREG3		0x253
+#define CSR_VSIREG4		0x255
+#define CSR_VSIREG5		0x256
+#define CSR_VISREG6		0x257
 
 /* VS-Level Interrupts (H-extension with AIA) */
 #define CSR_VSTOPEI		0x25c
@@ -407,6 +421,12 @@
 /* Machine-Level Window to Indirectly Accessed Registers (AIA) */
 #define CSR_MISELECT		0x350
 #define CSR_MIREG		0x351
+/* Machine-Level Window to Indrecitly Accessed Registers (Sxcsrind) */
+#define CSR_MIREG2		0x352
+#define CSR_MIREG3		0x353
+#define CSR_MIREG4		0x355
+#define CSR_MIREG5		0x356
+#define CSR_MIREG6		0x357
 
 /* Machine-Level Interrupts (AIA) */
 #define CSR_MTOPEI		0x35c
@@ -452,6 +472,11 @@
 # define CSR_IEH		CSR_MIEH
 # define CSR_ISELECT	CSR_MISELECT
 # define CSR_IREG	CSR_MIREG
+# define CSR_IREG2	CSR_MIREG2
+# define CSR_IREG3	CSR_MIREG3
+# define CSR_IREG4	CSR_MIREG4
+# define CSR_IREG5	CSR_MIREG5
+# define CSR_IREG6	CSR_MIREG6
 # define CSR_IPH		CSR_MIPH
 # define CSR_TOPEI	CSR_MTOPEI
 # define CSR_TOPI	CSR_MTOPI
@@ -477,6 +502,11 @@
 # define CSR_IEH		CSR_SIEH
 # define CSR_ISELECT	CSR_SISELECT
 # define CSR_IREG	CSR_SIREG
+# define CSR_IREG2	CSR_SIREG2
+# define CSR_IREG3	CSR_SIREG3
+# define CSR_IREG4	CSR_SIREG4
+# define CSR_IREG5	CSR_SIREG5
+# define CSR_IREG6	CSR_SIREG6
 # define CSR_IPH		CSR_SIPH
 # define CSR_TOPEI	CSR_STOPEI
 # define CSR_TOPI	CSR_STOPI

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
