Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43679CD98D5
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dcJv15zqjpqvNxYPznJ75ncByLCp3P0+bNEBA8Qth0=; b=Z+aNbUsLdNZzPK
	HQZ13T2gz8DwXYBIrRr5Xuz2P+CDsrh3HZ6OfI+SzbHXaJqsdlY4wbxsABNfDVs1O1gBoOTKYN6hv
	wVfkIEqeKtT/W+MrrScWwCd7jnaOibLEIWzrwnUtsX4KwJB2wOnaSNzBJ0e0Il51YCRky97dkfkDU
	o3rpdPliT7a4xQgQX+VuDiLnN9ROEDZYsY0Q4efgvQtJV+Hm0x0ljhoGCE4cOGlQQ5M8/I1pQES6X
	r7lrGJAN8x67saB/XyHqPZtjq5Yv+RFthY+r5zpH7+IE+XrPjO4Q4rY97t6peqNwjOoPStARZcP0/
	OJ8gEaz5EH/MMm0K05zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmN-0000000A0gO-05Mq;
	Thu, 11 Jun 2026 20:13:31 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmK-0000000A0ed-39vh
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:13:30 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2bf22d29dabso1886315ad.2
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208808; x=1781813608; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gm44aTTKOxWn0lKZi70AX96tEsXQQm8LgJ40+/hEF0Q=;
        b=DePJmWYOk/eaP6ZFvoAyopRonmF5EijYI/pmlYY7E2Izms5CmV4C638V3EamKovUxG
         gCW+97emA352r+hnaNwN4BMEOO4G3nfdO2MlqQmsykoTq7hSq8HNiy09ECXv5v9EO6ts
         1SLfrodm9AcvAcagWkiLou0zdQRsAVTfDcJI3sFHPeFc8ABiXOFjRAgQt+faLJ3l7JDL
         1noH6PpYOn6gUfqSb2InJqO1RJiYpveGmLeuOLWSuF/1NK6hWCP0396hYHyWmuSz2P0G
         FlG5Ccbpjl5zFFmZInT+5ld/C3iLOgnk6/lNcvb9uAbXSXyi+pHW3vk68rkLbt4CPRud
         Hxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208808; x=1781813608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gm44aTTKOxWn0lKZi70AX96tEsXQQm8LgJ40+/hEF0Q=;
        b=ip0j9VNHLXCfMarm4faWuf5OcJ8k+PoOhWzHp2AXHrRdaLDTQiovsbDpmeP4wkczLl
         YudJDEQn9dLnpveKbryCAhKIRiCoRz1xQI4qwfGnOPc5qlSCOD3zE74HWfBR0anb3Nt9
         ahcbkPrzEUdwpV1Y9PiagDaarnnRDhrs23mclJDT9ek8uM+1UwzUCxJixt5jU2oK0Rxi
         PNHPbVBWfS7jCmsuVpvKvLhf14qddKFqWqeoeJnf/7XieVGmIgXCIWXMj10kLGfZLE3x
         SWBHOgWtU3Td2pYueDaa8wqctnfVGUlWJXLBWsfKSCjPaA6C1q4f3jfRSOsiPyDwlYl1
         kW/A==
X-Forwarded-Encrypted: i=1; AFNElJ/+GaUplCUjydw3Or8X4gRdy6cVHIkEL72KwMf1c/UIitUcKjbAVJVLiR8OBpEdTJNps7KzbHKFWmA=@lists.infradead.org
X-Gm-Message-State: AOJu0YwZaGSiCVdf79d7zt62OkvvzNfj9Qfbn3ld2wmiZlB1dohyNy8W
	KuwTlvetJOcFxd7j3Tda2oCAOvmqV/3K/KrOrqfQIu/U9yH28as+ukhb
X-Gm-Gg: Acq92OHJAmoTzBxnyr+pdNa9GH8IspvQbUW2sPg7ZwI/2rTwesblV2ZUPioJ0QMvnZk
	Z0RThxywytiuEwLWOTaSw8cMOXAJbsahrtbAvz0GwLomc6J/exnIS3YsVItXasb+27BLTeilLzq
	vMJD7p7T5I8lzQ1hOtTt87i9nVwMdnVsSWOOOdp3z9iHMBRsKxnQQiizy8oy61WE5ORpEZwWgNZ
	17PU822Jcmo0M12+D0WlMP8UnN1U8bS4xuRJ/KJN3MVoSnL/zYODF/DBbywhdUXXxZMxkAwVjQH
	zc6R/YYopni4F/rxhiNZF2amjBLFsw+VCkTe85qGWfZ3K+IP81UyDaOILZdvdVdSCcmrbotv1bG
	jQVMu/wdVVSA/tZ0jC6IBaJSs/tUgKqDzF73B2UGQCjil7QjB4PalKCv9NLm+GJkqViByApuspw
	==
X-Received: by 2002:a17:903:4b46:b0:2c1:6259:cda8 with SMTP id d9443c01a7336-2c2f22a9f06mr51888325ad.25.1781208807828;
        Thu, 11 Jun 2026 13:13:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:27 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:40 -0400
Subject: [PATCH v4 03/16] riscv: hwprobe.rst: Document EXT_ZICFISS and
 EXT_ZICFILP
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-3-3f01a2449488@gmail.com>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=2231; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=q/QLrWSGJJhQtCezKRc6txtE+UkVnOpKgnOg6fjEGdI=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQMhX89b/jK+JCRn0MornigW9b3hyMPzwofO+E6Zo
 OCz7+rMjlIWBjEuBlkxRZbDR1uyt77yifZ9zvkDZg4rE8gQBi5OAZhIxBeGf9qm976639f69W0V
 w+nNF3xEdGem/L+z0GGNnnNgRX2FMgvDf7dtpZJc33bcTb0lVM65UDi3+C+rk0eI372LQmZHZb7
 e5wMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131328_798578_C4AC5D34 
X-CRM114-Status: GOOD (  11.10  )
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

RISCV_HWPROBE_EXT_ZICFISS and RISCV_HWPROBE_EXT_ZICFILP are defined in
the hwprobe uAPI but are not documented in
Documentation/arch/riscv/hwprobe.rst.  Add documentation for them.

Link: https://github.com/riscv/riscv-cfi/commit/302a2d45c2435940d9a63571c66bc038adc74133
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
---
v4:
- Update the commit message.
- Cite riscv-cfi commit 302a2d45c243 (tag v1.0) instead of ff03d8485a04,
  per Andrew.
- Add a Link: tag for this citation.
v3:
- Also document RISCV_HWPROBE_EXT_ZICFILP (bit 63 of IMA_EXT_0), the
  sibling enumeration to ZICFISS (Andrew).
v2: New patch.
---
 Documentation/arch/riscv/hwprobe.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index a09a8f16bd16f..d9928641deb99 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -289,6 +289,11 @@ The following keys are defined:
     defined in the RISC-V ISA manual starting from commit f88abf1 ("Integrating
     load/store pair for RV32 with the main manual") of the riscv-isa-manual.
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFILP`: The Zicfilp extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: Deprecated.  Returns similar values to
   :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`, but the key was
   mistakenly classified as a bitmask rather than a value.
@@ -391,3 +396,8 @@ The following keys are defined:
 * :c:macro:`RISCV_HWPROBE_KEY_IMA_EXT_1`: A bitmask containing additional
   extensions that are compatible with the
   :c:macro:`RISCV_HWPROBE_BASE_BEHAVIOR_IMA`: base system behavior.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
+    as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
+    extensions specification, ratified in commit 302a2d45c243
+    ("Update build-pdf.yml") of riscv-cfi.

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
