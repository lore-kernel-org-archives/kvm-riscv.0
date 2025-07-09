Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E87CC83F03
	for <kvm-riscv@archiver.kernel.org>; Wed,  9 Jul 2025 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IBCPpYbudOBKRWZ3BCqguBUzDsQZHVNky/j5JTQnsKI=; b=co24aTfhnbi+xW
	Ru6QPPmlQMUuUWROPLZI31Y3GiOnqCrBI3OHt5xEzP4mN4e1PxxMNdHPfeWys9JQMetl4NXbtQte/
	/4soZbPLm43Fvh+XEM89B6bBniH+CLtf8SRiJzUV7oFnJyZjlvEHS+eD4dCkZs191F84oGwFXblMC
	q1Wd46Gdz+hbjQhiW/nxzLYxK8ZyCeMu0tEpdSHMusSahODbnGawVTqbOJZIiRxoOmDD9bphVUEbK
	ZvvYcfkCMlcqcejqJQ+Gsw0dj1M1gZGmD7WPygYLYcCfFb4AerHFwsDVAeMj5thUNwWTQ5GLH08Qz
	wMbZWVGXgsWeoqYBqOtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZXCG-00000009EtD-1iMx;
	Wed, 09 Jul 2025 15:59:00 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZV8g-00000008pQV-0qoW
	for kvm-riscv@lists.infradead.org;
	Wed, 09 Jul 2025 13:47:11 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so103453185a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 09 Jul 2025 06:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1752068829; x=1752673629; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=as6bKKqAeltmDz2NBbzQMBxQaUhQ849TT+d9T/+6Oes=;
        b=I0c1uFzcQAII1hISgF2y2ku+dU9TOpYqLtxOuTrDNdRzidMHs4IH0BkbNlyWdIsFBv
         MwKLrtYmYJgIJCaiu4vEtrssg52vzAxKPFzxrVsuwZQsIUoXd/A3rnVo602VwnEpVPVY
         VmW+ZVFNMK12JxyDsmpJinYs7+d5BhDntZA30ELqZiRUzLdD3NQIdSTinj7AfxdDUkJz
         J9tm3O/jI+y3xBixyMpaR/ElT7GkCWWkSQiZOJ55dm3Y5FhlgPHfOYgMUeR1R94w7Zb3
         uWFDA7thb7fy1yDL/wCiWB4pQsCtREroPCeM4lw0JbHIBgTCti/PkNOQKzueXlw+r0uq
         8pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752068829; x=1752673629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=as6bKKqAeltmDz2NBbzQMBxQaUhQ849TT+d9T/+6Oes=;
        b=Vkmr6TAapS9AQ7jkqeVwlHUI1ul+N8T4/r4xqpO2eKWGcHC91Glx1WitDwoyf2Vfk1
         1YVL0PktXwAATG55fexuk015s5vgvaRCVLFwdinERBBTKeFpLFGqQIap1yCXD6k64e3G
         Iu+BHiNNyD9w22ZwvLv22MbBpqeeQwnLt19tp5WLhcdUnF+6dGS6SfhiV0864opR6O5d
         EYZwsFGa0UegIqwKLVAUcPg55GHyIzjaW/I2O3OPDSSTCzb23b80ZVD8uvCdjUVuBxpt
         GH8DG8nL6eyQJ4q2kdHWBOJnKtILkFK+o1z95dm8OlLY2kr3gtQ8SXDakC0+qNCM8qPm
         RPVw==
X-Forwarded-Encrypted: i=1; AJvYcCUqJcJw4QH6RYNjWGOtMN1b6jdETpnK6trVvYon6WDJKsPBMK+WuAYQkYnlpBWsvoPMKAIW1VTqx5k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxlIpXU2CP9H5xCPzAn/AsMwdKOzogeDqsrLHcHygFGshzSGxya
	ILmpW6J9CInpGeTG9eMr8VkHk1Gh+0/hS8TbTAmVABSumRZhWoUOuK9rc5A/IlofOW0=
