Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A88CD8CBF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzQlJpko7fRDXyvXA+8TJU+L2i/vSU/8TTLKh+jI6wI=; b=ufGXT6ydHmBHPl
	/YSMWnxdfvuKryDIUqsPjIpRPs80/Ad/P3oW7VrpeLF706PVL7BPx7JYkkowQ0GcbnSI8hwk9kIhp
	IGoEnwQiSKAQuetysdO32+2e7VAtvcCRGCpAREHmWFCkqL3YkPOe+mRhIUne5VqFa0dtn1sxtxw31
	A06hRdN7RBWjMBOdfdi6zVlE9IJm2QW7o+IqA44RkBU//7EAJIt76AL4FibQIwpVPeSv/EtZiwe2A
	Ix/LIT4yJALYW8aIphvFGcj/76PRXHvHISYcUnU7KMabVPw5rfzr+6/vlAj+92hRuaQqN+8K9xNq6
	W/QCXzuORy0CBrfn2ucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCS-00000003qIH-3Ryz;
	Mon, 08 Jun 2026 14:43:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCH-00000003prq-1n68
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uQ3zW9Vgqh5W4t5KVU2ZZStOCGQFFBvGu3oKMCf1P/A=; b=SZ+UNFKEg4nyQGWQTurqC8+LJe
	6TdbI6T5kppgA+BbDjtDSgWkpPELAifabO4eTtJg47pr5kyXJMPPL3Oae0x/hpGFiJlf7B5mi1rlM
	cC0hWFClaPlETyo4rmkrV9Xk/Trojpoq6czjE4vdiBlwx6gZPxEIFtDTILFEvLEKhNJr3vyZAKVsF
	jmz9g7GpuWlL8aS8nyOmB1HS91K+A3xX6IVH/+J9n1awyd7XJqG5Q6EFry/0wGEAduSb3jkjCTB1g
	qqJunofyR6ebtHuoCDJ3rtjYSE7PJGb17RmlBMO3HbeQkQb0eAvNifwnLp8oaZl0MMAg6Eq9epWsm
	xOpNvBsQ==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCD-0000000198p-1vHO
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:24 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id D88B92028DA;
	Mon,  8 Jun 2026 16:43:16 +0200 (CEST)
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
Subject: [PATCH 55/60] kvm: svm: Track vmsa_features per plane
Date: Mon,  8 Jun 2026 16:42:47 +0200
Message-ID: <20260608144252.351443-56-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154321_815871_F6496867 
X-CRM114-Status: GOOD (  16.66  )
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

From: Joerg Roedel <joerg.roedel@amd.com>

