Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB73AD711D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Dec 2025 09:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wD0Er49UodnDHL9gXw2ZToo8NJbQz4cAeoNFs1/w2ao=; b=QXDvI9Zu5RClxB
	yI57QMKcv0gJHLFb6E2k2B1TGabpNtugOXXyelFZY4kAzfruBQfISUVgD9EpyoF2mwVx3INHF184T
	NP0L+fn5KBNHBk9F8werbR91QrM3RQWWau2T/P+QWwstlbf0OqdfhD5tY1RLzcLTul2WknyIBVPDz
	nRsHA1hH8GeyikibWYpKhBH1XOKqGKLEVVPQ+CBWQxj9yJcz/i/prQ4Yev6UvCeyuIDMvp6MBbWle
	sOX8dlDYeAd5dCkKuENVke5Fl3uGGkjme0vEFCmv33AOUgROeS6DW+jcH9IkVjgek+q53FtXW/R4B
	sGacntKiS2+aLs8FIEdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcM8-0000000DWmq-1x14;
	Mon, 22 Dec 2025 09:37:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXcM5-0000000DWm9-30kR
	for kvm-riscv@lists.infradead.org;
	Mon, 22 Dec 2025 09:37:30 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a0c20ee83dso47464905ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 22 Dec 2025 01:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766396249; x=1767001049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e+eYOQ9Z1GWGVQPVaVWjHQDJybI+c8ckkcfPVYmzYak=;
        b=In9xw0QbtegWHDmJfaPfgMLbPKEYRuzIVcgPT+qfZtb3L46lileIoQFEGzeNpHNa7f
         KiFg9Xozs4PBPSiN3FtJCLUv3X6OdSVD2KdTcQRF8PtRxkd9N0izMV2+3FGNGpaTSkNF
         3yiV/A7xyrwOnPCRlWEKsDTPkvhdUv0kf8uLKeM9cQJKacVhCV7rre+/Ti3UiavgcyWk
         fVYrK7S64qg1Nz6Sg0tYcFF7BN4fFMxBGUjCoV+pnIUCoQLzjpyNObk7LAp7GjR4U0yB
         PqdCeBkvKY5p3hxKp3UFjIjYKj/7xFJQ54TFC63DnAp611gTIbDv/X5l4dDrrYegwdN2
         B3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766396249; x=1767001049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e+eYOQ9Z1GWGVQPVaVWjHQDJybI+c8ckkcfPVYmzYak=;
        b=j8RrjtGYZrKgSXaCcHMb1vqRtBV4v0KwPFSq2+c/h5hZ3fshEEk4INyFrTQh6iO8d1
         14iiO9rjfCpR07xR9NlWl2K2D7nY2x23Zf64Mi8vU53Nj+/ROkY+QPWjvvf8UM7EBObt
         NSyxR+rQHLJHzxnQpLCn0qacRleqUiLhmaXPw8v2DdmrqEnAB0+dxGJPc8oySRfVVg/S
         sXFqnvfAJ5mufnYQTIJE5qJ2FBxqvkxtSntpElPO6b4uBQKPc6xVhkLjGupGC71h6U+T
         oHC743GAtM/0OodY1WQYHFP4jgp6Bqjj5psHxpTeCLZKv3/yVyiEFDJLjWMlT72csRNt
         Vbcg==
X-Forwarded-Encrypted: i=1; AJvYcCWLWv0pv2XcnhLaQVjJWHz8QfJORWi0cZI5CXi0NPIEakFFsR8uek5RGGQOcd2XCfqK3IiAEyxKTgM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxuN4NBAowy45yEcVLCxAMvfpCg3QjAeb5cc40Xdvnh005iutWE
	NepYgykj8DScy7VPdUAG/4y3hQ+NCa8R3WeCDE+WO6HPanZweDAhrYJ+dx0bpI5lOBE=
X-Gm-Gg: AY/fxX5T1ez4GICG1x4uRGcnB/6cx825ZAGEA11RyVbcmNH9xqM+qi+Q4UHAF1Gw9Wa
	ZR6XdQ3N8MNYGNm3FEocezpNBiPdEu8gajjRaE+SzavC+T94NgmA09Wm5XXNMikE9zMfdog1hU7
	w6BFEQz0hj6zgTI0+WypYoT2Ea2HW9SdIL/VQ6EG9B/nzPJgU8Ol7xhaLzYcBPUeTM0Z7dQrky1
	FJkGbyQDoFFvLvSG7SdZCRkLqFYoLh6rN50uAk8NLj6wgH+RFlEkdt1GxLvGIHuEaQYEyA49tMb
	BOmfwCoDzaoSq9t+DoYQYQDq1XI57ljq025FOEulh/XzUW+DayosqOq4DmjnKMBtOjfybTZew2a
	+jxsgicYW4qaqMqvsHeRy+eGAOkGci6/S5/WnpqdQLCGol3TAnoWeRhYPbZyQgNkw8WQZoiZRmm
	ggxbGUxL4XsWF3gr6BBT37GFKY5HXLHDzl4jD4qpCzlr6RylT+u2EP
X-Google-Smtp-Source: AGHT+IHbAevZrh677mrcs/s1RBp0r3uPnm7MKiIYh2aKgk+Y2T5BWPJU1+fmAHdSaxWnaMOTu2Gp8g==
X-Received: by 2002:a17:902:f607:b0:2a1:4c31:335 with SMTP id d9443c01a7336-2a2f2717b88mr102674405ad.26.1766396248789;
        Mon, 22 Dec 2025 01:37:28 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.255])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d5d20dsm92611765ad.67.2025.12.22.01.37.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 22 Dec 2025 01:37:28 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@linutronix.de
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH v4] irqchip/riscv-imsic: Adjust the number of available guest irq files
Date: Mon, 22 Dec 2025 17:37:18 +0800
Message-ID: <20251222093718.26223-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_013729_822511_C7FEB142 
X-CRM114-Status: GOOD (  15.48  )
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

Currently, KVM assumes the minimum of implemented HGEIE bits and
"BIT(gc->guest_index_bits) - 1" as the number of guest files available
across all CPUs. This will not work when CPUs have different number
of guest files because KVM may incorrectly allocate a guest file on a CPU
with fewer guest files.

To address above, during initialization, we calculate the number of
available guest interrupt files according to MMIO resources and constrain
the number of guest interrupt files that can be allocated by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 12 +++++++++++-
 include/linux/irqchip/riscv-imsic.h     |  3 +++
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..cac3c2b51d724 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    gc->nr_guest_files);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..cccca38983577 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -794,7 +794,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
-	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
+	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
 	struct imsic_global_config *global;
 	struct imsic_local_config *local;
 	void __iomem **mmios_va = NULL;
@@ -888,6 +888,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
+	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -928,6 +929,15 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		/*
+		 * KVM uses global->nr_guest_files to determine the available guest
+		 * interrupt files on each CPU. Take the minimum number of guest
+		 * interrupt files across all CPUs to avoid KVM incorrectly allocatling
+		 * an unexisted or unmapped guest interrupt file on some CPUs.
+		 */
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
+
 		nr_handlers++;
 	}
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 7494952c55187..43aed52385008 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -69,6 +69,9 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
+	/* Number of guest interrupt files per core */
+	u32					nr_guest_files;
+
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.20.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
