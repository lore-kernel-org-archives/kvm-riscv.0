Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB7FCAC5A5
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wXZF+Pxkclv2+7fjjT8MZxmC7lrDx6P6/WMOdHE0x1I=; b=yb2btPiiy9UfoF
	9JVnGvjnmABXJLJ2ACDJqSRNSCvU3oYJ7EXVDh1Fl9youE1YGhA+duhFfMbyjlSaVbT3TX4XApvkb
	ilDJXMg5PZFvoVbje56wMG0E5bxsHFYshEHZChqtngfPkbbeFsJa5sknOger37x1dYTQpRXHj8w9f
	KtLAm7Sne8KlNh2r+2bN2LJXWGe30Tr5ClQ2DSES0a/ljmnzpgJWpkowfBRlM9ObYCg4h9V75gHnn
	7v6iF6yWnx9NUJ5zoTbEhvoEK5ps+S/0tYl0wZxjRyastSlqXydXkLrNa01IDw2tG2duev9EmzFJr
	Ff1Cpx0aZcnfdhQTfXVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MW-00000005tk0-2Ig3;
	Sat, 20 Sep 2025 20:39:16 +0000
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MQ-00000005tXw-1yIg
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:12 +0000
Received: by mail-il1-x132.google.com with SMTP id e9e14a558f8ab-4256f0fac67so5297885ab.2
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400750; x=1759005550; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiJg8ON0boDhCQorG+j+Xw5gw12MCBbaI74+jnmrMFk=;
        b=DihRN6J7Do4hIOOlELuEGv12GkELBadJCuznenHaXFw37qQfxoXMCL58YX3qEIVzVa
         hsa16WpMmJQGgr8rwa4CUghYkq3E4nqpBh9cnC8Tl1aUpYzp6TYf6soXVp9u6bO/et9+
         t/BiZr+Y6PgrGJaWOXotBYEinfB9ExbXVXSa3mXlHl588UoxEnUt/oIK3btqEotp0iXa
         eyQ6KxpGZZj7ZZsLgMQB1s9inXhwHFcrxA3voOI5aVqGq1ka5/bqhMMY/ZaN8k7/YI0e
         08c9UPVQaaYf0ugPg6fSPB+JrLTlbLLigvbCgUXXJYNBHwh7MvhGtnn0erXq+rmSBl/v
         EvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400750; x=1759005550;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiJg8ON0boDhCQorG+j+Xw5gw12MCBbaI74+jnmrMFk=;
        b=iP6sGgzsNVv4ldq1/jss7Y+xLKzrws014ZFmlvKBLpUmvDPzeQPDkKovecmEhZoRo0
         skSL49mAIel82+qQ6zbrhZqQa8oRYDTWxVXECP2zZlJ+sLvZsUb2NuAvffjs+AnBztlO
         GQHl5yxAkYf206O6+xpgNFes/JL1Qw9pxgT5Dl7shl0UalyhWcIyxKVTGRKxz3GzWdOk
         dT4dV+TJ8ue6KLbq3bCF0vwxAdPiQEK90jtRAGyoWyO6biUTIDHE/psCHw8XS9kYWSZ/
         32XvvWanepTZDoehwbFaOeoJpjWO58ki0qMTTwPBVpEFfzkQg1xqxALvPlWy/PLP0CPW
         1FxA==
X-Forwarded-Encrypted: i=1; AJvYcCX69uhNMBDSCte2y7SNTUb+qw1kzzFJVgM/7PJFedje9sPUBcXIGl+oaE+k1rCoZkyA5lqvyGG8w4Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxFuylkvqe0D/fPAApHddccOI0aAaELA97IkfN2O2VBXXpo/rES
	MCxnp0C+usfChCTG08ipM54X13kCRF2rLzP6zzzb0cmwRvGIbI355sCB1ePMlQyU0cg=
X-Gm-Gg: ASbGnct7lY9Qpy8edHLfA61NshnhU59wCPU5Mb6oI/0ascUBPuaQa8/2CV6fcOIGTUW
	JdD/b9xuEiztYgwagBpUxUdtYEUUZoQULwShNc4nZfDSP3fXE/NUBfAfzqWuedHjpF15PjKBlVY
	capgoiiC4kh6nXquZ3sZanLxkgUwHFFAmyFkDKA6YZ/UVS8CwsMMxFQGQ24grepHNhVlbf3Vekn
	k3qa3fOk6172VabXnzoCgBkHl2lWTCkG6+ZSxDJAtUJumqIQkNoEt7+ecI/4EEp9hxsjeauXz/3
	PZ93NIevKMaMXiYmmD8Dfo/FI02VzUzYtog7ph6BFF/fksNdlSL5AYmGkTQov/Qvsghl74gbLOA
	BKYQjuA7ECYw2rFA7yWiX4OjF
X-Google-Smtp-Source: AGHT+IFsmriwC7sM1H4SekuoxTk4S0bUk4TUqEUdLP6mEpfm4K0KojSVb0TkIY/Q7lu1c7nixhkmrw==
X-Received: by 2002:a92:c24c:0:b0:40c:410d:dc35 with SMTP id e9e14a558f8ab-424819709a7mr96072735ab.21.1758400749673;
        Sat, 20 Sep 2025 13:39:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4248a975078sm17095365ab.17.2025.09.20.13.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:09 -0700 (PDT)
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
Subject: [RFC PATCH v2 13/18] iommu/riscv: report iommu capabilities
Date: Sat, 20 Sep 2025 15:39:03 -0500
Message-ID: <20250920203851.2205115-33-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133910_541862_9EE5F10D 
X-CRM114-Status: UNSURE (   9.70  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Report RISC-V IOMMU capability required by the VFIO subsystem
to enable PCIe device assignment.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/iommu/riscv/iommu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 02f38aa0b231..5a0dd99f07d0 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -1452,6 +1452,17 @@ static struct iommu_group *riscv_iommu_device_group(struct device *dev)
 	return generic_device_group(dev);
 }
 
+static bool riscv_iommu_capable(struct device *dev, enum iommu_cap cap)
+{
+	switch (cap) {
+	case IOMMU_CAP_CACHE_COHERENCY:
+		/* The RISC-V IOMMU is always DMA cache coherent. */
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int riscv_iommu_of_xlate(struct device *dev, const struct of_phandle_args *args)
 {
 	return iommu_fwspec_add_ids(dev, args->args, 1);
@@ -1531,6 +1542,7 @@ static void riscv_iommu_release_device(struct device *dev)
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
+	.capable = riscv_iommu_capable,
 	.identity_domain = &riscv_iommu_identity_domain,
 	.blocked_domain = &riscv_iommu_blocking_domain,
 	.release_domain = &riscv_iommu_blocking_domain,
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
