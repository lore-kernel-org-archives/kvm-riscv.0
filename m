Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549A2CCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 16:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l/elnDhFCq3Bd5ShbYeEbDuT9FxSC49OXJeSZMUK49g=; b=tZcn0NrBEDmmb+
	sY0rCuquEUPSR3y/Hq9zuG+q6fNlTiTKu19iFx6GLHTXSgq/GDyCjsKUfJZBjdWhS2MweVK9nxTjO
	fg0s8C1WVHSdIlP1cflQDmP1TILB93eNssTM871DtYmNQ/a7h+jHzbgFIT1p+A+/xtIC7uZ9+WNNG
	tKXzlQstNRn15cRWnmn8Dbo6fIbghrX6UZrnltTXHakkmx6gT7uB7K0L9nMB2Qx7RU7LpLT85umJU
	R3V5gO1Dsj82ICOhy3IVBk4sVdeuF6iJTXnS85kGWN3jVVq/6LaAxV6Qe94RSd/Wbct84Y5R/eB8h
	9/9YESyKFPdO+Nu3PTOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9msV-00000008Lz9-0Pw4;
	Fri, 17 Oct 2025 16:00:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9msT-00000008LyP-43c3
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 16:00:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7YO6UzdALBp15BcoYG5LkyhqHChXHZ3HPbY8ifkU6tw=; b=X7seslRcSgzb/yjoKGob76t2qe
	ZMvQrz5n/RsYQ4fuaNvH8khfkDiaiCd0efRwYLJzATcRM2AeWrxildUVlTeX0ax7/GwnLZ/QYjS0s
	rIum7VXcqg5fytgAPaIiNbGkvpmFik29ut759vesqayx9fR2gxDYVWFuWoBpakVNHygogjMKYF9aL
	iFUptwfcqZhGQstkaL5Yl3rs907R0f2S/nRTlgzg2sbVdDvHhN6T50sWuC/oVTNIijVBj//PBDWSz
	pB9cu9Z7KEctO2EKV/LkQyuRK9OqiBbdKhfMGRUyGEUYeuTx8g2+zd5sMAdmbVNJ8o3Th2USK+TIW
	R6LSObIA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9mrr-00000007iRc-2Xoj
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 16:00:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-782023ca359so2140896b3a.2
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 08:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1760716785; x=1761321585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YO6UzdALBp15BcoYG5LkyhqHChXHZ3HPbY8ifkU6tw=;
        b=K1RH+mVQibCaEwzho7SO0tWD4zpCqUt12KUANDBzTFUNrRzMgEDkmgTBWDqcGSBd8y
         LLhMul/uunorjETlTOFc0cWQNSpeVNMjkZKnvvRYhr7ip9p4DYlbpMNcXyJjTh5xOZKR
         hLXhTFpeChozpndrCUazx7ChYfcCqrcDtW8S/ywFRRrvsMgmaC/q0J2DkDHxSEomph/q
         CS5jkTePYYIgH3H3Wx1FW6IZm4zAJkCmrwZexQBjoHIYP+FDRU7z5t+H4xvrlZruHaeo
         2/QceyM/Dtt1Tj8cp71FEN/050dfGAjUFZemXuK9T/7YJoiEN8JnzqspT5yhwUSpd6Ly
         2Y4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760716785; x=1761321585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YO6UzdALBp15BcoYG5LkyhqHChXHZ3HPbY8ifkU6tw=;
        b=uNbVPHOACBfc3f1Dx6MIHMq9uGOlXIsdAvUjpCaWwwMaT3nHr4RD/DY+NYEH1XA34e
         opQUbeNeiCBm3/VrLvsTseuc92ifSsCmO/cmlz3ta+EhsZj6pmCQE6HCgYnDK/sCV7Ud
         3tFUfkdvItQmvXzDY3LApOGw4UQ+FSy7YW+egqWJCdC2z1J4DjMkRGMHtuV28IrDIJfz
         wejHDm7TfZdhHpEbeyfKp5+KBnHz/pXoC1cqF2kr2dcXY3DUADI6wxhLWcBPo1+S+VKi
         RU20ZRHRBk7Mqd+nZ3KRpR9FDYDy3SIJOizAQCVeZPTTkJKl83kYICIdpiuj9ak5qtC2
         lG7g==
X-Forwarded-Encrypted: i=1; AJvYcCXW1+tjq55X2SX9s4D5wWMxoKajVe3voUeSqCvQBJ/Z90jTd2PXwqtK+ePx+h19/TNzqQKc/Hzhpuw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJ91OzFqm9LghXkawvih8I2exo48bfnhA+BSV28jVkpWEGFmf8
	vQfUwzh3gg29NK1wchLCfMSY6+SZCwMN9Y7qNvhgT4nBLB+BXSZ2X/a1TfIiKwGDWBw=
