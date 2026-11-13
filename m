Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAC2606A32E
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 18:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=bTuolQZS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=oxtqnu7y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8OBY4UV0omJTmdK5TVhUsMQdwLR9HomMm1/8Zg1sZVo=; b=bTuolQZS0YdmWmfuzA4mdHOD+Z
	wDJiTc7tqjE7NIDkOOSHeH6NZdnnEqmUZnaFUHBs2cYY5gCUdij4QN3eMTBoCxxO0wKmSyCH0191D
	dSShCEiI+KwJ6aCgAIZgpe1P2Iby2l63whOafFZzDBpWi3XixWf/tGg4l0MA90c3+LtKX/UWliJ8m
	J/wjZ5ujCvzOj/vUX9PJkT1yy37sG+qt3It44dr1m2u85RSDonEVNxiOJO73zP3dPiLOYFurf/Zdl
	I2D1GGWYsDB8eSr/Cryn8abIMOZWuOsSGOSi9dlqLnAZEyvk4UMQqkFTN2bFVllxuDraCifS0IxqJ
	Bji4hI7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyU-0000000DvfX-1bb2;
	Fri, 13 Nov 2026 18:26:10 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyT-0000000Dveq-2eeH
	for kvm-riscv@bombadil.infradead.org;
	Fri, 13 Nov 2026 18:26:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description;
	bh=3knGUwEX3LR/PwBuS8cYZDYxWXd5qe0dWzFQ3S99SZs=; b=oxtqnu7yOfVjjijBSQNv6hFkAT
	7rrf4C0IFfgpDJHNae3KAaOYtDlGhhNFvPZU2XMyUH8q9ZgayQiIx5CUPtgh3qKPmvkznd5baell4
	qT+nJLyntHk9jV723rPFRcZfvzas034jOQBPBiUCLpjjjk/eyQzeHqFCh6+Yg+ct4FZA7lVHTaTOW
	RgtSjD2ZNno3pTU8PAE6z7ZxMEAff7eFttgHQGG5tFvUWCa0Lk/NHsbfHE0mZ11lDeDs0MnyozGS8
	Ef1g2IAtTO8xtRJ2DCaeW/ucr+aaT7BEB+6hAAfjOGKwCCaEDO3TfXO+zWWbEmffSMa2YbnxgZpv9
	frzIfiMA==;
Received: from [2001:8b0:10b:1::425] (helo=i7.infradead.org)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRvyR-00000004cT3-3mmx;
	Fri, 13 Nov 2026 18:26:08 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xRvyR-00000000LYN-2yMj;
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
Subject: [RFC PATCH 09/13] KVM: x86: Let userspace choose state for plane twins to share
Date: Fri, 13 Nov 2026 11:26:03 -0700
Message-ID: <20261113182607.82813-10-dwmw2@infradead.org>
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

Which per-vCPU state the planes of a vCPU share is policy for the VMM.
Hyper-V VSM shares XCR0 between VTLs, and whether it shares DR6 depends
on the processor, as HvRegisterVsmCapabilities.Dr6Shared reports; a VMM
with a different privilege model may want neither. So far the only knob
is the plane count, which leaves nothing to key such sharing on but the
opt-in itself.

Take a mask of state to share in args[1] of KVM_ENABLE_CAP(KVM_CAP_PLANES),
set once together with the count. Unknown bits, and a non-zero args[2]
or args[3], fail with -EINVAL. A new KVM_CAP_PLANES_SHARE reports the
supported bits on the system fd and the enabled bits on a VM fd, as
KVM_CAP_PLANES reports the ceiling and the live count. No bits are
defined yet; the following patches add XCR0 and DR6.

Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
---
 Documentation/virt/kvm/api.rst  | 12 +++++++++++-
 arch/x86/include/asm/kvm_host.h |  1 +
 arch/x86/kvm/x86.c              |  8 ++++++++
 arch/x86/kvm/x86.h              | 11 +++++++++++
 include/uapi/linux/kvm.h        |  1 +
 5 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 4196f3fc5718..a6008cb33e99 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -9316,7 +9316,8 @@ hpage_2g module parameter is not set to 1, -EINVAL is returned.
 
 :Architectures: x86
 :Target: VM
