Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE580CD8CB2
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NFWjR5QDIU/y5xL3hgIvwWBbPHLcwYUsHFLGByeiX+0=; b=1uA9B13JVZY4Yn
	zhIoufVjQJKQXz2dZfjfrOicjAQOe8DhosTB9eFq3ZTlScENjd0VekfsVZkXIycVYzCc6yDJ/n//h
	RG46OIfmIvSij9v9xDvm1e6idzOK0G6ji+PfJ3nDcF7EM9E0LhUPIdx15ejLxIXg87o4OwmisgoEZ
	rTbGxz1UG58s5uE+SiL76lcgaIPShtJFGOHymlf7qiet2+8ZgTq4j6BjZNc4fYmb7dHn0Y310WdTe
	F7zW+k2w4UfP9zMmN45gRm2GYIiuk4QylAoGZT5xd6WoNkqqMA+keoK+AnIov4fwzp/Kwh/ayRsbB
	ZiT7786879I02WTcYfLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCS-00000003qGw-1QDS;
	Mon, 08 Jun 2026 14:43:36 +0000
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCB-00000003pTb-3mvB
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 50CD62028CE;
	Mon,  8 Jun 2026 16:43:14 +0200 (CEST)
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
Subject: [PATCH 43/60] kvm: x86: Move CPUID state to struct kvm_vcpu_arch_common
Date: Mon,  8 Jun 2026 16:42:35 +0200
Message-ID: <20260608144252.351443-44-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_074320_132655_2D26E9BA 
X-CRM114-Status: GOOD (  18.91  )
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

The CPUID state is shared across all planes, so move it to struct
kvm_vcpu_arch_common.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h | 17 ++++++++--------
 arch/x86/kvm/cpuid.c            | 36 +++++++++++++++++++--------------
 arch/x86/kvm/cpuid.h            | 14 ++++++++++---
 arch/x86/kvm/lapic.c            |  2 +-
 arch/x86/kvm/smm.c              |  2 +-
 arch/x86/kvm/svm/svm.c          |  2 +-
 arch/x86/kvm/vmx/vmx.c          |  2 +-
 arch/x86/kvm/x86.c              | 17 ++++++++++++----
 8 files changed, 58 insertions(+), 34 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 11e52f8bb2c2..3a64bdae6e23 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -794,10 +794,16 @@ enum kvm_only_cpuid_leafs {
 	NKVMCAPINTS = NR_KVM_CPU_CAPS - NCAPINTS,
 };
 
-struct kvm_vcpu_arch_common {};
+struct kvm_vcpu_arch_common {
+	/* CPUID related state */
+	int cpuid_nent;
+	struct kvm_cpuid_entry2 *cpuid_entries;
+	bool cpuid_dynamic_bits_dirty;
+	bool is_amd_compatible;
+};
 
