Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 510A0CCFA1A
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=P3ZU2zTD9tzx/91qX9lZ0OYuoZER1DBHTybhUNDU/+I=; b=Cxj/A7Dkt70BGv
	bzcoIU+2zapmKbYEVXR5na+ev/klx8G1p4HD7xo60PO+MFH9GMoPKItcIpgo9Ss6ySg7i1OLPJU1/
	TENH3l5Q6fY3U6w/soJSv8WzSSh3HuQcQETg2ct0U5nUuWFriDlk8i6ebpJ6xCxDCcdCa40gISjb9
	9C9ZPv/oOSgLdccgnzBfHWwSnGy+TNI4TrD6hWYC6lO1HMqN7YMuToINSCPeAqgGcgjjfCP5q7Ifp
	Yx8LYZDm5Vt4P+nEQiog9MsCMYT19lBxyWYcZ99TdMeAz34DKLJgmLBx8Kc5K6olvY9tUzr6LYSJA
	kzquxqJ0AYD/UAz+v6rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoqH-00000007Glx-3AIl;
	Tue, 11 Nov 2025 13:55:29 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIoqE-00000007Gkq-3P8d;
	Tue, 11 Nov 2025 13:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762869321; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=JYpEUEDdcRzYzdeW+638BcwXZNQIfYVkyqsW+6NhS0E=;
	b=EnjHqDFf6iFOOAZYXxZC9y1vxScZprs6e+7a6G3xZI3XZCtiNdy+PzdOxxu6CNb9/wtyDXJxEfM64EI1k1Hxf36ZRuLEO+gV9/TvbWCSAB7CkBiNLZwKYxmJvdQXf359e+9zEUv3eVbXBflq3NrLAEXe3z1BI+CvDbnQHEt+/mI=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WsBpap1_1762869317 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 11 Nov 2025 21:55:19 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Tue, 11 Nov 2025 21:55:06 +0800
Message-Id: <20251111135506.8526-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_055527_369633_286F5404 
X-CRM114-Status: UNSURE (   8.52  )
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

Fixes: b91f0e4cb8a3 ("RISC-V: KVM: Factor-out instruction emulation into separate sources")
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>

---
Changes in v2:
- Remove unnecessary modifications and add comments(suggested by Anup)
- Update Fixes tag
- Link to v1: https://lore.kernel.org/linux-riscv/20250912134332.22053-1-fangyu.yu@linux.alibaba.com/
---
 arch/riscv/kvm/vcpu_insn.c | 39 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index de1f96ea6225..a8d796ef2822 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -323,6 +323,19 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 							  ct->sepc,
 							  &utrap);
 			if (utrap.scause) {
+				/**
+				 * If a g-stage page fault occurs, the direct approach
+				 * is to let the g-stage page fault handler handle it
+				 * naturally, however, calling the g-stage page fault
+				 * handler here seems rather strange.
+				 * Considering this is an corner case, we can directly
+				 * return to the guest and re-execute the same PC, this
+				 * will trigger a g-stage page fault again and then the
+				 * regular g-stage page fault handler will populate
+				 * g-stage page table.
+				 */
+				if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
+					return 1;
 				utrap.sepc = ct->sepc;
 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 				return 1;
@@ -378,6 +391,19 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
 		if (utrap.scause) {
+			/**
+			 * If a g-stage page fault occurs, the direct approach
+			 * is to let the g-stage page fault handler handle it
+			 * naturally, however, calling the g-stage page fault
+			 * handler here seems rather strange.
+			 * Considering this is an corner case, we can directly
+			 * return to the guest and re-execute the same PC, this
+			 * will trigger a g-stage page fault again and then the
+			 * regular g-stage page fault handler will populate
+			 * g-stage page table.
+			 */
+			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
+				return 1;
 			/* Redirect trap if we failed to read instruction */
 			utrap.sepc = ct->sepc;
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
@@ -504,6 +530,19 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
 		if (utrap.scause) {
+			/**
+			 * If a g-stage page fault occurs, the direct approach
+			 * is to let the g-stage page fault handler handle it
+			 * naturally, however, calling the g-stage page fault
+			 * handler here seems rather strange.
+			 * Considering this is an corner case, we can directly
+			 * return to the guest and re-execute the same PC, this
+			 * will trigger a g-stage page fault again and then the
+			 * regular g-stage page fault handler will populate
+			 * g-stage page table.
+			 */
+			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
+				return 1;
 			/* Redirect trap if we failed to read instruction */
 			utrap.sepc = ct->sepc;
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
