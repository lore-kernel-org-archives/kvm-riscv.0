Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5FFC02181
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tqndr+a2bubcR3OHRAtOsgWxAgQP9wJoRc5rEGyEGdQ=; b=stUckFoMm0S/cP
	RAynKxRpL6+ZJ3/IKxIosN6oFUsmao30kaPWEaElJwwDj/A63kZR0Oam46G6e/y49YUMX96eythtE
	c+pH8HLOtRn/H/nKcWfPTBCEyWvQ9KrTa3ETHIdsR/EBKgFlN2be9zPRlNNVrSpFQ+IX9KYCiOIc8
	gjsMYJZSXAxVja9f7NZHymfpw9M2KbEqCScmzjjfbdrwhFQ2+fhvaoGf4Qkrih1NKlED/zeXG267q
	NbuM7fjH1BvrY9TvttSA6MaHQFgFB7fk4tDh1rkoMBt8AYkpOVtmQ6Co0YiqRVg3oHID6Q8uudfdt
	p5wKP76ZPV1upt9Qon9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfQ-0000000FaJU-0sF3;
	Fri, 10 Jan 2025 14:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXr-0000000FYWO-2bP3
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8033A1FC7;
	Fri, 10 Jan 2025 05:59:55 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1A6DF3F59E;
	Fri, 10 Jan 2025 05:59:24 -0800 (PST)
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: andrew.jones@linux.dev,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	thuth@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com,
	david@redhat.com,
	pbonzini@redhat.com
Cc: kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v1 4/5] arm/arm64: Add support for --processor=max
Date: Fri, 10 Jan 2025 13:58:47 +0000
Message-ID: <20250110135848.35465-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055927_706462_89080212 
X-CRM114-Status: GOOD (  17.06  )
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

For arm64, newer architecture features are supported only on newer CPUs.
Instead of expecting the user to know which CPU model supports which
feature when using the TCG accelerator for qemu, let's make it easier and
add support for the --processor 'max' value.

The --processor value is passed to the compiler's -mcpu argument and to
qemu's -cpu argument. 'max' is a special value that only qemu understands -
it means that all CPU features that qemu implements are supported by the
guest CPU, and passing it to the compiler causes a build error. So omit the
-mcpu argument when $PROCESSOR=max.

This affects only the TCG accelerator; when using KVM or HVF,
kvm-unit-tests sets the cpu model to 'host'.

Note that using --processor=max with a 32 bit compiler will cause a build
error: the CPU model that the compiler defaults to when the -mcpu argument
is missing lacks support for some of the instructions that kvm-unit-tests
uses. The solution in the case is to specify a CPU model for the compiler
using --cflags:

  ./configure --arch=arm --processor=max --cflags=-mcpu=<cpu>

This patch doesn't introduce a regression for arm when --processor=max is
used, it's only the error that changes: from an unknown processor type to
using instructions that are not available on the processor.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/Makefile.common | 2 ++
 configure           | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index a5d97bcf477a..b757250dc9ae 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -25,7 +25,9 @@ AUXFLAGS ?= 0x0
 # stack.o relies on frame pointers.
 KEEP_FRAME_POINTER := y
 
+ifneq ($(PROCESSOR),max)
 CFLAGS += -mcpu=$(PROCESSOR)
+endif
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
diff --git a/configure b/configure
index 138840c3f76d..46964d36a7d8 100755
--- a/configure
+++ b/configure
@@ -67,7 +67,10 @@ usage() {
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
-	    --processor=PROCESSOR  processor to compile for ($default_processor)
+	    --processor=PROCESSOR  processor to compile for ($default_processor). For arm and arm64, the
+	                           value 'max' is special and it will be passed directly to
+	                           qemu, bypassing the compiler. In this case, --cflags can be
+	                           used to compile for a specific processor.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
