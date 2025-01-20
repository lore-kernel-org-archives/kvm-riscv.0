Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9783CC02182
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=msMWgJ7FCDt7FGr+UJh+gGnCXP1lt9egIfzSM3TkIsE=; b=4dPVfvyhIaiL+z
	zF6wJvcufOUh34ULAId43QlNlu2f0rV27Wtc91dGj4XQcvn8aZ4XDLSTe3XNacSVRBUa153uu5+mI
	MRc02+Lccn5SKj1BCNKswucvZTsgyvbedVqYlEFL5QB2RKDN4IUdyS8ueA/RQ+Lj2ivsLFu+5k/sz
	4J2m5DFg3mtvQgjr6Q5rHJWls0D99b8+RuMNlsCTO9T9FzHqyVt0lGy0DspAp/ic94LPomdEtU7od
	l4p6qLHF8MoOOGI//dZvc1YPITJN6MopAfud+lIxh19BpDgMjtu1xIoUuV7yhjJrgEeqqrH0uDTsg
	8Vur0x8/AdCIYpDCxrjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZust-0000000624A-1Qiv;
	Mon, 20 Jan 2025 16:44:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusq-0000000621U-0Di9
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:44:18 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8FDAE1063;
	Mon, 20 Jan 2025 08:44:42 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E59EC3F5A1;
	Mon, 20 Jan 2025 08:44:10 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 12/18] scripts/runtime: Add default arguments for kvmtool
Date: Mon, 20 Jan 2025 16:43:10 +0000
Message-ID: <20250120164316.31473-13-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084416_181411_0A5B188B 
X-CRM114-Status: GOOD (  14.15  )
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
successfully boots in a virtual machine. Among things like automatically
creating a rootfs, it also adds extra parameters to the kernel command
line. This is actively harmful to kvm-unit-tests, because some tests parse
the kernel command line and they will fail if they encounter the options
added by kvmtool.

Fortunately for us, kvmtool commit 5613ae26b998 ("Add --nodefaults command
line argument") addded the --nodefaults kvmtool parameter which disables
all the implicit virtual machine configuration that cannot be disabled by
using other parameters, like modifying the kernel command line. Always use
--nodefaults to allow a test to run.

kvmtool can be too verbose when running a virtual machine, and this is
controlled with parameters. Add those to the default kvmtool command line
to reduce this verbosity to a minimum.

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

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 55d58eef9c7c..abfd1e67b2ef 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -2,6 +2,17 @@
 : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
 : "${TIMEOUT:=90s}"
 
+# The following parameters are enabled by default when running a test with
+# kvmtool:
+# --nodefaults: suppress VM configuration that cannot be disabled otherwise
+#               (like modifying the supplied kernel command line). Tests that
+#               use the command line will fail without this parameter.
+# --network mode=none: do not create a network device. kvmtool tries to help the
+#                user by automatically create one, and then prints a warning
+#                when the VM terminates if the device hasn't been initialized.
+# --loglevel=warning: reduce verbosity
+: "${KVMTOOL_DEFAULT_OPTS:="--nodefaults --network mode=none --loglevel=warning"}"
+
 PASS() { echo -ne "\e[32mPASS\e[0m"; }
 SKIP() { echo -ne "\e[33mSKIP\e[0m"; }
 FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
@@ -103,7 +114,7 @@ function run()
         opts="-smp $smp $qemu_opts"
         ;;
     kvmtool)
-        opts="--cpus $smp $kvmtool_opts"
+        opts="$KVMTOOL_DEFAULT_OPTS --cpus $smp $kvmtool_opts"
         ;;
     esac
 
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
