Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A454C83F0F
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NMaSw6q5/6CgTV0ArLJI3lBcX6gR5dxidqkq9DYDPb4=; b=CtEQAMGp2tm/t0
	GJfoD4arGZo9/Q5FanldXqr5U/Ps3fFvu4hwYQHm+yUxTOd0SF1Xk5bRe11dwAVXazhHlTX8lY9GJ
	E+J/G5HBrO5NCRusi8r+fpMm3MFA7ONt/xGWZo+cQMCDVhUYFq1bdJaReygKFwjH1jCiJb48/9VzV
	CIy3vvoRvjOWBo1gzcW1KGZKBc6YI/fz7B1VJ+eo5drlor38JPNM57HZyOdsgCLx21tJaO7tacvox
	fmkRT4mWJTxzEUpCvkYwQBC86y0W5QIvOsuTtJ+fcTkkkb4/m8Vs7tW59nyOSxgo3kB4Ws5lEtmpu
	k+uoFCWE8IdJilG7BXBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXCG-00000009Eta-3dRz;
	Wed, 09 Jul 2025 15:59:00 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZV8h-00000008pQj-024Z
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 13:47:12 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7da6ca0f1acso192377185a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752068830; x=1752673630; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkQL/QnW0HIaHElVDSrszmZZE65FaoB07Pptz0kqcu0=;
        b=ti6k+/Eg+/CiDQhainNTPDVoVSkv0tUUdIJkBUnBTaL+RwTOX0d3wsjjjEyMfAssOc
         j7jodY6UJcpqw0+20caNU+X3AoRG+eYxaXRQPWWIV5YZmBlqA85vqABelYWGpYgKfFmx
         YcCTPvvDJ4PoqaevIoDGqLq55iKi8XXtMWV8gTlbJT/ZeCHYl10Yd8S0D2UtEE1lq+Dq
         WsILpWJ/H69Isvi5gXZKtvpGDDbvcJ9qD0hp1Mx0Ka71+LaLeaxJcjIIRScCEinJJkit
         O6KJRbqtXEsHy39NWOr/Qlg9YL+CCcY/ZCoDRwmGAMsgoi2SIHWFRLy3u9R9Y6fC5vaE
         +S6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068830; x=1752673630;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PkQL/QnW0HIaHElVDSrszmZZE65FaoB07Pptz0kqcu0=;
        b=rGLiPPEmENyVwxPe9dvqSCFVQW6xmkm+PDY24wFeT3Rmwv9TGUPBc3ugGMEqynpCZN
         8DZW5ptwBog5qw/StUEAX5+NMsRKNCFx6+YOl3z9bOTP57X3508TajsNgiHSA/4N6UHI
         8HKM8eVaLoseuCOFZMzNSKTtJmi+re7NrRVkXarDWXH8+KcsGz4dy+zhnb8GnKLoNWCZ
         p9/tG/ZSBGSuobAEIJt/kWE5uZUYd1WmNpPR5btZiZOIcw/ezWACn5i7bfQ3T41Ir6Yx
         ExndG6GGPo/MHwUxva+FBNZIsxehXYDbNFf2zbIsdouJu5an7Sf18RL+da5M7Sem8ssh
         8lBA==
X-Forwarded-Encrypted: i=1; AJvYcCWIZGzmikt6LHvrohesbaMFu0m3Ei/jSwimJe84wQMD/HybVx/X/qf8X0xajWSxYuV0s5lq2KTen+g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYHVSJe03yh6KQa43lQ4fFIIDWhLQQjElNO1FQ8A5RKHGh/tHj
	vA9yTsuyEfso/KjrYDQnoFY55KhLIP5FYJdsm6dkH1Ib74xHHFIJFTp5ya4Qw6ET/HY=
X-Gm-Gg: ASbGncsqxNPzpHx0/DsgP3oiHojR66LfDGW/JoIDcyc3cCW5qFXdyd7XfMHEffOPmH3
	rLqnHSSEBaoxY+Rw7rM9XMC+EXc22+RTROUDN7Ni/otXCOxHFjScVDvz2avBX9Vvpr4xE8NZn1r
	8E6KKP0bV4IRvOdp+MjFDfVxSDjd9u3CsogBGeFDBowKi1tW825vRPtvceIo1dec67yPhkcBB1u
	5FEyLOGLaQeHBhDe/0rv3nGxXGpyHDxw2vH0K8nDaJZIIjSlSrBn8KRxN9m8M4ERwiP1ypIAVrB
	rx1pSVs83Fglf8ZIOfZNufNvIv8MqxSH3xLyloBWC7RG+JwgKWWbELTLWsEniCXm35FzB6hJfee
	P8c8aQ2Z4zlvwV4g1JLC5+vuivlV6lVnimheqy4ebqvtBsJltJ5E=
X-Google-Smtp-Source: AGHT+IF6EabVBfNj9TyCGaqSVgiR7S7smfJ0nR0CAviq3h0164unEH7TrL4vBL/kFHbWctB/IwCQcA==
X-Received: by 2002:a05:620a:2544:b0:7d5:d0a1:c907 with SMTP id af79cd13be357-7db7cfa32f5mr370206385a.30.1752068829670;
        Wed, 09 Jul 2025 06:47:09 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb5088sm937846285a.25.2025.07.09.06.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:47:09 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 2/2] riscv: lib: Add sbi-exit-code to configure and environment
Date: Wed,  9 Jul 2025 06:47:07 -0700
Message-ID: <20250709134707.1931882-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250709134707.1931882-1-jesse@rivosinc.com>
References: <20250709134707.1931882-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_064711_043712_36EE69AF 
X-CRM114-Status: GOOD (  13.13  )
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
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
---
V1 -> V2:
 - Factor out commonly used macros to new commit
 - Use ternary operator over if
V2 -> V3:
 - No changes
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
