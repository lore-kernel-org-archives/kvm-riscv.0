Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAEBC02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BCCilHLc6iV/8vtqNBURX0sBqOkPhsdRydbNNNXO/g=; b=n8hfM3vpYCCSDe
	sjvKG8IG2HZ3EqiicGELVHlpo7BFBx+/MKgB1yroXxddpOviyGwGddIVV4AlQzJYR8rRQMZBbGo1h
	Mbf6/ASmRaZLR2IEwyKr4nLatSGx0eE3fSXjsTGWhE+xq4p+4CP03dgObxdpn/9nlzUYENyX6sGdE
	kbz1Rf9rnClVno0NTjNpxnQpCZhHi7VB7eYCBidxyLSd3bRGKuGE8wzPXJgNnvwpQVH2ShdlMuss/
	sWG5jGHCYZ5WrwfTgBQ7OeH+mCNTDJvoG1Aw2uguD3WkkWS2tOI+6MCjtJuWN4BCwC0kI5Dx7/Nta
	Bb2kfoaRouFaVDsd7Khg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusn-000000061zS-2Eg8;
	Mon, 20 Jan 2025 16:44:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusl-000000061yH-05bc
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:44:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18899FEC;
	Mon, 20 Jan 2025 08:44:39 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7170E3F5A1;
	Mon, 20 Jan 2025 08:44:07 -0800 (PST)
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
Cc: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	joey.gouly@arm.com,
	andre.przywara@arm.com
Subject: [kvm-unit-tests PATCH v2 11/18] arm/run: Add support for kvmtool
Date: Mon, 20 Jan 2025 16:43:09 +0000
Message-ID: <20250120164316.31473-12-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084411_148649_9810F3E7 
X-CRM114-Status: GOOD (  10.22  )
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

Teach the arm runner to use kvmtool when kvm-unit-tests has been configured
appropriately.

The test is ran using run_test_status() because kvmtool does not have a
testdev device to return the test exit code, so kvm-unit-tests must always
parse the "EXIT: STATUS" line for the exit code.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/run | 183 ++++++++++++++++++++++++++++++++++----------------------
 1 file changed, 110 insertions(+), 73 deletions(-)

diff --git a/arm/run b/arm/run
index 9b11feafffdd..880d5afae86d 100755
--- a/arm/run
+++ b/arm/run
@@ -17,77 +17,114 @@ qemu)
    exit 3
 esac
 
