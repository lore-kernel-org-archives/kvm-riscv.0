Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCF3CFC27C
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Nov 2025 13:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BKCXqjFKClFWN+0Y0InumdlpmsFb8zFCVV1+cmXcqnc=; b=oq68CCPLVlNE7g
	B1dky040kHF66Uc8X+jxY7xqn5k1sZUE3xHt7M+syrBdX2Zw36IiqZRYBcrPAt7hfo5beF1zBG8Gc
	HbHo08YBi2Noifr/x84O6ulssT+dErYbs5xRnamEiQW+GXi+ZnfPr/84fEoEUfe2JEoW/Du8IeH7E
	3EfUnHgSLyjzDi8S3Hat7Lqomk3OoCn89cNPuuru2QtBXiGbMzOdJzqozmjTbZxA1V2Dp7LkZn+lf
	XrV295dpnvfp3gAnAb/j2sJCRre2Ey4jupBF3DSCjeuu+m+JueZBZf2d3l6TxHetObIiDAwz1s0+2
	bqnsSH/G+o4KNU1u6qoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRJ5-00000008Q3W-1b1x;
	Fri, 21 Nov 2025 13:36:11 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMRJ0-00000008Q2S-1lT6;
	Fri, 21 Nov 2025 13:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763732158; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=0Y4Gl8l0oRGBSSOkUyUCKPutDiBDPCRdKNSD2TJIBMU=;
	b=NUtGdCBzWG2Qbzha1+Mq2lJvlFbN2BwwlAtTdX4zRla2hXVDnzHhTSBTlMhSWovCAiPAqc61HfSnIOLipSpS+xa0GkPwLXlPY1ReZ9OU0DHOWpineE72bLJvQ5UvMVhX5i9WQ+IbrK36TyPuunuWR2DBmx72lj0lTF+aM/EH8/4=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wt0CGTO_1763732155 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 21 Nov 2025 21:35:56 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Fri, 21 Nov 2025 21:35:43 +0800
Message-Id: <20251121133543.46822-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_053607_009628_70E4E592 
X-CRM114-Status: UNSURE (   9.94  )
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
Changes in v3:
- Add a helper function to avoid repeating the same paragraph(suggested by drew)
- Link to v2: https://lore.kernel.org/linux-riscv/20251111135506.8526-1-fangyu.yu@linux.alibaba.com/

Changes in v2:
- Remove unnecessary modifications and add comments(suggested by Anup)
- Update Fixes tag
- Link to v1: https://lore.kernel.org/linux-riscv/20250912134332.22053-1-fangyu.yu@linux.alibaba.com/
---
 arch/riscv/kvm/vcpu_insn.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index de1f96ea6225..4d89b94128ae 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -298,6 +298,22 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	return (rc <= 0) ? rc : 1;
 }
 
+static bool is_load_guest_page_fault(unsigned long scause)
+{
+	/**
+	 * If a g-stage page fault occurs, the direct approach
+	 * is to let the g-stage page fault handler handle it
+	 * naturally, however, calling the g-stage page fault
+	 * handler here seems rather strange.
+	 * Considering this is a corner case, we can directly
+	 * return to the guest and re-execute the same PC, this
+	 * will trigger a g-stage page fault again and then the
+	 * regular g-stage page fault handler will populate
+	 * g-stage page table.
+	 */
+	return (scause == EXC_LOAD_GUEST_PAGE_FAULT);
+}
+
 /**
  * kvm_riscv_vcpu_virtual_insn -- Handle virtual instruction trap
  *
@@ -323,6 +339,8 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 							  ct->sepc,
 							  &utrap);
 			if (utrap.scause) {
+				if (is_load_guest_page_fault(utrap.scause))
+					return 1;
 				utrap.sepc = ct->sepc;
 				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
 				return 1;
@@ -378,6 +396,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
 		if (utrap.scause) {
+			if (is_load_guest_page_fault(utrap.scause))
+				return 1;
 			/* Redirect trap if we failed to read instruction */
 			utrap.sepc = ct->sepc;
 			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
@@ -504,6 +524,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
 						  &utrap);
 		if (utrap.scause) {
+			if (is_load_guest_page_fault(utrap.scause))
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
