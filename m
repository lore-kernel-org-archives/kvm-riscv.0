Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A025CC3600D
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rpwCOPQOnSDxWKxR74R09lZ+YA2V2RqtH1PKqBEnaYM=; b=geKC27WL9R7Odb
	rl9gAB+mZNB8wQ7IXi+7Ld9k6XaDp66FTbWUQyutEtaa+c4sDzvH9/m+8x/U5/s3nb8a3S9DfQCUC
	RAcDNccOWpPS18zjSEFl8SgsgdqfuUiV8F815PrESXOEcLZ8sqgURKLLCsGLoYHbZ++3xJQfuWSR5
	3sLuUzKFBOlSg0RZ8SsGDg9s1yXJiT4oiUQnaP6y+2jVzCKQPFm4rx38VIMQs1gsG0t7uh/J2VPoY
	2+9RZh3U1snUEuEQw1ekKBxJYslWYylVbdZZTY9f0sU7jp5va04F+tuAeEFlppOYj1U3ErVVQhrMW
	XAf/gUXbEtysUGSd+7CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yu-00000006SVW-1TDF;
	Tue, 25 Mar 2025 16:18:24 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6oi-00000006QuO-2TGv
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:53 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-39129fc51f8so4741285f8f.0
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918871; x=1743523671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rb9ebUJ9N7Jt+0/wSlKeZDJqEG8Zo62aWudcvmr0rRI=;
        b=sHwMmiu5FvMskFgsgHRWG0VZvv5YhUF5cM0PDRcRe0aAoXcVgR6l8V5naz/YHl9pDd
         7pnK1gtlKGTck5vZyESweAUyrziZoCiVzZC/uO5K5kPcKf2+Uuzqez8kOqk/XxZ71gJ7
         SwXcEsL/ebUzVIuFCqt6X+xvlK/e2WlVj38SDHlWGj4Pw+s5efDCz9Bq+h6nc/dEw4fN
         0tEzAnv3CodFrZbORl7J83W+LZOHZ+O358kTkKkGuFDSVzVwGKfvOEgTl6l99KDpykDW
         AGb6GcKhfNQxPcmVnWZOpnTX/ZC7iCvQrBHKHbVkKDEaczmCmOaxLjWE0mr1/fNCw8Hx
         U5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918871; x=1743523671;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rb9ebUJ9N7Jt+0/wSlKeZDJqEG8Zo62aWudcvmr0rRI=;
        b=EGpwKRNnk2Y/MsmBCOctFkEVUVZPC5/9iEJPi8iPXQCaYTu543HRYBysLd0R7HJ55N
         mQTcQbqvIl2eWGn7oWZrQuaqlHnzM8wteZCMtBRFHGurfffbt7sCE7cDKWxQXcnZfgqm
         05VkCHHyGASDn+PfDUAQfefbOSvSVD+c9uAfDJZi0GN8dcxMCcMRL0XdTKqUz9wHvYVQ
         cqay++L/xbq31/z2f86DjjcCj5XgIeISBa6GRDieeh2SwX8/aK5WsodmwjE6foYVyypr
         dXdyqEWpwd4viboxPb97RkEBnAeBZNv1q7Il5RDKb2Xs6Qpe1+fXOJURRfzjw+CsNaly
         9wcA==
X-Forwarded-Encrypted: i=1; AJvYcCVx20CPuUCqakwROJZHb6qLeWwZd8uTYEuO3bDvNLZ4zowu4QqEw4LkmV3TM2payvM0Fb0KYu8goGk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2/6acCm+FAG7PT6uk7zcyyZTvi8BqZh4+sN42ysMselo39pju
	b2GcxwzY9Z8innQu9FxEhjzEPnTca7J/mmIWHwKi5oQez+ACAgegtiKkYkWsUSc=
X-Gm-Gg: ASbGncsoBX50lrKzXxdD/hmDnvuiv8E7zEwKED8C9giGw3a+u3b+GZYDU48K4MG+hQd
	0a6fMHtMYH1CxiByIswI+MY2HLGAimF7h7EFU7AAaNvHKhCbUqnhaysJ7Ev4JD8kCL/tCsIOrj/
	SMBgOCddwc7hEZ5aKfLSl9oHDAlK+pUfwPW6iawbMYgFsgJ6GIU5Cx9II8V0kYosjfq1dGVygpb
	C1AgdmmJ6ujAGtPpF2fO3+q0CPf0ndNc5Sxi/JAwXjb4MyIFlz5dsSdjZiNyc3zGAV4gm5ZnCAP
	SvyrgIb/robQV8l3XACKfwXU31Ere7nl9xNSOWRzoNS0MVPY4IskbM6mwC70CCU=
X-Google-Smtp-Source: AGHT+IFI/7tTmUNqF1LFsp9CSF0jzd2wofLTJjRMMtVmsGu6/uq/OnH6WnDOGAESyJFHG7RUegV3gg==
X-Received: by 2002:a05:6000:2d83:b0:39a:c9ed:8657 with SMTP id ffacd0b85a97d-39ac9ed8663mr1542229f8f.17.1742918870911;
        Tue, 25 Mar 2025 09:07:50 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:50 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 2/5] configure: arm/arm64: Display the correct default processor
Date: Tue, 25 Mar 2025 16:00:30 +0000
Message-ID: <20250325160031.2390504-5-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_090752_629888_249CC6B6 
X-CRM114-Status: GOOD (  11.58  )
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
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 configure | 30 ++++++++++++++++++++++--------
 1 file changed, 22 insertions(+), 8 deletions(-)

diff --git a/configure b/configure
index 010c68ff..b4875ef3 100755
--- a/configure
+++ b/configure
@@ -5,6 +5,24 @@ if [ -z "${BASH_VERSINFO[0]}" ] || [ "${BASH_VERSINFO[0]}" -lt 4 ] ; then
     exit 1
 fi
 
+# Return the default CPU type to compile for
+function get_default_processor()
+{
+    local arch="$1"
+
+    case "$arch" in
+    "arm")
+        echo "cortex-a15"
+        ;;
+    "arm64")
+        echo "cortex-a57"
+        ;;
+    *)
+        echo "$arch"
+        ;;
+    esac
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -44,13 +62,14 @@ fi
 
 usage() {
     [ "$arch" = "aarch64" ] && arch="arm64"
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
@@ -326,13 +345,8 @@ if [ "$earlycon" ]; then
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
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
