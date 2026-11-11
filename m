Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C6C606A336
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sIRMo5Rm;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=eSSA3SuQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LQ4LeUke+BM38InrpCg1dIIRLNpNjErbBsf443E2hTw=; b=sIRMo5RmcU66fJ1AD7xYe+CsCw
	M3WNnWh+F04EZmCxd1dKqDx9kNq1RTstB/FPcLqiqSYCmJT+ZaitIgnc2TRIa4+pRmDcCstm8BMs8
	GnUyaHvyTSDHXZP3cBxBcpeOTXshZQKOdX+VhNnbCi+bG8PflNLYFzjkuOaog4soIRBqmlf4C0Cop
	NagobU/jT2wpvIxd2/P9Xw8OWl12HwMKK0yN3THYEnk1BWvQiZgQmjjlLsKwNt64zUu8ZdYe2BCTL
	ezhYaIKDt3fS5jP7z5ekDc2tQFns7oH4piTpzkh4XMHWvBVne6/nD/3A0+yG0e0S/WLVmeTM1wDa4
	tTNRj/Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoe-00000007xIq-0aoz;
	Wed, 11 Nov 2026 22:29:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xH8-2N5R
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=qg4dsdUWrHNUQGIYWhI/E4Pn9hGFAoeUGWOQoX7lETY=; b=eSSA3SuQlMt5A4ymjSKbZ4+3Y5
	AY9qhyQp3oXaXy6RZeBtmnzhVnanUq1wb//9yniM02VUx8As/MNIL3+jCss/Pb44IrMnQ8jh97dEj
	NskmtlWGnjyxGp3Weh8hZHxQHKl2NsRhd0hYgp3mnzZlqqiCj2GYFBx+AS/ZHqNGpBzrizzfWfS1I
	h/e/UOa93aiNYt9+86iVvc27QrIRdmR3iObd0qhfL4hQd0qwN8DMBTxkuwNtelg3jKpP3KN5gCHQy
	X/IuhYxTDKtWSR29mY6ON/CkeH1S81Sr4I+siXlOSI3cgyUQ4EVe2F3i+b13mubg+hBAlrOwNguw1
	H2Lq/5HQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoZ-0000000G3nj-3d0K;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoZ-0000000007v-2PTR;
	Wed, 11 Nov 2026 22:29:11 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
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
	joerg.roedel@amd.com,
	Mushahid Hussain <hmushi@amazon.co.uk>,
	Sriram Nambakam <snambakam@linux.microsoft.com>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: [PATCH 02/16] KVM: SVM: Derive the plane limit from the immutable VM type
Date: Wed, 11 Nov 2026 14:28:57 -0800
Message-ID: <20261111222911.477-3-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261111222911.477-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261111222911.477-1-dwmw2@infradead.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: David Woodhouse <dwmw@amazon.co.uk>

svm_max_planes() calls ____sev_snp_guest() without kvm->lock, from
KVM_CHECK_EXTENSION(KVM_CAP_PLANES). That races __sev_guest_init(),
which sets and rolls back sev->active/es_active/SNP_ACTIVE under
kvm->lock, and userspace can force the rollback (ASID exhaustion,
firmware init failure). It is exactly the rule
kvm_lockdep_assert_sev_lock_held() documents, dodged by using the
assertion-free helper. It also leaves KVM_CREATE_PLANE's pre-lock
bound check with a limit that can change under it.

Key SNP-ness off kvm->arch.vm_type == KVM_X86_SNP_VM instead, which is
fixed at VM creation. While there, tidy the max_planes plumbing:

 - floor sev_snp_max_planes() at 1, so a host CPUID reporting zero
   VMPLs cannot make the VM report no planes at all;
 - drop the sev_nr_vcpu_planes() declaration, which has no definition
   or caller;
 - drop the !CONFIG_KVM_AMD_SEV sev_snp_max_planes() stub, dead since
   its only caller sits under the same #ifdef (and its return type
   disagreed with the declaration).

Fixes the unlocked SEV state check in "kvm: svm: Implement max_planes
x86 operation".

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/kvm/20260608233359.644B01F00893@smtp.kernel.org/
Fixes: https://lore.kernel.org/all/20260608144252.351443-60-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/svm/sev.c |  6 +++++-
 arch/x86/kvm/svm/svm.c | 11 ++++++++++-
 arch/x86/kvm/svm/svm.h |  2 --
 3 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index bb61bdf9e336..fd7605e47216 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -6000,5 +6000,9 @@ bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu)
 
 int sev_snp_max_planes(struct kvm *kvm)
 {
-	return vmpl_levels;
+	/*
+	 * CPUID 0x8000001f EBX[15:12] is host-provided data; a zero there
+	 * must not report "no planes at all" (plane 0 always exists).
+	 */
+	return max(vmpl_levels, 1U);
 }
diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
index 6cc070952b93..1848136f3bb9 100644
--- a/arch/x86/kvm/svm/svm.c
+++ b/arch/x86/kvm/svm/svm.c
@@ -5517,7 +5517,16 @@ static void svm_free_plane(struct kvm_plane *plane)
 static unsigned svm_max_planes(struct kvm *kvm)
 {
 #ifdef CONFIG_KVM_AMD_SEV
-	if (____sev_snp_guest(kvm))
+	/*
+	 * Key SNP-ness off the immutable vm_type, not the mutable SEV
+	 * state: KVM_CHECK_EXTENSION(KVM_CAP_PLANES) reaches here with no
+	 * lock held, while __sev_guest_init() sets and rolls back
+	 * sev->active/es_active/SNP_ACTIVE under kvm->lock.  The VM type
+	 * is fixed at creation, so the lockless read neither races the
+	 * rollback nor lets the limit change under KVM_CREATE_PLANE's
+	 * pre-lock bound check.
+	 */
+	if (kvm->arch.vm_type == KVM_X86_SNP_VM)
 		return sev_snp_max_planes(kvm);
 #endif
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 00ce3f4ef497..2b7663722be6 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -1069,7 +1069,6 @@ static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu)
 	return is_sev_snp_guest(vcpu) &&
 		(sev->vmsa_features & SVM_SEV_FEAT_RESTRICTED_INJECTION);
 };
-int sev_nr_vcpu_planes(struct kvm *kvm);
 int sev_snp_max_planes(struct kvm *kvm);
 #else
 static inline struct page *snp_safe_alloc_page_node(int node, gfp_t gfp)
@@ -1104,7 +1103,6 @@ static inline bool sev_snp_inject(enum inject_type type, struct kvm_vcpu *vcpu)
 static inline void sev_snp_cancel_injection(struct kvm_vcpu *vcpu) {}
 static inline bool sev_snp_blocked(enum inject_type type, struct kvm_vcpu *vcpu) { return false; }
 static inline bool sev_snp_is_rinj_active(struct kvm_vcpu *vcpu) { return false; }
-static inline unsigned sev_snp_max_planes(struct kvm *kvm) { return 1; }
 #endif
 
 /* vmenter.S */
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
