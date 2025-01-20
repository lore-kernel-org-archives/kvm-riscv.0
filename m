Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47CF9C02185
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJOO9+NjfbLesTcGyQOQQ/fTnZ4hSw4Z6CzS17qeiZM=; b=hmRv7gGNilIzA4
	b2yHNWjREyBWJz3hatt1IJvRaWEN5lDv3Nthh4Cjo0gRmyWkPZBlzncwgm8sJXLKwIt+3JPW/GItp
	CU8a6SnqZAqvA0oHy/egZccMM85AzVh61x5GbbBoj/j/XWDi+Cij/pPwXIrJfdNAnxkbvvaP9qOmp
	8hVH48UVPUoWTCI0GR19i+OIGUF6dwJj8B/29/aw6EB4Wr9dx7dOOfGwwBZBgRNjSW4/ddmKQPv9w
	piDc6yMCtRDFk/JXZziZbJtWTlF/DEln9fpP688yvL/Y0yX72V6x1hkoJYl6lSJu+gy7CiB6TeDNy
	xlgm2aHwQnXjjcE06jyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZuso-000000061zq-0En7;
	Mon, 20 Jan 2025 16:44:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusl-000000061yl-43Xh
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:44:13 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9854F1D14;
	Mon, 20 Jan 2025 08:44:35 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0131C3F5A1;
	Mon, 20 Jan 2025 08:44:03 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 10/18] scripts/arch-run: Add support for kvmtool
Date: Mon, 20 Jan 2025 16:43:08 +0000
Message-ID: <20250120164316.31473-11-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084412_091915_88683C8F 
X-CRM114-Status: GOOD (  14.07  )
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

Add two new functions, search_kvmtool_binary(), which, like the name
suggests, searches for the location of the kvmtool binary, and
run_kvmtool(), which runs a test with kvmtool as the VMM.

initrd_create() has also been modified to use the kvmtool syntax for
supplying an initrd, which is --initrd (two dashes instead of the single
dash that qemu uses).

arm/run does not know how to use these functions yet, but this will be
added in a subsequent patch.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/arch-run.bash | 94 +++++++++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 13 deletions(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index d6eaf0ee5f09..34f633cade01 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -75,16 +75,47 @@ run_qemu ()
 	return $ret
 }
 
+run_kvmtool ()
+{
+	local stdout errors ret sig
+
+	initrd_create || return $?
+
+	echo -n "$@"
+	[ "$ENVIRON_DEFAULT" = "yes" ] && echo -n " #"
+	echo " $INITRD"
+
+	# stdout to {stdout}, stderr to $errors and stderr
+	exec {stdout}>&1
+	"${@}" $INITRD </dev/null 2> >(tee /dev/stderr) > /dev/fd/$stdout
+	ret=$?
+	exec {stdout}>&-
+
+	return $ret
+}
+
 run_test_status ()
 {
-	local stdout ret
+	local stdout ret ret_success
 
 	exec {stdout}>&1
-	lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
+
+	# For qemu, an exit status of 1 means that the test completed. For kvmtool,
+	# 0 means the same thing.
+	case "$TARGET" in
+	qemu)
+		ret_success=1
+		lines=$(run_qemu "$@" > >(tee /dev/fd/$stdout))
+		;;
+	kvmtool)
+		ret_success=0
+		lines=$(run_kvmtool "$@" > >(tee /dev/fd/$stdout))
+		;;
+	esac
 	ret=$?
 	exec {stdout}>&-
 
-	if [ $ret -eq 1 ]; then
+	if [ $ret -eq $ret_success ]; then
 		testret=$(grep '^EXIT: ' <<<"$lines" | head -n1 | sed 's/.*STATUS=\([0-9][0-9]*\).*/\1/')
 		if [ "$testret" ]; then
 			if [ $testret -eq 1 ]; then
@@ -422,6 +453,25 @@ search_qemu_binary ()
 	export PATH=$save_path
 }
 
+search_kvmtool_binary ()
+{
+	local kvmtoolcmd kvmtool
+
+	for kvmtoolcmd in lkvm vm lkvm-static; do
+		if $kvmtoolcmd --help 2>/dev/null| grep -q 'The most commonly used'; then
+			kvmtool="$kvmtoolcmd"
+			break
+		fi
+	done
+
+	if [ -z "$kvmtool" ]; then
+		echo "A kvmtool binary was not found." >&2
+		return 2
+	fi
+
+	command -v $kvmtool
+}
+
 initrd_cleanup ()
 {
 	rm -f $KVM_UNIT_TESTS_ENV
@@ -447,7 +497,18 @@ initrd_create ()
 	fi
 
 	unset INITRD
-	[ -f "$KVM_UNIT_TESTS_ENV" ] && INITRD="-initrd $KVM_UNIT_TESTS_ENV"
+	if [ ! -f "$KVM_UNIT_TESTS_ENV" ]; then
+		return 0
+	fi
+
+	case "$TARGET" in
+		qemu)
+			INITRD="-initrd $KVM_UNIT_TESTS_ENV"
+			;;
+		kvmtool)
+			INITRD="--initrd $KVM_UNIT_TESTS_ENV"
+			;;
+	esac
 
 	return 0
 }
@@ -471,18 +532,25 @@ env_params ()
 	local qemu have_qemu
 	local _ rest
 
-	qemu=$(search_qemu_binary) && have_qemu=1
+	env_add_params TARGET
+
+	# kvmtool's versioning has been broken since it was split from the kernel
+	# source.
+	if [ "$TARGET" = "qemu" ]; then
+		qemu=$(search_qemu_binary) && have_qemu=1
 
-	if [ "$have_qemu" ]; then
-		if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
-			[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
+		if [ "$have_qemu" ]; then
+			if [ -n "$ACCEL" ] || [ -n "$QEMU_ACCEL" ]; then
+				[ -n "$ACCEL" ] && QEMU_ACCEL=$ACCEL
+			fi
+			QEMU_VERSION_STRING="$($qemu -h | head -1)"
+			# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
+			# shellcheck disable=SC2034
+			IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
 		fi
-		QEMU_VERSION_STRING="$($qemu -h | head -1)"
-		# Shellcheck does not see QEMU_MAJOR|MINOR|MICRO are used
-		# shellcheck disable=SC2034
-		IFS='[ .]' read -r _ _ _ QEMU_MAJOR QEMU_MINOR QEMU_MICRO rest <<<"$QEMU_VERSION_STRING"
+
+		env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
 	fi
-	env_add_params QEMU_ACCEL QEMU_VERSION_STRING QEMU_MAJOR QEMU_MINOR QEMU_MICRO
 
 	KERNEL_VERSION_STRING=$(uname -r)
 	IFS=. read -r KERNEL_VERSION KERNEL_PATCHLEVEL rest <<<"$KERNEL_VERSION_STRING"
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
