Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CAC7D3ABC2
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 00:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Mp1tdl6+EJV0H3Z3/KRbaR11Lr1UZtV2aQ1nbBiS7U=; b=p9NFOdQ7LODSv0
	Hl+1RPH2aTI3mtThiENxOZDy19nyjLhDUHuDVqldLZlY94QkoE+gMM2vA1jKquY6gr8swGZhgbWWn
	IBGjSWjQnkE+PA76UObFABDy3iCco5xG5W09sGXpxojB+GxCAaGHsvTR8rf8DKFD4uC6aPom63uUW
	pAoqt8NYX0MOpq0pjS1dSbSyu6H6jBJ+v6ubf2pP3m6SMck2kDQ0Fg1FA30sM695+nCm1SlWvrHM5
	jSzw5jxa2YT/JGPHd2YlYMRqZaohsi/6TbEfTklsd2H/bq/UyQmvZSig0Q5kfMQiyb2ljPXb+G8At
	cZdZ3b0opwuRvHhntB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg2A-0000000AJBp-2iV2;
	Sat, 06 Dec 2025 00:20:22 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0e-0000000AG7S-3gQh
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Dec 2025 00:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ku5/x+LjNQqCx84/WRP5NtSBvqHOmfXefyV2HWZpjLA=; b=mVgvUM1nDsF77hePh2bNyaOGxS
	E+tHaqQbrOIdUcBoErhvf48lJEtEXWDrg4B7ajXErIN5h2/i3rzMBXer0MkShy9GRXfx/Y8XOVVgA
	tTXS2o3HrNpE64Nybk3XFuZ0IRdiH0SbEhxuQoOX3VdAPRjIXIaM1FPZe9Io1VgcZky3w6ZOHjHsL
	JQ2x/w2iUhNu94wrOfBlDdMFXNASyZ/6OoEioYSPgIbkPhM3n1IZk/W6gpvC5jXlppyiFGS2JTKxT
	r0HmxnjSqbM72sX3K6UKT5UNGldafbe/GYOsSNNqMeJFd0uNX9mSp9zHvD4jxerMKXJR9o6bZ8zPS
	BKPRMXzw==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRg0Y-00000006ShG-3vPP
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 00:18:47 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-349aadb8ab9so104954a91.3
        for <kvm-riscv@lists.infradead.org>; Fri, 05 Dec 2025 16:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764980320; x=1765585120; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=ku5/x+LjNQqCx84/WRP5NtSBvqHOmfXefyV2HWZpjLA=;
        b=0SdBqx0GVhDzvwRO9kaCB6ElrZAOYi1StpxLHBpdlvn0bM0HN4uIylXipH4HfMaah8
         w4Lu1RC447gAhEwD+xkmCR6UPJP//VKscgoF+OE7VVD24d144F63xH8lV6dxqFWfWcQR
         zavR2dpk1lRPBDkWMSsRua+4sDqlpU3D+PCRFnRKVja9odZ+40F+ltC8GpviS/Idu2R1
         bSynbw7ggRX4mLoLypHDSK3JVMS0cBrl4nvFNn6WMq/pFnuKBNFReb/BLRcoXCzEVP/G
         eftVTgZ/4L5Ka2BBs0RH1frjpnfmeRNQAd2ncqrh9UIrIbOgnq8b6g8mXOym5ZjSLVRw
         k4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980320; x=1765585120;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ku5/x+LjNQqCx84/WRP5NtSBvqHOmfXefyV2HWZpjLA=;
        b=bLliBjlggzoOxg5WsRFy5YyrwLRR/BKkR7HT4w3wfDaQN0Y+Kqyr6ktOUc7RDV/HoW
         YomhurUO/rnNNZxXuVRZEYmlvIqwHYDmpkKAqE7cxRStzSC3bQAO++M4j7oQKO146vn/
         X/Mgf9GHWGJIxXAhOR5RgZkikBJaXR/w8kPAbsTf8B61NCNUjypqnFZw8N1ibfY8YcA4
         X5RiwxDy3nKu4Ljng/5GTlUJAUCYJtgaI969EOtyRb8LTFd0HRUbu/C8z6tRZic9ZICg
         LsokYWVk2PTyGsnTjgdQUzCSUNSEirZBXo0YA6SEBAA9H3MyjYxQTJBWryTfn44acK1r
         +Csg==
X-Forwarded-Encrypted: i=1; AJvYcCXVhkJILgcaU1CvFUfb1VpPr3smj7PjNRG64LItDp/KWkW2J/YwtAX9XCKv+i199zt/c3sqak/ITt8=@lists.infradead.org
X-Gm-Message-State: AOJu0YykyifLkykwX3JSSEqRzalYuk/kTcM31Eb2PoLSGWkvslxFWH4W
	98D04X88+Yf6z4yc6NOo7oBOFHidKZQMsmKa30i52kL97v+dkn/9CQUFCIYtk+DvSMygdA/qfO8
	O/anLXA==
