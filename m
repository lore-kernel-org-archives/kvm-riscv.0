Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97DBACD8C9D
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ul0XpBH0TTanqnbzpcHqOlra23lTagbdMhL0s+2HeZs=; b=IU3m75YaLROWAU
	0adzmIWBdZ5+ziK4lvZVEUGk8HL5NowgGf3wCFp00DqKD4ADFVQUKz5ErywpLj55mJ6aRuPvMG9oT
	DYBnqfaDX+dhSj0wDJiePsYCdXRoxnY6+vonUTnz90FSkJKV+tkHyym26MXoYlZyBjrGKPJ3wEojt
	YDCdqQXWdq86VCfpY3ah6DXdEwSpCWpBO0Cl9pe6AvlcInBbnRKW7ap/ZJ/ILqsn0Hb6o2ogTQ3cz
	jQAF+UiWQ53IkJliGNJBtNzLeRg+F8oOh9DV/gGrSyBL9N0uIK6mCAsx/1kd34MnD9pEqQOTjQ5T2
	r3wy7FQsfxowVdWTKaQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmW-0000000A0mV-1Q8W;
	Thu, 11 Jun 2026 20:13:40 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmT-0000000A0k7-2fWl
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:13:38 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2bf18c30bb2so2479325ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208817; x=1781813617; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sUHzJNNbv9fARf1kiavOMFeITLw6MRu/nyeIaC2w1m0=;
        b=guCC2OduBReKDXNkg/+nNSMvbFjgrRRchHGnrahsqEHO2V0xcAsLb8iXZFgnbY2xeb
         4wHTafCn70xVDkyDv6LqFDDD4SNAFqIckVNx7jAgElXbxyFme6SQsWWRoXHFkRRXeFM3
         tCIhKi6ONxwmIYaHt8+sF4VfnfD1n1jd+Qpx6OidFf3yZETtIfTuMoftGHuUk7gXev3I
         JUuBm1eYbglayNhCr77Fxrfel0e/IvMO/R6eXL3ZnDInOfkDlCaBjPQ4gMn1bPJbIPoa
         zOTMFRKbU8BTRhcIMbglBf1213f/lzajwilrYLCwz8S3ShfSKHlHVaFJdQ4pioWcJluQ
         9dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208817; x=1781813617;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sUHzJNNbv9fARf1kiavOMFeITLw6MRu/nyeIaC2w1m0=;
        b=BgvwWH/sFx32e7vjMYMBvyv1RGiot2dviKNraupDFQULmt2AY2hMFwZ88RCrLsV/5y
         vknazMwSeehp60Pp1RsP8dsmvMGnuJBewJAidRqy5NGBI6RQJIGUqblbqwJdc85qWOt1
         kcEP9zjI1qwJKMS4FRLf/RPIOY59yhCoiuH2Iq8E6p5dmgCd8z8KjMWsc+6YuWc4fgYv
         9Swj4qAgmIATlnBvPy846dGTInQI2J1sSUbVmemZVLKQJwnW7tNzI2znn5Zdp/OuJlQH
         iO46q0Av6367UzZHkp1RfpzLXOL9E6aQ5vfIWfO4gMtqJrpjVo7Nvblu+5LoxF78zLGg
         WdKA==
X-Forwarded-Encrypted: i=1; AFNElJ8ZJ4zEz/jIt9Mgi73kfxEtdqkrJsZBW97xncPyUwS13desnPlgVEuffLIxLKVU3V/qBtR+bt/lXhg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdPIoCxzgtP4CQBT8wc0QZZ7sf3TZSKcVmwIogE5XianT18PyJ
	a011Yv6jOYPXPMK4Gd7SxRc9SBlN62Vklhmtz4hWlFlPtEiG7u29vM7m
X-Gm-Gg: Acq92OE1HxPT00rLjmmJXiUGI6QrBFr4OXOTA+upkog8tyvLSnIDw+P7df7GcUFr94V
	aYEBQuDo+5qMoNT683HgP6uSVlN/QB1TdVKGPgCJvqmYxnCCwrXiNADajeOfqs9nqFmNDd0N1b2
	Oq7rkSTR6OzwuydKS4R78v/AGxacuQMejp59pPFsqF/MJZIN6M7qqYkgs7pSLvsNmpRe72MJg6O
	u4o1uz+qYScJIkL20TZZy9qcCeMrqw6iAnijh79EnKO66HlVAl7selLbOYPdEQ5uOvk92pYuMzA
	POmxIe+XsYkKkZelbJAbKjFmncdr3I/q1Ym8hgyeypnqKGZ5COrTyRNehBjxgFoRNRrWYUWC+0u
	ju9Dc27MUpAUOOPjomG2AKODt+xZA7QYWvNydipeb4TPlXijdXlfaoV7ljUjvlWMwPsFOJuFUKA
	==
