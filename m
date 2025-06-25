Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7EF6C7EE30
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V/7613SGaneIJ0FL7GyEsDktnkNhC1n9yBMfuOCf+HQ=; b=kpVsIDdnLktGGu
	AJAY8WZcdJVNt4TbrtMvWT8CNF97bJFd3Nwbg6wYbTGF2OI5bYFeXS8wWVzD/6l+FTa5lf4N9Wscy
	vUW6mCtqHS60xz00BxycglbHybujggnfouAd0TBevVIoWlmzPfRqZjPN6b0w4DQRMoNloiQm4lWAE
	puTdcZ5sDtZJQB+NlklJ80DPprCkDXc4DVjfXnHgomOjdd+GUxnowCDQ5Lb12EIXogZOOY7LK40eC
	ahlNaYSY91rrVnBgCewYGoMQcHAWc2lAdn62S+WJRTcwL7qlbWwJ3AJHntgpK07u0fwm1luokKajv
	QjV/gU4rOrBC7/3kIuYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsR-00000009aWd-27Bc;
	Wed, 25 Jun 2025 18:29:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSMu-00000009Aso-1GuA
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 15:49:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD9331A2D;
	Wed, 25 Jun 2025 08:48:41 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BDE53F58B;
	Wed, 25 Jun 2025 08:48:55 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 07/13] scripts: Add default arguments for kvmtool
Date: Wed, 25 Jun 2025 16:48:07 +0100
Message-ID: <20250625154813.27254-8-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084900_423301_2A0432C2 
X-CRM114-Status: GOOD (  15.85  )
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

kvmtool, unless told otherwise, will do its best to make sure that a kernel
successfully boots in a virtual machine. It does things like automatically
creating a rootfs and adding extra parameters to the kernel command line.
This is actively harmful to kvm-unit-tests, because some tests parse the
kernel command line and they will fail if they encounter the options added
by kvmtool.

Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
line argument") addded the --nodefaults kvmtool parameter which disables
all the implicit virtual machine configuration that cannot be disabled by
using other parameters, like modifying the kernel command line. So always
use --nodefaults to allow a test to run.

kvmtool can also be too verbose when running a virtual machine, and this is
controlled by several parameters. Add those to the default kvmtool command
line to reduce this verbosity to a minimum.

Before:

$ vm run arm/selftest.flat --cpus 2 --mem 256 --params "setup smp=2 mem=256"
Info: # lkvm run -k arm/selftest.flat -m 256 -c 2 --name guest-5035
Unknown subtest

EXIT: STATUS=127
Warning: KVM compatibility warning.
    virtio-9p device was not detected.
    While you have requested a virtio-9p device, the guest kernel did not initialize it.
    Please make sure that the guest kernel was compiled with CONFIG_NET_9P_VIRTIO=y enabled in .config.
Warning: KVM compatibility warning.
    virtio-net device was not detected.
    While you have requested a virtio-net device, the guest kernel did not initialize it.
    Please make sure that the guest kernel was compiled with CONFIG_VIRTIO_NET=y enabled in .config.
Info: KVM session ended normally.

After:

$ vm run arm/selftest.flat --nodefaults --network mode=none --loglevel=warning --cpus 2 --mem 256 --params "setup smp=2 mem=256"
PASS: selftest: setup: smp: number of CPUs matches expectation
INFO: selftest: setup: smp: found 2 CPUs
PASS: selftest: setup: mem: memory size matches expectation
INFO: selftest: setup: mem: found 256 MB
SUMMARY: 2 tests

EXIT: STATUS=1

Note that KVMTOOL_DEFAULT_OPTS can be overwritten by an environment
variable with the same name, but it's not documented in the help string for
run_tests.sh. This has been done on purpose, since overwritting
KVMTOOL_DEFAULT_OPTS should only be necessary for debugging or development
purposes.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Use vmm_default_opts() instead of indexing into vmm_optname
* Reworded the help test for --nodefaults as per Shaoqin's suggestion.

 scripts/common.bash |  6 +++---
 scripts/vmm.bash    | 18 ++++++++++++++++++
 2 files changed, 21 insertions(+), 3 deletions(-)

diff --git a/scripts/common.bash b/scripts/common.bash
index 7c1b89f1b3c2..d5d3101c8089 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -37,7 +37,7 @@ function for_each_unittest()
 			# -append as a kernel parameter instead of a command
 			# line option.
 			test_args=""
-			opts=""
+			opts="$(vmm_default_opts)"
 			groups=""
 			arch=""
 			machine=""
@@ -51,7 +51,7 @@ function for_each_unittest()
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
 			test_args="$(vmm_optname_args) ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^$params_name\ *=\ *'"""'(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}$'\n'
+			opts="$(vmm_defaults_opts) ${BASH_REMATCH[1]}$'\n'"
 			while read -r -u $fd; do
 				#escape backslash newline, but not double backslash
 				if [[ $opts =~ [^\\]*(\\*)$'\n'$ ]]; then
@@ -67,7 +67,7 @@ function for_each_unittest()
 				fi
 			done
 		elif [[ $line =~ ^$params_name\ *=\ *(.*)$ ]]; then
-			opts=${BASH_REMATCH[1]}
+			opts="$(vmm_default_opts) ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 0dd3f971ecdf..368690d62473 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -1,3 +1,14 @@
+# The following parameters are enabled by default when running a test with
+# kvmtool:
+# --nodefaults: suppress VM configuration that cannot be disabled (like
+#               modifying the supplied kernel command line). Otherwise tests
+#               that use the command line will fail without this parameter.
+# --network mode=none: do not create a network device. kvmtool tries to help the
+#               user by automatically create one, and then prints a warning
+#               when the VM terminates if the device hasn't been initialized.
+# --loglevel=warning: reduce verbosity
+: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
+
 ##############################################################################
 # qemu_fixup_return_code translates the ambiguous exit status in Table1 to that
 # in Table2.  Table3 simply documents the complete status table.
@@ -82,11 +93,13 @@ function kvmtool_fixup_return_code()
 
 declare -A vmm_optname=(
 	[qemu,args]='-append'
+	[qemu,default_opts]=''
 	[qemu,fixup_return_code]=qemu_fixup_return_code
 	[qemu,initrd]='-initrd'
 	[qemu,nr_cpus]='-smp'
 
 	[kvmtool,args]='--params'
+	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool,fixup_return_code]=kvmtool_fixup_return_code
 	[kvmtool,initrd]='--initrd'
 	[kvmtool,nr_cpus]='--cpus'
@@ -97,6 +110,11 @@ function vmm_optname_args()
 	echo ${vmm_optname[$(vmm_get_target),args]}
 }
 
+function vmm_default_opts()
+{
+	echo ${vmm_optname[$(vmm_get_target),default_opts]}
+}
+
 function vmm_fixup_return_code()
 {
 	${vmm_optname[$(vmm_get_target),fixup_return_code]} "$@"
-- 
2.50.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