X-Gm-Gg: ASbGncu1LIHJHQvXsJcoLoSXpT5dafB4EmMeoDGIni+pBeQSr5qPTN3OSG24x4fHQV3
	MLOLNTJCckvNFnnWgTXntKU2kT0WtML8UeW5l8C4q/tydEtgiekobs4/6+FYePUd2e5oJSoK5Dy
	jahzx4LctY8e5rLwayFe0uWfTmlJsBUS2roJU4M43XQYIAsnpO6jBilJhOl3CHT0RrPg0B4wtBH
	H829E9vV9gRaGAgfpSjjTlJCcz56xKoeWBZv8BNe1PbXbNxcGMUx8nnJbZYK3W+t59TuzisxNzl
	qPFBk9jQP/Ct89GO8qXqegGF9Za3fRegS1BGfOKqLkwDhOUjifR0gXzaNYs6iOZnq5qM4jrgE9x
	JyilhUrVVM3BkwpGTO1qKIg0VWSx6CsJa1y2UaAOab3zT5j7SaXo=
X-Google-Smtp-Source: AGHT+IFFOoPOK9HHuurYgBtAvAo/xFEpWH1qHEPx2DaCo05dCGJJDXDCvW7ag9Ftcb/+qbtODa7JSA==
X-Received: by 2002:a05:620a:488f:b0:7d4:5c68:cf77 with SMTP id af79cd13be357-7da1fcc4946mr1014588485a.19.1752068828837;
        Wed, 09 Jul 2025 06:47:08 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d5dbdb5088sm937846285a.25.2025.07.09.06.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 06:47:08 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 1/2] lib: Add STR_IS_Y and STR_IS_N for checking env vars
Date: Wed,  9 Jul 2025 06:47:06 -0700
Message-ID: <20250709134707.1931882-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_064710_327441_8DBE0CFF 
X-CRM114-Status: GOOD (  17.56  )
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
is used in a few places add a macro for it and its 'n' counterpart.

Add a copy of Linux's IS_ENABLED macro to be used in GET_ENV_OR_CONFIG.
Add GET_ENV_OR_CONFIG for CONFIG values which can be overridden by
the environment.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
V1 -> V2:
 - New commit
V2 -> V3:
 - Add IS_ENABLED so CONFIG_##name can be undefined
 - Change GET_ENV_OR_CONFIG to GET_CONFIG_OR_ENV
 - Fix it's to its
---
 lib/argv.h        | 38 ++++++++++++++++++++++++++++++++++++++
 lib/errata.h      |  7 ++++---
 riscv/sbi-tests.h |  3 ++-
 3 files changed, 44 insertions(+), 4 deletions(-)

diff --git a/lib/argv.h b/lib/argv.h
index 0fa77725..111af078 100644
--- a/lib/argv.h
+++ b/lib/argv.h
@@ -14,4 +14,42 @@ extern void setup_args_progname(const char *args);
 extern void setup_env(char *env, int size);
 extern void add_setup_arg(const char *arg);
 
+/*
+ * Helper macros to use CONFIG_ options in C/CPP expressions. Note that
+ * these only work with boolean and tristate options.
+ */
+
+/*
+ * Getting something that works in C and CPP for an arg that may or may
+ * not be defined is tricky.  Here, if we have "#define CONFIG_BOOGER 1"
+ * we match on the placeholder define, insert the "0," for arg1 and generate
+ * the triplet (0, 1, 0).  Then the last step cherry picks the 2nd arg (a one).
+ * When CONFIG_BOOGER is not defined, we generate a (... 1, 0) pair, and when
+ * the last step cherry picks the 2nd arg, we get a zero.
+ */
+#define __ARG_PLACEHOLDER_1 0,
+#define __take_second_arg(__ignored, val, ...) val
+#define __is_defined(x)			___is_defined(x)
+#define ___is_defined(val)		____is_defined(__ARG_PLACEHOLDER_##val)
+#define ____is_defined(arg1_or_junk)	__take_second_arg(arg1_or_junk 1, 0)
+
+/*
+ * IS_ENABLED(CONFIG_FOO) evaluates to 1 if CONFIG_FOO is set to '1', 0
+ * otherwise.
+ */
+#define IS_ENABLED(option) __is_defined(option)
+
+#define STR_IS_Y(s) (s && (*s == '1' || *s == 'y' || *s == 'Y'))
+#define STR_IS_N(s) (s && (*s == '0' || *s == 'n' || *s == 'N'))
+
+/*
+ * Get the boolean value of CONFIG_{name}
+ * which can be overridden by the {name}
+ * variable in the environment if present.
+ */
+#define GET_ENV_OR_CONFIG(name) ({				\
+	const char *genv_s = getenv(#name);			\
+	genv_s ? STR_IS_Y(genv_s) : IS_ENABLED(CONFIG_##name);	\
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
