Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA48FCCD1A2
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 00:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aSdPnj1NDvrjRKWvnYmq25Z0vyPDb7wXd/UKRRMIEg=; b=1ZraPuSFoObMiN
	Q3Su0eUOC/7Ubi3ho0EuVXuoLSumPJs0LHs8crpM8nzpQrD/vvEofb59xtboDouGkaemTldx5kBmX
	iDwe9aIsI2Zo5cimR1QWILmDuodruYcVu2u5qfH0syBELJmvS+gBx0UE/lL64cQYMnYjztgEe3bQc
	694IfM+h31zN39s507kdWF39DwobPYa5uufnB7/byQkTU7xVHZwEuw8KfEWzVmGaYHQtFnh1bsrQy
	Jd8+PEAcVIGZNfnAxyTpMHy6MPYj1VVim9NIsTuHr/uJy+QqZ4x0KJtUsiyRS9XQecGQIlNbSS+eP
	F3HUEvVb9IqoTRAxFdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YQc-00000006FEy-3Tgv;
	Fri, 17 Oct 2025 00:34:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPW-00000006DWJ-2zPO
	for kvm-riscv@bombadil.infradead.org;
	Fri, 17 Oct 2025 00:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=; b=LucA+66VBDGEV23QNql0wLFyJm
	cKyGAmS+B33/NdZI0WeKC6qu3pGLLCccXKxCxvFjPbwnjvB6rvxy/E8JqW9wRRwXMfimz5LFDetQt
	/Fx4REywSePSENcVh5BytOP6wrEKrrHI6NDsgV7p+5nyxZbvwMpCj9fLequAatYO++4ouuLYe8TCn
	2xi+BypnvSv14jh/rMugYva8kWg2DcwGhF9fNrk81HDwxsb8Jx/wyrpSgDA6PpASJbZ1uPSXjL9mM
	fSQmSpRiV5581lx2Flohprab/4W6pKPAcbP1sWQmx76OYVsbbwKEWM6TrIQoKMK9rncx6vfo6qAEa
	hazkgxFA==;
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9YPR-0000000FiCg-05za
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 00:33:32 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-33baf262850so1336839a91.0
        for <kvm-riscv@lists.infradead.org>; Thu, 16 Oct 2025 17:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760661203; x=1761266003; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=;
        b=OpWPV9qz78+QAqle7URjiunEnQHq1g4EqS/DiLTmMWKrTEoZqGV+4gFjfkS0T9jNRS
         lyf3GuSwF70DsqTMiogotBIXVedtuR5e5a8oINBzBoXewlAPXefkhEXtY9n1TZorOkvU
         NsFuKDiOKbCaeTwCbmYXWpfChMSbhdZCYllH3rkVgex5YEWcRFIMy4LhzqNIt9blHcou
         xEcgT7d4gNPsXBrqPuNG+MIKiXzCSSorBDwVbQ05fqNiFi+hbQfCqASd1jRcpC3mmiZB
         gE434d1YpIeRdTS/BNOcY+AX+jndE23wdI8R9PGK+v+poGfuGyG+lI1ZNzMkMhhgV2xU
         mHzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760661203; x=1761266003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jejy5GHiX1n5ZzK7FS/SwKAPXTIMDzw65QOVqYwFQBI=;
        b=j2jGYX8w6staz+hkpgfYOnu4G1If65DxwHSbh4WSbWu/YZK4xc9oYZVnroezK6JqhJ
         ZNSZJwSlT0mnAACkBO13CJLElrj90Onv4PsRSh/PMwEj0z2TqQh48cNFjfvQP46guhYB
         t9joXDkvqDl504qs/E68gT6hJzLHvjVwXKBk8+SnnDroZ1gUC/441304jfVky34Zu5qE
         SP7phG4mmo0lk9NuGpVtaWWfC9itwVODKjcy8Bj63wG4WrEPrqY6A/CiA4Ck3XcGZrNK
         fm+VeHSmcg7ZTxAeKTVY5jItlEnvAjC1/+NfigpFf0ywa0S9mG4xRFzRpeK+8E0IOrgg
         GUtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXNRW0e2O2cPf9GfZK6n65Yn1bsR0Yr4dyNDyRCrB1JjFJI4LTKcx8pXZrwmt3AQ2orrAnTxAMCn1o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVMO74p0gYpXcnBWBZpzvPLjNrifK3jkFFPdxBG3u7BvjndEPW
	HAdCRxBYnox9HLnvGy8TsFStUmSZoNyA7tmqOdJj0LaNJDRdfKpP0MapFpfqUpmkxp12omky7UH
	hG8MnkQ==
