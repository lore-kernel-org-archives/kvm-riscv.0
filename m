Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234BCC3ABCA
	for <kvm-riscv@archiver.kernel.org>; Wed,  7 May 2025 15:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJC4AnFmc6Yhxg2OCdOlw1imk10sQTVItc2Jd19AdMM=; b=I6B9KiNFzObQDU
	Swpr3UDt1opNuXQFarwfVmMoCgTy7biMOC59OuQ/oNrq+7UUoCw150Jeenw9QXzpGz3cxGejFeTP/
	yOauMQnGoyvjyvBU3F0WPhGvzBrzIsvkY2l6/E3k4NMS6DCLO+x5QTNrCYnnVxUBa27qwx2j2feIX
	KwCTjp6qqX0rshi9RaH61helk1Yv2pwKgH22sbS6JMy3S2mbDRIXJT9TwtMnYtdzAmzCeAx8uz9eE
	qxvgSsnLkAV/o5Zy+s0Z1dhuWB/KRXhVvWCI2bI148MyefN7kKVYI1t6P0/XnOF9VI0sLdjIO4Zv5
	Gz86Wz+zbknDY/3lb8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCh0z-0000000G2Jo-3K3a;
	Wed, 07 May 2025 15:48:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCgTD-0000000Fv6w-2VG9
	for kvm-riscv@lists.infradead.org;
	Wed, 07 May 2025 15:14:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E3A9C22EA;
	Wed,  7 May 2025 08:13:52 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D8D3E3F58B;
	Wed,  7 May 2025 08:13:59 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH v3 14/16] scripts/mkstandalone: Export $TARGET
Date: Wed,  7 May 2025 16:12:54 +0100
Message-ID: <20250507151256.167769-15-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507151256.167769-1-alexandru.elisei@arm.com>
References: <20250507151256.167769-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_081403_682923_E2BA73E3 
X-CRM114-Status: UNSURE (   6.46  )
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

$TARGET is needed for the test runner to decide if it should use qemu or
kvmtool, so export it.

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 scripts/mkstandalone.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/mkstandalone.sh b/scripts/mkstandalone.sh
index 4f666cefe076..3b2caf198b00 100755
--- a/scripts/mkstandalone.sh
+++ b/scripts/mkstandalone.sh
@@ -47,6 +47,7 @@ generate_test ()
 	config_export ARCH_NAME
 	config_export TARGET_CPU
 	config_export DEFAULT_QEMU_CPU
+	config_export TARGET
 
 	echo "echo BUILD_HEAD=$(cat build-head)"
 
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
