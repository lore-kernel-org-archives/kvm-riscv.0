Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70A9C43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m3N1XzOmcpOQB4JtSS7+loqXrdtPBhWt6dIaPDcGl/g=; b=kg+DK9/5nYqr0s
	5bOcWH1D5ogqHPS/udxzsIt55hFWCLujD6dHI/XRy3LukRAXh9QAFVgkmYbYUl+ZOkyRp5oyEMODp
	eqQoGVau11I4rAPWmyXjUhXmzp4Ac4LvQMNbkl10F9OHQsr0ThhGa4HBqznsUyfg03V7c0PpkZCLn
	oyOLwzWt0LURgJfgH5bR+djceaCI761JCaWIBezawu4II4reUjVHRkBo6xYFy6cfwkKUc2r3h0KMk
	QAH74TKKBxA/DelqEfE3CoBx9sPYv4d/TIwG2QO0aDELurR4zgB0KL3cXHA4s/59gT3Y2Kb29bwTV
	rfLHQaV7zAdUmcu+3FAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRk-000000023l1-2AVU;
	Wed, 01 Jul 2026 12:53:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuRi-000000023jR-2UMn
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=W3t4vJ0/d9fpvaIXCPeF5rPm5f0szKK7JPQrQORN6C4=; b=GF0ALLqf+Q9m8+MI0dpTHa0pM5
	TIwHLKyjhABCOGMSUOwQwF65rYZLO3A/k8kTeY0gn7t62EoXaVs9/F07X1u0w3OcSLkhKQRRWrOhI
	gfrJrVn7YiGkdUe1fpdnETlINtCfBSot0iA8d+rN0FzYQ6qUUFTGYKkYHwomMnb0pzXiqs+XOeKft
	Iz103JHyIGoJrYMdx++oAWDYpcJrH/fFeEe8bJYiShTuKJDWbJ6Z2r2pLmK+z0F1s+zZvrzasSQod
	L30ENd1hu/w8jktxUK3SM7LghZSuvZARN/vjspIPjKluihKQPZIOWjfX6rnbKphRoMc5Q9azSFIS7
	Us2CfX7A==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuRe-00000002mWH-3oU7
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:53:40 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8475eca3a66so521670b3a.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910416; x=1783515216; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3t4vJ0/d9fpvaIXCPeF5rPm5f0szKK7JPQrQORN6C4=;
        b=NNSBdO/GqeiMHP425PPj5aW2QJwi3bLsXmW10W90F3DVOUOUNNuEHRYk8OVZ6pNAvK
         wwOsHSv7tdfM91gwlvoajAfkThCmnV0VysJ5ljtAHVZrkq8AI+RMQMQecCj0w1PVHNhg
         0+G02GRMfEQGD8aZ34IzhIPGiYPSy9cXcSYipzof95GL6c2b+tqDdAOkryjzjcVZHHry
         2fzUtB7bejd0mYEHo1fb2B5juQOfzi2opR/DI49AZXVO3GOHPnv+HXbGOSZkrzMTOHlX
         Qr/dxEyLlvGIBewfBoMuQaJ6FoWse1JlUfAX+kenaO5t9I5lsL2/kIx+3ggV8YFdMm1T
         5fQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910416; x=1783515216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3t4vJ0/d9fpvaIXCPeF5rPm5f0szKK7JPQrQORN6C4=;
        b=M2LVp58BIJuuHc00aSTKFVJy6Y28LMkBqmKosZmbMja6++u9DyRmnwXSA9Wkca5pgs
         /G7SewZTtB0+tWT3oawqXA63uQn06xF+r2Yo8EDHnjGpdChl4rCu83We7eYBXPHy/YD0
         XWzft3yjhKpaexDeNKaFcu89oDIahSgRl+pf7nTLB+7FgRK4GeDd00WFKoqZDc5KOogo
         k9SrYQtZySNE2/GjuCUcSA+ObkviPSLRytNr2d1HdnYSsdjh7tnQMzI5WvwR5YaO8l8F
         YfzKNQfVZ226JeI0ksyM8yaIaIhOZCfXqzkoLnmM/cGzJGUbegH8HhdUSwbp1JOWRnvo
         /s+w==
X-Forwarded-Encrypted: i=1; AHgh+RoyDWPbcyQQQVpLWaJm8W7k0Isxp2DTCBhmuDtLSgyEelZkyOFs3nTg8O9RIPrSRgKVbw7l/d9Xprg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz39vyGxfiJdrmTPPuYrrLXXRuNdcQzqvleWZO3zEZZvIYB15sd
	604uucShhGe7smo+JibPGWteE5qe2n+ww48yVezFvcD2rK+bRlGpXkN1
