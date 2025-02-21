Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28366C021B3
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Feb 2025 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HtAyD23aRnlaCFox5E6Y9kokuY+JlLy3O3SvUUbVA/8=; b=1rvE7hrxOxBX/v
	PSsMxPW3C8/NxLHFDOfnKn0kNhtoJbjpN5n0I9khVij1GmSapRaUgQZnWufWaqMdRRkZ9/DcYflgQ
	bCSvj+6sv+Ks/1eV4tN3grP/4RtftMmzSc6FbitiC+XsstWn2tWpalf/CdeJc2NJXjCL6GoVBLCv7
	8axhzsCXUzoqxgRAY4TaN/X/Ag0LhHZT5Uh+B1p/1LjZSBhIuoPPfjqLpQzRPAyHMvrP5YAY433Nk
	h44yM2s8D+ewRYSWvQCMZTORbtV4R1rHEaY6/1gRUz8o2ohW4bC/p/YYOrJOK6/+wFDh7+oiWp8iy
	ZiMlKaU+JOpatrlX8d3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNV-000000063bX-3mdE;
	Fri, 21 Feb 2025 15:55:49 +0000
Received: from out-174.mta1.migadu.com ([2001:41d0:203:375::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlVNT-000000063Yh-0fro
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Feb 2025 15:55:48 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1740153345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6HUVv9piKZ+auWo8hpaKV2KpKwb1G2AmozQfXaQ1PI=;
	b=mX6T+ZpuuXR4gC34LNUan+7SDDqyxB34QExfkigbvILLkiOZydewiuEwD7gbSgAIVMe+aM
	ZwjQiaGrcI8QuOiWrV8PNKkWUljci4itLfUSw90OAIUwk0ldHUMVYNsvST4rrZ9z+/ypMY
	ITmU7sQtbp95gDtAf3KhKBWQiyROJRM=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com,
	cleger@rivosinc.com,
	jamestiotio@gmail.com
Subject: [kvm-unit-tests PATCH 02/10] riscv: sbi: Ensure we have IPIs enabled for HSM suspend tests
Date: Fri, 21 Feb 2025 16:55:36 +0100
Message-ID: <20250221155533.123418-14-andrew.jones@linux.dev>
In-Reply-To: <20250221155533.123418-12-andrew.jones@linux.dev>
References: <20250221155533.123418-12-andrew.jones@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_075547_482887_0487D57F 
X-CRM114-Status: GOOD (  10.49  )
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

We'll start cleaning up after each test, so the HSM tests need to
ensure they have IPIs setup themselves since they plan to use them.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
 riscv/sbi.c | 62 ++++++++++++++++++++++++++++++++---------------------
 1 file changed, 37 insertions(+), 25 deletions(-)

diff --git a/riscv/sbi.c b/riscv/sbi.c
index 7c7a2d2ddddb..d7bf758e23fb 100644
--- a/riscv/sbi.c
+++ b/riscv/sbi.c
@@ -62,7 +62,7 @@ static struct sbiret sbi_dbcn_write_byte(uint8_t byte)
 	return sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE_BYTE, byte, 0, 0, 0, 0, 0);
 }
 
-static struct sbiret sbi_hart_suspend(uint32_t suspend_type, unsigned long resume_addr, unsigned long opaque)
+static struct sbiret sbi_hart_suspend_raw(unsigned long suspend_type, unsigned long resume_addr, unsigned long opaque)
 {
 	return sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, resume_addr, opaque, 0, 0, 0);
 }
@@ -568,59 +568,71 @@ static void hart_start_invalid_hartid(void *data)
 		sbi_hsm_invalid_hartid_check = true;
 }
 
-static void hart_retentive_suspend(void *data)
+static void ipi_nop(struct pt_regs *regs)
+{
+	ipi_ack();
+}
+
+static void hart_suspend_and_wait_ipi(unsigned long suspend_type, unsigned long resume_addr,
+				      unsigned long opaque, bool returns, const char *typestr)
 {
 	unsigned long hartid = current_thread_info()->hartid;
-	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_RETENTIVE, 0, 0);
+	struct sbiret ret;
 
+	install_irq_handler(IRQ_S_SOFT, ipi_nop);
+	local_ipi_enable();
+	local_irq_enable();
+
+	ret = sbi_hart_suspend_raw(suspend_type, resume_addr, opaque);
 	if (ret.error)
