Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F44C7EE31
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ft+IfIeIx0as62+h/yNbTKXO3ApQqMcfB/yY/wM5s98=; b=PVNYBfme8wFUeO
	dhytYR4Wk5RrEnowvveBSne9fWYX7Zr05RSgc+CiKRR9UZNlYzmWglYH/zZQ0Ar0bhksZvCeJt53b
	GLSejEK8rkZKEz2Gg16qfM8UufPd+QV4UQmu/L98b9I+pi7sSLaivmYW5q2KrNV7Z0adkDDjmoceD
	GPq2p6aLz8v10DKrYObk+3dBMVZjSNnCcXeaokP65HzjzZVrMFWTQa6Z84ZMPcG6i2p1Z5iOk79tm
	Lg+IpkmK5u64rSH0ynAehYMlC5lxnwIuHq2nExWRtoG+2m9fnHsyu9dht8YyTA2tD9qbNAb+GA2sp
	E4Jw95s6yo/8DMSAqazg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpg4-0000000CIaH-0mST;
	Thu, 26 Jun 2025 16:42:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpg2-0000000CIa9-14U0
	for kvm-riscv@bombadil.infradead.org;
	Thu, 26 Jun 2025 16:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=zE++yYkzui2FWWVcnFjOVE1vAHF/LPi9JpEyqXXZrFo=; b=jWS0ojFr44B9R7psLoqyYs9aG9
	+/mu5borp6Y1CqRnWPmFnE2LDewhqhmrWmBB361H7cQdAHGsKefH7q0eubX27AZAeKsTlB1FxFQtm
	rWY3+eDarLK1gqIezFLDwHVGo+C+mKX0N9Q3zrBN3Mt6DOu6aNKncNkBlTdGx06RHz9TencQeHv+U
	BzukA7L7XwdgXtjJSdhZFf+aNmkuifCSaYpTcH6pE2fKGrWx3wac26tDnlhdPYAhTDwuLuPXXiMY2
	m2xeXj4p9dYMiSFMLVD3VIh+F5Z7IkdkZ+nclZaXnsfOJf6Vto1zD17HfjXpwuSMLRn9kxxaIpEoR
	iqYs+u5A==;
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUpfy-000000069ZZ-1vho
	for kvm-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 16:42:16 +0000
Date: Thu, 26 Jun 2025 18:42:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750956124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zE++yYkzui2FWWVcnFjOVE1vAHF/LPi9JpEyqXXZrFo=;
	b=LagSaL2SZdqJBDNwQpUzO5Ai9oe7ZLfeIUqMPWjqfkqXIy7UXPyT6LcWqAD8ja4fjss1kN
	wnVcSTEHFJOGvtMi/Mj/kr2c+Ef0I+kmB7uQlaYl9XAjXwoC6IYzJTkBOAvza1sFnm6ai+
	EK0jP+scv3IuMjKy6oWqMsOE3wmN6G4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com, shahuang@redhat.com
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add kvmtool to the
 runner script
Message-ID: <20250626-f9239a18e811ef67ae5a9686@orel>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_174214_990261_993B73F2 
X-CRM114-Status: GOOD (  25.10  )
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

On Wed, Jun 25, 2025 at 04:48:00PM +0100, Alexandru Elisei wrote:
> v3 can be found here [1]. Based on top of the series that add qemu_params and
> test_args [2].
> 
> To goal is to allow the user to do:
> 
> $ ./configure --target=kvmtool
> $ make clean && make
> $ ./run_tests.sh
> 
> to run all the tests automatically with kvmtool.
> 
> Reasons to use kvmtool:
> 
> * kvmtool is smaller and a lot easier to modify compared to qemu, which
> means developers may prefer it when adding or prototyping new features to
> KVM, and being able to run all the tests reliably and automatically is very
> useful.
> 
> * kvmtool is faster to run the tests (a couple of times faster on
> my rockpro64), making for a quick turnaround. But do keep in mind that not
> all tests work on kvmtool because of missing features compared to qemu.
> 
> * kvmtool does things differently than qemu: different memory layout,
> different uart, PMU emulation is disabled by default, etc. This makes it a
> good testing vehicule for kvm-unit-tests itself.

Thanks for this Alex! I didn't test it on arm yet, but I did test it on
riscv with the quick patch below. It works great.

Applied to arm/queue

https://gitlab.com/jones-drew/kvm-unit-tests/-/commits/arm/queue

drew


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
index 470f9d7cdb3b..4a9af4e0af30 100755
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
+    if [ "$arch" != "arm64" ] && [ "$arch" != "arm" ] &&
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
index 0f000f0d82c6..3c242923412c 100755
--- a/riscv/run
+++ b/riscv/run
@@ -10,35 +10,75 @@ if [ -z "$KUT_STANDALONE" ]; then
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
+vmm_check_supported
 
-command="$qemu -nodefaults -nographic -serial mon:stdio"
-command+=" $mach $acc $firmware -cpu $qemu_cpu "
-command="$(migration_cmd) $(timeout_cmd) $command"
+function arch_run_qemu()
+{
+	# Allow user overrides of some config.mak variables
+	mach=$MACHINE_OVERRIDE
+	qemu_cpu=$TARGET_CPU_OVERRIDE
+	firmware=$FIRMWARE_OVERRIDE
 
-if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_test_status $command "$@"
-else
-	# We return the exit code via stdout, not via the QEMU return code
-	run_test_status $command -kernel "$@"
-fi
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
+	if [ "$HOST" = "riscv64" ] && [ "$ARCH" = "riscv32" ]; then
+		echo "Cannot run riscv32 on riscv64" >&2
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
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
