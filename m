Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE26CD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ge/FWfHU+4SZ4YzcPSclLBOd3ijp71Gn+Oqeu0nhqfg=; b=rtETeJeucBG8ki
	zKuxuxa0Ohva3ANzc8/BxO6cf2NSdasTDZE1huayaiGyuLPlSo4XrNdJoK2P/bqmZ4yMZ6hnYYtQ7
	uqUpfUQbD6JHH54Z1ZMkve7NR79WuSa2XDUp/5kEjKJxN9k2M2EhV+G9j2xdb65F5yMQpwMIq5c2Q
	mOLZFA762bmmLTxoiPMVoLTMPgVQSsfQBYVN5UwetWPLLMBoZglwUNp1FutWzBOJWM6ANNvDuUgT5
	y5J9U/AtKaMtUcR3usyUDMvQrsGBgFNjl07PGgeSGW/q94eyiuP2XmY0MlNexkcDl3fW3ueyGBWx5
	s7C8nSc8P8TKWHBNBGVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmz-0000000A15m-05Cz;
	Thu, 11 Jun 2026 20:14:09 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXlmu-0000000A12M-2UEm
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:14:06 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2c132ac5ec2so2746495ad.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:14:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208844; x=1781813644; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uDWD971MMwJ6qHve2YOG8FRlEWvJHn1EivNT/6Ew/sE=;
        b=pdtBkKQwvS4pO3wxzW3CpfdHxlKK7Om3GBeF9gfa2uhn9NU/V//dpU32SgS3u2Qtv+
         sXGSFHdBhcQ0sEfgZ3h9M2jmzJ6PaaFCghtX230jKQ+ZPW+Cus5HNWLp2caQpJxrYx6D
         LM0K23VWZLhhon+yvJ1rvuyKqS6+K03z2qpU83zE1TQJQGZylUP6zCZPY0Grgtx/kH3Y
         R6PZJKCyCQ3R2Y5PovGXV5C37SQYhj/Yy+b7RkKTvKaDEHaVD7FcLablgohRTDb+cfJf
         ePjOltsifssPXwG+sQBG3oixPzvpeGy1STLC+eSkEfffHyg6iR1pxZnZ9pyAksnzKtuT
         6muw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208844; x=1781813644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uDWD971MMwJ6qHve2YOG8FRlEWvJHn1EivNT/6Ew/sE=;
        b=QHp/6lwWGr7lHrl05d8QvZIaBByzJYFClwGuc2qm8EiIXjou/up+YPG1eIfbQ8+XrV
         tS3CaqrQYKnpQS1URyvMgq3YlT5MXQMK6s4VjpiWT2G4xqw8CsB688GIBc9N9qFAWE4R
         r/k1hHgqCimajc3i1hWnMWCSMEFHZ47MbC/hp3qceiHrMLiAy8KetadOLgRWGzc/Qbsq
         VKSCER6k2Mc/UeFRmduFLz0Zry5X2k9Iar0XpSW+pcW8qtATcdT9Lk9ogc45PSJqFsa1
         pbqDuUlf/PxIrRgruoItj7zspRMYp4QNI3KDAWnmV07GMvA5TZnXMeFz5R+1e3G0JlR4
         lzkg==
X-Forwarded-Encrypted: i=1; AFNElJ94dk4VrT42lB72zGxAkZzh7Bu6Ps4G8a5uzKWLER+2pMoAFO01DZndUhMR8+d8hZ89jNJUl4VC2eU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLLOAGE/veEacztFdz6/4jgf/VH1i6NmcNJzmhv2R7BHeIlftT
	9Xj3BS05bt7ofaXcyJ4/96wx6bfqKLbCp8EBhJ9CpZu3CnYdwlTzZ4r5
X-Gm-Gg: Acq92OFiDLtIJwxDB6WeO8XWBOewF5rjMEkbBZiNf+vnYthgRK9YpA7OSt3xpH6di47
	NPEEf89FLyZAClbs1vE72wI6qnthCMpv9sHjmcBO/XJOSstFetTptTdbxl7ySGA+feAN58i0Tmg
	dFdjD3G7pAs1KxhS4dyj87dBXpL4Uyuy6iZbdd/mV5Ra/+4P1AEAtBvheE521OZ4hrh7/FeCdCp
	fpFtojTrfPRM2yNnSXRhqFgAQJAw/wWhSAoxUIbnfuJlo4WpoDg0nXdR87DIKVERWz3Mw8Plq6d
	aYlQ2RIEgn2MlMtyHdSstRADtvUflj07cDq35QumBii+8IHqDjM4gPbGEt7FJ9Lbk6Gj7zLa0rz
	CJgQkm8QIdDm5YCjHk099NeHXYHFckiR1dVUCmdG/HWltEZ/hHCbghFv8wvFNXTh0YBV4VuujXA
	==
