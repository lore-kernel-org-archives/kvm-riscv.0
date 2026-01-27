Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7A73CA6C9D
	for <kvm-riscv@archiver.kernel.org>; Tue, 27 Jan 2026 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qRj2F54ZAhAVe0iNRcAIjXJ0hNaqg4cssJ6eejDPkMc=; b=Mt4C9V0kdRxtdu
	oUIdkEz2lvdEOczPNtmET0o9lda844qKSZbELJCQoIjER+WmrLxl5wk6FKO5UOuz9LSxynE9sEeOG
	3swIUauZ2V9TjpcJkQAbQTKy+l4IWI+ZD7HWBU0Pe7MlHn7hueZlmsJ9DR7pkVM//cKUbPjqzJxb4
	6YsIgYAN7DDed/gRCNKb3elpYr6bW0WThAm3dWTkL++Go+fgAeJB+k8PLzHvPRjrUM+VZOZtmPBiQ
	KduMrD41SSk3P5+Jtr/pFiwQvtKpV3JUEq5AZcgS3ZzhM54CXfg8iToeD6/Sc/CSNDPK6VIxNiAsQ
	MiNI90CirhEz5nXl5qZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkeg0-0000000Dqzz-14Xj;
	Tue, 27 Jan 2026 08:43:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkefx-0000000DqzH-3guA
	for kvm-riscv@lists.infradead.org;
	Tue, 27 Jan 2026 08:43:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2a7bced39cfso59657195ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 27 Jan 2026 00:43:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769503433; x=1770108233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IsvMU6ygmVPOfBtUBm6r4nNfbsjDFVMoFcdeUelLuBA=;
        b=aoFH5Hi0NoDFrFQqg7EjvAy1AuipN/i0ocEGAmwn5yG4GFQ+fxarVo6LMh9aceLhd1
         999+fYlfTMhpWGBeGaDcMEMmKc1YyXXR/rV/dZ+ROBJKwW5UUVeWmcR7ZJ1N1NFU6X7Q
         lIE66SNeistSnUHAhzP9VjVwcYtKecz1p5SQP8WSwpUvBZ3ulB+RGp0LxMuxiMmYaGN6
         w27N22mwLEpQcENh4a8kivfifvsm0skK2VpCJ4UvWtzMlX0ciXfMI36abtn2zL1LwClg
         hetyDMxyWz/6E1T4m0JNEa39r6WOYpt2iGePQc8W+VyT859H9L/6VP7kh7YJBTRbm0dt
         6U6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769503433; x=1770108233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IsvMU6ygmVPOfBtUBm6r4nNfbsjDFVMoFcdeUelLuBA=;
        b=F2Rf6ldMt9n77tyB6DjuyX3VTQhHV0JLNTNvE1h2MCHfeU2TdEav5kEsl3nlhjTv09
         mXKN+RaaNzjykZuKNFnofHco3Vr+A2zBZLXC4otrBqdrVB1XWDqqWPSNzGyjkoTYJEws
         SWpKX2O00ALKnXYI2SsMVvlvvAYJJxMOiskI+4b+ydaA0kbc1DgacbeKcITlmEIB+O/q
         P4Gy8xV8diDfK9kz5rfL4/JgFujbm8fpP4b97iZUiF2wMQDMWkK9aaoZM8XdDo7taSKz
         N+qN9I3+JPSD6gnoXOCKrOaS7ZoBm70TAjuQnZ1Z3lxyKQJbEWddhGclwNhIBh2QnidX
         ELZA==
X-Forwarded-Encrypted: i=1; AJvYcCVrK11JeUbekiReXRmjIG/380cvWXsrpOnEsGDxJeVP+FSxANMOHu4iFnWqSWK4KiSuw3LL2cZblMo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7P2VY/WliATyB/TUSgsHW1dxGZ4sZW9PxKOHIiqiy8mJXXbAO
	9Aoi8Pu+Aq1Q60vAkcDgTWzhsMx9+7AocQHCED2xwLlp1wXNLG67ivjR
X-Gm-Gg: AZuq6aJH88vMuLdq4prQ8SZIyoBe3qPYTowBjl4LVIdwFoI3cy4Zsw7UQ4TuGuEurp/
	OKc0rcPipgmHuvvsk0evbi6B+UpOURDc5Gz4kaVcT9mXHUzaRCYsNR8+tQE74qZseAmJmSufM95
	Q4HtS4DxkDtcppBjBSikIPbK63P9NoFHF2sCr1X5YV17oFw0dO3GWnJJEcZV4DcIC5EQ7qMZlTt
	MTmYvoa34cixfE+/HHoZ0ov0GDQtkFK1tnCseLQKf4MtDquNGVuaGwjx3DnHcYdM9u6yafZgZXf
	KtnMZ6+wSfHgxLFI8YlAlNG4gydne3HIkM6ciCQ9SAH+hhjbgJ28+oPrqj9hkzFMON3QgjYCzKD
	/yW7kdCsus6+eXdRoBM/J4aXUAFwh0spaEeGmXjH3PlOYkeGYRmiUkpBUclpjPYt9VQH1EhfxGz
	jQwHqJg7upwuj4FXuNYl/ZyTOYH9rWWsMzdwqBVPAy
X-Received: by 2002:a17:903:2c6:b0:24b:270e:56c7 with SMTP id d9443c01a7336-2a870d7a907mr11402265ad.7.1769503432479;
        Tue, 27 Jan 2026 00:43:52 -0800 (PST)
Received: from fric.. ([210.73.43.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802de5cf8sm108838235ad.42.2026.01.27.00.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 00:43:52 -0800 (PST)
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
Subject: [PATCH] RISC-V: KVM: Skip IMSIC update if vCPU IMSIC state is not initialized
Date: Tue, 27 Jan 2026 08:43:13 +0000
Message-Id: <20260127084313.3496485-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_004353_947170_012DE4A1 
X-CRM114-Status: GOOD (  11.64  )
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

kvm_riscv_vcpu_aia_imsic_update() assumes that the vCPU IMSIC state has
already been initialized and unconditionally accesses imsic->vsfile_lock.
However, in fuzzed ioctl sequences, the AIA device may be initialized at
the VM level while the per-vCPU IMSIC state is still NULL.

This leads to invalid access when entering the vCPU run loop before
IMSIC initialization has completed.

The crash manifests as:
  Unable to handle kernel paging request at virtual address
  dfffffff00000006
  ...
  kvm_riscv_vcpu_aia_imsic_update arch/riscv/kvm/aia_imsic.c:801
  kvm_riscv_vcpu_aia_update arch/riscv/kvm/aia_device.c:493
  kvm_arch_vcpu_ioctl_run arch/riscv/kvm/vcpu.c:927
  ...

Add a guard to skip the IMSIC update path when imsic_state is NULL. This
allows the vCPU run loop to continue safely.

This issue was discovered during fuzzing of RISC-V KVM code.

Fixes: db8b7e97d6137a ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/aia_imsic.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index e597e86491c3b..a7d387e280d49 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -797,6 +797,10 @@ int kvm_riscv_vcpu_aia_imsic_update(struct kvm_vcpu *vcpu)
 	if (kvm->arch.aia.mode == KVM_DEV_RISCV_AIA_MODE_EMUL)
 		return 1;
 
+	/* IMSIC vCPU state may not be initialized yet */
+	if (!imsic)
+		return 1;
+
 	/* Read old IMSIC VS-file details */
 	read_lock_irqsave(&imsic->vsfile_lock, flags);
 	old_vsfile_hgei = imsic->vsfile_hgei;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
