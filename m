Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50DA7CD484A
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tkB96acYI9apfPscZQrF/VZgTnl2QBR/v2CuR/ZKx/w=; b=RLTU1AjEvsdKCl
	RlGwJr0HTNCPZ5/jmoLo5OHSx1D8Nx8VSmD9W8/huz/kmpzhLhYnHYYjTDz/I8jhkyAElGQN9lfJX
	4zY/pXyTOh1KxDs0brUCRqbVgVdzLQZJpECBSHja6MC2DDr2ko2MncnuTmS1N6BZeg7H83UVZeTyc
	t4MiT6LPN2rclQg5BUYfUi0pu2/D3T+riYUQVkBFpWreGMiukoNFPgFVSFl98+mLT33ZWLmlNqXPU
	g47AvbVmL3Qt1PoBXgbT8hkH66G7oEXVBH7Umn1qnYrbOS1ub/a5a9+Hot5ImqTkpQX5egJGutZxJ
	X8LttyE39iIe4OoznHrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQog-0000000Dlue-1ZP7;
	Mon, 11 May 2026 13:37:05 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQoc-0000000Dlsd-43RK
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-367cbac9cb1so2147479a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506618; x=1779111418; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TPones0CMg69Qw/g7AOw3hQVfu6a1CKbNx1fE/9O+eU=;
        b=tgDr0jZKMfowTH7JIvp3rZFbOh5BOHnCVQuksMt5INQR5tmYoqagnlYKfWWIDUM4ca
         V8OKwbSdNeRTL9TnEfilkO2bgBGYbbb3O31JocEgg4SP9x3LzrQiv7+/SkufGGu1OMjX
         qeswgVNu605yWtWYDcCmkwIwMMMQWPm4JscyP3s//e2S4cK2R3QKYIJGiqsk2r1PSjYE
         aKdcBPk28Rbikm6caMtYw3bhBgMyxUywb62m8GEbT8HnFeGrhUJCp40AvfiBSmr7yQ9E
         FyHRJkq3O5ZLN1l9/D7udOK5hKHClI3leWwn98Jwh4AKuU29E40th+sFfCr+8xuganTQ
         oB1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506618; x=1779111418;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=TPones0CMg69Qw/g7AOw3hQVfu6a1CKbNx1fE/9O+eU=;
        b=AULt7XXs2+qhVFDR7BGGUsUuhfPy+RHoNqSEK7GeM1D00j/4HvW4ED6HGdWgVztWec
         4ke5aON8tHhfG85DULkPhJSKzbYXnfbuKu9/8Udw981m3ZLtSlKOPsPwaVsJ5a3g4f5s
         Mzhkiave+IAsvwPgJIkItqB4VhEtcgo4nGLjmaktWhOp7F5Yamw+nRAy/DtzE1EknnJ6
         hKm4WIb/nhs1l8qmuVV7WVb2KVza1miGSAnCIDZjN+r2ApZEs4pK01+lQJTJPnHJTvHb
         8WNclvuBF6YcQYjFuzTf7YjXhanoQ/na6dpqcTqr42goLfH9+++BR7j68wC7BdJogkWg
         6pgw==
X-Forwarded-Encrypted: i=1; AFNElJ8ND6gaIyjt75yWe+koFCN4FAMe6aUXFaooUM/jvsnaiuaD75q6/UBsEDEIKXWy85v1UxHKKMeO/2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxTJj1ctZPtC+E7yYCzLTN/FWX2uj6u10Cpf+QSFqNLi0DKK3DE
	/t5tAT8ayajhB/hAyCw6Ej5R2jy9JCwgOe4UesQ9Bv1qu8Z92g1enJdVwyIfN4K6DGs=
X-Gm-Gg: Acq92OGWurJKbNw183Iv7RZdFXF7Vqwfn7U8kLkcoNoMn+80q5HHCV4lbLQogME94yS
	jla+nl0tADIXbOVtcYdMclzdTxHcEQHXMBFxiCr77MBs07EjByFbu4pzFxZeVTLDo5az+Kx249J
	lsnq4/h+vpFJCYqBcFD20OUXYzFbevEh4XRA2XpX2I7mvv59dc59MNfnVXLGLtm1RShWfHSkjqM
	Dn2FskdNLC2w7ClqEe+ChHbSxuhzBqY8QV35vfszJx6zbsxUi/2sS6rLT5Q+Px4iiaRIwPu1oxt
	OdfTKHIYsmkS6OjcLcxnra9zuEqpaaYoofifXF3Ngr8AV11k/laJl007boPizYrEKJziztkGv+A
	zjSX/hNKfYDUMa6bN2hr2VRMvXnsG0GjpN0MGwq+Tu1f5HnwpskPvvxKtFyDJkXVel3qjF+Vtkh
	ezgvmH+pg077s7hJe1LeaqLPqqKqbWy2f6+jDa3fmVf4M=
