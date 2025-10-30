Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D31F4CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dzI1TF64Lp5ZzjrFZo3Cb+DWfD8ZpkpZPp91mI8a7dE=; b=nJcecRManMyRLz
	lcCIeBIa2XW4X6NQV6P5uKU33mP+3nI60sZ1NaijsXoJ6EadeX5fNYph+JhVJHt4x8TbbCs7D7/+9
	MVw8o97IhshFUvisO235u8Kcv1PGmmK04FTm+53UzdHTu8ZtLLAu7ftSOdaCl25NEwhsxUMXQu3le
	d5qgHRB0Kzwuk3tbcHtLbq3kQHk8ZnBYc5+IZTTRmIrjpH42qoiRngItZfgqguFE8fSkIg2dzIb5r
	nTtx92D5jp8SjxpcbXGlIvxTEEkgHp/zBoKrmZ1OLhN9eEHFdj/mC25LF5O9F/x+cVX5J7fn8xTan
	KSAMjBaqBEPfwId2iqHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ19-00000004mmu-1QMn;
	Thu, 30 Oct 2025 20:13:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz4-00000004kJB-3JeR
	for kvm-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 20:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=; b=ZbRj9N0TDsqv1zXRfHfC9zjno9
	c2+NUqtV0gKStDv5O8fLLos0KaCijl5VB3Ohxnb66xR6iwHl0FIPGWeBnJrWz4Ur77/czAmuXYdzV
	LBEBSkyOgx2qcSwSWJfagLfOpjscNlbL5DBCTudEkiEOM6FGK3QPl/C6+nV84Xq6Nz5alTZrBGJLi
	exhlUa3AF1cq1h6+5ATHHOXt9hUJTKXpMeOBEVqzhGEL8NEfUFi9dNKP2FXHrLWwKRhYaRgViuWRZ
	2UM4c2Q5jypH2g9/pMkUwtycwuTIuEwCMwQexyrLH+tZWiiYtbVBtj9lJ+5kuoHaFj0r4HPDpGxz1
	ZCXhr3kg==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEY7H-00000009tx6-3XP0
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 19:15:26 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-32eb18b5500so2309087a91.2
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855052; x=1762459852; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=hdbYCOHRyiQ0L/jEJh1DbvL59dqhV5ibzwLLgfdJo3yW9zVfZK+gsHJwW6Psz++JX4
         WR0bnkbmmOHCkTXYyf7KYv2U2tm84arCXcYXiQeyzn7MOgHwle4o70639ZDpt5jLb69r
         i0pretToQSHN8ObqTYElFPBqgJJd02ApCNaf/1M8I2sqTtroUPGllUFcvHby1c2FE/LB
         P3HoVXeXYuivnp0XKk5BLNGSPMxg3KqYkHKi0EQw+Np7CftF8iiXubpdI1wJY1JmgsO+
         D9evqLk1weMFq0m66A9Xh7idJv2w1jJTQuhZB3XbqezkPlLc3CNENs54PXJNRteXAiGG
         yZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855052; x=1762459852;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xpa5Fver89jqQUHMNWla6MmRTI/zYJOh/l7CEBc/74M=;
        b=wYx1uauh+2cZylqzSL8PG6MZYW76ylXMqt/8A8HsjhlFf5tmGaE0bBYFryFv+xriPD
         Fwou7qfuLlKCpoT5kUMqZQT9it4Bifu3s4CokidWSTE+eEU3/j8uVpuJ24qf+WNThOld
         hKfo6gnmPcpDVbd6KinAcZCGmJ1T2DJo43X08+h1LXDw2Yc4ZtSmnLpwSpdR+pbzRstd
         Iz4b3u11L4S9aWTqz4p42u+HGS1ea+4sCXLJvFrjmuqmXUe7gEyuL+i6pd7PxNtZoW2Y
         /CErhaeYx/czUPlKnKTARtfgDjAUq7xVA7vYa78WmIB99UPnl+3lqfpeAeKPOpFEVux5
         notg==
X-Forwarded-Encrypted: i=1; AJvYcCWcKHKt9quGvdGfeRUi8SfXIt7URoUeItQkAzjb7rkaWqIv/IgG2mVgMPv1XgYPy+s30KXEMfuZAlk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxpFqYaVzDGz7r39J0YtJl6MfX4zZQmZ6ldQFhUk4li/scR10Vu
	W9S80Zvzey09eUpvIoPBWhBJjPtGDFt6qD0RL2GlXwU1lXwMUQl1w1vVhNyyZiEny5gzq3xrqPx
	lhwUd+g==
X-Google-Smtp-Source: AGHT+IGdH9ACR3MS+ju/IeUipjD96kAUXZo3BjKEOn1spE0qh/NlJMuCLno+Rlt479ILTGbPCBlzBUGVIBM=
X-Received: from pjl4.prod.google.com ([2002:a17:90b:2f84:b0:339:dc19:ae60])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c52:b0:338:3789:2e7b
 with SMTP id 98e67ed59e1d1-34082fd9099mr1370626a91.13.1761855052135; Thu, 30
 Oct 2025 13:10:52 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:44 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-22-seanjc@google.com>
Subject: [PATCH v4 21/28] KVM: TDX: Add macro to retry SEAMCALLs when forcing
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
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_191523_959459_A23EC671 
X-CRM114-Status: GOOD (  14.31  )
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
 arch/x86/kvm/vmx/tdx.c | 82 +++++++++++++++++-------------------------
 1 file changed, 33 insertions(+), 49 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 999b519494e9..97632fc6b520 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -294,25 +294,34 @@ static inline void tdx_disassociate_vp(struct kvm_vcpu *vcpu)
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
+/*
+ * Execute a SEAMCALL related to removing/blocking S-EPT entries, with a single
+ * retry (if necessary) after forcing vCPUs to exit and wait for the operation
+ * to complete.  All flows that remove/block S-EPT entries run with mmu_lock
+ * held for write, i.e. are mutually exclusive with each other, but they aren't
+ * mutually exclusive with running vCPUs, and so can fail with "operand busy"
+ * if a vCPU acquires a relevant lock in the TDX-Module, e.g. when doing TDCALL.
+ *
+ * Note, the retry is guaranteed to succeed, absent KVM and/or TDX-Module bugs.
+ */
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
@@ -1722,14 +1731,7 @@ static void tdx_track(struct kvm *kvm)
 	 */
 	lockdep_assert_held_write(&kvm->mmu_lock);
 
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
@@ -1781,14 +1783,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
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
 
@@ -1803,20 +1799,8 @@ static void tdx_sept_remove_private_spte(struct kvm *kvm, gfn_t gfn,
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
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
