Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C8AC0218D
	for <kvm-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JMvbAPBEwDecFmRwRN7gHYAcEnKuWiogljMyvoFEzag=; b=e/EiK9xznhJXLU
	936r3NoshVY3evaPt1ZXq6auaywf/dVtiUVX4vtyrHuMdcxG3D4n9o3QD3qw3jnQemaZbIqREHtX4
	s289WHX4VVtid9WEdT8QxyO6HqaszLIfgHArFu46/mEGMOWDCaBw5d6iDv/ujC8P3XtVEG53XMkJ8
	7dbS4q4D9G1xGARNSESyAu7DbpvWtTgAB2rj29eb0ZcV7CbVg1mDEsI4xYa5zd7vTkWyNz3+Att81
	sUagXDV8ko0Ubm5MdFEGVol8garqfxig7u1YgS6gYgSJPQxbMGxfq/1Va6vwLxZKTpezlg0VJqn8Z
	fUTy+VroOwmy8135nXeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdqg-000000047ED-2azN;
	Tue, 28 Jan 2025 05:09:18 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhf-000000044Qf-4BsJ
	for kvm-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 05:00:02 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2ef87d24c2dso6874762a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 20:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040399; x=1738645199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=BLl0w0u+Rgg2Pe8VByR9MEq67LxHIKU/63faSH8as4v5TEv9zvBEPirLCl5rkUQ9lR
         CkLez/LMZq+usBV+eYiuJoYDPBzunqATkMrTqjEbD4w2hy4Id1FTDjR4UJekLsl4pAXl
         kMXQ0MdgztEvp/VJS+CvNFCTw93dA2UVIeaUs7u1wza3JI8zLQo1TKfip9O+cqLyHNcl
         XJrCqqcmZfklvYjJqX019drzcOegJB/KxI4/aKjE9k/J5+pEFS83zdc1yM0rYioe0Q6t
         uDmnuPEB2O9G1jzi3e/BVLd/mWj6JWNMvKBAW9OC1MhloB3SBAliI4s1WAJ62ZbRm2s3
         mLPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040399; x=1738645199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qaBtUmcc8yUuB4kb43/yPbo3SeenY+DY+wt99rutmtE=;
        b=O3K9gpdX5hc6Gfq79aM89CMU/oRtQ6XoGjCvukm3+JuEe4aIfCeAJkHfV7OfuDMBAi
         fRdGRPPMgcIfW9Kl6xQj5idgG/TGzT6W8l2+qtMwr4EBOsh1uMJBUMPsxRKZlMfTBBbb
         j8mzJpa+aZgc++Xyp7GcX5Izw3fveiAAX1PnUQWaG/SxTyrqZ4VXB5QECCfrYp9uKNrz
         wV1iN9iTFxxqQJT0BrAdMEUpscFijy+8ZC1GxN4CuGuAMT+etWoT7PEqeLOZgUoqwvuR
         HXf7DWYOsPeZ7WpVy8qyMDdlFIAeC5e87agx3b+LeZ1741GUUZQJfcWm7eyaonzOiyYW
         zT1A==
X-Forwarded-Encrypted: i=1; AJvYcCWoQm1ALt09zeRYXr5PnvueOA9tw6RE3nDPbWWnk2yDukdmLIsM04Ud7SbEbnt8glhrjXFM9FG8GA0=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+GrRx40jNin7b3ISUhrBjNcJEhrrMirACR7lYGeulVHYx2E/U
	G5+Hn122lgeLcEaC/2yJlf3GMopMF/+9DSwnlH/0mDVJpAg6Ba4Fs5FjRtZies8=
X-Gm-Gg: ASbGncvYz80nPf3kagy2sQ2EDeKg9coULj00bQ1yP1mNF/dhsUgkwEmZ0EurroXioRd
	GF/5aGxNzm8xZnYa0AWfO+BE1OQBKT1cRQiTwZuR3IgLeDNzzV4z1sqz3BLrM63ilm+MYQplmVY
	rFSvwyeWUHX/pTuo3mRuDwG2bZC0DV0JCzkey7rKQTB1N58lIfvtg8vvGZsAE/2PMtdfmhzLyG/
	L5BHqmCA860tOt++6c5OQBpkYPvX+4C4b7MBzTxz3GQeVaBOXB81i/heu7o0hGdSqw6FuBKSxSf
	W1XoRY9RgBaYV0dFyWUG6pQad3dl
X-Google-Smtp-Source: AGHT+IGvdsN2QjvjEdbxBM8fo2c3ojaIC5oAQTKaWVxAx/Vzcck7YYYeeDIBW3vl6CdvOvXnZUnWVw==
X-Received: by 2002:a17:90b:3a05:b0:2ee:c9b6:4c42 with SMTP id 98e67ed59e1d1-2f782cb68fbmr68628638a91.16.1738040399051;
        Mon, 27 Jan 2025 20:59:59 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:58 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:47 -0800
Subject: [PATCH v3 06/21] RISC-V: Add Sscfg extension CSR definition
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-6-64894d7e16d5@rivosinc.com>
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
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_210000_047397_192D9B48 
X-CRM114-Status: UNSURE (   9.98  )
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

This adds the scountinhibit CSR definition and S-mode accessible hpmevent
bits defined by smcdeleg/ssccfg. scountinhibit allows S-mode to start/stop
counters directly from S-mode without invoking SBI calls to M-mode. It is
also used to figure out the counters delegated to S-mode by the M-mode as
well.

Signed-off-by: Kaiwen Xue <kaiwenx@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 2ad2d492e6b4..42b7f4f7ec0f 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -224,6 +224,31 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/* HPMEVENT bits. These are accessible in S-mode via Smcdeleg/Ssccfg */
+#ifdef CONFIG_64BIT
+#define HPMEVENT_OF			(_UL(1) << 63)
+#define HPMEVENT_MINH			(_UL(1) << 62)
+#define HPMEVENT_SINH			(_UL(1) << 61)
+#define HPMEVENT_UINH			(_UL(1) << 60)
+#define HPMEVENT_VSINH			(_UL(1) << 59)
+#define HPMEVENT_VUINH			(_UL(1) << 58)
+#else
+#define HPMEVENTH_OF			(_ULL(1) << 31)
+#define HPMEVENTH_MINH			(_ULL(1) << 30)
+#define HPMEVENTH_SINH			(_ULL(1) << 29)
+#define HPMEVENTH_UINH			(_ULL(1) << 28)
+#define HPMEVENTH_VSINH			(_ULL(1) << 27)
+#define HPMEVENTH_VUINH			(_ULL(1) << 26)
+
+#define HPMEVENT_OF			(HPMEVENTH_OF << 32)
+#define HPMEVENT_MINH			(HPMEVENTH_MINH << 32)
+#define HPMEVENT_SINH			(HPMEVENTH_SINH << 32)
+#define HPMEVENT_UINH			(HPMEVENTH_UINH << 32)
+#define HPMEVENT_VSINH			(HPMEVENTH_VSINH << 32)
+#define HPMEVENT_VUINH			(HPMEVENTH_VUINH << 32)
+#endif
+
+#define SISELECT_SSCCFG_BASE		0x40
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM
@@ -305,6 +330,7 @@
 #define CSR_SCOUNTEREN		0x106
 #define CSR_SENVCFG		0x10a
 #define CSR_SSTATEEN0		0x10c
+#define CSR_SCOUNTINHIBIT	0x120
 #define CSR_SSCRATCH		0x140
 #define CSR_SEPC		0x141
 #define CSR_SCAUSE		0x142

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
