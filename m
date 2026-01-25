Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41279E63CA0
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 11:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=opBuTtspaBeVBOfWGBpmXgTX3EUUMbVQ8n7oKkqBHBk=; b=jW88Su5ldF4Cpn
	t8xEptShfu58aQut3WzVzNVY5mHTl9CQjrxQF8eY7CRIVUhLEdbG5n7xoHWr73DMihsjbnXu33b8t
	mX6F5+fCSb78kg2ytVyusYcK6MRtj5CqtFNx0qjBg++Pzk2MRCSxv0XwY5r0fx8Yrmyew37OAaXVO
	onW6WJQtLmC29O2xBC82uhF2XvndZ9l0egAF5hDhijtWfD0ENxJMmQiy71WaTQq7dh3eVM0GkX6r6
	lX/nQkUqw0WIbi+cAHTnC1Dl30fO2kKBSQoa/sc9TAYazSgOPpJpHF4dQtT07uvijPuPSc5tSqNdr
	3WDktONigZgo0/p+3r+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjykr-0000000B914-35mo;
	Sun, 25 Jan 2026 11:58:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjyko-0000000B90K-3zeN
	for kvm-riscv@lists.infradead.org;
	Sun, 25 Jan 2026 11:58:08 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a7786d7895so23525565ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 25 Jan 2026 03:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769342286; x=1769947086; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zGmrDbJpv9Mnf4OlN/zRFu5G/nsgDAKHAOEKObolTbA=;
        b=jijKmZ8jE6jKNhflj3M2bYvBzJKm6wr1is16OSeOVByFFn8owX8SnMkCLmQ0L8waWz
         miskhfB8KKwaXHGIhJQ61RvzwZrN1R1FjQfYmNKdBmbllsrcmB8+5XHea0OJI3GDWMjz
         6ImTio9sZBpHBsgD/aeOlKBEI1SMC+5fuk8cGGi05Iryel1S0bt7vWOmvEAGNEWr0ECq
         aOpm0mWV7d4IX4bCUOhhwGLKrN8oX4NqTG/sRXJPu/l6QuOL/yF8OQZk6+6B49t36HYw
         sCQAUpJycnT9pyXkJs/YrT9eK4Mavqyd1qkfwQDPk1dM59zUDk9h7jcXsyzKKd5MgpvQ
         t/wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769342286; x=1769947086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zGmrDbJpv9Mnf4OlN/zRFu5G/nsgDAKHAOEKObolTbA=;
        b=Mwwho0KouwvikLx+rPo+5YHTBt279nxaEQIrZ98elo7fS5FoxYY12VJYuMK3DLFeXD
         omNntpDHkFLuHlnDy24bSLy4lnxNERW6FH+Bj6lKTuNlQC9m8GB1kpixtmh3gDG+Dhp9
         eZ3HtcmESU825HfGhjkXHRVusZ4PfBtqNMl5/gEZXZIUdkY6+R0cIITu2GkFe06TbEcl
         jgBuknze9wfomYaROOfoeFliAy/mZl8WIgjfnAdjpGQQTS3K8t5twO84wI/ImuHzJrZt
         rWXjnsf85uSrCNRrZzLbONNhFMt7C8uXQxZ0qTC6EMYgJtP9zv5zXZstYQVQ4IIlvVEX
         Axvg==
X-Forwarded-Encrypted: i=1; AJvYcCUTCn3Hx9CoKbZwEQEG1ZP6jZ2fNeHDfNfsiMH3p9uoYh+VzAclhwU7ouxEMSZJtq60K8GZJkc5K9s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsjnY87AE6aKoKLZS4iUwQWTqWCuNtKv2OoeId9Bli7jjvUOOJ
	ZXy0NUuJyConnVXDGShE1irZHkXO1/VqjbfabuJop9w85YGJZCXd8C7q
X-Gm-Gg: AZuq6aLeaqGvvzi96esoC7MyjqBWAf0g3UbJOMRSDs0pRcjLvmul+YOmEHyHLCgij2d
	62SDwIJ9bGKH6f6xhr6aDF3OZmBv9RIn1PIbq30wm62sq+dYJVHdnBdOgYKg1rE8eXQX5Ovv98z
	DUiXLdsfGTT3P8/GLIUJ8NnEapxwbxsvgZN15J//dy+3cgzNnArlVZWbFG0HS1iNJm8if7Ns6yg
	f8B49YZ/hA+MlN+O4K62VAUh11a1K+Ft7cmbXuYsG6DuWxBDAK+ov7S9e7gtvydylfNv9zbBEPh
	mBCAYYWkyVHqgzh8OjsW7HikRjnXsvjLRW7rJsa4XSsGdxiZstFILQJUPh3eyg/C3xPwjfMHtx3
	lzKlay+IuyYky1KL942BXe2ZGjWnX9zotNDRj9oAJ8UoMcVRyV+S8YjB0wVPTYrsh3KdY5j2+C3
	ZcFFnlD949trT8BYBaR6OKjhh+SPtom2XWcbB2bJGSvSNzXWP9nAE=
X-Received: by 2002:a17:902:ce8e:b0:295:9e4e:4090 with SMTP id d9443c01a7336-2a845307823mr12548625ad.52.1769342285789;
        Sun, 25 Jan 2026 03:58:05 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa675sm66792385ad.15.2026.01.25.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 03:58:05 -0800 (PST)
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
	Jiakai Xu <jiakaiPeanut@gamil.com>
Subject: [PATCH v3] RISC-V: KVM: Fix null pointer dereference in kvm_riscv_aia_imsic_has_attr()
Date: Sun, 25 Jan 2026 11:57:58 +0000
Message-Id: <20260125115758.2486687-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_035807_036257_F2A32DAE 
X-CRM114-Status: GOOD (  12.58  )
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
Signed-off-by: Jiakai Xu <jiakaiPeanut@gamil.com>
---
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