X-Received: by 2002:a17:903:2411:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2c2f2f5d6cbmr52411075ad.35.1781208816610;
        Thu, 11 Jun 2026 13:13:36 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:36 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:41 -0400
Subject: [PATCH v4 04/16] riscv: Standardize extension capitalization
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-4-3f01a2449488@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=16653; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=26LS+lN/QELqDRNCimxty9TMbCTXDVj7wNQ/rrcK48E=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsQOZRYGTjtf9/6r/20vVMCmd5V/F2ZnJDt8fb2z5u
 vXDvLDPHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRQ28YGY4/mdzcnmSrEF7S
 v4ON8VqKsKYb+1x9da7ob1YiHY0plxgZTtqdvfCIQWZ7QsGjVv0N1fdtFppeiu76OGudUDLXbmZ
 rLgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131337_696403_2FC588F8 
X-CRM114-Status: GOOD (  18.58  )
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

From: Charlie Jenkins <charlie@rivosinc.com>

The base extensions are often lowercase and were written as lowercase in
hwcap, but other references to these extensions in the kernel are
uppercase. Standardize the case to make it easier to handle macro
expansion.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
[Apply KVM_ISA_EXT_ARR(), fixup all KVM use.]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
Acked-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Anup Patel <anup@brainfault.org>

---
v4: No change.
v3:
- Collected Anup's Acked-by and Reviewed-by.
- Rebased onto v7.1-rc6: two more occurances between -rc2 and -rc6:
   1). isa2hwcap[] indices added by commit 41337097f2823
   2). the T-Head "v" workaround's clear_bit() added by commit d272b8d2dd132
v2:
- Rebased onto v7.1-rc2.
- KVM_ISA_EXT_ARR() consolidation moved to its new upstream location
  (kvm/isa.c); host-side checks now use kvm_riscv_isa_check_host().
---
 arch/riscv/include/asm/hwcap.h     | 18 ++++++++--------
 arch/riscv/include/asm/switch_to.h |  4 ++--
 arch/riscv/kernel/cpufeature.c     | 44 +++++++++++++++++++-------------------
 arch/riscv/kernel/sys_hwprobe.c    |  4 ++--
 arch/riscv/kvm/isa.c               | 16 +++++++-------
 arch/riscv/kvm/main.c              |  2 +-
 arch/riscv/kvm/vcpu_fp.c           | 20 ++++++++---------
 arch/riscv/kvm/vcpu_onereg.c       |  6 +++---
 arch/riscv/kvm/vcpu_vector.c       | 10 ++++-----
 9 files changed, 62 insertions(+), 62 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 7ef8e5f55c8dc..44bf8c7d8acc5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -10,15 +10,15 @@
 
 #include <uapi/asm/hwcap.h>
 
