Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A264FC3ABD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B3Pbm7GZFdUWtHqUNx8EGV3mb6wVNFcYBj8JD4fZKW4=; b=ulGZzbrWRpLyX2
	6WU3nlK8H/eikJZBWT2R2wRjFMB0coOvwtzACKgS3l8nWYpGMHuEwb/wLzr2C9oSOq2zHcJG4eGXZ
	6hcgUJDN0kD89Yf4iODfPTLCIZ0SF9gj4tutGo3Y8yGtCTyMwsSsOcxn+1mzyVVtV+DmDpja6vt2O
	dgnjcrSvL1KedJ1pBUywpPKLJJcP5ha+4l+De+kbrOJHKYgsj0v1kt/fAsoOsXuxfGwu+2h3bTjQ9
	jkqGGDSztFY3D3h1aJd+qO829Atp2bnJw7/LGnIRbUdG1Ps7pwmKpb8K8QjX7Rj1Xfle94+OiMhxq
	N4WpXV2XBgeRsE29+Wtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh10-0000000G2KN-1Kir;
	Wed, 07 May 2025 15:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgTH-0000000Fv8F-1AQq
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:14:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79B4522EE;
	Wed,  7 May 2025 08:13:56 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56BAE3F58B;
	Wed,  7 May 2025 08:14:03 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 15/16] scripts: Add 'disabled_if' test definition parameter for kvmtool to use
Date: Wed,  7 May 2025 16:12:55 +0100
Message-ID: <20250507151256.167769-16-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081407_433001_3FA61001 
X-CRM114-Status: GOOD (  20.51  )
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

The pci-test is qemu specific. Other tests perform migration, which
isn't supported by kvmtool. In general, kvmtool is not as feature-rich
as qemu, so add a new unittest parameter, 'disabled_if', that causes a
test to be skipped if the condition evaluates to true.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

This is what Drew said about the patch in the previous iteration [1]:

'I like disabled_if because I like the lambda-like thing it's doing, but I
wonder if it wouldn't be better to make TARGET a first class citizen by
adding a 'targets' unittest parameter which allows listing all targets the
test can run on [..]

If targets isn't present then the default is only qemu.'

Like I've said on the cover letter, I think making qemu the default (if
'targets' isn't specified in the test definition) will mean that new tests
will not run with kvmtool. I was thinking something along the lines
'excluded_targets', with the default (when left unspecified) being that the
tests run with all the vmms that the architecture support (or, to put it
another way, no vmms are excluded).

Or we could go with 'targets' and say that when left empty it means 'all
the vmms that the architecture supports' - though in my opinion this
semantic is somewhat better conveyed with the name 'excluded_targets'.

[1] https://lore.kernel.org/all/20250123-3eda2c10fdce584bdfb14971@orel/

 arm/unittests.cfg    |  7 +++++++
 docs/unittests.txt   | 13 +++++++++++++
 scripts/common.bash  |  6 +++++-
 scripts/runtime.bash |  6 ++++++
 4 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index f3c773e56933..8f9434aad865 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -43,6 +43,7 @@ groups = selftest
 [pci-test]
 file = pci-test.flat
 groups = pci
+disabled_if = [[ "$TARGET" != qemu ]]
 
 # Test PMU support
 [pmu-cycle-counter]
@@ -219,6 +220,7 @@ test_args = its-migration
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 [its-pending-migration]
@@ -228,6 +230,7 @@ test_args = its-pending-migration
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 [its-migrate-unmapped-collection]
@@ -237,6 +240,7 @@ test_args = its-migrate-unmapped-collection
 qemu_params = -machine gic-version=3
 kvmtool_params = --irqchip=gicv3
 groups = its migration
+disabled_if = [[ "$TARGET" != qemu ]]
 arch = arm64
 
 # Test PSCI emulation
@@ -278,6 +282,7 @@ file = debug.flat
 arch = arm64
 test_args = bp-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 [debug-wp]
 file = debug.flat
@@ -290,6 +295,7 @@ file = debug.flat
 arch = arm64
 test_args = wp-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 [debug-sstep]
 file = debug.flat
@@ -302,6 +308,7 @@ file = debug.flat
 arch = arm64
 test_args = ss-migration
 groups = debug migration
+disabled_if = [[ "$TARGET" != qemu ]]
 
 # FPU/SIMD test
 [fpu-context]
diff --git a/docs/unittests.txt b/docs/unittests.txt
index a9164bccc24c..921318a6d85a 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -124,3 +124,16 @@ parameter needs to be of the form <path>=<value>
 The path and value cannot contain space, =, or shell wildcard characters.
 
 Can be overwritten with the CHECK environment variable with the same syntax.
+
+disabled_if
+-----------
+disabled_if = <condition>
+
+Do not run the test if <condition> is met. <condition> will be fed unmodified
+to a bash 'if' statement and follows the same syntax.
+
+This can be used to prevent running a test when kvm-unit-tests is configured a
+certain way. For example, it can be used to skip a qemu specific test when
+using another VMM and using UEFI:
+
+disabled_if = [[ "$TARGET" != qemu ]] && [[ "$CONFIG_EFI" = y ]]
diff --git a/scripts/common.bash b/scripts/common.bash
index ee0ae71948c2..8557d60461ba 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -39,6 +39,7 @@ function for_each_unittest()
 	local check
 	local accel
 	local timeout
+	local disabled_cond
 	local rematch
 
 	exec {fd}<"$unittests"
@@ -47,7 +48,7 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$disabled_cond"
 			fi
 			testname=$rematch
 			smp="${vmm_opts[$TARGET:nr_cpus]} 1"
@@ -63,6 +64,7 @@ function for_each_unittest()
 			check=""
 			accel=""
 			timeout=""
+			disabled_cond=""
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
@@ -85,6 +87,8 @@ function for_each_unittest()
 			machine=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^check\ *=\ *(.*)$ ]]; then
 			check=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^disabled_if\ *=\ *(.*)$ ]]; then
+			disabled_cond=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^accel\ *=\ *(.*)$ ]]; then
 			accel=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^timeout\ *=\ *(.*)$ ]]; then
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index a802686c511d..8755927dbc49 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -85,6 +85,7 @@ function run()
     local check="${CHECK:-$9}"
     local accel="${10}"
     local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
+    local disabled_cond="${12}"
 
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
@@ -132,6 +133,11 @@ function run()
         accel="$ACCEL"
     fi
 
+    if [[ "$disabled_cond" ]] && (eval $disabled_cond); then
+        print_result "SKIP" $testname "" "disabled because: $disabled_cond"
+	return 2
+    fi
+
     # check a file for a particular value before running a test
     # the check line can contain multiple files to check separated by a space
     # but each check parameter needs to be of the form <path>=<value>
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
