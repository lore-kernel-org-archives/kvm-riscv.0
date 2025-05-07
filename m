Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC14FC3ABCF
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vuSwiUENlQHszh/mj11UA8IgekkVY/Z1IdrbtXqp/U=; b=mu5uP0MekgOdRo
	+cvHEP0F0LMbgY2EtPEFFQZuJWTH0jufsE7pZoDkhx7qjCwbQtCE5bNlO8UGylnTj5Wc2xKNimYQb
	8+vFnmp5ol2FCGR00ptlDp2Haf08cXH0N/bu2AOZIs4A52AERNpASzyLkt1p/58X7XmJ5fBpM8t56
	t+5wty6I/9CJXFfwF8U3OJSkLXGz75duB+Q/aGrwJRMOnjYpOwrYh5kmzka0C90HyBnM9a8Br//wz
	+5Wc7PRynGm800y5JQmfIlTQhkrHpCD/W9F1QFx+tquIDNeK7s8EAPMVjpHSuSSNBV2VQaH9QPFu3
	dirBNqwE1dR03ZFMwWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0z-0000000G2JZ-255V;
	Wed, 07 May 2025 15:48:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgTA-0000000Fv57-0JPF
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:14:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71CED22E6;
	Wed,  7 May 2025 08:13:49 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 544FE3F58B;
	Wed,  7 May 2025 08:13:56 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 13/16] scripts: Do not probe for maximum number of VCPUs when using kvmtool
Date: Wed,  7 May 2025 16:12:53 +0100
Message-ID: <20250507151256.167769-14-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081400_237758_CF8C8D2A 
X-CRM114-Status: GOOD (  11.21  )
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

The --probe-maxsmp parameter updates MAX_SMP with the maximum number of
VCPUs that the host supports. Qemu will exit with an error when creating a
virtual machine if the number of VCPUs is exceeded.

kvmtool behaves differently: it will automatically limit the number of
VCPUs to the what KVM supports, which is exactly what --probe-maxsmp wants
to achieve. When doing --probe-maxsmp with kvmtool, print a message
explaining why it's redundant and don't do anything else.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh         |  3 ++-
 scripts/runtime.bash | 16 ----------------
 scripts/vmm.bash     | 24 ++++++++++++++++++++++++
 3 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 150a06a91064..a69c3665b7a4 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -10,6 +10,7 @@ if [ ! -f config.mak ]; then
 fi
 source config.mak
 source scripts/common.bash
+source scripts/vmm.bash
 
 function usage()
 {
@@ -90,7 +91,7 @@ while [ $# -gt 0 ]; do
             list_tests="yes"
             ;;
         --probe-maxsmp)
-            probe_maxsmp
+            ${vmm_opts[$TARGET:probe_maxsmp]}
             ;;
         --)
             ;;
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 01ec8eae2bba..a802686c511d 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -209,19 +209,3 @@ function run()
 
     return $ret
 }
-
-#
-# Probe for MAX_SMP, in case it's less than the number of host cpus.
-#
-function probe_maxsmp()
-{
-	local smp
-
-	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
-		smp=${smp##* }
-		smp=${smp/\(}
-		smp=${smp/\)}
-		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
-		MAX_SMP=$smp
-	fi
-}
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index a1d50ed51981..ef9819f4132c 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -105,6 +105,22 @@ function qemu_parse_premature_failure()
 	return 0
 }
 
+#
+# Probe for MAX_SMP, in case it's less than the number of host cpus.
+#
+function qemu_probe_maxsmp()
+{
+	local smp
+
+	if smp=$($RUNTIME_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
+		smp=${smp##* }
+		smp=${smp/\(}
+		smp=${smp/\)}
+		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
+		MAX_SMP=$smp
+	fi
+}
+
 function kvmtool_parse_premature_failure()
 {
 	local log="$@"
@@ -114,6 +130,12 @@ function kvmtool_parse_premature_failure()
 	return 0
 }
 
+function kvmtool_probe_maxsmp()
+{
+	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
+	echo "The 'smp' test parameter won't be modified"
+}
+
 declare -A vmm_opts=(
 	[qemu:nr_cpus]='-smp'
 	[qemu:kernel]='-kernel'
@@ -122,6 +144,7 @@ declare -A vmm_opts=(
 	[qemu:default_opts]=''
 	[qemu:fixup_return_code]=qemu_fixup_return_code
 	[qemu:parse_premature_failure]=qemu_parse_premature_failure
+	[qemu:probe_maxsmp]=qemu_probe_maxsmp
 
 	[kvmtool:nr_cpus]='--cpus'
 	[kvmtool:kernel]='--kernel'
@@ -130,6 +153,7 @@ declare -A vmm_opts=(
 	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
 	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
+	[kvmtool:probe_maxsmp]=kvmtool_probe_maxsmp
 )
 
 function check_vmm_supported()
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
