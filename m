Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D823CD4F54
	for <kvm-riscv@archiver.kernel.org>; Thu, 28 May 2026 19:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C7l2wPaf4mmdVMh/hwIcH/dTnK2aDkPk9i/ezjSMcHo=; b=25oYVwPzgv7ipj
	yLQCbUR4CdfnWcmcrg7tO4NL7ZrnrPwVcmLN6FPdSDsUYi+TzgSxdiXfAG/32dqPf6ECTkpXzuBvq
	YvnS7EL86s/D5ltC88a/8UvXafdimpWI5l54odqgp+7BOkhusMOwjckGe0HIo+ny9259nBghDWodu
	OeXLvDvK6rV6bIo5IbP2fn3Uv9xaeN5VPVgnJACWMn6M/GC0CsZ944db1/4CqTe+yW7kwQRdVW2/k
	aorVUGUWzezsZqZFTMguxCy7O3xuPk0NSSlngx7nlPkyeILHP6pEZ8D1CDWobrEBLhp/VIFDbcup3
	VDvlG2XRWAEnE0KAODug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8M-00000006Fzn-21rE;
	Thu, 28 May 2026 19:11:10 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSg8K-00000006Fyo-3IHs
	for kvm-riscv@lists.infradead.org;
	Thu, 28 May 2026 19:11:09 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7e5fd39cf11so6016652a34.0
        for <kvm-riscv@lists.infradead.org>; Thu, 28 May 2026 12:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1779995468; x=1780600268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=So1Dot4XH9WMIAQdwvqn+C0MDAzA9ANdxsQAk9WKwiw=;
        b=RZa1+AiIZhLMhBytsyR0NcyMmyYAblXh77xgfKNgt/clxtoTfT9pli0b5tztNR4Z8I
         kcx7mFgEW3MXMvGIWYlMeVfudIEEplggRfhDwdIbgzZQtXBzuK+51TzP2ZaGtmdSIz95
         DdcMX2eUAaqqjiouej7rduCjUPuEEF4rOL4r3gnGiUjB8lVCK7NBM9BXCBvwjJpwaGo4
         8jvjQQBPZORANlrYN7QoOgNIrGDcO05x1QNFoUv3r5NOYlKVkcs3tnykHAFYUQ51NNmH
         +sbr8PbOB5vOemfTNbnUk5lTDcMZ4Ih6lY61HeADWciGll3lih6ns5TWhyWOCA5Vzpuv
         TuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779995468; x=1780600268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=So1Dot4XH9WMIAQdwvqn+C0MDAzA9ANdxsQAk9WKwiw=;
        b=eEo7vKq7nxqjtWBy6CzVq2gmGrat1mj2y2dn44vtdxu6GJQhDHMOwMXm9YF/j/i2Vf
         7bqsscN8TP/VnDKuAbk2ay1TRwXv0Gzat/uQiX2YHuLt+8CMxr/h7BTm7YpeF7BMbU1h
         f46WqLXqFg2rte4dIngGOPd9ulU0uLrOrHI64hwWwL5S8pk8Q4QdNOYyfk9eavmtYpON
         dCH9ZUuuKymem4FVbUGRI+22xwk8E3cKT14QU/8Yz7yM1mBekuepSteCavYZTZJpT/5d
         XBgiuM+yBuMiMZ5tl+ra58fSHLBAh11FdnGwp+wojj/9sIvbwsHK+fMdxZjQdVi4gFxf
         CDfA==
X-Forwarded-Encrypted: i=1; AFNElJ+guidoPeSzQw/iyJtWznVX209ffQmg69gA0fTPkJgNJG1BL1zcrHHfz494Cndk00OCrqRe5WibMv0=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKJc3aov/TlsmJRlCIjRSUamO5f9oefCFUSSsD7lQIuMSc7UQR
	EiHEGQ/CRyzPsh5WjRCjPC+EkcTbkPKafrVPIsMHTOVYmzFJZxThTnIbFwDZc9OsO8o=
X-Gm-Gg: Acq92OFD46XTUDchqcDwujwh4zAA2w76/8+cKtmhO6XKGisYZwO32r/vHjpZqokel2N
	uhpVP6FwXHBJVSEjmi0xvPNTv7CZmM0DtXAKDKbsvhPT7txQX0E1tV4x4UMhBG90OD4vLPdEIqA
	YR54LMipDFrxvrf689jcjcmmBlJ0Y404/9Jr+4jLbkbsPMDK/659NazCON6vlPes2A9iM1osznw
	01YFe/+L+VrtHX+EAaQLEyGTPqc0zG37xyPtdP5g0b2Q7IczjCaDFeCk3IWAqOE7r3KiLegSy5w
	uhRjwuRXnratMQ1TtLYRg45T6uyUk6zvQhoj4tMgsZkwoSvMonYnVPBH1xTM/WyTSa/UBRsGRFP
	dkTRwz+GkEjVDWb3hRWWPG3kYG/92TD6TSY/xzhMBkxM9g/4usEL+wwVvTolq85mKpH6FmzPIg6
	z5EjoQzaF+4P8ENc3mH5YgyHuqwl6rTGTKezGf8IigFhG4Wv5dD1MLWYBcvYq9m4ZEWkg=
