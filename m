Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EEA9C43602
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 02:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4wfTL2C4lSUeUEEacW7V/O/dn8KA8HpavWcjbkqpGmg=; b=du+gcdKtZzIZ+8
	dOhKAok3P1CSAu59FaLOWABvS94eQZzL8wFjUc+jK11HiyOowyZOrcjOGFfYRhtIE/lufwQecab7y
	4dz2HWkg0mYzNCpm+DmwD/Al9VQ4614+JwG4+gNaeTxmVpnIpouKJYO5iyoab4VZJUs9HNLiWs6//
	zwWdD11L8TiCTNpY4T+VEWg0neRrT02SXBwTxgS459kdIR5TrsGt8xGpWqqRUnJQ384Lem/4XOBhF
	uhk87p7g+wlJvDDLUp2JzEX+bZ3eOVk12Mz2N6d2HNcNxS+pUBrv8mNdqVeAO8g1RC6rMdZo9dyY1
	9u5QYLpybKwDFeK76wjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxl-0000000BNOZ-3tJL;
	Mon, 06 Jul 2026 02:21:37 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgYxj-0000000BNMI-2a4b
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 02:21:36 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-847a483e344so1926562b3a.0
        for <kvm-riscv@lists.infradead.org>; Sun, 05 Jul 2026 19:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783304494; x=1783909294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qWXXbXM8qG3ZuT8JFgvr3zN3NQWJY6TPhUqR1K2Hkx4=;
        b=k1xtT1Trk46jlEyOE3z7436yj+SB9Hoo44eD+QqC4mT/As6+3U4Du8iRt+CDcUzemv
         Fc2zLjLgqxuOyYHmket8R87VVcJVhUw3cxq3N8VRKg9cc/dzumRWKMwyU8wcRqlybnPs
         wRaYOK1e1s5D5AzJPcbwobxJ0DtIMZII/nUVzpKwpNBhZCMrNoCDcMfPRGCxSg5HH3xp
         M/43QRi3541q6iKALNWE5b2ZZfEDAFmXzuP2GckjKmM16wP31WPVnEpoSSii9696S8WH
         BW2PcvdKW4rPwJiQv6e6UYEpcjjdbt9VdjkZ5rGOlkb8yz8KZcVWE6R/0hY63iiM+Ga9
         r/Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783304494; x=1783909294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qWXXbXM8qG3ZuT8JFgvr3zN3NQWJY6TPhUqR1K2Hkx4=;
        b=mmlKVTIZppZik12g04HtLidPKlIwSYyZs58X2+ufR8zMpalVCChSsNHKWAMIRKMnu+
         K2ijwtAFxoe3lMYaWlJHZBws3v6NpoaqGVMX3+CRfeRU/I15gLZdc8WBpOwAPD6+wByH
         GW1MF3gEmGDcjYpQ6CRf2v0sKikbbdQb1rs1/GhOEFXhXmmxRxv8tHjnvCZgcIT9u5M7
         8TTInDxec7YkAdVrnnJ77Sdsy8fxk2CDXg+luq/i1OHW/xjZluDimG86KJ32YO4ehipB
         0+GvzoS3JhSSHaMXmsfRnpFLuU2KWcd2Tof+ZV050KoWAmjw0OzuPCXkujJHwYQxPdWN
         BVUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq3eh2oMixLaicpXm23010FgKn7P66VXW9cG8Gj/ed33IM91uTvhMNmlnfTtNjVfVdL2/eD3YnPUAQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YztZdCv+XCA+qMKVeZ9wnvFz6EUKMdBIUCGLxXSz6XrnwaI812G
	jW1+4A9mlwlMBnw6Yr48Ja+JaJkTGRWpvhiah/bSTbql7QSp0CiyxZm7
X-Gm-Gg: AfdE7cmP61x2o7oDvSUyQY0TIPtNhEMu4NvjvJZ05ALLUy4e1OywEmF9aPXTQrhHDpC
	YYA7+CjTVw0hiaxfh+cvDO0v4a/vBKimvUsHyCwy0qqaitiDyWIeLgCbWZ/dTZ8iH1eP2NBHak2
	zTL1yjtkauLZ/hcPZ1TYOQ4fT5DqRTFMq0YIbyz9DLFtbvJyrmJp8Y4u14cWsIc/GACX+0qfjn5
	7sT0LgcuU9InKfMLSZNDZlOJqtmu3uHqsVghQEgPgDcKIbu2ST/2zol+OHo8LBJTNMKzUATdHT6
	i+9K3j+iytdz9bVEeH1NmWgSGTQseXPsbVQQyucv51PNrPSsXEC7YkzYK8WBPDzncMBeT9VSe53
	OoleUUtXjKN3ffSdC3HrG9mtw2gwk9nF6EyWxyWGuw08Htk8G53O4mNRcWxyapSui
X-Received: by 2002:a05:6a00:440c:b0:847:888f:9b0f with SMTP id d2e1a72fcca58-847f8675f1emr6341733b3a.15.1783304494664;
        Sun, 05 Jul 2026 19:21:34 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b96998sm2844797b3a.16.2026.07.05.19.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 19:21:34 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Deepak Gupta <debug@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon,  6 Jul 2026 10:20:37 +0800
Message-ID: <20260706022046.214956-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260706022046.214956-1-inochiama@gmail.com>
References: <20260706022046.214956-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_192135_651920_3C774CD8 
X-CRM114-Status: GOOD (  14.36  )
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
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 77 +++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

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
index ab39ac464ffd..01db40b53295 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -11,6 +11,7 @@
 #include <linux/kvm_host.h>
 #include <asm/cpufeature.h>
 #include <asm/sbi.h>
+#include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_sbi.h>
 #include <asm/kvm_vcpu_sbi_fwft.h>
 
@@ -94,6 +95,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
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
+		ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+		if (IS_ENABLED(CONFIG_32BIT))
+			ncsr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
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
@@ -137,6 +177,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
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
@@ -246,6 +314,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
