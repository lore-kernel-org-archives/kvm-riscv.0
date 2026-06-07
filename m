Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA75CD8C8C
	for <kvm-riscv@archiver.kernel.org>; Sun,  7 Jun 2026 08:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GHTEUbwDraY8Lvg2K5Gx/6tzDFYwIUNfEVG8YIB8TUY=; b=ntPEQ3W/QwmjqK
	Ld6OfRq66hm6wXRSIpb9NBvjWiL2zO3v9zSHaCp5/0lP2+9NZdUtk5yvMvQnxwSiIg8bg82FyrHL0
	NqeZ1I6QP22Fqqn66xxKZg9vjBQgVCcI0ydzc8QWNX2JoC1m/bB54hmPFt0zsesny2TGqr/8XhngZ
	nQrGs4jSag9lmZTATn17P/HLljP+dOzJA6vhxlHwr8yRi61J2SA4ebK2qvEptvYUJ3Qa2hLp2/qpo
	wZ5YgbiTxCS9IPx6a9U/AHTlKuc9f5IW0chCkkTrV563hUbVuHUz2rsjyOOn1aQON7yj2XYYTSfGW
	5GK7rtYrP+jDgY+fpXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bL-000000027FD-2wWm;
	Sun, 07 Jun 2026 08:11:23 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW8bI-000000027Cz-2ADj
	for kvm-riscv@lists.infradead.org;
	Sun, 07 Jun 2026 08:11:22 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2c0c2a68d01so22349675ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 07 Jun 2026 01:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780819879; x=1781424679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mxlUMIwlGQesl8B7Mf1wKdsN0uUMSbOOYMToVqO4zKQ=;
        b=Awinzv8vcTUyRsBdofboJyZbRqhgL8w6CeJYVOWlZzTedhps/8FjUOpoje2YP6PAzs
         aPR1kjWswaNNhTAlod7H3UgVwrlK0ivy1/nWqqbx9A1Y32oZGep7QU5IfHUb6P48gLC/
         sbQ7mNW66vRb6tsgRVz+M4ibGswkt8qQEllNlSUv/Iz1S2j98ToRcDUdDl0ughuqdj2/
         3WmOHJCusbmDxcvK1CzhUqFBaZiuCkCO5wuwbZDtx7AjRNsh3/bR+6xnxaHgwwlvPwXW
         zs3bAk6E1C7gerdJyG8L4OlU8h4EImf3ud0TjK2MMFXWaHvOEm12+bH++UxQnKAl+C4o
         JkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780819879; x=1781424679;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mxlUMIwlGQesl8B7Mf1wKdsN0uUMSbOOYMToVqO4zKQ=;
        b=g5n+sMk1jn9+/AIQerRc2rD7K6iEmwpQ8/km6nPvfnxX4T41aZ0DQHK3p/6WwUNkCP
         t0T8E2qAyysg82ZZhD6hlKRAaQHEVWnLqzmlFAf66C4JWn6nnIbPJ+BcDYKMkYZwUjN1
         ZH409/E+b5ADKBlH4Q83pZLHuVx9Tha2DwNCeaDa5Dp/qMmu7Cu1BIkLEzlytXuDJeq0
         95cBMSS+o3+cLAf2OKTu27Zv2XWpD/AfO/LGT1tPytB1xjHxkdo0ZXBEyEl1vp7jdFHn
         sAcHBHeWzZmf5syxqDzhmntErE2K5W9K5IsTEhh10l5betPphcpAA1L02HOU+aXa9yaJ
         MnBg==
X-Forwarded-Encrypted: i=1; AFNElJ+i5KbblbzlftfiQYSCfUpkhjPPLRmyl/qcIb0/YJCzM1U8iwIJcBPIaMmcrJqER4icBmhp6ENVEJk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRCDS9M4Qda5VYZuisdg6zpNgDYtlm3wvUu6hlB1a2sAQTrHPz
	CYdkrZBUjqxvgRPcb/0wrpC8motUb8vUrF2RLJnd1DCxJDt65vppZa4T
X-Gm-Gg: Acq92OEN+GYV2c43rVyPcbbJIN1ewXEezOfReCVkIWn/YjfnynlzGJTnEZaq1V9dvFq
	ypU1VDryCAqPNaU+qssyEFhAUJ4XlaGn0Fbf1LUTeK+DWVHuxD0JgjekwviiSUF74fU7VcbJtW0
	2PDkSugMC1Hvi1Ditm3WSg21h6ha7/RjErX6Fx2dBsk/szkAhOyogMqZD2ukUoZic1sOf1JpSRJ
	VVvBzKFpJdT9ra9YB9Cyte76rROlvZD0FnS6ht+UgaGB6tGSE31mwNJecKW7KLsAuO6Z8lr8Zod
	AvqL6IVSoHBF7SKtryfi9BFPXSXJVcV5otv40mFRzkkjnddVPSbP5GajeQi95V5HgVeGgbi1+od
	Fq91Lqsu5its1vLCODrywDuy6UDffhohMpOfLgkkt2+M2xPTZuzTd1ONREbzxhbYIpTNdWmt8Uu
	esblz4utTGn9cz+dA1Ig6J/uPwEMTrGoh//g==
X-Received: by 2002:a17:902:ccc3:b0:2b4:59bf:5728 with SMTP id d9443c01a7336-2c1e80ec2abmr114527255ad.25.1780819879527;
        Sun, 07 Jun 2026 01:11:19 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm145520575ad.80.2026.06.07.01.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 01:11:19 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Sun,  7 Jun 2026 16:10:57 +0800
Message-ID: <20260607081105.993908-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260607081105.993908-1-inochiama@gmail.com>
References: <20260607081105.993908-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_011120_561073_D0861B4F 
X-CRM114-Status: GOOD (  14.14  )
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

Hardware updating of PTE A/D bits is controlled through ADUE bit in
henvcfg Expose the feature only if both Svadu and Svade are supported
for VS-mode.

Allow the VMM to enable/disable this feature by change the ISA
extension state in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 75 +++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..7bbea8812d92 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
 struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index ab39ac464ffd..7192c229a19e 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -94,6 +94,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
+					       u64 flag)
+{
+	vcpu->arch.cfg.henvcfg &= ~flag;
+}
+
+static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long value, u64 flag)
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
+	if (!one_reg_access) {
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			csr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
+	}
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long *value, u64 flag)
+{
+	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
+
+	return SBI_SUCCESS;
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -137,6 +176,33 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
+}
+
+static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
+static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
+						struct kvm_sbi_fwft_config *conf,
+						bool one_reg_access, unsigned long *value)
+{
+	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_ADUE);
+}
+
 #ifndef CONFIG_32BIT
 
 static bool try_to_set_pmm(unsigned long value)
@@ -246,6 +312,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
 		.set = kvm_sbi_fwft_set_misaligned_delegation,
 		.get = kvm_sbi_fwft_get_misaligned_delegation,
 	},
+	{
+		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
+		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
+				 sizeof(unsigned long),
+		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
+		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
+		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
+		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
+	},
 #ifndef CONFIG_32BIT
 	{
 		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
