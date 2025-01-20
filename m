Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2720EC02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=waGvl0oMrJgXApVowTI5F46HYdqfRXevzbbKBlvlYDw=; b=uRsST5qFwd5GNh
	bj4Nrr200g2FEGoVPknowutkzYlwU8012uPklQxKQjI7KtDUp1E6c/O0f+GpY1ptaTN64iWcvGcsv
	paZNgt7ZVjYLvpnoPxnrSgibIdO8gpxHD2Hx1YZzpIkzp+GkLKvvD24h4B7iI3IQ0D2XeK9vaGczO
	+IpQUfvVSSvRvaujlbuzmRcKuz+3sYzVG08TDPQ/sIYbVFxIQq0sOSDQPJYAfj2P34OQE2GN8Krm3
	/PawFvfzFUYV6317ULQLjsDuozD5+MCeZIJBq2xX+Luv1e/36HFGwfQ0tpRbJd3LPsHf4W0CzoJpW
	REJWWvm5ACXYPbE36hPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusI-000000061hq-3jjX;
	Mon, 20 Jan 2025 16:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusH-000000061gy-11JV
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:43:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BDF701688;
	Mon, 20 Jan 2025 08:44:07 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EEF843F5A1;
	Mon, 20 Jan 2025 08:43:35 -0800 (PST)
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
	Andrew Jones <drjones@redhat.com>
Subject: [kvm-unit-tests PATCH v2 02/18] Document environment variables
Date: Mon, 20 Jan 2025 16:43:00 +0000
Message-ID: <20250120164316.31473-3-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084341_327150_1EEC55AB 
X-CRM114-Status: UNSURE (   9.48  )
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

Document the environment variables that influence how a test is executed
by the run_tests.sh test runner.

Suggested-by: Andrew Jones <drjones@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 docs/unittests.txt |  5 ++++-
 run_tests.sh       | 12 +++++++++---
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/docs/unittests.txt b/docs/unittests.txt
index c4269f6230c8..dbc2c11e3b59 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -88,7 +88,8 @@ timeout
 -------
 timeout = <duration>
 
-Optional timeout in seconds, after which the test will be killed and fail.
+Optional timeout in seconds, after which the test will be killed and fail. Can
+be overwritten with the TIMEOUT=<duration> environment variable.
 
 check
 -----
@@ -99,3 +100,5 @@ can contain multiple files to check separated by a space, but each check
 parameter needs to be of the form <path>=<value>
 
 The path and value cannot contain space, =, or shell wildcard characters.
+
+Can be overwritten with the CHECK environment variable with the same syntax.
diff --git a/run_tests.sh b/run_tests.sh
index f30b6dbd131c..23d81b2caaa1 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -27,9 +27,15 @@ Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
     -l, --list          Only output all tests list
         --probe-maxsmp  Update the maximum number of VCPUs supported by host
 
-Set the environment variable QEMU=/path/to/qemu-system-ARCH to
-specify the appropriate qemu binary for ARCH-run.
-
+The following environment variables are used:
+
+    QEMU            Path to QEMU binary for ARCH-run
+    ACCEL           QEMU accelerator to use, e.g. 'kvm', 'hvf' or 'tcg'
+    ACCEL_PROPS     Extra argument to ACCEL
+    MACHINE         QEMU machine type
+    TIMEOUT         Timeout duration for the timeout(1) command
+    CHECK           Overwrites the 'check' unit test parameter (see
+                    docs/unittests.txt)
 EOF
 }
 
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
