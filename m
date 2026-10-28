Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF1960A2612
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qc8oWhLj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=L3MLaMF/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=aZniLXScHRyzKBwEz786MGjMKwRq0Q3/Zv5xbX5vqe8=; b=qc8oWhLjJVKlRmILYIzCGf1RVR
	CnhIUF64iw/qG9Ps7tKBeVdEqJkitw0Rv3Si/OP3jCiqRqUtJpR9iEaLG2Y2tOJxm81mQTTk6WxzW
	Hjsqxp+WlDz26/pLhHYHc9W6LTr1KuSrRT+bvxYGt/lNxuHpSjm0lAWibcu6m6QB85rwq5TrOrK5j
	FMOgqmOVDPB4rWYFJD/C1LAijWvGYvXaYhxcYHq0z6osSKGZg6HdiS4xgWBpofOC9yKXtKqQWqlwU
	x5Tfz2p7PTkQxxutsaVNdlreL1XiWDS5xShNu72iTk45WwrHQ6E5rNx9npAf4Hga5fz+Yi+vFk9qT
	RuUeiiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vq-00000007o0N-3er9;
	Wed, 28 Oct 2026 19:03:30 +0000
Received: from mail-pl1-x646.google.com ([2607:f8b0:4864:20::646])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vV-00000007nVl-2LoI
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:11 +0000
Received: by mail-pl1-x646.google.com with SMTP id d9443c01a7336-2e8dd9b9743so13085335ad.1
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214188; x=1793818988; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sl+Mk8tjT6q271G5BWlaeNMAilxi46BFejIwHYIwO+I=;
        b=L3MLaMF/I4cs3UYRJjcduS/a5+QzCfIiK+Eni+HSDGPVLm1ov9tKJd/XPM18e9CZtJ
         JwSUj0ZpQzYwBKKy8qoH8JpyghUaZ9Yc9KNUN/2EzUstT6By1brldq1rb0NH47yzXpX0
         1+0/BQZSKNjbvv191kl3JVXZzUTzjsk+Adm/x0cO76EXWIkOVeteLVXArDix5UPAkOMh
         xwsBUUCWt9wPgcKt0/iRFLh2WKVkrQVuhukZK03SJQzTZDmQlK7tADLu+86zjd+YJFmp
         /GR6tqPLMJ+3NM2P4jXNomSY8vrIZdciLQYRKf/Uue6s+BJFRv1sdo+ieftguB+oBjct
         YKiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214188; x=1793818988;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sl+Mk8tjT6q271G5BWlaeNMAilxi46BFejIwHYIwO+I=;
        b=P7LYrxSxgRDE3PawsTEmoDWfVAc4MaRDyKSAwoU3DXUe22dyrtbfAmtsHA+kxMRPxF
         uhairy9/A164TW4P7x7pdLJddgyI8CXIP99inB2y4ehxv7ouDdP6Q9clMHjlnygXXgG3
         OfPx4DPhLBxsTScT0lVT9YW+imCGvS6BIozKgL5jXTIQPm1o/gDQ0plIgMYKxWmuA3Du
         QhKXzFp25nsLdNt8Pbbn1czlrUXIAn3kmldivvNZ41x0rv2xrPkyWNRI0OJYjHTy+X4i
         YWNnEFytRRrdMQ4F/Kd5XVbZvGhMKbpeUV9ZX7Yt3eDJVNjClLKaKgjMyu9iLGBa3+oC
         1b+Q==
X-Forwarded-Encrypted: i=1; AKwUvBx/FncOQWW3QN/2jba58ZU+toP7AJT3VJT9EURbNTENb22K3slGcvOnNJUqKZigsldxNJCh3PxmQuU=@lists.infradead.org
X-Gm-Message-State: AFq9FYKAc2N64io+EsUG6L9dNTwtRQjhPI/ni5ieS+leZ407UhDtyzy1
	S/QWUa/Oh/7E7JqXXJuY3Ji7pGq4hS8kKZxXKGdIRBpZWYqVRO6DCK8Xej2gW2KHOXnoYI58vPI
	olGbiFw==
