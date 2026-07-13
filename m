Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FC6CC43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuyUVv1mS2BvAwHL/Z2LcST+Ss/mqEBWN3dU/JvXpeM=; b=K/tPcO6PVD82r/
	PUUBVOJJH0jrrN5hteR8dNOCsIXzof9ws88Q/iUQn5unPbmEtmgTPQ6GpVRKAeswfLA12oSek1O9a
	dWFfBPQOfInwGsJ+SP6bmWAQUnEAjdiZDPZqK7K0ok4TvzleDpJqDdtMQV8GAVXDY2fuHgmaboqAU
	He3MYCLuITohwG26UVeV1NCzBS0F+RYji+4lJb/LOcoUKbS8ukEfwdEmouc2StRoprZ/xcOmtYP96
	HSgE1uC512oH5kC8ZHXEMdXJ/g6SCRgDoW6LtWGedDSRhvKbHqRJmOPnP2ON+R+pQXbdF61FtnCRT
	snCniRJo/QnQWZtOKsQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55f-00000007tol-3zZ3;
	Mon, 13 Jul 2026 01:04:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55c-00000007tis-3ChV
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:04:10 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so23187685ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904648; x=1784509448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S43bmofhuYovIEb0xvmNF2puC54J8GURvqWgfbvABiE=;
        b=MHc4zeAMyXtTLfOKRjWTYxFj/YIJ/G3PRjD2CyFv0JMxh+OLot+mcJtYswmTnWuC5T
         BoC2Z4JeyZc4s6B6mxb37lre6pB71hOnvF2w8g8TclAoOcBOfZpALEjNIFcTigOZ1x7e
         5LyF9w9ZrQSzaJiRCJnm1QmovU7CCjzGtaH4F+DGSKb9Mw1Aacb5OCmr5s0+u/3kn0/u
         BZjrAN2oDI/biDhlTyWrefnqZSxfmpE+k3k+l2cojYcF9Vj6YzCNNsv5UNj5/pjPSpmQ
         rGVX5/u9brf2DOGmaJGKr3ijBGOj4s/W4pWpysFpNlb6yS6S9pqFUKWhO3MWaRcnZrLj
         UM7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904648; x=1784509448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S43bmofhuYovIEb0xvmNF2puC54J8GURvqWgfbvABiE=;
        b=MmxfLgZwVRCjy8PiFlM7c5CmSm7ONN2ps2eufCT7HIO9AcaFCCnkVm5Vc5lMK+H687
         zxUvagy9tnzWhuu5YRCpYgrbikzDUwfVzPu4/n9L5OuodQsaluQzG4UKMIPCNSgGV9Gv
         /gIL/rWEpQMPxbx+rOjDIX0YbQWFyyR7J4ArxcJ82aCT3S41rwoijrtjTWUEVgB8Hf01
         jMa+6pttO4njdX74JOteC/HyNSv/icjq60kfklzDKgHZCZGRfxiloDxc2q8zY136+ePv
         J4oEiDK/QOgVWjzS3SpdJ64+wbqJ/k/n1IS0WpPYOhJs37WaOoTt5XJLdusYn993VxZ5
         Yqgg==
X-Forwarded-Encrypted: i=1; AHgh+RqZ8xaa0T2diZb3o7LH18dBV6Y4oselt4sMGGsJk4Pjv+akBCZTd0ByOeErGqdJyKdWRJmhz7LZSDc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFYbbg85LRpjt6QkEar218FOflf47bEV0hJBPVBhJx/KNNrEmI
	CMCkbZqksLlADVyhLWojTPOHgd5SQeZQcYwcrgku4RGr/gtrt8R5Pfl0
X-Gm-Gg: AfdE7cnaPiSw3hpCyUauNlWDkimFLYJagiyotVs2hub1ZYZZqbL3zOb4S4sDZVFHG4p
	EwFTjP44YS/VMhsgdN5w6ehlliWBmzFLvqLBgYNQnW62Uip8Hu42Jg1XePTu393WLlRrlFEsytR
	h8tGVYxzXK1iXH1H+S4rlZTxGn6/L4Jb5Nt02SKIh74TphI+iZQDHkNSX1zkUnrkeuAULopjUxt
	sVQbr3L3dH0AZB4mi//74K8S2JcNvKuERpKStNMyYUZLUXzh4HFU642668ck8KpccFEUi3IQL06
	mujQlz3bhwoKPQgx4LAV4GLGM0TkluvGCWp2Hsj2mL0hE0WrB3Wt9Uc55Fz9CcZRNgCm6PtcN2o
	/ow6rS1AEJzmsSq6bdKWxnAvTldEw3OSSevO0h47q7SEgo+GtXyXYi7/y9YEISsS8xTwvfFX1rR
	TtuCyIawY+bdM=
X-Received: by 2002:a17:903:1b23:b0:2c6:9f66:d573 with SMTP id d9443c01a7336-2ce9e7ac551mr73290545ad.2.1783904647837;
        Sun, 12 Jul 2026 18:04:07 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3d57bsm89843745ad.59.2026.07.12.18.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:04:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Andy Chiu <andybnac@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v6 7/8] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Mon, 13 Jul 2026 09:03:00 +0800
Message-ID: <20260713010302.303278-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180409_451498_9F38528F 
X-CRM114-Status: GOOD (  16.37  )
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
index 4d474a439b29..03153fd8d15f 100644
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
+		cfg->hedeleg |= BIT(EXC_SOFTWARE_CHECK);
+	else
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
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
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
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
+		cfg->hedeleg &= ~BIT(EXC_SOFTWARE_CHECK);
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
@@ -313,6 +402,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
