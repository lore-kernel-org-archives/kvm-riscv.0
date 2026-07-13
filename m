Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8374C43458
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 01:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQuwtORls9NTbXgsacTcxC2RhaOBZCK1cJBCoBfRllc=; b=AMyovgFFWgpYFU
	QVJduYqqlT49g9us8kbzvckRq/sZLPcmWnYJzt0BHGYY8VP7zbn5omq+yCV6D7twgpx71ONzcfgsm
	iFerNk1zkQcB7mcLoeQFsDfzz4x6vlW9ne44B35otwPX76MtFEVz2fUu2Tt7INR4j+TgECgWtT2Ws
	En2OCJLaHIUnUqvlZGm9bTXhcYw6/9izuTE8FJYIKkR24cPZwQFNUIuc3imM6GOjzezI1gFvuMgEo
	wMyqd2pw6vSloS0PdJoKXoDk6f/54thigM0VBNKjuWF81hOU3BnUefYRlrl1cOy9oH7V5pVVy0M4r
	5kncLo+q1njvautw580w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55P-00000007tWT-2Y10;
	Mon, 13 Jul 2026 01:03:55 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj55M-00000007tTy-1OYJ
	for kvm-riscv@lists.infradead.org;
	Mon, 13 Jul 2026 01:03:54 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-38dcbade417so966246a91.1
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Jul 2026 18:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783904631; x=1784509431; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=MYyB6dgrGRGXoRd8OdmgxLYF73zX/YqbO0zfTadIh8XwykBpKCOYvr1hqfNeKejkuO
         P6znDo6P5C8GMsgP7QBI26/Zzx6w2T5iiig/kskyJLfinTJXsU0iLMnpPr7lp8oyzJRf
         kh8qxf36havE+Ew+AvnDW1TFAIbBd1a/i4OZrlAsI8+jcAWDfdKvZrSl0b0ZlGkfAnph
         mCIPHX4x5KWzR1bABi9aR3aDRKr+F+yvv14XB3HRKhDbDyrJFQsi9uf5JIWIWkuuuTu5
         EjOMHR8sn4Cxl9CJUTtbECZeO9Lkvu4xu/J2HgEcm9drSSiZFo2H+i5Z/xXOV/gpKwSj
         81MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783904631; x=1784509431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4wtNmoMKQodXeWiOSWDyChURk6Jt6lHeZLiT5bWjNnQ=;
        b=SPB733oTtpgcpWvdhh9VTPgnyVO5Btb018U7xPXqDOcjA/bIO/FRb2581R1zMyh43y
         V9CY8deSrNcUBMwaywsnInHwg+KLxMWiVFkdrjTeiwr0Uou0gpu27WjQQIXd3whppize
         KI0+8FeeqJOKwKUZgLr067UPosvCCilzY+4Uvm5CC4aTZdVRGDQLY/KD0oWPU0OAiNIr
         Kps9eNFG7OnQV2W1CxxAaQBwywdjCtEu6ZFPm/GjiU2mUa89wRrZJTG8U8DAh0hUtGyz
         f/GSB5e4LK3jaP0C93lEagOgpdaeJEZ2JAWCpkXRLKYj6++fNWYSeXc3UNyU8N7x1ThD
         LNqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp+4Y4Cr8S7SzxXy8NJ1wu1eaNNx9GRT4TDhi2XQFhfsfrF8X/xeZIxTkoxCUvqJ80iG3nMaSz1Qug=@lists.infradead.org
X-Gm-Message-State: AOJu0YzoTzmuYWkbKvalhnaRwx1eAtogDCEiPHEpqJr6aoKLjjwX+0bl
	JvEfq79Tr/FmAoYbuKSaQ7/RPJ9V3TjOQnIM8XpTTB+7Dpvr6qWPmt5U
X-Gm-Gg: AfdE7cn/tF+a9do4tpWIS+6baZ3geV0oOOJzXDrhplrS5pGtsFf4F6rQgxQ89+FBDpv
	V+/wm7NYG9XOqbOla4VBTFA6QB1vF2IajMG7aZ/0AntL6LOzOA8+Og/X3n47I45eeYc3jD3KRXD
	rvzSQBT03S5P57FqeX1LP6sAj5yc6TixhBikOqMH2KrVD/1R6kSm3/v9bsvqDLqsgi8bKs2IGAt
	Qb09zf/QNvW/BuzArd2booraTA3hxyq41YQRafu0CRAeDeF96g2+mJhTlFNtPbULVE7EoPk9oNX
	Eaf8TBYVvFzLxoJbCMZD7YDLdDTsYuxzuBld2ZKOkwc3Sf2pWSfUNayH4dwQowL6t3zaH189RW/
	U0tdEuhX30sp0w/7YUf9t6udUgRnDgu6dCfGbiM6geQkPItL7RpW4mX+1h33v7E04dywYwyVFDH
	c1DWzd/bEweVw=
X-Received: by 2002:a17:90b:47:b0:37e:b6a:6cdf with SMTP id 98e67ed59e1d1-38dc77ee830mr7343814a91.20.1783904631435;
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a55a47286sm5549380a91.10.2026.07.12.18.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 18:03:51 -0700 (PDT)
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
Subject: [PATCH v6 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon, 13 Jul 2026 09:02:54 +0800
Message-ID: <20260713010302.303278-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713010302.303278-1-inochiama@gmail.com>
References: <20260713010302.303278-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_180352_385358_84452790 
X-CRM114-Status: GOOD (  14.08  )
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
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 76 +++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

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
index ab39ac464ffd..4d474a439b29 100644
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
@@ -137,6 +176,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
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
+	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
+		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
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
@@ -246,6 +313,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
