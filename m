Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FE8C54FB3
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aS/DY80cLWubY2ROKeX86+3kbrp8EeICvYVIgZ1XK0Y=; b=zgq9EVaDDAcgKj
	vgB/WMyaqiDQ7F2nr3ZgOjkauXznmKWb1rsbuDpGo02o9JNgZQdBKvbXpS+HzQ07DMg0GVkH2mTm5
	8dwP02migRDaNtqjJsc/8rD1SBdyWrQNTQSAyLdvhUvsRtfZJ28WRXtZ6HfsAPLcRsmjM50mTz6n2
	5KuG5zq447WQ6iyxIBBkvIv2dKn/24tvvlzvWxMrA4dBPJWgSWRGZ8M5u7TOtUXbNtbKzG3jXLRuC
	QOSZ8I/531j/VTHz44/uKBYeEM1FRDEYmuRuLGxC0Zb+1L8aDR8Bld3vwHnumflEdAVNyO4ZSQ3/4
	CM0AYsXkcWCuxL04QMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbF-0000000GcMB-1Dea;
	Thu, 29 May 2025 22:19:45 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbD-0000000GcKV-1glY
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:44 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-30ea0e890ccso1274332a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557182; x=1749161982; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=rpZO/SNMSsOcnIVwvmjBs9Kka2MdSZSqrGAzddRxVBc=;
        b=n9BA7zadPPs3FxqpOhAaDs81SOW8UOZXenb/6yYYBSDrFBclMHwpUmOBj3gOniVjQ/
         s0GoehmGRjRI7r6UB7SfCHuWUiHONysUXQtHcrzI4UfugTEJsMri+cmEOJigSD6qCj8n
         aY2/qnhig1MY2plYyCZLKztGCGIiBo8cQmhXHpuAjkjy+mVmpetiDppxVro4097UwVDD
         hutVEMOjHydpfQWKdl3CCIsfk/4z6ZaDXMQbzUMQvCaj4vZcJsreuY0Fm3Y2G/fAvaZb
         EhgNvDbUlKoHV1bbhhTfHNJtMXJmbAXSSa6+8bFOrU539clv3hLYLHugCMybDlkYOfxh
         4P2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557182; x=1749161982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rpZO/SNMSsOcnIVwvmjBs9Kka2MdSZSqrGAzddRxVBc=;
        b=kLuaxas3URRB69mpwppd1XV5LEPwYvef6Xrhqgf0TNNreyPVXJu0ZW9yQmS96ZW9Us
         QXVi6TYWtYEWMdnMQtjp0WivwTM3YY9ns2CAw7ou+o/usNWgrKOPCKYFC3pIbi5GoBTe
         KhUuBS8nIDDShtkDISIo7iHUMD+F2TOVC3uZgitiRRkE5m6+1Vim8t1jAoxp+eGzZW7L
         KRPesbH52nQTxM2W/0SNMYkoBvpmonCFfFy+3wSGcuGFkoRR3SD3wOaVYXcycjKzx3aQ
         fJBmWUtLcyYKi9TURpKNzQngqLhMt8hsVGUgAO2LsLw6w6al/QctJWCwpcbABpahuLm5
         vzCg==
X-Gm-Message-State: AOJu0YzR7cS2ey/UH5u7cF5Y9KylatuByQg7xMSiwyk84ne4l4k3SV0f
	S1Rz/m7KNM51yl+UnhvwOFDLqKDFs4IQyr0P9xAZd6jFFy3eLbiElWOzrqwXZVJ7JXcCEeV5U6l
	CS6OFuw==
