Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 598D9CD8CBD
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUgviC4xb+PHKdJrIG6iC4wrpERkv7G8lVta1a51t+Q=; b=uHeOlDIs+iGo2f
	3fgJmIr6EYZuhWAtntK8LVPOqq7p4Squk7zTkRT5SmGP4YeXH0mASVlVr9GkK+lAwPGqS8vjZCW/z
	0UjtSwaN14l+PhM9EeZ057VXPTs0bAVcECjpFmcmupqsSmkdVLeWhdqSum+3gQjnOymorNoPejsHI
	3/u9XQ0yO+yVeHtZFWdZxU522+KBhQm+O4gk86unyE+LvhAepoySR1E8WNXuBEotMxKAGlkjQlNQM
	6j2tSq77MbYXy1lCiFG7rPHvYm7fdpxssmIxpOioHWkgys9tDQI6j2koAHCPO//qjxZSe9nT+n4SL
	INKefwzNQwGTUSGdHUEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCH-00000003puA-3GCp;
	Mon, 08 Jun 2026 14:43:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCC-00000003phn-1ixP
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=m0vec3q2r87JZbYocmzbbn8eTYWjMJPhatmO8uxz9Rk=; b=A82Dp7DDWbmuV6TEAcayG6dWgz
	3QoCpQAdHOdROqeU4ZpcYeF2DpoE6yv4c31JjSJp4lInI5nLtRKacE0WjTp6tXffw9M1EbBOhIFQz
	/sNAuJOSP55dhO+vPC0JA93h4QD8ryIQV4fPesLwWuomkiWUNrbFgaO4JcuZ73A+xGscicEXGbiIf
	OCdqHXXETRCOBOomZPHgdT/naoe9O2odXNwjlXsDyb9vs+tfb8DQfmovIYHPEHfHepSYrsQpk8Yg2
	0l39wjVeKZLFMReUxrTimGMjd5REer2fDSfSaMPlFulHIf/YmbaWpFirDvK1eDVXcvLuuFQ7IoqV5
	T2xOe/hg==;
Received: from mail.8bytes.org ([85.214.250.239])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbC7-0000000198t-2x0I
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:18 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 5A8A72028B6;
	Mon,  8 Jun 2026 16:43:09 +0200 (CEST)
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
Subject: [PATCH 20/60] kvm: Move kvm_vcpu mode and requests field to struct kvm_vcpu_common
Date: Mon,  8 Jun 2026 16:42:12 +0200
Message-ID: <20260608144252.351443-21-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154315_993916_E12B75A6 
X-CRM114-Status: GOOD (  11.19  )
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

