Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B51B6C369A6
	for <kvm-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s8bMcQ3ht8MaAkt226Fxb0rGk40ySrrd5UI/3VbUHo8=; b=QGgoBJHRwmjVGi
	CVeskMUM65sHU1Bv1WMZ27DorQ+S/I8v/aAzBiw21REOd3ao2mJ5Uxakp8erjx6SAOdzOs/jzZd7n
	hV0qURHLyY1Mn5VrkCsxPXyENeq1+FxvVZzSaXLbEOAxJtCue2BUxT5MaakPu8IoLcKdfq1Tbyqhi
	9tFHgkAt9K1BlEJNg/goXHTw+A7nVpA2FGj/oa+66a47cXah8Cr0llfeAc/7UrQFWDt5m6Nfqov+K
	JVUo+DgYOt2ZXQwtO2KnSciMWgrNNhwXR1HWL8DGt+99Eil5jDqCefXOh4N8gZgOPsU5s8T4Vz8FP
	68gsGdCGEElyzSeJvgJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u29QG-00000004HHw-1mge;
	Tue, 08 Apr 2025 13:55:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t3-00000004B7h-3eSx
	for kvm-riscv@bombadil.infradead.org;
	Tue, 08 Apr 2025 13:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=HOPA2fmXPhp0g7ThkLsi+uZYdZ8vnNqs5fSRtuJQXEs=; b=mSuWeHJfCxiZWTodTWiGFKTwbG
	lHs9o4OyKX0QMSV2Tk53u+aSq0rLo7bbv8DOpAVHFUomgvdcHll9sVuPFg4IK+GWMqs2E5ddIB91b
	ZgTk8I4YDxU75lZ+zkpFRE75xcy6d4tIce7QmfRgIH1sc2ex6dIVFIz2SLeOLCbKhDNkDz6YLwie0
	MytRMNR4UPpMi9ycUnnRrHWeNDQWpTIvEJN6rpxC6i12HDIDzZJVFpwwlbIJLa6r6Zuer8HDC+0R/
	6026WtgswFlDVvx9DBhUF7iEI5oXXBMkUDiJGvUS4glyQyLTQQoE/6npWHbUcentSRTF+JdJhGE9u
	IBCjGmcw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28t0-00000008JDD-3xF1
	for kvm-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 13:21:08 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso60364675e9.0
        for <kvm-riscv@lists.infradead.org>; Tue, 08 Apr 2025 06:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744118465; x=1744723265; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HOPA2fmXPhp0g7ThkLsi+uZYdZ8vnNqs5fSRtuJQXEs=;
        b=AuYdXVeR/BG//nbo78KD6xugBrGUkKDdMU4xOEXvs0w13LQ4IGSTX6X41icXEgM5Bo
         J3kNGBb4rRXcYMBlGn64J2dZ+WMvacEg2r5pXIuoQLew7BSArXwORnI8AWaVdqTXsjjh
         hTSNR7gCrMVkoN2OllZ5PjkebvNqcEo7sjPIaK0Do+YKtPSc+S14jPVtoc4Mdoz7ijTp
         5c7jKxfJaf8VOkrmjMRWySd5+iIzwiUbjOWIfsrzBp6T1YChq1cyLXfvhd1VJ8CJ+agE
         irPHAmVHKiyVE6PcIOxW6t5ct8Bim3Wuu47/7AnjiodGX0+9XbiFFJkNLUBn32aNNpbE
         4FKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744118465; x=1744723265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HOPA2fmXPhp0g7ThkLsi+uZYdZ8vnNqs5fSRtuJQXEs=;
        b=Ksa9i6A+ymv++ukjHTf0U9jSTHVLngd6G93UI9SgPFz7liveg69c4PDjTIun11rLht
         rVbc++Woo021V51jQgwWd+aDubHFPpwgCNCJXkYNhdODubTpM+zkraIgVMgPlzwsaF8b
         UdjpbDyaMFewBs7+8g473hB7l8V6IUS6xt1iAb1Ci7xclKG2hCvgqpsyCgvQb5s4og6O
         9Tr+kapJo5J4YCX+XgYcQQwou8KvJMbpmwDJjNlxLA91qYfoUFbMFhLDTBemhMFBfHEd
         6y0O402LkX+kxCd9ZFykPsafuFFIt4zp8tdp2Fh/zvWKLUDE1ci/QYYLF6fKqDZ3s+Qq
         Iefg==
X-Forwarded-Encrypted: i=1; AJvYcCUv3xrLL7fVloTbCjIjeKGnJi3vPlSWZe4QMLo2KJ5+IWdmiUIN+uscJkrLKomKLP98BDYJti8EFQQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6x1V915pXKsC9SrEMjmr6QOEUXMBUwY9N1cLBZgl1aLmKfZEm
	vyPAIhORuI9zn2obLNJMbj7C4KRuV6HBu8BVazbM0LnAprWAjhQt+ztxrJE7Ig0=
