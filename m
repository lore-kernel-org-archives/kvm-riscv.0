Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE63CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TBE39zdLAP7W+ufh32rYUWdwJVG4051huCTKpFl4k3k=; b=IPx9mT0JriJ2uu
	EgjZ87UVEVJ6Eti+kMcvLBAFdLP/n3fMSbvWRsdaHHKXZHqg1HkPjo+/pdck7GXNSD1xq/pKDPWlv
	/09ArGqxhbhro6fuy8VmABLnvMkxPDyAnqY1XPl7YZlr53fsxtCEWdCbmY7HSSxtxWenWqwVrsgxJ
	F2hi8PO42LH9MuOht+EIWY1GYI364VwsjEXdWGZzf7f6BBtZY/XzPgrQLtjLD65MBbDjMVpA0eRO+
	ixEtzBsX2EHUah+8J/1ipk0u5r6E8niSEsN/pDqsIqCuzrWUlJPFf3A1DnMSxxJ+PxuK5zZx8ZpKm
	kRz8FdRS1Nd3K3mmmsZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFe-0000000AOBv-3kwW;
	Mon, 01 Jun 2026 08:44:02 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFc-0000000AOAH-1gr4
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:01 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-36bb3551f6eso2758444a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303439; x=1780908239; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E0aaMax2/oVHcxkIeEgQqy6mX+q/RNO/BVNGIuJ0S4E=;
        b=HJnopB9k3y6juDMkBrRuJoZg5LWYJBqricr8lQyGiCxiEDiS8zgkiXfNEXcCi7Ydx9
         l2NrrUj+J1uD62eZBJovdtCPhKkpSWn6G3mQPdy5Yt+Z17EKuqw/QB16VYa4CXLqB7hg
         TqT+ur9Utr+q95eo7TOPrLAZx/c7+Z0Mtbjs/y8uNj3MxVIQGmpxYN9bW3YuE8CKj0Vu
         TROtaZRoMmsCgusf2Ix6uNmbbatBBgihQok2NW9flbYI9Td+iykathbuSSjDhL8AhsUe
         4tAU1xFQGndl3wMB2gY20CJ66sBYPW6WsGPKS3udWEAFQ5jM4UVwhluAldV3qckJCOD1
         vb3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303439; x=1780908239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E0aaMax2/oVHcxkIeEgQqy6mX+q/RNO/BVNGIuJ0S4E=;
        b=D8016jPWtXFbJvBS2R3npYhe5xoo9IISqPQIC56qE6djUtgdLcnZcZWfY4Myj43qWe
         FWmxDyQDC5aNvcYa0WOaokuimYwsvr1yl3g5t/f8HCTJZJ0WzGrgxxHSuajQEQersak9
         e/6a/77MowVT8IqMDXlrtanFVymvQCC7CXRSLs0djjiOupVAIjuWvudXm1gjyu6K9f1b
         JfGY78Gs3RXCsbUdufbkJFK8WYuKq9p2KDATFtmIrXhNtIzV0FLQfNiuPRtS1ZBfgJZz
         8KG0WUeX7nGF7oFjuXZaklcEvNxfwbCAIcce0RyBkk+e9xtJzMcSLPtHHtefuaFRN/BE
         O1dA==
X-Forwarded-Encrypted: i=1; AFNElJ+vef3kFwTNzvO4sGMEwdoXuTOgXmVA0/ZdXTA0r6CplMJevtKuA0tKbMvH1btFs5Rw5vnZHPsnoIg=@lists.infradead.org
X-Gm-Message-State: AOJu0YwWlAN6tZd7502NiXhl1drh+19N63cbEzYzC3C1AFZdG+Vhh6d1
	zT8ycIjGv8JCdy9sV7PLzsDbGefdjsJywRRLKyM7mFUBuPjOJ4qDroZv
X-Gm-Gg: Acq92OEn5UGY09KTY8OnC5PODdDIQvzgO/a1L+F/HsQGDWtw1A6FS+w27GbcRUIPsrU
	9VgiF16ZKJEfUPIJIqp7e1JPtTkPjOrgQBwfTzR/qoESGUBvzClEyGXF76mC+ozQtJBgS8E03HQ
	gB+vKQL2uP9jHMDdFcZO2ibtmk4BSoo4Y+ybG4Mp51Ca9PiqLkDdg1bI5bdwbozjJwwI0sY5Sqi
	HgUvM0FUaMNYe8ceM2R6bH48Kmv4qs8WDm78CrGHZZuUjBZkTLXvyS08X/3MjOOUO4ZYzu4aKL2
	u+VeKncnfjwvMY6GWGtJcM8WXhM2dzK0EaijhlhzCANS0u8v61leHFgGP5mUmejFdOGeen5BLQf
	GCjjm6IUwI4ySK5HHti7mLnh8Vvd886sWT33zgn9rsc8DsjUKByFmy0LiNRGbLM3KaVRD5keBIj
	UKk7X3320LAU+xWJiComLSScbZk6QI+ry5ew==
X-Received: by 2002:a17:90b:2247:b0:367:d850:6a5f with SMTP id 98e67ed59e1d1-36c68478155mr9638126a91.25.1780303439454;
        Mon, 01 Jun 2026 01:43:59 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36bbdb6978fsm5733679a91.1.2026.06.01.01.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:43:59 -0700 (PDT)
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
Subject: [PATCH v2 1/7] RISC-V: KVM: Add support for Svadu FWFT features
Date: Mon,  1 Jun 2026 16:43:29 +0800
Message-ID: <20260601084336.2601675-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014400_462250_010D97CC 
X-CRM114-Status: GOOD (  14.51  )
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
henvcfg Expose the feature only if the Svadu is supported for VS-mode.
Allow the VMM to block access to the feature by disabling the ISA
extension in the guest.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/include/uapi/asm/kvm.h |  3 ++
 arch/riscv/kvm/vcpu_sbi_fwft.c    | 72 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 504e73305343..501e4fc60dd2 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -240,6 +240,9 @@ struct kvm_riscv_sbi_fwft_feature {
 struct kvm_riscv_sbi_fwft {
 	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
 	struct kvm_riscv_sbi_fwft_feature pointer_masking;
+	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
+	struct kvm_riscv_sbi_fwft_feature landing_pad;
+	struct kvm_riscv_sbi_fwft_feature shadow_stack;
 };
 
 /* If you need to interpret the index values, here is the key: */
diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..375269e43c13 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -84,6 +84,42 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
 	return false;
 }
 
+static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
+					       unsigned long flag)
+{
+	vcpu->arch.cfg.henvcfg &= ~flag;
+}
+
+static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long value, unsigned long flag)
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
+	if (!one_reg_access)
+		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+
+	return SBI_SUCCESS;
+}
+
+static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
+					     struct kvm_sbi_fwft_config *conf,
+					     bool one_reg_access,
+					     unsigned long *value, unsigned long flag)
+{
+	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
+
+	return SBI_SUCCESS;
+}
+
 static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
 {
 	return misaligned_traps_can_delegate();
@@ -127,6 +163,33 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
 	return SBI_SUCCESS;
 }
 
+static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
+{
+	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
+		!riscv_isa_extension_available(vcpu->arch.isa, SVADE);
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
@@ -225,6 +288,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
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
