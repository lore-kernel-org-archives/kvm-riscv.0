Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BB82CC6B3A
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 06:53:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GFqHDJ8k3Z8leOFSP/Lessb1rzqgck91Nc3UX8kpBQw=; b=wiCZP5lBZhO0eQ
	W8M369XTw4TiRXuzRbWaVkn5Samg4h9X/ifpF/nVkN7GV5kfHMGX02JBlVAG7VTNlXbtZUFetHzjL
	uxFggI34uDv9PVzjQqJY/C/QBOZ8mG8dkMmgg56d+tCJm5Um0QeStVR25xNgsMiMGTRY8kfftcQat
	7mql32OnUCZYVVg/e+0hTbRI13hzD+IR11E2ZZtgOZKeeSOkbTlZfpvJmP2EzcqphFnC4zh7VpmRG
	DMgKPS8FWjsLe/nGnO/JxPck6O1sRGJmAhz1KF1Va17nc4xxjc13VzYhB1wQX8Ndbi0y1M9fA+YEt
	On2BjS01I7v7C81g1x4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKx-0000000GyL5-3zS9;
	Thu, 15 Oct 2026 06:53:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHFKo-0000000Gy6F-0JGO;
	Thu, 15 Oct 2026 06:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=TY6HJ8/c28H7R9J5rwf3hSkP7dN7A9RvEGI2bfGQ4r4=; b=NB8fJ1c/BDRFlkN453Affe/N/V
	nzibCRBjVvVMi937Ka1Cwr+69at638M68cpSentlv/IM0bLLsAXUZZXqWdxmXWXDo//0Kjjgcok+V
	J6eyFyfRgX+M25CLBCHglYKEisha/H9i+zL5KAK+341w1699hEKQrAHYKdsHUZmMTdHFscvzZH2Y6
	wDTp1Cytz+QzhF+unmuECVmHlDo+YZ0VP6jvHtLuHZLyMR0NWZhzwo998eIWPaaRhokycsGeq1K/9
	qnytVqmOW5jkWVgzj7BsB+JtcTwzDWro0T911R4jFGRR6P1OB8KaeTseQUzSWxvRY4mGDBbU9WCdA
	Ej2CcLwg==;
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHFKl-0000000HXxl-0T04;
	Thu, 15 Oct 2026 06:53:01 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4j4zKb1TSJz4yh0n;
	Thu, 15 Oct 2026 14:52:51 +0800 (CST)
Received: from szxlzmapp03.zte.com.cn ([10.5.231.207])
	by mse-fl1.zte.com.cn with SMTP id 69F6qi6w013950;
	Thu, 15 Oct 2026 14:52:44 +0800 (+08)
	(envelope-from gong.shuai@sanechips.com.cn)
Received: from ubuntu-35-gs (unknown [10.230.214.35])
	by smtp (Zmail) with SMTP;
	Thu, 15 Oct 2026 14:52:46 +0800
X-Zmail-TransId: 3e816ad0783e024-555a1
X-Zmail-LocalSMTP: 1
X-Zmail-RealSender: gong.shuai@sanechips.com.cn
From: Gong Shuai <gong.shuai@sanechips.com.cn>
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Tomasz Jeznach <tomasz.jeznach@linux.dev>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
        Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>,
        Andrew Jones <andrew.jones@oss.qualcomm.com>,
        Fangyu Yu <fangyu.yu@linux.alibaba.com>,
        Wu Fei <wu.fei9@sanechips.com.cn>,
        Zhao Qingye <zhao.qingye@sanechips.com.cn>,
        Gong Shuai <gong.shuai@sanechips.com.cn>,
        Gong Shuai <gsh517025@gmail.com>
Subject: [RFC PATCH 10/12] RISC-V: KVM: Accept auto-mode interrupt files for IMSIC IRQ bypass
Date: Thu, 15 Oct 2026 14:52:30 +0800
Message-ID: <20261015065232.604503-11-gong.shuai@sanechips.com.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
References: <20261015065232.604503-1-gong.shuai@sanechips.com.cn>
MIME-Version: 1.0
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-MAIL: mse-fl1.zte.com.cn 69F6qi6w013950
X-TLS: YES
X-ENVELOPE-SENDER: gong.shuai@sanechips.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Thu, 15 Oct 2026 14:52:51 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AD07843.000/4j4zKb1TSJz4yh0n
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_075259_537823_8416FA3A 
X-CRM114-Status: GOOD (  11.32  )
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

The IRQ bypass required the AIA to be in HWACCEL mode, while the KVM
default is AUTO, which publishes an IMSIC VS-file whenever one is
available and only falls back to the SW-file when the host has none
left. Rejecting AUTO leaves every assigned device on host MSI delivery,
which cannot work for a device attached to a nested domain because its
stage-1 page tables belong to the guest, so the device keeps the host
MSI address composed at vector activation and its MSIs fault in the
guest stage-1.

Co-developed-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
Signed-off-by: Gong Shuai <gong.shuai@sanechips.com.cn>
---
 arch/riscv/kvm/aia_imsic.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 37e27f28dc62..010f9a90f107 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -981,10 +981,13 @@ static int imsic_irqfd_forward(struct kvm_kernel_irqfd *irqfd,
 	 * MSI-X because pci_write_msi_msg() masks an MSI-X vector around the
 	 * update, which conventional MSI cannot provide.
 	 */
-	if (kvm->arch.aia.mode != KVM_DEV_RISCV_AIA_MODE_HWACCEL ||
-	    !imsic_irqfd_is_msix(irqfd))
+	if (!imsic_irqfd_is_msix(irqfd))
 		return -EOPNOTSUPP;
 
+	/*
+	 * The IOMMU writes MSIs straight into the VS-file, so bypass is
+	 * gated by the hardware backing checks below, not the AIA mode.
+	 */
 	if (!imsic_targets_valid(&kvm->arch.aia)) {
 		pr_debug("KVM: IMSIC IRQ bypass requires all VS-files\n");
 		return -EOPNOTSUPP;
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
