Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89C9AC77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsxpWAY6M1IabcYYDvOJsHNzHpGEsxy+NwMxxqYPSzc=; b=xf+cIuyyJJ+EhC
	03rd6ll6Y+WulHUOniDjS74pWmTtyqfJyxpgmzgGvUVA1ElQBQAq0LzIde9kdoQcoquguRU7QP8Je
	ApUe28KJHmrxUyus6YQ6ZroOz/ML+l0LTcnn6ZO4QK8rr5/HHgI11z7GRJ3g9iIW7WHXhMjIs6Q8H
	d7KR6j99M6H7/B9i4YDGv0P3pc/cCTbrdA8ntvQn4SI8wbi9xKLW86jnFaOmHn9F+Gumh2uS/iqt+
	zvve3isLQRBGa0rl/aSV8/i+cXnB0X45KCHjdK3EzWLFy9/QXruHeoDLGuPRv5FVVx7fGjyn30SVo
	w+0+ZkqmuL9OJ/KDrRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUsS-00000009aZA-3JUt;
	Wed, 25 Jun 2025 18:29:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUSN3-00000009Aw9-47X2
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 15:49:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4245A22E6;
	Wed, 25 Jun 2025 08:48:51 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 118DB3F58B;
	Wed, 25 Jun 2025 08:49:04 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v4 09/13] scripts: Detect kvmtool failure in premature_failure()
Date: Wed, 25 Jun 2025 16:48:09 +0100
Message-ID: <20250625154813.27254-10-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250625154813.27254-1-alexandru.elisei@arm.com>
References: <20250625154813.27254-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_084910_096656_195CB556 
X-CRM114-Status: GOOD (  11.09  )
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

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---

Changes v3->v4:

* Use vmm_parse_premature_failure() in
scripts/runtime.bash::premature_failure().
* Do not source scripts/vmm.bash in scripts/runtime.bash to avoid errors in
the standalone tests.

 scripts/mkstandalone.sh |  1 +
 scripts/runtime.bash    |  6 +-----
 scripts/vmm.bash        | 28 ++++++++++++++++++++++++++++
 3 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 9c5768563757..ebf425564af5 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -81,6 +81,7 @@ generate_test ()
 	echo "RUNTIME_log_stdout () { cat >&\$stdout; }"
 	echo "RUNTIME_log_stderr () { cat >&2; }"
 
+	cat scripts/vmm.bash
 	cat scripts/runtime.bash
 
 	echo "run ${args[*]}"
diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 86d8a2cd8528..5839ca5ca665 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -19,11 +19,7 @@ premature_failure()
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    vmm_parse_premature_failure "$log" || return 1
 
     RUNTIME_log_stderr <<< "$log"
 
diff --git a/scripts/vmm.bash b/scripts/vmm.bash
index 368690d62473..44954a711cad 100644
--- a/scripts/vmm.bash
+++ b/scripts/vmm.bash
@@ -79,6 +79,18 @@ function qemu_fixup_return_code()
 	echo $ret
 }
 
+function qemu_parse_premature_failure()
+{
+	local log=$*
+
+	echo "$log" | grep "_NO_FILE_4Uhere_" |
+		grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+			-e "error loading" \
+			-e "failed to load" &&
+		return 1
+	return 0
+}
+
 function kvmtool_fixup_return_code()
 {
 	local ret=$1
@@ -91,18 +103,29 @@ function kvmtool_fixup_return_code()
 	echo $ret
 }
 
+function kvmtool_parse_premature_failure()
+{
+	local log=$*
+
+	echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+		return 1
+	return 0
+}
+
 declare -A vmm_optname=(
 	[qemu,args]='-append'
 	[qemu,default_opts]=''
 	[qemu,fixup_return_code]=qemu_fixup_return_code
 	[qemu,initrd]='-initrd'
 	[qemu,nr_cpus]='-smp'
+	[qemu,parse_premature_failure]=qemu_parse_premature_failure
 
 	[kvmtool,args]='--params'
 	[kvmtool,default_opts]="$KVMTOOL_DEFAULT_OPTS"
 	[kvmtool,fixup_return_code]=kvmtool_fixup_return_code
 	[kvmtool,initrd]='--initrd'
 	[kvmtool,nr_cpus]='--cpus'
+	[kvmtool,parse_premature_failure]=kvmtool_parse_premature_failure
 )
 
 function vmm_optname_args()
@@ -130,6 +153,11 @@ function vmm_optname_nr_cpus()
 	echo ${vmm_optname[$(vmm_get_target),nr_cpus]}
 }
 
+function vmm_parse_premature_failure()
+{
+	${vmm_optname[$(vmm_get_target),parse_premature_failure]} "$@"
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