X-Google-Smtp-Source: AGHT+IFl8lCxI7RawbIX2CACJWbI5vFGM8HhgndqIpbMEKI2O7QrNwa82jxnXWK9S77FfTXYSbFZaN83qL4=
X-Received: from pjqx20.prod.google.com ([2002:a17:90a:b014:b0:338:3e6b:b835])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c02:b0:32c:38b0:593e
 with SMTP id 98e67ed59e1d1-33bcf85ffa4mr1903883a91.5.1760661203423; Thu, 16
 Oct 2025 17:33:23 -0700 (PDT)
Date: Thu, 16 Oct 2025 17:32:38 -0700
In-Reply-To: <20251017003244.186495-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
Message-ID: <20251017003244.186495-21-seanjc@google.com>
Subject: [PATCH v3 20/25] KVM: TDX: Add macro to retry SEAMCALLs when forcing
 vCPUs out of guest
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Michael Roth <michael.roth@amd.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_013330_289996_13795882 
X-CRM114-Status: GOOD (  11.25  )
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

Add a macro to handle kicking vCPUs out of the guest and retrying
SEAMCALLs on -EBUSY instead of providing small helpers to be used by each
SEAMCALL.  Wrapping the SEAMCALLs in a macro makes it a little harder to
tease out which SEAMCALL is being made, but significantly reduces the
amount of copy+paste code and makes it all but impossible to leave an
elevated wait_for_sept_zap.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 72 ++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index f6782b0ffa98..2e2dab89c98f 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -294,25 +294,24 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
 	vcpu->cpu = -1;
 }
 
-static void tdx_no_vcpus_enter_start(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, true);
-
-	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
-}
-
-static void tdx_no_vcpus_enter_stop(struct kvm *kvm)
-{
-	struct kvm_tdx *kvm_tdx = to_kvm_tdx(kvm);
-
-	lockdep_assert_held_write(&kvm->mmu_lock);
-
-	WRITE_ONCE(kvm_tdx->wait_for_sept_zap, false);
-}
+#define tdh_do_no_vcpus(tdh_func, kvm, args...)					\
+({										\
+	struct kvm_tdx *__kvm_tdx = to_kvm_tdx(kvm);				\
+	u64 __err;								\
+										\
+	lockdep_assert_held_write(&kvm->mmu_lock);				\
+										\
+	__err = tdh_func(args);							\
+	if (unlikely(tdx_operand_busy(__err))) {				\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, true);			\
+		kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);	\
+										\
+		__err = tdh_func(args);						\
+										\
+		WRITE_ONCE(__kvm_tdx->wait_for_sept_zap, false);		\
+	}									\
+	__err;									\
+})
 
 /* TDH.PHYMEM.PAGE.RECLAIM is allowed only when destroying the TD. */
 static int __tdx_reclaim_page(struct page *page)
@@ -1711,14 +1710,7 @@ static void tdx_track(struct kvm *kvm)
 	if (unlikely(kvm_tdx->state != TD_STATE_RUNNABLE))
 		return;
 
-	err = tdh_mem_track(&kvm_tdx->td);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_track(&kvm_tdx->td);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_track, kvm, &kvm_tdx->td);
 	TDX_BUG_ON(err, TDH_MEM_TRACK, kvm);
 
 	kvm_make_all_cpus_request(kvm, KVM_REQ_OUTSIDE_GUEST_MODE);
@@ -1770,14 +1762,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	if (KVM_BUG_ON(level != PG_LEVEL_4K, kvm))
 		return;
 
-	err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-	if (unlikely(tdx_operand_busy(err))) {
-		/* After no vCPUs enter, the second retry is expected to succeed */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_range_block, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_RANGE_BLOCK, entry, level_state, kvm))
 		return;
 
@@ -1792,20 +1778,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
 	 * with other vcpu sept operation.
 	 * Race with TDH.VP.ENTER due to (0-step mitigation) and Guest TDCALLs.
 	 */
-	err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-				  &level_state);
-
-	if (unlikely(tdx_operand_busy(err))) {
-		/*
-		 * The second retry is expected to succeed after kicking off all
-		 * other vCPUs and prevent them from invoking TDH.VP.ENTER.
-		 */
-		tdx_no_vcpus_enter_start(kvm);
-		err = tdh_mem_page_remove(&kvm_tdx->td, gpa, tdx_level, &entry,
-					  &level_state);
-		tdx_no_vcpus_enter_stop(kvm);
-	}
-
+	err = tdh_do_no_vcpus(tdh_mem_page_remove, kvm, &kvm_tdx->td, gpa,
+			      tdx_level, &entry, &level_state);
 	if (TDX_BUG_ON_2(err, TDH_MEM_PAGE_REMOVE, entry, level_state, kvm))
 		return;
 
-- 
2.51.0.858.gf9c4a03a3a-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
