Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6207FCD6E5D
	for <kvm-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=77ocss88BCksM/ElYGnxzr+tP2MRU63N8lXteHU2HRo=; b=AmcDI8B5Mu6HKc
	qHOpAg+bfSTSMuo6WmJ1XCONy63yLwsEklWbNFPttVXayj+2xYzo8rjPjz6oYBMLSo3gh/wbY42Px
	aRsoO2KvC2qxW2ogGvIyfR0o+Zal55TfBtCNhNpLkkF0JfIgV/5IW82YaZswldWR9GQ3QQdIRloe+
	P4WLe1A/Si8AyL3G0R6+gbgxPFZL3UY4q/VialSSKzbh86ixos2bjV0EBW+fdrVm4TQDM/AUPQBc+
	QA6Hw/b44aCPKjRETB11B4+g5vc+RSOmqjuZrbLq78VRjx7qmg+ga9CoXxqCv/JkYTUs9D1KiES9/
	KE3sQ7nYmfEIpG3Ku8xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYIi-0000000DvSk-0NFZ;
	Tue, 02 Jun 2026 23:13:36 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYIe-0000000DvR5-3rCN
	for kvm-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:13:34 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso28794495ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442012; x=1781046812; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6k1/Inmh2Od2nwTm50g7cFUmPDy1ALLg4fJ2r68DOVo=;
        b=MDrvuCBv4UXPCHPGvJYfiGs2DVAbdAVG1pwgANKgw2yGaDShrp6YUI5w4KbDRzSmJ5
         ZUJTvXsRdFycLScYMolP1lxp7nt5wiRcr+cnwiE2M2ycliba8nUR7gzYXuNCC0EZNgU3
         2DAH8wfHgLEgUrRpuKSZ7YBik8lLIEsqSYi367Lb/pqkVKGnAnEXBjwcVdtOsNka42Hd
         TZ9VEaVOgv3iH/I6D35YOdwnGwLdzdVNoNJwBcjILET7iCxb2A8TLvWn2Uj0LrVCUQCZ
         rX5d2R/iMrgOTiaWK+XsR5903tnWcSz5IcIwITuSurbZ3AY8aUgH8JO2ktT41HXlWMRY
         V1wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442012; x=1781046812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6k1/Inmh2Od2nwTm50g7cFUmPDy1ALLg4fJ2r68DOVo=;
        b=MzNawjgdD981XoBfNFSuGht7NvF8VAbT+bn0f3B1bMNpIeli0a/IYYAYqsOdH0Un1H
         1kNnfPLn6NHdvqmdQzWkv4YkN0bqfO8vSBv7DwpHuZHfdp892cy6TH6sabzVdw8G4fVS
         abpdAejUjBuG1ERPoMiJAflDtz8vL0q//2nzcogBCnhMSLWHaD2UqlYUy2kBvwYvxN9p
         /mJ/ohnaLrEapnp8vH/82TMF8qeuirCzFPdnlyuA7Enp88we6huLUdOYVWYyxmGLmb+7
         wKg/czMwkQ7Gw5EVG9ZFq/5XrxQC0UMqGvdNyMKdmIfYB0awVSlBE6rM6duRhGW7DmyK
         SUTw==
X-Forwarded-Encrypted: i=1; AFNElJ9Tqn7ZJysrKGL+oy7l7hqVJNW3hOOp61+y5/UIOkumSOIGjaJk5JX4pRk9fHpbM6yG0Y4E7gzJtXI=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxU7YQDzBlX+D+qeDf5McL4eiH1zi2U48qe7biJYhndM/XH4Ty
	Kn/gjqGQzb+vdNonTnehKLzryXhF72o3H733lN31sXcBPVYMIDSEY6OR
X-Gm-Gg: Acq92OGrrz21h33gD8l+N5/5IPJ4l1eR1lcJsSlSuCHX/OqVO50Kwiwjv/kKHlNtkL/
	Cysau+XyR9XC+GkfvERqPc05o5IkVjaLcYI1TV96dBwb2cWXjsxB8uSyHI+SmvQ2nCMQHOJbaPj
	Qpe1TYFCxr19Lybgz7ym15SNgHMjNvpgJIIDlvKZAGeuEW/W2I+7Do01Mk02D0+Nw6E2YaLZScn
	lRoJ3O8Cdg3B21iz43UVrGRL/2la+7Zn201OH1D3hW+wBp5kEWjGzScpB6QgkElA3nuBjQAkeNr
	aIJSQOkIQcLsu0TJamhnaDtq+OhZFLqi0zX+NUjPE+3dawIXg6k/6YkQhaO5u6EfFRyxwSmxYI/
	jo3Q+kETczu8oNBNFPSbLgqThLSWR9XlPZv0z69Iwbn3iKpxyeihpzxvbGRQ5wOf+mlveWF7tGO
	8lPh7vQreq4A==
