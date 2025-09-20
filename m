Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469C8CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V9bNFYA8t36ciXsksuYWjr/iJ/r0lTGE1DTCenS+MFI=; b=uikzmGWHMD1fU3
	ewsLwew0jPY/KGFyI0X5GG3mv31/BTKPPaAXW6W0IDWOr0K4riPb48g6kGR5V1dRmBtsXhBtKpeIt
	FtmqVVTRu5qF7wWE/B1spbAw58K0TvWbELkh1WeEPgKn3A67uWT0A3iCOA69CUM3SfAdIfmIcFSls
	QG/b8R7UohTJQF/iy0scgUe34m6BeFvgbjOFgU10YcZ+05F3VI90IRzUeNTI3bD2np4hC6BnOTBP2
	Sqwl/z7HC9OrqjEoEmKUewz810lrMwnrrEf2p7gt3z9imJBJWcPiUBUD3vp2RkeJPaT7Ogfe6qUiA
	1hhyfXw3FhzG+EdvssTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MF-00000005tJe-44mZ;
	Sat, 20 Sep 2025 20:38:59 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MC-00000005tGB-2fS7
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:38:57 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-4256ef4eeebso3933395ab.2
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:38:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400736; x=1759005536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P6NLd7h8COmFlKXea5yNf3+i/groQ/UZ03coZlB4lvw=;
        b=T3kXIWBEivz616OhxYw75S0eYCbX6F2zVPN6Mmf019c/QToAigGdB7KHVWrnKsEei8
         aJ82uNAMybxjA+AROKI5GRZMXi3qyqQnyD8thvlSwRkXYeTW7xFsDJ1b31Y/vjJ6buLS
         PE0lGnN9UgdVnOYTSKxGtJUBAVhmvTxDo2k3dqdEwy+QXhWsMskmW/aict9SOEkOXE2R
         GTwAtNpg93Sv+WE0/Mk5Iap2V5K/sJOJRAOiEn+QXK81dU7NzfOfl5azthsODENVkc/f
         /3M2S+ep3ZE1XvkHsODXNhfK+reuo3LChvHuu4EWDEGKxaNxgmPqrkDuqk1B3HfbnaVB
         aIww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400736; x=1759005536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P6NLd7h8COmFlKXea5yNf3+i/groQ/UZ03coZlB4lvw=;
        b=wFJ8EKVYiGEEC6r1TcQ4ZXnGe8PS5aR9lSy7jU+K+pfCIahryh2MRkdCWHzXpT3GF5
         ACe05xRiGjp1xtziKy15ofYml5hxzWz6oXV/0gJGnCvIsOByaOWLz0YLk4bUOyYNV1cx
         kRNgcDl6yyHX+78ngUegrnJ6N9/vE3n5dWlXcQbTXxjDy3IuyFw1yO2RcUGvgog3FBqO
         Un5CqLqixJ8VVZfSLxlS0iZt7qpk+jggU55vdX3esbFvPfzws8oqHfkPy4EWKuo4OaSZ
         pdPNHmrwZ/QwMDAmPlg3VHoRcHuiiQzvz2mb3aN2pLGL2r5qzT4rfC5SJ03XW6aooekw
         TBTg==
X-Forwarded-Encrypted: i=1; AJvYcCWxjoHyy6Tkv8PPVBP2GpyksKwhx6ZsayA/+0J5QOnUdhGu0ZrFbOg41DBvwLfSn7rlXO1fmjS7z2c=@lists.infradead.org
X-Gm-Message-State: AOJu0YyYcRsOkUFb5rjuJ0iXW+/SFMzL+fYCIHxLMUi75WWFWM2jJAjU
	D+IOVK7MTmLnHXzljcV2pvwZ9ZlhUZj3RZBY1yiVj8JuAnijVUx8C58gEgdFNbWWLVg=
