Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB30C02181
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Jan 2025 16:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=npdi5/yRvQiYMmLd7X+ta2F5f3bHYlLlGyOK3DABWBs=; b=Sn6Q9gCqHz6/JF
	qDcfOc3mjMk+zy69Mf9HjAZS9VlfSB5kmTmVqfNeV9hBmDPEB7bfGkOeJgzm2vPX46g5qsGmdz1KZ
	n8WP+PHWLh7qtm4NuOsqhQtWtPJpauc1Fn05qR/xhOMqNDsoV0TpollnRnofN+bDK8X76eJOdVaJf
	qp3z+nTT+9l5ir1J9ONUUVUMI7gJ8vltdeicXaDwMe++o99b5dAvfqwONHVkYdB0i+o1W+WG70nAB
	rg4zMJmfICABqF/9W1Kf+RD3yk22N8T5giwlVmslc7bmfKOTf88W3AFQ1cIteLvEZ9nMEAh6SiHCL
	2GWu6jl++nXG3xi/xpsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusc-000000061tz-3xPu;
	Mon, 20 Jan 2025 16:44:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZusa-000000061t7-33yJ
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Jan 2025 16:44:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AA7381CE0;
	Mon, 20 Jan 2025 08:44:28 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 14D993F5A1;
	Mon, 20 Jan 2025 08:43:56 -0800 (PST)
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
Subject: [kvm-unit-tests PATCH v2 08/18] scripts/runtime: Detect kvmtool failure in premature_failure()
Date: Mon, 20 Jan 2025 16:43:06 +0000
Message-ID: <20250120164316.31473-9-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250120164316.31473-1-alexandru.elisei@arm.com>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_084400_810052_5029D836 
X-CRM114-Status: GOOD (  10.58  )
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
 scripts/runtime.bash | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/runtime.bash b/scripts/runtime.bash
index 451b5585f010..ee8a188b22ce 100644
--- a/scripts/runtime.bash
+++ b/scripts/runtime.bash
@@ -12,18 +12,27 @@ extract_summary()
     tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
 }
 
-# We assume that QEMU is going to work if it tried to load the kernel
+# We assume that the VMM is going to work if it tried to load the kernel
 premature_failure()
 {
     local log
 
     log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
 
-    echo "$log" | grep "_NO_FILE_4Uhere_" |
-        grep -q -e "[Cc]ould not \(load\|open\) kernel" \
-                -e "error loading" \
-                -e "failed to load" &&
-        return 1
+    case "$TARGET" in
+    qemu)
+
+        echo "$log" | grep "_NO_FILE_4Uhere_" |
+            grep -q -e "[Cc]ould not \(load\|open\) kernel" \
+                    -e "error loading" \
+                    -e "failed to load" &&
+            return 1
+        ;;
+    kvmtool)
+        echo "$log" | grep "Fatal: Unable to open kernel _NO_FILE_4Uhere_" &&
+            return 1
+        ;;
+    esac
 
     RUNTIME_log_stderr <<< "$log"
 
-- 
2.47.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
