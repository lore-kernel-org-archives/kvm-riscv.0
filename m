Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6202C83F03
	for <kvm-riscv@archiver.kernel.org>; Thu,  3 Jul 2025 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VnkF1wwdwazCSwP9VhQRCAd1BL7Jcp2vj21Mtjs+Oqs=; b=dLGwPYo+7//pGs
	L9svthB72pQFoNStovnrC61PcN8hGrciqUaQAQHglrCs1FgvPGfvFKIKnZXD0+bW/CnCJ+8cFJRuA
	szFdAqlCyGBsbpQ4Z24Uq7nARxy5LNYrpJ46AP0x9llCivscJimG7+u1R/O7t3xXqblqKpSZkCt8e
	sNO0gtopnEfdFEP/AtkxEuiiUCRVHF0w9bZ67EJlKJsQ5gtVjla75u5NNvnJIeiE2CYbpRGUClfGg
	nf7uI3y+Ymq3YDNsZZSRxaPRYie9RuvGetxtP+1hRpR4EVqpJ7YNCqyAbp/pTuiPequDgHEmZBGcE
	OZfMhSe9AIPV5qum6vvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXLw3-0000000BpzU-12kt;
	Thu, 03 Jul 2025 15:33:15 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXK6d-0000000BW7x-3qwm
	for kvm-riscv@lists.infradead.org;
	Thu, 03 Jul 2025 13:36:07 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fad79433bbso52650886d6.0
        for <kvm-riscv@lists.infradead.org>; Thu, 03 Jul 2025 06:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751549762; x=1752154562; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AybLdMIaTX7u240+QRHcmMiae8oJPe3j6zxp6xpwSS4=;
        b=D3A4ARGON0mofBqZCtzB20kXF3Kab7t2KJold5zshohD6TRSMASS5dROuwaTo4oP1c
         wN/Ziz8AA0ailbSdFgo4tY/pkHRPOKeQL29nw1t6O3FT4z4ZDm8m3WMZpzSwfnKor/xQ
         +DF02X2ukGwYjo4KJ+NW5Iy3FyYItoRYdU7FFpBEzVyYuuIZzYsUjYJqOve0jGdJyDQT
         1lb1KA4lYQ+CuVFGYzjMNQK+e8VxD3HFkcKtDz6wZHHFBaYC9YWpsz0w3uklNqYRg0iN
         N+gIBVQjkQweHm66/G4tZgslYctsIAYZkEtCF5FiukLBfXyxVRHCAoxWu0SRxGOsZIya
         Up0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549762; x=1752154562;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AybLdMIaTX7u240+QRHcmMiae8oJPe3j6zxp6xpwSS4=;
        b=EYQduXs1I7LFj9kk3vGRRkBoKyiZhWabQpNZXhKc4zRQ71YIqYsTCN2PxYvMLMEX2p
         8viLPy8da+jN8atC9wQEyPu7Ar7QVnXYhtOZ0fcL+8Un792ccTq7v9rSB5hnXy6eOAm+
         RAbOXWtEy7WWDscjwKFyzXXoob0WGXKnScMUwR0VEKUIK/H2k/JtgoUrWHY6fODLRiYG
         5uV6f85vo1D2cgWPL90+2V0sdnvNX+I+7tPV5lufPWXRa0sGXS2AhuSDK80vFLksO9uI
         FnQg7+4URwl1Bq3GBxnvDKLs5FXGHgTo2pbxGt+dEp9j6Zsom1SmYasnBCgLVoedQbGp
         eAXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRwbCrBxKm2KCSZSEkFmGW4MjwLfnzorfSxy4toG5fVFpkAVVOCNkaA7DRXDwqNhERq56gNQu3hTY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwP4Xr2yKDLHUJJbeT1pozstJrqCmkpgMP9LFFY/eqTTCcr9Olq
	4Mqn/2pxVe7Qb55b6JpB922CPMWp+qQqc9B56HE6D/9KR7QWLTN/IOhML/oxif7XSxo=
X-Gm-Gg: ASbGnctHYcXIWNbXLXP+uEQDaayTwoflFOip3v/WYEd3Z/eVQ6QAMQIsU1yWjfdsoF/
	Jj9VLROYOwiJ0c+QmGq5EtqoANl9grstI2I+iIZ9xuf7Ekkqm0Fr4ktOCLd11crORCSJnzXJ/6T
	xait3fW3M4TbhLX2U6/DqMqpe2/LNqUm+6d1FO9OQv5LRYZemeJhW4vkV0XwCGk6NgnOVxO5vGX
	sCwKJtCrGq5YjCV+xaLfQJf24yg23ZATx55kQQII9bi4RzljvajEIAHLzd5ph1ZUlngEQJkxst0
	TKhBMCGPxMkqs1laG951bGJw+bbUJ9yodjPlty/r+z95YVcQIPvN1qnRB1tyruXzVLmqsn/qRWI
	=
X-Google-Smtp-Source: AGHT+IGHeqWTScI42ieZ9hlCd88aWLNR5bd/wuHidBIbPxL/tKCuhIsA4xmBVc4nHMWIIMW8e4W9lA==
X-Received: by 2002:a05:6214:5a0c:b0:6f5:106a:270e with SMTP id 6a1803df08f44-702b1c118e8mr103093756d6.44.1751549762212;
        Thu, 03 Jul 2025 06:36:02 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com ([96.224.57.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730af00sm118166016d6.113.2025.07.03.06.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 06:36:01 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH] riscv: lib: Add sbi-exit-code to configure and environment
Date: Thu,  3 Jul 2025 06:36:00 -0700
Message-ID: <20250703133601.1396848-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_063604_064726_25E0272E 
X-CRM114-Status: GOOD (  12.22  )
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
With the default value disabled.
Add a check for SBI_PASS_EXIT_CODE in the environment, so that passing
of the test status is configurable from both the
environment and the configure script

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 configure      | 11 +++++++++++
 lib/riscv/io.c | 12 +++++++++++-
 2 files changed, 22 insertions(+), 1 deletion(-)

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
index b1163404..0e666009 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -162,8 +162,18 @@ void halt(int code);
 
 void exit(int code)
 {
+	char *s = getenv("SBI_PASS_EXIT_CODE");
+	bool pass_exit = CONFIG_SBI_EXIT_CODE;
+
 	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	sbi_shutdown(code == 0);
+
+	if (s)
+		pass_exit = (*s == '1' || *s == 'y' || *s == 'Y');
+
+	if (pass_exit)
+		sbi_shutdown(code == 0);
+	else
+		sbi_shutdown(true);
 	halt(code);
 	__builtin_unreachable();
 }
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
