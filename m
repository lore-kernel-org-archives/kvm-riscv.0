Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6B4C02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVrJGkpavdOvAA1iRM00WZHum/gOOearejNKc4tW8s4=; b=qNVQJpPbu8BmfE
	GL1C0zqoTC3SXev0aAV3phYk89MjEbhWAVk9jdSk5phqNmKJO4LJX8DvUw//Wyep3SF7tGF/yWr6z
	fCtJjayRtIfhhV9K9cunc/yaiFo+qwhoGPNROImxm4A7A32UzZ0HlNcCRMysNk17jDD10k6T/TSRU
	MNlreOENlluk+KXRw4TxlgKhu2N0tWbMmRoA/QA8yBGKdXHWtsln+yiauSGQkW0H+4U5iyq6cWxHV
	wYPv1bp4TqEWkfIqMXruyf8lBcvNFfpqDwdVM1BdKU2cW42ek/1KkmfIT9vRc6Q/jPtJSleiZJDCf
	1wutQRh5vO5Wx8K0NeXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusQ-000000061m2-0oY2;
	Mon, 20 Jan 2025 16:43:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusN-000000061jw-1JpM
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:43:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3E66169C;
	Mon, 20 Jan 2025 08:44:14 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 191683F5A1;
	Mon, 20 Jan 2025 08:43:42 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 04/18] run_tests: Introduce unittest parameter 'qemu_params'
Date: Mon, 20 Jan 2025 16:43:02 +0000
Message-ID: <20250120164316.31473-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084347_437121_4968098B 
X-CRM114-Status: GOOD (  17.10  )
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

Tests for the arm and arm64 architectures can also be run with kvmtool, and
work is under way to have it supported by the run_tests.sh test runner. Not
suprisingly, kvmtool has a different syntax than qemu when configuring and
running a virtual machine.

Add a new unittest parameter, 'qemu_params', with the goal to add a similar
parameter for each virtual machine manager that run_tests.sh supports.

'qemu_params' and 'extra_params' are interchangeable, but it is expected
that going forward new tests will use 'qemu_params'. A test should have
only one of the two parameters.

While we're at it, rename the variable opts to qemu_opts to match the new
unit configuration name, and to make it easier to distinguish from the
kvmtool parameters when they'll be added.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 docs/unittests.txt   | 17 +++++++++-----
 scripts/common.bash  | 53 ++++++++++++++++++++++++++------------------
 scripts/runtime.bash | 10 ++++-----
 3 files changed, 47 insertions(+), 33 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index dbc2c11e3b59..3e1a9e563016 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -24,9 +24,9 @@ param = value format.
 
 Available parameters
 ====================
-Note! Some parameters like smp and extra_params modify how a test is run,
-while others like arch and accel restrict the configurations in which the
-test is run.
+Note! Some parameters like smp and qemu_params/extra_params modify how a
+test is run, while others like arch and accel restrict the configurations
+in which the test is run.
 
 file
 ----
@@ -56,13 +56,18 @@ smp = <number>
 Optional, the number of processors created in the machine to run the test.
 Defaults to 1. $MAX_SMP can be used to specify the maximum supported.
 
-extra_params
-------------
+qemu_params
+-----------
 These are extra parameters supplied to the QEMU process. -append '...' can
 be used to pass arguments into the test case argv. Multiple parameters can
 be added, for example:
 
-extra_params = -m 256 -append 'smp=2'
+qemu_params = -m 256 -append 'smp=2'
+
+extra_params
+------------
+Alias for 'qemu_params', supported for compatibility purposes. Use
+'qemu_params' for new tests.
 
 groups
 ------
diff --git a/scripts/common.bash b/scripts/common.bash
index 3aa557c8c03d..a40c28121b6a 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,5 +1,28 @@
 source config.mak
 
+function parse_opts()
+{
+	local opts="$1"
+	local fd="$2"
+
+	while read -r -u $fd; do
+		#escape backslash newline, but not double backslash
+		if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
+			if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
+				opts=${opts%\\$'\n'}
+			fi
+		fi
+		if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
+			opts+=${BASH_REMATCH[1]}
+			break
+		else
+			opts+=$REPLY$'\n'
+		fi
+	done
+
+	echo "$opts"
+}
+
 function for_each_unittest()
 {
 	local unittests="$1"
@@ -7,7 +30,7 @@ function for_each_unittest()
 	local testname
 	local smp
 	local kernel
-	local opts
+	local qemu_opts
 	local groups
 	local arch
 	local machine
@@ -22,12 +45,12 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 			fi
 			testname=$rematch
 			smp=1
 			kernel=""
-			opts=""
+			qemu_opts=""
 			groups=""
 			arch=""
 			machine=""
@@ -38,24 +61,10 @@ function for_each_unittest()
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
 			smp=${BASH_REMATCH[1]}
-		elif [[ $line =~ ^extra_params\ *=\ *'"""'(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}$'\n'
-			while read -r -u $fd; do
-				#escape backslash newline, but not double backslash
-				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
-					if (( ${#BASH_REMATCH[1]} % 2 == 1 )); then
-						opts=${opts%\\$'\n'}
-					fi
-				fi
-				if [[ "$REPLY" =~ ^(.*)'"""'[:blank:]*$ ]]; then
-					opts+=${BASH_REMATCH[1]}
-					break
-				else
-					opts+=$REPLY$'\n'
-				fi
-			done
-		elif [[ $line =~ ^extra_params\ *=\ *(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}
+		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
+			qemu_opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
+		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
+			qemu_opts=${BASH_REMATCH[2]}
 		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
@@ -71,7 +80,7 @@ function for_each_unittest()
 		fi
 	done
 	if [ -n "${testname}" ]; then
-		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
 	fi
 	exec {fd}<&-
 }
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 4b9c7d6b7c39..e5d661684ceb 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -34,7 +34,7 @@ premature_failure()
 get_cmdline()
 {
     local kernel=$1
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel -smp $smp $qemu_opts"
 }
 
 skip_nodefault()
@@ -80,7 +80,7 @@ function run()
     local groups="$2"
     local smp="$3"
     local kernel="$4"
-    local opts="$5"
+    local qemu_opts="$5"
     local arch="$6"
     local machine="$7"
     local check="${CHECK:-$8}"
@@ -179,9 +179,9 @@ function run()
         echo $cmdline
     fi
 
-    # extra_params in the config file may contain backticks that need to be
-    # expanded, so use eval to start qemu.  Use "> >(foo)" instead of a pipe to
-    # preserve the exit status.
+    # qemu_params/extra_params in the config file may contain backticks that
+    # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
+    # a pipe to preserve the exit status.
     summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
                              > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
     ret=$?
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
