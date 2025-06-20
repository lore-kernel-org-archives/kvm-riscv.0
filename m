Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D9FC77B7C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 20:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dkTVN735aACibOWQBFYOq4fGRA8V60NQ2OHvzYOvlEE=; b=sMrTaTX/T98ZMA
	7d5MgeEYN9ZTe5zN8VfzIbsBP3JVjGUhi5YZVvOPoJEuwa0l+biBJY7dMJHpmbGnpRgQl6YUIPHqm
	YbjeYDNNRWUmO+uXDsaNZSRF6SAUURP6wsMQDsZQ3P07HqsfzQ14i4/MuYN7+VyJZi6T44OMYKwMc
	XX/lArtD6485Pr1beNHkku2/xOYB8E7xqtmbJFRBu88/9NrXvyo8JCdNxXSHGZiO5UK1sjlSIZXCf
	14qFWZtwB1fUKSokcieZ/HTikOv9LMRnIb7FuBxV3uafvzHi4Jrt0fC/I80KabSPBMXr18oHE3lBl
	wdgmP24rjszYLSwsFfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiGk-0000000GWa6-2I2O;
	Fri, 20 Jun 2025 20:23:26 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSiFg-0000000GWIh-19iQ
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 20:22:21 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2350fc2591dso19947725ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 13:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750450939; x=1751055739; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MkEX4rpjq7p6WD5IMKA2IyXzEVHdMDVkgNg15alekzg=;
        b=RozYlG5fwVLvPhN8wLxnHcKTDXqGedjPTZkWUco78V7demShd0M+vlJi36aaHrJP9m
         Jp2gMu2Mn9KUBxK7EzQqpoHI/hIX6X4unqG7F7GgQFAJOJ62fFrQWKpNKnfFNNJlv8ZG
         ZHAl8hWIUQizsfg0FXKCh4FpWSVZ//moIvn3Yad9/fTQAYoAo6svzpwrB3BEk1hzCv0v
         LREKELrFabcVx6v27jCYeSp7ROAab9xX9zhvGpDSDQqp+YzdmIXt/sZwHOgSFMcwwSqT
         /vonAkdj5cIy1EdBlPC2DUwXbQCa4NQApvzHoxNCV5JaUfXvtRxhyV+BVoJmp0fMqtBf
         ZO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750450939; x=1751055739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MkEX4rpjq7p6WD5IMKA2IyXzEVHdMDVkgNg15alekzg=;
        b=SD70tyB81ICrw/JOm8OzzAYuvaKuZ3fXmL7eRz6tHLDBgwftgaHlrIxO5xfNMs6Dt+
         jxy4AQeQhq78n8E4EqW7FfY/ku6/KVTZD22pJlDFHQ9uHa/QLAPXZvfKis/vucEKGHyE
         9dkLTQ7Z8ODx02gkQR8JYCKyuo3c4cuUEUEmxGcdpNLnmdCcXd3Hds95PGA3/ogQvRYF
         zap3Q3w7yBz3L+PGq+PTyAlKhf/6iGsgfnttPNa3AH3ECQZJse+VM8mLU5gPOxQEqKkg
         cSFuBnyKoc3GlyUL6gHd1GiSEVBAXnuitjOfO+vB+2/dVJOFbpBH0BEBKxPeI/8w7qgs
         h0Bw==
X-Forwarded-Encrypted: i=1; AJvYcCW1OC28W1/uXmkX2xKJJRBAFW3RQr19jRXIgprBlWHcEwqJRde/1W9XWBgCagkGlL+nJiUc2ICOJU4=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFrozelIKUJbhEFisWHjnjM354C6tG92Lf++AmHa6U2bxfZdHn
	/sXvSChYfYLJZPjeuF4PT7o7UxTxnHLk0ZRrmaxcUTqrDb97RrtaPg4K9PkLPgiv6z8=
