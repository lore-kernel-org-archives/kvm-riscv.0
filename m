Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E47C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 02:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntIUw8fKUBoY+UfCXfxHmPnD2mNbNC2pskK1mwiWkDo=; b=3FxZjFXTXqdeb9
	8VLUjXtBcbnYKEi+cGW3jOSH9Wn4Txhx/wqurS/pxJ+7WIBrOJsx62B3rFikbxX002a1U1rBc9LdL
	/tELUWoKN6AXyE/MROGc9ONlyQdfg/77o3T+D0j6lXO424AjKNCf0iustg50/3jjkaU4mHI6H6wqW
	qbz/kqiqmYyec3js0LPkMJl3iAiD2DhgAsY7TjZnDusmkzqbBRyH30tp0tozFUNiQS10Yg/MQ2V6K
	2ZaOK0+c4AMZ/JrylY7UZY+aAiZpRP9SCMx6/L3j/yJZPpOL+cpXUfPbL57qOajJ1Hj5JXUXauSkI
	5M+wBCYGqytlXsRbst1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekNG-00000000UnR-3K9q;
	Wed, 01 Jul 2026 02:08:27 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wekN8-00000000Uk0-0nVn
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 02:08:23 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-c85d4b4245aso50999a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782871697; x=1783476497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xn87s7In+F3eOVUqsrjIa2N2Lz49wpP+uXxKTq7hWQ=;
        b=mReOWGOUxr4M+jmd54R4C6Z6axBCajEJrNAGP2C1n1o12C3ztZmK9NhEajOasZfRr7
         uhxESMUaFTNLbxzv1gHZ9tQ8o3lUveUYKaf9ahcgKKYdoxcK2Z/Fro+HalMU3Rxbz5d3
         BGXMXBVMbVLMEW2MvY19CuY5ePIZbFTCOA97yFdNfSW1mdtSfRX/iXt0HP8AIaPNase3
         YVP7j0ru0NGpSee+Ak9rwbkKOO4kJWyXmWohUYAVN42x7PCWtWWSKB4vyrgk23SH1/mJ
         nGBxmTRzctaOsBXFgZlEKbCOmPNr+pCGtKN2PdYN4sPbaByxUlVrwjBcK4SM8z1yJ/am
         kGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782871697; x=1783476497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1xn87s7In+F3eOVUqsrjIa2N2Lz49wpP+uXxKTq7hWQ=;
        b=PMP7wKR7p0QArH/H3HayM0gwzWa+H4gJ1l6qj37tVxiz4sdTkBd8ktXpe465aa4NR4
         ZNNp1kc/POo1/Mc1rBIWzHtRjU0YJHoThdzeJCIMrN4qBWxRyaXwdO9lwcdRNAcp+h7x
         KBhyPw2I2bLGOS3Eeh890TXI3VWeqX4QAn5iqvMp4/x82v0dUdIHLfqv7SgtctN9uSCJ
         iDi65v7pZaIyEHjVQQ0twHZKRS1XXnB1jx2u+YQM6a7COypfsvYgMopHS2DkfWQQYZe+
         j0HB210OdjxKjrlMtkzO2IMqa1pWSYVmUvEWIdV/gdQHrCw0VMnXS6TVvkCtcfpKkJ+e
         2nMw==
X-Forwarded-Encrypted: i=1; AHgh+RrlOB1glU6vTWnYG2sgSQpW6Dz+NkgzmjAcmhHg0sv9lFNkNPVQgs33VM2ZcNPPXH4Yj0jDsoi7Upg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy02LiZWz79aB5i1AImVDwwuctcySoDjK9FWwZSH1JwQE+H+Pnv
	zqdNPjzuEO4UZXU0X1/jD8dwSgdC5bRH4wjHr0fI4BTl/ws38Qwqyf2C
X-Gm-Gg: AfdE7cnZBjubda3FBe0eu9e1uhw7y1GibaMPQofIBagrbLouIpTtCnaEQzVodhXLTTa
	W3dRZoyEz23qHsVlqTVfAXntHCRVtlwgTc+iyTDNb9kehA01hJdGoHRpeB1zdRfT61WGwqkeVd3
	F04O7rOlcjeiPjDKYS+RpJOivCSQRPaSf/0mhurGreEvNh7IkWe5rr/DjlHrznem6mf7b3oAUGm
	powfvQdkeGWeFgzrYem5gTvG+hG+SKKix0sauV2QfCDnzYi+Ny6TED5pi9jcAdhIjfIPI8ApSL+
	AK0FAr4cFlWzqpfBgngbnKsEV1wX1FlUkq95OII78i0QnE/gC7iN69lWwPMdHt7oivTc3oo0VEC
	auk6B8h0Cx19KBgfpdWCMD5PixPfo9DDk2hUf2CyQ9zRp2RBgA4YmcbMIziQ8eRIzLb4pgDjyba
	nmgLfdPkVxFUI=
X-Received: by 2002:a05:6a00:80e:b0:845:eb73:411c with SMTP id d2e1a72fcca58-847adeef6cemr2978992b3a.45.1782871697291;
        Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8479ffff404sm3114718b3a.22.2026.06.30.19.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:08:17 -0700 (PDT)
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
Subject: [PATCH v4 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Wed,  1 Jul 2026 10:07:38 +0800
Message-ID: <20260701020746.170157-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701020746.170157-1-inochiama@gmail.com>
References: <20260701020746.170157-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_190818_809719_DD3F8B6E 
X-CRM114-Status: GOOD (  14.15  )
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
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