X-Received: by 2002:a17:902:ce83:b0:2be:39bd:8dd8 with SMTP id d9443c01a7336-2c2f4cdfce1mr50813675ad.33.1781208843652;
        Thu, 11 Jun 2026 13:14:03 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:14:03 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Thu, 11 Jun 2026 16:12:44 -0400
Subject: [PATCH v4 07/16] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-7-3f01a2449488@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5372; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=b9UB3n6jmzaPS8rRQ79NB7tbcWOa+iWqyCC7BBkj9z0=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsYNXY26adu+oE13Ek8+VV5YZY2jT9kRVP/ofS+KVU
 85Sd953lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwET+bmJkOM5xtb45/4mHQtDm
 yM86/lGHdzCWTlksyJuTfojDfMXlZIb/uRv0z5/48uPwSxkh9UeORzZZHX4n57KI2SLxy4fXbaq
 XmQE=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131404_646242_B3232D4D 
X-CRM114-Status: GOOD (  16.27  )
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

Add B to hwcap and ensure when B is present that Zba, Zbb, and Zbs
are all set. Also expose B via hwprobe (RISCV_HWPROBE_EXT_B in
RISCV_HWPROBE_KEY_IMA_EXT_1) so that userspace can probe B directly,
mirroring the F/D/C/V pattern where each is reported via both hwcap
and hwprobe.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
[Add B to hwprobe]
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v4: No change.
v3:
- Indent the added hwprobe.rst entry to match the normalized style.
- Rebased onto v7.1-rc6: index isa2hwcap[] via RISCV_ISA_EXT_B to match the
  macro-ization in commit 41337097f2823.
v2:
- Rebased to v7.1-rc2
- Add B to hwprobe (RISCV_HWPROBE_EXT_B at IMA_EXT_1 bit 6) and
  document it in hwprobe.rst, so userspace can probe B directly.
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwcap.h   | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 8 ++++++++
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 6 files changed, 16 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 893e1a1215d23..fc68dea397aae 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -421,3 +421,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+    in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+    presence of the Zba, Zbb, and Zbs sub-extensions.
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 0acb7a01ecc0f..58523b3a1998a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/hwcap.h>
 
 #define RISCV_ISA_EXT_A		('a' - 'a')
+#define RISCV_ISA_EXT_B		('b' - 'a')
 #define RISCV_ISA_EXT_C		('c' - 'a')
 #define RISCV_ISA_EXT_D		('d' - 'a')
 #define RISCV_ISA_EXT_F		('f' - 'a')
diff --git a/arch/riscv/include/uapi/asm/hwcap.h b/arch/riscv/include/uapi/asm/hwcap.h
index c52bb7bbbabe9..96b7cf854e090 100644
--- a/arch/riscv/include/uapi/asm/hwcap.h
+++ b/arch/riscv/include/uapi/asm/hwcap.h
@@ -21,6 +21,7 @@
 #define COMPAT_HWCAP_ISA_F	(1 << ('F' - 'A'))
 #define COMPAT_HWCAP_ISA_D	(1 << ('D' - 'A'))
 #define COMPAT_HWCAP_ISA_C	(1 << ('C' - 'A'))
+#define COMPAT_HWCAP_ISA_B	(1 << ('B' - 'A'))
 #define COMPAT_HWCAP_ISA_V	(1 << ('V' - 'A'))
 
 #endif /* _UAPI_ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 58d1e86e47ae7..430dc49a82863 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -121,6 +121,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCIF	(1ULL << 3)
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
+#define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b9538e69fa1b3..e0197160af6dd 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -468,6 +468,12 @@ static const unsigned int riscv_c_exts[] = {
 	RISCV_ISA_EXT_ZCD,
 };
 
+static const unsigned int riscv_b_exts[] = {
+	RISCV_ISA_EXT_ZBA,
+	RISCV_ISA_EXT_ZBB,
+	RISCV_ISA_EXT_ZBS,
+};
+
 /*
  * The canonical order of ISA extension names in the ISA string is defined in
  * chapter 27 of the unprivileged specification.
@@ -515,6 +521,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(d, RISCV_ISA_EXT_D, riscv_ext_d_validate),
 	__RISCV_ISA_EXT_DATA(q, RISCV_ISA_EXT_Q),
 	__RISCV_ISA_EXT_SUPERSET(c, RISCV_ISA_EXT_C, riscv_c_exts),
+	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
@@ -1133,6 +1140,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap[RISCV_ISA_EXT_F] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap[RISCV_ISA_EXT_D] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap[RISCV_ISA_EXT_C] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap[RISCV_ISA_EXT_B] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap[RISCV_ISA_EXT_V] = COMPAT_HWCAP_ISA_V;
 
 	if (!acpi_disabled) {
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index b15ac9adf7920..dcc102bf8f183 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -210,6 +210,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCIF, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
+		EXT_KEY(isainfo->isa, B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
