Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F78CE7719F
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lxdjp1NNT40r2FcDdurpX0oMr02/WFdWhYnqqZyZstg=; b=lIoZS8KIdLHBId
	Qo/o+w3DM4vSpD0tOGNQNBoFGhhR/hgACn8hYF9MhkpyPxtzso8P0qUak+M+QQfqTbfAD5Fs0f5Nd
	FqwbDtlHUy3UuS6glHKJNA+tFfsjedt/TPPZKGy5Kj3aJBozbCvICAkJ6uegOwebrTlaFStdwkGde
	07MhCc/bKVpr1FcPE/vQe9DKUK/sVnoGAXUgxfyRXIbS2GFHMU4OTaxiD+59VlhJNf/z4oCADspIk
	IrdDViBD68kUzxe7GaTnWFkMvtazXLHkn7tDCzYE/9hc4X9qfk+T93BzG0vBnmh5UyjwZ30NzA1AE
	st9t5wY3J1QJfnekmxLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfP-0000000FaJ6-3aQY;
	Fri, 10 Jan 2025 14:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXq-0000000FYVv-2ElV
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 170421FC4;
	Fri, 10 Jan 2025 05:59:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A5CF83F59E;
	Fri, 10 Jan 2025 05:59:22 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 3/5] arm64: Implement the ./configure --processor option
Date: Fri, 10 Jan 2025 13:58:46 +0000
Message-ID: <20250110135848.35465-4-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055926_613297_BE7A0412 
X-CRM114-Status: GOOD (  10.75  )
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

The help text for the ./configure --processor option says:

    --processor=PROCESSOR  processor to compile for (cortex-a57)

but, unlike arm, the build system does not pass a -mcpu argument to the
compiler. Fix it, and bring arm64 at parity with arm.

Note that this introduces a regression, which is also present on arm: if
the --processor argument is something that the compiler doesn't understand,
but qemu does (like 'max'), then compilation fails. This will be fixed in a
following patch; another fix is to specify a CPU model that gcc implements
by using --cflags=-mcpu=<cpu>.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/Makefile.arm    | 1 -
 arm/Makefile.common | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/arm/Makefile.arm b/arm/Makefile.arm
index 7fd39f3ada64..d6250b7fb686 100644
--- a/arm/Makefile.arm
+++ b/arm/Makefile.arm
@@ -12,7 +12,6 @@ $(error Cannot build arm32 tests as EFI apps)
 endif
 
 CFLAGS += $(machine)
-CFLAGS += -mcpu=$(PROCESSOR)
 CFLAGS += -mno-unaligned-access
 
 ifeq ($(TARGET),qemu)
diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe01d33..a5d97bcf477a 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -25,6 +25,7 @@ AUXFLAGS ?= 0x0
 # stack.o relies on frame pointers.
 KEEP_FRAME_POINTER := y
 
+CFLAGS += -mcpu=$(PROCESSOR)
 CFLAGS += -std=gnu99
 CFLAGS += -ffreestanding
 CFLAGS += -O2
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
