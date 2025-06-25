Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9918FC83013
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 19:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Ch6N7ocun9HDC4oWbMKBGroyv+3pLg/LqONrdYFDzk=; b=bcG0zmniL4nHZw
	qQkrhXzHyBLn/SjDNGCAdO3jNYCn4Eh6e+I9U2Ia+GJ0rAYVWkiNyLtgzuBXj52BOhkFv20a8n8+R
	txqwByiDLziwzRquuBttLNVtY96hRHaC1ov4WxuXYYVOHg42veKFlv3O1cQcyZ6O3oP8lGKhiEBtu
	nxgDZ724QaHYekMehl0yxmE3VOT3Q/+j5Vu/57OIFb7h6LL2JvPgI8iSyVl+EDcasnpVZi2peOoji
	+Ecir7aZQcVISMq5Df73qOnYzStp5kiN7BRPVBEV4xwjbXczC17FeGNeApeF0MQVS7DwoQ+FPCkjj
	GXKMaZOjnrJwAxt1KqDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUVxO-00000009lTQ-1DRn;
	Wed, 25 Jun 2025 19:38:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSN8-00000009Aym-2sIa
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 15:49:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0FF2720E3;
	Wed, 25 Jun 2025 08:48:56 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D09AD3F58B;
	Wed, 25 Jun 2025 08:49:09 -0700 (PDT)
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
	shahuang@redhat.com
Subject: [kvm-unit-tests PATCH v4 10/13] scripts: Do not probe for maximum number of VCPUs when using kvmtool
Date: Wed, 25 Jun 2025 16:48:10 +0100
Message-ID: <20250625154813.27254-11-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084914_798697_227D5E4F 
X-CRM114-Status: GOOD (  10.61  )
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

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Use vmmm_probe_maxsmp() instead of indexing vmm_optname in run_tests.sh.

 run_tests.sh         |  3 ++-
 scripts/runtime.bash | 16 ----------------
 scripts/vmm.bash     | 30 ++++++++++++++++++++++++++++++
 3 files changed, 32 insertions(+), 17 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 150a06a91064..4cfc3cd9e4cf 100755
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
+            vmm_probe_maxsmp $RUNTIME_arch_run
             ;;
         --)
             ;;
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 5839ca5ca665..766d1d28fb75 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -207,19 +207,3 @@ function run()
 
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
index 44954a711cad..724c96f9e665 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -91,6 +91,23 @@ function qemu_parse_premature_failure()
 	return 0
 }
 
+#
+# Probe for MAX_SMP, in case it's less than the number of host cpus.
+#
+function qemu_probe_maxsmp()
+{
+	local runtime_arch_run="$1"
+	local smp
+
+	if smp=$($runtime_arch_run _NO_FILE_4Uhere_ -smp $MAX_SMP |& grep 'SMP CPUs'); then
+		smp=${smp##* }
+		smp=${smp/\(}
+		smp=${smp/\)}
+		echo "Restricting MAX_SMP from ($MAX_SMP) to the max supported ($smp)" >&2
+		MAX_SMP=$smp
+	fi
+}
+
 function kvmtool_fixup_return_code()
 {
 	local ret=$1
@@ -112,6 +129,12 @@ function kvmtool_parse_premature_failure()
 	return 0
 }
 
+function kvmtool_probe_maxsmp()
+{
+	echo "kvmtool automatically limits the number of VCPUs to maximum supported"
+	echo "The 'smp' test parameter won't be modified"
+}
+
 declare -A vmm_optname=(
 	[qemu,args]='-append'
 	[qemu,default_opts]=''
@@ -119,6 +142,7 @@ declare -A vmm_optname=(
 	[qemu,initrd]='-initrd'
 	[qemu,nr_cpus]='-smp'
 	[qemu,parse_premature_failure]=qemu_parse_premature_failure
+	[qemu,probe_maxsmp]=qemu_probe_maxsmp
 
 	[kvmtool,args]='--params'
 	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
@@ -126,6 +150,7 @@ declare -A vmm_optname=(
 	[kvmtool,initrd]='--initrd'
 	[kvmtool,nr_cpus]='--cpus'
 	[kvmtool,parse_premature_failure]=kvmtool_parse_premature_failure
+	[kvmtool,probe_maxsmp]=kvmtool_probe_maxsmp
 )
 
 function vmm_optname_args()
@@ -158,6 +183,11 @@ function vmm_parse_premature_failure()
 	${vmm_optname[$(vmm_get_target),parse_premature_failure]} "$@"
 }
 
+function vmm_probe_maxsmp()
+{
+	${vmm_optname[$(vmm_get_target),probe_maxsmp]} "$1"
+}
+
 function vmm_get_target()
 {
 	if [[ -z "$TARGET" ]]; then
-- 
2.50.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
