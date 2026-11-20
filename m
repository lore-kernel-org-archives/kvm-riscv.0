Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E491606A320
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 14:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b9C6tFNO;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LDAwGEu7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=EN+iP93D0fPIhTeWmzOfz3Efv23/QXnrbyhIT3ggfpc=; b=b9C6tFNOYi9aPb4VJYvf/K1F+Q
	XZeT+4+HGgNrMrPFQmm3CQGqk7TG2Fw9OPWcDJS+78SRJ8SSLneuwbS0wanLKFHRHXMO8/zz5RPp1
	zu62kbTfhtpeANWcdSLSmJ2Ze/KQy28TPT8e8C/ij7zolkM8IRcVoUJS6lrt06oBBTQr8M/2zfjXP
	MztzDniGm6NjVL41d9GGSGAhPJuPer3xD0Jy/6GcqSmfsl55GUW5LCH8iGcAcXzi0KWjazU2+E0Dg
	2ORZZQNPx4x0SNPhXYAB9gWswM4F1CMDxCnUZcstBzAcmAQov/pISA1TorpYe5mUHn1oO2oLdma5l
	KmzRWswQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPnW-0000000FHeE-2AAx;
	Fri, 20 Nov 2026 14:41:06 +0000
Received: from out-219.mta0.migadu.com ([2001:41d0:1004:224b::db] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUPnT-0000000FHde-1vSJ
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 14:41:05 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZfbAak/LEKwx9teNZREGfelV5evSdqUIhKLApfjnLAc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795185661; v=1; x=1795790461;
 b=LDAwGEu7ycqxpihHAL7E/BU6jYlJx2TpJI0GzxRZ++xQXJ/Xi+71E+/4Wzu+CF8btJkXI+Ll
 qgpM2/uxezdmwhdlDZkgJ0dAxRvQQ0IyUYzSUnitT5VxFfXH019GriCSFTuZT40hCHXwo+8DNQ6
 mvxEH+GsmwRKPKNANQLCmIDU=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id e535b2ceba9002a2;
	Fri, 20 Nov 2026 14:41:01 +0000
X-Mizu-Trace-ID: e535b2ceba9002a2
X-Migadu-Flow: FLOW_OUT
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Subject: [kvm-unit-tests PATCH] riscv: Report exceptions taken before thread_info_init()
Date: Fri, 20 Nov 2026 15:40:29 +0100
Message-ID: <20261120144029.1430386-1-andrew.jones@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_064103_711570_A1587A37 
X-CRM114-Status: GOOD (  11.18  )
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

Until thread_info_init() runs on a hart, sscratch holds the hartid
rather than a pointer to the hart's thread_info. An exception taken
before then makes do_handle_exception() use the hartid as a pointer,
which faults again, so the hart loops taking exceptions forever
without printing anything. Only use sscratch as a thread_info pointer
when it points into cpus[]. Otherwise, report the exception and abort.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 lib/riscv/processor.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index b055acc94e41..aa1ac417f1e9 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -12,6 +12,17 @@
 
 extern unsigned long ImageBase;
 
+/*
+ * sscratch holds the hartid until thread_info_init() replaces it with
+ * a pointer to the hart's thread_info.
+ */
+static bool thread_info_valid(struct thread_info *info)
+{
+	uintptr_t p = (uintptr_t)info;
+
+	return p >= (uintptr_t)&cpus[0] && p < (uintptr_t)&cpus[NR_CPUS];
+}
+
 void show_regs(struct pt_regs *regs)
 {
 	struct thread_info *info = current_thread_info();
@@ -19,7 +30,10 @@ void show_regs(struct pt_regs *regs)
 	unsigned int w = __riscv_xlen / 4;
 
 	printf("Load address: %" PRIxPTR "\n", loadaddr);
-	printf("CPU%3d : hartid=%lx\n", info->cpu, info->hartid);
+	if (thread_info_valid(info))
+		printf("CPU%3d : hartid=%lx\n", info->cpu, info->hartid);
+	else
+		printf("CPU  ? : hartid=%lx\n", (unsigned long)info);
 	printf("status : %.*lx\n", w, regs->status);
 	printf("cause  : %.*lx\n", w, regs->cause);
 	printf("badaddr: %.*lx\n", w, regs->badaddr);
@@ -38,7 +52,9 @@ void do_handle_exception(struct pt_regs *regs)
 {
 	struct thread_info *info = current_thread_info();
 
-	if (regs->cause & CAUSE_IRQ_FLAG) {
+	if (!thread_info_valid(info)) {
+		printf("Exception before thread_info_init()\n");
+	} else if (regs->cause & CAUSE_IRQ_FLAG) {
 		unsigned long irq_cause = regs->cause & ~CAUSE_IRQ_FLAG;
 
 		assert(irq_cause < INTERRUPT_CAUSE_MAX);
-- 
2.56.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
