Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0C81606A330
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Uy8NzmHl;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=bymOiu+6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M9UADWsevKmQMcrZhK8cnWyazI6ezAFkQZzEstyWf2I=; b=Uy8NzmHlyOysMIVNZ3/YPYWAE9
	2QEa5L/M3VcvjkMng2QaoXM4gkGI/SxxJFaKGNF11qjkoWUj6qVZbUBmebnZSfwiAdeh8QsgphvIz
	6/MUiZbfwZ/wkHQ/C5M38iT/yCMRMhvEeNernfvYZpXusAYcruw3wkn/kt7jXXNfeIcdhSsaJFOAc
	GZolT2Jwhs4MtSincNQzRY/H8A3RKy1sxoQ/A9PVjIPYGzkEYD5TVQaEOBcQKn16QJNLVEa7EYjeh
	PW/SPNfvitZ3CeY8kUfMU4rdLUcOxp5dpHO5RNALCBaRuXyV2T5a/EmiifKOH0NTqompBm8k1W2wX
	h5oyfkSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyU-0000000DvfT-1Qsw;
	Fri, 13 Nov 2026 18:26:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyT-0000000Dven-2Zio
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=IX1iZaNJLB1qFWspuJQ627JyfU1mRPwlI1mRlrUZmuc=; b=bymOiu+6kimhBRiDzENbm3XDZC
	pfqZW0XcWU5qq6cfuVRFHEc3eGaFM8DlREQeS6M+MFvNAvHMcdVtGBW6tCRagT4qzPGpkhIRDtM/c
	Yqmf1VAdaiKPhfgv9cppdW59tICSP0umJ3J4ajnWuQuuvggzTBtC46aa4NR/R+64rwttGYSWm3RCU
	V3HQJi3bsyzakhlMs78UymZBOFwJn9W1tigGvazIpq0DuG04xyqC3ve1jxKIJLpVk7LOMQRDOqi3h
	FZq2Xu2TAe5LqfVxwKJSqdRu1YMJNfrAIMVIJF3EwFvaHJeBAPKD/ilfTIq3rrb0bY9igQHoriAsT
	4nDChIbQ==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyR-00000004cSz-3Qgp;
	Fri, 13 Nov 2026 18:26:07 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRvyR-00000000LYF-2eXe;
	Fri, 13 Nov 2026 18:26:07 +0000
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
Subject: [RFC PATCH 07/13] KVM: x86: Inhibit APICv when VM planes are enabled
Date: Fri, 13 Nov 2026 11:26:01 -0700
Message-ID: <20261113182607.82813-8-dwmw2@infradead.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113182607.82813-1-dwmw2@infradead.org>
References: <20260608144252.351443-1-joro@8bytes.org>
 <20261113182607.82813-1-dwmw2@infradead.org>
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

With APICv live on plane-0 vCPUs while their plane-1 twins use
software injection, the twins trip the APICv coherency checks: stale
vcpu-vs-VM activation state at vcpu_enter_guest(), and timer interrupt
injection against a vCPU that is not the running one. Cross-plane
event delivery depends on software-injection bookkeeping that hardware
acceleration bypasses.

Add APICV_INHIBIT_REASON_PLANES, set it when a plane above 0 is
created, and include it in the VMX and AVIC required-inhibit masks;
__kvm_set_or_clear_apicv_inhibit() silently ignores a reason the
vendor mask does not carry. Drop the inhibit again when the
KVM_CREATE_PLANE error path destroys the last nonzero plane of a live
VM; at VM teardown plane 0 is already gone and the update is skipped.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/svm/svm.h  |  3 ++-
 arch/x86/kvm/vmx/main.c |  3 ++-
 arch/x86/kvm/x86.c      | 41 +++++++++++++++++++++++++++++++++++++++++
 arch/x86/kvm/x86.h      |  8 ++++++++
 4 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index 2b7663722be6..e7fced399e05 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -982,7 +982,8 @@ extern struct kvm_x86_nested_ops svm_nested_ops;
 	BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |	\
 	BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED) |	\
 	BIT(APICV_INHIBIT_REASON_LOGICAL_ID_ALIASED) |	\
-	BIT(APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG)	\
+	BIT(APICV_INHIBIT_REASON_PHYSICAL_ID_TOO_BIG) |	\
+	BIT(APICV_INHIBIT_REASON_PLANES)		\
 )
 
 bool __init avic_hardware_setup(void);
