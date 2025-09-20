Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04030CAC5AA
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q5h5ZGaosHFpLlpHSlSlZwuYdc6K/bgkeVyoi0Xx8DQ=; b=NaZ5O4Ehlkbw0r
	zjePDimEUBfL0u3eIeYfC1nF9cg4HIyhMRKNjDrOo/oaiKJsfhnuouTkPRBRDN8HonepvK1d4F93a
	nGfV8yrS4s4IFXI9wJ/5FpyBPCzVkC5gxrolWvPV9Hdmgf7phXcLOCjTPRC829XF0YqTiA//+Fccb
	nlJDfYaaQ6YNByC0ogTM9tgkFNVE/tBROWTwJsIF+qlu5N6H2M50U/rQOT61YDz9t1WScsvYqRwd8
	pAOtxjmPPyF9fOxsW5qvCFDUBzgnaQ9MCH+gh9zmQN/xqhXGEu1i0EB8S37ZCMZR+7EfTvi9YTJso
	PNEo7eQSypYjbyguw6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Md-00000005tye-2Q1L;
	Sat, 20 Sep 2025 20:39:23 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MU-00000005teT-2UUR
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:16 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-42480cb42e9so11460975ab.0
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400753; x=1759005553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lp5QAIgY+FjKQKHqRdWuauO9I56sIIxDetTr/Rl2SyY=;
        b=XWdrPjrdgF1MZv0ByT3YQ+pN3CCuVmYwz87vlebqIsFsib2L5THiiJAkdcfGvQfbF6
         ddqnm6XG0I+i+9rj1oTYxAJe+6dbdlZd+VujdfG0dmvRZcRyh8OfO63EhwsYXEgq763p
         iovKoy+PT0+58ByEj9hpt8qgefU5CIrXEbwyB14HgWyIR+S/z26iXqxoAhKq5ZpUbG4q
         7s0hXVEI8u+2v86coQdYb0nxN+5a/oA1ZBCBhme1s25wVJYss4VybheFGE6k2BleC56C
         y2uP9r8nJL1YzAY2NJw2/6ZSy7WzvuzUICi1letine7xp/DQQleXqdYcEsZcKUXka0Oq
         H4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400753; x=1759005553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lp5QAIgY+FjKQKHqRdWuauO9I56sIIxDetTr/Rl2SyY=;
        b=u4HN+RYlqHHRZEl8sDEmYEkJnnXsMdadtFnCZiVIKCPB1Zn7ReixNnBwqQRLKzwMW9
         3JBG7Bjd9Y4+550reFRWkI3sef8VcpbP8leDKaBXpg89qzKgkBuqB7LrGQsyO/b1bnvh
         SsCtm6xizsFX+SzhfdsAvZewsJdveV9Ie2zcxoeCdcK4y+r0tjncmqWkrGDby16RjItz
         7kSVfK1Vo+GxtaRkpoIR861rRud14xOX+/ExI2DXVCAiXgsMOu3us5t6QYcwY4bJ/dXV
         FSPtFbmGA5Op2DtzfT+ybx+WsHBpnX2PvBVdOgwuDOHE+rCUyfH0kT8Mzs+paG2ktj64
         fTkw==
X-Forwarded-Encrypted: i=1; AJvYcCVQpLauKB2TpHS3Uwb+YwWt76jYwhVOvcAaeBG6kXQeqR++Mpd/IK7RrUcLUw8NCDY/UlLC9e5ZROo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyu9uUVypBVtIo0XCi45az/Rq9VkQW4RYfS91pgzzgVSB8u64QL
	yJ4JOsg8iQoSQDEox89gr5zOFhsQlYDNZOUFpHLHd8ZmOTySPTQpzB3eFqX0AEjUMOc=
X-Gm-Gg: ASbGnctYrunYk5wubp28SsC+NnkrHPrUrr6SFVvOFwYq0eJklg9GH4ixCMLXMb1JpGO
	6WnrlHS0goyFTTeVKPklwp7zvzGcAaJ1c6UQvjFo3f5EE8YKKBqoO+rJrXTQ6r8gy5pTnJz3gvL
	VvtORhQjKSDW/ofOW1szjlFgBZCfLyye8CavyGqPDDSUsfDZ/yI2YTLASCB3EIS5ajthe/D+4j6
	klogzEGxO+17zVm3lMFqXHklr84ZdFDuG0fKFTmul4WMFz9Tq0Mpc47XMCqvSS/rsxW0JQgcuQC
	K7AYv/4sLFCcM7aaVT6OJl6RHADq2C8cKswZheshgxUTiAjHZJYnGMn7YYD6CbPpqzwaEiKKUZj
	k/VsVTQu+CTuxSeQMvO5vFVdGMajmNkORX/w=
X-Google-Smtp-Source: AGHT+IEGRyXKIZhBuusMIimPhPuaP1RErmgLHhjZOiDaZM931WOu2VdkPLc6h5n6dwDp6Uc98U+7Ow==
X-Received: by 2002:a05:6e02:188d:b0:423:f924:c885 with SMTP id e9e14a558f8ab-42481938b95mr127031045ab.13.1758400753481;
        Sat, 20 Sep 2025 13:39:13 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-555a288f097sm699084173.44.2025.09.20.13.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:13 -0700 (PDT)
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
Subject: [RFC PATCH v2 16/18] vfio: enable IOMMU_TYPE1 for RISC-V
Date: Sat, 20 Sep 2025 15:39:06 -0500
Message-ID: <20250920203851.2205115-36-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133914_694213_7FD8B2F5 
X-CRM114-Status: GOOD (  10.16  )
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

Enable VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/vfio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/vfio/Kconfig b/drivers/vfio/Kconfig
index ceae52fd7586..ad62205b4e45 100644
--- a/drivers/vfio/Kconfig
+++ b/drivers/vfio/Kconfig
@@ -39,7 +39,7 @@ config VFIO_GROUP
 
 config VFIO_CONTAINER
 	bool "Support for the VFIO container /dev/vfio/vfio"
-	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64)
+	select VFIO_IOMMU_TYPE1 if MMU && (X86 || S390 || ARM || ARM64 || RISCV)
 	depends on VFIO_GROUP
 	default y
 	help
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