These fields must be shared across all planes of a given VCPU.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/powerpc/kvm/trace.h |  2 +-
 arch/x86/kvm/trace.h     |  2 +-
 include/linux/kvm_host.h | 27 ++++++++++++++-------------
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kvm/trace.h b/arch/powerpc/kvm/trace.h
index ea1d7c808319..35c000d918bb 100644
--- a/arch/powerpc/kvm/trace.h
+++ b/arch/powerpc/kvm/trace.h
@@ -108,7 +108,7 @@ TRACE_EVENT(kvm_check_requests,
 
 	TP_fast_assign(
 		__entry->cpu_nr		= vcpu->vcpu_id;
-		__entry->requests	= vcpu->requests;
+		__entry->requests	= vcpu->common->requests;
 	),
 
 	TP_printk("vcpu=%x requests=%x",
diff --git a/arch/x86/kvm/trace.h b/arch/x86/kvm/trace.h
index 0db25bba17f6..0d2dd25bed12 100644
--- a/arch/x86/kvm/trace.h
+++ b/arch/x86/kvm/trace.h
@@ -409,7 +409,7 @@ TRACE_EVENT(name,							     \
 		__entry->guest_rip	= tracing_kvm_rip_read(vcpu);		     \
 		__entry->isa            = isa;				     \
 		__entry->vcpu_id        = vcpu->vcpu_id;		     \
-		__entry->requests       = READ_ONCE(vcpu->requests);	     \
+		__entry->requests       = READ_ONCE(vcpu->common->requests); \
 		kvm_x86_call(get_exit_info)(vcpu,			     \
 					    &__entry->exit_reason,	     \
 					    &__entry->info1,		     \
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 45286b3b35c9..7704820986da 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -180,7 +180,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQ_OUTSIDE_GUEST_MODE	(KVM_REQUEST_NO_ACTION | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 
 #define KVM_ARCH_REQ_FLAGS(nr, flags) ({ \
-	BUILD_BUG_ON((unsigned)(nr) >= (sizeof_field(struct kvm_vcpu, requests) * 8) - KVM_REQUEST_ARCH_BASE); \
+	BUILD_BUG_ON((unsigned)(nr) >= (sizeof_field(struct kvm_vcpu_common, requests) * 8) - KVM_REQUEST_ARCH_BASE); \
 	(unsigned)(((nr) + KVM_REQUEST_ARCH_BASE) | (flags)); \
 })
 #define KVM_ARCH_REQ(nr)           KVM_ARCH_REQ_FLAGS(nr, 0)
@@ -341,6 +341,9 @@ struct kvm_vcpu_common {
 	struct rcuwait wait;
 #endif
 
+	int mode;
+	u64 requests;
+
 	/* Scheduling state */
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	struct preempt_notifier preempt_notifier;
@@ -359,8 +362,6 @@ struct kvm_vcpu {
 	int vcpu_id; /* id given by userspace at creation */
 	int vcpu_idx; /* index into kvm->planes[]->vcpu_array */
 
-	int mode;
-	u64 requests;
 	unsigned long guest_debug;
 
 	struct kvm_run *run;
@@ -442,27 +443,27 @@ static inline bool kvm_vcpu_scheduled_out(struct kvm_vcpu *vcpu)
 
 static inline int kvm_vcpu_mode(struct kvm_vcpu *vcpu)
 {
-	return vcpu->mode;
+	return vcpu->common->mode;
 }
 
 static inline int kvm_vcpu_mode_acquire(struct kvm_vcpu *vcpu)
 {
-	return smp_load_acquire(&vcpu->mode);
+	return smp_load_acquire(&vcpu->common->mode);
 }
 
 static inline void kvm_vcpu_set_mode(struct kvm_vcpu *vcpu, int mode)
 {
-	vcpu->mode = mode;
+	vcpu->common->mode = mode;
 }
 
 static inline void kvm_vcpu_set_mode_mb(struct kvm_vcpu *vcpu, int mode)
 {
-	smp_store_mb(vcpu->mode, mode);
+	smp_store_mb(vcpu->common->mode, mode);
 }
 
 static inline void kvm_vcpu_set_mode_release(struct kvm_vcpu *vcpu, int mode)
 {
-	smp_store_release(&vcpu->mode, mode);
+	smp_store_release(&vcpu->common->mode, mode);
 }
 
 /*
@@ -630,7 +631,7 @@ static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
 	 * memory barrier following the write of vcpu->mode in VCPU RUN.
 	 */
 	smp_mb__before_atomic();
-	return cmpxchg(&vcpu->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
+	return cmpxchg(&vcpu->common->mode, IN_GUEST_MODE, EXITING_GUEST_MODE);
 }
 
 /*
@@ -2355,7 +2356,7 @@ static inline void __kvm_make_request(int req, struct kvm_vcpu *vcpu)
 	 * caller.  Paired with the smp_mb__after_atomic in kvm_check_request.
 	 */
 	smp_wmb();
-	set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	set_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static __always_inline void kvm_make_request(int req, struct kvm_vcpu *vcpu)
@@ -2381,17 +2382,17 @@ static inline void kvm_make_request_and_kick(int req, struct kvm_vcpu *vcpu)
 
 static inline bool kvm_request_pending(struct kvm_vcpu *vcpu)
 {
-	return READ_ONCE(vcpu->requests);
+	return READ_ONCE(vcpu->common->requests);
 }
 
 static inline bool kvm_test_request(int req, struct kvm_vcpu *vcpu)
 {
-	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	return test_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline void kvm_clear_request(int req, struct kvm_vcpu *vcpu)
 {
-	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->requests);
+	clear_bit(req & KVM_REQUEST_MASK, (void *)&vcpu->common->requests);
 }
 
 static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
