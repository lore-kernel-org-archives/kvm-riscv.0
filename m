Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C9BACD8CAB
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7nO+/rFlCq2XFyDvpWaCYTuJYUSxmI4HX89iopDsaHg=; b=lR8mEeAlo6RH28
	Gyb244HYUVdWLFx6P4S+wHJ5GqCCtP8ge/yiCogrLd/Pv2r/zTm56DqfiIT7rxNioC0lI893GDdhs
	gvSjVhMHQvFZt2qo0TPIbnKId5y38CJkDUgJ4YI8s+bvQinviqo8o+CS7pjyqO0itlWtbuPbDEOM8
	17DUOMPdc85R9wQUTpTbdAP8COrFS+ljjOSa9w7yuZo9ptuOmRucF5GxemS91yFgGl090yncsUK7T
	mhfpH3ebmi4a/sWeYk6w1077MDK9ZIFxT8Oh2BTljXVdU0hySBHwvjGN2VOOhyT4PIPHsLyGvSXnm
	zt2/tWII7kjG/LuV4g7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC7-00000003pZc-2x1f;
	Mon, 08 Jun 2026 14:43:15 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbC3-00000003pSJ-30gR
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:13 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 4A0A72028A9;
	Mon,  8 Jun 2026 16:43:06 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 06/60] KVM: SVM: Enable Restricted Injection for an SEV-SNP guest
Date: Mon,  8 Jun 2026 16:41:58 +0200
Message-ID: <20260608144252.351443-7-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074311_922119_CFC3017A 
X-CRM114-Status: GOOD (  14.25  )
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

From: Melody Wang <huibo.wang@amd.com>

Enable Restricted Injection in an SEV-SNP guest by setting the corresponding
bit in the VMSA SEV features field (SEV_FEATURES[3]) from QEMU.

Add Restricted Injection to the supported hypervisor features.

Co-developed-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Thomas Lendacky <thomas.lendacky@amd.com>
Signed-off-by: Melody Wang <huibo.wang@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/cpufeatures.h |  1 +
 arch/x86/include/asm/sev-common.h  |  1 +
 arch/x86/kvm/svm/sev.c             | 26 +++++++++++++++++++++++++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
index 1d506e5d6f46..41af7bd2473c 100644
--- a/arch/x86/include/asm/cpufeatures.h
+++ b/arch/x86/include/asm/cpufeatures.h
@@ -453,6 +453,7 @@
 #define X86_FEATURE_SNP_SECURE_TSC	(19*32+ 8) /* SEV-SNP Secure TSC */
 #define X86_FEATURE_V_TSC_AUX		(19*32+ 9) /* Virtual TSC_AUX */
 #define X86_FEATURE_SME_COHERENT	(19*32+10) /* hardware-enforced cache coherency */
+#define X86_FEATURE_RESTRICTED_INJECTION (19*32+12) /* Restricted Injection */
 #define X86_FEATURE_DEBUG_SWAP		(19*32+14) /* "debug_swap" SEV-ES full debug state swap support */
 #define X86_FEATURE_RMPREAD		(19*32+21) /* RMPREAD instruction */
 #define X86_FEATURE_SEGMENTED_RMP	(19*32+23) /* Segmented RMP support */
diff --git a/arch/x86/include/asm/sev-common.h b/arch/x86/include/asm/sev-common.h
index 01a6e4dbe423..ee17a3541b55 100644
--- a/arch/x86/include/asm/sev-common.h
+++ b/arch/x86/include/asm/sev-common.h
@@ -136,6 +136,7 @@ enum psc_op {
 
 #define GHCB_HV_FT_SNP			BIT_ULL(0)
 #define GHCB_HV_FT_SNP_AP_CREATION	BIT_ULL(1)
+#define GHCB_HV_FT_SNP_RINJ		(BIT_ULL(2) | GHCB_HV_FT_SNP_AP_CREATION)
 #define GHCB_HV_FT_SNP_MULTI_VMPL	BIT_ULL(5)
 
 /*
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 6d5d66563b0d..369fb1e36f58 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -39,7 +39,9 @@
 #define GHCB_VERSION_MAX	2ULL
 #define GHCB_VERSION_MIN	1ULL
 
-#define GHCB_HV_FT_SUPPORTED	(GHCB_HV_FT_SNP | GHCB_HV_FT_SNP_AP_CREATION)
+#define GHCB_HV_FT_SUPPORTED	(GHCB_HV_FT_SNP |		\
+				 GHCB_HV_FT_SNP_AP_CREATION |	\
+				 GHCB_HV_FT_SNP_RINJ)
 
 /*
  * The GHCB spec essentially states that all non-zero error codes other than
@@ -63,6 +65,10 @@ module_param_named(sev_es, sev_es_enabled, bool, 0444);
 static bool __ro_after_init sev_snp_enabled = true;
 module_param_named(sev_snp, sev_snp_enabled, bool, 0444);
 
+/* enable/disable SEV-SNP Restricted Injection support */
+static bool sev_snp_restricted_injection_enabled = true;
+module_param_named(restricted_injection, sev_snp_restricted_injection_enabled, bool, 0444);
+
 static unsigned int __ro_after_init nr_ciphertext_hiding_asids;
 module_param_named(ciphertext_hiding_asids, nr_ciphertext_hiding_asids, uint, 0444);
 
@@ -3223,6 +3229,12 @@ void __init sev_hardware_setup(void)
 
 	if (sev_snp_enabled && tsc_khz && cpu_feature_enabled(X86_FEATURE_SNP_SECURE_TSC))
 		sev_supported_vmsa_features |= SVM_SEV_FEAT_SECURE_TSC;
+
+	if (!sev_snp_enabled || !cpu_feature_enabled(X86_FEATURE_RESTRICTED_INJECTION))
+		sev_snp_restricted_injection_enabled = false;
+
+	if (sev_snp_restricted_injection_enabled)
+		sev_supported_vmsa_features |= SVM_SEV_FEAT_RESTRICTED_INJECTION;
 }
 
 void sev_hardware_unsetup(void)
@@ -4773,10 +4785,20 @@ void sev_vcpu_after_set_cpuid(struct vcpu_svm *svm)
 		vcpu->arch.reserved_gpa_bits &= ~(1UL << (best->ebx & 0x3f));
 }
 
+static void sev_snp_init_vmcb(struct vcpu_svm *svm)
+{
+	struct kvm_sev_info *sev = &to_kvm_svm(svm->vcpu.kvm)->sev_info;
+
+	/* V_NMI is not supported when Restricted Injection is enabled */
+	if (sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION)
+		svm->vmcb->control.int_ctl &= ~V_NMI_ENABLE_MASK;
+}
+
 static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 {
 	struct kvm_sev_info *sev = to_kvm_sev_info(svm->vcpu.kvm);
 	struct vmcb *vmcb = svm->vmcb01.ptr;
+	struct kvm_vcpu *vcpu = &svm->vcpu;
 
 	svm->vmcb->control.misc_ctl |= SVM_MISC_ENABLE_SEV_ES;
 
@@ -4843,6 +4865,8 @@ static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 		set_ghcb_msr(svm, GHCB_MSR_SEV_INFO((__u64)sev->ghcb_version,
 						    GHCB_VERSION_MIN,
 						    sev_enc_bit));
+	if (is_sev_snp_guest(vcpu))
+		sev_snp_init_vmcb(svm);
 }
 
 void sev_init_vmcb(struct vcpu_svm *svm, bool init_event)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