X-Gm-Gg: ASbGncurGwxf+cy6gbO7GdrfKaBOwmlalK+/+wbdNfi6yLWQy/RC1tYXPceLdlACy6g
	CS+GW7ounPstr5cWJhoNet3znS6hSai2g4yleBusFpS81PwYYGagIzBM/L9Gz/xrUcU8s/5KGHt
	EALA2JR2ttnrLqZXZ9Ne6hBW+c9OEaMS4rcuKsU+bGin5UR75c6ztYbZm+Ga1DKHACPOptjoZKy
	w2fQjVL8Rmi9ZWxtxUWGKrp1bjO+LsTW6DuUGaH4zmWBKKJKfkkbsEXw3P0c86kDSb7q7dOJgK1
	QdgBYkfif/vFadjmB5zvex0csx9SCvUAyNPzGcWGCHmMHjBn/X2fOvYG+HUwKp1T/fHcmxGcQsT
	F9bNlPLeb5pY3KYVOYBv31OLOyirwRbOzn1XhZquRuATp
X-Google-Smtp-Source: AGHT+IEGbDx2L0uhp1l68AXPB4oKTeswGNYaYazB8bKKifgSCD07xtvqs/Vw7e6uATFM9kf9PdX0sg==
X-Received: by 2002:a17:902:e54e:b0:215:6c5f:d142 with SMTP id d9443c01a7336-237db0d5a62mr50236945ad.20.1750450939429;
        Fri, 20 Jun 2025 13:22:19 -0700 (PDT)
