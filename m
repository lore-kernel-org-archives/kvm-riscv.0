Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C25C5E63CA5
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 14:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9+cYsgX3uJ+sQCXXOc6EmTigkjzk72HyFtUMWdv7My0=; b=cN90fP/9SlDuP1
	QSzXCrt9yCLxW2SGbXFfkvnXpuibNB82jkfZ+DbWvGvfONPp5sgOOyLMIUCIuSJgVikROlDeaMLLF
	Eeauwy1Gxq38DmdV8xelg4j7Ug2X3b9SDmVzn5gHIhpXQPcPbfURqwUIfUgbtmIUC8m21U7Ui+yHm
	QNnthU94T7KoyeMjDCDlRLHq3XmyiukToisjsVNCbeC7LOLm2YYisD8F413R2fWSbt4pVHBf9zIsp
	fSNHiEgb01QbJOZ2XWeQwQoaWGVSnEShxO1sSV9ySUZDcc5IFQh6QtS4amq2fV7ZOwQ0BkK5Nao63
	cIlx/HFJMgQEPRnw93OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1Bc-0000000BF4e-2Bmo;
	Sun, 25 Jan 2026 14:33:56 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1BZ-0000000BF3p-14nX
	for kvm-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 14:33:55 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-352f60d6c2fso2530369a91.1
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 06:33:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769351632; x=1769956432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vrpTgp19j2v2S0F0+kVV2ZQQrhahMGVY6XxldYPxCk=;
        b=M36DMzpgS8VMhkmkGE+oJO1r4hWtRJlehJLY3ayv5cEOo0TbGoC6d6csrqjNxVb8qt
         BJphDfTi9yQu3VFJW/munZgyJR6LHOiqSDS3y50qZAF/tzsxN/XkgEBDtSoOy2MJHblH
         8iLiRwhmrIxVMV8wmEKpBdCESDkL6tKYazZtsFZmbZOFMJgykCtOAOSyFqdYSh50js8U
         xRqYyhlMRJqA4cpbbdi01tA41ZJR5UgYacPJj6Rkai82U/pw93lh7e5Gz8gdbrNtzjFf
         cvP5sIInVR11s8cK11SXzXVZ/sYuKs9FFc1T2yEumVS5fO2ipOovAZdtAQPJN+tasVbQ
         WAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769351632; x=1769956432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9vrpTgp19j2v2S0F0+kVV2ZQQrhahMGVY6XxldYPxCk=;
        b=CkiwuJ6Qf5ctjQMaBXScv+EsdLoBllh048LYKRp65pBhQU92pyDw5p69z0Nywqe6uD
         gqS+UTVtw7aL1iYvrBgNF5ynvWD6XL6otrznS+9J+RG/vP3uxat1+PtvFrlBjiFy1dg9
         m6vQDtcqMYwQLMhyQYPFGyd5SDlf8Wf75fUAqxFGhV4eilVhHnTrA/WuAChD3yoKtNVi
         QVsN8crnkHHvz9BuPP0eBy4xtWG6hnn3/hxrMnqwYi2y9eN4xWfi6581OscuQXua3/0J
         RsYrAr4U0lmM5ZaDN1Po8tdLboZdua2m+R8DVzRqEuOPV5P9SAGdjnnZK9BKN3ADMfjw
         D6qQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeThJstrI3Fa1YGn0IgZtQErKYJamBEQCoxPyVjJv5zvNgkn0eu3R73S2Y2xdFUxOsweRL0hQS1WE=@lists.infradead.org
X-Gm-Message-State: AOJu0YyB81EB2pUeEz0XoXfw/wT4LG23ZIO75U9xQO+X9mEUlYMj9KlF
	hvQSOc2tn0Dk0w+OFXsZu9q0RVOtijs7YADdFykoT4X0ZSaYs/fLJ7ZMuhWn1MSRlzk=
X-Gm-Gg: AZuq6aL/UV7TTaPi7bWPlEOKIAGuy94jkKv3Tqse7+iGR6ZY0CyvgwdnSoDjymaVv7L
	ReZT307IBmWRLIOaHJNc4vAlQtaRP1OkygTqy4/+gIZX9l3OHOz2BSJRpAvi3sNdXJBBJghqxp0
	HSFD++Iul361jjlEYC+pF2jt8axMcdh26PXpqyS0ztPC0Pl8b/0Q+PULOFMKZiRFyODSfVtiK2s
	/saFtm9RdqDNbeBvQ4x4c2fjAQuDEiE8lR2vCpK25E8BI9yXY+bpt2oPTu89ofUPfldZEEjwW7I
	yePIWSAwZB2NP+eAuVff06NslU8QOIzKp6n3eZ9PsRGAqdzvJzqOCNI9eVVhWIZZapS4M7GWaYv
	RjTaeQL5LpwVbVADrfzvD0fSv0N82gGKBylFTx80J/TvDQE2PWdr0eNAOeatIX8owEi0AyJR+YW
	sJGdKzRoCcehNxRGacTuyjDb7918/RiO9oUJaTSl+ZQ0M4YYecwks=
X-Received: by 2002:a17:90b:3d12:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-353c418d276mr1450186a91.37.1769351631814;
        Sun, 25 Jan 2026 06:33:51 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353354a6b06sm9351073a91.10.2026.01.25.06.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 06:33:51 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH v4] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
Date: Sun, 25 Jan 2026 14:33:44 +0000
Message-Id: <20260125143344.2515451-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_063353_301196_4B201902 
X-CRM114-Status: GOOD (  12.78  )
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

Add a null pointer check for imsic_state before dereferencing it in
kvm_riscv_aia_imsic_has_attr(). While the function checks that the
vcpu exists, it doesn't verify that the vcpu's imsic_state has been
initialized, leading to a null pointer dereference when accessed.

This issue was discovered during fuzzing of RISC-V KVM code. The
crash occurs when userspace calls KVM_HAS_DEVICE_ATTR ioctl on an
AIA IMSIC device before the IMSIC state has been fully initialized
for a vcpu.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff00000001
  ...
  epc : kvm_riscv_aia_imsic_has_attr+0x464/0x50e
  arch/riscv/kvm/aia_imsic.c:998
  ...
  kvm_riscv_aia_imsic_has_attr+0x464/0x50e arch/riscv/kvm/aia_imsic.c:998
  aia_has_attr+0x128/0x2bc arch/riscv/kvm/aia_device.c:471
  kvm_device_ioctl_attr virt/kvm/kvm_main.c:4722 [inline]
  kvm_device_ioctl+0x296/0x374 virt/kvm/kvm_main.c:4739
  ...

The fix adds a check to return -ENODEV if imsic_state is NULL, which
is consistent with other error handling in the function and prevents
the null pointer dereference.

Fixes: 5463091a51cf ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
V3 -> V4: Fix typo in Signed-off-by email address.
V2 -> V3: Moved isel assignment after imsic_state NULL check.
          Placed patch version history after '---' separator.
          Added parentheses to function name in subject.
V1 -> V2: Added Fixes tag and drop external link as suggested.

 arch/riscv/kvm/aia_imsic.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..cd070d83663a9 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -993,8 +993,11 @@ int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
 	if (!vcpu)
 		return -ENODEV;
 
-	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	return imsic_mrif_isel_check(imsic->nr_eix, isel);
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
