Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4873C83F0A
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t69l5+8QoSdPdgL9JvHbyeEBY4iHzUcl3Jb/i5EMURw=; b=QS4WcesRZYl4SB
	0eq9eldAg/ew1/nmos0RMw9KHVgnYINp8cBG39DgQ8h1h7zBMKx2mTStrzhuDhDE1frV0jAB0YR8/
	HwBxOxqqpzzUu/J6Odw6W8m6BfP9q8V6ewp6Kp48TJatFS7x7yDeOfcFirXUteKguwCLOTqC67JQR
	mn46YbJdca5UODO8/u2Pp4/y7v7DIVwJqq7bH+7dMTpuwyv+WcdyCYjwAKiDQeokvf+/w6RdjzU9o
	sfF1dncwpjNU5KKA7mlRW/7LMotGm8v26QTN78kLwcf0tttCmMBnwV4HGxA93b3WzK9plshMXX6Ne
	UYx8qKyemozM+YFsE84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZB5u-00000005xSp-0fmY;
	Tue, 08 Jul 2025 16:22:58 +0000
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZAYI-00000005rtD-20L3
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 15:48:15 +0000
Received: by mail-qk1-x731.google.com with SMTP id af79cd13be357-7d9f5bf544cso118336885a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Jul 2025 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1751989693; x=1752594493; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jdccv8r6kG2HcBolVBSqhEyDLxi/NJUpMCqQXxW/BNg=;
        b=uEs72bvPFOJMl8BzRRMh/1cgwHy5WWRE/xDDWNu5OfDCSH8f6hAAUeXjLqz1DAu9n1
         ahaESQwPGEZCY9L9vUPWWD3/VvPnaDsjpt9K+COXGQwhF3X1496yRGdoFFMHazByx+Tu
         bLztQW5bj04Gq4WildPRGkvKxu3hiedupBf280XSEP1bAqKSmLG+Z8Jlukvv//6Pw7nI
         CD+Y07gwjM9S2sZeVvsu+AnPk5FTdMYahl1YZTo5YxQBeFAjFw8HnaaGByc2k3WB/MGG
         shMrEFeCVRBkZcsKvEQI0yoDOom+/h0r2m48hq8anO1p4wL6cqpu04/NKAedhf4z67fh
         H7Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751989693; x=1752594493;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jdccv8r6kG2HcBolVBSqhEyDLxi/NJUpMCqQXxW/BNg=;
        b=jAoGTPRv38ZWGB2b2TKJHI7jDGjGSnsqU2zTD3pZTZk8bPVEs4KtPgXAOap35SMBnl
         F8RDqhD7KAC+JlrL+ZSoNfWvfjJFokSaVy2jCzJGaCTl/qhASfXtK68JmhynFS1TOnLR
         XkCBc3FpcPdotKN2N+rGCJF/CAX7wbmJ4psqBXoKnUz57R3fa5WEmixbEU1s72I0O0Mw
         cLYNoeFJqBHnxEzumrbwidsk0XQ2YxUvSyS6ng24GoLgyOUW6J/4Ebo/YvcPn4lLR1jU
         gAQKKT2FmMlabPLLc2CfkTeRBod47bbq1N18GuVKvZDdw8cYeI0WoI29iwL/9S+Llfgk
         8m/w==
X-Forwarded-Encrypted: i=1; AJvYcCXP/cpUDzTXOjVoClYPzlhPFESODw//+j4XWldJSMq640JrF3XGkgHAdAuoRNMaSO2auYH9eORnhko=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo42Fjy+4WUe0xyl4yvhs6bwREo/Z8lSpWTckx45gsodEEfYv2
	YVNaj7HDZi3cOy7DorIXQOvgcMufySRogypkJSd/mn4umZN2aR/5/36Wn8z/nOCQK6M=
X-Gm-Gg: ASbGnctGeC9E+2mTIGFacvkedSI1r9E2uHm/b73mvRm8lJnSSQkkfcOfolZS8Ojqaww
	iaf2RnSpLS9qJkITtqDgxtJmYgfTx5ccnj93NtIUjl3P+w/fstbv9HX4PkgUnOsG+mSIjcSdDMw
	mJc7cyZJ9xEb30Prcr6U84QGEHtzlVs/tOmua7ackcsHvlbqEedupQGNxFK2ozjeO4NwbdridZb
	iucLbN5MTm+TEs66l9kzI0jHlCl2dGVu8zFeHJewxPRx76Cmx0Ads3fP6W4Bi1BCfnfBYYe/AnZ
	fBSFzSLlLXF7gja73hkWXmw+uDA22j8krFzQYDtiedGm8HZK8b/SS5WveKSP0KGUHw321KVtSC7
	lJG0xcCY8mO1hTTYaf/VRPj449dbyU0oqRdFMb6XFw8wfQpY1QUI=
