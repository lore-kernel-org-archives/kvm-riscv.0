Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F5C8CD6E5D
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8RE98XyE9+JniXwuMFrp8DZrjNIBmGSI2F+0AkmEWx4=; b=mmDeAFltdKPhZz
	7HTaAIseFXf/Q0hPmsJ7ZyYbZnUuzdo0nNizrjYZmMbbQ0w9t1X9v9KVz3IoRzgasDPXSo0WTh3bJ
	fQr14tj93+TFKOXG/UUaj3U/eYO6GkzmVkp8oy4A50dvSenFKeFNmZvAB4z9aAI6OBiIckNfLr70w
	uGpSS3PexUARHfNmdBy5BEH1xNOAyABXBilDCbJ+drhQ2G3zIKZyHkh0VG54UiStGGkRHbJJXdtZY
	Gyq4nuJvSrOGp/3y8/5iJUkntSPfGDASp3GMAKBu8nRUt5EXjgCSiuH2m2qTQYmviOSnGzU0Mr4D5
	O1Da+3hBgod4QkTUBhWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJO-0000000DvpQ-3flJ;
	Tue, 02 Jun 2026 23:14:18 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYJM-0000000Dvnj-3HKj
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:14:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2c0c379e8ffso21705115ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442056; x=1781046856; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tnLxbwZwMbkVvB2Zwz0yZiGVjbTNpgk1H8ZchRPW3Lw=;
        b=cfRWz7ZT0LxHf2zXZ2UQlHeq+5a5g1Mp6aVSmlm37tmMUkdYiJGrYtXGV+MNhfbTsZ
         4uqYz0OHHJdn4Y0T/BWcRGkk8TZCLNdgvYFoYLiCe1Pvs4GTi4jrT50WzoqKfu0aq7yD
         qlhDWFlbEoNy9vpCiRqnHa4jlJX6QUFyzRWeS/IdDb9EC8r3kEqU1uoCPJIyJYMU3kU+
         Ip+PVfMYt7mAr7wBogpp/NOK7qcHKLTmh+WAkSN20OdZQTOLaCHe1/QdrfEVSX4OHuE6
         2G0JcYwrGuOysvdh2VosCmjY1w7FB7nqNyR1m4Pv/TBv6muZxyReVBhctnO2VZ7nwY9S
         O3eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442056; x=1781046856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tnLxbwZwMbkVvB2Zwz0yZiGVjbTNpgk1H8ZchRPW3Lw=;
        b=ORGpEMs5z9z+Ipd5hlguG7FR+9crWFkNFUnyJb0IM1W95BcRZ3UL5UyvYiqlzFihzX
         nJlRreAjuzhQ1x9L4GhI069UeA/5TYilUg14bXe6JPIoY+qn54ZW5gs+a0/GzQ0ovopC
         QQj33NSHY135H2pjm4Cu0O+8ZpZdlIJdLETGzlSlAb/8Ja9KXKXYjuplWM8s5DiaHiY+
         w8eR+Z8jOqiRP5AC37gKX/GGsV3GLxGaMHchtQBbGZkzEgluYxkZBQFAY+ElcOmME/hN
         gtonPjWbVzXKbHGbZpZNwFtS/wMx2OKRQe/wDOtmOFeN3cb2szOuHB3lYLxGW5P+jNwI
         cm8g==
X-Forwarded-Encrypted: i=1; AFNElJ9WFz+y+LVke24s+nONJ62KO1LDoRa8wrMZQy6hCFdn5nM98lDHQqfT/9bEgl4XSLME8du9F5slBrY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzkhRi49xbx+dJYQ+FOtfyT9rCjEKwy16GopPrKeZUgJG25SQYo
	cT7t9iLkyYKgzPENlpro8rG53nsrRUCOlJOcauF6QHjPiv+M1ZGsIjZG
X-Gm-Gg: Acq92OFmp5zx8/begJ7uFH9oJY2RdlAqz26jZ/GKWiQHtTw3LWHptdZDY+pvMu6m4NX
	Ql+LmCRdy2MMKUTbfD2Uc6ClmBflju8/riRpZsEo3DS8vuiSbAwT8Vqk5+tAvi6a5YlBgq+6Y9J
	SEwxPiB7pFxIB/bI3DvaT4RK7zqg4eoD6p9d/tCu9+vRCv0nk0pecQE4zeWLwYWbk+vkxi3HCOw
	9W1e9wFl7Lpmt3seR/jgmLsWfcqJrrRixrDlzWz8Ql8qD2EmzjII1kwU2yMBcDBdD3tPSNoctJi
	zGMwuI3e5T3r1yZnGnuxXPr7hlvrEI3j8bezmll0sTilp42gdOgA3UMAmd/3rUE3tr3r05I+FhK
	V980RlVOXAZXy31xdLdmwJlQLqT4bLiMHC3DBYg2GhAFh2bJEjrpyUWXZHl1bGaru+uWyDzEflj
	i6byWTqYTrpg==
