Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E3A1C44500
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xzs6UrKNNDY9ajbApmcJppd2AbTjM4meT+GJnvI2SPw=; b=BJJWlaAH4gV3TQ
	1hX4Az/fIYUyAip4m5qdJoDyloT9YY2h/056xIg/da9BMS+j3GFrfqIe+6cVNLRQ5iqRmlr0dNlAr
	zLEct4AZ2c4v5/O83VDim4gwwx6cjnAcnloD1dZ10VicuNcXJ3yHNWDuQClRMaJ5y2yn5uHzuVOx+
	RXPMz1jvC84sb8KIt9oWpeqMCQ3xUc3PLseXabhqNe5mb4ZoHgmcTggxF8/mr8wCMulZVd7yoJ+wh
	WGR9VJaN1AGGVkVRmwiQ6Z6atL1He4RDYh7J2oCBp5E9TJ7UWrp++ZX9h+adjrnDTYo4/yyd/r7cB
	JMkSjV50rSPviqqIGTpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNT-00000000V1l-1VKj;
	Wed, 01 Jul 2026 02:08:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNO-00000000Uuj-0Icy
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:35 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2c9dbd00f1dso773435ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871713; x=1783476513; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xNDnGLVvnD4tmjeYRO+s6FPAGzn4En+qXlh/M6ZOC2c=;
        b=aQZJjMlMiwymvn93h1mjkPNWPSNwjkhy6SOezrZkUpUbKgvqiho6xuUghfN53ehafZ
         OUHTfPHHMVV1qtIzx3Thzt2NuMtf1GaEnJVULvwLnckZogWBufCkIhMjIvX2DfsA4Mgv
         T35D20bKQ8U8otn/hWpdayDCZwvLoueTy5lWMdbfZyFhA6ziglCAO1lke/qd2iWPAh8K
         uFOC58BDR+8cbNx/z3GC6FbUKjbHWixwW8nFSe6YZGFAeCa+h8KUyhH6CkhmL73C3YIg
         YEE2wjCiTIj2ZNKGrn87FxO4P/FmA8iZTm12kiQ/PhIzLzhzbYhqkt78S/OVam/xFHri
         4gLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871713; x=1783476513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xNDnGLVvnD4tmjeYRO+s6FPAGzn4En+qXlh/M6ZOC2c=;
        b=IYBdf7regmhlmrV+YIT3nj4AHzIEJEMf9jBzTNyLQQ1Mw+guEOvX8WX0WDnQIgPAqr
         rtIahNcDSVyX/qXTAx47ZjY2RgxGr2JtsrJKUecRSWvbE4ySi/pWkdvVXOLmJxuFu3Bs
         oe2YEuquuVDKHS/TaMV/qltKbyJrvYmZ3y73zZnErLM52fo8Dn1hJ3aTlbqgciK9fU2p
         7ajdnDOKrUD3U7Z3EDjl2qMidfLAXn1rqzeaiiufDJsaBz1462d6MxB/8ALv0CoUcuv9
         4QTwA22Ui7vGwd6Fc+dxWAGNR+50Dm4jIZw8HpABrYuDk8bbumvHcVnlRazjnF/Sep+p
         CCFw==
X-Forwarded-Encrypted: i=1; AFNElJ+cyZARrDwaox/bhY2WDDE7XT9JSsD19nhMVIdDPzXbJA6mg1FV6oibM3gmuHSvjYfxpbOWe7TcIvQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxxkbtZOiSKxBc7C+8s2wvVug8gH30Hst8G2Z/LsmCLDxWxkeE
	8P79EATl6YdK5ypqtdMMkJ7ofY2YlGda8iG+GIJuvB8IHdWYGe/QMCM/
