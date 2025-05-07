Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62BF8C3ABCA
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t3H8C0HZQe/5YJNLfs+RR1a3D8gZybnhrjYDxce5hH8=; b=KZm7tqF4DI/cQ6
	H6aHY15lgnphCMIJK/pdBV+13zs3KfD35Dv1rfg//WuD9/cBYJq0QPHfTYKWd3AmQzv5Jt2ePbHWB
	60Z5BlNf/B+i/RlRwKjUvoxfWfKSiyTfMvNi0tTtWplrHGz4pUB+YFcg1+7xpEH2Q3p8NjPOko8Xx
	AB0rr0C7JFvRFHszvLC7lxTfW2o8mPQqQFYpsxfyEX1t/EiCfZhcd7XjlWh1Gbm0jIzr/W8uyghbd
	WunDfxYQQ/AsiVfkhQd1Iti4FC+MHJmVJANW6o48KgsZFeuLlVP3G+1WQ0FKm6e07tDY5GWMDcEiv
	uAPmec9EgP8hqjNmvNsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0w-0000000G2G0-0cbt;
	Wed, 07 May 2025 15:48:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgSe-0000000FusL-0gzn
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:13:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E6692050;
	Wed,  7 May 2025 08:13:17 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B3303F58B;
	Wed,  7 May 2025 08:13:24 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 04/16] run_tests.sh: Document --probe-maxsmp argument
Date: Wed,  7 May 2025 16:12:44 +0100
Message-ID: <20250507151256.167769-5-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081328_255212_D0D95575 
X-CRM114-Status: UNSURE (   8.16  )
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

Commit 5dd20ec76ea63 ("runtime: Update MAX_SMP probe") added the
--probe-maxmp argument, but the help message for run_tests.sh wasn't
updated. Document --probe-maxsmp.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 run_tests.sh | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/run_tests.sh b/run_tests.sh
index 152323ffc8a2..f30b6dbd131c 100755
--- a/run_tests.sh
+++ b/run_tests.sh
@@ -17,14 +17,15 @@ cat <<EOF
 
 Usage: $0 [-h] [-v] [-a] [-g group] [-j NUM-TASKS] [-t] [-l]
 
-    -h, --help      Output this help text
-    -v, --verbose   Enables verbose mode
-    -a, --all       Run all tests, including those flagged as 'nodefault'
-                    and those guarded by errata.
-    -g, --group     Only execute tests in the given group
-    -j, --parallel  Execute tests in parallel
-    -t, --tap13     Output test results in TAP format
-    -l, --list      Only output all tests list
+    -h, --help          Output this help text
+    -v, --verbose       Enables verbose mode
+    -a, --all           Run all tests, including those flagged as 'nodefault'
+                        and those guarded by errata.
+    -g, --group         Only execute tests in the given group
+    -j, --parallel      Execute tests in parallel
+    -t, --tap13         Output test results in TAP format
+    -l, --list          Only output all tests list
+        --probe-maxsmp  Update the maximum number of VCPUs supported by host
 
 Set the environment variable QEMU=/path/to/qemu-system-ARCH to
 specify the appropriate qemu binary for ARCH-run.
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
