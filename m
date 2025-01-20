Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 975BDC02182
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltkSsuIoY2eARkaXOJ5RnmswCxltr7G56I02rAMhDQI=; b=cfpuToL2Nytv0e
	uRYABdndFUhdufKod6Zc+X1aOn60tPW8BvbbFk3JwXAdR0gtM/8xwUVxITjyCJmpJ/glVxHDXnUXC
	6Rja/l3cw+J3Nd+Iz+fNMfwibDtarhlobSbX3zp31XnwUwY9QSkBkQSlbu8zGw6wmx4p/P51kM9mR
	SFtFy3J5HEiYkarmqetDdXnk5Q6ExkOZDyHRU2ics56d2PBVNz7F3bx50lQx7hANC2Rihtcf4zNJ7
	D/QRrvmnIdwYJFeZhKNd2iYWekKC0u49KN4kUswa93T9BBcNfamorOgr0Fj7w0J21S/69S8Ryi4wP
	tXQ/emLwCp41nx0gORmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZutD-000000062IB-1bd8;
	Mon, 20 Jan 2025 16:44:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZutA-000000062Fy-1jJ6
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:44:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00BE31D6F;
	Mon, 20 Jan 2025 08:45:04 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08CEE3F5A1;
	Mon, 20 Jan 2025 08:44:31 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 18/18] run_tests: Enable kvmtool
Date: Mon, 20 Jan 2025 16:43:16 +0000
Message-ID: <20250120164316.31473-19-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084436_545151_AC0A3D15 
X-CRM114-Status: GOOD (  14.25  )
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

Should I also revert commit 35145f140442 ("arm/arm64: kvmtool: force all tests
to run") which introduced ERRATA_FORCE? I didn't do this now in case other
architectures use it/planning to use it.

 README.md               | 15 +++++++++++++++
 arm/run                 |  2 +-
 configure               |  1 -
 run_tests.sh            |  2 +-
 scripts/mkstandalone.sh |  2 +-
 5 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/README.md b/README.md
index be07dc28a094..5e7706f02553 100644
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
@@ -80,10 +83,22 @@ For running tests that involve migration from one QEMU instance to another
 you also need to have the "ncat" binary (from the nmap.org project) installed,
 otherwise the related tests will be skipped.
 
+To run a test with kvmtool, please configure kvm-unit-tests accordingly first:
+
+   ./configure --arch=arm64 --target=kvmtool
+
+then run the test(s) like with QEMU above.
+
+To select a kvmtool binary, specify the KVMTOOL=path/to/binary environment
+variable. kvmtool supports only kvm as the accelerator.
+
 ## Running the tests with UEFI
 
 Check [x86/efi/README.md](./x86/efi/README.md).
 
+On arm and arm64, this is only supported with QEMU; kvmtool cannot run the
+tests under UEFI.
+
 # Tests configuration file
 
 The test case may need specific runtime configurations, for
diff --git a/arm/run b/arm/run
index 880d5afae86d..438a2617e564 100755
--- a/arm/run
+++ b/arm/run
@@ -10,7 +10,7 @@ if [ -z "$KUT_STANDALONE" ]; then
 fi
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
    echo "'$TARGET' not supported"
diff --git a/configure b/configure
index 86cf1da36467..17d3d931f2c0 100755
--- a/configure
+++ b/configure
@@ -299,7 +299,6 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
         arm_uart_early_addr=0x09000000
     elif [ "$target" = "kvmtool" ]; then
         arm_uart_early_addr=0x1000000
-        errata_force=1
     else
         echo "--target must be one of 'qemu' or 'kvmtool'!"
         usage
diff --git a/run_tests.sh b/run_tests.sh
index d38954be9093..3921dcdcb344 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -110,7 +110,7 @@ while [ $# -gt 0 ]; do
 done
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
     echo "$0 does not support '$TARGET'"
diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 10abb5e191b7..16383b05adfa 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -8,7 +8,7 @@ source config.mak
 source scripts/common.bash
 
 case "$TARGET" in
-qemu)
+qemu | kvmtool)
     ;;
 *)
     echo "'$TARGET' not supported for standlone tests"
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
