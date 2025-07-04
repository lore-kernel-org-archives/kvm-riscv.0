Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B27C5C83F09
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAplskKkR69mcwvjVkyvwz4At1wBgeK2Ht5rVShQb18=; b=4IS/1KkknD2w4X
	5Exavn//PWRMDYhl+qS8t+i+GKc30y8gKw+YrA3INxX2+AimzuT70OfXtVpGRTxP87qFNMM1MTWK1
	+B/4t0RWfeyyCzqhPKxdEiHSDmXypA9DxLkyMKkU/3H5G6ZXsM6etwrStaWBOJcoaEFeCuufsTyDi
	VPqi7nmrviaxIMRc5fsoi3IN+VN477OV4+lPEgx8YRxhur4qXadE2gHr4HsfN6KAZGvhglgl0nZKR
	+OgqA0T+P/cS7k6OGXPPJH5NlQAQvTg7J+EYIFJIhlyKxlbZbiy4BPyJJDUzAUjNHaOZu9aLhO04b
	KcLmnz51aNmGe616CNTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEm-0000000Eo6a-1vgr;
	Fri, 04 Jul 2025 15:22:04 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi66-0000000EmmZ-2w5V
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:13:08 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751641982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1y+Z5PV652LCi65zufILOsYpFuTzL8mqv6TnG3C5fUI=;
	b=JIrV9LD3rrpyypEQ2EwSBaQjl0m04QoiNn3v42obfyVhTelO+0MbTeEgq5QXav0xpy2DOE
	RUwb+SL0QRprowb+7MY8dNQt7ypNWP9oC6HGebqu84bez7Gted/ged/EbySZjIraqfy4SV
	fE2zaHxb5w+0bUM7Qf+SN3/OAusLk4M=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	cleger@rivosinc.com,
	jesse@rivosinc.com,
	jamestiotio@gmail.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 2/2] riscv: Add kvmtool support
Date: Fri,  4 Jul 2025 17:12:57 +0200
Message-ID: <20250704151254.100351-6-andrew.jones@linux.dev>
In-Reply-To: <20250704151254.100351-4-andrew.jones@linux.dev>
References: <20250704151254.100351-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081306_881243_63BFA430 
X-CRM114-Status: GOOD (  17.03  )
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

arm/arm64 supports running tests with kvmtool as a first class citizen.
Most the code to do that is in the common scripts, so just add the riscv
specific bits needed to allow riscv to use kvmtool as a first class
citizen too.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 README.md     |   7 ++--
 configure     |  12 ++++--
 riscv/efi/run |   6 +++
 riscv/run     | 110 +++++++++++++++++++++++++++++++++++---------------
 4 files changed, 96 insertions(+), 39 deletions(-)

diff --git a/README.md b/README.md
index 723ce04cd978..cbd8a9940ec4 100644
--- a/README.md
+++ b/README.md
@@ -65,8 +65,8 @@ or:
 
 to run them all.
 
-All tests can be run using QEMU. On arm and arm64, tests can also be run using
-kvmtool.
+All tests can be run using QEMU. On arm, arm64, riscv32, and riscv64 tests can
+also be run using kvmtool.
 
 By default the runner script searches for a suitable QEMU binary in the system.
 To select a specific QEMU binary though, specify the QEMU=path/to/binary
@@ -97,8 +97,7 @@ variable. kvmtool supports only kvm as the accelerator.
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
-On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
-tests under UEFI.
+This is only supported with QEMU; kvmtool cannot run the tests under UEFI.
 
 # Tests configuration file
 
diff --git a/configure b/configure
index 470f9d7cdb3b..6d549d1ecb5b 100755
--- a/configure
+++ b/configure
@@ -90,7 +90,7 @@ usage() {
 	                           selects the best value based on the host system and the
 	                           test configuration.
 	    --target=TARGET        target platform that the tests will be running on (qemu or
-	                           kvmtool, default is qemu) (arm/arm64 only)
+	                           kvmtool, default is qemu) (arm/arm64 and riscv32/riscv64 only)
 	    --cross-prefix=PREFIX  cross compiler prefix
 	    --cc=CC                c compiler to use ($cc)
 	    --cflags=FLAGS         extra options to be passed to the c compiler
@@ -284,7 +284,8 @@ fi
 if [ -z "$target" ]; then
     target="qemu"
 else
-    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ]; then
+    if [ "$arch" != "arm" ] && [ "$arch" != "arm64" ] &&
+       [ "$arch" != "riscv32" ] && [ "$arch" != "riscv64" ]; then
         echo "--target is not supported for $arch"
         usage
     fi
@@ -393,6 +394,10 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     testdir=riscv
     arch_libdir=riscv
     : "${uart_early_addr:=0x10000000}"
+    if [ "$target" != "qemu" ] && [ "$target" != "kvmtool" ]; then
+        echo "--target must be one of 'qemu' or 'kvmtool'!"
+        usage
+    fi
 elif [ "$arch" = "s390x" ]; then
     testdir=s390x
 else
