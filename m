Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75205E7719E
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fEY7jrpl8jkxT1qvhor5GQF4fa+mbLvK+RjqLLJAU4M=; b=rTCB21we/VQlyp
	44o1iLkFMd9npaIZZ1G3RLcvqAD4T4hDQQ/o8QYnOJ+IFXQ1z4hOddIRXT1NyueSkfbAI2dx6IQp+
	ZGJOHhQH5KLCMcnLeB6BZi9Ib0Ir8uvZgG6Y+0A7IhIlU1Ux9RLl6HwpuHQIXzzkSBxogRtm+gW/m
	bPR72K6WGBSQpoX0HB942eu1/nywer1CaphfVGPc2u6VbMIjJ8aY5SvVrObGl8tKxQmIjpgKsZrJs
	dvMdGLYFD/EHTO7OJHttQAHHx1xbhJY7gHYifR2jBJYMpSEIMH1N+uIX1My5JtpL5rMldtVACD5ks
	g8IcktqYIOMtEgU7nn7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFfP-0000000FaIT-0yRb;
	Fri, 10 Jan 2025 14:07:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFXo-0000000FYV7-42PJ
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 13:59:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3C481F91;
	Fri, 10 Jan 2025 05:59:50 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3EE423F59E;
	Fri, 10 Jan 2025 05:59:20 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v1 2/5] configure: Display the default processor for arm and arm64
Date: Fri, 10 Jan 2025 13:58:45 +0000
Message-ID: <20250110135848.35465-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110135848.35465-1-alexandru.elisei@arm.com>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055925_040037_CE7D94B2 
X-CRM114-Status: GOOD (  10.11  )
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

The help text for the --processor option displays the architecture name as
the default processor type. But the default for arm is cortex-a15, and for
arm64 is cortex-a57. Teach configure to display the correct default
processor type for these two architectures.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 5b0a2d7f39c0..138840c3f76d 100755
--- a/configure
+++ b/configure
@@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
     exit 1
 fi
 
+function get_default_processor()
+{
+    local arch="$1"
+
+    case "$arch" in
+    "arm")
+        default_processor="cortex-a15"
+        ;;
+    "arm64" | "aarch64")
+        default_processor="cortex-a57"
+        ;;
+    *)
+        default_processor=$arch
+    esac
+
+    echo "$default_processor"
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -33,6 +51,7 @@ page_size=
 earlycon=
 efi=
 efi_direct=
+default_processor=$(get_default_processor $arch)
 
 # Enable -Werror by default for git repositories only (i.e. developer builds)
 if [ -e "$srcdir"/.git ]; then
@@ -48,7 +67,7 @@ usage() {
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
-	    --processor=PROCESSOR  processor to compile for ($arch)
+	    --processor=PROCESSOR  processor to compile for ($default_processor)
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
@@ -283,13 +302,8 @@ else
     fi
 fi
 
-[ -z "$processor" ] && processor="$arch"
-
-if [ "$processor" = "arm64" ]; then
-    processor="cortex-a57"
-elif [ "$processor" = "arm" ]; then
-    processor="cortex-a15"
-fi
+# $arch will have changed when cross-compiling.
+[ -z "$processor" ] && processor=$(get_default_processor $arch)
 
 if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
     testdir=x86
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