-:Parameters: args[0] contains the number of planes to make available
+:Parameters: args[0] contains the number of planes to make available,
+             args[1] a mask of state that the planes of a vCPU share
 
 Opts the VM in to using multiple planes, raising the limit on plane ids
 that KVM_CREATE_PLANE accepts to args[0], which must be between 1 and the
@@ -9339,6 +9340,15 @@ This capability must be enabled before any vCPU or extra plane has been
 created, and the chosen count cannot be changed afterwards; otherwise
 -EEXIST is returned.
 
+Each plane of a vCPU normally keeps its own copy of the vCPU's register
+state, apart from the CPUID model, which the planes always share.  args[1]
+selects state that the planes of a vCPU share instead, so that a write
+through one plane is seen by all of them.  KVM_CHECK_EXTENSION
+(KVM_CAP_PLANES_SHARE) returns the bits KVM supports on the system fd, and
+the bits the VM enabled on a VM fd.  Setting an unsupported bit, or a
+non-zero args[2] or args[3], fails with -EINVAL.  Like the count, the mask
+is set once.
+
 8. Other capabilities.
 ======================
 
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 596be8ad7154..99a671ac2386 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1195,6 +1195,7 @@ struct kvm_arch {
 	bool has_protected_eoi;
 	bool has_protected_pmu;
 	bool pre_fault_allowed;
+	u8 plane_share;
 	unsigned int user_max_planes;
 	struct hlist_head *mmu_page_hash;
 	struct list_head active_mmu_pages;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index af28e73e4b9b..4d70e111eeb0 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -2460,6 +2460,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 	case KVM_CAP_VM_TSC_CONTROL:
 		r = kvm_caps.has_tsc_control;
 		break;
+	case KVM_CAP_PLANES_SHARE:
+		r = kvm ? READ_ONCE(kvm->arch.plane_share) : KVM_PLANE_SHARE_VALID;
+		break;
 	case KVM_CAP_X2APIC_API:
 		r = KVM_X2APIC_API_VALID_FLAGS;
 		if (kvm && !irqchip_split(kvm))
@@ -4174,6 +4177,10 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		r = -EINVAL;
 		if (cap->args[0] < 1 || cap->args[0] > KVM_MAX_USER_PLANES)
 			goto planes_unlock;
+		if (cap->args[1] & ~KVM_PLANE_SHARE_VALID)
+			goto planes_unlock;
+		if (cap->args[2] || cap->args[3])
+			goto planes_unlock;
 		/* Planes are only supported with a split irqchip. */
 		if (!irqchip_split(kvm))
 			goto planes_unlock;
@@ -4195,6 +4202,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 		if (kvm->created_vcpus || kvm->has_planes ||
 		    kvm->arch.user_max_planes)
 			goto planes_unlock;
+		WRITE_ONCE(kvm->arch.plane_share, cap->args[1]);
 		WRITE_ONCE(kvm->arch.user_max_planes, cap->args[0]);
 		r = 0;
 planes_unlock:
diff --git a/arch/x86/kvm/x86.h b/arch/x86/kvm/x86.h
index fb87ceaa9563..2f51b476dbd1 100644
--- a/arch/x86/kvm/x86.h
+++ b/arch/x86/kvm/x86.h
@@ -923,4 +923,15 @@ struct kvm_plane *x86_alloc_plane(void);
 void x86_free_plane(struct kvm_plane *plane);
 unsigned kvm_x86_default_max_planes(struct kvm *kvm);
 
+/*
+ * The per-vCPU state that userspace may ask the planes of a vCPU to share,
+ * in args[1] of KVM_ENABLE_CAP(KVM_CAP_PLANES).
+ */
+#define KVM_PLANE_SHARE_VALID	0
+
+static inline bool kvm_plane_shares(struct kvm *kvm, u64 state)
+{
+	return READ_ONCE(kvm->arch.plane_share) & state;
+}
+
 #endif
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index abf023ed78c4..aef86ef3976f 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1017,6 +1017,7 @@ struct kvm_enable_cap {
 #define KVM_CAP_ARM_PMU_V3_STRICT 251
 #define KVM_CAP_GUEST_MEMFD_MEMORY_ATTRIBUTES 252
 #define KVM_CAP_PLANES 254
+#define KVM_CAP_PLANES_SHARE 256
 
 struct kvm_irq_routing_irqchip {
 	__u32 irqchip;
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