X-Gm-Gg: AfdE7cmIg468RqDO5eV3h8qMD7ZcNIheoKXyg+bB703JAX/djHk10A66WGEZseXQo7p
	vQLwSYu9GDqCtaC4c8N+nUqttX+DJBvcr7ZW30mle+Oaw/mmaN+lKTY+iQH40V/aa063yRPiRE8
	5KGE2PbI9zh5PD/yPxf+ICOGEhYzKfqjPb7z3fCI38feX8bixmpSWpeb0rxuz6x2n+FMWZe11lc
	kgmbLwWEoUkFNjCJGCVUP4nuJwNKWmhU4TnYs5Rk4l17qNQfJQkf3xL/X0mxBFZWAewxqQEK28w
	/yDkqkHlOu7gW5/UmrXFS3xEL6xK4blucNNsjNKYrJ2qW3ebTDWq4eCurJbzkfKRaQuIDubuj28
	vIkLeZ6+I7O8FVDuwccPAJjtmA3kSXWdnRHURyWj6H1ruml2DPYLAdXIw6Q1hbPqwjSxgAjv5BA
	uox0nx41MyY192RiTxjqI5
X-Received: by 2002:a05:6a00:a884:b0:845:e105:1e6b with SMTP id d2e1a72fcca58-847c51d967fmr577251b3a.62.1782910416480;
        Wed, 01 Jul 2026 05:53:36 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:36 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:19 -0400
Subject: [PATCH v5 06/17] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs
 to cpufeature and hwprobe
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-6-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5837; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=FeXh8TsQwuJVD4+D1HP3+HbYDjTmi1GIHiq1GBy5dio=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3hYNy5s8IQW7tpoylt/Il32e5f72SVvU0hDlM3d6f
 T64L6/tKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgInM8GX4nxb69sSFK5Hsu4Wd
 GTM7Jr2avPLO4e+z6j+0VDTbdYhm2TL8L2jfG7srlSNi2ts9T+8IX1gyrSYw5sLfXYsXrEtRvJ5
 uyg4A
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135339_049957_A07223D7 
X-CRM114-Status: GOOD (  13.95  )
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

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5:
- Drop dependency validate callbacks in ziccamoa and za64rs. (Conor)
- Collected Reviewed-by from Jesse Taube.
v4: No change.
v3: Indent the added hwprobe.rst entries to match the normalized style; no other change.
v2:
- Rebased to v7.1-rc2.
- Reworded subject and expanded commit message.
- Validation added for Ziccamoa depending on Zaamo and Za64rs depending
  on Zalrsc.
---
 Documentation/arch/riscv/hwprobe.rst  | 16 ++++++++++++++++
 arch/riscv/include/asm/hwcap.h        |  3 +++
 arch/riscv/include/uapi/asm/hwprobe.h |  4 ++++
 arch/riscv/kernel/cpufeature.c        |  3 +++
 arch/riscv/kernel/sys_hwprobe.c       |  4 ++++
 5 files changed, 30 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 49d9fb68632d0..893e1a1215d23 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -405,3 +405,19 @@ The following keys are defined:
   * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is supported,
     as defined in the RISC-V Profiles specification starting from commit
     b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCAMOA`: The Ziccamoa extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCIF`: The Ziccif extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZICCRSE`: The Ziccrse extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
+
+  * :c:macro:`RISCV_HWPROBE_EXT_ZA64RS`: The Za64rs extension is supported,
+    as defined in the RISC-V Profiles specification starting from commit
+    b1d80660 ("Updated to ratified state.")
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
index 1fb595581adcf..d76ce21d4a18a 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -502,6 +502,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicbom, RISCV_ISA_EXT_ZICBOM, riscv_xlinuxenvcfg_exts, riscv_ext_zicbom_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
+	__RISCV_ISA_EXT_DATA(ziccamoa, RISCV_ISA_EXT_ZICCAMOA),
+	__RISCV_ISA_EXT_DATA(ziccif, RISCV_ISA_EXT_ZICCIF),
 	__RISCV_ISA_EXT_DATA(zicclsm, RISCV_ISA_EXT_ZICCLSM),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
@@ -516,6 +518,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zimop, RISCV_ISA_EXT_ZIMOP),
+	__RISCV_ISA_EXT_DATA(za64rs, RISCV_ISA_EXT_ZA64RS),
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