-static inline int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common) { return 0; }
-static inline void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common) {}
+int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common);
+void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common);
 
 struct kvm_vcpu_arch {
 	/*
@@ -919,11 +925,6 @@ struct kvm_vcpu_arch {
 
 	int halt_request; /* real mode on Intel only */
 
-	int cpuid_nent;
-	struct kvm_cpuid_entry2 *cpuid_entries;
-	bool cpuid_dynamic_bits_dirty;
-	bool is_amd_compatible;
-
 	/*
 	 * cpu_caps holds the effective guest capabilities, i.e. the features
 	 * the vCPU is allowed to use.  Typically, but not always, features can
diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index e69156b54cff..6d948d63306c 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -176,6 +176,7 @@ static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu);
 static int kvm_cpuid_check_equal(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 				 int nent)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_cpuid_entry2 *orig;
 	int i;
 
@@ -188,11 +189,11 @@ static int kvm_cpuid_check_equal(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2
 	kvm_update_cpuid_runtime(vcpu);
 	kvm_apply_cpuid_pv_features_quirk(vcpu);
 
-	if (nent != vcpu->arch.cpuid_nent)
+	if (nent != common->arch.cpuid_nent)
 		return -EINVAL;
 
 	for (i = 0; i < nent; i++) {
-		orig = &vcpu->arch.cpuid_entries[i];
+		orig = &common->arch.cpuid_entries[i];
 		if (e2[i].function != orig->function ||
 		    e2[i].index != orig->index ||
 		    e2[i].flags != orig->flags ||
@@ -290,7 +291,7 @@ static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpuid_entry2 *best;
 
-	vcpu->arch.cpuid_dynamic_bits_dirty = false;
+	vcpu->common->arch.cpuid_dynamic_bits_dirty = false;
 
 	best = kvm_find_cpuid_entry(vcpu, 1);
 	if (best) {
@@ -374,6 +375,7 @@ static int cpuid_func_emulated(struct kvm_cpuid_entry2 *entry, u32 func,
 
 void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_lapic *apic = vcpu->arch.apic;
 	struct kvm_cpuid_entry2 *best;
 	struct kvm_cpuid_entry2 *entry;
@@ -443,7 +445,7 @@ void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu)
 
 	vcpu->arch.pv_cpuid.features = kvm_apply_cpuid_pv_features_quirk(vcpu);
 
-	vcpu->arch.is_amd_compatible = guest_cpuid_is_amd_or_hygon(vcpu);
+	common->arch.is_amd_compatible = guest_cpuid_is_amd_or_hygon(vcpu);
 	vcpu->arch.maxphyaddr = cpuid_query_maxphyaddr(vcpu);
 	vcpu->arch.reserved_gpa_bits = kvm_vcpu_reserved_gpa_bits_raw(vcpu);
 
@@ -509,6 +511,7 @@ u64 kvm_vcpu_reserved_gpa_bits_raw(struct kvm_vcpu *vcpu)
 static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
                         int nent)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
 	u32 vcpu_caps[NR_KVM_CPU_CAPS];
 	int r;
 
@@ -516,7 +519,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	 * Apply pending runtime CPUID updates to the current CPUID entries to
 	 * avoid false positives due to mismatches on KVM-owned feature flags.
 	 */
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
 	/*
@@ -530,8 +533,8 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 	 * updates.  Full initialization is done if and only if the vCPU hasn't
 	 * run, i.e. only if userspace is potentially changing CPUID features.
 	 */
-	swap(vcpu->arch.cpuid_entries, e2);
-	swap(vcpu->arch.cpuid_nent, nent);
+	swap(common->arch.cpuid_entries, e2);
+	swap(common->arch.cpuid_nent, nent);
 
 	memcpy(vcpu_caps, vcpu->arch.cpu_caps, sizeof(vcpu_caps));
 	BUILD_BUG_ON(sizeof(vcpu_caps) != sizeof(vcpu->arch.cpu_caps));
@@ -580,8 +583,8 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 
 err:
 	memcpy(vcpu->arch.cpu_caps, vcpu_caps, sizeof(vcpu_caps));
-	swap(vcpu->arch.cpuid_entries, e2);
-	swap(vcpu->arch.cpuid_nent, nent);
+	swap(common->arch.cpuid_entries, e2);
+	swap(common->arch.cpuid_nent, nent);
 	return r;
 }
 
@@ -658,17 +661,19 @@ int kvm_vcpu_ioctl_get_cpuid2(struct kvm_vcpu *vcpu,
 			      struct kvm_cpuid2 *cpuid,
 			      struct kvm_cpuid_entry2 __user *entries)
 {
-	if (cpuid->nent < vcpu->arch.cpuid_nent)
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	if (cpuid->nent < common->arch.cpuid_nent)
 		return -E2BIG;
 
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
-	if (copy_to_user(entries, vcpu->arch.cpuid_entries,
-			 vcpu->arch.cpuid_nent * sizeof(struct kvm_cpuid_entry2)))
+	if (copy_to_user(entries, common->arch.cpuid_entries,
+			 common->arch.cpuid_nent * sizeof(struct kvm_cpuid_entry2)))
 		return -EFAULT;
 
-	cpuid->nent = vcpu->arch.cpuid_nent;
+	cpuid->nent = common->arch.cpuid_nent;
 	return 0;
 }
 
