Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31AD606A328
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 11:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WeSHNBQ+;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=TaN2tZpP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:From:Subject:To:Date:
	Mime-Version:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Unsubscribe-Post:List-Owner;
	bh=olkBiVY5G509CYUfR/3huisjd8sRXZ4T/xA6/hiYLto=; b=WeSHNBQ+Ye4lQQrBEsm4z/pLky
	ic8inferGB4kTw4czcg+9TfuEWqGT6aHI8h9UqZ8Uw4MfXRZrQbfBgZpxTJc/hMcx4cogPmBQGUrt
	6Hgg9nS2y2jVxdhLy+dyhWNtjuCpykUqc+nzyp/m3LCF6i3dTIjE4l/dXe5gbqQf9Kz4lnisrm5Z8
	3B87uA7bNBIvxwAUFbwwOKLaxtJjkI/Px/kCoTf79AEP9Ia25FuKnsclJanTSEwdiEjdh73nZSslX
	LnNb1pX+xGnZKBhH89HYFqdiPTL2NkF9uCEMjyjQPPIlrrl+IMXWVvzg+ZVkS+TFx/+6nOGFoOTBr
	1xL4T/zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZZV-00000005EQs-36mu;
	Wed, 04 Nov 2026 11:54:29 +0000
Received: from va-2-58.ptr.blmpb.com ([209.127.231.58])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZZT-00000005EQ5-14tS
	for kvm-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 11:54:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793793261; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=+ZEA0oGZz6CMFDihVUR4dSmQNj+xSRWkZ7se790XjnI=;
 b=TaN2tZpPbIpr+iYd2h8BO8woW6Tc2HxufvaVIFUJXJkpAhUMAONuWS8/Zc27YXfH2l9Vnt
 F79xBWgzJ4k/e9TKqDh2XdU+Dx9ZY3X6kpy1CHhFhriDa9lH+YJo7ydHjooF6DAoRWdvoy
 nQcdH3FSQizCdt98xY0FHxmgGXY1PwXXHFiyuy7jKFJ/DlR1sk9ub5UxuP+c1arYupy1Vv
 e14hpKVUpJ8GSWzeNeZyLYHLHBcA9Hc0kebTotObyqUdhbF0AkR2hoJltDAUR7SMe6SgIv
 EShzQ8IBhhVKfu7Nqm/tvQYyTmKTM0ohYahK628MzJ3OvSR6lEbubuDhYAVIFA==
Cc: <atish.patra@linux.dev>, <pjw@kernel.org>, <palmer@dabbelt.com>, 
	<aou@eecs.berkeley.edu>, <geshijian@picoheart.com>, 
	<shenyang.young@picoheart.com>, <yang.yicong@picoheart.com>, 
	<qingwei.hu@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed,  4 Nov 2026 19:54:16 +0800
