Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0425CD37AC
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n9p5B4v1eyuo6jSd00cUB7I+RAsKp10oRef5sr8tWAU=; b=OmO9vTKiWl9jrq
	xC8nJuuv0SnzVXxNW1l2krmzlELmQ+1NYqjwmEMni3gu8l9JeZCS4/lHI/IWlpxiDXCc5VDPyCuzW
	Cn2P3fE4pRhvvFwR3E3KTQebWdfDQpFQs2q/LVJsaQDcIuPE+fEBGlpt8/W18gde6GcP33OTUPE9d
	Bt3T2nxvsyukRLxIBhcCK3vdJ4IIoKDMTZUUNQxwK9+lovBCtw6boE8Auah1BdwnPkUiv4g00XYxz
	N9422EqBcIXmhuGqJm88OAr9rA/RoZjjaisws9eRn9mg0cBhCeg3hnzksX5cUwZJluYglDK9wG33q
	fm++L4SxFxPmfRTG1y6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQon-0000000DlzA-2kHv;
	Mon, 11 May 2026 13:37:09 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQok-0000000DlwI-0RYh
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:37:07 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-365eecc5885so4207113a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:37:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506625; x=1779111425; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCAHQLPVgITPnmWoIAz29HJLtXLEuf81viuVntKgbwI=;
        b=iglk/Il9XgKZEPP2vsLfL+nCnof00q2qwZ/VriZCGYLCpwWzdLPejiBvptFzSNHSwO
         Fc5UvKQhNBZZQB/kQINwi0mdSO/KUAKdwwos7nTVjpo/mfNUnO8FkN+cldbcaHihpujJ
         /I13OkRp6qlObbLDToEXtag+mfFN6FLQ5d8p/mk6KpF7fCa7hznSI0ZE+0UysEoZAPQi
         njQCwWf6p5HjezrGlwO3CbmfhnXqAsIh3mje1fQ7Lbm2KPlCj80bAS5K3TvQJHWK9ZDg
         J+Zzgjk2th3p5JtY/JuB8MSdbAu6d2N93j3A4XZtqCvfhiO3T/Jf9eI2Z6u1/veNVuaO
         kdpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506625; x=1779111425;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FCAHQLPVgITPnmWoIAz29HJLtXLEuf81viuVntKgbwI=;
        b=Prtk+d5Iw4uyhCmX2eEJtQ/HxV1xgwjLE1Vcz0vdOGzj+ufApykJGf1kChJEy2xGoN
         2slrzmDByk0d6Y5m0N48/qRd7GGyLYglcspWYecMwYwI5FFLHqn66NUPvlrthV5yb8jy
         WqHW3qbs/n3HS/feCaZzXtmgh727UW/bL+wJrfyQDIvBvMvJeaAuMKBsKgZCULcXTg/B
         ipChtQfIsH85NZ9aMxt30VUq5n44VCIV/cAYIr4RfVuJDB5VOyCwmkJB6DPi/PrNTpjM
         R8MsD8QLvId5SQQVoW15GFfIpuMTt26qz+ck5SjvinvhgclmVH81ppBK1O4U52PjpWb8
         nPCw==
X-Forwarded-Encrypted: i=1; AFNElJ/8RumHEcdRABnQTb5KT5yXIMguYUTOEtxnJ4wLnbaPsX/UiLGRxjmU/RN+tIr8xYDUZtjwhnE1b4E=@lists.infradead.org
X-Gm-Message-State: AOJu0YyeiKkSm0em0VoMGC7AK96bRbYIn3Wfuips8Xb3hMIcJCnPZbpJ
	vHDCVOmNy8f73QgkURRb4ep0My+ZH9YvzG7auGqU6418Tr4oG8U5tikdgTG0liKEX9U=
X-Gm-Gg: Acq92OFyZ/jYY0C1zefTLmS7mLH+JifCcY2qLdXAAfnqlo4oLR443vAv3vsFNXT0Zqk
	ibioeivuc6XWpEqd3k2ydt7G644cAtT5ndeg5/LvjH2tYb+cVr7f/WGmNp/aTiUwVF4A9cfhpjI
	0lQW5v5LjrTk2ZWyhKeNpCE6CRwaPZhn108USg0aVuainLVcCUsDG9h2I7+eScTNVo+BfA3r+7e
	hXk4usUQcL8yDcenUlNQ7ZTAwBRkN9dx7utzw3B4J/mWiCjozuyy1AV9QIo1tbkTy3ZiJVXoMG8
	plzyx5/orM2RGq5Mlr5x0e7nqqcDsp0eKuWVI5/oIw/5Rs/zr0HiiW3Gm921TwitrceTrdoOZ0t
	Pax2WikqBQ5mhSPsVwjvYcsPE9LP8mpGpm2tbrHjEoCB9kSnt92gy03uu1jtxOwNjPrkqCM6kiJ
	AI5u0RY3ieJ7I1us9e3ZT1bLb+sL6M8d13137zdgz6zWg=
X-Received: by 2002:a17:90b:48c9:b0:35d:a861:36de with SMTP id 98e67ed59e1d1-367d487d1d6mr11741973a91.24.1778506625373;
        Mon, 11 May 2026 06:37:05 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:37:05 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 11 May 2026 21:34:51 -0400
Subject: [PATCH v2 06/10] riscv: Add B to hwcap and hwprobe
MIME-Version: 1.0
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-6-21c5a544f1dc@riscstar.com>
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
X-CRM114-CacheID: sfid-20260511_063706_299070_4D2EE323 
X-CRM114-Status: GOOD (  15.09  )
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
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
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
index 73f50dc1ce7a2..cb31fd3b12017 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -415,3 +415,7 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
        as defined in the RISC-V Profiles specification starting from commit
        b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
+       in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
+       presence of the Zba, Zbb, and Zbs sub-extensions.
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
index 46ea2cbcf881a..81145621dc378 100644
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
@@ -1135,6 +1142,7 @@ void __init riscv_fill_hwcap(void)
 	isa2hwcap['f' - 'a'] = COMPAT_HWCAP_ISA_F;
 	isa2hwcap['d' - 'a'] = COMPAT_HWCAP_ISA_D;
 	isa2hwcap['c' - 'a'] = COMPAT_HWCAP_ISA_C;
+	isa2hwcap['b' - 'a'] = COMPAT_HWCAP_ISA_B;
 	isa2hwcap['v' - 'a'] = COMPAT_HWCAP_ISA_V;
 
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