@@ -2089,10 +2094,11 @@ bool kvm_cpuid(struct kvm_vcpu *vcpu, u32 *eax, u32 *ebx,
 	       u32 *ecx, u32 *edx, bool exact_only)
 {
 	u32 orig_function = *eax, function = *eax, index = *ecx;
+	struct kvm_vcpu_common *common = vcpu->common;
 	struct kvm_cpuid_entry2 *entry;
 	bool exact, used_max_basic = false;
 
-	if (vcpu->arch.cpuid_dynamic_bits_dirty)
+	if (common->arch.cpuid_dynamic_bits_dirty)
 		kvm_update_cpuid_runtime(vcpu);
 
 	entry = kvm_find_cpuid_entry_index(vcpu, function, index);
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 039b8e6f40ba..143ea8531611 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -36,14 +36,18 @@ struct kvm_cpuid_entry2 *kvm_find_cpuid_entry2(struct kvm_cpuid_entry2 *entries,
 static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry_index(struct kvm_vcpu *vcpu,
 								  u32 function, u32 index)
 {
-	return kvm_find_cpuid_entry2(vcpu->arch.cpuid_entries, vcpu->arch.cpuid_nent,
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	return kvm_find_cpuid_entry2(common->arch.cpuid_entries, common->arch.cpuid_nent,
 				     function, index);
 }
 
 static inline struct kvm_cpuid_entry2 *kvm_find_cpuid_entry(struct kvm_vcpu *vcpu,
 							    u32 function)
 {
-	return kvm_find_cpuid_entry2(vcpu->arch.cpuid_entries, vcpu->arch.cpuid_nent,
+	struct kvm_vcpu_common *common = vcpu->common;
+
+	return kvm_find_cpuid_entry2(common->arch.cpuid_entries, common->arch.cpuid_nent,
 				     function, KVM_CPUID_INDEX_NOT_SIGNIFICANT);
 }
 
@@ -135,7 +139,7 @@ static __always_inline bool guest_cpuid_has(struct kvm_vcpu *vcpu,
 
 static inline bool guest_cpuid_is_amd_compatible(struct kvm_vcpu *vcpu)
 {
-	return vcpu->arch.is_amd_compatible;
+	return vcpu->common->arch.is_amd_compatible;
 }
 
 static inline bool guest_cpuid_is_intel_compatible(struct kvm_vcpu *vcpu)
@@ -300,4 +304,8 @@ static inline bool guest_has_pred_cmd_msr(struct kvm_vcpu *vcpu)
 		guest_cpu_cap_has(vcpu, X86_FEATURE_SBPB));
 }
 
+static inline void cpuid_set_dirty(struct kvm_vcpu *vcpu)
+{
+	vcpu->common->arch.cpuid_dynamic_bits_dirty = true;
+}
 #endif
diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index cac076445472..dc7a08831a54 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2754,7 +2754,7 @@ static void __kvm_apic_set_base(struct kvm_vcpu *vcpu, u64 value)
 	vcpu->arch.apic_base = value;
 
 	if ((old_value ^ value) & MSR_IA32_APICBASE_ENABLE)
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 
 	if (!apic)
 		return;
diff --git a/arch/x86/kvm/smm.c b/arch/x86/kvm/smm.c
index f623c5986119..736ab345b9fd 100644
--- a/arch/x86/kvm/smm.c
+++ b/arch/x86/kvm/smm.c
@@ -363,7 +363,7 @@ void enter_smm(struct kvm_vcpu *vcpu)
 			goto error;
 #endif
 
-	vcpu->arch.cpuid_dynamic_bits_dirty = true;
+	cpuid_set_dirty(vcpu);
 	kvm_mmu_reset_context(vcpu);
 	return;
 error:
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index e8ad880a4266..612db7ad8b2a 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -1848,7 +1848,7 @@ void svm_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	vmcb_mark_dirty(to_svm(vcpu)->vmcb, VMCB_CR);
 
 	if ((cr4 ^ old_cr4) & (X86_CR4_OSXSAVE | X86_CR4_PKE))
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 }
 
 static void svm_set_segment(struct kvm_vcpu *vcpu,
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 20262855bfe8..62e180651143 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -3595,7 +3595,7 @@ void vmx_set_cr4(struct kvm_vcpu *vcpu, unsigned long cr4)
 	vmcs_writel(GUEST_CR4, hw_cr4);
 
 	if ((cr4 ^ old_cr4) & (X86_CR4_OSXSAVE | X86_CR4_PKE))
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 }
 
 void vmx_get_segment(struct kvm_vcpu *vcpu, struct kvm_segment *var, int seg)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 7fc08df245bd..7e94a378b3d2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -1322,7 +1322,7 @@ int __kvm_set_xcr(struct kvm_vcpu *vcpu, u32 index, u64 xcr)
 	vcpu->arch.xcr0 = xcr0;
 
 	if ((xcr0 ^ old_xcr0) & XFEATURE_MASK_EXTEND)
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 	return 0;
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(__kvm_set_xcr);
@@ -4089,7 +4089,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			if (!guest_cpu_cap_has(vcpu, X86_FEATURE_XMM3))
 				return 1;
 			vcpu->arch.ia32_misc_enable_msr = data;
-			vcpu->arch.cpuid_dynamic_bits_dirty = true;
+			cpuid_set_dirty(vcpu);
 		} else {
 			vcpu->arch.ia32_misc_enable_msr = data;
 		}
@@ -4121,7 +4121,7 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		if (vcpu->arch.ia32_xss == data)
 			break;
 		vcpu->arch.ia32_xss = data;
-		vcpu->arch.cpuid_dynamic_bits_dirty = true;
+		cpuid_set_dirty(vcpu);
 		break;
 	case MSR_SMI_COUNT:
 		if (!msr_info->host_initiated)
@@ -13034,7 +13034,16 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 	kvm_mmu_destroy(vcpu);
 	srcu_read_unlock(&vcpu->kvm->srcu, idx);
 	free_page((unsigned long)vcpu->arch.pio_data);
-	kvfree(vcpu->arch.cpuid_entries);
+}
+
+int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common)
+{
+	return 0;
+}
+
+void kvm_arch_vcpu_common_destroy(struct kvm_vcpu_common *common)
+{
+	kvfree(common->arch.cpuid_entries);
 }
 
 static void kvm_xstate_reset(struct kvm_vcpu *vcpu, bool init_event)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
