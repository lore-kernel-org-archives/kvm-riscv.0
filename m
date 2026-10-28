Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BC760A260A
	for <kvm-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 19:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UI5HggrP;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Fs7TmEji
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=wT9WrVR8BR4orW+ZzCFDiL65QE5vhckGYs4aGFn8Y60=; b=UI5HggrPOS4SBmTnc74nlgp5Ey
	Lgx8EDjEbbSuYkP63XvtIi6xL/kjV3TQk5sjZDbSXBQaR6696fGEiU0qKkOS2RcVsT7yAKvbMf0xc
	f9Uc+Rs7I7jxRFORGKOVJ6MxH2VOc0EXAm9HhvOjVTqywVWT+29Pw2PBPgC/lSFnCWTsc8xyR/d3C
	rvUpwofYRgkqMsfjkuIwSOuqXfGKXlfwicb0YYwvTafUVyYzMSkruAZbhQotmUXav92u5DipE/i5d
	Usn/+xdDqULqQ4wAxzeL9Xr4R+RrNfGfdEY76S0WUJsSOlYhWQjDOJV2n+YzjGMQoUhZASI8xLNQp
	bUlmhMiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vc-00000007ngI-2LQa;
	Wed, 28 Oct 2026 19:03:16 +0000
Received: from mail-pg1-x545.google.com ([2607:f8b0:4864:20::545])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM8vT-00000007nS8-3DlE
	for kvm-riscv@lists.infradead.org;
	Wed, 28 Oct 2026 19:03:09 +0000
Received: by mail-pg1-x545.google.com with SMTP id 41be03b00d2f7-cd66551e02cso1432266a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 28 Oct 2026 12:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793214186; x=1793818986; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kQihi39MSjxZBPCKWC1v+KxEdPYKoJ3DWZvMHVb+Z7E=;
        b=Fs7TmEji1Os+v4bAxh/his3s9wTK6TMkoO6Miy8bQXB9H+1dZ69IMGSydpfgtjetl2
         99E2+DdYZAkzNo5DqflrXMz9maE0iIBx3aEI89jZEBF7S5Paadg/a68rMs/+ALkJzwiQ
         +FqaBNb37DqYXcQiryJoyPGElslw8LAL51dJsSUJ4UtYbkH2YDhUy0qnG6YueTXxVMTI
         PJ9EQkakpIZdAD92ObGm9pqPB52v3nA7vZPCLDXyjNB1AOLpoDDZLe8nwI6MMA1YYE01
         KH9nFSOci8MELXhZVzY1crSTsNh1SH+YSsayXwMmsNrmUMXzE2xigIVZiGtLu8bU9r4w
         hgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793214186; x=1793818986;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kQihi39MSjxZBPCKWC1v+KxEdPYKoJ3DWZvMHVb+Z7E=;
        b=Y9gVE3d8/UMKGEh6oKM8NeeAomXXjroN7MdHDMNVZdMBkduT+CN/EJaFEWvQXsx95H
         3Ni8Dn44z+MgbtneknxaE5RytpYKJB7R5FrbnfqEkrCBozxaeYEwCYns2IoXU+Q+eLLc
         gGemhgZ7gGe6pw5S9k6N9onP4rmtE9zfpGC+eoE3ZPtJ5bvjpHUvid/BSaYqOO9UKtv7
         qYEA2/Maamwme6gohRCYIgW34dQkjzdfuMfverXrOb1KAgzzEGmQ/NyEi0JhUiCzYAGU
         uSdsp23/24U4H+FFPxrm3upWz/ZUQATN6AXzXvEWxCRM/hpSJb6+SE2Aizf/6QaRCiQ1
         A0JQ==
X-Forwarded-Encrypted: i=1; AKwUvByNDipKUIx0rqoUPfNUvWImww09qblumhyHXB8B0uun9vvn5z6QVBOTNLnIZIvjmkJkvwgVlWz26Is=@lists.infradead.org
X-Gm-Message-State: AFq9FYItg2axYZBkX6+ukhxGVS4T8Ihv0L/Lm9ORfWDgL8UUVvaR0cRq
	unixMYwQezt4fDXS15SGQqzlnjorZlS2yseA41vCGmahmCccRU4kM9hpJItk4BJGOmkD8nKxCfb
	u6jvJng==
X-Received: from pgx20.prod.google.com ([2002:a63:1754:0:b0:cd4:ef82:4e33])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a120:b0:3e1:5816:8749
 with SMTP id adf61e73a8af0-3e9023eda44mr2865201637.38.1793214185450; Wed, 28
 Oct 2026 12:03:05 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:02:55 -0700
In-Reply-To: <20261028190259.1819571-1-seanjc@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261028190259.1819571-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028190259.1819571-4-seanjc@google.com>
Subject: [PATCH 3/7] KVM: PPC: Explicitly force IPIs when directly kicking vCPUs
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
X-CRM114-CacheID: sfid-20261028_120307_819046_133E17F4 
X-CRM114-Status: GOOD (  15.14  )
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

Explicitly force an IPI when invoking kvm_vcpu_kick() directly instead of
relying on kvm_arch_vcpu_should_kick() to unconditionally return 1/true.
This will allow dropping kvm_arch_vcpu_should_kick() in favor of
kvm_request_needs_ipi().

No functional change intended (1 || 1 == true).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_ppc.h | 13 ++++++++++++-
 arch/powerpc/kvm/book3s.c          |  4 ++--
 arch/powerpc/kvm/book3s_pr.c       |  2 +-
 arch/powerpc/kvm/booke.c           |  6 +++---
 arch/powerpc/kvm/e500_emulate.c    |  2 +-
 arch/powerpc/kvm/powerpc.c         |  2 +-
 6 files changed, 20 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_ppc.h b/arch/powerpc/include/asm/kvm_ppc.h