diff --git a/arch/x86/kvm/vmx/main.c b/arch/x86/kvm/vmx/main.c
index 2d84910df724..14d21d02bff4 100644
--- a/arch/x86/kvm/vmx/main.c
+++ b/arch/x86/kvm/vmx/main.c
@@ -1004,7 +1004,8 @@ static int vt_handle_exit(struct kvm_vcpu *vcpu,
 	 BIT(APICV_INHIBIT_REASON_BLOCKIRQ) |			\
 	 BIT(APICV_INHIBIT_REASON_PHYSICAL_ID_ALIASED) |	\
 	 BIT(APICV_INHIBIT_REASON_APIC_ID_MODIFIED) |		\
-	 BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED))
+	 BIT(APICV_INHIBIT_REASON_APIC_BASE_MODIFIED) |	\
+	 BIT(APICV_INHIBIT_REASON_PLANES))
 
 struct kvm_x86_ops vt_x86_ops __initdata = {
 	.name = KBUILD_MODNAME,
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index e8cefde75838..6d3d93e85a65 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10247,12 +10247,53 @@ int kvm_arch_plane_init(struct kvm *kvm, struct kvm_plane *plane,
 {
 	mutex_init(&plane->arch.apic_map_lock);
 
+	/*
+	 * Cross-plane event delivery (forced VTL entry, twin kicks, NMI
+	 * folding) relies on software injection via KVM_REQ_EVENT; hardware
+	 * APIC virtualization on one twin would bypass the bookkeeping the
+	 * other twin's plane depends on.
+	 */
+	if (plane_level > 0)
+		kvm_set_apicv_inhibit(kvm, APICV_INHIBIT_REASON_PLANES);
+
 	return 0;
 }
 
 void kvm_arch_plane_destroy(struct kvm_plane *plane)
 {
+	struct kvm *kvm = plane->kvm;
+	int i;
+
 	kvfree(rcu_dereference_check(plane->arch.apic_map, 1));
+
+	if (plane->level == 0)
+		return;
+
+	/*
+	 * Drop the APICv inhibit taken in kvm_arch_plane_init() when the
+	 * last nonzero plane goes away.  Only the KVM_CREATE_PLANE error
+	 * path destroys a nonzero plane while the VM is live; at VM
+	 * teardown plane 0 is destroyed first and kvm->planes[0] is
+	 * already NULL, which skips the update (the inhibit machinery
+	 * needs plane 0 and SRCU, both gone by then).
+	 */
+	if (!kvm->planes[0])
+		return;
+
+	/*
+	 * Reaching here means a nonzero plane died while the VM is live,
+	 * which only the KVM_CREATE_PLANE error path does - under
+	 * kvm->lock.  A future kvm_destroy_planes() reordered to tear
+	 * nonzero planes down before plane 0 would get here locklessly;
+	 * catch that instead of silently poking freed APICv state.
+	 */
+	lockdep_assert_held(&kvm->lock);
+
+	for (i = 1; i < KVM_MAX_PLANES; i++)
+		if (kvm->planes[i] && kvm->planes[i] != plane)
+			return;
+
+	kvm_clear_apicv_inhibit(kvm, APICV_INHIBIT_REASON_PLANES);
 }
 
 int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index 498974d38773..fb87ceaa9563 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -580,6 +580,13 @@ enum kvm_apicv_inhibit {
 	APICV_INHIBIT_REASON_APIC_ID_MODIFIED,
 	APICV_INHIBIT_REASON_APIC_BASE_MODIFIED,
 
+	/*
+	 * APICv is inhibited when the VM has multiple planes (Hyper-V VTLs).
+	 * Cross-plane event delivery relies on software injection; hardware
+	 * acceleration on one twin would bypass it.
+	 */
+	APICV_INHIBIT_REASON_PLANES,
+
 	/******************************************************/
 	/* INHIBITs that are relevant only to the AMD's AVIC. */
 	/******************************************************/
@@ -637,6 +644,7 @@ enum kvm_apicv_inhibit {
 	__APICV_INHIBIT_REASON(PHYSICAL_ID_ALIASED),	\
 	__APICV_INHIBIT_REASON(APIC_ID_MODIFIED),	\
 	__APICV_INHIBIT_REASON(APIC_BASE_MODIFIED),	\
+	__APICV_INHIBIT_REASON(PLANES),			\
 	__APICV_INHIBIT_REASON(NESTED),			\
 	__APICV_INHIBIT_REASON(IRQWIN),			\
 	__APICV_INHIBIT_REASON(PIT_REINJ),		\
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
