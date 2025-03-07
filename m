Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F97C19F32
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 09:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ftBASHYIt1jFM31fHY/tc9Se1DwNTnXHjGZGtS91k1s=; b=ahGTHYG9Djcm/D
	lyvd7FN+rjE0M5AlW1RFFd788IqMZNRa5TLI2bFYzJmysg2gmkBgGaq5O0dO0nM+WYzN1ZsgsZJT4
	TFzJlmN7PEOsxU823ExyAqo4xIads3lu6GeGwggAh2x0WyUorQGvhyxNo2KnS8X3GCfJDMUaKTaxL
	W8X+eosuayW3pEqadpo3NwsGgon1Rk7SyMQ2rKKIAk0IKzgsuqeZzWSKV3vJem5Mwd9jmrWOBotoc
	rXnrp0daFMhZeHwW7nG4O+ifTyZSWdcBvViYDrxD78ckW6beIBYVAliOSPi9X5gr4FQ95CUhps463
	cFE+EAT4pzmvVUi+oLtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTtY-0000000Dgpq-0gfI;
	Fri, 07 Mar 2025 09:21:28 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqTqj-0000000Dg6w-3Sqe
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 09:18:35 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741339111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2FBvybRQ7hGNDuactnNvnWlcdQr0dcjdCw8K+WSDT8=;
	b=v/um14QjntUhD9/+RjAPoAqg5hVIFWfCDpaGuI3rZaVkVpnzjZ4cpDc2xZ3mkeysr6W9z2
	xbw+4yumPwu7bH4NmlPTKPqXmnDnAh2JsHoY5L/yMVAZYEQMBt0P+TSM4mxRcP6MI3jdoT
	lkxLHe4Zyn/2jMILuyMorKlQiFsHWWQ=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com
Subject: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
Date: Fri,  7 Mar 2025 10:18:29 +0100
Message-ID: <20250307091828.57933-2-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_011834_020187_32CADE97 
X-CRM114-Status: UNSURE (   7.72  )
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

When cross compiling with clang we need to specify the target in
CFLAGS and cc-option will fail to recognize target-specific options
without it. Add CFLAGS to the CC invocation in cc-option.

The introduction of the realmode_bits variable is necessary to
avoid make failing to build x86 due to CFLAGS referencing itself.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
v2:
 - Fixed x86 builds with the realmode_bits variable

 Makefile            | 2 +-
 x86/Makefile.common | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 78352fced9d4..9dc5d2234e2a 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
 
 # cc-option
 # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
+cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
 libcflat := lib/libcflat.a
diff --git a/x86/Makefile.common b/x86/Makefile.common
index 0b7f35c8de85..e97464912e28 100644
--- a/x86/Makefile.common
+++ b/x86/Makefile.common
@@ -98,6 +98,7 @@ tests-common = $(TEST_DIR)/vmexit.$(exe) $(TEST_DIR)/tsc.$(exe) \
 ifneq ($(CONFIG_EFI),y)
 tests-common += $(TEST_DIR)/realmode.$(exe) \
 		$(TEST_DIR)/la57.$(exe)
+realmode_bits := $(if $(call cc-option,-m16,""),16,32)
 endif
 
 test_cases: $(tests-common) $(tests)
@@ -108,7 +109,7 @@ $(TEST_DIR)/realmode.elf: $(TEST_DIR)/realmode.o
 	$(LD) -m elf_i386 -nostdlib -o $@ \
 	      -T $(SRCDIR)/$(TEST_DIR)/realmode.lds $^
 
-$(TEST_DIR)/realmode.o: bits = $(if $(call cc-option,-m16,""),16,32)
+$(TEST_DIR)/realmode.o: bits = $(realmode_bits)
 
 $(TEST_DIR)/access_test.$(bin): $(TEST_DIR)/access.o
 
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