X-Received: from plic8.prod.google.com ([2002:a17:903:3708:b0:2e8:4252:d40c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:40c9:b0:2cc:6018:f030
 with SMTP id d9443c01a7336-2eb0033e60cmr28999775ad.14.1793214188023; Wed, 28
 Oct 2026 12:03:08 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:57 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-6-seanjc@google.com>
Subject: [PATCH 5/7] KVM: Move kvm_arch_vcpu_should_kick() to common code as kvm_vcpu_should_kick()
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
	Steffen Eiden <seiden@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261028_120309_605877_7C01E7CB 
X-CRM114-Status: GOOD (  12.07  )
X-Spam-Score: -9.5 (---------)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dedup kvm_arch_vcpu_should_kick() now that all architectures except for PPC
have identical implementations.  PPC's implementation is unreachable as PPC
always invokes __kvm_vcpu_kick() with @force=true.

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/kvm/arm.c       |  5 -----
 arch/loongarch/kvm/vcpu.c  |  5 -----
 arch/mips/kvm/mips.c       |  5 -----
 arch/powerpc/kvm/powerpc.c |  5 -----
 arch/riscv/kvm/vcpu.c      |  5 -----
 arch/x86/kvm/x86.c         |  5 -----
 include/linux/kvm_host.h   |  1 -
 virt/kvm/kvm_main.c        | 11 ++++++++---
 8 files changed, 8 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 775d11f96813..99d540d67b5b 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -128,11 +128,6 @@ bool is_kvm_arm_initialised(void)
 	return kvm_arm_initialised;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			    struct kvm_enable_cap *cap)
 {
diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
index 4026b9bf9f2d..76afd386abd2 100644
--- a/arch/loongarch/kvm/vcpu.c
+++ b/arch/loongarch/kvm/vcpu.c
@@ -379,11 +379,6 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 		vcpu->arch.mp_state.mp_state == KVM_MP_STATE_RUNNABLE;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	unsigned long val;
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index c37e212bc0a3..273dd932d119 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -120,11 +120,6 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 int kvm_arch_enable_virtualization_cpu(void)
 {
 	return kvm_mips_callbacks->enable_virtualization_cpu();
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 09c94b849185..ac259fcd85c2 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -62,11 +62,6 @@ bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 	return false;
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return 1;
-}
-
 /*
  * Common checks before entering the guest world.  Call with interrupts
  * enabled.
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index dd786f758eb7..3981ba39ffc2 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -239,11 +239,6 @@ int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu)
 		!kvm_riscv_vcpu_stopped(vcpu) && !vcpu->arch.pause);
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu)
 {
 	return (vcpu->arch.guest_context.sstatus & SR_SPP) ? true : false;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 32563a91fba9..d9fa2690153a 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10472,11 +10472,6 @@ unsigned long kvm_arch_vcpu_get_ip(struct kvm_vcpu *vcpu)
 	return kvm_rip_read(vcpu);
 }
 
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
-{
-	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
-}
-
 static inline u32 kvm_async_pf_hash_fn(gfn_t gfn)
 {
 	BUILD_BUG_ON(!is_power_of_2(ASYNC_PF_PER_VCPU));
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3b9844c3906d..9db42f58c561 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1694,7 +1694,6 @@ void kvm_arch_disable_virtualization_cpu(void);
 bool kvm_vcpu_has_events(struct kvm_vcpu *vcpu);
 int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
-int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_runnable(struct kvm_vcpu *vcpu);
 bool kvm_arch_dy_has_pending_interrupt(struct kvm_vcpu *vcpu);
 bool kvm_arch_vcpu_preempted_in_kernel(struct kvm_vcpu *vcpu);
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 67addb9e48a7..e1a9da8b43d7 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -191,7 +191,7 @@ void vcpu_put(struct kvm_vcpu *vcpu)
 }
 EXPORT_SYMBOL_FOR_KVM_INTERNAL(vcpu_put);
 
-/* TODO: merge with kvm_arch_vcpu_should_kick */
+/* TODO: merge with kvm_vcpu_should_kick */
 static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 {
 	int mode = kvm_vcpu_exiting_guest_mode(vcpu);
@@ -209,6 +209,11 @@ static bool kvm_request_needs_ipi(struct kvm_vcpu *vcpu, unsigned req)
 	return mode == IN_GUEST_MODE;
 }
 
+static int kvm_vcpu_should_kick(struct kvm_vcpu *vcpu)
+{
+	return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
+}
+
 static void ack_kick(void *_completed)
 {
 }
@@ -3930,7 +3935,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 
 	/*
 	 * Note, the vCPU could get migrated to a different pCPU at any point
-	 * after kvm_arch_vcpu_should_kick(), which could result in sending an
+	 * after kvm_vcpu_should_kick(), which could result in sending an
 	 * IPI to the previous pCPU.  But, that's ok because the purpose of the
 	 * IPI is to force the vCPU to leave IN_GUEST_MODE, and migrating the
 	 * vCPU also requires it to leave IN_GUEST_MODE
@@ -3939,7 +3944,7 @@ void __kvm_vcpu_kick(struct kvm_vcpu *vcpu, bool wait, bool force)
 	 * check also modifies vcpu->mode and KVM PPC needs to avoid that side
 	 * effect for unknown historical reasons.
 	 */
-	if (force || kvm_arch_vcpu_should_kick(vcpu)) {
+	if (force || kvm_vcpu_should_kick(vcpu)) {
 		cpu = READ_ONCE(vcpu->cpu);
 		if (cpu != me && (unsigned int)cpu < nr_cpu_ids && cpu_online(cpu)) {
 			/*
-- 
2.56.0.313.g2479322e68-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