X-Lms-Return-Path: <lba+26aeb1ceb+c5b3b4+lists.infradead.org+yang.yicong@picoheart.com>
To: <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-riscv@lists.infradead.org>
Subject: [PATCH] RISC-V: KVM: Redirect misaligned MMIO fault to guest
Received: from G9WYR9K0VW.bytedance.net ([120.234.91.237]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 19:54:18 +0800
X-Mailer: git-send-email 2.54.0
From: "Yicong Yang" <yang.yicong@picoheart.com>
Message-Id: <20261104115416.64769-1-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_035427_518384_B9FCF23A 
X-CRM114-Status: GOOD (  11.58  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Currently a misaligned emulated MMIO access will cause
VM abort as the KVM simply return to the userspace
with -EIO. VMM doesn't (and cannot) handle this and
usually just abort the VM. No valid exit reason filled
in this case either.

Per riscv-priv spec, non-idempotent regions might not
support misaligned access. If it's not supported,
misaligned access should raise access-fault exception
rather than misaligned exceptions.

As we're not going to handle this, it's more proper
to inject a misaligned fault and leave the handling
to the guest.

Signed-off-by: Yicong Yang <yang.yicong@picoheart.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  4 +--
 arch/riscv/kvm/vcpu_exit.c             |  4 +--
 arch/riscv/kvm/vcpu_insn.c             | 41 +++++++++++++++++++++-----
 3 files changed, 37 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index a5c50dd4a884..cbb83743a1d3 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -38,10 +38,10 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 				struct kvm_cpu_trap *trap);
 
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     gpa_t fault_addr,
+			     struct kvm_cpu_trap *trap, gpa_t fault_addr,
 			     unsigned long htinst);
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      gpa_t fault_addr,
+			      struct kvm_cpu_trap *trap, gpa_t fault_addr,
 			      unsigned long htinst);
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run);
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index abe0dab60ca5..cbf3530e73d8 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -84,11 +84,11 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
 		switch (trap->scause) {
 		case EXC_LOAD_GUEST_PAGE_FAULT:
-			return kvm_riscv_vcpu_mmio_load(vcpu, run,
+			return kvm_riscv_vcpu_mmio_load(vcpu, run, trap,
 							fault_addr,
 							trap->htinst);
 		case EXC_STORE_GUEST_PAGE_FAULT:
-			return kvm_riscv_vcpu_mmio_store(vcpu, run,
+			return kvm_riscv_vcpu_mmio_store(vcpu, run, trap,
 							 fault_addr,
 							 trap->htinst);
 		case EXC_INST_GUEST_PAGE_FAULT: {
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 2a8dc2b88ba8..0aac89e9638d 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -359,11 +359,37 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 }
 
+/*
+ * Per riscv-priv spec, non-idempotent regions might not support misaligned
+ * access. If it's not supported, misaligned access should raise access-fault
+ * exception rather than misaligned exceptions.
+ *
+ * Check for misaligned MMIO access. Inject an access fault if it's misalgined.
+ */
+static bool kvm_riscv_check_misaligned_mmio(struct kvm_vcpu *vcpu,
+					    struct kvm_cpu_trap *trap,
+					    bool write, gpa_t fault_addr, int len)
+{
+	struct kvm_cpu_trap misalign_trap = { 0 };
+
+	if (fault_addr & (len - 1)) {
+		misalign_trap.scause = write ? EXC_STORE_ACCESS : EXC_LOAD_ACCESS;
+		misalign_trap.stval = trap->stval;
+		misalign_trap.sepc = trap->sepc;
+
+		kvm_riscv_vcpu_trap_redirect(vcpu, &misalign_trap);
+		return true;
+	}
+
+	return false;
+}
+
 /**
  * kvm_riscv_vcpu_mmio_load -- Emulate MMIO load instruction
  *
  * @vcpu: The VCPU pointer
  * @run:  The VCPU run struct containing the mmio data
+ * @trap: The VCPU trap context of this fault
  * @fault_addr: Guest physical address to load
  * @htinst: Transformed encoding of the load instruction
  *
@@ -372,7 +398,7 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			     gpa_t fault_addr,
+			     struct kvm_cpu_trap *trap, gpa_t fault_addr,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
@@ -451,9 +477,8 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return -EOPNOTSUPP;
 	}
 
-	/* Fault address should be aligned to length of MMIO */
-	if (fault_addr & (len - 1))
-		return -EIO;
+	if (kvm_riscv_check_misaligned_mmio(vcpu, trap, false, fault_addr, len))
+		return 1;
 
 	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
 			       false, len);
@@ -491,6 +516,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
  *
  * @vcpu: The VCPU pointer
  * @run:  The VCPU run struct containing the mmio data
+ * @trap: The VCPU trap context of this fault
  * @fault_addr: Guest physical address to store
  * @htinst: Transformed encoding of the store instruction
  *
@@ -499,7 +525,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
  * Returns < 0 to report failure and exit run-loop
  */
 int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
-			      gpa_t fault_addr,
+			      struct kvm_cpu_trap *trap, gpa_t fault_addr,
 			      unsigned long htinst)
 {
 	u8 data8;
@@ -572,9 +598,8 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return -EOPNOTSUPP;
 	}
 
-	/* Fault address should be aligned to length of MMIO */
-	if (fault_addr & (len - 1))
-		return -EIO;
+	if (kvm_riscv_check_misaligned_mmio(vcpu, trap, true, fault_addr, len))
+		return 1;
 
 	trace_kvm_mmio_emulate(vcpu->vcpu_id, ct->sepc, raw_insn, fault_addr,
 			       true, len);
-- 
2.54.0 (Apple Git-157)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
