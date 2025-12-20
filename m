Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD43D637B2
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 08:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oqyL1ONGlit1+drT7ef8HrH12yMFZJSjUKk1655FLTc=; b=Sx5AmhOdBwRAI+
	GTrLdbksIgp9JC0TpsdPkPBTfr26u0cq4Ft4oyTJbposSkm07b90PHBCv45Oa549I3Ufsx/Bpvlab
	W3YSq09d2j4ULrjS21E0rMdo62nKdTQElwbLBFdiEl9x4vaYs5A40wIJequuZKWZdzIZcXqr0IDYE
	WLTuJnUmQXi7S4WnPbopPB7BoAuA8P175pP3PWYkcs9HlphVh/KpNu24lFPDeIEA7VjWurWK34LP1
	YNzsF+c1dxdGs3uEYuDAUvt5SghK+lO/s8d115tdkmKto6tKFZdbezSq7uGruyLcMB3xeNScUPrHm
	dn9RUgtmRq8IzFhhgu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWsl0-0000000BQr2-14rx;
	Sat, 20 Dec 2025 08:56:11 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWskx-0000000BQqK-0u9N
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 08:56:08 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c7d0c5ddaso1425864a91.0
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Dec 2025 00:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1766220964; x=1766825764; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HXENzr5z2plkFWLtxmfbha96E8Xbo/nXRtWKuaAr4kw=;
        b=YCIlNDX6LOH/vn0XBHhuvJ5mszKrljryYib/Jlnod0SWrdSCiH0IEyjC0VIGGSFSvV
         3zEoe7QJCwZhYN9wVqzzZgWOFyPXYp7Do5TAcA6PY8J7EJIg6uIQT8FwjMuJjqg3pNmr
         0Efp7IGdcOmpDtdt0GIKp/EDSek3k9d82YuMSpfVLq40KwwxZDqk7+vBfsj3wYfqW64M
         0EqZk5g3z1LRCYAT+5/szFlQsOvRE6xWeqZBDzYMinMtakutmSVLJag5KPQCvcL6hHwj
         Pk4CdZnby9IH1q/nzHcvFh84MJnZtDSWsO3feP52zSK4tJbxNyahqf+Sjr4O3Xh04PC0
         ZDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766220964; x=1766825764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HXENzr5z2plkFWLtxmfbha96E8Xbo/nXRtWKuaAr4kw=;
        b=mBn5eesJBLkpETztVndxT/TGKGsAUUzX6EBHliKnvNjiV57B4MZy7tfIpgeE3sCU/X
         tz4AMPjbkf+FXj/fhDimOcPNOg8Q6Xx7AN9z+fhDx2eE3NQhnlLYwy2jmljOg+zuoLl0
         bbEAYQWlpO3w72da1tVGMgYH1LmC8JTmXDx59KWPPU/o6PBG0h8X5UdrYXKf3Y6FXehm
         BeKTRWtmwBiEs82TEHgPc4BesQ1drWtqCyOy8Y/vQQRaLqxP1qYFDLG6/1rqG4hskn+u
         17IN6v0wWLUWyhQkRJG81j04oWllUcNPpO/WzgE0HPDZOdi9rM4n6p+jvAZ+LJaD/4HA
         Myzg==
X-Forwarded-Encrypted: i=1; AJvYcCVqEv1bRDyhfooFcV/VszGr+5mvb8AkKNjjDlImXKlOXAi88K8FZ2787Rgy+ip+rqSaYz9zNp0za0g=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3l7p24RMKsXRnx4H+aInCFDRUFhx1zqrKfjIpvB+SPqPALckl
	q05ZdelDm6sEbOGZVV99pNhl4V5NLzaqJawzRQuBtevWeJF6paPFWTqvYt8MmIcZviA=
X-Gm-Gg: AY/fxX7L7KX/3djmahDbx1//6WEu08OPyPvCufBw7SU1XD6oRbhPYRpanDJOZajrn17
	ToSqgPaVeMBNKodLf5AkKZvyvPG9KYlb5WvY7aQQeHCD0/2VH13RCBIUBluId4IbPV7L3X73sbN
	axi9A3g7ZvFBy50JDjiz5txbH8jxZUbDnMPVu6Oys9M0qogy0kgBGz+nSbOCHgGXGww36iee/eU
	lqfR7yRaxjduZAH0CtNh3Hh8S1F6CvYoKSvS5HTS9XQo+6mp1RM972hme+lsID3r9OX8uUAK3bc
	HY76cGTASBvSkB6N6QNjUVI8Ta2A4/u3R16PZ9W1CKTXwsfO2QVlqdfKLDM5L27bb8UUa1WAaX1
	1NLT6HgTfzOn5CYiLK/KkquO1A4SsgvVigEVsECRB4+p87STlEeKRKrUNPqHcYy6VX4t5YAGDNd
	VpSrAYXbweZLfHn1cEU8chKQvXPDX6gUndp7jNZpnf/YKvXfoPax7t
X-Google-Smtp-Source: AGHT+IF05noiQi3hAuPe2AeRVjxn4xsojmQL6ESiyGT6IBKYv3sJCcgsagLTeD2lo/eEy1e2Bo8hYA==
X-Received: by 2002:a17:90a:fc4c:b0:343:e692:f8d7 with SMTP id 98e67ed59e1d1-34e90dcfcb4mr4666180a91.11.1766220963620;
        Sat, 20 Dec 2025 00:56:03 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([139.177.225.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e70dbcb6esm7506626a91.9.2025.12.20.00.55.58
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 20 Dec 2025 00:56:03 -0800 (PST)
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
Subject: [PATCH] irqchip/riscv-imsic: Adjust vs irq files num according to MMIO resources
Date: Sat, 20 Dec 2025 16:55:50 +0800
Message-ID: <20251220085550.42647-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251220_005607_325635_CEEB68A4 
X-CRM114-Status: GOOD (  13.57  )
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

During initialization, kernel maps the MMIO resources of IMSIC, which is
parsed from ACPI or DTS and may not strictly contains all guest
interrupt files. Page fault happens when KVM wrongly allocates an
unmapped guest interrupt file and writes it.

Thus, during initialization, we calculate the number of available guest
interrupt files according to MMIO resources and constrain the number of
guest interrupt files that can be allocated by KVM.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/kvm/aia.c                    | 2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 7 ++++++-
 include/linux/irqchip/riscv-imsic.h     | 3 +++
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index dad3181856600..7b1f6adcf22d6 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -630,7 +630,7 @@ int kvm_riscv_aia_init(void)
 	 */
 	if (gc)
 		kvm_riscv_aia_nr_hgei = min((ulong)kvm_riscv_aia_nr_hgei,
-					    BIT(gc->guest_index_bits) - 1);
+					    BIT(gc->nr_guest_files) - 1);
 	else
 		kvm_riscv_aia_nr_hgei = 0;
 
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80a..1e982ce024a47 100644
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
@@ -928,6 +929,10 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
+		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
+		global->nr_guest_files = global->nr_guest_files > nr_guest_files ? nr_guest_files :
+					 global->nr_guest_files;
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
