Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3965C83F0D
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4D2CVGJuSk1NdWX6IoPRifSZatVUdusL/SSJg8W1q34=; b=O05JekKTNcBjDA
	0wV3Uo8iEJYoiKr2B8fysmlPpMUi/hG5q2TacH+AZIVgjS3cM54di/VYcFw7xezaHRmnr8981j1id
	VEpRjwXTriuXY+coXY91m7f2+WafIm7XuYJXZuTKOSjE+HqDKWY3iYLJCfGLBFiCPbACcII+6A49X
	pzBJrFbA9B9t+Tv2Cd5oBiY4xFjlVfy/dQ5bUQFh9az2kixG5kOMhuypl22sVMzabPQNHVPYciBgp
	qgwuYlSypEOCc3q0vAYWz72xXgldSjNjqoPJr/U4VtaNGSwlUToqklnTymYLHR5+URElL6nPpE3Es
	Uqv6weciiqIkSNLxeIPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB5u-00000005xSw-1sgh;
	Tue, 08 Jul 2025 16:22:58 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAYI-00000005rtG-2gck
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 15:48:16 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-6fadd3ad18eso46958586d6.2
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Jul 2025 08:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751989693; x=1752594493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iH04xoC4HJJjcr3JF880EHmqHS1N+xsYoFSsuwlbdaQ=;
        b=dD7tDSt1OJ3eP+Eo3XMqlwI72wFgTCXP0JNGjwHfT12vi9jtBjxjLXtDs+1tj7XyZ4
         /c/YZSs+wQx8N4r6NkMJsItnpaOEQmGbaoN1qLlurl9FFjodI2eojmROMqqCIyGq43oC
         NeVh5tEYQgu4sdBuwLvxoGSXoY3G7BICyr75KLvrT8v6cMDDkh3VDuVtc5uNRlaHR3as
         kygrX9DGYO+eNJZ49BN8i1JA92VjAoz31lksODFoScdwS1K9aZWx77cMb/SZf9T+TWzZ
         vaHEadxtEKqyMJik48cThgk38YNobqC+2EdufbK30WB+T/tm1HkstgYeSdnxP8vga+J7
         8cxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989693; x=1752594493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iH04xoC4HJJjcr3JF880EHmqHS1N+xsYoFSsuwlbdaQ=;
        b=AAycN3QyNe/tC8EALHkqIGyekz08bazV11cnYy7bG3fzkJIfvI4aiuTCSVOGLAM8i5
         3lApsW1kqjwoqgTjoliY+K/T1aSkeq++3nBbBK0X+dGRrB8UP+smq3S05Ph7FLqdtUWT
         LhaBF+CafDd6NdHAN6u+oy15cEUnCR8zG8X0eh4/muRt/4URhnpPXybCYK4OyfA+eUso
         RQrKy5sUmLqB/Bt6PlKQWwUgDWfKqvq/RftjoNFjguqvJYBz3Rg9NboCO1uN2Ti7Rlb3
         oEFp1hZi3gFWpdslSFq80qsTG7Heglkr00Fcy8C50Zjl6sKNJNoEAOA68No/tmRaqkU+
         yIdg==
X-Forwarded-Encrypted: i=1; AJvYcCU4jZQo6lnwJTSFokz5E8D0uiwFUgyRcTZM1LS69ZSg7pxELwPSGFkD3C+yggheUO0+AgjdFNe7TYc=@lists.infradead.org
X-Gm-Message-State: AOJu0YziHXahoa0kermDeC5j9Td4yHu3U24cplw18igI4SDrscAXc6Ig
	sR4/CnwtOHoeij4KV8pApxhMHr+W3QPUP+Uu2yAsvkdKCMaZBc2D69CqaasPPDfPXdE=
X-Gm-Gg: ASbGncthpGdrQOYhFluHRJ5EDb9iMIiv8S2Hn9TyE2lnLY1gM0XLm6wRYwD+8D2xjgj
	ZUWSFL4btVHadsFxQ/f2+lw5NiMESmzCWju8bSfqosQp6r4zaPd0FoOdIaXOH9VPA8OSS9u064w
	NVQLl5jruBpbooXlutTtX4GnSUURfcKCpHe4rfiydyuRsCWro20BfJ8Wgn84ZxrMvjq0YLBQhhy
	DpfyT0mf8BAN/I0wA7VOx9TfXjwZWi+fcAiCnM/JKfRWOBSPzmHoNTXyArBTpewgyAwxdoPutKl
	1XIzUZSt0WeO7x+Q9TpCC45aOME3muQDHrFDsLq8g137lzX4cbsE1z73CreToqVVpmTq1dJWQGT
	V59KWUHQ/KEWwlk+YXpITdYfEdd1tUwGZR5E8fMbCy39Kwxaf4oxV4HZFy/YnRA==
