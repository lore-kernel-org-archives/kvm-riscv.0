Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E7C3ABD2
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yULUNtyZcaRkEW3OwFzA8MqM0JtyM22w0Pd/ckOpg0A=; b=T5EpHmuBdZNyEb
	+vTFV/Ea05PcSO6Wh6f1+8XgSwDxMCjp4gQiRSbOZxPifUcETLYqvpGl0IFKgKR7yzf3CstfMNXgN
	vG9oSNS8dNQ411zRosVSK2Xzu5ewRNc68t8pLZkPGpeX23Uo4KTlV3YoAqC3+PXLDrFypDJkSLxqu
	vgucbBrnuid+nO+p5vFEc8pAxr1xoX3j3tDNzSFeBs3t3oBz/QHpDIk8buAUF4eAd18Tx38XPAcLp
	AGxMMkdgT1Dnd9YO1veuDJ6dLoWa4jjUbr8LeuTca2W3NOhPRPoYpym4aNmu9h/ffhAG5orlJgZLF
	3SNjgVEOS5bEUYfoXaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0y-0000000G2Ir-3Yo9;
	Wed, 07 May 2025 15:48:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgT6-0000000Fv37-1cdU
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E0CAA22D7;
	Wed,  7 May 2025 08:13:45 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0FFF3F58B;
	Wed,  7 May 2025 08:13:52 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 12/16] scripts: Detect kvmtool failure in premature_failure()
Date: Wed,  7 May 2025 16:12:52 +0100
Message-ID: <20250507151256.167769-13-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081356_484699_1C2F7DDB 
X-CRM114-Status: GOOD (  10.89  )
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

kvm-unit-tests assumes that if the VMM is able to get to where it tries to
load the kernel, then the VMM and the configuration parameters will also
work for running the test. All of this is done in premature_failure().

Teach premature_failure() about the kvmtool's error message when it fails
to load the dummy kernel.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/runtime.bash |  8 +++-----
 scripts/vmm.bash     | 23 +++++++++++++++++++++++
 2 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 86d8a2cd8528..01ec8eae2bba 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -1,3 +1,5 @@
+source scripts/vmm.bash
+
 : "${RUNTIME_arch_run?}"
 : "${MAX_SMP:=$(getconf _NPROCESSORS_ONLN)}"
 : "${TIMEOUT:=90s}"
@@ -19,11 +21,7 @@ premature_failure()
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    ${vmm_opts[$TARGET:parse_premature_failure]} "$log" || return 1
 
     RUNTIME_log_stderr <<< "$log"
 
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index d24a4c4b8713..a1d50ed51981 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -93,6 +93,27 @@ kvmtool_fixup_return_code()
 	echo $ret
 }
 
+function qemu_parse_premature_failure()
+{
+	local log="$@"
+
+	echo "$log" | grep "_NO_FILE_4Uhere_" |
+		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+			-e "error loading" \
+			-e "failed to load" &&
+		return 1
+	return 0
+}
+
+function kvmtool_parse_premature_failure()
+{
+	local log="$@"
+
+	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+		return 1
+	return 0
+}
+
 declare -A vmm_opts=(
 	[qemu:nr_cpus]='-smp'
 	[qemu:kernel]='-kernel'
@@ -100,6 +121,7 @@ declare -A vmm_opts=(
 	[qemu:initrd]='-initrd'
 	[qemu:default_opts]=''
 	[qemu:fixup_return_code]=qemu_fixup_return_code
+	[qemu:parse_premature_failure]=qemu_parse_premature_failure
 
 	[kvmtool:nr_cpus]='--cpus'
 	[kvmtool:kernel]='--kernel'
@@ -107,6 +129,7 @@ declare -A vmm_opts=(
 	[kvmtool:initrd]='--initrd'
 	[kvmtool:default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool:fixup_return_code]=kvmtool_fixup_return_code
+	[kvmtool:parse_premature_failure]=kvmtool_parse_premature_failure
 )
 
 function check_vmm_supported()
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