X-Gm-Gg: ASbGnct5tdXMCFnxDbRzxc0gkq+WegRgKA6TEJGl/Hb4XzLbUZC85IUp/Pl1MyGFFVM
	IGpcclLwJzepJ1CC4cpJl2In1ynj8+eupCxl1qv0/zU8FNkDBWjmJxPqyPPNv0H1Jae5XqvTB0w
	G7o1k3S4ThSRnBvbIB+GmXcajQ6uhbeO/Pep2fxtzmCRAk3rTT5Syyky8UPwysZojQSNNWPLI9K
	1QosXMITPuDG9lxCn2P+GnQbbPc+VuRapwNdjCFZSd+keik1ZewOXchiZ+AQEPxnDtpvgBn3yQD
	+dzUUe2fXo53wRgaUkz+sLCDbCbwWna5vycuI8nMsQh9/HZaKN7HU3BGf7uBCWHpSj1D4Hm74yQ
	9gg8heB75+S/P6ZNdt0bbK4z/
X-Google-Smtp-Source: AGHT+IHbDh/psntZAQrwhmgYfdd6+QUgFKcczM818cmbTUp9YMR8lJJAeTz4CAy+PPiDGOALUnKI9w==
X-Received: by 2002:a05:6e02:2305:b0:41f:5e50:23f1 with SMTP id e9e14a558f8ab-424819af385mr128428775ab.25.1758400735680;
        Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d50aa5f44sm3758324173.49.2025.09.20.13.38.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:38:55 -0700 (PDT)
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
Subject: [RFC PATCH v2 02/18] iommu/riscv: Move struct riscv_iommu_domain and info to iommu.h
Date: Sat, 20 Sep 2025 15:38:52 -0500
Message-ID: <20250920203851.2205115-22-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133856_670158_6C4F279C 
X-CRM114-Status: GOOD (  11.62  )
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

In order to add the interrupt remapping support in a separate file,
share struct riscv_iommu_domain and struct riscv_iommu_info through
the header.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 20 --------------------
 drivers/iommu/riscv/iommu.h | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 0eae2f4bdc5e..901d02529a26 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -38,9 +38,6 @@
 #define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
 #define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
 
-#define dev_to_iommu(dev) \
-	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
-
 /* IOMMU PSCID allocation namespace. */
 static DEFINE_IDA(riscv_iommu_pscids);
 #define RISCV_IOMMU_MAX_PSCID		(BIT(20) - 1)
@@ -802,26 +799,9 @@ static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
 	return 0;
 }
 
-/* This struct contains protection domain specific IOMMU driver data. */
-struct riscv_iommu_domain {
-	struct iommu_domain domain;
-	struct list_head bonds;
-	spinlock_t lock;		/* protect bonds list updates. */
-	int pscid;
-	bool amo_enabled;
-	int numa_node;
-	unsigned int pgd_mode;
-	unsigned long *pgd_root;
-};
-
 #define iommu_domain_to_riscv(iommu_domain) \
 	container_of(iommu_domain, struct riscv_iommu_domain, domain)
 
-/* Private IOMMU data for managed devices, dev_iommu_priv_* */
-struct riscv_iommu_info {
-	struct riscv_iommu_domain *domain;
-};
-
 /*
  * Linkage between an iommu_domain and attached devices.
  *
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..1d163cbd9e4d 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -17,8 +17,28 @@
 
 #include "iommu-bits.h"
 
+/* This struct contains protection domain specific IOMMU driver data. */
+struct riscv_iommu_domain {
+	struct iommu_domain domain;
+	struct list_head bonds;
+	spinlock_t lock;			/* protect bonds list updates. */
+	int pscid;
+	int amo_enabled;
+	int numa_node;
+	unsigned int pgd_mode;
+	unsigned long *pgd_root;
+};
+
+/* Private IOMMU data for managed devices, dev_iommu_priv_* */
+struct riscv_iommu_info {
+	struct riscv_iommu_domain *domain;
+};
+
 struct riscv_iommu_device;
 
+#define dev_to_iommu(dev) \
+	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
+
 struct riscv_iommu_queue {
 	atomic_t prod;				/* unbounded producer allocation index */
 	atomic_t head;				/* unbounded shadow ring buffer consumer index */
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
