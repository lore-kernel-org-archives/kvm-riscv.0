Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B3B5E7719D
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vyRdrNH6Fapnc54liAphFKNRpusA8yX0V9gHrs8pRQ0=; b=GBNQ6vMaIflgGz
	UCMMlcNNSBrQaWd7yq23YnmmhI/a9HgK/ik1gP2nVI/JpUZ7dWu4VT6WICNady8d2U7ver5lAPHvf
	R6qIPSIJmjPjBxZgf9Gm0RFAzB6elL1t7CI97gLi8bzv6IJmnxdrfKG4i5ZJmN5iFzm6YmyjA7rCO
	q4ohk+zVxT2fa6mM4yIVp34vzwC1M2JaoQYyH4j11urTopbV98vD3gR2DtXJdqydf/J8qwo6axRMf
	nA9cX5rmVYVbrBtfm8piQB+MPecjVRFn1EAmkWKEt0nf2UCMhbks0oE7RZ/gTbKt3c4rWWFGe7FsZ
	vu5H2vITiWKc6UPMXx5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfO-0000000FaHy-3w68;
	Fri, 10 Jan 2025 14:07:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXn-0000000FYUQ-2Vtq
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B3461E32;
	Fri, 10 Jan 2025 05:59:48 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7AA83F59E;
	Fri, 10 Jan 2025 05:59:17 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 1/5] configure: Document that the architecture name 'aarch64' is also supported
Date: Fri, 10 Jan 2025 13:58:44 +0000
Message-ID: <20250110135848.35465-2-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055923_677188_B2E736F2 
X-CRM114-Status: GOOD (  11.70  )
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

$arch, on arm64, defaults to 'aarch64', and later in the script is replaced
by 'arm64'. Intentional or not, document that the name 'aarch64' is also
supported when configuring for the arm64 architecture. This has been the
case since the initial commit that added support for the arm64
architecture, commit 39ac3f8494be ("arm64: initial drop").

The help text for --arch changes from*:

   --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64

to:

    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64

*Worth pointing out that the default architecture is 'aarch64', even though
the rest of the help text doesn't have it as one of the supported
architectures.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 86cf1da36467..5b0a2d7f39c0 100755
--- a/configure
+++ b/configure
@@ -47,7 +47,7 @@ usage() {
 
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
-	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
+	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($arch)
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