X-Received: by 2002:a17:903:2344:b0:2c0:b35d:ed54 with SMTP id d9443c01a7336-2c1644a93d1mr7243945ad.35.1780442012288;
        Tue, 02 Jun 2026 16:13:32 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:13:31 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:11:59 -0400
Subject: [PATCH v3 04/15] riscv: Add Zicclsm to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-4-5529a7b28384@gmail.com>
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
 Guodong Xu <docular.xu@gmail.com>, Jesse Taube <jesse@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=4403; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=btdqWDCTYOF/EEFvcKc54moiat+wMaDONmW39rkRzak=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHhYNjbkLtnefubOvT7P+dvl+1coIXY2Gy7btD41j9
 /6wlOPtKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIlUMDP8ZmfITc7YXSG+7Wb/
 Yr3mWK685AN8HfvUalLtPmlnR7/ZzfC/KmfV+tVWOguOVl5autbwHfNsjttiN388NX0+xVfGrfA
 BGwA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_161332_969183_BBFE8A06 
X-CRM114-Status: GOOD (  14.44  )
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

From: Jesse Taube <jesse@rivosinc.com>

Zicclsm requires misaligned support for all regular load and store
instructions, both scalar and vector, but not AMOs or other
specialized forms of memory access, to main memory regions with both
the cacheability and coherence PMAs, as defined in the profiles spec.
Even though mandated, misaligned loads and stores might execute
extremely slowly. Standard software distributions should assume their
existence only for correctness, not for performance.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
[Rebased, rewrote doc text, minor commit message revisions]
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>

---
v3:
- Move the hwprobe.rst entry to the IMA_EXT_1 section so its
  documentation matches the IMA_EXT_1 bit it was allocated in v2
  (Sashiko, agreed by Andrew).
v2:
- Rebased onto v7.1-rc2; moved ZICCLSM to IMA_EXT_1 and
  allocated a new bit for it
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/asm/hwcap.h        | 1 +
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/cpufeature.c        | 1 +
 arch/riscv/kernel/sys_hwprobe.c       | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 3cedaaa53f331..fa2810bfc1477 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -401,3 +401,7 @@ The following keys are defined:
     as defined in version 1.0 of the RISC-V Control-flow Integrity (CFI)
     extensions specification, ratified in commit ff03d8485a04 ("Update to
     ratified state") of riscv-cfi.
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 44bf8c7d8acc5..e8f4a7dd96a93 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -112,6 +112,7 @@
 #define RISCV_ISA_EXT_ZCLSD		103
 #define RISCV_ISA_EXT_ZICFILP		104
 #define RISCV_ISA_EXT_ZICFISS		105
+#define RISCV_ISA_EXT_ZICCLSM		106
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 9139edba0aecb..6819df159c51e 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -116,6 +116,7 @@ struct riscv_hwprobe {
 #define RISCV_HWPROBE_KEY_ZICBOP_BLOCK_SIZE	15
 #define RISCV_HWPROBE_KEY_IMA_EXT_1		16
 #define		RISCV_HWPROBE_EXT_ZICFISS	(1ULL << 0)
+#define		RISCV_HWPROBE_EXT_ZICCLSM	(1ULL << 1)
 
 /* Increase RISCV_HWPROBE_MAX_KEY when adding items. */
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 686dde3ce3b98..1fb595581adcf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
 					  riscv_cfilp_validate),
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index f8f68ba781b45..9cf62266f1890 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -205,6 +205,7 @@ static void hwprobe_isa_ext1(struct riscv_hwprobe *pair,
 		 * in the hart_isa bitmap, are made.
 		 */
 		EXT_KEY(isainfo->isa, ZICFISS, pair->value, missing);
+		EXT_KEY(isainfo->isa, ZICCLSM, pair->value, missing);
 	}
 
 	/* Now turn off reporting features if any CPU is missing it. */

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
