Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 102ECC3ABCC
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ChOwj5YQwzQ7djHOw47ekCe50OEV5KFe1Ba4wmgp6NY=; b=l6Ym5US1Pbgmgu
	NcAYkJwRGOZ5rpPxagQDXGyH9dsWQF8oGMxiSsMtjvGwGwt/ehdeIqN38MXHfPuaSy76/8r+Nu82k
	KJqpCjoOGdVPOqTLlvgt3fVFwKFHLtjKxqQTPaaVG3YYgL8rurSxHgVJo/rwaCMNjeLvSnKmWC52z
	+U0BInG/twZgR9UpnP8jHyhVjmGJIsLYBDb4+QCgEt2Ln5eRyFgHN8/eoc4L/TH4wZiGytny0abKF
	+y8QgjPtdVWn6rlgxGYzuOkqtfG97kVCXluc90cz8Rqpo5yJ+R1PetY8SNkelzzKUvC+OieNyM8bx
	wBcwvLkp+rhV7DtWbtgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0w-0000000G2Gh-3FjL;
	Wed, 07 May 2025 15:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSl-0000000Fuv4-1Jis
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B9A312103;
	Wed,  7 May 2025 08:13:24 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A1FA03F58B;
	Wed,  7 May 2025 08:13:31 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 06/16] scripts: Refuse to run the tests if not configured for qemu
Date: Wed,  7 May 2025 16:12:46 +0100
Message-ID: <20250507151256.167769-7-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081335_492987_F5278F4F 
X-CRM114-Status: GOOD (  21.20  )
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

Arm and arm64 support running the tests under kvmtool. kvmtool has a
different command line syntax for configuring and running a virtual
machine, and the automated scripts know only how to use qemu.

One issue with that is even though the tests have been configured for
kvmtool (with ./configure --target=kvmtool), the scripts will use qemu to
run the tests, and without looking at the logs there is no indication that
the tests haven't been run with kvmtool, as configured.

Another issue is that kvmtool uses a different address for the UART and
when running the tests with qemu via the scripts, this warning is
displayed:

WARNING: early print support may not work. Found uart at 0x9000000, but early base is 0x1000000.

which might trip up an unsuspected user.

There are four different ways to run a test using the test infrastructure:
with run_tests.sh, by invoking arm/run or arm/efi/run with the correct
parameters (only the arm directory is mentioned here because the tests can
be configured for kvmtool only on arm and arm64), and by creating
standalone tests.

run_tests.sh ends up execuing either arm/run or arm/efi/run, so add a check
to these two scripts for the test target, and refuse to run the test if
kvm-unit-tests has been configured for kvmtool.

mkstandalone.sh also executes arm/run or arm/efi run, but the usual use
case for standalone tests is to compile them on one machine, and then to
run them on a different machine. This two step process can be time
consuming, so save the user time (and frustration!) and add a check
directly to mkstandalone.sh.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/efi/run             |  3 +++
 arm/run                 |  4 ++++
 scripts/mkstandalone.sh |  3 +++
 scripts/vmm.bash        | 14 ++++++++++++++
 4 files changed, 24 insertions(+)
 create mode 100644 scripts/vmm.bash

diff --git a/arm/efi/run b/arm/efi/run
index 8f41fc02df31..53d71297cc52 100755
--- a/arm/efi/run
+++ b/arm/efi/run
@@ -11,6 +11,9 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/arch-run.bash
+source scripts/vmm.bash
+
+check_vmm_supported
 
 if [ -f /usr/share/qemu-efi-aarch64/QEMU_EFI.fd ]; then
 	DEFAULT_UEFI=/usr/share/qemu-efi-aarch64/QEMU_EFI.fd
diff --git a/arm/run b/arm/run
index ef58558231b7..56562ed1628f 100755
--- a/arm/run
+++ b/arm/run
@@ -7,7 +7,11 @@ if [ -z "$KUT_STANDALONE" ]; then
 	fi
 	source config.mak
 	source scripts/arch-run.bash
+	source scripts/vmm.bash
 fi
+
+check_vmm_supported
+
 qemu_cpu="$TARGET_CPU"
 
 if [ "$QEMU" ] && [ -z "$ACCEL" ] &&
diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index c4ba81f18935..4f666cefe076 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -6,6 +6,9 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/common.bash
+source scripts/vmm.bash
+
+check_vmm_supported
 
 temp_file ()
 {
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
new file mode 100644
index 000000000000..39325858c6b3
--- /dev/null
+++ b/scripts/vmm.bash
@@ -0,0 +1,14 @@
+source config.mak
+
+function check_vmm_supported()
+{
+	case "$TARGET" in
+	qemu)
+		return 0
+		;;
+	*)
+		echo "$0 does not support target '$TARGET'"
+		exit 2
+		;;
+	esac
+}
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