X-Received: by 2002:a17:90b:560d:b0:366:4adc:c51a with SMTP id 98e67ed59e1d1-3664adcc836mr14871897a91.11.1778506618357;
        Mon, 11 May 2026 06:36:58 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:58 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:50 -0400
Subject: [PATCH v2 05/10] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-5-21c5a544f1dc@riscstar.com>
References: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
In-Reply-To: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063659_103046_28F2CCD6 
X-CRM114-Status: GOOD (  15.66  )
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

From: Andrew Jones <andrew.jones@oss.qualcomm.com>

Add Ziccamoa, Ziccif, and Za64rs to riscv_isa_ext[] so they can be
parsed from devicetree/ACPI ISA strings. Ziccrse is already present
in cpufeature; this patch only adds its hwprobe exposure.

Expose all four extensions via hwprobe through new bits in
RISCV_HWPROBE_KEY_IMA_EXT_1 (RISCV_HWPROBE_EXT_ZICCAMOA, _ZICCIF,
_ZICCRSE, _ZA64RS), so userspace can probe each of these
RVA23U64-mandatory extensions individually.

Rationale for the validation dependencies added for Ziccamoa and Za64rs:

1) Ziccamoa depends on Zaamo.  The RVA23 profile prose was updated
post-ratification to spell out the Zaamo reference: commit
2b218613752d in riscv/riscv-profiles ("Improve description of
Ziccamoa (#224)") reworded the rva23-profile.adoc (and other profiles
that include Ziccamoa) text from "must support all atomics in A" to
"must support all atomics in the Zaamo extension" [1].

2) Za64rs depends on Zalrsc. The unprivileged ISA manual src/zars.adoc,
integrated in commit ebe06adc22cd ("Integrate profiles as Volume III
(#2771)"), defines Za64rs as: "The Za64rs extension requires that the
reservation sets used by the instructions in the Zalrsc extension be
contiguous, naturally aligned, and at most 64 bytes in size" [2].

Link: https://github.com/riscv/riscv-profiles/commit/2b218613752d63287286b5ae801b820cbd8cc10c [1]
Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/unpriv/zars.adoc [2]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2:
- Rebased to v7.1-rc2.
- Reworded subject and expanded commit message.
- Validation added for Ziccamoa depending on Zaamo and Za64rs depending
  on Zalrsc.
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        | 21 +++++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 5 files changed, 48 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 05f746061f679..73f50dc1ce7a2 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -399,3 +399,19 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICFISS`: The Zicfiss extension is supported,
        as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
        extensions specification, ratified 2024-07.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+       as defined in the RISC-V Profiles specification starting from commit
+       b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e8f4a7dd96a93..0acb7a01ecc0f 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -113,6 +113,9 @@
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
 #define RISCV_ISA_EXT_ZICCLSM		106
+#define RISCV_ISA_EXT_ZICCAMOA		107
+#define RISCV_ISA_EXT_ZICCIF		108
+#define RISCV_ISA_EXT_ZA64RS		109
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 6819df159c51e..58d1e86e47ae7 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -117,6 +117,10 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
 #define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
+#define		RISCV_HWPROBE_EXT_ZICCAMOA	(1ULL << 2)
+#define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
+#define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
+#define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4b4a8157277a3..46ea2cbcf881a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -90,6 +90,24 @@ static int riscv_ext_f_depends(const struct riscv_isa_ext_data *data,
 	return -EPROBE_DEFER;
 }
 
+static int riscv_ext_zaamo_depends(const struct riscv_isa_ext_data *data,
+				   const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZAAMO))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
+static int riscv_ext_zalrsc_depends(const struct riscv_isa_ext_data *data,
+				    const unsigned long *isa_bitmap)
+{
+	if (__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZALRSC))
+		return 0;
+
+	return -EPROBE_DEFER;
+}
+
 static int riscv_ext_zicbom_validate(const struct riscv_isa_ext_data *data,
 				     const unsigned long *isa_bitmap)
 {
@@ -502,6 +520,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(ziccamoa, RISCV_ISA_EXT_ZICCAMOA, riscv_ext_zaamo_depends),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
@@ -516,6 +536,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA_VALIDATE(za64rs, RISCV_ISA_EXT_ZA64RS, riscv_ext_zalrsc_depends),
 	__RISCV_ISA_EXT_DATA(zaamo, RISCV_ISA_EXT_ZAAMO),
 	__RISCV_ISA_EXT_DATA(zabha, RISCV_ISA_EXT_ZABHA),
 	__RISCV_ISA_EXT_DATA(zacas, RISCV_ISA_EXT_ZACAS),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 9cf62266f1890..b15ac9adf7920 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -206,6 +206,10 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCAMOA, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