-#define RISCV_ISA_EXT_a		('a' - 'a')
-#define RISCV_ISA_EXT_c		('c' - 'a')
-#define RISCV_ISA_EXT_d		('d' - 'a')
-#define RISCV_ISA_EXT_f		('f' - 'a')
-#define RISCV_ISA_EXT_h		('h' - 'a')
-#define RISCV_ISA_EXT_i		('i' - 'a')
-#define RISCV_ISA_EXT_m		('m' - 'a')
-#define RISCV_ISA_EXT_q		('q' - 'a')
-#define RISCV_ISA_EXT_v		('v' - 'a')
+#define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_C		('c' - 'a')
+#define RISCV_ISA_EXT_D		('d' - 'a')
+#define RISCV_ISA_EXT_F		('f' - 'a')
+#define RISCV_ISA_EXT_H		('h' - 'a')
+#define RISCV_ISA_EXT_I		('i' - 'a')
+#define RISCV_ISA_EXT_M		('m' - 'a')
+#define RISCV_ISA_EXT_Q		('q' - 'a')
+#define RISCV_ISA_EXT_V		('v' - 'a')
 
 /*
  * These macros represent the logical IDs of each multi-letter RISC-V ISA
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 0e71eb82f920c..ff35a4d04f85a 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *prev,
 
 static __always_inline bool has_fpu(void)
 {
-	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
-		riscv_has_extension_likely(RISCV_ISA_EXT_d);
+	return riscv_has_extension_likely(RISCV_ISA_EXT_F) ||
+		riscv_has_extension_likely(RISCV_ISA_EXT_D);
 }
 #else
 static __always_inline bool has_fpu(void) { return false; }
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index f46aa5602d74d..686dde3ce3b98 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -84,7 +84,7 @@ EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 			       const unsigned long *isa_bitmap)
 {
-	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -146,7 +146,7 @@ static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 	 * Due to extension ordering, d is checked before f, so no deferral
 	 * is required.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d)) {
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D)) {
 		pr_warn_once("This kernel does not support systems with F but not D\n");
 		return -EINVAL;
 	}
@@ -189,7 +189,7 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
 	 * Since this function validates vector only, and v/Zve* are probed
 	 * after f/d, there's no need for a deferral here.
 	 */
-	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return -EINVAL;
 
 	return 0;
@@ -224,7 +224,7 @@ static int riscv_ext_zcd_validate(const struct riscv_isa_ext_data *data,
 				  const unsigned long *isa_bitmap)
 {
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_d))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_D))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -237,7 +237,7 @@ static int riscv_ext_zcf_validate(const struct riscv_isa_ext_data *data,
 		return -EINVAL;
 
 	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZCA) &&
-	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_f))
+	    __riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_F))
 		return 0;
 
 	return -EPROBE_DEFER;