X-Gm-Gg: ASbGnctgilgib/FRM9rqvNrANOzb+mTEwKZuL3gyk8pP9xWzA13I3iN0H65bmzvwSrZ
	BFs6l3P0WM/fGLObiboQsFnxiwLwamZMp631kvPz0A8FSYY1rF8Cqqv5gLsAwVG+2iFems4WAGQ
	wYetMQpcUFid3on7F4L3LwxW1EOEzJsTN87FW8xYy4Sxwa8Jr5UJhvxgYxLujY3iLZmXV6zn02D
	xL8unnpebjjL+Mwkrb9HMKuUH0rDlAofdbujNV/iQH04Zj6kUQMnDQUgxyIBf01CeZjg+ayD8tR
	M8AqVWhFQ7J0g/Tvr+bzaOP0n6Eq9QKNTwgjk4IPeZbBweK/KKvNEWc9/NpwLE0=
X-Google-Smtp-Source: AGHT+IEEYzGOKHN6r46LzVByJFbW7i8YbDNKMzXqurwCu8CRJ0JfLsDForarjYS/wFNxfVFVo9a5Nw==
X-Received: by 2002:a05:600c:524c:b0:43c:e70d:44f0 with SMTP id 5b1f17b1804b1-43f1890857emr9390535e9.19.1744118464779;
        Tue, 08 Apr 2025 06:21:04 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec36699e0sm162159705e9.35.2025.04.08.06.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 06:21:04 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v4 4/5] configure: Add --target-cpu option
Date: Tue,  8 Apr 2025 14:20:53 +0100
Message-ID: <20250408132053.2397018-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408132053.2397018-2-jean-philippe@linaro.org>
References: <20250408132053.2397018-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_142107_105682_95131682 
X-CRM114-Status: GOOD (  17.04  )
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

Add the --target-cpu option to let users set the CPU type to run on.
At the moment --processor allows to set both GCC -mcpu flag and QEMU
-cpu. On Arm we'd like to pass `-cpu max` to QEMU in order to enable all
the TCG features by default, and it could also be nice to let users
modify the CPU capabilities by setting extra -cpu options. Since GCC
-mcpu doesn't accept "max" or "host", separate the compiler and QEMU
arguments.

`--processor` is now exclusively for compiler options, as indicated by
its documentation ("processor to compile for"). So use $TARGET_CPU on
RISC-V as well.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 scripts/mkstandalone.sh |  3 ++-
 arm/run                 | 15 +++++++++------
 riscv/run               |  8 ++++----
 configure               | 27 +++++++++++++++++++++++++++
 4 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 2318a85f..c4ba81f1 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -42,7 +42,8 @@ generate_test ()
 
 	config_export ARCH
 	config_export ARCH_NAME
-	config_export PROCESSOR
+	config_export TARGET_CPU
+	config_export DEFAULT_QEMU_CPU
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
diff --git a/arm/run b/arm/run
index efdd44ce..ef585582 100755
--- a/arm/run
+++ b/arm/run
@@ -8,7 +8,7 @@ if [ -z "$KUT_STANDALONE" ]; then
 	source config.mak
 	source scripts/arch-run.bash
 fi
-processor="$PROCESSOR"
+qemu_cpu="$TARGET_CPU"
 
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
index e2f5a922..2bd42ad8 100755
--- a/riscv/run
+++ b/riscv/run
@@ -11,12 +11,12 @@ fi
 
 # Allow user overrides of some config.mak variables
 mach=$MACHINE_OVERRIDE
-processor=$PROCESSOR_OVERRIDE
+qemu_cpu=$QEMU_CPU_OVERRIDE
 firmware=$FIRMWARE_OVERRIDE
 
-[ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
 : "${mach:=virt}"
-: "${processor:=$PROCESSOR}"
+: "${qemu_cpu:=$TARGET_CPU}"
+: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
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
index b4875ef3..63367bbc 100755
--- a/configure
+++ b/configure
@@ -23,6 +23,24 @@ function get_default_processor()
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
+    "riscv32" | "riscv64")
+        echo "max"
+        ;;
+    esac
+}
+
 srcdir=$(cd "$(dirname "$0")"; pwd)
 prefix=/usr/local
 cc=gcc
@@ -52,6 +70,7 @@ earlycon=
 console=
 efi=
 efi_direct=
+target_cpu=
 
 # Enable -Werror by default for git repositories only (i.e. developer builds)
 if [ -e "$srcdir"/.git ]; then
@@ -70,6 +89,9 @@ usage() {
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($processor)
+	    --target-cpu=CPU       the CPU model to run on. If left unset, the run script
+	                           selects the best value based on the host system and the
+	                           test configuration.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
@@ -146,6 +168,9 @@ while [[ $optno -le $argc ]]; do
         --processor)
 	    processor="$arg"
 	    ;;
+	--target-cpu)
+	    target_cpu="$arg"
+	    ;;
 	--target)
 	    target="$arg"
 	    ;;
@@ -471,6 +496,8 @@ ARCH=$arch
 ARCH_NAME=$arch_name
 ARCH_LIBDIR=$arch_libdir
 PROCESSOR=$processor
+TARGET_CPU=$target_cpu
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
