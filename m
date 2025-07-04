Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 603B6C83F03
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 15:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5v/S5sy+erjel1gyetKU+VvBaccE+/meHSmOce2LYLI=; b=ceajvfv2WbvBD1
	DOPrM3FdorrEUOQCvYeZcZw1oSH/ZHKKJhk4Am6xmxM83EmvUdOjzBckxQJolKZJolvZ3KhYpqC/j
	JhBO/vaFa1m+nnGmP+HlBUfEYC3vhrdufv6AuKCZozvWJpEU822qY0N20bEbNcS0zcc+QocA8al2c
	yQtfzF3KqZ9lPvPHAVCy23jeMi0tdPiiaeGOeobRL7PKgSTG+GSPk0B63FcYAdjGPl8nNOjnhQo0w
	hVV3mU/pJqsuJmQtOTwb/RVZ+gIN2JbouiA/To15aJCFCNaKFYnkTu6qkcTpuYIcRwrJ8xDQLaahG
	aahThGtntIxropQ9PYDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXiEm-0000000Eo66-0XkO;
	Fri, 04 Jul 2025 15:22:04 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXi63-0000000EmmX-3QN6
	for kvm-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 15:13:06 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751641980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u5RM3fpQJZXdHe1/0rYAD9Peic3dkiF/gyGbQFCCa/4=;
	b=R+WNHkJSXCrelO4rIytF8Z1YLvjTGlqMZXSIDvORoUjQXB0dzUARrf/YmM2qvOQ/hXBwIS
	bBIrKFP47oJZaRs/7IEhs8PuNwRTol1vy/LK93zJzFsLPNiPVNa9HcYO6o9s80p1usZQkr
	87KwiLiOSSNn+NsvWk6vckJ8NTsFuEk=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org
Cc: alexandru.elisei@arm.com,
	cleger@rivosinc.com,
	jesse@rivosinc.com,
	jamestiotio@gmail.com,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH 1/2] arm/arm64: Ensure proper host arch with kvmtool
Date: Fri,  4 Jul 2025 17:12:56 +0200
Message-ID: <20250704151254.100351-5-andrew.jones@linux.dev>
In-Reply-To: <20250704151254.100351-4-andrew.jones@linux.dev>
References: <20250704151254.100351-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_081304_001999_C6AB539F 
X-CRM114-Status: UNSURE (   7.14  )
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

When running on non-arm (e.g. an x86 machine) if the framework is
configured to use kvmtool then, unlike with QEMU, it can't work.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 arm/run | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arm/run b/arm/run
index 9ee795ae424c..858333fce465 100755
--- a/arm/run
+++ b/arm/run
@@ -97,6 +97,11 @@ function arch_run_kvmtool()
 {
 	local command
 
+	if [ "$HOST" != "arm" ] && [ "$HOST" != "aarch64" ]; then
+		echo "kvmtool requires KVM but the host ('$HOST') is not arm" >&2
+		exit 2
+	fi
+
 	kvmtool=$(search_kvmtool_binary) ||
 		exit $?
 
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
