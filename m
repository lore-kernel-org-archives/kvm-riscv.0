Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20170C36011
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 16:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zmBwazOamuWEPRA5UjYije+FEeMlX7PMZQcoLACGi9k=; b=OffTfBgwiqIhrN
	+0caxYzge5Mlhox6mm65oFdga3RxQsJ32ZvqeNE2iByw/9CfEPepdIn6sIMmxUmyKi4sdGaq4N4kS
	d7ZGFldoZuImX8YZX7HamGaormvRm3d7FTxEB7HovbOVCiReZVxjpG2xHAmMHZNhWiDxnmFVGE+Lz
	prGuptsrpGuleBRj4rsuiier9mv5Fx5xC4BP1fuL5otQeeBAobmA6bUCSQmToif742Nss/VEgJjZm
	ED0VjWyyZ4ow6WN/BETqmqicfBZh92WU9garXtOrpTMOqJPD0TLqkWmpfJ2XBWa/kudHcUifLpB4N
	QQ2C85vMmn1n8Er+I5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6yv-00000006SWl-35zr;
	Tue, 25 Mar 2025 16:18:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6op-00000006Qwd-1Aq3
	for kvm-riscv@bombadil.infradead.org;
	Tue, 25 Mar 2025 16:07:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6v4oWjxs3w2OXtl8okLU3CaHVHPFgAaN27M8fJJ3JPw=; b=pRdWhccdPqE/AsVM9dfKYzpNyY
	qBuDcChNYlg7XjqI3asJhc5c39KM81MW0isog12Vj8RumscFgPXC9arsMSURLw3i8/gXWV5prFnsL
	B53pDOVU0LzyZHoNOCt8JSY8ol4FIHqk/UJqMmiRnVFInMtzWL3N1x1in4Ix5PJYwAqu4LPCXGLIP
	bVTgLEX8nU221VoTZEPhs+X8o4PZKrCn7vDPpM1BglwVXmk0WPhWcPBN9PUowEgtbsWjr2oJ26gbp
	6UWkeljr0fw5hXUF+Zwm44wvyJ69lU5hVijjaj+gSZjx/qmLntT8/NA3biRJ46HPmCMPdL4IG0iEX
	0Mqy7rmg==;
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx6ok-00000005daJ-3hsq
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 16:07:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so43595675e9.1
        for <kvm-riscv@lists.infradead.org>; Tue, 25 Mar 2025 09:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742918872; x=1743523672; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6v4oWjxs3w2OXtl8okLU3CaHVHPFgAaN27M8fJJ3JPw=;
        b=NXt2v1OD4uFMGLeJd4r4F45G9+l6XhDYPHJ6/Xr+GUMP5P4Idkh3M21vNhFynSYJXy
         NbEW9yVcQ5AOEpCMhlVdJw30Vdw3JmrtiqJAwM57lfCsr56uVYhRJ0SgL+JjfE+Yaoh+
         KFPH1czKZWQno/zgglHfbcObxjucQFhERZCXka62bxVLP/7Toh8ZNmZa11JiD9vcnm1R
         JiPNq82mvm6vCL2NyVX/M6B4MDBYkxWM6MFrButJWrBWh2uSOd+QTyUhblUQJu/kPUtV
         6oWtrx7WEtxWZYwHoY4ff9AWDKw23Zp8fTjrFmpBdrsYFo+XELrJ/Zytirywy6rSg9VN
         5dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742918872; x=1743523672;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6v4oWjxs3w2OXtl8okLU3CaHVHPFgAaN27M8fJJ3JPw=;
        b=UasyWnOH4W6J/uIBmWs7n7HSYcvpWKH0ucxDZ3L67kIcxw72Vcs7d3O3lTjX01VfcB
         qBoxv3wYO4bqmRhYB8kKzYAQ1HcxzgXhXttqPsQBteJvYSYZ5qXerXKRKqhtTLAtVGIc
         NWp2fzRPLyQiBTYZKM8+3GlzEzXtgqSg+od9HadL7WeSRh5Gve41jxqXM+Z6QuF93z/a
         FH+kcBUPol4ZoDn1vMhKpJ4/lYQyFUf8lYfR2VGF0UeP1oXdsbelAOJcpOh+TEIIQBkX
         rLjnLFlyDGJTLmS2Q3nAA2cGh0LNlJjJ0qBOmlbkFyoY+hFDZpA39h5lGSot9rmwjHYY
         tGbw==