X-Received: by 2002:a05:6830:3698:b0:7dc:e37b:b5d3 with SMTP id 46e09a7af769-7e694499e54mr8407a34.7.1779995467759;
        Thu, 28 May 2026 12:11:07 -0700 (PDT)
Received: from lima-default.tail89d63.ts.net ([12.55.13.134])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7e606482b65sm14849267a34.10.2026.05.28.12.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 12:11:07 -0700 (PDT)
From: Andy Chiu <tchiu@tenstorrent.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Cc: Andy Chiu <tchiu@tenstorrent.com>,
	dfustini@oss.tenstorrent.com,
	greentime.hu@sifive.com,
	daichengrong <daichengrong@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: [[PATCH] v4 1/4] riscv: vector: refactor vector context operations
Date: Thu, 28 May 2026 14:09:12 -0500
Message-ID: <20260528190927.886558-2-tchiu@tenstorrent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528190927.886558-1-tchiu@tenstorrent.com>
References: <ag_N8H3e3YzjRb8j@chonkvm.lixom.net>
 <20260528190927.886558-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_121108_835113_87A33372 
X-CRM114-Status: GOOD (  17.22  )
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

Lift riscv_v_{enable,disable} out of __*vstate_{save,restore,discard} so
that we can reuse some functions without repeatedly turning on/off
vector.

Also, refactor and document about the user context save in preempt_v to
make code more readable.

Signed-off-by: Andy Chiu <tchiu@tenstorrent.com>
---
Changelog v4:
 - fix an unused variable warning (Olof)
Changelog v3:
 - new patch since v3
---
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 +++++--
 arch/riscv/include/asm/vector.h          | 15 ++++++------
 arch/riscv/kernel/kernel_mode_vector.c   | 29 +++++++++++++++++++-----
 arch/riscv/kvm/vcpu_vector.c             |  8 +++----
 4 files changed, 41 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 57a798a4cb0d..e679869e2ba3 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -16,14 +16,18 @@
 #include <asm/vector.h>
 #include <asm/kvm_host.h>
 
