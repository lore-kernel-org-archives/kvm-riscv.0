Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0934CC3ABCB
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aOHmIkryfn3CqK4jPE7PwK4dOqYfXwZZbfMN4ztNMA=; b=irudRZ7/X24p9h
	AHh0TwARNZ+x139sCKO5zp38x32uFUvwcJsedLC3UzlANb66I5HRrOe6HwZ3OEqY6tdT6yuB0EB4H
	8fhT0mNl9VibTzY/DoNOa97XZL7NhpGY1Wrdl8EdwIWVZAj8gY4OjfNaPKJOVakW0u22OOhSPUVav
	vrrqGdsXdl/yn0AvAC5eS98z8Ev7YvT4jR+ZCRvBEWEZa+vpkM046jvCxfjoPsRlVVHc8JCxL7a94
	E5eM3zL4D+bZeDxlfyw4VzNZqob+NR6mkZ6XSGU8h8O3sMVpD565mLfiyVdfkZ+ZEcMjzNQGpanSF
	iTo0Zg4253I7R9TDediQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh10-0000000G2Kb-33uw;
	Wed, 07 May 2025 15:48:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgTK-0000000Fv9u-2jyT
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:14:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FE4422F8;
	Wed,  7 May 2025 08:14:00 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E07313F58B;
	Wed,  7 May 2025 08:14:06 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 16/16] scripts: Enable kvmtool
Date: Wed,  7 May 2025 16:12:56 +0100
Message-ID: <20250507151256.167769-17-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081410_821642_51194725 
X-CRM114-Status: GOOD (  13.53  )
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

Everything is in place to run the tests using kvmtool:

$ ./configure --target=kvmtool
$ make clean && make
$ KVMTOOL=<path/to/kvmtool> ./run_tests.sh

so enable it, and remove ERRATA_FORCE=y when configuring for kvmtool,
because the runner will generate and pass the correct environment to
kvmtool.

Missing is support for EFI tests. That's because distros don't ship a
EDK2 binary compiled for kvmtool, and on top of that kvm-unit-tests as
an EFI app hasn't been tested to work with kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 README.md        | 18 +++++++++++++++++-
 arm/efi/run      |  5 +++++
 configure        |  1 -
 scripts/vmm.bash |  2 +-
 4 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index be07dc28a094..723ce04cd978 100644
--- a/README.md
+++ b/README.md
@@ -65,6 +65,9 @@ or:
 
 to run them all.
 
+All tests can be run using QEMU. On arm and arm64, tests can also be run using
+kvmtool.
+
 By default the runner script searches for a suitable QEMU binary in the system.
 To select a specific QEMU binary though, specify the QEMU=path/to/binary
 environment variable:
@@ -78,12 +81,25 @@ ACCEL=name environment variable:
 
 For running tests that involve migration from one QEMU instance to another
 you also need to have the "ncat" binary (from the nmap.org project) installed,
-otherwise the related tests will be skipped.
+otherwise the related tests will be skipped. kvmtool does not support migration.
+
+As for running a test with kvmtool, please configure kvm-unit-tests accordingly
+first:
+
+   ./configure --arch=arm64 --target=kvmtool
+
+then run the test(s) like with QEMU above.
+
+To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
+variable. kvmtool supports only kvm as the accelerator.
 
 ## Running the tests with UEFI
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
+On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
+tests under UEFI.
+
 # Tests configuration file
 
 The test case may need specific runtime configurations, for
diff --git a/arm/efi/run b/arm/efi/run
index 53d71297cc52..0843725ec360 100755
--- a/arm/efi/run
+++ b/arm/efi/run
@@ -15,6 +15,11 @@ source scripts/vmm.bash
 
 check_vmm_supported
 
+if [[ $TARGET = "kvmtool" ]]; then
+	echo "kvmtool does not support EFI tests."
+	exit 2
+fi
+
 if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
 	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
 elif [ -f /usr/share/edk2/aarch64/QEMU_EFI.silent.fd ]; then
diff --git a/configure b/configure
index 8c4400db42bc..d5f9995172f8 100755
--- a/configure
+++ b/configure
@@ -392,7 +392,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         : "${uart_early_addr:=0x9000000}"
     elif [ "$target" = "kvmtool" ]; then
         : "${uart_early_addr:=0x1000000}"
-        errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index ef9819f4132c..4ae60c37a6e8 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -159,7 +159,7 @@ declare -A vmm_opts=(
 function check_vmm_supported()
 {
 	case "$TARGET" in
-	qemu)
+	qemu | kvmtool)
 		return 0
 		;;
 	*)
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