X-Forwarded-Encrypted: i=1; AJvYcCV41FJuob8mtPKM6EvCJ3HpHT+GWf0Giycid+2bG1kn3Vmh1orq1FchmXgLBRgyj1N0PlRWw82Wv7c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2lRMmHkhjkgGVrrpdluPG0i2pNxNQvWnHEn9/xHUJHl52rpxH
	9ChJOa7ZuRN7asQwtG5b144vf4vlcbC5+dZ1r6BSJvKXCRusYt9pIl2ou/nzvAlnrhUtmQXBxvA
	5M7c=
X-Gm-Gg: ASbGncve+I+hlpbQiG+dObfaWYNRwBQoJ53qe2PwUnCfdxSGK5INK7p0RAQc+54HxIX
	D9/XFjovJqFjXqHGWvdzt7lzKEoXCaF5wq4F4sY+AguLvxxws8H69sBmG23kR5k1da8yhIFQNuR
	FTu51PLdo0aw5OCTy4jr7jFylW39W/7SNMbLC3Pkx7SQSSgb8pwvAUvii/n/JRCPeRiiRQcN8T9
	fpdSiA00NUDte1Z8tvtNGeXVCHRc3h380aMRgFPfhogVHh8Ej50B0NQkgw+Kqxmdup9Y4wLWA+Y
	RKkXJVDmPWb9gbahpNXcezEK4AI2O28bLfPfDIes+SXi8zr6uLzeQ+1+LF/3AzlgF4+eL/PcDA=
	=
X-Google-Smtp-Source: AGHT+IHMqhvbDDmS/MsUebAwQrnmnrLCj1L6a/nkr+ekAH/NHss4lv/QGFSzm78I2k54eI/LtzmFrw==
X-Received: by 2002:a05:600c:1d01:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43d77547ecbmr3550045e9.2.1742918871939;
        Tue, 25 Mar 2025 09:07:51 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f43cbasm203972195e9.9.2025.03.25.09.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 09:07:51 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v3 4/5] configure: Add --qemu-cpu option
Date: Tue, 25 Mar 2025 16:00:32 +0000
Message-ID: <20250325160031.2390504-7-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250325160031.2390504-3-jean-philippe@linaro.org>
References: <20250325160031.2390504-3-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_160755_044137_0CA7DA82 
X-CRM114-Status: GOOD (  16.76  )
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

Add the --qemu-cpu option to let users set the CPU type to run on.
At the moment --processor allows to set both GCC -mcpu flag and QEMU
-cpu. On Arm we'd like to pass `-cpu max` to QEMU in order to enable all
the TCG features by default, and it could also be nice to let users
modify the CPU capabilities by setting extra -cpu options.  Since GCC
-mcpu doesn't accept "max" or "host", separate the compiler and QEMU
arguments.

`--processor` is now exclusively for compiler options, as indicated by
its documentation ("processor to compile for"). So use $QEMU_CPU on
RISC-V as well.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 scripts/mkstandalone.sh |  3 ++-
 arm/run                 | 15 +++++++++------
 riscv/run               |  8 ++++----
 configure               | 24 ++++++++++++++++++++++++
 4 files changed, 39 insertions(+), 11 deletions(-)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 2318a85f..9b4f983d 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -42,7 +42,8 @@ generate_test ()
 
 	config_export ARCH
 	config_export ARCH_NAME