X-Google-Smtp-Source: AGHT+IEFFQIS9pAD1OtOGGAF6xmOZ0qMis9t3+vFz2wQSGrnYMTgXB8pN/6JJfuvmcH9p/ci+jWPOkR4qYg=
X-Received: from pjtq15.prod.google.com ([2002:a17:90a:c10f:b0:311:e9bb:f8d4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:510c:b0:311:e8cc:4264
 with SMTP id 98e67ed59e1d1-3124152923amr1943106a91.12.1748557182148; Thu, 29
 May 2025 15:19:42 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:14 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-2-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 01/16] lib: Add and use static_assert()
 convenience wrappers
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151943_441361_4FD21A97 
X-CRM114-Status: GOOD (  15.15  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Add static_assert() to wrap _Static_assert() with stringification of the
tested expression as the assert message.  In most cases, the failed
expression is far more helpful than a human-generated message (usually
because the developer is forced to add _something_ for the message).

For API consistency, provide a double-underscore variant for specifying a
custom message.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/riscv/asm/isa.h      | 4 +++-
 lib/s390x/asm/arch_def.h | 6 ++++--
 lib/s390x/fault.c        | 3 ++-
 lib/util.h               | 3 +++
 x86/lam.c                | 4 ++--
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/lib/riscv/asm/isa.h b/lib/riscv/asm/isa.h
index df874173..fb3af67d 100644
--- a/lib/riscv/asm/isa.h
+++ b/lib/riscv/asm/isa.h
@@ -1,7 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _ASMRISCV_ISA_H_
 #define _ASMRISCV_ISA_H_
+
 #include <bitops.h>
+#include <util.h>
 #include <asm/setup.h>
 
 /*
@@ -14,7 +16,7 @@ enum {
 	ISA_SSTC,
 	ISA_MAX,
 };
-_Static_assert(ISA_MAX <= __riscv_xlen, "Need to increase thread_info.isa");
+__static_assert(ISA_MAX <= __riscv_xlen, "Need to increase thread_info.isa");
 
 static inline bool cpu_has_extension(int cpu, int ext)
 {
diff --git a/lib/s390x/asm/arch_def.h b/lib/s390x/asm/arch_def.h
index 03adcd3c..4c11df74 100644
--- a/lib/s390x/asm/arch_def.h
+++ b/lib/s390x/asm/arch_def.h
@@ -8,6 +8,8 @@
 #ifndef _ASMS390X_ARCH_DEF_H_
 #define _ASMS390X_ARCH_DEF_H_
 
+#include <util.h>
+
 struct stack_frame {
 	struct stack_frame *back_chain;
 	uint64_t reserved;
@@ -62,7 +64,7 @@ struct psw {
 	};
 	uint64_t	addr;
 };
-_Static_assert(sizeof(struct psw) == 16, "PSW size");
+static_assert(sizeof(struct psw) == 16);
 
 #define PSW(m, a) ((struct psw){ .mask = (m), .addr = (uint64_t)(a) })
 
@@ -194,7 +196,7 @@ struct lowcore {
 	uint8_t		pad_0x1400[0x1800 - 0x1400];	/* 0x1400 */
 	uint8_t		pgm_int_tdb[0x1900 - 0x1800];	/* 0x1800 */
 } __attribute__ ((__packed__));
-_Static_assert(sizeof(struct lowcore) == 0x1900, "Lowcore size");
+static_assert(sizeof(struct lowcore) == 0x1900);
 
 extern struct lowcore lowcore;
 
diff --git a/lib/s390x/fault.c b/lib/s390x/fault.c
index a882d5d9..ad5a5f66 100644
--- a/lib/s390x/fault.c
+++ b/lib/s390x/fault.c
@@ -9,6 +9,7 @@
  */
 #include <libcflat.h>
 #include <bitops.h>
+#include <util.h>
 #include <asm/arch_def.h>
 #include <asm/page.h>
 #include <fault.h>
@@ -40,7 +41,7 @@ static void print_decode_pgm_prot(union teid teid)
 			"LAP",
 			"IEP",
 		};
-		_Static_assert(ARRAY_SIZE(prot_str) == PROT_NUM_CODES, "ESOP2 prot codes");
+		static_assert(ARRAY_SIZE(prot_str) == PROT_NUM_CODES);
 		int prot_code = teid_esop2_prot_code(teid);
 
 		printf("Type: %s\n", prot_str[prot_code]);
diff --git a/lib/util.h b/lib/util.h
index f86af6d3..00d0b47d 100644
--- a/lib/util.h
+++ b/lib/util.h
@@ -8,6 +8,9 @@
  * This work is licensed under the terms of the GNU LGPL, version 2.
  */
 
+#define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
+#define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
+
 /*
  * parse_keyval extracts the integer from a string formatted as
  * string=integer. This is useful for passing expected values to
diff --git a/x86/lam.c b/x86/lam.c
index a1c98949..ad91deaf 100644
--- a/x86/lam.c
+++ b/x86/lam.c
@@ -13,6 +13,7 @@
 #include "libcflat.h"
 #include "processor.h"
 #include "desc.h"
+#include <util.h>
 #include "vmalloc.h"
 #include "alloc_page.h"
 #include "vm.h"
@@ -236,8 +237,7 @@ static void test_lam_user(void)
 	 * address for both LAM48 and LAM57.
 	 */
 	vaddr = alloc_pages_flags(0, AREA_NORMAL);
-	_Static_assert((AREA_NORMAL_PFN & GENMASK(63, 47)) == 0UL,
-			"Identical mapping range check");
+	static_assert((AREA_NORMAL_PFN & GENMASK(63, 47)) == 0UL);
 
 	/*
 	 * Note, LAM doesn't have a global control bit to turn on/off LAM
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
