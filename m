Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4070C53200
	for <kvm-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 16:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oO3x3/cuLws/YjUaxLN2QWL9IjBu8pFJhhrcPA7xyog=; b=Vr+NxriMlSHNRC
	UObbxjxccqb8boGaU9Z+E7z2p9EGgXOvlOIG9PdtosTEDc596GP9VDW+j1XUXWy6Sqbh/0pximAHc
	X4qjMp+Sg9oChWIYW2f3xtE5D7uWuaQH5E8k93W1O0pM/n1POszm30hjgq7kXHMKnXTgtaNxbkdsQ
	q9V86u2rtuAc73XSpHg5DZwVqL6Q3Y1A8hOKwcDOpoQz5aMERC8wQv9IqU/+LrEzGu9Vz386vQo/y
	n4JIEUgkDU0mblO/5FYQgO5JF4IqF2Yo5eLX9x56dx27KGWq0f+QYHTw/IWXViEnRXMSN4q2Z6bhe
	IoRS/+0YOZAkEw1z2azw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6Q-0000000GsbG-2C3p;
	Fri, 24 Jul 2026 16:50:26 +0000
Received: from mail-oo1-f41.google.com ([209.85.161.41])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnJ6O-0000000GsYj-1aom
	for kvm-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 16:50:25 +0000
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6a38d83a480so845517eaf.0
        for <kvm-riscv@lists.infradead.org>; Fri, 24 Jul 2026 09:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1784911823; x=1785516623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nKuUmlHudjWBXOh7u6EacXcROP7GrHIzAv/I/DwJ+pI=;
        b=XIoe2YkLnUEQGuTHHpvHJC6iiufcbbzu4c4H4NTTUbIH+vfMN0AD5G5Tx8f3kCPQCa
         FnMeCaxBBtomuksbHHPp7iUFEsJoJ9KN+RY65TQVk5T+YLS1xZo6BIqRLhcJv+aQcD7z
         UdzQKkTV3cPpf4wQEbglB/B1OyDYOENTtoXzIT5//1MmpBdMnpvMUExes2Cstzud27R5
         Ccf5GvVxj9sWwHdmZ0+GTK55UqiY2ONTtGM/zbnc6kC9ox+j54pqYuiKqFuSeF/S8xUk
         ozq5GFw5BQmFu2G7OwmP7Lbs07Ej0zBrSuLjwzfYaxmTrzH+Ifu4W4S+EHjV8lErCQkr
         fPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911823; x=1785516623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nKuUmlHudjWBXOh7u6EacXcROP7GrHIzAv/I/DwJ+pI=;
        b=ZdnPSqzxZTAt9kSRR8nztskhRpZ18bunPgXQo085qIsGTfDVa457WuRp6yPsD9fLS1
         ERLmX0ikZo0u//FnYIeOMxQ+oqXYqdKVF+DpldNC7bmxHB6Y+gBY7/KICoK4Gqw+W7rB
         ToTsQU9WH8sCBSA+6KSkRwAwHBWqQW3yepng2ParerB2rf6HKYXyVdybQYMNnXSKVgxJ
         YZ+VORLfUyPLSgf+M8HEeQsVw9hbF8ZUA1cFnaUorAtGTacPrivKB0pYgTMQCGu2WjOY
         UOxB+mqQw6DXcnl8pcUoZPAcy4nmZ6xLYDs8nnBULawPZc/J57rXLA8AwHvKNajvwI1o
         HjkA==
X-Forwarded-Encrypted: i=1; AHgh+Ro1FyOoiw3LJf/60AuRgPE/GAtP1FaOZ+OBIxgogMy+0qiPcEE6R7B+6P0/3YlFO7CT6XToXIE6WRk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxiKAIFqbNm2K27C3l8vkN/lMpQoFP769pkeh+ym0EvGEVSarGX
	wTA/QEyqu8i/NpxnotWi8dPnxksUzaem2A4LDfKBAo1+Gi+Kk66LRoUinWlI+v9dziI=
X-Gm-Gg: AR+sD109dxQojpnaFhgzIjY/aKFDALtsQT2n1CQFWLNtTZ7XtxlB7MQ7kbQ0/QEuwbB
	aAuCqkazQJGy6+deJZ7pIHkLiTG9D7KDkvNYkwZnkPMyK+k9KWOYAN/1jGq0mcWJUkFcY14hKzR
	lpXcA5nQ3dIdtE3Ba7AfCWLxRtdfaESeYo3qZAIn+cCyvgYf+6qWBogoBE03Te6g1KUPHDqGOij
	QFJDl+ZjFmgglsHqwtU6fxVnHIpmskSwWJDaDkWK94qgROb69ZtVdrBHO/v2ADoF4HbsSWU2w8q
	cv5CXYauCMCacCnahap/50cy8lG8XqJOMaphavoSZLYuIc/i2q3y18+k8Sy6zKGXFrRW2iOCA3E
	2pCeRc3tBIRyV2/kCFHZBjHlNfLxCXQqN38sxa22imPFRzWhG3G+lciR0u60IATSmHFyoy1V8po
	2ofzSr/FbXJpVZWKsqca1LuMdsRtwCMJym+jw=
