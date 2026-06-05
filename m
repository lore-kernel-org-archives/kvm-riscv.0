Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B2CD6E6B
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wpu5bX9l2MR6yMZ4QdTDtqbXhhxKQ7qGTypPTF/JiiU=; b=2UcUZAO6OpYpMM
	jX3e5VuMn36DH6s/x+kXSf+IT5zj/thq7bMkfRpwkQ13a5iGHC79CjiIhfl2g+YMHNUNl7X2xhrxU
	s1Rp5iDY1EvHxwepkeOCcXPGVMysGPN0fwkcErNnVEcGkN/MJjSUS0hM7gpGgKtiY6SK3LfJ3nAZ0
	piL88t8nJRL6qGIgFQ87F3D/boKNXdpm+egtW+Kt9FR2omPaC41CAvJ5KXyCG0NEWZtcoqDAT/g/Q
	P1dsNIQHclAmfUgenJ7FFSkPptyc6bTFcWASTvF85o7WpbF61fwQ3FlBClxCGW6xEPGkt981lO6yq
	psquR4xZNZhL0AVrdx9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPWK-00000000HUX-35As;
	Fri, 05 Jun 2026 08:03:12 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPWI-00000000HTx-34fX;
	Fri, 05 Jun 2026 08:03:12 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gWv7c3N4bz5B135;
	Fri, 05 Jun 2026 16:03:08 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 655830bJ035909;
	Fri, 5 Jun 2026 16:03:00 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Fri, 5 Jun 2026 16:03:02 +0800 (CST)
X-Zmail-TransId: 2b086a2282b6558-07ac4
X-Mailer: Zmail v1.0
Message-ID: <20260605160302493P3Y6frbLrzPhv4K8MjiX4@zte.com.cn>
In-Reply-To: <20260605160019772GJy5SDmWQQF7sSqvJ0JtC@zte.com.cn>
References: 20260605160019772GJy5SDmWQQF7sSqvJ0JtC@zte.com.cn
Date: Fri, 5 Jun 2026 16:03:02 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIDIvM10gUklTQy1WOiBLVk06IGFkZCB0cmFjZXBvaW50IGZvciBndWVzdCBwYWdlIGZhdWx0c8KgwqA=?=
X-MAIL: mse-fl1.zte.com.cn 655830bJ035909
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 05 Jun 2026 16:03:08 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A2282BC.000/4gWv7c3N4bz5B135
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_010310_932202_42E8D524 
X-CRM114-Status: UNSURE (   7.32  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

Add the kvm_page_fault event tracepoint to count the number of KVM
guest page faults.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/trace.h     | 25 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 3d54175d805c..9056cc9883cf 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -56,6 +56,31 @@ TRACE_EVENT(kvm_exit,
 		__entry->htinst)
 );

+/*
+ * Tracepoint for page fault.
+ */
+TRACE_EVENT(kvm_page_fault,
+	TP_PROTO(struct kvm_vcpu *vcpu, u64 fault_address, u64 error_code),
+	TP_ARGS(vcpu, fault_address, error_code),
+
+	TP_STRUCT__entry(
+		__field(unsigned int,   vcpu_id)
+		__field(u64,            fault_address)
+		__field(u64,            error_code)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id        = vcpu->vcpu_id;
+		__entry->fault_address  = fault_address;
+		__entry->error_code     = error_code;
+	),
+
+	TP_printk("vcpu %u address 0x%016llx error_code 0x%llx",
+		__entry->vcpu_id,
+		__entry->fault_address,
+		__entry->error_code)
+);
+
 #endif /* _TRACE_RSICV_KVM_H */

 #undef TRACE_INCLUDE_PATH
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..57a21a246aa8 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -11,6 +11,7 @@
 #include <asm/insn-def.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
+#include "trace.h"

 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -27,6 +28,8 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	memslot = gfn_to_memslot(vcpu->kvm, gfn);
 	hva = gfn_to_hva_memslot_prot(memslot, gfn, &writable);

+	trace_kvm_page_fault(vcpu, fault_addr, trap->scause);
+
 	if (kvm_is_error_hva(hva) ||
 	    (trap->scause == EXC_STORE_GUEST_PAGE_FAULT && !writable)) {
 		switch (trap->scause) {
-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
