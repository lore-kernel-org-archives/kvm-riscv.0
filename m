Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFC6E63C94
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 08:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7epSV+56fLZQRUmWicu6DV8Ui5ZeF1ybjQSA3sg6Vxw=; b=IfkYk9GdIoIovp
	QC9QrQw2StoXhe6vnuCjIr7e4rEWWsvXYmeaJiA9sShBydpYvOu+WNJSywcXvwx3BFoRTMXySgSXq
	dz6nkV6RzfE8QDUxi1HvhC7C1ZC8tLmj7+ZEJNhk2fnzI+JRIb2CYShIqE4mCakQMDd8jy37co4d3
	YeQRLAXO9k0VIe96pwVO4+FLAp8iJpWTRYFMUmRiR2mm4Hc+0LOfmfPxgcrBImHPlrgbcwZjITyJl
	hcDRaJYbMYanB9WdQtP8cstr7P0ppCYIPG1eC0kYZQ27i5a2JozbKgwEOsMPxKqQKmpR9v8MQvW6O
	uGvg5D8tDzSs57arAa9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjvqr-0000000AztX-2C9G;
	Sun, 25 Jan 2026 08:52:09 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjvqo-0000000AzsY-1dJr
	for kvm-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 08:52:07 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82318b640beso1113940b3a.0
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 00:52:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769331125; x=1769935925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iT5OFvQeF8zMVf/PxrofZtaIbAS6SSbifWcBi3L0Yu0=;
        b=Uea9oIK8ZV5AHlSWeCY82Xu76MJ8mSYfDK9F8dvod+yn60vhpVLOuYlJWWksNv2sOt
         PIwd/l2nU2AIkztlwSYXcqj84ScDxHh3v1UzQl4UNpnEsssi4+B4o3O7DdkORlTkLSm4
         upjuYkyB/uhmhTJFosN9bLdsrF7+Gga3vk12a1w4froNnrSnUkcSSmNYCVhwgeaPr1sD
         ejF9g2tQKlBFdeGPbR3L4xZXg4GU92Z04d4Yub9JkcWHgRbniiYlhzDaSRb6ZZWHAg2I
         +WUyzPOPyml4WgHt/3BBy3vy/PRhRX1ARKOEwIpcYjqeJDjnLv2CngEbtN45awZDcmtd
         lKZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769331125; x=1769935925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iT5OFvQeF8zMVf/PxrofZtaIbAS6SSbifWcBi3L0Yu0=;
        b=eF1U7nvDplAmD7Y/3LHGG4qfcjq4QirSKqw9yGjUmTqWA/qmhJchduwA2nFrF+ERxO
         Om3ux80MnshUJ2V1P5qo1XlGTinT2LLQgK7wPd0JuUUP7n+X/aPgUVpdqgjIBq00bChW
         AfeIHP2MZlSEQmgiPxVjUF76kudeMIYAVKAot9div3/Orz6jV3S3KNhafaKs+goheMUQ
         Moce2HOnS3yJkm49hYSzwv0zNNI08SvrqYTA6+szilZ6ShwWYh/RjtyhtfiP+OiUxnk2
         G3W2upjUgq/luxsy59mI5geyzKjhao27OGfWYGgScUBzRkIc0ylkIx5aYdSb/sQswETi
         ZBLA==
X-Forwarded-Encrypted: i=1; AJvYcCV6JGO8Q7O3txAygNv6cHt/t7FYMsdZWe5Iqv4orLYpqyF+QEt0P8r+HCRAs71CS3TTEhtZx0e5wxs=@lists.infradead.org
X-Gm-Message-State: AOJu0YxXcIEir4b2B5ALtzzPZPo338toqsGC06goTYHFF4lu2RjpUQiP
	vUx0sAebefipamwEvA1Slnl7wkmfTaxMPbV4q1+bel3Z4eBmVf4llLDY
X-Gm-Gg: AZuq6aI3M73GlIhIwVn/iCXNvjT+FaFg4duwC0/1ONHvb/YRd6LB3vhGjENK6CUoNd2
	17QWndbg88GlhahC5EWrKsIhTT5HUHTM1Kt4v/7Zu11XL4wC2keWOS9HSRy6ER3xmJaPTjmWh3D
	NTLQ30N0PxNkCAT3nkDjStCfX7B9GJz9hFX8zHeihNkbfNk3N/mrtoHGO5w4Aw7osca5wl0onam
	z5TuC1bmvo388RqIhl87n/UZ2khg47dpayOz6226CseZvnSbxpCHc+aYgh/ZIiUyht2DuS9FcrI
	k5Iy0+IAa6Iq5yG+Ls3W0+9vzEzvJ68NboiM3TRkyRTVBhVZNsnk+CulnKWoMsaBHgGtVAWxgtU
	Uc/U5ZFc/deUJPlTAERcaYNUNXGrat5cCf/XFymeQgrvmlmRoV4e5icEfS22tvXIBU+9ruCbKql
	7n5bNFK0dBE5piEpPCla7CaQhEr2K+t6gbvlW9MbwdZ6JgouNiiyM=
X-Received: by 2002:a05:6a00:3d48:b0:81f:44bb:8aa with SMTP id d2e1a72fcca58-823411dba60mr877844b3a.8.1769331125018;
        Sun, 25 Jan 2026 00:52:05 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8231876e5d0sm6442072b3a.61.2026.01.25.00.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 00:52:04 -0800 (PST)
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
	Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: [PATCH v2] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr
Date: Sun, 25 Jan 2026 08:51:57 +0000
Message-Id: <20260125085157.2462296-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_005206_437142_1922E56C 
X-CRM114-Status: GOOD (  10.78  )
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

v2: add Fixes tag and drop external link as suggested.

Fixes: 5463091a51cf ("RISC-V: KVM: Expose IMSIC registers as attributes of AIA irqchip")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/aia_imsic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..9c58a66068447 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -995,6 +995,9 @@ int kvm_riscv_aia_imsic_has_attr(struct kvm *kvm, unsigned long type)
 
 	isel = KVM_DEV_RISCV_AIA_IMSIC_GET_ISEL(type);
 	imsic = vcpu->arch.aia_context.imsic_state;
+	if (!imsic)
+		return -ENODEV;
+
 	return imsic_mrif_isel_check(imsic->nr_eix, isel);
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