Planes can have different set of SEV features enabled. Track the
enabled features per plane instead of per VM.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/kvm/svm/sev.c | 37 ++++++++++++++++++++-----------------
 arch/x86/kvm/svm/svm.c | 21 +++++++++++++++++++--
 arch/x86/kvm/svm/svm.h | 24 +++++++++++++++++++++---
 3 files changed, 60 insertions(+), 22 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index a23dcb081751..12b039823c1c 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -204,17 +204,16 @@ static inline bool is_mirroring_enc_context(struct kvm *kvm)
 
 static bool sev_vcpu_has_debug_swap(struct vcpu_svm *svm)
 {
-	struct kvm_vcpu *vcpu = &svm->vcpu;
-	struct kvm_sev_info *sev = to_kvm_sev_info(vcpu->kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 
-	return sev->vmsa_features & SVM_SEV_FEAT_DEBUG_SWAP;
+	return sev_plane->vmsa_features & SVM_SEV_FEAT_DEBUG_SWAP;
 }
 
 static bool snp_is_secure_tsc_enabled(struct kvm *kvm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(kvm->planes[0]);
 
-	return (sev->vmsa_features & SVM_SEV_FEAT_SECURE_TSC) &&
+	return (sev_plane->vmsa_features & SVM_SEV_FEAT_SECURE_TSC) &&
 	       !WARN_ON_ONCE(!sev_snp_guest(kvm));
 }
 
@@ -496,6 +495,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 			    struct kvm_sev_init *data,
 			    unsigned long vm_type)
 {
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(kvm->planes[0]);
 	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
 	struct sev_platform_init_args init_args = {0};
 	bool es_active = vm_type != KVM_X86_SEV_VM;
@@ -534,11 +534,11 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 
 	sev->active = true;
 	sev->es_active = es_active;
-	sev->vmsa_features = data->vmsa_features;
+	sev_plane->vmsa_features = data->vmsa_features;
 	sev->ghcb_version = data->ghcb_version;
 
 	if (snp_active)
-		sev->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
+		sev_plane->vmsa_features |= SVM_SEV_FEAT_SNP_ACTIVE;
 
 	ret = sev_asid_new(sev, vm_type);
 	if (ret)
@@ -576,7 +576,7 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	sev_asid_free(sev);
 	sev->asid = 0;
 e_no_asid:
-	sev->vmsa_features = 0;
+	sev_plane->vmsa_features = 0;
 	sev->es_active = false;
 	sev->active = false;
 	return ret;
@@ -931,7 +931,7 @@ static int sev_launch_update_data(struct kvm *kvm, struct kvm_sev_cmd *argp)
 static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 {
 	struct kvm_vcpu *vcpu = &svm->vcpu;
-	struct kvm_sev_info *sev = to_kvm_sev_info(vcpu->kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(vcpu->plane);
 	struct sev_es_save_area *save = svm->sev_es.vmsa;
 	struct xregs_state *xsave;
 	const u8 *s;
@@ -982,7 +982,7 @@ static int sev_es_sync_vmsa(struct vcpu_svm *svm)
 	save->xss  = svm->vcpu.arch.ia32_xss;
 	save->dr6  = svm->vcpu.arch.dr6;
 
-	save->sev_features = sev->vmsa_features;
+	save->sev_features = sev_plane->vmsa_features;
 
 	/*
 	 * Skip FPU and AVX setup with KVM_SEV_ES_INIT to avoid
@@ -2026,6 +2026,8 @@ static void sev_unlock_two_vms(struct kvm *dst_kvm, struct kvm *src_kvm)
 
 static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 {
+	struct kvm_sev_info_plane *dst_plane = to_kvm_sev_info_plane(dst_kvm->planes[0]);
+	struct kvm_sev_info_plane *src_plane = to_kvm_sev_info_plane(src_kvm->planes[0]);
 	struct kvm_sev_info *dst = to_kvm_sev_info(dst_kvm);
 	struct kvm_sev_info *src = to_kvm_sev_info(src_kvm);
 	struct kvm_vcpu *dst_vcpu, *src_vcpu;
@@ -2039,7 +2041,7 @@ static void sev_migrate_from(struct kvm *dst_kvm, struct kvm *src_kvm)
 	dst->pages_locked = src->pages_locked;
 	dst->enc_context_owner = src->enc_context_owner;
 	dst->es_active = src->es_active;
-	dst->vmsa_features = src->vmsa_features;
+	dst_plane->vmsa_features = src_plane->vmsa_features;
 
 	src->asid = 0;
 	src->active = false;
@@ -4157,7 +4159,7 @@ static void sev_snp_init_protected_guest_state(struct kvm_vcpu *vcpu)
 
 static int sev_snp_ap_creation(struct vcpu_svm *svm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(svm->vcpu.kvm);
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 	struct kvm_vcpu *target_vcpu;
 	struct vcpu_svm *target_svm;
@@ -4182,9 +4184,9 @@ static int sev_snp_ap_creation(struct vcpu_svm *svm)
 	switch (request) {
 	case SVM_VMGEXIT_AP_CREATE_ON_INIT:
 	case SVM_VMGEXIT_AP_CREATE:
-		if (vcpu->arch.regs[VCPU_REGS_RAX] != sev->vmsa_features) {
+		if (vcpu->arch.regs[VCPU_REGS_RAX] != sev_plane->vmsa_features) {
 			vcpu_unimpl(vcpu, "vmgexit: mismatched AP sev_features [%#lx] != [%#llx] from guest\n",
-				    vcpu->arch.regs[VCPU_REGS_RAX], sev->vmsa_features);
+				    vcpu->arch.regs[VCPU_REGS_RAX], sev_plane->vmsa_features);
 			return -EINVAL;
 		}
 
@@ -4815,15 +4817,16 @@ void sev_vcpu_after_set_cpuid(struct vcpu_svm *svm)
 
 static void sev_snp_init_vmcb(struct vcpu_svm *svm)
 {
-	struct kvm_sev_info *sev = &to_kvm_svm(svm->vcpu.kvm)->sev_info;
+	struct kvm_sev_info_plane *sev_plane = &to_kvm_svm_plane(svm->vcpu.plane)->sev_info_plane;
 
 	/* V_NMI is not supported when Restricted Injection is enabled */
-	if (sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION)
+	if (sev_plane->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION)
 		svm->vmcb->control.int_ctl &= ~V_NMI_ENABLE_MASK;
 }
 
 static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 {
+	struct kvm_sev_info_plane *sev_plane = to_kvm_sev_info_plane(svm->vcpu.plane);
 	struct kvm_sev_info *sev = to_kvm_sev_info(svm->vcpu.kvm);
 	struct vmcb *vmcb = svm->vmcb01.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
@@ -4845,7 +4848,7 @@ static void sev_es_init_vmcb(struct vcpu_svm *svm, bool init_event)
 	}
 
 	if (cpu_feature_enabled(X86_FEATURE_ALLOWED_SEV_FEATURES))
-		svm->vmcb->control.allowed_sev_features = sev->vmsa_features |
+		svm->vmcb->control.allowed_sev_features = sev_plane->vmsa_features |
 							  VMCB_ALLOWED_SEV_FEATURES_VALID;
 
 	/* Can't intercept CR register access, HV can't modify CR registers */
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 99357de14034..2ae82dc058c9 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5304,6 +5304,23 @@ static void *svm_alloc_apic_backing_page(struct kvm_vcpu *vcpu)
 	return page_address(page);
 }
 
+static struct kvm_plane *svm_alloc_plane(void)
+{
+	struct kvm_svm_plane *svm_plane = kzalloc(sizeof(*svm_plane), GFP_KERNEL_ACCOUNT);
+
+	if (svm_plane)
+		return &svm_plane->plane;
+
+	return NULL;
+}
+
+static void svm_free_plane(struct kvm_plane *plane)
+{
+	struct kvm_svm_plane *svm_plane = to_kvm_svm_plane(plane);
+
+	kfree(svm_plane);
+}
+
 struct kvm_x86_ops svm_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
 
@@ -5446,8 +5463,8 @@ struct kvm_x86_ops svm_x86_ops __initdata = {
 	.gmem_invalidate = sev_gmem_invalidate,
 	.gmem_max_mapping_level = sev_gmem_max_mapping_level,
 
-	.alloc_plane = x86_alloc_plane,
-	.free_plane = x86_free_plane,
+	.alloc_plane = svm_alloc_plane,
+	.free_plane = svm_free_plane,
 	.max_planes = kvm_x86_default_max_planes,
 };
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 7d27ed7099a8..57033922ddcf 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -110,7 +110,6 @@ struct kvm_sev_info {
 	unsigned long pages_locked; /* Number of pages locked */
 	struct list_head regions_list;  /* List of registered regions */
 	u64 ap_jump_table;	/* SEV-ES AP Jump Table address */
-	u64 vmsa_features;
 	u16 ghcb_version;	/* Highest guest GHCB protocol version allowed */
 	struct kvm *enc_context_owner; /* Owner of copied encryption context */
 	struct list_head mirror_vms; /* List of VMs mirroring */
@@ -140,6 +139,15 @@ struct kvm_svm {
 #endif
 };
 
+struct kvm_sev_info_plane {
+	u64 vmsa_features;
+};
+
+struct kvm_svm_plane {
+	struct kvm_plane plane;
+	struct kvm_sev_info_plane sev_info_plane;
+};
+
 struct kvm_vcpu;
 
 struct kvm_vmcb_info {
@@ -394,6 +402,16 @@ static __always_inline struct kvm_svm *to_kvm_svm(struct kvm *kvm)
 	return container_of(kvm, struct kvm_svm, kvm);
 }
 
+static __always_inline struct kvm_svm_plane *to_kvm_svm_plane(struct kvm_plane *plane)
+{
+	return container_of(plane, struct kvm_svm_plane, plane);
+}
+
+static __always_inline struct kvm_sev_info_plane *to_kvm_sev_info_plane(struct kvm_plane *plane)
+{
+	return &to_kvm_svm_plane(plane)->sev_info_plane;
+}
+
 #ifdef CONFIG_KVM_AMD_SEV
 static __always_inline struct kvm_sev_info *to_kvm_sev_info(struct kvm *kvm)
 {
@@ -413,7 +431,7 @@ static __always_inline bool ____sev_es_guest(struct kvm *kvm)
 
 static __always_inline bool ____sev_snp_guest(struct kvm *kvm)
 {
-	struct kvm_sev_info *sev = to_kvm_sev_info(kvm);
+	struct kvm_sev_info_plane *sev = to_kvm_sev_info_plane(kvm->planes[0]);
 
 	return (sev->vmsa_features & SVM_SEV_FEAT_SNP_ACTIVE) &&
 	       !WARN_ON_ONCE(!____sev_es_guest(kvm));
@@ -984,7 +1002,7 @@ void sev_snp_cancel_injection(struct kvm_vcpu *vcpu);
 bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu);
 static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu)
 {
-	struct kvm_sev_info *sev = &to_kvm_svm(vcpu->kvm)->sev_info;
+	struct kvm_sev_info_plane *sev = &to_kvm_svm_plane(vcpu->plane)->sev_info_plane;
 
 	return is_sev_snp_guest(vcpu) &&
 		(sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION);
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
