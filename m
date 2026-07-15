Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E711C44508
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 05:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXmCKiVjN9TGkYDf3IyNZ03qeuDZmFxeHIiCw8HCINQ=; b=hBmPLv7M6mDZeh
	Z5B1dJE+L+73nAsxKXJBLOSD9dQWm1BCCCMQkaMTqVqU0XwKb17yTQGnNgBN2Fytxp9rCqmFWwj8Z
	uWVMclCy1zm42N4MD5UAbeA6/tpyBegNnknTG4KFCxEhhfqCaGs3+LR55S6WmlawYdr+XiqEGIE/6
	V2ThSfSF4kfldowNIKfi0PVSkdRoUGk8IrfCYwlGYvVLewgEPP2UmSlqx8p9N4TGAxr9NJTXJnkPZ
	A2wIVOr0e877RO8MrHRaq0JWcRBxNlZsSujWXaxUs1jYB7rIn3D71WQylqMkS5yUYlZxdXGkE/Ppk
	V8h6+iivxyaLQyxvzlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrze-0000000Dmnd-3HO0;
	Wed, 15 Jul 2026 05:17:14 +0000
Received: from mail-yx1-xb12e.google.com ([2607:f8b0:4864:20::b12e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjrzc-0000000Dmle-3klS
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 05:17:14 +0000
Received: by mail-yx1-xb12e.google.com with SMTP id 956f58d0204a3-664a09bc459so8044800d50.1
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784092632; x=1784697432; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qu2jpdxEtSpgK1477zsO8Jas8eGGsDBJ5u6c9q18Qo=;
        b=Dg0UE/H6/ba3vqOY48w90BpkM+lsTX134KM1ARXEZZobzX91ofeC+aA48qSASB3EqZ
         xtU5MNY+ALCDUHWhOKn0al3Wexk6Qh0bflpV/0yxTptAUodvgU81S3M13D+AaJNwJrg/
         +9TE5w0wKX8J0KMzvo1sDOAJL4fwSycd+MQYs79YE+6LHyuvmdT/zyksTtOnAAnP1vKk
         v3vZMC2j2Spz/8ecpExE8I73YlfWw+u0Z/Qb5rHQRxiDmD4G0BHC4M+r8eFGdJDX9QLm
         EzRQqE0AU5e6LEwaszL9nWvYJkjK53D+TWKDep8vyZWZH9AVuTam4J3rGgIx6su1f4JV
         rmuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784092632; x=1784697432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/qu2jpdxEtSpgK1477zsO8Jas8eGGsDBJ5u6c9q18Qo=;
        b=ghg3VqjH70s6lHPn5G6pwVf9cotYf/WTLBQ96X+8RI8P1eChGOclFfzfLYzIYmt6W2
         CSlszUKChgFub8EMf7gFWi0HvpCLlgTtgE79dy+oJ23Fa4HdPGd+4icy4KuR8jQFuFIm
         VKoK5YI1FRbnr90GxNgzNa3xgHMNcA8vS7Mwmh6nwFRxAyLg/HzyRxmqYesXlHLpLLe0
         LE6F1p8HD9O8LX9wYqEARPyHWJ+h6qwOm4xZcgVP+DQ7vQGNGVe/QDtuYwg8V2kRNVut
         HLlw8IN+hx42PGdH3HbuDsS1uC5nhtcMunTiHnTCfof0dKa7Ak4000PtCvT3FRh4MmQR
         KXKw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4sDuBwZMd0EG1uCJuv7rRFa7xXhCDM21mtLsi+MzfGtZ//poLdb0ZWTSbkkrvHf2P3clgvfyJemU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2kLVHnfYLKQLsoN4q7YTfihl2bCrsr4uTw6+8IdXKRizNbf3e
	EFX/j5Roez/O/q/BBbWwta6hT4hM5jG2f56btLNlRPQBSflqlvVedXXM94m51xy/9UU=
X-Gm-Gg: AfdE7cmxQ+HJDgC+lH3wugn/UyfGZhkUAkcqC/SYBm/ZZS+Mxu+PNqI3xu7uK59z9BK
	mDaiEZRKEmbDkrnXPJVjEMpWjTm41RMKQquojAPZqA65oj6b+KXmzu3MahNZKf9tc7Eb+g+Nuc1
	laB6IrkhrLAcp55IPLUwZ+rGDfXmyIOdBg5whcHclF0dIjvXKkIQN6fVQ1qqOf4y1FEFr/3gV4z
	1VCHN3xUpqR9iwLZq7ZxE4hOQnqtkFRWnYNRLhsqkVG21OOUVv+cKBLtaynqrz1pyzEKravc6y8
	7S860vVH5slQ/WdFsnZdsDWYJmUAzZShrwcirCySdeVq2Sv+6BQFc0/XOVSBAfunt9aRdghpjOY
	3G0otlSH057qWTIiO5iSyVP7vkY1LYu+NMlvd/fm9TtGH6Q7bXYnjIjzRKLD41pfpHZHDnQxoqF
	0Xw8Tu5wYwiiwyP6GXgDmWkuJf02sQzsuzhyh/sSF+Dbk4qT5G2e+GOcY17b7hGCdURL6VlBraS
	+TGsGf/34UkR5JB2PJV+nQdOAwB4A==
X-Received: by 2002:a05:690c:6e10:b0:81e:ba92:b255 with SMTP id 00721157ae682-81ecfb5b8famr10617457b3.68.1784092631800;
        Tue, 14 Jul 2026 22:17:11 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net (108-196-157-19.lightspeed.austtx.sbcglobal.net. [108.196.157.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81e6c23939fsm159625657b3.46.2026.07.14.22.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 22:17:11 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Greentime Hu <greentime.hu@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v2 3/3] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
Date: Wed, 15 Jul 2026 00:16:22 -0500
Message-ID: <20260715051629.1169645-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260715051629.1169645-1-tchiu@tenstorrent.com>
References: <20260715051629.1169645-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_221712_948994_1501630B 
X-CRM114-Status: GOOD (  22.79  )
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

Running vector workloads like perf + mcf on KVM can result in an
unexpected termination due to a vtype corruption. This happens because
the kernel-mode vector (KMV) misattributes the guest's vcpu context as
the user's context and source from a wrong status.VS.

The simplified call chain that results in this problem is shown as
follow:

__riscv_sys_ioctl()
    kvm_arch_vcpu_ioctl_run()
      kvm_riscv_vcpu_exit()
        kvm_riscv_vcpu_sbi_ecall()
          kvm_riscv_vcpu_pmu_ctr_stop()
            kvm_vcpu_write_guest()
              __copy_to_user()
                enter_vector_usercopy()
                  kernel_vector_begin()

kernel_vector_begin() should use the sstatus.VS from guest's vcpu
context instead of task_pt_reg(current). Also, it should not save
guest's v-reg into the user's context memory.

To resolve this, the vcpu context must be correctly saved when KMV is
serving a guest. However, invoking KVM functions directly from generic
RISC-V architecture code introduces a reverse dependency, breaking
builds when KVM is configured as N or M.

Address this by registering an RCU-protected callback for context
flushing. KVM registers this callback at module initialization and
unregisters it on exit. When KMV starts a kernel context, it can now
safely flush the vector context via the callback.

Fixes: ecd2ada8a5e0 ("riscv: Add support for kernel mode vector")
Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>

---
Changelog v2: address concerns pointed out by sashiko
 - encloses vcpu_flush_v_callback() with rcu_read_{lock,unlock}
 - put riscv_v_start before put_cpu_vector_context() to prevent
   redundant context save
 - protect v context operations against softirqs
 - apply bitmask when reading SR_VS out of guest's sstatus
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++++++
 arch/riscv/include/asm/processor.h       |  2 +
 arch/riscv/include/asm/vector.h          |  5 +++
 arch/riscv/kernel/kernel_mode_vector.c   | 51 ++++++++++++++++++------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 10 +++++
 arch/riscv/kvm/vcpu_vector.c             | 20 ++++++++++
 7 files changed, 104 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..6371d5ea5392 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -35,6 +35,22 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+void kvm_riscv_register_vctx_callback(void (*func)(void));
+void kvm_riscv_unregister_vctx_callback(void);
+void kvm_riscv_vcpu_flush_vector(void);
+
+static inline void kvm_riscv_v_init(void)
+{
+	if (has_vector())
+		kvm_riscv_register_vctx_callback(&kvm_riscv_vcpu_flush_vector);
+}
+
+static inline void kvm_riscv_v_exit(void)
+{
+	if (has_vector())
+		kvm_riscv_unregister_vctx_callback();
+}
+
 #else
 
 struct kvm_cpu_context;
@@ -69,6 +85,14 @@ static inline int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
 static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 {
 }
+
+static inline void kvm_riscv_v_init(void)
+{
+}
+
+static inline void kvm_riscv_v_exit(void)
+{
+}
 #endif
 
 int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 812517b2cec1..6e9db2b209e6 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -97,6 +97,8 @@ struct pt_regs;
 
 #define RISCV_V_CTX_UNIT_DEPTH		0x00010000
 #define RISCV_KERNEL_MODE_V		0x00000001
+#define RISCV_V_VCPU_NEED_RESTORE	0x00000002
+#define RISCV_V_VCPU_CTX		0x00000004
 #define RISCV_PREEMPT_V			0x00000100
 #define RISCV_PREEMPT_V_DIRTY		0x80000000
 #define RISCV_PREEMPT_V_NEED_RESTORE	0x40000000
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..fffe72a77208 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -58,6 +58,11 @@ static inline u32 riscv_v_flags(void)
 	return READ_ONCE(current->thread.riscv_v_flags);
 }
 
+static inline void riscv_v_flags_set(u32 flags)
+{
+	WRITE_ONCE(current->thread.riscv_v_flags, flags);
+}
+
 static __always_inline bool has_vector(void)
 {
 	return riscv_has_extension_unlikely(RISCV_ISA_EXT_ZVE32X);
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 6627e1a82e19..1c2463aee247 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -12,16 +12,31 @@
 #include <linux/types.h>
 
 #include <asm/vector.h>
+#include <asm/kvm_vcpu_vector.h>
 #include <asm/switch_to.h>
 #include <asm/simd.h>
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 #include <asm/asm-prototypes.h>
 #endif
 
-static inline void riscv_v_flags_set(u32 flags)
+static void (* __rcu kvm_flush_vector_ctx_callback)(void);
+
+void kvm_riscv_register_vctx_callback(void (*func)(void))
 {
-	WRITE_ONCE(current->thread.riscv_v_flags, flags);
+	if (WARN_ON_ONCE(rcu_access_pointer(kvm_flush_vector_ctx_callback)))
+		return;
+
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, func);
 }
+EXPORT_SYMBOL_GPL(kvm_riscv_register_vctx_callback);
+
+void kvm_riscv_unregister_vctx_callback(void)
+{
+	rcu_assign_pointer(kvm_flush_vector_ctx_callback, NULL);
+	synchronize_rcu();
+}
+EXPORT_SYMBOL_GPL(kvm_riscv_unregister_vctx_callback);
+
 
 static inline void riscv_v_start(u32 flags)
 {
@@ -86,6 +101,22 @@ void put_cpu_vector_context(void)
 }
 EXPORT_SYMBOL_GPL(put_cpu_vector_context);
 
+static void __riscv_flush_vector_context(void)
+{
+	void (*vcpu_flush_v_callback)(void);
+
+	if (riscv_v_flags() & RISCV_V_VCPU_CTX) {
+		rcu_read_lock();
+		vcpu_flush_v_callback = rcu_dereference(kvm_flush_vector_ctx_callback);
+		vcpu_flush_v_callback();
+		rcu_read_unlock();
+		return;
+	}
+
+	riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
+	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+}
+
 #ifdef CONFIG_RISCV_ISA_V_PREEMPTIVE
 static __always_inline u32 *riscv_v_flags_ptr(void)
 {
@@ -129,7 +160,7 @@ static int riscv_v_stop_kernel_context(void)
 
 static int riscv_v_start_kernel_context(void)
 {
-	struct __riscv_v_ext_state *kvstate, *uvstate;
+	struct __riscv_v_ext_state *kvstate;
 
 	kvstate = &current->thread.kernel_vstate;
 	if (!kvstate->datap)
@@ -147,13 +178,10 @@ static int riscv_v_start_kernel_context(void)
 	}
 
 	/* Transfer the ownership of V from user to kernel, then save */
-	riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
-	if (__riscv_v_vstate_check(task_pt_regs(current)->status, DIRTY)) {
-		uvstate = &current->thread.vstate;
-		__riscv_v_vstate_save(uvstate, uvstate->datap);
-	}
-	riscv_preempt_v_clear_dirty(current);
-	riscv_v_vstate_set_restore(current, task_pt_regs(current));
+	get_cpu_vector_context();
+	__riscv_flush_vector_context();
+	riscv_v_start(RISCV_PREEMPT_V);
+	put_cpu_vector_context();
 	return 0;
 }
 
@@ -219,8 +247,7 @@ void kernel_vector_begin(void)
 
 	if (riscv_v_start_kernel_context()) {
 		get_cpu_vector_context();
-		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
-		riscv_v_vstate_set_restore(current, task_pt_regs(current));
+		__riscv_flush_vector_context();
 	}
 
 	riscv_v_enable();
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 0924c75100a2..da8a5f6d4b4d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -14,6 +14,7 @@
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
+#include <asm/kvm_vcpu_vector.h>
 
 DEFINE_STATIC_KEY_FALSE(kvm_riscv_vsstage_tlb_no_gpa);
 
@@ -76,6 +77,7 @@ static void kvm_riscv_teardown(void)
 {
 	kvm_riscv_aia_exit();
 	kvm_riscv_nacl_exit();
+	kvm_riscv_v_exit();
 	kvm_unregister_perf_callbacks();
 }
 
@@ -170,6 +172,8 @@ static int __init riscv_kvm_init(void)
 
 	kvm_riscv_setup_vendor_features();
 
+	kvm_riscv_v_init();
+
 	kvm_register_perf_callbacks();
 
 	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index cf6e231e76e2..b7b68809a581 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -603,9 +603,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
+	get_cpu_vector_context();
 	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
 					    vcpu->arch.isa);
+	put_cpu_vector_context();
 
 	kvm_make_request(KVM_REQ_STEAL_UPDATE, vcpu);
 
@@ -626,9 +628,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
 	kvm_riscv_vcpu_timer_save(vcpu);
+	get_cpu_vector_context();
 	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
 					 vcpu->arch.isa);
 	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+	put_cpu_vector_context();
 
 	if (kvm_riscv_nacl_available()) {
 		nsh = nacl_shmem();
@@ -765,6 +769,12 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
+	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
+		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
+		__kvm_riscv_vector_restore(gcntx);
+		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
+	}
+
 	if (kvm_riscv_nacl_sync_sret_available()) {
 		nsh = nacl_shmem();
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..d25c10bd99a8 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -58,6 +58,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 		if (riscv_isa_extension_available(isa, v))
 			__kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
+		riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_CTX);
 	}
 }
 
@@ -72,6 +73,7 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
 		__kvm_riscv_vector_restore(cntx);
+	riscv_v_flags_set(riscv_v_flags() & ~RISCV_V_VCPU_CTX);
 }
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
@@ -95,6 +97,24 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
 	kfree(vcpu->arch.guest_context.vector.datap);
 	kfree(vcpu->arch.host_context.vector.datap);
 }
+
+void kvm_riscv_vcpu_flush_vector(void)
+{
+	struct kvm_vcpu *vcpu = *this_cpu_ptr(kvm_get_running_vcpus());
+
+	/*
+	 * Only reached from __riscv_flush_vector_context() when RISCV_V_VCPU_CTX is set, which
+	 * always have kvm_get_running_vcpus non-NULL.
+	 */
+	if (WARN_ON_ONCE(!vcpu))
+		return;
+
+	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context, vcpu->arch.isa);
+
+	if ((vcpu->arch.guest_context.sstatus & SR_VS) != SR_VS_OFF)
+		riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
+}
+
 #endif
 
 static int kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