Received: from alexghiti.eu.rivosinc.com (alexghiti.eu.rivosinc.com. [141.95.202.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860fb58sm24239005ad.99.2025.06.20.13.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 13:22:18 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Fri, 20 Jun 2025 20:21:58 +0000
Subject: [PATCH v5 2/3] riscv: Strengthen duplicate and inconsistent
 definition of RV_X()
MIME-Version: 1.0
Message-Id: <20250620-dev-alex-insn_duplicate_v5_manual-v5-2-d865dc9ad180@rivosinc.com>
References: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
In-Reply-To: <20250620-dev-alex-insn_duplicate_v5_manual-v5-0-d865dc9ad180@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Alexandre Ghiti <alexghiti@rivosinc.com>, 
 Andrew Jones <ajones@ventanamicro.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7020;
 i=alexghiti@rivosinc.com; h=from:subject:message-id;
 bh=Vq5Ge4Wa3TVBt85DoyylAxrZltpaFYZYUPYZeK66VFs=;
 b=owGbwMvMwCGWYr9pz6TW912Mp9WSGDJCD3246T+x3+vZmwqhZc9/i6mpTf184X6hSVFTvejU/
 6VqvAc9O0pZGMQ4GGTFFFkUzBO6WuzP1s/+c+k9zBxWJpAhDFycAjCRjwsZGWaqSO0X0PqsOFP0
 hoZf/+VFzk/+3VcUWdfZGjD3rN9Z592MDG171FcY9Rh5vlnMo3Yw8nP1Cb61L5awdLK6rtp2r/y
 mPAcA
X-Developer-Key: i=alexghiti@rivosinc.com; a=openpgp;
 fpr=DC049C97114ED82152FE79A783E4BA75438E93E3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_132220_313721_6E5FC1F4 
X-CRM114-Status: GOOD (  10.35  )
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

RV_X() macro is defined in two different ways which is error prone.

So harmonize its first definition and add another macro RV_X_mask() for
the second one.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/insn.h          | 39 +++++++++++++++++-----------------
 arch/riscv/kernel/machine_kexec_file.c |  2 +-
 arch/riscv/kernel/traps_misaligned.c   |  2 +-
 arch/riscv/kvm/vcpu_insn.c             |  2 +-
 4 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index 2a589a58b2917d67efcb18792b05f5e640bda37f..ac3e606feca2584494ce4c41afd64c5f22a65c44 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -288,43 +288,44 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 
 #define RV_IMM_SIGN(x) (-(((x) >> 31) & 1))
 #define RVC_IMM_SIGN(x) (-(((x) >> 12) & 1))
-#define RV_X(X, s, mask)  (((X) >> (s)) & (mask))
-#define RVC_X(X, s, mask) RV_X(X, s, mask)
+#define RV_X_mask(X, s, mask)  (((X) >> (s)) & (mask))
+#define RV_X(X, s, n) RV_X_mask(X, s, ((1 << (n)) - 1))
+#define RVC_X(X, s, mask) RV_X_mask(X, s, mask)
 
 #define RV_EXTRACT_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
+	(RV_X_mask(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
 
 #define RV_EXTRACT_RD_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
+	(RV_X_mask(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
 
 #define RV_EXTRACT_UTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
+	(RV_X_mask(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
 
 #define RV_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
-	(RV_X(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
-	(RV_X(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
+	(RV_X_mask(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
 	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
 
 #define RV_EXTRACT_ITYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
+	(RV_X_mask(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
 	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
 
 #define RV_EXTRACT_BTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
-	(RV_X(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
-	(RV_X(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
+	(RV_X_mask(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
 	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
 
 #define RVC_EXTRACT_C2_RS1_REG(x) \
 	({typeof(x) x_ = (x); \
-	(RV_X(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
+	(RV_X_mask(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
 
 #define RVC_EXTRACT_JTYPE_IMM(x) \
 	({typeof(x) x_ = (x); \
@@ -346,10 +347,10 @@ static __always_inline bool riscv_insn_is_c_jalr(u32 code)
 	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
 
 #define RVG_EXTRACT_SYSTEM_CSR(x) \
-	({typeof(x) x_ = (x); RV_X(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
+	({typeof(x) x_ = (x); RV_X_mask(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
 
 #define RVFDQ_EXTRACT_FL_FS_WIDTH(x) \
-	({typeof(x) x_ = (x); RV_X(x_, RVFDQ_FL_FS_WIDTH_OFF, \
+	({typeof(x) x_ = (x); RV_X_mask(x_, RVFDQ_FL_FS_WIDTH_OFF, \
 				   RVFDQ_FL_FS_WIDTH_MASK); })
 
 #define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
@@ -375,10 +376,10 @@ static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
 {
 	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
 	*insn &= ~GENMASK(31, 12);
-	*insn |= (RV_X(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
-		 (RV_X(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
+	*insn |= (RV_X_mask(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
+		 (RV_X_mask(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
 }
 
 /*
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index e36104af2e247fc0acb88eb5558d07ac49c713e4..5c2ed4c396e9d242054fdb30510a36bb3901a27b 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -15,6 +15,7 @@
 #include <linux/memblock.h>
 #include <linux/vmalloc.h>
 #include <asm/setup.h>
+#include <asm/insn.h>
 
 const struct kexec_file_ops * const kexec_file_loaders[] = {
 	&elf_kexec_ops,
@@ -109,7 +110,6 @@ static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
 }
 #endif
 
-#define RV_X(x, s, n)  (((x) >> (s)) & ((1 << (n)) - 1))
 #define RISCV_IMM_BITS 12
 #define RISCV_IMM_REACH (1LL << RISCV_IMM_BITS)
 #define RISCV_CONST_HIGH_PART(x) \
diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index dd8e4af6583f47d2cce8cab61bcd92e7d642a11f..1b69b91d7739c8b8ccb7b1605b6b4b88197b30a5 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -18,6 +18,7 @@
 #include <asm/cpufeature.h>
 #include <asm/sbi.h>
 #include <asm/vector.h>
+#include <asm/insn.h>
 
 #define INSN_MATCH_LB			0x3
 #define INSN_MASK_LB			0x707f
@@ -113,7 +114,6 @@
 #define SH_RS2				20
 #define SH_RS2C				2
 
-#define RV_X(x, s, n)			(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)			((RV_X(x, 6, 1) << 2) | \
 					 (RV_X(x, 10, 3) << 3) | \
 					 (RV_X(x, 5, 1) << 6))
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e69892a1f3dac5464f892a8bac25eefd5..62cb2ab4b63680d9d436c12bb2faae94e7988761 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -8,6 +8,7 @@
 #include <linux/kvm_host.h>
 
 #include <asm/cpufeature.h>
+#include <asm/insn.h>
 
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
@@ -91,7 +92,6 @@
 #define SH_RS2C			2
 #define MASK_RX			0x1f
 
-#define RV_X(x, s, n)		(((x) >> (s)) & ((1 << (n)) - 1))
 #define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
 				 (RV_X(x, 10, 3) << 3) | \
 				 (RV_X(x, 5, 1) << 6))

-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