@@ -519,7 +524,8 @@ EFI_DIRECT=$efi_direct
 CONFIG_WERROR=$werror
 GEN_SE_HEADER=$gen_se_header
 EOF
-if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
+if [ "$arch" = "arm" ] || [ "$arch" = "arm64" ] ||
+   [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     echo "TARGET=$target" >> config.mak
 fi
 
diff --git a/riscv/efi/run b/riscv/efi/run
index 5a72683a6ef5..b9b75440c659 100755
--- a/riscv/efi/run
+++ b/riscv/efi/run
@@ -11,6 +11,12 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/arch-run.bash
+source scripts/vmm.bash
+
+if [[ $(vmm_get_target) == "kvmtool" ]]; then
+	echo "kvmtool does not support EFI tests."
+	exit 2
+fi
 
 if [ -f RISCV_VIRT_CODE.fd ]; then
 	DEFAULT_UEFI=RISCV_VIRT_CODE.fd
diff --git a/riscv/run b/riscv/run
index 0f000f0d82c6..7bcf235fb645 100755
--- a/riscv/run
+++ b/riscv/run
@@ -10,35 +10,81 @@ if [ -z "$KUT_STANDALONE" ]; then
 	source scripts/vmm.bash
 fi
 
-# Allow user overrides of some config.mak variables
-mach=$MACHINE_OVERRIDE
-qemu_cpu=$TARGET_CPU_OVERRIDE
-firmware=$FIRMWARE_OVERRIDE
-
-: "${mach:=virt}"
-: "${qemu_cpu:=$TARGET_CPU}"
-: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
-: "${firmware:=$FIRMWARE}"
-[ "$firmware" ] && firmware="-bios $firmware"
-
-set_qemu_accelerator || exit $?
-[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
-acc="-accel $ACCEL$ACCEL_PROPS"
-
-qemu=$(search_qemu_binary) || exit $?
-if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
-	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
-	exit 2
-fi
-mach="-machine $mach"
-
-command="$qemu -nodefaults -nographic -serial mon:stdio"
-command+=" $mach $acc $firmware -cpu $qemu_cpu "
-command="$(migration_cmd) $(timeout_cmd) $command"
-
-if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_test_status $command "$@"
-else
-	# We return the exit code via stdout, not via the QEMU return code
-	run_test_status $command -kernel "$@"
-fi
+vmm_check_supported
+
+function arch_run_qemu()
+{
+	# Allow user overrides of some config.mak variables
+	mach=$MACHINE_OVERRIDE
+	qemu_cpu=$TARGET_CPU_OVERRIDE
+	firmware=$FIRMWARE_OVERRIDE
+
+	: "${mach:=virt}"
+	: "${qemu_cpu:=$TARGET_CPU}"
+	: "${qemu_cpu:=$DEFAULT_QEMU_CPU}"
+	: "${firmware:=$FIRMWARE}"
+	[ "$firmware" ] && firmware="-bios $firmware"
+
+	set_qemu_accelerator || exit $?
+	[ "$ACCEL" = "kvm" ] && QEMU_ARCH=$HOST
+	acc="-accel $ACCEL$ACCEL_PROPS"
+
+	qemu=$(search_qemu_binary) || exit $?
+	if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
+		echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
+		exit 2
+	fi
+	mach="-machine $mach"
+
+	command="$qemu -nodefaults -nographic -serial mon:stdio"
+	command+=" $mach $acc $firmware -cpu $qemu_cpu "
+	command="$(migration_cmd) $(timeout_cmd) $command"
+
+	if [ "$UEFI_SHELL_RUN" = "y" ]; then
+		ENVIRON_DEFAULT=n run_test_status $command "$@"
+	else
+		# We return the exit code via stdout, not via the QEMU return code
+		run_test_status $command -kernel "$@"
+	fi
+}
+
+function arch_run_kvmtool()
+{
+	local command
+
+	if [ "$HOST" != "riscv32" ] && [ "$HOST" != "riscv64" ]; then
+		echo "kvmtool requires KVM but the host ('$HOST') is not riscv" >&2
+		exit 2
+	fi
+
+	kvmtool=$(search_kvmtool_binary) ||
+		exit $?
+
+	if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
+		echo "kvmtool does not support $ACCEL" >&2
+		exit 2
+	fi
+
+	if ! kvm_available; then
+		echo "kvmtool requires KVM but not available on the host" >&2
+		exit 2
+	fi
+
+	command="$(timeout_cmd) $kvmtool run"
+	if ( [ "$HOST" = "riscv64" ] && [ "$ARCH" = "riscv32" ] ) ||
+	   ( [ "$HOST" = "riscv32" ] && [ "$ARCH" = "riscv64" ] ); then
+		echo "Cannot run guests with a different xlen than the host" >&2
+		exit 2
+	else
+		run_test_status $command --kernel "$@"
+	fi
+}
+
+case $(vmm_get_target) in
+qemu)
+	arch_run_qemu "$@"
+	;;
+kvmtool)
+	arch_run_kvmtool "$@"
+	;;
+esac
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
