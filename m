Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CBAC44512
	for <kvm-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 17:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pE8npMfpSPHks0WvnFSbhf7eMiPYYq1KPM5hcTCNwB0=; b=bJf
	nzX8BI3Q2m9xthruk7Dh+L2cYbj8FQlOKOvnnzIW4CDuyVVgiNylGJtUGSLtRnz1rUXEKjXpnwzuX
	SRP22SynC019p7LRsQuHFizsWm1O1mBpCdoM4Vs7UQszLGcB7OCTm0eVcmBksBNQVSy7yl3qVBtkX
	ea33y3SGZQyxcEgl1tiaV07qFgpsdd/Icyme5my1zJ99jozCoeeEAa0ipob9yMmwucouqo1poAi5m
	fXbMc+/nxjw6urwdc7mOxudkPdRQEjxio+8hKZyEXJ89yteXyqMu6ASr0YyZtWG5wJrlYvJZ5KkJx
	OoXUczIRHsaxKA44bvBIRBeyxR8SNMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPxX-00000000Hoh-4AHT;
	Thu, 16 Jul 2026 17:33:20 +0000
Received: from mail-oi1-x249.google.com ([2607:f8b0:4864:20::249])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPxV-00000000Ho0-2Dpb
	for kvm-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 17:33:18 +0000
Received: by mail-oi1-x249.google.com with SMTP id 5614622812f47-4a485034d01so5042983b6e.3
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Jul 2026 10:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784223196; x=1784827996; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0Z+anC+/1XFqwXmxKZk/3VItIn4RPKH7QLbFgNe4Yzs=;
        b=pLEehBu5iuBDavB9FipDGu2OX2yMqxHt175tMIrLXHcoxYT89jNMaePFGluDgKnkEB
         pcoa+XBukix7CfCEnU0b2d6IKVjp2P3thVLMzy97bdJu2kM2MZYD9Kxyuzsf7NsXkpwL
         KgnWfkizPnvKEtIY1YTL7HFYjmTWgWznMUZLGahM53hIpl86hDdkswr8RIqPubz5FXat
         vRhtt93a0CKzzYlyq+xqe07bROQaJo9WTc5KR46t9Ld3SGK+9P12HbA/o1rL8Ni92UjL
         dnv/u2AXKVvuvGEfzPRa9mkrnOzquruK+49PxRGGcm3rTz0tPXR3NSRrZrhPilOjFyQb
         ziKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223196; x=1784827996;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Z+anC+/1XFqwXmxKZk/3VItIn4RPKH7QLbFgNe4Yzs=;
        b=QzVC7NTaagNwZqJE0y/jpVY7cLBBHxbU3/wpUK9K5CNtaSG3Llscxy0aAXL+R5j93Z
         Y81sWIBxuhzqTmq+6qrkEqCetBPSj0ZXY4vE3LOHYz8tzN1u6GHh6gAnbqyQVnw/ZCix
         cRZVWdb/Ijqow3jmPnR+AvhhEAy2TLbXaebDAA1pfiwABAWYyO9U5SueCwQtKQjT3RJx
         JXLqEFJac7ICMntSCxipJ0yxuM33EVY9I/eodRXiZF3R52t0sh6BL0DIt4n5IiLhN+Ye
         /FzXj/fAKcYRDLLJsyOusprQmTbvmA4RJ+ZKqBJwUtCmOH2dOBcKKJgsvrCuskAg75oU
         EpgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvMKnmZOb+drmDsoZ5usQJg11lBXYHzFPJ8/L1Bhv5kn314XfWhtJMRSDNSFjh7se2+zkvCHHPgRU=@lists.infradead.org
X-Gm-Message-State: AOJu0YyX2r3OJqTkh2YdtIj/op3mu8oAQzZfSDwyKHCfe7tt0/cQIe1p
	h7Ls8NdmEklQ7XoE0aib5LzIClyp1MoRK4E65A2y9YwZfZqnm2kK7nTaalqoAIl+JUj5h09GUFC
	RZ4BCPHoNyFPSMmyVh5LpVwQElA==
X-Received: from ileg2.prod.google.com ([2002:a05:6e02:1a22:b0:503:a191:13b7])
 (user=coltonlewis job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:524b:b0:497:df42:1dee with SMTP id 5614622812f47-4a4c878effamr415255b6e.35.1784223195562;
 Thu, 16 Jul 2026 10:33:15 -0700 (PDT)
Date: Thu, 16 Jul 2026 17:33:15 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
Message-ID: <20260716173315.2775989-1-coltonlewis@google.com>
Subject: [kvm-unit-tests PATCH] Makefile: efi: preserve .dynstr section for
 LLVM objcopy compatibility
From: Colton Lewis <coltonlewis@google.com>
To: andrew.jones@linux.dev, pbonzini@redhat.com
Cc: alexandru.elisei@arm.com, eric.auger@redhat.com, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Colton Lewis <coltonlewis@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_103317_568794_ED6E4A9B 
X-CRM114-Status: UNSURE (   7.79  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

When building EFI binaries with llvm-objcopy, keeping sections with
'-j .dynamic -j .dynsym' without '-j .dynstr' fails with:

  llvm-objcopy: error: 'arm/spinlock-test.so': section '.dynstr'
  cannot be removed because it is referenced by the section '.dynamic'

Include '.dynstr' in the list of preserved sections across
arm/Makefile.common, riscv/Makefile, and x86/Makefile.common so that
EFI binaries can be built cleanly using llvm-objcopy.

Assisted-by: Gemini:gemini-next
Signed-off-by: Colton Lewis <coltonlewis@google.com>
---
 arm/Makefile.common | 2 +-
 riscv/Makefile      | 2 +-
 x86/Makefile.common | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index a5d97bcf..550ec0a1 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -88,7 +88,7 @@ ifeq ($(CONFIG_EFI),y)
 	$(OBJCOPY) --strip-debug $^
 	$(OBJCOPY) --add-gnu-debuglink=$@.debug $^
 	$(OBJCOPY) \
-		-j .text -j .sdata -j .data -j .dynamic -j .dynsym \
+		-j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .dynstr \
 		-j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
 		-j .reloc \
 		-O binary $^ $@
diff --git a/riscv/Makefile b/riscv/Makefile
index 64720c38..348a30a7 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -123,7 +123,7 @@ cflatobjs += lib/efi.o
 	$(OBJCOPY) --strip-debug $^
 	$(OBJCOPY) --add-gnu-debuglink=$@.debug $^
 	$(OBJCOPY) \
-		-j .text -j .sdata -j .data -j .rodata -j .dynamic -j .dynsym \
+		-j .text -j .sdata -j .data -j .rodata -j .dynamic -j .dynsym -j .dynstr \
 		-j .rel -j .rela -j .rel.* -j .rela.* -j .rel* -j .rela* \
 		-j .reloc \
 		-O binary $^ $@
diff --git a/x86/Makefile.common b/x86/Makefile.common
index a251dd71..054e2391 100644
--- a/x86/Makefile.common
+++ b/x86/Makefile.common
@@ -58,7 +58,7 @@ ifeq ($(CONFIG_EFI),y)
 	$(OBJCOPY) --strip-debug $^
 	$(OBJCOPY) --add-gnu-debuglink=$@.debug $^
 	$(OBJCOPY) \
-		-j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .rel \
+		-j .text -j .sdata -j .data -j .dynamic -j .dynsym -j .dynstr -j .rel \
 		-j .rela -j .reloc -S --target=$(FORMAT) $< $@
 	@chmod a-x $@
 else
-- 
2.55.0.229.g6434b31f56-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