X-Google-Smtp-Source: AGHT+IE10mwZp93cedil7BBoyf7eRyBi7gEfNMAHy9LlTfGe5O2WZp+UKFVlKh4/QpyDqG/ZjLpyWQ==
X-Received: by 2002:ad4:5ba3:0:b0:6f8:d223:3c32 with SMTP id 6a1803df08f44-7047d96feaamr62114746d6.10.1751989692807;
        Tue, 08 Jul 2025 08:48:12 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-702c4d5ab9csm78453346d6.87.2025.07.08.08.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 08:48:12 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v2 1/2] lib: Add STR_IS_Y and STR_IS_N for checking env vars
Date: Tue,  8 Jul 2025 08:48:10 -0700
Message-ID: <20250708154811.1888319-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_084814_647849_834B2BC5 
X-CRM114-Status: GOOD (  12.61  )
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

the line:
(s && (*s == '1' || *s == 'y' || *s == 'Y'))
is used in a few places add a macro for it and it's 'n' counterpart.

Add GET_CONFIG_OR_ENV for CONFIG values which can be overridden by
the environment.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/argv.h        | 13 +++++++++++++
 lib/errata.h      |  7 ++++---
 riscv/sbi-tests.h |  3 ++-
 3 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/lib/argv.h b/lib/argv.h
index 0fa77725..ecbb40d7 100644
--- a/lib/argv.h
+++ b/lib/argv.h
@@ -14,4 +14,17 @@ extern void setup_args_progname(const char *args);
 extern void setup_env(char *env, int size);
 extern void add_setup_arg(const char *arg);
 
+#define STR_IS_Y(s) (s && (*s == '1' || *s == 'y' || *s == 'Y'))
+#define STR_IS_N(s) (s && (*s == '0' || *s == 'n' || *s == 'N'))
+
+/*
+ * Get the boolean value of CONFIG_{name}
+ * which can be overridden by the {name}
+ * variable in the environment if present.
+ */
+#define GET_CONFIG_OR_ENV(name) ({		\
+	const char *s = getenv(#name);		\
+	s ? STR_IS_Y(s) : CONFIG_##name;	\
+})
+
 #endif
diff --git a/lib/errata.h b/lib/errata.h
index de8205d8..78007243 100644
--- a/lib/errata.h
+++ b/lib/errata.h
@@ -7,6 +7,7 @@
 #ifndef _ERRATA_H_
 #define _ERRATA_H_
 #include <libcflat.h>
+#include <argv.h>
 
 #include "config.h"
 
@@ -28,7 +29,7 @@ static inline bool errata_force(void)
 		return true;
 
 	s = getenv("ERRATA_FORCE");
-	return s && (*s == '1' || *s == 'y' || *s == 'Y');
+	return STR_IS_Y(s);
 }
 
 static inline bool errata(const char *erratum)
@@ -40,7 +41,7 @@ static inline bool errata(const char *erratum)
 
 	s = getenv(erratum);
 
-	return s && (*s == '1' || *s == 'y' || *s == 'Y');
+	return STR_IS_Y(s);
 }
 
 static inline bool errata_relaxed(const char *erratum)
@@ -52,7 +53,7 @@ static inline bool errata_relaxed(const char *erratum)
 
 	s = getenv(erratum);
 
-	return !(s && (*s == '0' || *s == 'n' || *s == 'N'));
+	return !STR_IS_N(s);
 }
 
 #endif
diff --git a/riscv/sbi-tests.h b/riscv/sbi-tests.h
index c1ebf016..4e051dca 100644
--- a/riscv/sbi-tests.h
+++ b/riscv/sbi-tests.h
@@ -37,6 +37,7 @@
 
 #ifndef __ASSEMBLER__
 #include <libcflat.h>
+#include <argv.h>
 #include <asm/sbi.h>
 
 #define __sbiret_report(kfail, ret, expected_error, expected_value,						\
@@ -94,7 +95,7 @@ static inline bool env_enabled(const char *env)
 {
 	char *s = getenv(env);
 
-	return s && (*s == '1' || *s == 'y' || *s == 'Y');
+	return STR_IS_Y(s);
 }
 
 void split_phys_addr(phys_addr_t paddr, unsigned long *hi, unsigned long *lo);
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
