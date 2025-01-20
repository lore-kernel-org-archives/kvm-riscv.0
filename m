Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB48BC02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KiLH+e5yRIW3/IYl+gE1ZbGUND/uCRFtA5UyHENTFcA=; b=EKXfvLoU+EYxu/
	Rd9//e8bWpOZrmw5E1yq6fJ365se3zD+Edp1RIDFn/u8sxyw/mqhfThtYOLx/7ddjtB946tJHMKlX
	cQPzezpV6guOs2Q9qRRqP24r5bNhHK237vKX7nf1kIUeU+PkCxCHCWs1EBjhOJIVCOpODRPlKlXqu
	+g8mgTM6+lzPMhlswYts2dXsmxjHOhOqyLANUtEteoLv349KuhSkMbm+PhVOq30665qVMf7DJb+KC
	hgCLlzfuQxkImXymcG8WkNiQYyyrM9cTGRAt4bJqWkOxUTYIj6VNbnEPZkP7wZqUz/8mjfG8tOrH0
	cdx5ATunrtyLOiDxPX0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusZ-000000061sC-2kSn;
	Mon, 20 Jan 2025 16:43:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusX-000000061qI-0lvt
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:43:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B32F1CE2;
	Mon, 20 Jan 2025 08:44:25 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99F273F5A1;
	Mon, 20 Jan 2025 08:43:53 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 07/18] scripts: Introduce kvmtool_opts
Date: Mon, 20 Jan 2025 16:43:05 +0000
Message-ID: <20250120164316.31473-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084357_308121_834ED061 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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

In preparation for supporting kvmtool, create and pass the variable
'kvmtool_opts' to the arch run script $RUNTIME_arch_run.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/common.bash  |  6 ++++--
 scripts/runtime.bash | 14 +++++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/scripts/common.bash b/scripts/common.bash
index a40c28121b6a..1b5e0d667841 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -37,6 +37,7 @@ function for_each_unittest()
 	local check
 	local accel
 	local timeout
+	local kvmtool_opts
 	local rematch
 
 	exec {fd}<"$unittests"
@@ -45,7 +46,7 @@ function for_each_unittest()
 		if [[ "$line" =~ ^\[(.*)\]$ ]]; then
 			rematch=${BASH_REMATCH[1]}
 			if [ -n "${testname}" ]; then
-				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+				$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
 			fi
 			testname=$rematch
 			smp=1
@@ -57,6 +58,7 @@ function for_each_unittest()
 			check=""
 			accel=""
 			timeout=""
+			kvmtool_opts=""
 		elif [[ $line =~ ^file\ *=\ *(.*)$ ]]; then
 			kernel=$TEST_DIR/${BASH_REMATCH[1]}
 		elif [[ $line =~ ^smp\ *=\ *(.*)$ ]]; then
@@ -80,7 +82,7 @@ function for_each_unittest()
 		fi
 	done
 	if [ -n "${testname}" ]; then
-		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout"
+		$(arch_cmd) "$cmd" "$testname" "$groups" "$smp" "$kernel" "$qemu_opts" "$arch" "$machine" "$check" "$accel" "$timeout" "$kvmtool_opts"
 	fi
 	exec {fd}<&-
 }
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index a89f2d10ab78..451b5585f010 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -35,7 +35,7 @@ get_cmdline()
 {
     local kernel=$1
 
-    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $qemu_opts"
+    echo "TESTNAME=$testname TIMEOUT=$timeout MACHINE=$machine ACCEL=$accel $RUNTIME_arch_run $kernel $opts"
 }
 
 skip_nodefault()
@@ -87,8 +87,16 @@ function run()
     local check="${CHECK:-$8}"
     local accel="$9"
     local timeout="${10:-$TIMEOUT}" # unittests.cfg overrides the default
-
-    qemu_opts="-smp $smp $qemu_opts"
+    local kvmtool_opts="${11}"
+
+    case "$TARGET" in
+    qemu)
+        opts="-smp $smp $qemu_opts"
+        ;;
+    kvmtool)
+        opts="--cpus $smp $kvmtool_opts"
+        ;;
+    esac
 
     if [ "${CONFIG_EFI}" == "y" ]; then
         kernel=${kernel/%.flat/.efi}
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
