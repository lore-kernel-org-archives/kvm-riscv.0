Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E3FC3ABC5
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzr0vLHfA3+9S8C5/6mnwGrKYj4VGG9yXbqcjTbWuA8=; b=R7gfyxW8cwSfMP
	F9EsSkWmY55i3GBXKmdKb4ULKb1mF0ztrLMCQyxHzy7ms0aov/rYtWQA287anZTi6TTjhFL0DnGB+
	HXOHF+5HsUKKFh2uzfneRTRFSahiB3ycWFlFM8/2VOrND2oGWvPFUTQoK1NJWt1gSyCnLNCzcLkf3
	O9u82XGgQ1RD2vJpllIYEyVpf/EaJhWI0AEcqTTv+aVFOqbSsYR7D1Axr+q45MVQZSFjAshxz1QCS
	vJMtFQxDrls+K4DLwab9xw8jBOPT2PGF0Azb4IzPMxCnILwjsn1RNdqQHj0qxGKIRaW5BiQRtpzH2
	+IbQ/KYnVLakG5H/xHmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0x-0000000G2Hc-2ZNm;
	Wed, 07 May 2025 15:48:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSq-0000000FuxH-3VoN
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 625B42247;
	Wed,  7 May 2025 08:13:28 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E4293F58B;
	Wed,  7 May 2025 08:13:35 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 07/16] scripts: Use an associative array for qemu argument names
Date: Wed,  7 May 2025 16:12:47 +0100
Message-ID: <20250507151256.167769-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081340_965737_E21FD353 
X-CRM114-Status: GOOD (  12.78  )
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

Move away from hardcoded qemu arguments and use instead an associative
array to get the needed arguments. This paves the way for adding kvmtool
support to the scripts, which has a different syntax for the same VM
configuration parameters.

Suggested-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/common.bash  | 10 +++++++---
 scripts/runtime.bash |  7 +------
 scripts/vmm.bash     |  7 +++++++
 3 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/scripts/common.bash b/scripts/common.bash
index 9deb87d4050d..649f1c737617 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,4 +1,5 @@
 source config.mak
+source scripts/vmm.bash
 
 function for_each_unittest()
 {
@@ -26,8 +27,11 @@ function for_each_unittest()
 				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$test_args" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
-			smp=1
+			smp="${vmm_opts[$TARGET:nr_cpus]} 1"
 			kernel=""
+			# Intentionally don't use -append if test_args is empty
+			# because qemu interprets the first argument after
+			# -append as a kernel parameter.
 			test_args=""
 			opts=""
 			groups=""
@@ -39,9 +43,9 @@ function for_each_unittest()
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
-			smp=${BASH_REMATCH[1]}
+			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
-			test_args=${BASH_REMATCH[1]}
+			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
 			opts=${BASH_REMATCH[2]}$'\n'
 			while read -r -u $fd; do
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 06cc58e79b69..86d8a2cd8528 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -34,7 +34,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $smp $test_args $opts"
 }
 
 skip_nodefault()
@@ -88,11 +88,6 @@ function run()
     local accel="${10}"
     local timeout="${11:-$TIMEOUT}" # unittests.cfg overrides the default
 
-    # If $test_args is empty, qemu will interpret the first option after -append
-    # as a kernel parameter instead of a qemu option, so make sure the -append
-    # option is used only if $test_args is not empy.
-    [ -n "$test_args" ] && opts="-append $test_args $opts"
-
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
     fi
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 39325858c6b3..b02055a5c0b6 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -1,5 +1,12 @@
 source config.mak
 
+declare -A vmm_opts=(
+	[qemu:nr_cpus]='-smp'
+	[qemu:kernel]='-kernel'
+	[qemu:args]='-append'
+	[qemu:initrd]='-initrd'
+)
+
 function check_vmm_supported()
 {
 	case "$TARGET" in
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
