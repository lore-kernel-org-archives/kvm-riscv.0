Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF9606A339
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Nov 2026 22:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eXCatijX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Pm4SuBXS
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=nnTQcYnps2+jy+3THdrbS8xDYM96NbHu69sH9UvnYxg=; b=eXCatijX26xfslz7F1JcOMv32X
	YfIfkPqNYlXIentoAng4UTqlIkS37xT4WKAYJQ1wBZISFgxpnSMbfy5IQ9ZE4YFqRKwlG1gbkzdIV
	elwD2XAh9xxv8O23jgpsgjJPhv0FRBUzYm+zC+sUuhwCK+l0YFK+6xG/Tyx66qAgMgFTtn4FZCQVS
	fEwnVSPwMU0ZWyziKMGh6SqFmsIeEmuVy7mAlUbus184MhvhHdA+OQ6CZjh2x5SZRv98WH2X7+mDA
	TagB56L+Y/ku4R0hiuT/3TeGmMKC9QBlBtgq2tyZnRnu4tV3PI7sAz8Hq2wsoAcUUxUuWScR7gltn
	K2FKA+Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGod-00000007xIi-49Zy;
	Wed, 11 Nov 2026 22:29:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoc-00000007xH2-2NVb
	for kvm-riscv@bombadil.infradead.org;
	Wed, 11 Nov 2026 22:29:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=KgKBmfNow48cZ1G10epSivTTjrObHChEEXVuHDKOCn8=; b=Pm4SuBXS8SoBqJZi9NmFWsZy9L
	x0MVQqHd1l+IslxepicxxQh2nE6uQ9N5mEoR6whjfR2AZEz0psaZYeVvZrGpompc62cXG3u+5ARTk
	pcOkzQ+oqbY2/rACT0DRF9FDvvrAzai3SmStFzKXJNu/QPMJdWkOzaWIq/k3DtCl2jZBwvP6AN6XO
	UbzUJXfObyZ6n4anyORINk1sg/CGhCBAhpV2N8FAlMjebExTQ6poCdOsdWybSf5ywhurcd2eOp2Xp
	TdgU8Yc54ANXwBz9lKNifs4DgAAREosK5RNlgVCYs8BHe1r9NCJZmwK0oo0q+fcChzZ1LcYpMCF1i
	PND7Y70A==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRGoZ-0000000G3nm-43bK;
	Wed, 11 Nov 2026 22:29:12 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRGoZ-00000000088-35Wr;
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
Subject: [PATCH 05/16] KVM: x86: Initialise Hyper-V state on every plane vCPU
Date: Wed, 11 Nov 2026 14:29:00 -0800
Message-ID: <20261111222911.477-6-dwmw2@infradead.org>
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

When userspace sets a Hyper-V CPUID, kvm_set_cpuid() walks the vCPU's
planes to allocate the per-plane kvm_vcpu_hv, but passes the plane-0
vCPU to kvm_hv_vcpu_init() on every iteration. Non-zero plane vCPUs
are left without hv_vcpu, which trips the
WARN_ON_ONCE(vcpu->arch.hyperv_enabled) in kvm_hv_set_cpuid() and
leaves their vp_index and SynIC state uninitialised until a lazy init
path happens to run. Pass the plane vCPU being iterated.

A twin created *after* KVM_SET_CPUID never passes through
kvm_set_cpuid() at all, but shares a CPUID that already advertises
Hyper-V. Allocate its context in kvm_arch_vcpu_create(), so that
-ENOMEM fails KVM_CREATE_VCPU on the plane fd rather than leaving one
twin silently without Hyper-V.

That allocation runs before the twin's vcpu->vcpu_idx is assigned, so
kvm_hv_vcpu_init() takes the default VP index from the common, which
already holds it. With vcpu->vcpu_idx the twin would latch 0xFFFFFFFF,
and a host write of the real index to HV_X64_MSR_VP_INDEX would then
decrement num_mismatched_vp_indexes for a mismatch that was never
counted. (Assigning vcpu->vcpu_idx earlier instead would defeat the
"vcpu_idx < 0 means unreachable" test that to_hv_vcpu()'s lockdep
assertion falls back on during creation.)

Also admit KVM_ENABLE_CAP on plane vCPU fds, so userspace can enable
per-vCPU capabilities such as KVM_CAP_HYPERV_SYNIC2 on a plane vCPU
before it first runs.

Fixes the Hyper-V initialisation of plane vCPUs in "kvm: x86: Update
state for all plane VCPUs after CPUID update" and "KVM: Implement
KVM_CREATE_VCPU ioctl for planes".

Fixes: https://lore.kernel.org/all/20260608144252.351443-46-joro@8bytes.org/
Fixes: https://lore.kernel.org/all/20260608144252.351443-34-joro@8bytes.org/
Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 arch/x86/kvm/cpuid.c  |  4 ++--
 arch/x86/kvm/cpuid.h  |  1 +
 arch/x86/kvm/hyperv.c |  7 ++++++-
 arch/x86/kvm/x86.c    | 20 +++++++++++++++++++-
 4 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/cpuid.c b/arch/x86/kvm/cpuid.c
