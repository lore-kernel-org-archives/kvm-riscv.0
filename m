Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61592CD98C6
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIEVrBNo9mICmoDbTHpPf2XwSoMdCXQVNLmsU/hx8qE=; b=Xg5K7zznXI0HS3
	itgWcCo/ImbgHcjabl+9U6FyQ21Y7xbqaJ9rDqo5UtSWeRtJHgMXVMbT+cT7n0m26svwG8bHgRatl
	TG9B7O3ZNxMGGpE5D0UGNjPBmLJM6CJphQoEk3aLyB3pS4DusH9UA63irQRLdBooZ3xEC3fN3+pcg
	NpDsvKYlgJtBX+8HF3QtA0LUtxa9auO4xj1EqczClBcw/cWAcvKZLhD+7wCBbqeI/aS8SNKRSrNsm
	tibNZrARuWLI9WKl0zjnO60Mb1gUOQzzVWQm1aiRs8kIDCNEhH9db6Eu8+5CYAaWZj52tAMIpsUVV
	clMu94Z0GmWs4qh3TyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCS-00000003qHx-2kXQ;
	Mon, 08 Jun 2026 14:43:36 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCE-00000003pST-2h50
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id BB2242028DE;
	Mon,  8 Jun 2026 16:43:17 +0200 (CEST)
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
Subject: [PATCH 59/60] kvm: svm: Implement max_planes x86 operation
Date: Mon,  8 Jun 2026 16:42:51 +0200
Message-ID: <20260608144252.351443-60-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074322_890024_484D1B51 
X-CRM114-Status: GOOD (  14.27  )
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

From: Tom Lendacky <thomas.lendacky@amd.com>

Report the number of VMPL levels supported by SEV-SNP guests.

Signed-off-by: Tom Lendacky <thomas.lendacky@amd.com>
Co-developed-by: Joerg Roedel <joerg.roedel@amd.com>
Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 14 ++++++++++++--
 arch/x86/kvm/svm/svm.c | 12 +++++++++++-
 arch/x86/kvm/svm/svm.h |  3 +++
 3 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index b67566fcb69e..528c8bd3e8fc 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -114,6 +114,7 @@ static unsigned long sev_me_mask;
 static unsigned int nr_asids;
 static unsigned long *sev_asid_bitmap;
 static unsigned long *sev_reclaim_asid_bitmap;
+static unsigned int vmpl_levels;
 
 static __always_inline void kvm_lockdep_assert_sev_lock_held(struct kvm *kvm)
 {
@@ -3103,6 +3104,9 @@ void __init sev_hardware_setup(void)
 	/* Set encryption bit location for SEV-ES guests */
 	sev_enc_bit = ebx & 0x3f;
 
+	/* Get the number of supported VMPL levels */
+	vmpl_levels = (ebx >> 12) & 0xf;
+
 	/* Maximum number of encrypted guests supported simultaneously */
 	max_sev_asid = ecx;
 	if (!max_sev_asid)
@@ -3217,9 +3221,10 @@ void __init sev_hardware_setup(void)
 										"disabled",
 			min_sev_es_asid, max_sev_es_asid);
 	if (boot_cpu_has(X86_FEATURE_SEV_SNP))
-		pr_info("SEV-SNP %s (ASIDs %u - %u)\n",
+		pr_info("SEV-SNP %s (ASIDs %u - %u), VMPL Levels %u\n",
 			str_enabled_disabled(sev_snp_supported),
-			min_snp_asid, max_snp_asid);
+			min_snp_asid, max_snp_asid,
+			vmpl_levels);
 
 	sev_enabled = sev_supported;
 	sev_es_enabled = sev_es_supported;
@@ -5852,3 +5857,8 @@ bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu)
 
 	return blocked;
 }
+
+int sev_snp_max_planes(struct kvm *kvm)
+{
+	return vmpl_levels;
+}
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 2ae82dc058c9..705063c7f0f0 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5321,6 +5321,16 @@ static void svm_free_plane(struct kvm_plane *plane)
 	kfree(svm_plane);
 }
 
+static unsigned svm_max_planes(struct kvm *kvm)
+{
+#ifdef CONFIG_KVM_AMD_SEV
+	if (____sev_snp_guest(kvm))
+		return sev_snp_max_planes(kvm);
+#endif
+
+	return kvm_x86_default_max_planes(kvm);
+}
+
 struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
@@ -5465,7 +5475,7 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 
 	.alloc_plane = svm_alloc_plane,
 	.free_plane = svm_free_plane,
-	.max_planes = kvm_x86_default_max_planes,
+	.max_planes = svm_max_planes,
 };
 
 /*
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7e860f2abafb..7aba2cceb44d 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -1008,6 +1008,8 @@ static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu)
 	return is_sev_snp_guest(vcpu) &&
 		(sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION);
 };
+int sev_nr_vcpu_planes(struct kvm *kvm);
+int sev_snp_max_planes(struct kvm *kvm);
 #else
 static inline struct page *snp_safe_alloc_page_node(int node, gfp_t gfp)
 {
@@ -1051,6 +1053,7 @@ static inline bool sev_snp_inject(enum inject_type type, struct kvm_vcpu *vcpu)
 static inline void sev_snp_cancel_injection(struct kvm_vcpu *vcpu) {}
 static inline bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu) { return false; }
 static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu) { return false; }
+static inline unsigned sev_snp_max_planes(struct kvm *kvm) { return 1; }
 #endif
 
 /* vmenter.S */
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
