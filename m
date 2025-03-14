Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F38C35FF7
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 15:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aT9lc+34OPfv+QKjTgNEHHh4V6S5QRl2ZGUpHvHESX4=; b=uEsn2dCcmvRDYB
	krBwR+2c1QrfaLFtKInbTnA+90EPWNoy4NMhLWCnRnNX/6CgFWQLQDg0p8Gy05q1YNasJvqR1C6TR
	x5LRWEa6St6OJTXyjkyimpq2ImKiZrkbazob/cTFX8sPttXvPdxNYFj7sMHop53t6w87MyBmqynvi
	SPDJvb1fGRy6GivW+QcEfSA04leeabf+xJIifsqOtfHfB3reylrEU+Q2FAlOaZuQ3FQuu4M+Ka3Rb
	Amff3HINNeqPy5NSpklbJKcN5lp/iY3Wpn2ciY2ZnwGFPgvi6UDSx32OG25sNWsq+ZsCNQbFot2mu
	cOndRuzkRLrA1a2TloIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Kp-0000000EdDd-01ez;
	Fri, 14 Mar 2025 15:52:31 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt7Je-0000000Ecxf-2vBO
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 15:51:19 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-39129fc51f8so1997722f8f.0
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 08:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741967477; x=1742572277; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0zGO9xjg0JJPs4PFAX2msz/3yAP4xRZn7yO7s54uDo=;
        b=jMGdOu5P6Inlc8kmgFqhd2NNnmcRhvG8P9GN/1fSb/nh9746VTI5ZOzG+MKAgAv7eH
         X7HiHM53GR2UjcXf8jrynSsi1OA3Y4MeAkjp4HxPvDZMim3qAnvL0vD2uK3Vgo2SlHkP
         9pwL1pwcrffib53KaFLOzrlW6aW/XQ3vroft2MD3WOgiUxaxJajbA3Iq8sFufCsMZVWj
         8mTbU+y3I2eiXXv2iE0Sx3MxOasmW5Xg+SCLnBdPhmfbta0rJw0iBAl3sUr+a+xCdyd5
         tDoXf4eO6tMN4hMsc9JzhUDOpJadrQRvm0D73UVl8J1lRs6qlswuDFcYArDS0jQqGdr4
         1ufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741967477; x=1742572277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D0zGO9xjg0JJPs4PFAX2msz/3yAP4xRZn7yO7s54uDo=;
        b=LdOcUYPDXszEk16meOqZ8hCfmly/dG5Dgut6uSyLV4EpuuT24UeXih5rxKwLR56CTv
         rhJ8B+Gva5XNNrxqWY6AzfjYCVyjCqzsN1wuSgxbYcGY1D+8TUXXKX5udlDSkLiHc+KR
         Ko+4zBSQv5JWKh3bndfRYg8y9wsrtUrBX40HEfQEw7cnxw4XqmnSBMBQheN7RDIVrknG
         XhEwzA9YxtPMIutPthtYmyl9xeVfbtbMOs6CKrZSBADXxpLbcoC5Y9EdcK0VUxXI449O
         d/cH9lAv63MWIKIGT6tPM574UdS4D2INCIvXChR/s0Pdvx9IuhHYC2H9Dn1RmWv8KTI9
         yyNw==
X-Forwarded-Encrypted: i=1; AJvYcCUWn4nQpVFMrELcCR6+MNFantl/Wq/9/fQeqxJWZV1yvCIQbE8YycGLwc98IAfoU0NWdxt6xAABgM4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyLZMYtDEMbmReXJv23Krd6hOQsOtn+KCIj6frjeFJ0AyoRPQFs
	LYq66Ja5yVvZ3dFv0AlIrPW+6kYF+IKOpnq5ky6v6FG2oDt3ubyh1PgtZZApHUM=
