Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70C47C5B543
	for <kvm-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AOyzSewXl4ort3e69zvmEld9mqpJ0TAKFcufnR6o/Kk=; b=jNYmOKM6+1pcPS
	tM4Bs7S1Dv2O4VUDMfvFmAtLyhg1AHwWQVixeEK8r2g/5TTcDEAclBYTC70mtelrgLp/rEVDOr5Gh
	j5hPPrY428ZM6FqXTnBkSYl2MuVKrIclx036NAe3u/CXWlRaM+VKCEeygvJXTyS2TYtiLvwoL5F3C
	kuTqAoqqQUSKJJad1kcrsgPS7xR3Y5PuEXGY6LsBGJXBznUKamsXze36Ueq5yIv+MyBhmVrYzmjAm
	TI6HW3AORjB8/V/X1d+q20MzAeyTiCNfaQW9Nv4Wnv33paGimS5OGxpDVxdGhsJ8sNBAWBtvjX0HC
	auNqbOJ5NW31i3PN9DKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbO-0000000GcT1-0XJl;
	Thu, 29 May 2025 22:19:54 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlbK-0000000GcPM-1wHN
	for kvm-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:19:51 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-7394792f83cso1067189b3a.3
        for <kvm-riscv@lists.infradead.org>; Thu, 29 May 2025 15:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748557189; x=1749161989; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=79QgatSeJLN29Injm6R2SZu0EHopaY7TBBxJACXb4Ts=;
        b=eSH/vQ2Rpv0rjztQNe5Pgd2cXpeA4yW2L84S0H2RBdG1nINlyXk2eFBEoCZC04a8bx
         gjn/4xsC9EzwlqirugR5RxDHt/Sz53isazr67UCpCZDpBh8ZKmayIzSR+/BYVGlXc7q9
         tTTTgxIVuOZFr17uJmAnF9dmJBeo36rBUKG3OeXwUBp95FyaeTw4GjXgchGjbhFWd3rt
         DiaxSRo6aHe7my6UxViR0Bs/8Ez4ljyc8UwTyg21o7JGpRETfVYLvFyDIVABx8VA7Jjh
         UuZeV9bdvJe7z2efEnh2plQkaBKoNAJXXXIHsoYYu6lMI7I8j24Iu+oJhGrTT4nC8LSH
         snpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748557189; x=1749161989;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=79QgatSeJLN29Injm6R2SZu0EHopaY7TBBxJACXb4Ts=;
        b=HAEVk7YU1gPv8+/By3EzAnHxXFsIg257hasQCsKxM/4bWKXomcVDKN5L07u0N4r88Y
         lLZoJevdLw513qanpZRXEg2PIUsNBYpFDGgGEsgSQ/pB4EYgzlZhgWJTdHTrhvLNUqc2
         1iI9CdVX49m9+B+4A0qXi+ZDDYG8ani4sPpC0O7AWtyPpUWEOyg/cgVC0PyBLRseGB7v
         mkNJp02K1pWGTpJUtakkmfaA9yUT31FwSEGRMIMCA4sRHHeXYg7qOY9gdrxAixsX44t3
         /EpKLeLlb30fLVLRSvMx87fCks0njRVyAFPGGcOyO/YvZ8VJps0wGjGTW0jblYrxOItA
         RFEQ==
X-Gm-Message-State: AOJu0YxGGVYD89qJaNYXRyq4uyU8yEege1CbqQergsDMHUC+DjqagKLo
	UGk0ziAOhVWxID3q0GkqCmiMW2C2hFjDtg1rMWuuHK6QAq0TSf0YFBvZH+UaLzYMAMN7U7joDCi
	gT7k7/w==
X-Google-Smtp-Source: AGHT+IERht/QFRNHXBL3PGB3MEbLnWa68nmJAExKTfIaTPNzcYbSyNcF1baKmwu1g1rTX4sJ25Ap36OE6mM=
X-Received: from pgbcq12.prod.google.com ([2002:a05:6a02:408c:b0:b2c:4476:f3fc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:1583:b0:218:76dd:a66
 with SMTP id adf61e73a8af0-21ad95636d1mr1858084637.13.1748557189150; Thu, 29
 May 2025 15:19:49 -0700 (PDT)
Date: Thu, 29 May 2025 15:19:18 -0700
In-Reply-To: <20250529221929.3807680-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250529221929.3807680-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529221929.3807680-6-seanjc@google.com>
Subject: [kvm-unit-tests PATCH 05/16] x86: Implement get_supported_xcr0()
 using X86_PROPERTY_SUPPORTED_XCR0_{LO,HI}
From: Sean Christopherson <seanjc@google.com>
To: Andrew Jones <andrew.jones@linux.dev>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, "=?UTF-8?q?Nico=20B=C3=B6hr?=" <nrb@linux.ibm.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_151950_500044_0A1207C4 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

Use X86_PROPERTY_SUPPORTED_XCR0_{LO,HI} to implement get_supported_xcr0().

Opportunistically rename the helper and move it to processor.h.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 lib/x86/processor.h |  9 +++++++++
 x86/xsave.c         | 11 +----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/lib/x86/processor.h b/lib/x86/processor.h
index 8c6f28a3..cbfd2ee1 100644
--- a/lib/x86/processor.h
+++ b/lib/x86/processor.h
@@ -442,6 +442,15 @@ static inline u8 cpuid_maxphyaddr(void)
 	return this_cpu_property(X86_PROPERTY_MAX_PHY_ADDR);
 }
 
+static inline u64 this_cpu_supported_xcr0(void)
+{
+	if (!this_cpu_has_p(X86_PROPERTY_SUPPORTED_XCR0_LO))
+		return 0;
+
+	return (u64)this_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_LO) |
+	       ((u64)this_cpu_property(X86_PROPERTY_SUPPORTED_XCR0_HI) << 32);
+}
+
 struct far_pointer32 {
 	u32 offset;
 	u16 selector;
diff --git a/x86/xsave.c b/x86/xsave.c
index 5d80f245..cc8e3a0a 100644
--- a/x86/xsave.c
+++ b/x86/xsave.c
@@ -8,15 +8,6 @@
 #define uint64_t unsigned long long
 #endif
 
-static uint64_t get_supported_xcr0(void)
-{
-    struct cpuid r;
-    r = cpuid_indexed(0xd, 0);
-    printf("eax %x, ebx %x, ecx %x, edx %x\n",
-            r.a, r.b, r.c, r.d);
-    return r.a + ((u64)r.d << 32);
-}
-
 #define XCR_XFEATURE_ENABLED_MASK       0x00000000
 #define XCR_XFEATURE_ILLEGAL_MASK       0x00000010
 
@@ -33,7 +24,7 @@ static void test_xsave(void)
 
     printf("Legal instruction testing:\n");
 
-    supported_xcr0 = get_supported_xcr0();
+    supported_xcr0 = this_cpu_supported_xcr0();
     printf("Supported XCR0 bits: %#lx\n", supported_xcr0);
 
     test_bits = XSTATE_FP | XSTATE_SSE;
-- 
2.49.0.1204.g71687c7c1d-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
