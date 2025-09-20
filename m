Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 962BACAC5AA
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cvkbYmhFqunCfvyC6vOoYHur862deR12vFM8ZkASWLM=; b=zbSFv5Wayn0qjV
	nHzgfGK0wr7adob8++xI/TZFJZ+SDK9UxL7CuLisYYQZwuJCaKqjm5vnhqLa4Jpz3FokKWA+YqiA/
	1E1WkE5OAbmYE+ogY6cm36BPiHGO00Rj9LHD8sHDAdd3SCB89MtCayWZ4VNc5yAZChnRh/pcn8VuZ
	KAN/Kz3rmt1XET5ds2XOCedoaVVQmTGJr7giyDs6onb1uE1D4+a7f7YiMA+VUPz0jHSGSf1mg68gj
	vLAMs7QENwZlXSxHzc4E2r/1CxoeVrQyFZlrFgit68XvsPqCMV0FhTnUjhxOZWgOJbFGHP42LxtVq
	HuxsJm00CEG0cb7uG7mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MD-00000005tGx-02tu;
	Sat, 20 Sep 2025 20:38:57 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MB-00000005tFR-1Gso
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:56 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-88cdb27571eso111423839f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400734; x=1759005534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfdnGB1sHNv96VJcVAg715QoFjcIQwVKNMZEvz9AAmU=;
        b=dPfgpsGq/9rgShoj38pT6gpRLTLe7hyz9Z7NgxSe7oOyShZIsR2Uv4OwbF6wcGj/Yi
         Ub8f50NndHLyJqrWP46IdH/0Bpy8+x5mD5yvpWJBdNlr5akiE7SgY+CMz5PNm/rxi/Ha
         2w2Bt0kuWCGNRvFyPpIJaCpmtwukLRWq90NyBHbs/qTQK0LWtJQi0KDgJwEFQBvi3dn3
         7a5fz3EW2M9Ah25d90rbBsgpVxvg5mFjWOxmSYJYiByWBWMTSE9HMHufFl2sFjya3I+N
         bBvW6ylFjIoqPBhs9WSQItcgYf5wrIAJU3ev1qprxWCT1h61/VrIyVD6o4E+qaydkM/z
         fPMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400734; x=1759005534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rfdnGB1sHNv96VJcVAg715QoFjcIQwVKNMZEvz9AAmU=;
        b=Z+OMIHn31tvvquWPiPdIi+G9f5MJ0huZqAS2CbPZ+BY3uFsamPKvNcR50J5sTiU7kc
         Sz3LHHYD96bMUKajIsLs0uoQs4r0G6Zj22XxKehSBIGM+tcCPXsZrAR+XG87uwx7NAru
         tnzkDwwBkNNZyoS4S5VgbJ6IuLsROLda8lhQ7ckYMJH4R6DJZgxSv5GZgj8DbY7vd9CG
         vk7j9g8Ihrs6FSGtYjA6vs8oprQfz15VEmE150Wp/UzP/9UxxdwluwIFv4AT/HxFI2+H
         aLmMb2BnmRmecU5Q2d1CsMxS8UV452IuojVs9Qo6cVcvl/Flu3nln8na6TF8Qknbmyxv
         AdQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVPCEVj/2rV1iPAN0Yt0h8NrMwZtq2ks0RNqWlCrsDDSbh3vPt8yZfG5x5lTvFp5Ei9y+8nGuznsM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ObS4yDB7+RxmsWC8BcZuDzlVgZ7aWHju5DE4YK0ZS32EgPKy
	krieoL0MQs00IGn8/p5cdmx3YZ7PXibtP+74oJKytezgG3it462Oip1yFLer2l1KpIs=