X-Received: by 2002:a05:6820:2910:b0:6aa:eff0:7091 with SMTP id 006d021491bc7-6aaf583e356mr1052622eaf.20.1784911823141;
        Fri, 24 Jul 2026 09:50:23 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6aaf96f4501sm210882eaf.12.2026.07.24.09.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:50:22 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: anup@brainfault.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Vincent Chen <vincent.chen@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Andy Chiu <andybnac@gmail.com>,
	Eric Biggers <ebiggers@google.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	Zong Li <zong.li@sifive.com>,
	Sean Chang <seanwascoding@gmail.com>,
	Thomas Huth <thuth@redhat.com>,
	Deepak Gupta <debug@rivosinc.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [PATCH v3 3/3] RISC-V: KVM: fix vcpu vector context handling for kernel-mode vector
Date: Fri, 24 Jul 2026 11:49:54 -0500
Message-ID: <20260724165001.2317788-4-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260724165001.2317788-1-tchiu@tenstorrent.com>
References: <20260724165001.2317788-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_095024_443590_32BC36DC 
X-CRM114-Status: GOOD (  24.99  )
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
Changelog v3:
 - clears RISCV_V_VCPU_NEED_RESTORE flag in host restore to prevent
   leaking (Sashiko)
 - consolidates guest vector restore at returning to guest to prevent
   unnecessary save/restore between the preemptible window from
   vcpu_load to vcpu_enter_exit
 - Document the added riscv_v_flags
Changelog v2: address concerns pointed out by sashiko
 - encloses vcpu_flush_v_callback() with rcu_read_{lock,unlock}
 - put riscv_v_start before put_cpu_vector_context() to prevent
   redundant context save
 - protect v context operations against softirqs
 - apply bitmask when reading SR_VS out of guest's sstatus
---
 arch/riscv/include/asm/kvm_vcpu_vector.h | 24 +++++++++++
 arch/riscv/include/asm/processor.h       |  8 ++++
 arch/riscv/include/asm/vector.h          |  5 +++
 arch/riscv/kernel/kernel_mode_vector.c   | 51 ++++++++++++++++++------
 arch/riscv/kvm/main.c                    |  4 ++
 arch/riscv/kvm/vcpu.c                    | 12 ++++++
 arch/riscv/kvm/vcpu_vector.c             | 22 +++++++++-
 7 files changed, 112 insertions(+), 14 deletions(-)

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
index 812517b2cec1..a6a0c3d5a913 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -67,6 +67,12 @@ struct pt_regs;
  *  - bit 0: indicates whether the in-kernel Vector context is active. The
  *    activation of this state disables the preemption. On a non-RT kernel, it
  *    also disable bh.
+ *  - bit 1: tells kvm that the vcpu process has guest context saved in vcpu's
+ *    context memory and need to be restore upon returing back to the guest.
+ *  - bit 2: represents that the vector context has now loaded and belongs to
+ *    the guest kernel. Any non-scheduler context saving routing needs to save
+ *    the register file to vcpu's context memory. The bit is set upon returing
+ *    back to the guest and cleared after loading the host's vector context.
  *  - bits 8: is used for tracking preemptible kernel-mode Vector, when
  *    RISCV_ISA_V_PREEMPTIVE is enabled. Calling kernel_vector_begin() does not
  *    disable the preemption if the thread's kernel_vstate.datap is allocated.
@@ -97,6 +103,8 @@ struct pt_regs;
 
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
index f76e52de1117..be0f6c7f78da 100644
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
 EXPORT_SYMBOL_FOR_KVM(put_cpu_vector_context);
 
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
index cf6e231e76e2..e2651808e1d3 100644
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
@@ -765,6 +769,14 @@ static void noinstr kvm_riscv_vcpu_enter_exit(struct kvm_vcpu *vcpu,
 	kvm_riscv_vcpu_swap_in_guest_state(vcpu);
 	guest_state_enter_irqoff();
 
+	/* sstatus.VS != SR_VS_OFF is guaranteed when NEED_RESTORE is set */
+	if (current->thread.riscv_v_flags & RISCV_V_VCPU_NEED_RESTORE) {
+		current->thread.riscv_v_flags &= ~RISCV_V_VCPU_NEED_RESTORE;
+		current->thread.riscv_v_flags |= RISCV_V_VCPU_CTX;
+		__kvm_riscv_vector_restore(gcntx);
+		gcntx->sstatus = (gcntx->sstatus & ~SR_VS) | SR_VS_CLEAN;
+	}
+
 	if (kvm_riscv_nacl_sync_sret_available()) {
 		nsh = nacl_shmem();
 
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..ef2eee6ec308 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -56,8 +56,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_restore(cntx);
-		kvm_riscv_vcpu_vector_clean(cntx);
+			riscv_v_flags_set(riscv_v_flags() | RISCV_V_VCPU_NEED_RESTORE);
 	}
 }
 
@@ -72,6 +71,7 @@ void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
 		__kvm_riscv_vector_restore(cntx);
+	riscv_v_flags_set(riscv_v_flags() & ~(RISCV_V_VCPU_CTX | RISCV_V_VCPU_NEED_RESTORE));
 }
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
@@ -95,6 +95,24 @@ void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
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