X-Google-Smtp-Source: AGHT+IEdp4wM145Xt6RAcxFUTnovxS6MiWgfOzkzkurnCS7JdSyw5SBAEDCrfo8aXCdOIaWJdQdQ/+16vt8=
X-Received: from pjbft20.prod.google.com ([2002:a17:90b:f94:b0:347:40b0:958b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e70d:b0:343:66e2:5f9b
 with SMTP id 98e67ed59e1d1-349a25bd10emr622201a91.24.1764980320255; Fri, 05
 Dec 2025 16:18:40 -0800 (PST)
Date: Fri,  5 Dec 2025 16:17:12 -0800
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com>
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251206001720.468579-37-seanjc@google.com>
Subject: [PATCH v6 36/44] KVM: nVMX: Don't update msr_autostore count when
 saving TSC for vmcs12
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_001843_001192_8485E0F3 
X-CRM114-Status: GOOD (  19.34  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Rework nVMX's use of the MSR auto-store list to snapshot TSC to sneak
MSR_IA32_TSC into the list _without_ updating KVM's software tracking,
and drop the generic functionality so that future usage of the store list
for nested specific logic needs to consider the implications of modifying
the list.  Updating the list only for vmcs02 and only on nested VM-Enter
is a disaster waiting to happen, as it means vmcs01 is stale relative to
the software tracking, and KVM could unintentionally leave an MSR in the
store list in perpetuity while running L1, e.g. if KVM addressed the first
issue and updated vmcs01 on nested VM-Exit without removing TSC from the
list.

Furthermore, mixing KVM's desire to save an MSR with L1's desire to save
an MSR result KVM clobbering/ignoring the needs of vmcs01 or vmcs02.
E.g. if KVM added MSR_IA32_TSC to the store list for its own purposes, and
then _removed_ MSR_IA32_TSC from the list after emulating nested VM-Enter,
then KVM would remove MSR_IA32_TSC from the list even though saving TSC on
VM-Exit from L2 is still desirable (to provide L1 with an accurate TSC).

Similarly, removing an MSR from the list based on vmcs12's settings could
drop an MSR that KVM wants to save for its own purposes.

In practice, the issues are currently benign, because KVM doesn't use the
store list for vmcs01.  But that will change with upcoming mediated PMU
support.

Alternatively, a "full" solution would be to track MSR list entries for
vmcs12 separately from KVM's standard lists, but MSR_IA32_TSC is likely
the only MSR that KVM would ever want to save on _every_ VM-Exit purely
based on vmcs12.  I.e. the added complexity isn't remotely justified at
this time.

Opportunistically escalate from a pr_warn_ratelimited() to a full WARN as
KVM reserves eight entries in each MSR list, and as above KVM uses at most
one entry.

Opportunistically make vmx_find_loadstore_msr_slot() local to vmx.c as
using it directly from nested code is unsafe due to the potential for
mixing vmcs01 and vmcs02 state (see above).

Cc: Jim Mattson <jmattson@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/nested.c | 71 ++++++++++++---------------------------
 arch/x86/kvm/vmx/vmx.c    |  2 +-
 arch/x86/kvm/vmx/vmx.h    |  2 +-
 3 files changed, 24 insertions(+), 51 deletions(-)

diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
index 486789dac515..614b789ecf16 100644
--- a/arch/x86/kvm/vmx/nested.c
+++ b/arch/x86/kvm/vmx/nested.c
@@ -1075,16 +1075,12 @@ static bool nested_vmx_get_vmexit_msr_value(struct kvm_vcpu *vcpu,
 	 * does not include the time taken for emulation of the L2->L1
 	 * VM-exit in L0, use the more accurate value.
 	 */
-	if (msr_index == MSR_IA32_TSC) {
-		int i = vmx_find_loadstore_msr_slot(&vmx->msr_autostore,
-						    MSR_IA32_TSC);
+	if (msr_index == MSR_IA32_TSC && vmx->nested.tsc_autostore_slot >= 0) {
+		int slot = vmx->nested.tsc_autostore_slot;
+		u64 host_tsc = vmx->msr_autostore.val[slot].value;
 
-		if (i >= 0) {
-			u64 val = vmx->msr_autostore.val[i].value;
-
-			*data = kvm_read_l1_tsc(vcpu, val);
-			return true;
-		}
+		*data = kvm_read_l1_tsc(vcpu, host_tsc);
+		return true;
 	}
 
 	if (kvm_emulate_msr_read(vcpu, msr_index, data)) {
@@ -1163,42 +1159,6 @@ static bool nested_msr_store_list_has_msr(struct kvm_vcpu *vcpu, u32 msr_index)
 	return false;
 }
 
-static void prepare_vmx_msr_autostore_list(struct kvm_vcpu *vcpu,
-					   u32 msr_index)
-{
-	struct vcpu_vmx *vmx = to_vmx(vcpu);
-	struct vmx_msrs *autostore = &vmx->msr_autostore;
-	bool in_vmcs12_store_list;
-	int msr_autostore_slot;
-	bool in_autostore_list;
-	int last;
-
-	msr_autostore_slot = vmx_find_loadstore_msr_slot(autostore, msr_index);
-	in_autostore_list = msr_autostore_slot >= 0;
-	in_vmcs12_store_list = nested_msr_store_list_has_msr(vcpu, msr_index);
-
-	if (in_vmcs12_store_list && !in_autostore_list) {
-		if (autostore->nr == MAX_NR_LOADSTORE_MSRS) {
-			/*
-			 * Emulated VMEntry does not fail here.  Instead a less
-			 * accurate value will be returned by
-			 * nested_vmx_get_vmexit_msr_value() by reading KVM's
-			 * internal MSR state instead of reading the value from
-			 * the vmcs02 VMExit MSR-store area.
-			 */
-			pr_warn_ratelimited(
-				"Not enough msr entries in msr_autostore.  Can't add msr %x\n",
-				msr_index);
-			return;
-		}
-		last = autostore->nr++;
-		autostore->val[last].index = msr_index;
-	} else if (!in_vmcs12_store_list && in_autostore_list) {
-		last = --autostore->nr;
-		autostore->val[msr_autostore_slot] = autostore->val[last];
-	}
-}
-
 /*
  * Load guest's/host's cr3 at nested entry/exit.  @nested_ept is true if we are
  * emulating VM-Entry into a guest with EPT enabled.  On failure, the expected
@@ -2699,12 +2659,25 @@ static void prepare_vmcs02_rare(struct vcpu_vmx *vmx, struct vmcs12 *vmcs12)
 	}
 
 	/*
-	 * Make sure the msr_autostore list is up to date before we set the
-	 * count in the vmcs02.
+	 * If vmcs12 is configured to save TSC on exit via the auto-store list,
+	 * append the MSR to vmcs02's auto-store list so that KVM effectively
+	 * reads TSC at the time of VM-Exit from L2.  The saved value will be
+	 * propagated to vmcs12's list on nested VM-Exit.
+	 *
+	 * Don't increment the number of MSRs in the vCPU structure, as saving
+	 * TSC is specific to this particular incarnation of vmcb02, i.e. must
+	 * not bleed into vmcs01.
 	 */
-	prepare_vmx_msr_autostore_list(&vmx->vcpu, MSR_IA32_TSC);
+	if (nested_msr_store_list_has_msr(&vmx->vcpu, MSR_IA32_TSC) &&
+	    !WARN_ON_ONCE(vmx->msr_autostore.nr >= ARRAY_SIZE(vmx->msr_autostore.val))) {
+		vmx->nested.tsc_autostore_slot = vmx->msr_autostore.nr;
+		vmx->msr_autostore.val[vmx->msr_autostore.nr].index = MSR_IA32_TSC;
 
-	vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
+		vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr + 1);
+	} else {
+		vmx->nested.tsc_autostore_slot = -1;
+		vmcs_write32(VM_EXIT_MSR_STORE_COUNT, vmx->msr_autostore.nr);
+	}
 	vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, vmx->msr_autoload.host.nr);
 	vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, vmx->msr_autoload.guest.nr);
 
diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index 23c92c41fd83..52bcb817cc15 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -1029,7 +1029,7 @@ static __always_inline void clear_atomic_switch_msr_special(struct vcpu_vmx *vmx
 	vm_exit_controls_clearbit(vmx, exit);
 }
 
-int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
+static int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr)
 {
 	unsigned int i;
 
diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
index 4ce653d729ca..3175fedb5a4d 100644
--- a/arch/x86/kvm/vmx/vmx.h
+++ b/arch/x86/kvm/vmx/vmx.h
@@ -191,6 +191,7 @@ struct nested_vmx {
 	u16 vpid02;
 	u16 last_vpid;
 
+	int tsc_autostore_slot;
 	struct nested_vmx_msrs msrs;
 
 	/* SMM related state */
@@ -383,7 +384,6 @@ void vmx_spec_ctrl_restore_host(struct vcpu_vmx *vmx, unsigned int flags);
 unsigned int __vmx_vcpu_run_flags(struct vcpu_vmx *vmx);
 bool __vmx_vcpu_run(struct vcpu_vmx *vmx, unsigned long *regs,
 		    unsigned int flags);
-int vmx_find_loadstore_msr_slot(struct vmx_msrs *m, u32 msr);
 void vmx_ept_load_pdptrs(struct kvm_vcpu *vcpu);
 
 void vmx_set_intercept_for_msr(struct kvm_vcpu *vcpu, u32 msr, int type, bool set);
-- 
2.52.0.223.gf5cc29aaa4-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
