Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23C1CCA101F
	for <kvm-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 13:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vN8P7bZEIpyb3Ubsn1W9vkb2orTbGMXiQBM0L7JyPxM=; b=3PmyJg/zeKr1qy
	6nTFqCAVRmzEXOKzY8QogMu90pz6d1V4b51i2F6MckD3X/+AxdeAMfzWxxKpnOy0GuNBYpcJzLh2+
	7o4o5Oar4vFecAKAlNtCBiSLIT7h1B1mQGyr3h1oy+CyIYMFxCSAZ+hx1l9XK7QrBZLp9215E5YOy
	pyp5Hf7NjOmdqxf4bVOiXalCP5L5Pcqeg4O9WTQz6zvaE/fCNq5J6JsRUvUy0VmPd7DNNMgvQ/jol
	+xWnKJYylu73fEpF9wKlDePC6NB/2MZi3Zm9EJYStE3BsUzyuYp4qK+g+5KtwMHRhYLcyHg4dLRIw
	q2v/Kx8HwLGXGcgbBOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux447-00000009dAx-3Smq;
	Fri, 12 Sep 2025 13:43:51 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux444-00000009d8U-0b48;
	Fri, 12 Sep 2025 13:43:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1757684621; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=JEFJ+1KMaBT9yMuJVI/v+rlWqZb3XjQ/Sg99JRs7BGc=;
	b=GcXc1aU/XuTEVnXNEAFFI6pcvOwhCKB1TJU06nOFlJ6FaXks3n6tQ3y3psG7sLsD0CsVmx85MQj7amOE9kt4G5bLj4Hc+Bc/RDq7z3cIncSAT4G7R/drMTrAZV/QUs1OaDicQnyuZ+0gdgoobmPRtDT5cA58bXQ4EcZ3HVbS9pE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WnrFL5n_1757684616 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 12 Sep 2025 21:43:38 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	pbonzini@redhat.com,
	graf@amazon.com,
	jiangyifei@huawei.com
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Fri, 12 Sep 2025 21:43:32 +0800
Message-Id: <20250912134332.22053-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_064348_918484_2FAD1A6B 
X-CRM114-Status: UNSURE (   6.85  )
X-CRM114-Notice: Please train this message.
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

When executing HLV* instructions at the HS mode, a guest page fault
may occur when a g-stage page table migration between triggering the
virtual instruction exception and executing the HLV* instruction.

This may be a corner case, and one simpler way to handle this is to
re-execute the instruction where the virtual  instruction exception
occurred, and the guest page fault will be automatically handled.

Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/vcpu_insn.c | 21 ++++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 97dec18e6989..a8b93aa4d8ec 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -448,7 +448,12 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
 							  ct->sepc,
 							  &utrap);
-			if (utrap.scause) {
+			switch (utrap.scause) {
+			case 0:
+				break;
+			case EXC_LOAD_GUEST_PAGE_FAULT:
+				return KVM_INSN_CONTINUE_SAME_SEPC;
+			default:
 				utrap.sepc = ct->sepc;
 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 				return 1;
@@ -503,7 +508,12 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		 */
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
-		if (utrap.scause) {
+		switch (utrap.scause) {
+		case 0:
+			break;
+		case EXC_LOAD_GUEST_PAGE_FAULT:
+			return KVM_INSN_CONTINUE_SAME_SEPC;
+		default:
 			/* Redirect trap if we failed to read instruction */
 			utrap.sepc = ct->sepc;
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
@@ -629,7 +639,12 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		 */
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
-		if (utrap.scause) {
+		switch (utrap.scause) {
+		case 0:
+			break;
+		case EXC_LOAD_GUEST_PAGE_FAULT:
+			return KVM_INSN_CONTINUE_SAME_SEPC;
+		default:
 			/* Redirect trap if we failed to read instruction */
 			utrap.sepc = ct->sepc;
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
