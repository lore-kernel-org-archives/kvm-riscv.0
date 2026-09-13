Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8996FC88E5C
	for <kvm-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 07:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BBv4Earhxdu9gteUPxADA96iSh44ZopBgT4lpQWscK4=; b=mIijq6q6rsesY9
	c4YCJC16xKvDKefPZB3chmepTSa1Fn875VAzyGHiugouA2zZMOQtw7Bq55MBTeKxCMRKq3+zUSjx3
	L03TF0F1bg7KM341YjSLo320pVCy8Cf+4rfUTMvviQVzwYiFe68emFs1nuIMzXwjszSBlnkqQdT30
	8YmPO3vtlrg69M4SMV7Six4y3G8l8aklm4Gqn0pk++Le+DYDC8/gTLqEzYgUfF0NrihEUKd9RvtTs
	2MybeYk8K2u8QIlIlula1QP+qiBZU6unT8z51xml+N5ab5Tv6PPgvRY8fK/hTL7nfUBUh/pyGn70B
	g5U/C7XUv7cLvQisuknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNK-00000001Tij-0vvP;
	Sun, 13 Sep 2026 07:11:42 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNH-00000001Tgm-0bxq;
	Sun, 13 Sep 2026 07:11:40 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hjKFs0Bflz52SFy;
	Sun, 13 Sep 2026 15:11:29 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 68D7BOvK093569;
	Sun, 13 Sep 2026 15:11:24 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Sun, 13 Sep 2026 15:11:26 +0800
X-Zmail-TransId: 3e816aa64c9e01c-64944
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v4 1/2] RISC-V: KVM: add tracepoint for guest page faults
Date: Sun, 13 Sep 2026 15:03:45 +0800
Message-ID: <20260913070352.3626956-2-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20260913070352.3626956-1-wang.yechao255@zte.com.cn>
References: <20260913070352.3626956-1-wang.yechao255@zte.com.cn>
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 68D7BOvK093569
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sun, 13 Sep 2026 15:11:29 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA64CA1.000/4hjKFs0Bflz52SFy
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_001139_368376_E020AA20 
X-CRM114-Status: UNSURE (   7.27  )
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

Add the kvm_page_fault event tracepoint to count the number of KVM
guest page faults.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/trace.h     | 22 ++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c |  2 ++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 23a5fd1b686e5..07fcf5b6059b6 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -133,6 +133,28 @@ TRACE_EVENT(kvm_vcpu_irq,
 		  __entry->vcpu_id, __entry->irq, __entry->level)
 );
 
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
 #endif /* _TRACE_KVM_H */
 
 #undef TRACE_INCLUDE_PATH
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 88e0c369b3544..8f44e27563f85 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -64,6 +64,8 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		};
 	}
 
+	trace_kvm_page_fault(vcpu, fault_addr, trap->scause);
+
 	ret = kvm_riscv_mmu_map(vcpu, memslot, fault_addr, hva,
 				(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false,
 				&host_map);
-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
