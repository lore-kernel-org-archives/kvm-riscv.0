Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB466C021BB
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 16:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xDdxYHbVZSwb/s/PscHr8jUM7DKofFh3yDpB1rSTjg=; b=U25pJSKNm9/XFS
	U6VyVAd1kXOYYYOWVvSZFu4bYd6QQGjs+80FOB5ZQuyyw7bXBzTExf/7ulgvxIHuOyBslJouX+C2A
	219YXaEdIoT/yjlANvtg4otJ2iG5x0qm3jpvS17tKB38A5eu5mP7uQ3f/tZSe4mAlU5umw1WnLTy1
	RgsGaU5TV0dRZtvtGztHeGnm0l4YopKpAeNfDOufpMVLqBK/ogM6iVwlg217XWaUAUQTX+4btzzAr
	11gkORFjivNPwuuag0UJSP1BB7YZrA+VqumcCYnN7apyyzUqdmux1j0CoYaPnvxHFuKo0oDfQEXeU
	c5xpAmhDloDYkyuy+kDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVwR-00000006ByG-2xwU;
	Fri, 21 Feb 2025 16:31:55 +0000
Received: from out-173.mta0.migadu.com ([2001:41d0:1004:224b::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVsr-00000006BIp-2SyR
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 16:28:14 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740155291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vn1FEnDRGik68LJLDBAQGF/TsL5Y6BbtDhdl0uXVpLU=;
	b=CplyT0LAD8EI6ezTBgStuYQDrzqWjOBeNroi1+vA48eOwXqFbPa/tnzVBIBeHrPzsBGCT0
	KKbcep5jgAwaFvxnAVbs0oKCz54DhV1qjdIaTV2s8lWB1Nfevni/khdah+WRlKE3vmcNXU
	XcYA6E4LULrNAEwoT8IArkpDM+5+voI=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	atishp@rivosinc.com,
	cleger@rivosinc.com,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [kvm-unit-tests PATCH 2/2] riscv: Introduce MACHINE_OVERRIDE
Date: Fri, 21 Feb 2025 17:27:56 +0100
Message-ID: <20250221162753.126290-6-andrew.jones@linux.dev>
In-Reply-To: <20250221162753.126290-4-andrew.jones@linux.dev>
References: <20250221162753.126290-4-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_082813_763606_D96B0816 
X-CRM114-Status: UNSURE (   6.80  )
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

From: Andrew Jones <ajones@ventanamicro.com>

Allow riscv tests to use QEMU machine types other than virt.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 riscv/run | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/riscv/run b/riscv/run
index 73f2bf54dc32..e2f5a922728c 100755
--- a/riscv/run
+++ b/riscv/run
@@ -10,10 +10,12 @@ if [ -z "$KUT_STANDALONE" ]; then
 fi
 
 # Allow user overrides of some config.mak variables
+mach=$MACHINE_OVERRIDE
 processor=$PROCESSOR_OVERRIDE
 firmware=$FIRMWARE_OVERRIDE
 
 [ "$PROCESSOR" = "$ARCH" ] && PROCESSOR="max"
+: "${mach:=virt}"
 : "${processor:=$PROCESSOR}"
 : "${firmware:=$FIRMWARE}"
 [ "$firmware" ] && firmware="-bios $firmware"
@@ -23,11 +25,11 @@ set_qemu_accelerator || exit $?
 acc="-accel $ACCEL$ACCEL_PROPS"
 
 qemu=$(search_qemu_binary) || exit $?
-if ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
+if [ "$mach" = 'virt' ] && ! $qemu -machine '?' | grep -q 'RISC-V VirtIO board'; then
 	echo "$qemu doesn't support mach-virt ('-machine virt'). Exiting."
 	exit 2
 fi
-mach='-machine virt'
+mach="-machine $mach"
 
 command="$qemu -nodefaults -nographic -serial mon:stdio"
 command+=" $mach $acc $firmware -cpu $processor "
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