X-Gm-Gg: ASbGncsdPPRBGVDMpro9LkirZm4sHNQU34YU9lQGmrNPP9CSg11JJHoTQ7PPSTtNX2W
	fWzlKmixBE2ehoKSWI8MUgGDBfTi7NxU8cQVz6jL05Yykcrjt14nuLLnEZ3IR7GfYKhGcQlUPkC
	dSUxnInedWTg6eac4qRuWwGa6hxCLXE40bsC+PRK/yZPpMI+r+lmlPqF17DYLgv0S8+/QJVV7hz
	lKYtULm57PdrKNqJeCQIHxfB+rgS5gbLhLhv6UfPqviPrx+u5cN3VwbCJe28kj66R4jbLzBkhkd
	1gGaZ+Tti8gNtJFuN1KRycA7Huef9lST/m8KFXVgP5UxhP4Ac4toFw85tOhYuRD5gUTKIn+pzrk
	UzySab7wmbYqJ4bPAHc831us9
X-Google-Smtp-Source: AGHT+IER7JqLT6oTfCQWU199+6p/3PvuPfDuYsKata5YQ6Fx68IZQQdwLhEBfg4EZlP9xJt6h7cJ2Q==
X-Received: by 2002:a05:6e02:d07:b0:424:8c2d:ca45 with SMTP id e9e14a558f8ab-4248c2dccf6mr34706195ab.31.1758400734326;
        Sat, 20 Sep 2025 13:38:54 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d3e337de1sm3755155173.25.2025.09.20.13.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:54 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 01/18] genirq/msi: Provide DOMAIN_BUS_MSI_REMAP
Date: Sat, 20 Sep 2025 15:38:51 -0500
Message-ID: <20250920203851.2205115-21-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133855_344432_0DE373B2 
X-CRM114-Status: GOOD (  17.04  )
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

Provide a domain bus token for the upcoming support for the RISC-V
IOMMU interrupt remapping domain, which needs to be distinguished
from NEXUS domains. The new token name is generic, as the only
information that needs to be conveyed is that the IRQ domain will
remap MSIs, i.e. there's nothing RISC-V specific to convey.

Since the MSI_REMAP domain implements init_dev_msi_info() with
msi_parent_init_dev_msi_info(), which makes 'domain' point to
the NEXUS domain, while keeping 'msi_parent_domain' pointing to
itself, there's nothing to do in msi-lib to add support except
to accept the token.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/irqchip/irq-msi-lib.c  | 8 ++++----
 include/linux/irqdomain_defs.h | 1 +
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-msi-lib.c b/drivers/irqchip/irq-msi-lib.c
index 908944009c21..90ef0af866eb 100644
--- a/drivers/irqchip/irq-msi-lib.c
+++ b/drivers/irqchip/irq-msi-lib.c
@@ -36,14 +36,14 @@ bool msi_lib_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
 		return false;
 
 	/*
-	 * MSI parent domain specific settings. For now there is only the
-	 * root parent domain, e.g. NEXUS, acting as a MSI parent, but it is
-	 * possible to stack MSI parents. See x86 vector -> irq remapping
+	 * MSI parent domain specific settings. There may be only the root
+	 * parent domain, e.g. NEXUS, acting as a MSI parent, or there may
+	 * be stacked MSI parents, typically used for remapping.
 	 */
 	if (domain->bus_token == pops->bus_select_token) {
 		if (WARN_ON_ONCE(domain != real_parent))
 			return false;
-	} else {
+	} else if (real_parent->bus_token != DOMAIN_BUS_MSI_REMAP) {
 		WARN_ON_ONCE(1);
 		return false;
 	}
diff --git a/include/linux/irqdomain_defs.h b/include/linux/irqdomain_defs.h
index 36653e2ee1c9..676eca8147ae 100644
--- a/include/linux/irqdomain_defs.h
+++ b/include/linux/irqdomain_defs.h
@@ -27,6 +27,7 @@ enum irq_domain_bus_token {
 	DOMAIN_BUS_AMDVI,
 	DOMAIN_BUS_DEVICE_MSI,
 	DOMAIN_BUS_WIRED_TO_MSI,
+	DOMAIN_BUS_MSI_REMAP,
 };
 
 #endif /* _LINUX_IRQDOMAIN_DEFS_H */
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
