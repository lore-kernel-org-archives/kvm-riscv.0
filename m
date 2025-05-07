Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A60CC3ABCE
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwP/hOCdjmrhQbVKmKzBuyi98eGz7nqnqhI5cjFr8Q0=; b=qRRvBZ5bUuE70v
	zvj4ZprCWas7KFXdNo5oEBxR+DDFeSQ72o8fZwsp4Hw6qikOWRIjUIgmdzkw+qzymCxDG2S1h3Iws
	SRh8mm3XEutnP+dBKd2QKofFou86HhRqhF2PW5If7EtjUBev7oTeCto3W915/YqbC+FysCSAeL9xD
	GuoA+IK7AljqjuUt5Pu9C+LNl+x2gjED4mDEtCDcQPpnUUR8UpCHgs22XIT/glgE5fb2I+6GzBuHX
	PRHwpmd2+SqfpP00RsudMLMyNT6Yby5kDCr874NvWUCP+nOfiSlKyBxSYFdaYuhDsCg/5K4FjFClZ
	C6bJqs3tZCwtG4N6G7Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0x-0000000G2Hr-3tVK;
	Wed, 07 May 2025 15:48:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSs-0000000FuyB-2Bvi
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E826422BE;
	Wed,  7 May 2025 08:13:31 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C912D3F58B;
	Wed,  7 May 2025 08:13:38 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 08/16] scripts: Add 'kvmtool_params' to test definition
Date: Wed,  7 May 2025 16:12:48 +0100
Message-ID: <20250507151256.167769-9-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081342_672940_10CD08C1 
X-CRM114-Status: GOOD (  10.55  )
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

arm/arm64 supports running tests under kvmtool, but kvmtool's syntax for
running and configuring a virtual machine is different to qemu. To run
tests using the automated test infrastructure, add a new test parameter,
'kvmtool_params'. The parameter serves the exact purpose as 'qemu_params',
but using kvmtool's syntax.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arm/unittests.cfg   | 24 +++++++++++++++++++++++
 docs/unittests.txt  |  8 ++++++++
 scripts/common.bash | 47 +++++++++++++++++++++++++++++----------------
 3 files changed, 62 insertions(+), 17 deletions(-)

diff --git a/arm/unittests.cfg b/arm/unittests.cfg
index a4192ed7e20b..f3c773e56933 100644
--- a/arm/unittests.cfg
+++ b/arm/unittests.cfg
@@ -17,6 +17,7 @@ file = selftest.flat
 smp = 2
 test_args = 'setup smp=2 mem=256'
 qemu_params = -m 256
+kvmtool_params = --mem 256
 groups = selftest
 
 # Test vector setup and exception handling (kernel mode).
@@ -48,66 +49,77 @@ groups = pci
 file = pmu.flat
 groups = pmu
 test_args = "cycle-counter 0"
+kvmtool_params = --pmu
 
 [pmu-event-introspection]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-event-introspection
+kvmtool_params = --pmu
 
 [pmu-event-counter-config]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-event-counter-config
+kvmtool_params = --pmu
 
 [pmu-basic-event-count]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-basic-event-count
+kvmtool_params = --pmu
 
 [pmu-mem-access]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-mem-access
+kvmtool_params = --pmu
 
 [pmu-mem-access-reliability]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-mem-access-reliability
+kvmtool_params = --pmu
 
 [pmu-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-sw-incr
+kvmtool_params = --pmu
 
 [pmu-chained-counters]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chained-counters
+kvmtool_params = --pmu
 
 [pmu-chained-sw-incr]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chained-sw-incr
+kvmtool_params = --pmu
 
 [pmu-chain-promotion]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-chain-promotion
+kvmtool_params = --pmu
 
 [pmu-overflow-interrupt]
 file = pmu.flat
 groups = pmu
 arch = arm64
 test_args = pmu-overflow-interrupt
+kvmtool_params = --pmu
 
 # Test PMU support (TCG) with -icount IPC=1
 #[pmu-tcg-icount-1]
@@ -131,6 +143,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = ipi
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio]
@@ -138,6 +151,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio-up]
@@ -145,6 +159,7 @@ file = gic.flat
 smp = 1
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv2-mmio-3p]
@@ -152,6 +167,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 3)?$MAX_SMP:3))
 test_args = mmio
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv3-ipi]
@@ -159,6 +175,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = ipi
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = gic
 
 [gicv2-active]
@@ -166,6 +183,7 @@ file = gic.flat
 smp = $((($MAX_SMP < 8)?$MAX_SMP:8))
 test_args = active
 qemu_params = -machine gic-version=2
+kvmtool_params = --irqchip=gicv2
 groups = gic
 
 [gicv3-active]
@@ -173,6 +191,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = active
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = gic
 
 [its-introspection]
@@ -180,6 +199,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-introspection
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3-its
 groups = its
 arch = arm64
 
@@ -188,6 +208,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-trigger
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3-its
 groups = its
 arch = arm64
 
@@ -196,6 +217,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-migration
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
@@ -204,6 +226,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-pending-migration
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
@@ -212,6 +235,7 @@ file = gic.flat
 smp = $MAX_SMP
 test_args = its-migrate-unmapped-collection
 qemu_params = -machine gic-version=3
+kvmtool_params = --irqchip=gicv3
 groups = its migration
 arch = arm64
 
diff --git a/docs/unittests.txt b/docs/unittests.txt
index ea0da959f008..a9164bccc24c 100644
--- a/docs/unittests.txt
+++ b/docs/unittests.txt
@@ -78,6 +78,14 @@ extra_params
 Alias for 'qemu_params', supported for compatibility purposes. Use
 'qemu_params' for new tests.
 
+kvmtool_params
+--------------
+Extra parameters supplied to the kvmtool process. Works similarly to
+'qemu_params', but uses kvmtool's syntax for command line arguments. The
+example for 'qemu_params', applied to kvmtool, would be:
+
+kvmtool_params = --mem 256
+
 groups
 ------
 groups = <group_name1> <group_name2> ...
diff --git a/scripts/common.bash b/scripts/common.bash
index 649f1c737617..0645235d8baa 100644
--- a/scripts/common.bash
+++ b/scripts/common.bash
@@ -1,6 +1,29 @@
 source config.mak
 source scripts/vmm.bash
 
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
@@ -46,24 +69,14 @@ function for_each_unittest()
 			smp="${vmm_opts[$TARGET:nr_cpus]} ${BASH_REMATCH[1]}"
 		elif [[ $line =~ ^test_args\ *=\ *(.*)$ ]]; then
 			test_args="${vmm_opts[$TARGET:args]} ${BASH_REMATCH[1]}"
-		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
-			opts=${BASH_REMATCH[2]}$'\n'
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
-		elif [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
+		elif [[ $TARGET = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *'"""'(.*)$ ]]; then
+			opts=$(parse_opts ${BASH_REMATCH[2]}$'\n' $fd)
+		elif [[ $TARGET  = "qemu" ]] && [[ $line =~ ^(extra_params|qemu_params)\ *=\ *(.*)$ ]]; then
 			opts=${BASH_REMATCH[2]}
+		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *'"""'(.*)$ ]]; then
+			opts=$(parse_opts ${BASH_REMATCH[1]}$'\n' $fd)
+		elif [[ $TARGET = "kvmtool" ]] && [[ $line =~ ^kvmtool_params\ *=\ *(.*)$ ]]; then
+			opts=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^groups\ *=\ *(.*)$ ]]; then
 			groups=${BASH_REMATCH[1]}
 		elif [[ $line =~ ^arch\ *=\ *(.*)$ ]]; then
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
