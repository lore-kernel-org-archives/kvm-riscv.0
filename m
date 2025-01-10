Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4098C02183
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8YXELVZcmrsrk4dMs9STUJ5iJkqsP+fizxhb+ik1ICw=; b=3D4Z4HeoBRD3vS
	LHjfsfys2+afGPjO+qTQk4qLejKOu8qCNtMdo4Xk+Go9Ox9SuH/5sY1ack9RqHXU5/KHPxkW1YOaF
	PadhG76GCDaFO2RCsYOO5g4TWc1bUBfSv5Fq3PTfk4nCIdFtrWN7G9Er2lU0EVruXrtaqetIvJ9YU
	8WnyLl2V7hQSEBSubU5VBmrtRFibLU9+3QhCfu5HNY1RO9ixNYsn64YpZsK9mcuIS5eiv/WpY+4Gc
	Z+bZnt0EdknOO+ylOeRIik0l0ukkV746PTFDX8oxBo05013himD6SAH4HDRlPvO9maypiZIvqNZZH
	e7Xznnj+LxnQwR6f8eBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfQ-0000000FaJv-2WQc;
	Fri, 10 Jan 2025 14:07:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXt-0000000FYXM-41VB
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E67DF1FCD;
	Fri, 10 Jan 2025 05:59:57 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 825AB3F59E;
	Fri, 10 Jan 2025 05:59:27 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 5/5] configure: arm64: Make 'max' the default for --processor
Date: Fri, 10 Jan 2025 13:58:48 +0000
Message-ID: <20250110135848.35465-6-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055930_039785_36A11A4C 
X-CRM114-Status: GOOD (  12.79  )
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

Newer architecture features are supported by qemu TCG on newer CPUs. When
writing a test for such architecture features, it is necessary to pass the
correct -cpu argument to qemu. Make it easier on users and test authors
alike by making 'max' the default value for --processor. The 'max' CPU
model contains all the features of the cortex-a57 CPU (the old default), so
no regression should be possible.

A side effect is that, by default, the compiler will not receive a -mcpu
argument for compiling the code. The expectation is that this is fine,
since support for -mcpu=$PROCESSOR has only been added for arm64 in the
last commit.

The default for arm (cortex-a15) has been kept unchanged, because passing
--processor=max will cause compilation to break. If the user wants the qemu
CPU model to be 'max', the user will also have to supply a suitable compile
CPU target via --cflags=-mcpu=<cpu> configure option.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 46964d36a7d8..3ab0ec208e10 100755
--- a/configure
+++ b/configure
@@ -14,7 +14,7 @@ function get_default_processor()
         default_processor="cortex-a15"
         ;;
     "arm64" | "aarch64")
-        default_processor="cortex-a57"
+        default_processor="max"
         ;;
     *)
         default_processor=$arch
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
