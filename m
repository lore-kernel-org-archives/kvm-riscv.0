Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED8EC021B6
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joScxqgBYhVS9B9YtME0qupr5au1wYD6iXPiMyX4dp8=; b=jIcrsW93B/8+5Y
	RpFmZ8qUB4CkkiP+iVDMc8/0JMQSlu2XqLf0s9HN/akKSrKaRLS3O8y6T4AzRHYksWPkOOmnW4gFl
	GN8XPbhxsdH6dOosrRQKrk6UodRXTdHtMbXc7HIYnGEZDj+ZMr/oiVsVCt4CU5M8nvHo+A7aa5rdR
	nqHCx7ELj90yRxqxJ3fXNVCiJDFH5Rf4tT2O6WT4j7MwdPmi0MU2rjb1Amt/nEnW8ECQ7jfYrfxXg
	yuYygX/2VYcR7x2Kau5r0sv7Wy+YlXrZ5blPmkQlPc2xl5Rh/HaO/vN1tCRXrzrZfzNmYzx6jWSvL
	8k1EAlbjoEswCJPrX6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVwR-00000006By1-1hJ2;
	Fri, 21 Feb 2025 16:31:55 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVso-00000006BHT-00gw
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 16:28:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740155288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8IPSvRUBRtTpCvRUq9nyj+UMlr4YW022ZUQVoIdr2zM=;
	b=jZSS+1hJ8o5+w2CsroqJVude4/LswkFwuoNbl0UALqzivFafzKEtgS0nwTCU2g/CMr1pDl
	QiZO1qQdBzm5+Jpg0qcdv/OpMNDSiEEMOPs46ApdSLSWksW3kTGwW5opZSjyM24C2g/0P9
	livc6vD9NkxWsLhNgACnQmBOvMOmCOU=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [kvm-unit-tests PATCH 1/2] configure: Allow earlycon for all architectures
Date: Fri, 21 Feb 2025 17:27:55 +0100
Message-ID: <20250221162753.126290-5-andrew.jones@linux.dev>
In-Reply-To: <20250221162753.126290-4-andrew.jones@linux.dev>
References: <20250221162753.126290-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_082810_390969_3552D822 
X-CRM114-Status: GOOD (  10.09  )
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

From: Andrew Jones <ajones@ventanamicro.com>

earlycon could be used by any architecture so check it outside the
arm block and apply it to riscv right away.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 configure | 88 +++++++++++++++++++++++++++----------------------------
 1 file changed, 43 insertions(+), 45 deletions(-)

diff --git a/configure b/configure
index 86cf1da36467..7e462aaf1190 100755
--- a/configure
+++ b/configure
@@ -78,10 +78,9 @@ usage() {
 	                           4k [default], 16k, 64k for arm64.
 	                           4k [default], 64k for ppc64.
 	    --earlycon=EARLYCON
-	                           Specify the UART name, type and address (optional, arm and
-	                           arm64 only). The specified address will overwrite the UART
-	                           address set by the --target option. EARLYCON can be one of
-	                           (case sensitive):
+				   Specify the UART name, type and address (optional).
+	                           The specified address will overwrite the UART address set by
+	                           the --target option. EARLYCON can be one of (case sensitive):
 	               uart[8250],mmio,ADDR
 	                           Specify an 8250 compatible UART at address ADDR. Supported
 	                           register stride is 8 bit only.
@@ -283,6 +282,41 @@ else
     fi
 fi
 
+if [ "$earlycon" ]; then
+    IFS=, read -r name type_addr addr <<<"$earlycon"
+    if [ "$name" != "uart" ] && [ "$name" != "uart8250" ] && [ "$name" != "pl011" ]; then
+        echo "unknown earlycon name: $name"
+        usage
+    fi
+
+    if [ "$name" = "pl011" ]; then
+        if [ -z "$addr" ]; then
+            addr=$type_addr
+        else
+            if [ "$type_addr" != "mmio32" ]; then
+                echo "unknown $name earlycon type: $type_addr"
+                usage
+            fi
+        fi
+    else
+        if [ "$type_addr" != "mmio" ]; then
+            echo "unknown $name earlycon type: $type_addr"
+            usage
+        fi
+    fi
+
+    if [ -z "$addr" ]; then
+        echo "missing $name earlycon address"
+        usage
+    fi
+    if [[ $addr =~ ^0(x|X)[0-9a-fA-F]+$ ]] || [[ $addr =~ ^[0-9]+$ ]]; then
+        uart_early_addr=$addr
+    else
+        echo "invalid $name earlycon address: $addr"
+        usage
+    fi
+fi
+
 [ -z "$processor" ] && processor="$arch"
 
 if [ "$processor" = "arm64" ]; then
@@ -296,51 +330,14 @@ if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
 elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     testdir=arm
     if [ "$target" = "qemu" ]; then
-        arm_uart_early_addr=0x09000000
+        : "${uart_early_addr:=0x9000000}"
     elif [ "$target" = "kvmtool" ]; then
-        arm_uart_early_addr=0x1000000
+        : "${uart_early_addr:=0x1000000}"
         errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
     fi
-
-    if [ "$earlycon" ]; then
-        IFS=, read -r name type_addr addr <<<"$earlycon"
-        if [ "$name" != "uart" ] && [ "$name" != "uart8250" ] &&
-                [ "$name" != "pl011" ]; then
-            echo "unknown earlycon name: $name"
-            usage
-        fi
-
-        if [ "$name" = "pl011" ]; then
-            if [ -z "$addr" ]; then
-                addr=$type_addr
-            else
-                if [ "$type_addr" != "mmio32" ]; then
-                    echo "unknown $name earlycon type: $type_addr"
-                    usage
-                fi
-            fi
-        else
-            if [ "$type_addr" != "mmio" ]; then
-                echo "unknown $name earlycon type: $type_addr"
-                usage
-            fi
-        fi
-
-        if [ -z "$addr" ]; then
-            echo "missing $name earlycon address"
-            usage
-        fi
-        if [[ $addr =~ ^0(x|X)[0-9a-fA-F]+$ ]] ||
-                [[ $addr =~ ^[0-9]+$ ]]; then
-            arm_uart_early_addr=$addr
-        else
-            echo "invalid $name earlycon address: $addr"
-            usage
-        fi
-    fi
 elif [ "$arch" = "ppc64" ]; then
     testdir=powerpc
     firmware="$testdir/boot_rom.bin"
@@ -351,6 +348,7 @@ elif [ "$arch" = "ppc64" ]; then
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     testdir=riscv
     arch_libdir=riscv
+    : "${uart_early_addr:=0x10000000}"
 elif [ "$arch" = "s390x" ]; then
     testdir=s390x
 else
@@ -491,7 +489,7 @@ EOF
 if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
 cat <<EOF >> lib/config.h
 
-#define CONFIG_UART_EARLY_BASE ${arm_uart_early_addr}
+#define CONFIG_UART_EARLY_BASE ${uart_early_addr}
 #define CONFIG_ERRATA_FORCE ${errata_force}
 
 EOF
@@ -506,7 +504,7 @@ EOF
 elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
 cat <<EOF >> lib/config.h
 
-#define CONFIG_UART_EARLY_BASE 0x10000000
+#define CONFIG_UART_EARLY_BASE ${uart_early_addr}
 
 EOF
 fi
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