X-Received: by 2002:a17:903:1786:b0:2bf:3309:ecce with SMTP id d9443c01a7336-2c163db0b76mr7281915ad.28.1780442056055;
        Tue, 02 Jun 2026 16:14:16 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:14:15 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:03 -0400
Subject: [PATCH v3 08/15] riscv: Add Zic64b to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-8-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4586; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=ic3wkraCrvoYZ6pSRcfok46YiwVD8eKVuqso6BkVzl4=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHtaYUAuj5udcaV9+3F8kksMfOan5kXhKXtr2cjvVp
 2nby8Q6SlkYxLgYZMUUWQ4fbcne+son2vc55w+YOaxMIEMYuDgFYCKllYwME25NXvdBIXV1yPlz
 065MVtg/J8fnxBrLiaLmBjOj9Bc+XM7w3y9bwWLOX9bcybISXpP0V75SEN4vu8JlYdnOpjRnttA
 uBgA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161416_833629_08BE7E1B 
X-CRM114-Status: GOOD (  14.91  )
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

Zic64b mandates 64-byte naturally aligned cache blocks and is a
mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
validate callback that requires cbom/cbop/cboz cache block sizes of 64
bytes, and export it through hwprobe.

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v3: New patch.
---
 Documentation/arch/riscv/hwprobe.rst  |  3 +++
 arch/riscv/include/asm/hwcap.h        |  1 +
 arch/riscv/include/uapi/asm/hwprobe.h |  1 +
 arch/riscv/kernel/cpufeature.c        | 18 ++++++++++++++++++
 arch/riscv/kernel/sys_hwprobe.c       |  1 +
 5 files changed, 24 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 002d5046ab689..601e81f561421 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -425,3 +425,6 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_B`: The B extension is supported, as defined
     in version 1.0 of the Bit-Manipulation ISA extensions, and implies the
     presence of the Zba, Zbb, and Zbs sub-extensions.
+  * :c:macro:`RISCV_HWPROBE_EXT_ZIC64B`: The Zic64b extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 58523b3a1998a..36572c1ff438a 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -117,6 +117,7 @@
 #define RISCV_ISA_EXT_ZICCAMOA		107
 #define RISCV_ISA_EXT_ZICCIF		108
 #define RISCV_ISA_EXT_ZA64RS		109
+#define RISCV_ISA_EXT_ZIC64B		110
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 430dc49a82863..36ec8ab470423 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -122,6 +122,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZICCRSE	(1ULL << 4)
 #define		RISCV_HWPROBE_EXT_ZA64RS	(1ULL << 5)
 #define		RISCV_HWPROBE_EXT_B		(1ULL << 6)
+#define		RISCV_HWPROBE_EXT_ZIC64B	(1ULL << 7)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e0197160af6dd..79ff431768139 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -154,6 +154,23 @@ static int riscv_ext_zicbop_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_ext_zic64b_validate(const struct riscv_isa_ext_data *data,
+				     const unsigned long *isa_bitmap)
+{
+	/*
+	 * Zic64b mandates 64-byte naturally aligned cache blocks; cross-check the
+	 * cbom/cbop/cboz block-size device-tree properties to avoid inconsistency.
+	 */
+	if (riscv_cbom_block_size != 64 ||
+	    riscv_cbop_block_size != 64 ||
+	    riscv_cboz_block_size != 64) {
+		pr_err("Zic64b detected in ISA string, disabling as the cache block size is not 64 bytes\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
 static int riscv_ext_f_validate(const struct riscv_isa_ext_data *data,
 				const unsigned long *isa_bitmap)
 {
@@ -524,6 +541,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET(b, RISCV_ISA_EXT_B, riscv_b_exts),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(v, RISCV_ISA_EXT_V, riscv_v_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA(h, RISCV_ISA_EXT_H),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zic64b, RISCV_ISA_EXT_ZIC64B, riscv_ext_zic64b_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index dcc102bf8f183..3e80e5551ae0d 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -211,6 +211,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		EXT_KEY(isainfo->isa, ZICCRSE, pair->value, missing);
 		EXT_KEY(isainfo->isa, ZA64RS, pair->value, missing);
 		EXT_KEY(isainfo->isa, B, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZIC64B, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