X-Gm-Gg: ASbGncs/UGRARC2hr7Ylwkk3Mla+om6ZfrQPWBnCL/6glKF4jRt9sXi87eLDmNQG+DC
	9qTIde1TJEFlv3ujE9xamZyUlHXc9o87FI3u6FxkokwvLDmad0HGOSkeakhKR/h4oRDpg1bJBQ4
	UyOkfQbVw8tY8of19mdnuXtLQiN5cOIgKgmUBg4zJEdkY6oafCDy9pDY2dYvGnf0w6ZZYRlKf1K
	nhGw6+0xI5kw6fufh5eLVtmdQGHl18FSPyaCaPQMzxhbwkudkAWYD/99ptOpEfu40SzN1CH0Am/
	UbJuWGhqOHDiQN3PgJnE9wtMTYiTVBDhJ3/uPXcCWRPXUA3XwLbiYQH+b2NVXC20sL1l/GbvWe9
	zR9XC60/wc9+mit5VIUW53Y/F7SKJIVccyHreJpyv5GXsMoSWLM7SeH9wIA+uIVH5MTxjV4l353
	fVzp+Zd90ZtSgr/7C3YEveyrJXpw2+K+dBYyQFZIiVReDG49qi0U8HIQ==
X-Google-Smtp-Source: AGHT+IGyl9gTUlhqKvf7bWFyXToKYsATj7SdvLFGZ0eSD3zQLgSjQNxd1CMPXeNXJkwX2bLubLMF4Q==
X-Received: by 2002:a05:6a21:9997:b0:334:9e5e:c2c2 with SMTP id adf61e73a8af0-334a84c81famr5765358637.13.1760716785208;
        Fri, 17 Oct 2025 08:59:45 -0700 (PDT)
Received: from localhost.localdomain ([122.171.18.129])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a7669392csm151067a12.18.2025.10.17.08.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 08:59:44 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/4] RISC-V: KVM: Add separate source for forwarded SBI extensions
Date: Fri, 17 Oct 2025 21:29:23 +0530
Message-ID: <20251017155925.361560-3-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017155925.361560-1-apatel@ventanamicro.com>
References: <20251017155925.361560-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_170000_819292_E16AFA26 
X-CRM114-Status: GOOD (  13.11  )
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

Add a separate source vcpu_sbi_forward.c for SBI extensions
which are entirely forwarded to KVM user-space.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/kvm/Makefile           |  1 +
 arch/riscv/kvm/vcpu_sbi_base.c    | 12 ------------
 arch/riscv/kvm/vcpu_sbi_forward.c | 27 +++++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_sbi_replace.c |  7 -------
 4 files changed, 28 insertions(+), 19 deletions(-)
 create mode 100644 arch/riscv/kvm/vcpu_sbi_forward.c

diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 07197395750e..3b8afb038b35 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -27,6 +27,7 @@ kvm-y += vcpu_onereg.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o
 kvm-y += vcpu_sbi.o
 kvm-y += vcpu_sbi_base.o
+kvm-y += vcpu_sbi_forward.o
 kvm-y += vcpu_sbi_fwft.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_sbi_pmu.o
diff --git a/arch/riscv/kvm/vcpu_sbi_base.c b/arch/riscv/kvm/vcpu_sbi_base.c
index ca489f2dfbdf..06fdd5f69364 100644
--- a/arch/riscv/kvm/vcpu_sbi_base.c
+++ b/arch/riscv/kvm/vcpu_sbi_base.c
@@ -70,15 +70,3 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_base = {
 	.extid_end = SBI_EXT_BASE,
 	.handler = kvm_sbi_ext_base_handler,
 };
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
-	.extid_start = SBI_EXT_EXPERIMENTAL_START,
-	.extid_end = SBI_EXT_EXPERIMENTAL_END,
-	.handler = kvm_riscv_vcpu_sbi_forward_handler,
-};
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
-	.extid_start = SBI_EXT_VENDOR_START,
-	.extid_end = SBI_EXT_VENDOR_END,
-	.handler = kvm_riscv_vcpu_sbi_forward_handler,
-};
diff --git a/arch/riscv/kvm/vcpu_sbi_forward.c b/arch/riscv/kvm/vcpu_sbi_forward.c
new file mode 100644
index 000000000000..dbfa70c2c775
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_sbi_forward.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/kvm_vcpu_sbi.h>
+#include <asm/sbi.h>
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_experimental = {
+	.extid_start = SBI_EXT_EXPERIMENTAL_START,
+	.extid_end = SBI_EXT_EXPERIMENTAL_END,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
+};
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_vendor = {
+	.extid_start = SBI_EXT_VENDOR_START,
+	.extid_end = SBI_EXT_VENDOR_END,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
+};
+
+const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
+	.extid_start = SBI_EXT_DBCN,
+	.extid_end = SBI_EXT_DBCN,
+	.default_disabled = true,
+	.handler = kvm_riscv_vcpu_sbi_forward_handler,
+};
diff --git a/arch/riscv/kvm/vcpu_sbi_replace.c b/arch/riscv/kvm/vcpu_sbi_replace.c
index 2c456e26f6ca..506a510b6bff 100644
--- a/arch/riscv/kvm/vcpu_sbi_replace.c
+++ b/arch/riscv/kvm/vcpu_sbi_replace.c
@@ -185,10 +185,3 @@ const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_srst = {
 	.extid_end = SBI_EXT_SRST,
 	.handler = kvm_sbi_ext_srst_handler,
 };
-
-const struct kvm_vcpu_sbi_extension vcpu_sbi_ext_dbcn = {
-	.extid_start = SBI_EXT_DBCN,
-	.extid_end = SBI_EXT_DBCN,
-	.default_disabled = true,
-	.handler = kvm_riscv_vcpu_sbi_forward_handler,
-};
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