-static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_save(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_save(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
-static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+static __always_inline void kvm_riscv_vector_restore(struct kvm_cpu_context *context)
 {
+	riscv_v_enable();
 	__riscv_v_vstate_restore(&context->vector, context->vector.datap);
+	riscv_v_disable();
 }
 
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 00cb9c0982b1..45820cd900d6 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -198,7 +198,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	__vstate_csr_save(save_to);
 	if (has_xtheadvector()) {
 		asm volatile (
@@ -227,7 +226,6 @@ static inline void __riscv_v_vstate_save(struct __riscv_v_ext_state *save_to,
 			".option pop\n\t"
 			: "=&r" (vl) : "r" (datap) : "memory");
 	}
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_from,
@@ -235,7 +233,6 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 {
 	unsigned long vl;
 
-	riscv_v_enable();
 	if (has_xtheadvector()) {
 		asm volatile (
 			"mv t0, %0\n\t"
@@ -264,14 +261,12 @@ static inline void __riscv_v_vstate_restore(struct __riscv_v_ext_state *restore_
 			: "=&r" (vl) : "r" (datap) : "memory");
 	}
 	__vstate_csr_restore(restore_from);
-	riscv_v_disable();
 }
 
 static inline void __riscv_v_vstate_discard(void)
 {
 	unsigned long vl, vtype_inval = 1UL << (BITS_PER_LONG - 1);
 
-	riscv_v_enable();
 	if (has_xtheadvector())
 		asm volatile (THEAD_VSETVLI_T4X0E8M8D1 : : : "t4");
 	else
@@ -291,14 +286,14 @@ static inline void __riscv_v_vstate_discard(void)
 		"vsetvl		%0, x0, %1\n\t"
 		".option pop\n\t"
 		: "=&r" (vl) : "r" (vtype_inval));
-
-	riscv_v_disable();
 }
 
 static inline void riscv_v_vstate_discard(struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_discard();
+		riscv_v_disable();
 		__riscv_v_vstate_dirty(regs);
 	}
 }
@@ -307,7 +302,9 @@ static inline void riscv_v_vstate_save(struct __riscv_v_ext_state *vstate,
 				       struct pt_regs *regs)
 {
 	if (__riscv_v_vstate_check(regs->status, DIRTY)) {
+		riscv_v_enable();
 		__riscv_v_vstate_save(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -316,7 +313,9 @@ static inline void riscv_v_vstate_restore(struct __riscv_v_ext_state *vstate,
 					  struct pt_regs *regs)
 {
 	if (riscv_v_vstate_query(regs)) {
+		riscv_v_enable();
 		__riscv_v_vstate_restore(vstate, vstate->datap);
+		riscv_v_disable();
 		__riscv_v_vstate_clean(regs);
 	}
 }
@@ -378,8 +377,10 @@ static inline void __switch_to_vector(struct task_struct *prev,
 			prev->thread.riscv_v_flags |= RISCV_PREEMPT_V_IN_SCHEDULE;
 		}
 		if (riscv_preempt_v_dirty(prev)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(&prev->thread.kernel_vstate,
 					      prev->thread.kernel_vstate.datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(prev);
 		}
 	} else {
diff --git a/arch/riscv/kernel/kernel_mode_vector.c b/arch/riscv/kernel/kernel_mode_vector.c
index 99972a48e86b..21127b33fea8 100644
--- a/arch/riscv/kernel/kernel_mode_vector.c
+++ b/arch/riscv/kernel/kernel_mode_vector.c
@@ -123,7 +123,7 @@ static int riscv_v_stop_kernel_context(void)
 
 static int riscv_v_start_kernel_context(bool *is_nested)
 {
-	struct __riscv_v_ext_state *kvstate, *uvstate;
+	struct __riscv_v_ext_state *kvstate;
 
 	kvstate = &current->thread.kernel_vstate;
 	if (!kvstate->datap)
@@ -134,20 +134,35 @@ static int riscv_v_start_kernel_context(bool *is_nested)
 		*is_nested = true;
 		get_cpu_vector_context();
 		if (riscv_preempt_v_dirty(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_save(kvstate, kvstate->datap);
+			riscv_v_disable();
 			riscv_preempt_v_clear_dirty(current);
 		}
 		riscv_preempt_v_set_restore(current);
 		return 0;
 	}
 
-	/* Transfer the ownership of V from user to kernel, then save */
-	riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
+	/*
+	 * Skip saving user's context if it is not DIRTY. We would have to start KMV in "dirty" if
+	 * this check is performed after KMV starts, to protect user's ctx. Then, we could waste
+	 * time saving already "clean" context once KMV is started in "dirty".
+	 */
 	if (__riscv_v_vstate_check(task_pt_regs(current)->status, DIRTY)) {
-		uvstate = &current->thread.vstate;
-		__riscv_v_vstate_save(uvstate, uvstate->datap);
+		/* Transfer the ownership of V from user to kernel, then save */
+		riscv_v_start(RISCV_PREEMPT_V | RISCV_PREEMPT_V_DIRTY);
+		/*
+		 * Calling the guarded version of vstate_save to make the code cleaner. Also, the
+		 * vstate check within the call is necessary as context switch may happen between
+		 * __riscv_v_vstate_check and riscv_v_start. In such case we are not supposed to
+		 * save the context again.
+		 */
+		riscv_v_vstate_save(&current->thread.vstate, task_pt_regs(current));
+		riscv_preempt_v_clear_dirty(current);
+		return 0;
 	}
-	riscv_preempt_v_clear_dirty(current);
+
+	riscv_v_start(RISCV_PREEMPT_V);
 	return 0;
 }
 
@@ -180,7 +195,9 @@ asmlinkage void riscv_v_context_nesting_end(struct pt_regs *regs)
 	depth = riscv_v_ctx_get_depth();
 	if (depth == 0) {
 		if (riscv_preempt_v_restore(current)) {
+			riscv_v_enable();
 			__riscv_v_vstate_restore(vstate, vstate->datap);
+			riscv_v_disable();
 			__riscv_v_vstate_clean(regs);
 			riscv_preempt_v_reset_flags();
 		}
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 62d2fb77bb9b..da6c6db846c1 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -46,7 +46,7 @@ void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_save(cntx);
+			kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
@@ -56,7 +56,7 @@ void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
 		if (riscv_isa_extension_available(isa, v))
-			__kvm_riscv_vector_restore(cntx);
+			kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
@@ -65,13 +65,13 @@ void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
 {
 	/* No need to check host sstatus as it can be modified outside */
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vector_save(cntx);
 }
 
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
 {
 	if (!kvm_riscv_isa_check_host(V))
-		__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vector_restore(cntx);
 }
 
 int kvm_riscv_vcpu_alloc_vector_context(struct kvm_vcpu *vcpu)
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
