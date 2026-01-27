Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFEC2D2594B
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 07:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5dyEiMoIDHDaWf4k66pRVxcCKgKqLwPLIDtJt6Qyy0I=; b=baZpnDVDKQkxMp
	c5fGpOJavL4fM5vfIeF9Mf9+8c8A5tRoXeckR8GUeiNQr50vpkDKNmJYQPnCz3l7hvgrAJWOX3HwA
	4wlWTeEMYXDEVL45dPd7kfx2HHOgLioFlPNhUG4S7OmiucyoPHML2cm/Q1XMoaS7vj5HOC7SM8J+l
	51J3l9E3BCIf9vzxrv64/4AnZQAk5nqTEvopmHUYuCQibocMyPBSoP28lV/mZnrcPOAl+FUZgvzRW
	e7cfaEBrzfMAe+gqtTcUL3o4rKO0c9BkDhLc28IIuING89Kq5vRPenn0jZaa1Q1LXuj1qxbTC/YCY
	xJsIX/hjl0ObGWDjwGcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPD-0000000DluA-2d86;
	Tue, 27 Jan 2026 07:22:31 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkdPA-0000000DltE-3ajF
	for kvm-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 07:22:29 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso2052455a12.1
        for <kvm-riscv@lists.infradead.org>; Mon, 26 Jan 2026 23:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769498547; x=1770103347; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WUonCIx+ZXd3QT2hTb6eW9uVCVHoiU5hLnPWwgxhDNA=;
        b=hgdV6424zzBlxon1woUjyZKGO1hjS+l9Ef52dfB7D+kebBXB65k56VsBuYuqQDnqTx
         389zrHdzITJMSx8ZoBPUBGH3aq36jNkch8DSmjqdB79zilt7Z5tmTiFmJdiCdKhY1xZJ
         WU1y3k9huNztAHKv4KH9doW8ISkG4EGtJCORN3RF2u0YGlIFi0bvPPgouMTzTwByDJwj
         njVl3fgCnsr9d1N8+/0yNheaB0HV4zuA5OMH4MNbrdsP1k8YWluSm5ulNqMSPyqpSSgC
         1JGFRd3dMm4WBxIl8DiJvR8FmU8E5yoOIgwBvgcozUazOYyzB0ECv4Xsg/CDv7wttdLi
         eukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769498547; x=1770103347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUonCIx+ZXd3QT2hTb6eW9uVCVHoiU5hLnPWwgxhDNA=;
        b=hVpDQT0Xggtn6Okdx97BRRA70eG9VrNlzFD5eg9XKvaN3Wkuu5c4rAUrB/D/RI5QBU
         nfg1jmRW1AX2i4NSTTuJW+UYnkH7zJYPd5CuG8jrCi4IvZIOkUmhMUW2VgQMJKA+CrF7
         2f2ifIPzejjoiEvCT17Ls/DARge1Nf9fFk3Kky4VqTYqPfJzynWDKWZQesgMGH7f3aQC
         hMmjnbhNzhtmOomKUkOZHApP82RWn5Am7cLLmBTS8igtAekkI5UNCakjwIylNdTm59A+
         nZaer1Nwtgl+hqSc2P7KMo2ruh4Q1clLISUzoHm094QDftEZk4XGXGkZEJ2rmVE3VuHV
         LCmQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMfh3GaQhdBq6AnyUu+oSMd8kFG7kkuOLDA/PAh4NL6a7SJESznWAwrY8jJn3jbiiqMkbcfYqzDW4=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxRTiASipEw3m3AeZdHseCCsH8RSBLnghXrHF2TosNNmOHkoU7
	MQ+bONfTr5M6kEn1ixwVpNmfW1D3rFm+VA/6rFUVDAgfMbepkVicPrYR
X-Gm-Gg: AZuq6aLQYscZngORdNLZFLaojQ1Y8dj+zVMuih4//daOj27DCp6nOoMbjYO7wEK/rFy
	S5Lx6ivoX9bVYU2BvZYJHue3hD3H0ijiHwGNsda28wiQmrmkw4PZfcoCwIR6mZRavyEsWsORere
	9AHNq/GS6EXdLvdgWISCADDOcUohcsclLOuQnLthPhuMvxgcX81g+/irCuWAYXVB3DVfeSWrT6M
	xwCOCjF3FYgORcP7ywMn2GxnEZh8Y8z2vGjiQxe3aySrooRbW2piZ85Li1Ncltmz4M79j8yE9eW
	CiNcGf8NpR4Bg/lwhBSK7T5O/JpKfWiYAyKlEA8fDDyTTvoF8LzajjNDoown8OWumK0S202Df+e
	Z7+lHlaqd+7qb8stJPj2JoZfN147LGUAmH7oExt96iC4Tr4LJz6aRgBOEo+2yFMnvQP7QIF/AAc
	ICQu/FaCVuSyioPDu5C/gxEhQdRMCiwWXShq3PAonf6ZE/IPvWILE=
X-Received: by 2002:a17:903:2344:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a870dd56e0mr9555815ad.45.1769498547192;
        Mon, 26 Jan 2026 23:22:27 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a87842538bsm2505685ad.60.2026.01.26.23.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 23:22:26 -0800 (PST)
From: Jiakai Xu <jiakaipeanut@gmail.com>
X-Google-Original-From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_rw_attr()
Date: Tue, 27 Jan 2026 07:22:19 +0000
Message-Id: <20260127072219.3366607-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_232228_926096_D5AEE451 
X-CRM114-Status: GOOD (  12.60  )
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
kvm_riscv_aia_imsic_rw_attr(). While the function checks that the
vcpu exists, it doesn't verify that the vcpu's imsic_state has been
initialized, leading to a null pointer dereference when accessed.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff00000006
  ...
  kvm_riscv_aia_imsic_rw_attr+0x2d8/0x854 arch/riscv/kvm/aia_imsic.c:958
  aia_set_attr+0x2ee/0x1726 arch/riscv/kvm/aia_device.c:354
  kvm_device_ioctl_attr virt/kvm/kvm_main.c:4744 [inline]
  kvm_device_ioctl+0x296/0x374 virt/kvm/kvm_main.c:4761
  vfs_ioctl fs/ioctl.c:51 [inline]
  ...

The fix adds a check to return -ENODEV if imsic_state is NULL and moves 
isel assignment after imsic_state NULL check.

Fixes: 5463091a51cfaa ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_imsic.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..bd7081e70036d 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -952,8 +952,10 @@ int kvm_riscv_aia_imsic_rw_attr(struct kvm *kvm, unsigned long type,
 	if (!vcpu)
 		return -ENODEV;
 
-	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
