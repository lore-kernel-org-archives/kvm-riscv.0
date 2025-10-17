Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5ACCCD19A
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Mfu6Lk1c7v9GTKxczGXqV3kVHz2K2WOtAAuoiwhU5I=; b=0bvyuBSOUjleLp
	hXHaopvHXr/1Ykpr4hBlQe9O4U99A4/Whikm3W5BbP5DGBW3sFhfarPY7UJgWp7aIdzjiyXpfCexc
	bHOrtnyTkFMgPbyICrTIoB5tr8RKZSRvfv4WQYjLtoFljezKJ2b54xSlK/q5I60uGQ0zGkolxdnpx
	FQYeaweyH+L2n4UiGsw9mMktE4/1IxQm4vvia5NM+IeMcexmpRkyVfl4WF5/Vn8fG8fca0DCP7XNN
	85dxX52ZZU7e9/nZ/c4zQI3TRa51QMlpT44vK1enwLXw2OFnfZha5FXmylo8ZaS3Inbl4VmFfIUeq
	Zpt572CqzVWHR0A9Lhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YVL-00000006IAz-2X6N;
	Fri, 17 Oct 2025 00:39:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YVK-00000006IAX-1Mn7
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:39:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=; b=jLyr8f2z/Vwu41jENZICkKQQo1
	Yj7C2nPGG/J/u9vsU85qpFMFa8Q6/DVjqcF2dmfgUupPjPjaPz3gX8NQ6CDfWMqRgR+LZ0vGgOhju
	W1bvoM97glKbTwpbOdGHj59k6FqL1HqAMRmRosJtSorCMzbM7EruTmy/ZxelK+jksSZMWeDMWZ2bS
	MRHAioPGAqFR/hacwbUlVU5TbVd6mYAbfNuPyPJTmc9JWhA2MiSflOwga8QiwsFAgvx7BO//g2DaR
	pPbp0D7xanT9UQSpFXRT8PkNfUW+Li9RInjaGVE4j1Su01Y1XAaUTQTxdntnYtQ0WpGDmB+dinT+/
	xtRgSc+w==;
Received: from mail-io1-xd49.google.com ([2607:f8b0:4864:20::d49])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YVE-000000079Lh-0h1K
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:39:31 +0000
Received: by mail-io1-xd49.google.com with SMTP id ca18e2360f4ac-9201572ebfbso303083939f.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661565; x=1761266365; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=mojHKQdt7RiGcc/icAG08HKXNvfmavg4F0V92kZ6yX6pLIXjwJ5w+IeZ8wsDv9d3hR
         GNJpYisIfVrKAcgxeNcbYM3Izlz9gVUhU1myVIVrU8fM2Qz6VzBV8QH8JGgjM8+fpq5d
         lYor+ZoFOT17Dw3t7kw5vSDdHdXdDRoNQCdnONSEjMJj3xX1oGP6xKi6+204ii4W/8lv
         lw+dbkFJyykXCGfB++t9278XWpvbefMMwPa/CbuJrDXedb6oQOo2hR/fGh13N+OdLL6p
         dLYE2+W31+4+Tti9aWzAg4acZ+WJl9oaRdzoS3IEOcPzzLc338ZgM6Al3MrJYMKQEDpX
         +QOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661565; x=1761266365;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Et3yNXLGMeuamTbAzxTVAbjwKav6YdsiHYhgXHS+lqo=;
        b=ZgIiXUEHocEp8eLP+ffm/WDzh9YvMnGjnB9EZhZUSC0VPrz+uUHxXhv/jflr4qAFof
         ZboUfSeoi5znWm7RaFF5IPWKrso5hSWXg2civJSsxlueM3s61bcquERZJa7+y8X/0Lbz
         lR8cC8DheGW5vppx9HzTiP961AV4CQZthRowvCYcidhSi6/P60jaiMcax13rb4BGn3cq
         89Shwq+qCMRDT4xwpMjHKdfiRxwfH6wqCd5+7ZZZW/MSPIppSSbnYn/J5a/VaeWZzQv3
         bfjuvxzWem9SQ22eH8CdNQtM6q58o3pNtgXGv6uDi4kSowXzqtq6wZVj0VJsq35mS6aZ
         IySQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbMSPyvbwdYgm0OLlkBgp7Eo8FfBnNW+O8SclYiFjja0Z5WztQpkCkNLnWYAMFEr+vlVkd8OxyOtY=@lists.infradead.org
X-Gm-Message-State: AOJu0YyO4SR5+ysaMKvVbqA2ufNuvUE301Evg02NBVcpbU1sretKDYnB
	wpTGnAvIsGt0MfYSHWH78p/nMAKLs0ri4rFCTN2rUUQkhexdI5z9llrJG2bt8ME8RAXoG8ECYez
	biB8ing==
X-Google-Smtp-Source: AGHT+IF8DlOutKWl0i8m+B1TfQqXPthFr1585kr7hlu5o2md7/0QzZzZHhKvSNGyUqeTAbPYZaEbqdnIEp8=
X-Received: from pjbmr8.prod.google.com ([2002:a17:90b:2388:b0:330:49f5:c0a7])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e544:b0:26b:5346:5857
 with SMTP id d9443c01a7336-290c9cd4b82mr18056465ad.24.1760661200311; Thu, 16
 Oct 2025 17:33:20 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:36 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-19-seanjc@google.com>
Subject: [PATCH v3 18/25] KVM: TDX: Derive error argument names from the local
 variable names
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013929_595945_3B4113AA 
X-CRM114-Status: UNSURE (   8.80  )
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

When printing SEAMCALL errors, use the name of the variable holding an
error parameter instead of the register from whence it came, so that flows
which use descriptive variable names will similarly print descriptive
error messages.

Suggested-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 2d587a38581e..e517ad3d5f4f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -41,14 +41,15 @@
 #define TDX_BUG_ON(__err, __fn, __kvm)				\
 	__TDX_BUG_ON(__err, #__fn, __kvm, "%s", "")
 
-#define TDX_BUG_ON_1(__err, __fn, __rcx, __kvm)			\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx", __rcx)
+#define TDX_BUG_ON_1(__err, __fn, a1, __kvm)			\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx", a1)
 
-#define TDX_BUG_ON_2(__err, __fn, __rcx, __rdx, __kvm)		\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx", __rcx, __rdx)
+#define TDX_BUG_ON_2(__err, __fn, a1, a2, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 " 0x%llx", a1, a2)
 
-#define TDX_BUG_ON_3(__err, __fn, __rcx, __rdx, __r8, __kvm)	\
-	__TDX_BUG_ON(__err, #__fn, __kvm, ", rcx 0x%llx, rdx 0x%llx, r8 0x%llx", __rcx, __rdx, __r8)
+#define TDX_BUG_ON_3(__err, __fn, a1, a2, a3, __kvm)	\
+	__TDX_BUG_ON(__err, #__fn, __kvm, ", " #a1 " 0x%llx, " #a2 ", 0x%llx, " #a3 " 0x%llx", \
+		     a1, a2, a3)
 
 
 bool enable_tdx __ro_after_init;
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