-		report_fail("failed to retentive suspend cpu%d (hartid = %lx) (error=%ld)",
-			    smp_processor_id(), hartid, ret.error);
+		report_fail("failed to %s cpu%d (hartid = %lx) (error=%ld)",
+			    typestr, smp_processor_id(), hartid, ret.error);
+	else if (!returns)
+		report_fail("failed to %s cpu%d (hartid = %lx) (call should not return)",
+			    typestr, smp_processor_id(), hartid);
+
+	local_irq_disable();
+	local_ipi_disable();
+	install_irq_handler(IRQ_S_SOFT, NULL);
+}
+
+static void hart_retentive_suspend(void *data)
+{
+	hart_suspend_and_wait_ipi(SBI_EXT_HSM_HART_SUSPEND_RETENTIVE, 0, 0, true, "retentive suspend");
 }
 
 static void hart_non_retentive_suspend(void *data)
 {
-	unsigned long hartid = current_thread_info()->hartid;
 	unsigned long params[] = {
 		[SBI_HSM_MAGIC_IDX] = SBI_HSM_MAGIC,
-		[SBI_HSM_HARTID_IDX] = hartid,
+		[SBI_HSM_HARTID_IDX] = current_thread_info()->hartid,
 	};
-	struct sbiret ret = sbi_hart_suspend(SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE,
-					     virt_to_phys(&sbi_hsm_check_non_retentive_suspend),
-					     virt_to_phys(params));
 
-	report_fail("failed to non-retentive suspend cpu%d (hartid = %lx) (error=%ld)",
-		    smp_processor_id(), hartid, ret.error);
+	hart_suspend_and_wait_ipi(SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE,
+				  virt_to_phys(&sbi_hsm_check_non_retentive_suspend), virt_to_phys(params),
+				  false, "non-retentive suspend");
 }
 
 /* This test function is only being run on RV64 to verify that upper bits of suspend_type are ignored */
 static void hart_retentive_suspend_with_msb_set(void *data)
 {
-	unsigned long hartid = current_thread_info()->hartid;
 	unsigned long suspend_type = SBI_EXT_HSM_HART_SUSPEND_RETENTIVE | (_AC(1, UL) << (__riscv_xlen - 1));
-	struct sbiret ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type, 0, 0, 0, 0, 0);
 
-	if (ret.error)
-		report_fail("failed to retentive suspend cpu%d (hartid = %lx) with MSB set (error=%ld)",
-			    smp_processor_id(), hartid, ret.error);
+	hart_suspend_and_wait_ipi(suspend_type, 0, 0, true, "retentive suspend with MSB set");
 }
 
 /* This test function is only being run on RV64 to verify that upper bits of suspend_type are ignored */
 static void hart_non_retentive_suspend_with_msb_set(void *data)
 {
-	unsigned long hartid = current_thread_info()->hartid;
 	unsigned long suspend_type = SBI_EXT_HSM_HART_SUSPEND_NON_RETENTIVE | (_AC(1, UL) << (__riscv_xlen - 1));
 	unsigned long params[] = {
 		[SBI_HSM_MAGIC_IDX] = SBI_HSM_MAGIC,
-		[SBI_HSM_HARTID_IDX] = hartid,
+		[SBI_HSM_HARTID_IDX] = current_thread_info()->hartid,
 	};
 
-	struct sbiret ret = sbi_ecall(SBI_EXT_HSM, SBI_EXT_HSM_HART_SUSPEND, suspend_type,
-				      virt_to_phys(&sbi_hsm_check_non_retentive_suspend), virt_to_phys(params),
-				      0, 0, 0);
-
-	report_fail("failed to non-retentive suspend cpu%d (hartid = %lx) with MSB set (error=%ld)",
-		    smp_processor_id(), hartid, ret.error);
+	hart_suspend_and_wait_ipi(suspend_type,
+				  virt_to_phys(&sbi_hsm_check_non_retentive_suspend), virt_to_phys(params),
+				  false, "non-retentive suspend with MSB set");
 }
 
 static bool hart_wait_on_status(unsigned long hartid, enum sbi_ext_hsm_sid status, unsigned long duration)
-- 
2.48.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