-processor="$PROCESSOR"
+arch_run_qemu()
+{
+    processor="$PROCESSOR"
+
+    if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
+       [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
+       [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
+        ACCEL="tcg"
+    fi
+
+    set_qemu_accelerator || exit $?
+    if [ "$ACCEL" = "kvm" ]; then
+        QEMU_ARCH=$HOST
+    fi
+
+    qemu=$(search_qemu_binary) ||
+        exit $?
+
+    if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
+        echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
+        exit 2
+    fi
+
+    M='-machine virt'
+
+    if [ "$ACCEL" = "kvm" ]; then
+        if $qemu $M,\? | grep -q gic-version; then
+            M+=',gic-version=host'
+        fi
+    fi
+
+    if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
+        if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
+            processor="host"
+            if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
+                processor+=",aarch64=off"
+            fi
+        fi
+    fi
+
+    if [ "$ARCH" = "arm" ]; then
+        M+=",highmem=off"
+    fi
+
+    if ! $qemu $M -device '?' | grep -q virtconsole; then
+        echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
+        exit 2
+    fi
+
+    if ! $qemu $M -chardev '?' | grep -q testdev; then
+        echo "$qemu doesn't support chr-testdev. Exiting."
+        exit 2
+    fi
+
+    if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
+        chr_testdev='-device virtio-serial-device'
+        chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
+    fi
+
+    pci_testdev=
+    if $qemu $M -device '?' | grep -q pci-testdev; then
+        pci_testdev="-device pci-testdev"
+    fi
+
+    A="-accel $ACCEL$ACCEL_PROPS"
+    command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
+    command+=" -display none -serial stdio"
+    command="$(migration_cmd) $(timeout_cmd) $command"
+
+    if [ "$UEFI_SHELL_RUN" = "y" ]; then
+        ENVIRON_DEFAULT=n run_test_status $command "$@"
+    elif [ "$EFI_USE_ACPI" = "y" ]; then
+        run_test_status $command -kernel "$@"
+    else
+        run_qemu $command -kernel "$@"
+    fi
+}
+
+arch_run_kvmtool()
+{
+    local command
+
+    kvmtool=$(search_kvmtool_binary) ||
+        exit $?
+
+    if [ "$ACCEL" ] && [ "$ACCEL" != "kvm" ]; then
+        echo "kvmtool does not support $ACCEL" >&2
+        exit 2
+    fi
+
+    if ! kvm_available; then
+        echo "KVM required by kvmtool but not available on the host" >&2
+        exit 2
+    fi
+
+    command="$(timeout_cmd) $kvmtool run"
+    if [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ]; then
+	    run_test_status $command --kernel "$@" --aarch32
+    else
+	    run_test_status $command --kernel "$@"
+    fi
+}
 
-if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
-   [ "$HOST" = "aarch64" ] && [ "$ARCH" = "arm" ] &&
-   [ "$(basename $QEMU)" = "qemu-system-arm" ]; then
-	ACCEL="tcg"
-fi
-
-set_qemu_accelerator || exit $?
-if [ "$ACCEL" = "kvm" ]; then
-	QEMU_ARCH=$HOST
-fi
-
-qemu=$(search_qemu_binary) ||
-	exit $?
-
-if ! $qemu -machine '?' | grep -q 'ARM Virtual Machine'; then
-	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
-	exit 2
-fi
-
-M='-machine virt'
-
-if [ "$ACCEL" = "kvm" ]; then
-	if $qemu $M,\? | grep -q gic-version; then
-		M+=',gic-version=host'
-	fi
-fi
-
-if [ "$ACCEL" = "kvm" ] || [ "$ACCEL" = "hvf" ]; then
-	if [ "$HOST" = "aarch64" ] || [ "$HOST" = "arm" ]; then
-		processor="host"
-		if [ "$ARCH" = "arm" ] && [ "$HOST" = "aarch64" ]; then
-			processor+=",aarch64=off"
-		fi
-	fi
-fi
-
-if [ "$ARCH" = "arm" ]; then
-	M+=",highmem=off"
-fi
-
-if ! $qemu $M -device '?' | grep -q virtconsole; then
-	echo "$qemu doesn't support virtio-console for chr-testdev. Exiting."
-	exit 2
-fi
-
-if ! $qemu $M -chardev '?' | grep -q testdev; then
-	echo "$qemu doesn't support chr-testdev. Exiting."
-	exit 2
-fi
-
-if [ "$UEFI_SHELL_RUN" != "y" ] && [ "$EFI_USE_ACPI" != "y" ]; then
-	chr_testdev='-device virtio-serial-device'
-	chr_testdev+=' -device virtconsole,chardev=ctd -chardev testdev,id=ctd'
-fi
-
-pci_testdev=
-if $qemu $M -device '?' | grep -q pci-testdev; then
-	pci_testdev="-device pci-testdev"
-fi
-
-A="-accel $ACCEL$ACCEL_PROPS"
-command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
-command+=" -display none -serial stdio"
-command="$(migration_cmd) $(timeout_cmd) $command"
-
-if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_test_status $command "$@"
-elif [ "$EFI_USE_ACPI" = "y" ]; then
-	run_test_status $command -kernel "$@"
-else
-	run_qemu $command -kernel "$@"
-fi
+case "$TARGET" in
+qemu)
+    arch_run_qemu "$@"
+    ;;
+kvmtool)
+    arch_run_kvmtool "$@"
+    ;;
+esac
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