X-Google-Smtp-Source: AGHT+IGUQo5EBx/tNY5n3ZATmL3uaoM4iK61VNEuctuQHFnVd7lY/jZGvovGvruOSz6T58HuyGkltw==
X-Received: by 2002:a05:6214:5b81:b0:6fb:3d7:71bb with SMTP id 6a1803df08f44-7047d931790mr46736666d6.1.1751989693532;
        Tue, 08 Jul 2025 08:48:13 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ab9csm78453346d6.87.2025.07.08.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:48:13 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	James Raphael Tiovalen <jamestiotio@gmail.com>,
	Sean Christopherson <seanjc@google.com>,
	Cade Richard <cade.richard@gmail.com>
Subject: [kvm-unit-tests PATCH v2 2/2] riscv: lib: Add sbi-exit-code to configure and environment
Date: Tue,  8 Jul 2025 08:48:11 -0700
Message-ID: <20250708154811.1888319-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708154811.1888319-1-jesse@rivosinc.com>
References: <20250708154811.1888319-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084814_679239_638989CF 
X-CRM114-Status: GOOD (  13.25  )
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

Add --[enable|disable]-sbi-exit-code to configure script.
With the default value as disabled.
Add a check for SBI_EXIT_CODE in the environment, so that passing
of the test status is configurable from both the
environment and the configure script

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 configure      | 11 +++++++++++
 lib/riscv/io.c |  4 +++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/configure b/configure
index 20bf5042..7c949bdc 100755
--- a/configure
+++ b/configure
@@ -67,6 +67,7 @@ earlycon=
 console=
 efi=
 efi_direct=
+sbi_exit_code=0
 target_cpu=
 
 # Enable -Werror by default for git repositories only (i.e. developer builds)
@@ -141,6 +142,9 @@ usage() {
 	                           system and run from the UEFI shell. Ignored when efi isn't enabled
 	                           and defaults to enabled when efi is enabled for riscv64.
 	                           (arm64 and riscv64 only)
+	    --[enable|disable]-sbi-exit-code
+	                           Enable or disable sending pass/fail exit code to SBI SRST.
+	                           (disabled by default, riscv only)
 EOF
     exit 1
 }
@@ -236,6 +240,12 @@ while [[ $optno -le $argc ]]; do
 	--disable-efi-direct)
 	    efi_direct=n
 	    ;;
+	--enable-sbi-exit-code)
+	    sbi_exit_code=1
+	    ;;
+	--disable-sbi-exit-code)
+	    sbi_exit_code=0
+	    ;;
 	--enable-werror)
 	    werror=-Werror
 	    ;;
@@ -551,6 +561,7 @@ EOF
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     echo "#define CONFIG_UART_EARLY_BASE ${uart_early_addr}" >> lib/config.h
     [ "$console" = "sbi" ] && echo "#define CONFIG_SBI_CONSOLE" >> lib/config.h
+    echo "#define CONFIG_SBI_EXIT_CODE ${sbi_exit_code}" >> lib/config.h
     echo >> lib/config.h
 fi
 echo "#endif" >> lib/config.h
diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index b1163404..c46845de 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -6,6 +6,7 @@
  * Copyright (C) 2023, Ventana Micro Systems Inc., Andrew Jones <ajones@ventanamicro.com>
  */
 #include <libcflat.h>
+#include <argv.h>
 #include <bitops.h>
 #include <config.h>
 #include <devicetree.h>
@@ -163,7 +164,8 @@ void halt(int code);
 void exit(int code)
 {
 	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	sbi_shutdown(code == 0);
+
+	sbi_shutdown(GET_CONFIG_OR_ENV(SBI_EXIT_CODE) ? code == 0 : true);
 	halt(code);
 	__builtin_unreachable();
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