X-Gm-Gg: ASbGncvhLJd9Tc9E3m7IiW++MJmRUsSytwFCMdQVYm2w1ky7BG/uvHejcif4rObSBQm
	bV4mBvLiUzK30bBGKrZTqTSa3/AqzOg0OTU8Ue5NmJau8T3kYC1ugn9i0tpoIM/SOXg8qQ/t25r
	Roi/bBFrqwk4kLozOoVbPkwAyrM592S+Zoop/eCTHUPKvLRri+1W/lhuv+awKg4/mZz0jGhpUDP
	xuqqdxKAT/rWqdvsdCQ3lXf8NJN9ySSD9/OLs1ggSK/pZ6brBci23Q/uVpyUuYVE14XTLOoaaUm
	nsPsewmQv7AsfoXpndEaiP2ru2LWVI22G0Zih9hIg3xMxgksMUxaVpxXDKGoWeo=
X-Google-Smtp-Source: AGHT+IECh7v7OK/v5EHEcUY4C0dtwmYasbITKNCuGAGjy0H2BYksZDgS5IwiyYO2BbZMuCf+xK8yVw==
X-Received: by 2002:a5d:6481:0:b0:38d:ca55:76c3 with SMTP id ffacd0b85a97d-3971cd57ed1mr4057887f8f.11.1741967476931;
        Fri, 14 Mar 2025 08:51:16 -0700 (PDT)
Received: from localhost.localdomain ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d21d67819sm15249945e9.21.2025.03.14.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Mar 2025 08:51:16 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: andrew.jones@linux.dev,
	alexandru.elisei@arm.com
Cc: eric.auger@redhat.com,
	kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	vladimir.murzin@arm.com,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: [kvm-unit-tests PATCH v2 4/5] configure: Add --qemu-cpu option
Date: Fri, 14 Mar 2025 15:49:04 +0000
Message-ID: <20250314154904.3946484-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250314154904.3946484-2-jean-philippe@linaro.org>
References: <20250314154904.3946484-2-jean-philippe@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_085118_735378_6E596344 
X-CRM114-Status: GOOD (  15.21  )
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
modify the CPU capabilities by setting extra -cpu options.
Since GCC -mcpu doesn't accept "max" or "host", separate the compiler
and QEMU arguments.

`--processor` is now exclusively for compiler options, as indicated by
its documentation ("processor to compile for"). So use $QEMU_CPU on
RISC-V as well.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 scripts/mkstandalone.sh |  2 +-
 arm/run                 | 17 +++++++++++------
 riscv/run               |  8 ++++----
 configure               |  7 +++++++
 4 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 2318a85f..6b5f725d 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -42,7 +42,7 @@ generate_test ()
 
 	config_export ARCH
 	config_export ARCH_NAME
-	config_export PROCESSOR
+	config_export QEMU_CPU
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
diff --git a/arm/run b/arm/run
index efdd44ce..561bafab 100755
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
@@ -37,12 +37,17 @@ if [ "$ACCEL" = "kvm" ]; then
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
+	elif [ "$ARCH" = "arm64" ]; then
+		qemu_cpu="cortex-a57"
+	else
+		qemu_cpu="cortex-a15"
 	fi
 fi
 
@@ -71,7 +76,7 @@ if $qemu $M -device '?' | grep -q pci-testdev; then
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
index 5306bad3..d25bd23e 100755
--- a/configure
+++ b/configure
@@ -52,6 +52,7 @@ page_size=
 earlycon=
 efi=
 efi_direct=
+qemu_cpu=
 
 # Enable -Werror by default for git repositories only (i.e. developer builds)
 if [ -e "$srcdir"/.git ]; then
@@ -69,6 +70,8 @@ usage() {
 	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
 	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
 	    --processor=PROCESSOR  processor to compile for ($processor)
+	    --qemu-cpu=CPU         the CPU model to run on. The default depends on
+	                           the configuration, usually it is "host" or "max".
 	    --target=TARGET        target platform that the tests will be running on (qemu or
 	                           kvmtool, default is qemu) (arm/arm64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
@@ -142,6 +145,9 @@ while [[ $optno -le $argc ]]; do
         --processor)
 	    processor="$arg"
 	    ;;
+	--qemu-cpu)
+	    qemu_cpu="$arg"
+	    ;;
 	--target)
 	    target="$arg"
 	    ;;
@@ -464,6 +470,7 @@ ARCH=$arch
 ARCH_NAME=$arch_name
 ARCH_LIBDIR=$arch_libdir
 PROCESSOR=$processor
+QEMU_CPU=$qemu_cpu
 CC=$cc
 CFLAGS=$cflags
 LD=$cross_prefix$ld
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
