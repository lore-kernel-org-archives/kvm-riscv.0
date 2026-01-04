Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF45C2A062
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 13:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BVDd9zWUsv/ji7ZFXafS/oIA53K0wlnszGbtlaDfaWA=; b=B9soKlSI9M7EKz
	DULQ3vln7XD9RLTMfx1Q+ceX4m9IWnwYQ27beHHkbYJXXVienL7ta3yyKjvF5M7Yevj/KTSgINbX7
	KVT19r6keORCm6bJHXzhuFtDpa2/H3l85s8MKzLN1k0kpchc4+utFBaMOt3/pr+8maxDulVyr8W+g
	DMkSqXuCEmfZ0ANpQQmlIVgDCel2MsVtOBP43RarMuCQM7H6pKsFGNyWDv616T1Yq1GVlhUHy8pwQ
	6JBMya9p+NkD2JScGN42A4LQZqifXhiOt3Z2RhDkeFfPfpf+qTNAKocAanCEDCAo1nbL32yQSxFoz
	TOUw4iFpnVNlUYX9nt9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOMn-0000000AGYi-1uPS;
	Sun, 04 Jan 2026 13:41:57 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOMk-0000000AGYO-2dXI
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 13:41:55 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-65d0953cd49so8838118eaf.0
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 05:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1767534113; x=1768138913; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JvZUDpxx2/TZemLMHA7g/NjnGnb9ciURwwd/us/xC4Y=;
        b=le7VYzimGL+U/jc3fZLX70c9TBqosE+aufaC9N7t0fxTu3RB50gMBABXPiVtc5HJEu
         BaUgaG0UdA2YWlRxCnS9j8t0OrPaPiw65Q2gLNn/Nex3Ra3HYxjQBYUbft86/aVla3yZ
         LK+IbnMg3JW1KnE7K1HiWAiSJbCdVYROFf35la8r8U5n0mbZcABr98ImmYf/q4DuBKr2
         U4oKSy8STN7vj0E605XjEFiXl6q/S/CuzVL94OuvvBkqw7RyZ/NnFAtcqP3MiPke4pHS
         Jcv9t89ds+MoMR+CYDP6FI9gX+YGmkhC3sxDkRxaeeT71f/PtlFXjH9LgSNGi234YSq8
         dDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767534113; x=1768138913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JvZUDpxx2/TZemLMHA7g/NjnGnb9ciURwwd/us/xC4Y=;
        b=jVl0S/GsDh2qEZtdGBuaYxHRSMlJFNkH784cAJFVd8LGtxHPOkmRlqcLxGaroIf4sq
         DxRMwXMTpkMxQUzG4csq1SyjJAcApSa/o25McbhH/ijaJW2rJcPKWGhbgIztkMqjAQXq
         9EdhvgHkGTy2gZ5ilpCabD2vWwpzjSF2jjDziFfjofwOaiGWZjNivNbLCq7dFw9aPp/G
         /DGH7t13d95m3lEM0qzFsUKWJYtUVZODP9CC1fAgyZg+fVHzDxQ3W1xrd6pjiqvehXok
         Bd5fQD81LDOeE8N/BZwstL3dUZwSwMKZw8FxYu8EgWAbtwy5sTbPqIwpHSXMx2W9jIq0
         vc1w==
X-Forwarded-Encrypted: i=1; AJvYcCXw6uDDzF9dkGyWd4TVtLLw5KqiEY6I+qr+C2iFTCeYrmG8K9s8UloRQjQv3PHezLNVE7tuuLUP4G8=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcQNK0EF/OoJoxuaHzPkFGyk9KwNWLqAVSjkxKTEOGLYvIM6vS
	r2x31GUwG+wmq0vrSBumqsqaPZlgA1KsSFJTosKk1S2TOmxCK/K5l1zd36C+4fohQNSQkOxbXx6
	izV6nAhu7HQ==
X-Gm-Gg: AY/fxX4FL8rzzv6w3kJSY4tM3A5YL2GxFChRlwT32W3B3X+nZkooeg79I1+dwKomtHX
	D0I7CZkkm29gPqWbRnYGiG71UU+i5x6X8gHR42S0zkHwnZCPb79gNUYtOctlrt4ru95UDCHzUYq
	vtHXgZaVOorR/Ie9uzENoWi2HtEpY53Psv7aXw1PzjnucCql0QlumAabyJ501+2DMbl6TFH5F/Z
	1F9/XdAAWA1zNtvgkohdMvrc0t+bAWxCLbmo3299JwYepny8YUvkrwhhVEqTX8ULFfuQ89Q6e9n
	uzMJAeDudRTtpAN920xmv9gWHxnj69ilmRztnTG8R6XcMxf9Amnhajpd83V+1JKSIUBh4azF7w6
	u4/cbYYhKfuWQAgBrdoW2FYaUS2NZmL9DXY+YZNqzPYfzkYMoRznJHnLustP9xO1Saxdp748Jxj
	TkAt++7rakZBv7RNpxEBgmqCvn/Lqtrw1E6hO15HvuuoAq7HaNR+zIhBjKOsKlZ/n4y7DgkM6sw
	w==
X-Google-Smtp-Source: AGHT+IF6pqf+xAoe4xEDhrknYrrwm/vNFvihqgaZg1GfeAvx7Byc3K7yYVMaT/2jX/ci+jocfmEzpg==
X-Received: by 2002:a17:903:b8b:b0:2a1:1074:4199 with SMTP id d9443c01a7336-2a2f2830f89mr406839395ad.32.1767533707326;
        Sun, 04 Jan 2026 05:35:07 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3c949fb63sm30428785ad.53.2026.01.04.05.35.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Jan 2026 05:35:06 -0800 (PST)
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
Subject: [PATCH v5] irqchip/riscv-imsic: Adjust the number of available guest irq files
Date: Sun,  4 Jan 2026 21:34:57 +0800
Message-ID: <20260104133457.57742-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_054154_721289_366EE37B 
X-CRM114-Status: GOOD (  16.08  )
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
of guest files because KVM may incorrectly allocate a guest file on a
CPU with fewer guest files.

To address above, during initialization, calculate the number of
available guest interrupt files according to MMIO resources and
constrain the number of guest interrupt files that can be allocated
by KVM.

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
index dc95ad856d80a..e8f20efb028be 100644
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
+		 * interrupt files across all CPUs to avoid KVM incorrectly allocating
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
