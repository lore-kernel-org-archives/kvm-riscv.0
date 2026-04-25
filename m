Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F00DDFF8850
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 00:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BM83aGde6TLW1QcQGlf5nmou4GYCkX+908GCofMbR8k=; b=zPn3q8pGkzv2Em
	bKL3+VPLhszrg20lnaL/TJ1q4P5KWjW0L+0ZEroKVswXBl89LIyz+BNmQtzS1d/rw2uBMS275E2VR
	1zqmsa+pkOE3W3xpSsICc38dEwxdkiB8DHw8Bw22/Ljlpa30RfdBO20Zeqp16YaHmrXehpct7cKVk
	5J8OI7FQyQTnT+QSexLFcddXPKIv/hce2BPTjxt/hU7PsLGAQGXvfrSX5qRkDU44ofohx+Lu0T3x8
	/yEkXtM4H7KiwVqgnMI/KRsooY3i057hlPM/O2BzrzRNWcX+op8WxHAO0yREGkIoisltpmMbgIxCP
	eUKEmAeqJB6NCMpU2f5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRNG-0000000DwaK-30wS;
	Sat, 25 Apr 2026 00:59:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRNF-0000000Dwa2-0tMA;
	Sat, 25 Apr 2026 00:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0754160052;
	Sat, 25 Apr 2026 00:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4BAAC2BCB5;
	Sat, 25 Apr 2026 00:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777078795;
	bh=7uQ0gjeqEPD6nPlkRBOxKlYHRuy/F0gDZ8rMmS8aYzE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVR8FtShNzdaxPaI5u0kaR0SDRKtyeuyA0azvOPHDlNXRRDcCYZ1WMk4SzB4nuyN2
	 ScIpNayyJLSYkFEXP0qIBwGRCGQ9Yufhp7UBtIzYj7wg2PFsLM7N84fRIA9MaIp7sz
	 mxHKuswu/FhIDWcGI8fTfF2cACfGiCOd/e/nxbSMNWWhitRTRX5UVPoJzWDo3N+dZX
	 SJB2sjmMlGggVJE1HRZtx41I/j3Cno1cGW4aCwxLQkSJf1uaIOd7RcaDlbPLFtb2am
	 6V5TXLmroYqxvjDheBh7EN03+Zelu15yyfHmSUL00bBUecK/8lp07xUb4lxU/EhqnD
	 caINHRMDPIQAQ==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	inochiama@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	me@ziyao.cc,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@kernel.org
Subject: [PATCH V2 3/4] irqchip/riscv-imsic: Move nr_guest_files to per-HART local config
Date: Sat, 25 Apr 2026 00:59:15 +0000
Message-ID: <20260425005916.3321811-4-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425005916.3321811-1-guoren@kernel.org>
References: <20260425005916.3321811-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

With the recent KVM AIA per-HART HGEI conversion, the global
nr_guest_files is no longer appropriate. Different HARTs in
heterogeneous SoCs may have different numbers of guest interrupt
files.

Move `nr_guest_files` from `struct imsic_global_config` to
`struct imsic_local_config`, and compute it per-CPU in
imsic_setup_state() based on the actual MMIO guest file region size.

Update the related comment to reflect that KVM now uses the
per-HART value.

This eliminates the last global assumption about guest files and
completes the per-HART conversion series for RISC-V AIA/IMSIC.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 10 ++++++----
 include/linux/irqchip/riscv-imsic.h     |  6 +++---
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index e3ed874d89e7..f01525362cf7 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -878,7 +878,6 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
-	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -910,23 +909,26 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 			reloff -= ALIGN(resource_size(&mmios[j]),
 			BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ);
 		}
+
+		local = per_cpu_ptr(global->local, cpu);
+		local->nr_guest_files = BIT(global->guest_index_bits) - 1;
+
 		if (index >= nr_mmios) {
 			pr_warn("%pfwP: MMIO not found for parent irq%d\n", fwnode, i);
 			continue;
 		}
 
-		local = per_cpu_ptr(global->local, cpu);
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
 		/*
-		 * KVM uses global->nr_guest_files to determine the available guest
+		 * KVM uses local->nr_guest_files to determine the available guest
 		 * interrupt files on each CPU. Take the minimum number of guest
 		 * interrupt files across all CPUs to avoid KVM incorrectly allocating
 		 * an unexisted or unmapped guest interrupt file on some CPUs.
 		 */
 		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
-		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
+		local->nr_guest_files = min(local->nr_guest_files, nr_guest_files);
 
 		nr_handlers++;
 	}
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 4b348836de7a..13e8bd7ff4b4 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -40,6 +40,9 @@
 struct imsic_local_config {
 	phys_addr_t				msi_pa;
 	void __iomem				*msi_va;
+
+	/* Number of guest interrupt files per core */
+	u32					nr_guest_files;
 };
 
 struct imsic_global_config {
@@ -68,9 +71,6 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
-	/* Number of guest interrupt files per core */
-	u32					nr_guest_files;
-
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