X-Gm-Gg: AfdE7clNMlGOgQNRR/D26qSsHdXVul2cVd8i9xGbrlHBvy6dGiZQce7r5XtqJImrTQ8
	iwrfXRhmxON2JrWhxkopBT9SLBzi5JzZ+vkJVtBp+3eNV+nVks5d0BqhWJkrXRNUpNeYn4LL9bq
	dTD+D/iKFBa1f2RXKyvXm1rtrt9poy1gERXNWBnhs22geLI2dBun1jyAjq2d8HFnv/EVUyXJJIu
	OUDRvYmEKvQcu7RZ1cLICoHBUGX3k40Md+UK5p/fjfyM6fJWwCmONC0ei+Vhik/ubDL0E0foU48
	Lh83vlhRliytTGYx6dkJS/8xZd3dDWgCGJ/Cam0dn4X7riMiH0ICdQfKbjxahUfM+NSzglhH/sq
	erkoN5sTXdHu/fKg5lCQny5erMHPWct+RN7S5/dVeQsbzLOxQEJQgIgqOX2wux19u7/KjtI+sXr
	GCd/HR/3ZL84uQCj28jEJZTw==
X-Received: by 2002:a17:902:e806:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2ca5a55b720mr28253325ad.6.1782871713354;
        Tue, 30 Jun 2026 19:08:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382a3863sm22650065ad.57.2026.06.30.19.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:33 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Thomas Huth <thuth@redhat.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andy Chiu <andybnac@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v4 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Wed,  1 Jul 2026 10:07:44 +0800
Message-ID: <20260701020746.170157-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190834_270630_FA9A386A 
X-CRM114-Status: GOOD (  16.44  )
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

Control-flow integrity is controlled through a WARL field in henvcfg.
Expose the feature only if the Zicfilp/Zicfiss is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |   2 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 107 ++++++++++++++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index fd4c81697617..20d9959ca44f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -248,6 +248,8 @@ struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
 	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
+	struct kvm_riscv_sbi_fwft_feature landing_pad;
+	struct kvm_riscv_sbi_fwft_feature shadow_stack;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 7192c229a19e..cb9b9721ec88 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -176,6 +176,95 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static long kvm_sbi_fwft_set_cfi(struct kvm_vcpu *vcpu,
+				 struct kvm_sbi_fwft_config *conf,
+				 bool one_reg_access, unsigned long value,
+				 u64 flag)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	if (value == 0)
+		cfg->henvcfg &= ~flag;
+	else if (value == 1)
+		cfg->henvcfg |= flag;
+	else
+		return SBI_ERR_INVALID_PARAM;
+
+	if (cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE))
+		cfg->hedeleg |= EXC_SOFTWARE_CHECK;
+	else
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+
+	if (!one_reg_access) {
+		csr_write(CSR_HEDELEG, cfg->hedeleg);
+		/*
+		 * Both Bit LPE and SSE are in the lower part, so it is safe
+		 * to only write the henvcfg
+		 */
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+}
+
+static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+}
+
+static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_get_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
+}
+
+static bool kvm_sbi_fwft_shadow_stack_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFISS);
+}
+
+static void kvm_sbi_fwft_reset_shadow_stack(struct kvm_vcpu *vcpu)
+{
+	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
+
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
+	if ((cfg->henvcfg & (ENVCFG_LPE | ENVCFG_SSE)) == 0)
+		cfg->hedeleg &= ~EXC_SOFTWARE_CHECK;
+}
+
+static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_set_cfi(vcpu, conf, one_reg_access, value, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_get_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
+}
+
 static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
 {
 	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
@@ -312,6 +401,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_LANDING_PAD,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, landing_pad.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_landing_pad_supported,
+		.reset = kvm_sbi_fwft_reset_landing_pad,
+		.set = kvm_sbi_fwft_set_landing_pad,
+		.get = kvm_sbi_fwft_get_landing_pad,
+	},
+	{
+		.id = SBI_FWFT_SHADOW_STACK,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, shadow_stack.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_shadow_stack_supported,
+		.reset = kvm_sbi_fwft_reset_shadow_stack,
+		.set = kvm_sbi_fwft_set_shadow_stack,
+		.get = kvm_sbi_fwft_get_shadow_stack,
+	},
 	{
 		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
 		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