@@ -490,15 +490,15 @@ static const unsigned int riscv_c_exts[] = {
  * New entries to this struct should follow the ordering rules described above.
  */
 const struct riscv_isa_ext_data riscv_isa_ext[] = {
-	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_i),
-	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_m),
-	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_a, riscv_a_exts),
-	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_f, riscv_ext_f_validate),
-	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_d, riscv_ext_d_validate),
-	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_q),
-	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_c, riscv_c_exts),
-	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_v, riscv_v_exts, riscv_ext_vector_float_validate),
-	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_h),
+	__RISCV_ISA_EXT_DATA(i, RISCV_ISA_EXT_I),
+	__RISCV_ISA_EXT_DATA(m, RISCV_ISA_EXT_M),
+	__RISCV_ISA_EXT_SUPERSET(a, RISCV_ISA_EXT_A, riscv_a_exts),
+	__RISCV_ISA_EXT_DATA_VALIDATE(f, RISCV_ISA_EXT_F, riscv_ext_f_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
+	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
+	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
+	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
@@ -897,7 +897,7 @@ static void __init riscv_fill_hwcap_from_isa_string(unsigned long *isa2hwcap)
 		 * marchid.
 		 */
 		if (acpi_disabled && boot_vendorid == THEAD_VENDOR_ID && boot_archid == 0x0)
-			clear_bit(RISCV_ISA_EXT_v, source_isa);
+			clear_bit(RISCV_ISA_EXT_V, source_isa);
 
 		riscv_resolve_isa(source_isa, isainfo->isa, &this_hwcap, isa2hwcap);
 
@@ -1105,13 +1105,13 @@ void __init riscv_fill_hwcap(void)
 	unsigned long isa2hwcap[RISCV_ISA_EXT_BASE] = {0};
 	int i, j;
 
-	isa2hwcap[RISCV_ISA_EXT_i] = COMPAT_HWCAP_ISA_I;
-	isa2hwcap[RISCV_ISA_EXT_m] = COMPAT_HWCAP_ISA_M;
-	isa2hwcap[RISCV_ISA_EXT_a] = COMPAT_HWCAP_ISA_A;
-	isa2hwcap[RISCV_ISA_EXT_f] = COMPAT_HWCAP_ISA_F;
-	isa2hwcap[RISCV_ISA_EXT_d] = COMPAT_HWCAP_ISA_D;
-	isa2hwcap[RISCV_ISA_EXT_c] = COMPAT_HWCAP_ISA_C;
-	isa2hwcap[RISCV_ISA_EXT_v] = COMPAT_HWCAP_ISA_V;
+	isa2hwcap[RISCV_ISA_EXT_I] = COMPAT_HWCAP_ISA_I;
+	isa2hwcap[RISCV_ISA_EXT_M] = COMPAT_HWCAP_ISA_M;
+	isa2hwcap[RISCV_ISA_EXT_A] = COMPAT_HWCAP_ISA_A;
+	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
+	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
+	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
 		riscv_fill_hwcap_from_isa_string(isa2hwcap);
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 1659d31fd288f..f8f68ba781b45 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -88,10 +88,10 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 	if (has_fpu())
 		pair->value |= RISCV_HWPROBE_IMA_FD;
 
-	if (riscv_isa_extension_available(NULL, c))
+	if (riscv_isa_extension_available(NULL, C))
 		pair->value |= RISCV_HWPROBE_IMA_C;
 
-	if (has_vector() && riscv_isa_extension_available(NULL, v))
+	if (has_vector() && riscv_isa_extension_available(NULL, V))
 		pair->value |= RISCV_HWPROBE_IMA_V;
 
 	/*
diff --git a/arch/riscv/kvm/isa.c b/arch/riscv/kvm/isa.c
index 1132d909cc25c..94077117d1136 100644
--- a/arch/riscv/kvm/isa.c
+++ b/arch/riscv/kvm/isa.c
@@ -17,14 +17,14 @@
 /* Mapping between KVM ISA Extension ID & guest ISA extension ID */
 static const unsigned long kvm_isa_ext_arr[] = {
 	/* Single letter extensions (alphabetically sorted) */
-	[KVM_RISCV_ISA_EXT_A] = RISCV_ISA_EXT_a,
-	[KVM_RISCV_ISA_EXT_C] = RISCV_ISA_EXT_c,
-	[KVM_RISCV_ISA_EXT_D] = RISCV_ISA_EXT_d,
-	[KVM_RISCV_ISA_EXT_F] = RISCV_ISA_EXT_f,
-	[KVM_RISCV_ISA_EXT_H] = RISCV_ISA_EXT_h,
-	[KVM_RISCV_ISA_EXT_I] = RISCV_ISA_EXT_i,
-	[KVM_RISCV_ISA_EXT_M] = RISCV_ISA_EXT_m,
-	[KVM_RISCV_ISA_EXT_V] = RISCV_ISA_EXT_v,
+	KVM_ISA_EXT_ARR(A),
+	KVM_ISA_EXT_ARR(C),
+	KVM_ISA_EXT_ARR(D),
+	KVM_ISA_EXT_ARR(F),
+	KVM_ISA_EXT_ARR(H),
+	KVM_ISA_EXT_ARR(I),
+	KVM_ISA_EXT_ARR(M),
+	KVM_ISA_EXT_ARR(V),
 	/* Multi letter extensions (alphabetically sorted) */
 	KVM_ISA_EXT_ARR(SMNPM),
 	KVM_ISA_EXT_ARR(SMSTATEEN),
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index cb8a65273c1f0..70640701310c8 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -85,7 +85,7 @@ static int __init riscv_kvm_init(void)
 	char slist[64];
 	const char *str;
 
-	if (!riscv_isa_extension_available(NULL, h)) {
+	if (!riscv_isa_extension_available(NULL, H)) {
 		kvm_info("hypervisor extension not available\n");
 		return -ENODEV;
 	}
diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 6ad6df26a2fd4..bb11e6757d349 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -21,8 +21,8 @@ void kvm_riscv_vcpu_fp_reset(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
 	cntx->sstatus &= ~SR_FS;
-	if (riscv_isa_extension_available(vcpu->arch.isa, f) ||
-	    riscv_isa_extension_available(vcpu->arch.isa, d))
+	if (riscv_isa_extension_available(vcpu->arch.isa, F) ||
+	    riscv_isa_extension_available(vcpu->arch.isa, D))
 		cntx->sstatus |= SR_FS_INITIAL;
 	else
 		cntx->sstatus |= SR_FS_OFF;
@@ -38,9 +38,9 @@ void kvm_riscv_vcpu_guest_fp_save(struct kvm_cpu_context *cntx,
 				  const unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_FS) == SR_FS_DIRTY) {
-		if (riscv_isa_extension_available(isa, d))
+		if (riscv_isa_extension_available(isa, D))
 			__kvm_riscv_fp_d_save(cntx);
-		else if (riscv_isa_extension_available(isa, f))
+		else if (riscv_isa_extension_available(isa, F))
 			__kvm_riscv_fp_f_save(cntx);
 		kvm_riscv_vcpu_fp_clean(cntx);
 	}
@@ -50,9 +50,9 @@ void kvm_riscv_vcpu_guest_fp_restore(struct kvm_cpu_context *cntx,
 				     const unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_FS) != SR_FS_OFF) {
-		if (riscv_isa_extension_available(isa, d))
+		if (riscv_isa_extension_available(isa, D))
 			__kvm_riscv_fp_d_restore(cntx);
-		else if (riscv_isa_extension_available(isa, f))
+		else if (riscv_isa_extension_available(isa, F))
 			__kvm_riscv_fp_f_restore(cntx);
 		kvm_riscv_vcpu_fp_clean(cntx);
 	}
@@ -89,7 +89,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 	void *reg_val;
 
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(vcpu->arch.isa, f)) {
+	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
@@ -102,7 +102,7 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 		} else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
+		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 				return -EINVAL;
@@ -138,7 +138,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 	void *reg_val;
 
 	if ((rtype == KVM_REG_RISCV_FP_F) &&
-	    riscv_isa_extension_available(vcpu->arch.isa, f)) {
+	    riscv_isa_extension_available(vcpu->arch.isa, F)) {
 		if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 			return -EINVAL;
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
@@ -151,7 +151,7 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		} else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
-		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
+		   riscv_isa_extension_available(vcpu->arch.isa, D)) {
 		if (reg_num == KVM_REG_RISCV_FP_D_REG(fcsr)) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u32))
 				return -EINVAL;
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index bb920e8923c93..5cc7ddd4aa276 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -770,7 +770,7 @@ static inline unsigned long num_fp_f_regs(const struct kvm_vcpu *vcpu)
 {
 	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
-	if (riscv_isa_extension_available(vcpu->arch.isa, f))
+	if (riscv_isa_extension_available(vcpu->arch.isa, F))
 		return sizeof(cntx->fp.f) / sizeof(u32);
 	else
 		return 0;
@@ -799,7 +799,7 @@ static inline unsigned long num_fp_d_regs(const struct kvm_vcpu *vcpu)
 {
 	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
-	if (riscv_isa_extension_available(vcpu->arch.isa, d))
+	if (riscv_isa_extension_available(vcpu->arch.isa, D))
 		return sizeof(cntx->fp.d.f) / sizeof(u64) + 1;
 	else
 		return 0;
@@ -878,7 +878,7 @@ static inline unsigned long num_sbi_regs(struct kvm_vcpu *vcpu)
 
 static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
 {
-	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
+	if (!riscv_isa_extension_available(vcpu->arch.isa, V))
 		return 0;
 
 	/* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b9..f26108a4e601e 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -26,7 +26,7 @@ void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 
 	cntx->vector.vlenb = riscv_v_vsize / 32;
 
-	if (riscv_isa_extension_available(isa, v)) {
+	if (riscv_isa_extension_available(isa, V)) {
 		cntx->sstatus |= SR_VS_INITIAL;
 		WARN_ON(!cntx->vector.datap);
 		memset(cntx->vector.datap, 0, riscv_v_vsize);
@@ -45,7 +45,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 				      unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
-		if (riscv_isa_extension_available(isa, v))
+		if (riscv_isa_extension_available(isa, V))
 			__kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -55,7 +55,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 					 unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
-		if (riscv_isa_extension_available(isa, v))
+		if (riscv_isa_extension_available(isa, V))
 			__kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -154,7 +154,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 	void *reg_addr;
 	int rc;
 
-	if (!riscv_isa_extension_available(isa, v))
+	if (!riscv_isa_extension_available(isa, V))
 		return -ENOENT;
 
 	rc = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size, &reg_addr);
@@ -180,7 +180,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 	void *reg_addr;
 	int rc;
 
-	if (!riscv_isa_extension_available(isa, v))
+	if (!riscv_isa_extension_available(isa, V))
 		return -ENOENT;
 
 	if (reg_num == KVM_REG_RISCV_VECTOR_CSR_REG(vlenb)) {

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
