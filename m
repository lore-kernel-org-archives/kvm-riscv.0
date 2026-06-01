Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90160CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZsQ8qWh+8wlg9W/+m130hXMrv2/msODMC4hMiMMZHPo=; b=HyxxQTmUFQ+PYt
	GA/Z/rHUeAom9i1oQRwHlrwloqHz43v3/XvFrGtf7pAGYf9THR1fjvIfU/wySBrwWz/F4xR3TiFYz
	AucsSBAVKrMsdzPFDJUDpunNGikIc+jXeUH+9P/TVxVzbgZZjbtRD5X8LvUDjdzWDzSn/zkd+MSIi
	rZNgXM0/jno/5epJVlC7g6FAscDFDe8hwCVZcTDAVw5hqcREzyGY5fQxwpWmXnra+FyjMozFlYFTJ
	jDKiMe+Rk7VrtM6M842sQg5w9EkAdJfdTm4Zd8M1c+wsmEb6tlNIf+kxEkIlQIWncy/thXl9YZqHz
	tFeen2zxWhgkG/H37i2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFu-0000000AOSs-0jur;
	Mon, 01 Jun 2026 08:44:18 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFr-0000000AOOU-37JV
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:17 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2bf2247e38eso23679825ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303455; x=1780908255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AZP5r0J73Q2Ucds4N11ve2c25N4gijVaOCy/mmdW+YU=;
        b=EEKTAf6Uml8aAE8SpOeYJ9niC4rEVVF0vc8TqQV5oSrYGCDAIrYISBiPBk/y8O3Cmb
         IdsAFLq/lIUffKOQ8m4H0TkcdFfmY6F7lWYzkCgWVL7z7j0vq8hHpWRtJ9611L2vfCmc
         AjADA4dDA9jWMYfsUkSZiTrEGHJIzWTvxXlVHwcekifvDAstx3eOnpC2O+lhXyLpE9Zb
         QCnxwGhj0hU4CKVdgp7iqw2rQSj/nh26seebuyQeyJEZQcAz5QYJs5sJpmj3O4GT2xfI
         hP2JQR+Es4Ukv8zlsj75VCkEGNfNLqayRGqVBkftgWw3UHiEYTjkp1MQhYZntdhkhHU5
         o+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303455; x=1780908255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AZP5r0J73Q2Ucds4N11ve2c25N4gijVaOCy/mmdW+YU=;
        b=FMjdrE/MEnK99aVYtun/XUhfToAilZZZ3FH3AOk9F+mT3XsvcI/ZSynzVefR3WUiWo
         8T4Qm2Kk50gb76HY11F0suXK8XUVgMeyulny/Pd7pQYOogUYloYSKtWPoKudNPMZ/OoK
         VopowXckB+SefKwCfyWS41BzfD67IkT+FdY4CRTOsYIwoZYNArER/wrX3G7rFiPGw3yS
         iGx6k+pUHgaSUbOLeSfMqdfASZYfrjlsXiD8VMndTpjMRFY6ByVu3qBKBSspvHR9G2Fj
         WM3775MCdPEjH+8C2X/YxT/NHLv/F9FkRNf9xErzg5104lmj41fqFe9Yq1N/dGIFH+eG
         glWQ==
X-Forwarded-Encrypted: i=1; AFNElJ/K7BW07RtkZ6hJdcU9NzAvRrniFXUZ+ARMrQqqFmhEH742MozP9A6mGYVX/19AFsV948mINUM/P2A=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxmwRsP70mfNDMvpPaCyowFdVYCRrqMccgTrzsJRcoag692g2E
	72UmCGP3MZXEQuv+I8jp2XI4TKVTsD3jWGULMOOP6NHPGW10Soy1CCav
X-Gm-Gg: Acq92OHLNcjuQua89DVpoz5lY8gUkdKha9biPAqqg+Hs9fNhRFhPjcS6696602kTJLE
	7rKGbbqCplYWaEcihh15HIJU9Gkgp92fbRyKKqID9FU+f8x4QHXS73io/umOJ8v0LHiMGzVyHu9
	Wx9R2Aa8HE8R5K4Mk5SAqc10bFN4i+iBGT+GLZK0o6aE74XZU7bJ72Bf/gJ2n9QBFDCVoyNCYzP
	9pLNd4U6khXHp9Ro0M3UY85zppsINYcOrnzVjauc28cHXpMx/i6Iza1alTN89ZCPu2lr0BvzWxs
	NyqMKsKEvz9SRcRPwaCvVLMN5pfAuIMHCIDt+FlmPPn6dT3SiAGbFByVgbBh8DURp1WOF/5oKsp
	VnOyT4U+iq4xHmiSDT/l8TTCWwA2SFeRdA4Ta8CJmfWBcAneqLZcltQmtF1He1bXcm9B0YCkDVb
	RU+uCMapGdVs40cnB0HSPFM7T+1x8rXrQm6g==
X-Received: by 2002:a17:902:e749:b0:2c0:b4f5:41d4 with SMTP id d9443c01a7336-2c0b4f5428bmr82594955ad.41.1780303454902;
        Mon, 01 Jun 2026 01:44:14 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c26bcesm95822185ad.65.2026.06.01.01.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 6/7] RISC-V: KVM: Add support for control-flow integrity FWFT features
Date: Mon,  1 Jun 2026 16:43:34 +0800
Message-ID: <20260601084336.2601675-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014415_814891_E2874ED0 
X-CRM114-Status: GOOD (  11.88  )
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
 arch/riscv/kvm/vcpu_sbi_fwft.c | 70 ++++++++++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 375269e43c13..278eb95b97de 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -163,6 +163,58 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_landing_pad_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, ZICFILP);
+}
+
+static void kvm_sbi_fwft_reset_landing_pad(struct kvm_vcpu *vcpu)
+{
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_LPE);
+}
+
+static long kvm_sbi_fwft_set_landing_pad(struct kvm_vcpu *vcpu,
+					 struct kvm_sbi_fwft_config *conf,
+					 bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_LPE);
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
+	kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_SSE);
+}
+
+static long kvm_sbi_fwft_set_shadow_stack(struct kvm_vcpu *vcpu,
+					  struct kvm_sbi_fwft_config *conf,
+					  bool one_reg_access, unsigned long value)
+{
+	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
+						value, ENVCFG_SSE);
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
@@ -288,6 +340,24 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
