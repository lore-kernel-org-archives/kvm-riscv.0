Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85695C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IFUUPLwpzHdgpyrmqyx7Ah6x804gHol3xcLLHEDD6s=; b=aXVM+bLUkBXiQu
	NHsMj27oze4lip/cWt0fv8AlZizNUvt7Ha2sVjKgTQr6fkcEnowgcfkIHxQIjK+tuq3t2tHzy1OBm
	xG9r/ZqGVkOJ21YZbl0y7EQnvXCtyF+FqrJDz+GlyTkPpMpM+mYuClmMBdnpaPctzGyNESlp+fYl7
	+9qM8snVjsjQ4FeZnNaJ9M5yQx4SwlmDnHaYqTvmgIUUIBJzbdqwFIIB1B0KoqM1ZYsET8WPIQdGk
	KfCH18EDIuTUyVFN5Plrs/tcDSpKDk9EDh6N9pjuaRagO8+RwrQO99i2/sij5jMS0SI3KdtCbPYu2
	KSvztar4X0XxucHn/UHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Ko-0000000EdCX-15HQ;
	Fri, 14 Mar 2025 15:52:30 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Jd-0000000Ecws-2CS7
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-43d0c18e84eso15262195e9.3
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967476; x=1742572276; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x6KdM0HrFbl7EBCoEX5NDExMeE7MkqEbvD9eQdkyg/A=;
        b=Mcmn6XFf57yBYa0fwQmvBLv3sAcrYDOA+fO6HA206qz2wQLSdHXnSFXsFKeZhhB0dN
         NV3yRxrYXjv2w2YebGsE+w6q/PluPvjbzTmbCG/b11Fso/fER66jtMilRDk5KO+vCYpx
         w7+cesxMbQOvuuGRQo0hZYr/MaY+SgWm+ct0ouyuvJ2JCdgA29+ZwvA46mnk0+4t6zs/
         0LrhA3amrllogVcFqrsrrc3/oahqyUem/8HQHdb/snBkK3umlEUIj90mBe3uHtPUKu4f
         mBWpAQEbXM6nlpUGcSXR/ZT9xKt9Pp0E2X1++wRgw2T36jcrFcxpzXYerd0NBOyA2pS+
         r8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967476; x=1742572276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x6KdM0HrFbl7EBCoEX5NDExMeE7MkqEbvD9eQdkyg/A=;
        b=Yh2bF1NDrUqnN7RHXrO0OlYSP3SWPfsQTdBWsGNzXkcDLwTKFS+keLJm58kS1sMRa2
         fSnLE3EzIdtm4Oi9TwO9fBrkzetQTT7Q4a0jFBDMAIZKg3U7xmECqLth5YTyzV8VxxfM
         9U9PFGOb3k8aBUzwqYrOyVkzJ6mWZ0w0K5WToNBnuQtEQ6+ODwa70N929+dvYFW6Cimg
         eXK+ILgGfG0A9f06bexAZTdfqJz3abaDoj2Mpfa4d8d4w4B+pIgj94AJfU+hhb2K0Yy8
         bc1ECuiQ8AFn1sz5ERwrKZ6AilSr+KiVmRlN+DyZV85ikwlWO5AUlDCTmrXotZ/lmxqE
         O4EA==
X-Forwarded-Encrypted: i=1; AJvYcCUKSYcjN0zZ/n3VYS+tpK4vPHz+DvAqiW7EPI0qd1uqQM9nqG9k7o4h4UegsydGpIIQYFBuAj7r5ZI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1t16UBl0ga/6xTS6VGByZ1bEAc83UkqzgL+I2JscsgrWg1dM6
	+pzJ4Marydz1RO7svxLZ8ZGyWUCKuHHUjPyBVibBZhgIsLE2PICc/olzgOPnyts=
X-Gm-Gg: ASbGncsjxT9jLGGSDmYLUch6eTf+v+DLNCF4fec3AezfEfU4T2kZKJ6QK56RDmpUOd/
	qdZehcUyo7op66gcBcZ0sBar9YeZhXmvf2gp3S733hwlnn4sdhX7rkrUFnmV3RAoASi75MKFVQj
	gJAvQ1u0+04R2T4R4fdeLrUrfpKBArS2r7kAhsOX9FFUH1wIjOIj9aLDMaUfvuzfGhBAMYEfDav
	KrxPOmrjf5BfqHdAw3hB3R7NPz+S5h/mT6uZmCdw8V3S7c05dkRnLHFzEHNElSBL/KUMwr4wP66
	sBn2Ua3nRK6uFi0V7cORyfwGo9NCYb0E692hf9kQ9lGLDxoNY883flYsJaLUoEfaGtlGHJYexA=
	=
X-Google-Smtp-Source: AGHT+IGqjIk/FKjEZDkdrc3AqaWCRNKHzrwFDig+752nD7yLPvk8XeA3buiKLcR8gQHXba5VpmxCpA==
X-Received: by 2002:a05:600c:3b10:b0:43d:ed:acd5 with SMTP id 5b1f17b1804b1-43d1ec78437mr43895775e9.10.1741967475876;
        Fri, 14 Mar 2025 08:51:15 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:15 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com
Subject: [kvm-unit-tests PATCH v2 2/5] configure: arm/arm64: Display the correct default processor
Date: Fri, 14 Mar 2025 15:49:02 +0000
Message-ID: <20250314154904.3946484-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314154904.3946484-2-jean-philippe@linaro.org>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085117_567493_272BDB7F 
X-CRM114-Status: GOOD (  10.76  )
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

From: Alexandru Elisei <alexandru.elisei@arm.com>

The help text for the --processor option displays the architecture name as
the default processor type. But the default for arm is cortex-a15, and for
arm64 is cortex-a57. Teach configure to display the correct default
processor type for these two architectures.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 configure | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index dc3413fc..5306bad3 100755
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
+    "arm64")
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
@@ -43,13 +61,14 @@ else
 fi
 
 usage() {
+    [ -z "$processor" ] && processor=$(get_default_processor $arch)
     cat <<-EOF
 	Usage: $0 [options]
 
 	Options include:
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
-	    --processor=PROCESSOR  processor to compile for ($arch)
+	    --processor=PROCESSOR  processor to compile for ($processor)
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
@@ -319,13 +338,8 @@ if [ "$earlycon" ]; then
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
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