index 169ea6a7fbad..bbe7378ad0ef 100644
--- a/arch/powerpc/include/asm/kvm_ppc.h
+++ b/arch/powerpc/include/asm/kvm_ppc.h
@@ -30,6 +30,17 @@
 #endif
 #include <asm/inst.h>
 
+/*
+ * TODO: For unknown reasons, KVM PPC has historically ignored vcpu->mode when
+ *       determining if kicking a vCPU needs an IPI.  Either document why that
+ *       behavior is necessary, or drop this helper and the @force param from
+ *       __kvm_vcpu_kick().
+ */
+static inline void kvmppc_vcpu_kick(struct kvm_vcpu *vcpu)
+{
+	__kvm_vcpu_kick(vcpu, false, true);
+}
+
 /*
  * KVMPPC_INST_SW_BREAKPOINT is debug Instruction
  * for supporting software breakpoint.
@@ -598,7 +609,7 @@ static inline void kvmppc_clear_host_ipi(int cpu)
 
 static inline void kvmppc_fast_vcpu_kick(struct kvm_vcpu *vcpu)
 {
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 static inline bool kvm_hv_mode_active(void)		{ return false; }
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 2efbe05caed7..dce53c5a3868 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -260,7 +260,7 @@ void kvmppc_core_queue_external(struct kvm_vcpu *vcpu,
 	 * external interrupts for the guest just before entering
 	 * the guest.  That is OK even if userspace did do a
 	 * KVM_INTERRUPT_SET on a pseries guest vcpu, because the
-	 * caller (kvm_vcpu_ioctl_interrupt) does a kvm_vcpu_kick()
+	 * caller (kvm_vcpu_ioctl_interrupt) does a kvmppc_vcpu_kick()
 	 * which ends up doing a smp_send_reschedule(), which will
 	 * pull the guest all the way out to the host, meaning that
 	 * we will call kvmppc_core_prepare_to_enter() before entering
@@ -827,7 +827,7 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
 void kvmppc_decrementer_func(struct kvm_vcpu *vcpu)
 {
 	kvmppc_core_queue_dec(vcpu);
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 int kvmppc_core_vcpu_create(struct kvm_vcpu *vcpu)
diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
index ecfb88bf6464..1894968f2c25 100644
--- a/arch/powerpc/kvm/book3s_pr.c
+++ b/arch/powerpc/kvm/book3s_pr.c
@@ -2066,7 +2066,7 @@ static struct kvmppc_ops kvm_ops_pr = {
 	.emulate_op = kvmppc_core_emulate_op_pr,
 	.emulate_mtspr = kvmppc_core_emulate_mtspr_pr,
 	.emulate_mfspr = kvmppc_core_emulate_mfspr_pr,
-	.fast_vcpu_kick = kvm_vcpu_kick,
+	.fast_vcpu_kick = kvmppc_vcpu_kick,
 	.arch_vm_ioctl  = kvm_arch_vm_ioctl_pr,
 #ifdef CONFIG_PPC_BOOK3S_64
 	.hcall_implemented = kvmppc_hcall_impl_pr,
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 13ad4cf5fa71..fd7f24a68b31 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -650,7 +650,7 @@ static void kvmppc_watchdog_func(struct timer_list *t)
 	if (new_tsr & TSR_WIS) {
 		smp_wmb();
 		kvm_make_request(KVM_REQ_PENDING_TIMER, vcpu);
-		kvm_vcpu_kick(vcpu);
+		kvmppc_vcpu_kick(vcpu);
 	}
 
 	/*
@@ -661,7 +661,7 @@ static void kvmppc_watchdog_func(struct timer_list *t)
 	    vcpu->arch.watchdog_enabled) {
 		smp_wmb();
 		kvm_make_request(KVM_REQ_WATCHDOG, vcpu);
-		kvm_vcpu_kick(vcpu);
+		kvmppc_vcpu_kick(vcpu);
 	}
 
 	/*
@@ -1872,7 +1872,7 @@ void kvmppc_set_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits)
 	set_bits(tsr_bits, &vcpu->arch.tsr);
 	smp_wmb();
 	kvm_make_request(KVM_REQ_PENDING_TIMER, vcpu);
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 }
 
 void kvmppc_clr_tsr_bits(struct kvm_vcpu *vcpu, u32 tsr_bits)
diff --git a/arch/powerpc/kvm/e500_emulate.c b/arch/powerpc/kvm/e500_emulate.c
index 051102d50c31..10cd6b4ab456 100644
--- a/arch/powerpc/kvm/e500_emulate.c
+++ b/arch/powerpc/kvm/e500_emulate.c
@@ -75,7 +75,7 @@ static int kvmppc_e500_emul_msgsnd(struct kvm_vcpu *vcpu, int rb)
 		int cpir = cvcpu->arch.shared->pir;
 		if ((param & PPC_DBELL_MSG_BRDCAST) || (cpir == pir)) {
 			set_bit(prio, &cvcpu->arch.pending_exceptions);
-			kvm_vcpu_kick(cvcpu);
+			kvmppc_vcpu_kick(cvcpu);
 		}
 	}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..09c94b849185 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1903,7 +1903,7 @@ int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu, struct kvm_interrupt *irq)
 
 	kvmppc_core_queue_external(vcpu, irq);
 
-	kvm_vcpu_kick(vcpu);
+	kvmppc_vcpu_kick(vcpu);
 
 	return 0;
 }
-- 
2.56.0.313.g2479322e68-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