-	config_export PROCESSOR
+	config_export QEMU_CPU
+	config_export DEFAULT_QEMU_CPU
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
diff --git a/arm/run b/arm/run
index efdd44ce..4675398f 100755
--- a/arm/run
+++ b/arm/run
@@ -8,7 +8,7 @@ if [ -z "$KUT_STANDALONE" ]; then
 	source config.mak
 	source scripts/arch-run.bash
 fi
-processor="$PROCESSOR"
+qemu_cpu="$QEMU_CPU"
 
 if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
    [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
@@ -37,12 +37,15 @@ if [ "$ACCEL" = "kvm" ]; then
 	fi
 fi
 
-if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
-	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
-		processor="host"
+if [ -z "$qemu_cpu" ]; then
+	if ( [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ] ) &&
+	   ( [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ] ); then
+		qemu_cpu="host"
 		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
-			processor+=",aarch64=off"
+			qemu_cpu+=",aarch64=off"
 		fi
+	else
+		qemu_cpu="$DEFAULT_QEMU_CPU"
 	fi
 fi
 
@@ -71,7 +74,7 @@ if $qemu $M -device '?' | grep -q pci-testdev; then
 fi
 
 A="-accel $ACCEL$ACCEL_PROPS"
-command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
+command="$qemu -nodefaults $M $A -cpu $qemu_cpu $chr_testdev $pci_testdev"
 command+=" -display none -serial stdio"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
diff --git a/riscv/run b/riscv/run
index e2f5a922..02fcf0c0 100755
--- a/riscv/run
+++ b/riscv/run
@@ -11,12 +11,12 @@ fi
 
 # Allow user overrides of some config.mak variables
 mach=$MACHINE_OVERRIDE
-processor=$PROCESSOR_OVERRIDE
+qemu_cpu=$QEMU_CPU_OVERRIDE
 firmware=$FIRMWARE_OVERRIDE
 
-[ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
+[ -z "$QEMU_CPU" ] && QEMU_CPU="max"
 : "${mach:=virt}"
-: "${processor:=$PROCESSOR}"
+: "${qemu_cpu:=$QEMU_CPU}"
 : "${firmware:=$FIRMWARE}"
 [ "$firmware" ] && firmware="-bios $firmware"
 
@@ -32,7 +32,7 @@ fi
 mach="-machine $mach"
 
 command="$qemu -nodefaults -nographic -serial mon:stdio"
-command+=" $mach $acc $firmware -cpu $processor "
+command+=" $mach $acc $firmware -cpu $qemu_cpu "
 command="$(migration_cmd) $(timeout_cmd) $command"
 
 if [ "$UEFI_SHELL_RUN" = "y" ]; then
diff --git a/configure b/configure
index b4875ef3..b79145a5 100755
--- a/configure
+++ b/configure
@@ -23,6 +23,21 @@ function get_default_processor()
     esac
 }
 
+# Return the default CPU type to run on
+function get_default_qemu_cpu()
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
+    esac
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -52,6 +67,7 @@ earlycon=
 console=
 efi=
 efi_direct=
+qemu_cpu=
 
 # Enable -Werror by default for git repositories only (i.e. developer builds)
 if [ -e "$srcdir"/.git ]; then
@@ -70,6 +86,9 @@ usage() {
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($processor)
+	    --qemu-cpu=CPU         the CPU model to run on. If left unset, the run script
+	                           selects the best value based on the host system and the
+	                           test configuration.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
@@ -146,6 +165,9 @@ while [[ $optno -le $argc ]]; do
         --processor)
 	    processor="$arg"
 	    ;;
+	--qemu-cpu)
+	    qemu_cpu="$arg"
+	    ;;
 	--target)
 	    target="$arg"
 	    ;;
@@ -471,6 +493,8 @@ ARCH=$arch
 ARCH_NAME=$arch_name
 ARCH_LIBDIR=$arch_libdir
 PROCESSOR=$processor
+QEMU_CPU=$qemu_cpu
+DEFAULT_QEMU_CPU=$(get_default_qemu_cpu $arch)
 CC=$cc
 CFLAGS=$cflags
 LD=$cross_prefix$ld
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
