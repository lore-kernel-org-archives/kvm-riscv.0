Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D86D1C369A4
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KxRb4K9/rI9N4Py57kf3Ljh4fPDI/F3phtkMOONYXjw=; b=tEr2LyXlVGPdom
	sF//Tqpm9W3/hqw1nRQ0WIUGe6SOH+lZ5PuhK9uGwvDDxDdn5vES3JJJ15fXGwslX6ZNW3IAstmBn
	5ePC8tXCCc0y8wByYewl5nlJ0XRlJe2TDV7xXfKZzK/ByQRar6gfpfW43E1cuioSZWM/+jnb46FeW
	uSkTjINxqjHpXR/nyMyy6L4mcUX5qOTHEN6M4uAGifKcYhLANtn4SCPcGtwzoClzolWmd3r9sYvUS
	oYbkPspCe7w16eGltmjmutSb+btcAONs0JTDWKpC+I1ihwBMo5qUGW08WLXG+nDzIlzyQNfPTbmGF
	XIT1Pz1wMet5if95DALw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QF-00000004HGK-0f9n;
	Tue, 08 Apr 2025 13:55:27 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28sz-00000004B5W-171X
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:06 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf257158fso39183375e9.2
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118463; x=1744723263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilwSm1opvpysUjixabDWM8lrwnBUd7ZKRR02fY60WCw=;
        b=N0r40vurA0zR1J+7cLnCKw+YPqKsebCdTjEiDmKpZwMXD+x3c9DDXlNBDUWXFP2hMZ
         0pGZNW8yyejG2JO73BwfYHA8hJ7SxSjBC37b35RlKJCr1jbRKccYOA6pafjZeaeNMdDl
         l2u6u/NACKu7SMGxOQQgy7F8uWiVfJryQAQd7avlfhzpjx6h1jFugDPa/ZWN975OFZcG
         1hXGkKFUZhwmcFDd08wOa6B1jZmu8nLRRWqNuNYta1n8kCHLW5Jt3MY55jieHC1QTjc4
         ilxYt1Tq/8rcbhGqYCIEotAEWxySbYvyIKNrugTqYd2Y2JQ0YfuQYQ33YfbFjPNSW4uX
         VOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118463; x=1744723263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilwSm1opvpysUjixabDWM8lrwnBUd7ZKRR02fY60WCw=;
        b=PBpJAp52Wd9zeHusq/EmRawpGvks1f8q01PAZ4NsiTTcfXNn4rxzmAamBIvjugHFZ6
         e5u3s1awKSllcRCOEWuZfV4Jd5JzBXuF0pG96u9Yt7aAh0PEilxfkV2IKgAkNj+8dhfU
         GA3TbexA786JkOGyfNhAJyKqj+oZeKXvF6J3LcDWSfX2bbSLiFteqHS8ZNNO/5pkX8+J
         Qd/tiIfRP9PUvY9GzcWF9yI4tw3UyRa7gseznrcsQe2JCGqk6wV9c6oGXfBm/FEkFe9W
         AOvjnaoSme0DOuL3OGbEPBEG3a1kJ5eDW/Lsiv1pNLSZuRnNdYTES0gTCN/GV/o1rx2u
         P9eA==
X-Forwarded-Encrypted: i=1; AJvYcCVJbVzcLdCsmIdAXoydyE6CE9I0NY6iWBI7g3fNpGnXmVd6yG5pTkqHx7DwYbFZVZCs+ubZDR89iFs=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp7YNkGyFtJumNwL186lwCrOivqdpJJbHjZYuTMoEjgJwXWd+y
	UuQjtBEg+jNZRUHeuwAQ9RZHrqQVN3w4fAiFR+Q5vDQNOempEqqvxHVAzxxn1WY=
X-Gm-Gg: ASbGncvoN+2NtwoBd+mTxD+miVcrYmnJCFsAhho+qOdRgr1ImX2Ss9W6+lErve1gOmB
	yO01PJIkKkRUJfK5C7kog/1X8QHxHvPzKq8VdUP8Jkx7Gm0oUnZfLVYCHpFCxN71X/so+UMMzMM
	jdB7lapaZoQbWPd8PQ46lgSP/dckGjW4AGbLvmbx3aox8nGZoclPAM3tFGK2zrhyWkEHbucL6yN
	fC+ODp33lzr7tt1dFTsEYELMKXr2vj1D17QbVjCvvPByIfA0sO365v8t1mtJrBIh8d/CAbS3Zzl
	6I1rWm15mrNZU5vmdhqbv1ZmmOagqfVktxwGIk9bY1aN+zw40P7he6Q/cOccNjg=
X-Google-Smtp-Source: AGHT+IFNyeSMXRQkAbHJWisVmPMP4/fHS+R5uIOxb+upWzY4DBBeBmZDM0lxIP3xSXgDasJ13TRs/Q==
X-Received: by 2002:a05:6000:4203:b0:391:3998:2660 with SMTP id ffacd0b85a97d-39cb35759c8mr13486863f8f.7.1744118463310;
        Tue, 08 Apr 2025 06:21:03 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:02 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 2/5] configure: arm/arm64: Display the correct default processor
Date: Tue,  8 Apr 2025 14:20:51 +0100
Message-ID: <20250408132053.2397018-4-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_062105_320455_974C6E67 
X-CRM114-Status: GOOD (  11.88  )
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
Reviewed-by: Alexandru Elisei <alexandru.elisei@arm.com>
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
