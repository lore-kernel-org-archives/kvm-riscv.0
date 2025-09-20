Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1E79CAC5AF
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dOLh2xDGf8D9eoGsz6d0QA+ojAKIVtyzUt+cbJc02I8=; b=VMQ+zkOisUoB9H
	behoQgZGO0KMdT86vTx7PhngIGidIgfIolnfPtAx5ep81PlHNscz7uTidRVqXkTVG/ctJjZ79dC48
	mi5RUS5btKTUxprMJ4NCOpW7G80zVXhsREjvrHSW0g8/mxjTnAqhZoC3ErcYXowIfK4EjZKo/OGb/
	rpY5ueY8m3iVjH4Y37ttf2yAfRlnWaeeccOCfVcPcgf/uGJ0G6jn0ZMGR+C+uuUUfbnEdmZVDV0F4
	fhzjpP1DkHPRugFdZPOjYHygLWTqipG5ezkM9BdBNqwuM25+sk5rheZR5upO4ljsPjcCCGYQg4rJ1
	iFCq3k7bR9pDtuwa11Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Me-00000005u0Z-1JOZ;
	Sat, 20 Sep 2025 20:39:24 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MW-00000005thP-0ozs
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:17 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-88cdb27571eso111429339f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400755; x=1759005555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhgo805sVSiR0SJlmhLHBR/NhPzSwBuZgQ2sQCeXYLE=;
        b=ff5GSiGfr86vJxy+Eoa5N1A91SlXKKRkXKl7FVfWUukLmhGFnLA2Gf7Gg2PTsw20zk
         KrVGhMOVZ48KvUA4bHNzMYeONcVZRRz7hWVt/jqmq39mrHGi+D/EUm5ECqp6Cvs4oRHw
         oZSkGFvvbksRVyUV0rroKfN1UP4Vrj5NEBFIvl9iZ3k1Vh5DLfY4B+msdkZRUfgstcK9
         DznGqL2OBsjjmornk+z6AbJJHmSNG9vu5uRcbIG+E4QKkB24BiuFNo83K7GFOW47YVm1
         xaIoesgpW5mSgStESHjFUXcZKVP2WX9yC2DEZopttEJMv3hm2rRNb8IZ1kYwwK/cmo8e
         SI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400755; x=1759005555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fhgo805sVSiR0SJlmhLHBR/NhPzSwBuZgQ2sQCeXYLE=;
        b=tsT0hpbN8GTSvoOB+FmevYDbmUOUfRTmWiZPkSHj1FuLjdlJpQUvGX2zZSPrE84LiW
         qjG54L0EC61RSZywyVDLrbzEWApvnVNlWqavsepapv2w2+t62Usy+pBy79Yg29I7wQ1F
         b5PTcA7kWP/nLyU/Y+HYpMVGXrRglRICgH58051JjmT2m5zt9HiWtv1MR1U5Lu9GWVWP
         8FXy3P1Tdm5dw0QU2WekduSKKUl2ahf7vugndBypVgHg0oI4Mr9/kPG6Fp/bxKgFzoy0
         pFub3aTfmKLDPi+hGd6tI+OMy1DLDoaMmZZGjgJujJA3cLKTenIfYTUl3mHEM1vtkZSg
         /o8g==
X-Forwarded-Encrypted: i=1; AJvYcCUhWwflOWpE23OO+7cDfhSASunU4sLM6W9MXMVlP309GEDNohID70em3/hY/E2suxJOla8Z5g1wTJE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzN57XHJQiw1hvvH1emjfKLHOaQcWNI0ozxhPgKMAk79Zv496dD
	gv6/6HV4wEy3mDaobipzdgazpW5yHCCX92fLw9DKwmf6YBQJNUzWtMpTM1nOqd4wzkk=
X-Gm-Gg: ASbGncvke8rhUg/F67GhLoujSbF+H5oobYL87x7+oQ3WS1iRb1FylEpmuWFFphFNB8l
	FAtCD1Ss47d8XaJH15dDzSBUZPKTKYhczq+0M964af1NDAg58kVyKhDQbhVlL63svJT3vA5C3MD
	e7X1K4RxyZUcxA+d2vvH11KZio194J3jKMX3dZlG42RdYNG4fZycWfiVuEWWGYaE/6B/aa5VeAz
	qa58iS7eYJGmbbDVtZLL8+9dZ32qih3dZgmOO0zzCLWYPdblDlgbHO6ph7GVDbwium/JKPSwRzM
	O9WW8KUjQl7SDgzHrs1aTjivElsUKDre0NTonK5JX7u/2YUdOBe6jg18op21YLl64MMjLbx98ti
	DYETEyjpFffNivdjILHAlpqD1mJtNqv0jEjc=
X-Google-Smtp-Source: AGHT+IFpmX9UAkdlqyKeAFy3AzOo21LtEJum96Rzv+8iJlkbfeuTwtEuWDKpDYd555ixOqfVlv44jw==
X-Received: by 2002:a5d:8791:0:b0:886:c53c:9175 with SMTP id ca18e2360f4ac-8ade08247f9mr1118249839f.16.1758400754919;
        Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-54cfd9b688esm2100997173.84.2025.09.20.13.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
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
Subject: [RFC PATCH v2 17/18] RISC-V: defconfig: Add VFIO modules
Date: Sat, 20 Sep 2025 15:39:07 -0500
Message-ID: <20250920203851.2205115-37-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133916_299250_8FB55E7D 
X-CRM114-Status: UNSURE (   7.94  )
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

Add the VFIO modules to the defconfig to complement KVM now
that there is IOMMU support.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 7b5eed17611a..633aed46064f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -242,6 +242,8 @@ CONFIG_DMADEVICES=y
 CONFIG_DMA_SUN6I=m
 CONFIG_DW_AXI_DMAC=y
 CONFIG_DWMAC_THEAD=m
+CONFIG_VFIO=m
+CONFIG_VFIO_PCI=m
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