index 7a32f658238a..54bcfedc5226 100644
--- a/arch/x86/kvm/cpuid.c
+++ b/arch/x86/kvm/cpuid.c
@@ -326,7 +326,7 @@ static void kvm_update_cpuid_runtime(struct kvm_vcpu *vcpu)
 						 vcpu->arch.ia32_xss, true);
 }
 
-static bool kvm_cpuid_has_hyperv(struct kvm_vcpu *vcpu)
+bool kvm_cpuid_has_hyperv(struct kvm_vcpu *vcpu)
 {
 #ifdef CONFIG_KVM_HYPERV
 	struct kvm_cpuid_entry2 *entry;
@@ -553,7 +553,7 @@ static int kvm_set_cpuid(struct kvm_vcpu *vcpu, struct kvm_cpuid_entry2 *e2,
 #ifdef CONFIG_KVM_HYPERV
 	if (kvm_cpuid_has_hyperv(vcpu)) {
 		vcpu_for_each_plane(common, i, v) {
-			r = kvm_hv_vcpu_init(vcpu);
+			r = kvm_hv_vcpu_init(v);
 			if (r)
 				goto err;
 		}
diff --git a/arch/x86/kvm/cpuid.h b/arch/x86/kvm/cpuid.h
index 2abfab4b1c33..02dbd02c8f80 100644
--- a/arch/x86/kvm/cpuid.h
+++ b/arch/x86/kvm/cpuid.h
@@ -21,6 +21,7 @@ static inline void kvm_finalize_cpu_caps(void)
 }
 
 void kvm_vcpu_after_set_cpuid(struct kvm_vcpu *vcpu);
+bool kvm_cpuid_has_hyperv(struct kvm_vcpu *vcpu);
 struct kvm_cpuid_entry2 *kvm_find_cpuid_entry2(struct kvm_cpuid_entry2 *entries,
 					       int nent, u32 function, u64 index);
 /*
diff --git a/arch/x86/kvm/hyperv.c b/arch/x86/kvm/hyperv.c
index 1855b7e13e82..0b7440d09d49 100644
--- a/arch/x86/kvm/hyperv.c
+++ b/arch/x86/kvm/hyperv.c
@@ -997,7 +997,12 @@ int kvm_hv_vcpu_init(struct kvm_vcpu *vcpu)
 	for (i = 0; i < ARRAY_SIZE(hv_vcpu->stimer); i++)
 		stimer_init(&hv_vcpu->stimer[i], i);
 
-	hv_vcpu->vp_index = vcpu->vcpu_idx;
+	/*
+	 * A plane twin is initialised here from kvm_arch_vcpu_create(),
+	 * before vcpu->vcpu_idx is assigned; the index it is about to
+	 * get is already in the shared common.
+	 */
+	hv_vcpu->vp_index = vcpu->common->vcpu_idx;
 
 	for (i = 0; i < HV_NR_TLB_FLUSH_FIFOS; i++) {
 		INIT_KFIFO(hv_vcpu->tlb_flush_fifo[i].entries);
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 2e38eaa0b7df..25f574bfbb32 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -3467,6 +3467,7 @@ static int kvm_vcpu_ioctl_enable_cap(struct kvm_vcpu *vcpu,
 bool kvm_arch_is_vcpu_plane_ioctl(unsigned ioctl)
 {
 	switch (ioctl) {
+	case KVM_ENABLE_CAP:
 	case KVM_GET_DEBUGREGS:
 	case KVM_SET_DEBUGREGS:
 	case KVM_GET_LAPIC:
@@ -9635,9 +9636,24 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu->arch.hv_root_tdp = INVALID_PAGE;
 #endif
 
+	/*
+	 * A plane twin created after KVM_SET_CPUID shares CPUID that may
+	 * already advertise Hyper-V.  Allocate the Hyper-V context now so
+	 * a failure fails the creation; left to kvm_vcpu_after_set_cpuid()
+	 * below, an -ENOMEM silently downgrades just this twin to no
+	 * Hyper-V (its MSRs fail) while the shared CPUID still advertises
+	 * the Hyper-V signature, and nothing short of another full
+	 * KVM_SET_CPUID repairs it.
+	 */
+	if (kvm_cpuid_has_hyperv(vcpu)) {
+		r = kvm_hv_vcpu_init(vcpu);
+		if (r)
+			goto free_guest_fpu;
+	}
+
 	r = kvm_x86_call(vcpu_create)(vcpu);
 	if (r)
-		goto free_guest_fpu;
+		goto free_hv;
 
 	kvm_xen_init_vcpu(vcpu);
 	vcpu_load(vcpu);
@@ -9648,6 +9664,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	vcpu_put(vcpu);
 	return 0;
 
+free_hv:
+	kvm_hv_vcpu_uninit(vcpu);
 free_guest_fpu:
 	fpu_free_guest_fpstate(&vcpu->arch.guest_fpu);
 free_emulate_ctxt:
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
