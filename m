Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E231C0218B
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OG7pGQq5V+PQJe6l0S8U/yHlviavTr4IfXQ+9Y3YWhY=; b=LRCggDBhNLZV9R
	NDZEc9W0GaV+zW5Tqo82YfoYdGdbH6QvrJAk3YyLT6vBmCQZnbfbY9y8n9nLAxQfylHy1OA8ZMv1v
	Zt2yr/ONqsl+rtMCfNmWlOvOBEg0TeQit1VEwy3LvYJCa0AEi8yVX2LDqMEwqaoMddgrAhisLyiok
	6QQoTS/gUri4BfpnnSmlatTOLr+qXPbbPInkuRibZAdxQ1dEmejn48nC5koJlj+Z3yhQSsjl9fTJU
	GcnEV8zbgFoBbCvbhc+3BksUWhhvwfMAArmFvc0qIcoji5DmrqzKl3JfR0Fdx1I2vyb6vGrm11rz/
	38ajDhpTF86KmDUB8Pfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusR-000000061na-3Pcv;
	Mon, 20 Jan 2025 16:43:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusQ-000000061lq-0zCH
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:43:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 500531C0A;
	Mon, 20 Jan 2025 08:44:18 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8C4353F5A1;
	Mon, 20 Jan 2025 08:43:46 -0800 (PST)
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
	andre.przywara@arm.com,
	Alexandru Elisei <alexandru.elisei@gmail.com>
Subject: [kvm-unit-tests PATCH v2 05/18] scripts: Rename run_qemu_status -> run_test_status
Date: Mon, 20 Jan 2025 16:43:03 +0000
Message-ID: <20250120164316.31473-6-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084350_371632_1DE8DD4B 
X-CRM114-Status: GOOD (  10.81  )
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

From: Alexandru Elisei <alexandru.elisei@gmail.com>

For the arm/arm64 architectures, kvm-unit-tests can also be run using the
kvmtool virtual machine manager. Rename run_qemu_status to run_test_status
to make it more generic, in preparation to add support for kvmtool.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/run               | 4 ++--
 powerpc/run           | 2 +-
 riscv/run             | 4 ++--
 s390x/run             | 2 +-
 scripts/arch-run.bash | 2 +-
 5 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arm/run b/arm/run
index 6db32cf09c88..9b11feafffdd 100755
--- a/arm/run
+++ b/arm/run
@@ -85,9 +85,9 @@ command+=" -display none -serial stdio"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
 if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
+	ENVIRON_DEFAULT=n run_test_status $command "$@"
 elif [ "$EFI_USE_ACPI" = "y" ]; then
-	run_qemu_status $command -kernel "$@"
+	run_test_status $command -kernel "$@"
 else
 	run_qemu $command -kernel "$@"
 fi
diff --git a/powerpc/run b/powerpc/run
index 27abf1ef6a4d..9b5fbc1197ed 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -63,4 +63,4 @@ command="$(migration_cmd) $(timeout_cmd) $command"
 # to fixup the fixup below by parsing the true exit code from the output.
 # The second fixup is also a FIXME, because once we add chr-testdev
 # support for powerpc, we won't need the second fixup.
-run_qemu_status $command "$@"
+run_test_status $command "$@"
diff --git a/riscv/run b/riscv/run
index 73f2bf54dc32..2a846d361a4d 100755
--- a/riscv/run
+++ b/riscv/run
@@ -34,8 +34,8 @@ command+=" $mach $acc $firmware -cpu $processor "
 command="$(migration_cmd) $(timeout_cmd) $command"
 
 if [ "$UEFI_SHELL_RUN" = "y" ]; then
-	ENVIRON_DEFAULT=n run_qemu_status $command "$@"
+	ENVIRON_DEFAULT=n run_test_status $command "$@"
 else
 	# We return the exit code via stdout, not via the QEMU return code
-	run_qemu_status $command -kernel "$@"
+	run_test_status $command -kernel "$@"
 fi
diff --git a/s390x/run b/s390x/run
index 34552c2747d4..9ecfaf983a3d 100755
--- a/s390x/run
+++ b/s390x/run
@@ -47,4 +47,4 @@ command+=" -kernel"
 command="$(panic_cmd) $(migration_cmd) $(timeout_cmd) $command"
 
 # We return the exit code via stdout, not via the QEMU return code
-run_qemu_status $command "$@"
+run_test_status $command "$@"
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 8643bab3b252..d6eaf0ee5f09 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -75,7 +75,7 @@ run_qemu ()
 	return $ret
 }
 
-run_qemu_status ()
+run_test_status ()
 {
 	local stdout ret
 
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
