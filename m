Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310E1606A321
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifopWMqj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NlZv7hMUppo02GQ/JWU3kEl84FVoGYXiNmy7DZOFPIE=; b=ifopWMqjA57L5CJ08+dut4m1bC
	Rltk5oJkcrgErVTcJHbXn4kofltcgWqSQeUZ+xITwXhuuI3W+jQqH3OdIW/SF54vz/va/8y9thRMI
	nIAhMcqXBD30dTDG3gpulIFzfWn9vhSZIaC3ThVFjaHOal/4fEiaxxF0UOwCytVAiA/S8Of6hLT1/
	0r5W/wdLCvH77D3deR8DtWrcHh0K1gDNO8DJXR7zmamGif+3/VmWGuPWnzsozJ/IJGXfyBsJO2kCt
	fyl7ODd1Rnghttqy1GC8S+qSJrjM+dbT4OYA1IS7FjUNcVq0/EgdKt6twdG6jxNK4q8ZM/f0IxPU/
	fHdp3a4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23l-00000008CpP-3wAf;
	Wed, 25 Nov 2026 01:44:33 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23j-00000008CnS-3IzC
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:33 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowADXqZp8PQZr0tm8AQ--.25273S2;
	Wed, 25 Nov 2026 09:44:28 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 7/9] riscv: Initialize ISA extensions for all harts at CPU setup
Date: Wed, 25 Nov 2026 09:44:07 +0800
Message-ID: <20261125014409.79852-8-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADXqZp8PQZr0tm8AQ--.25273S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw45ZFyfKrWUtr15ArWfGrg_yoW8AFyfpF
	yDC3W5KrZ8WFs7J3s7trnYk34fK3W7Ca1xtFW8A34Fva1UJws8JrWDG3s09F17JFW8Xa1a
	93ykGry5AF45ZF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvG14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxV
	WxJr0_GcWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
	Yx0E2Ix0cI8IcVAFwI0_JF0_Jw1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
	WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc7CjxVAaw2AF
	wI0_JF0_Jw1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUeQ6pDUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_174432_230989_5CB004AC 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -4.2 (----)
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

Move isa_init() from thread_info_init() into cpu_set_fdt() and
cpu_set_acpi().

thread_info_init() only promotes sscratch to the current hart's
thread_info. cpu_has_extension() reads cpus[].isa from the boot
hart, including for secondaries that have not started yet, so ISA
parsing has to happen while enumerating CPUs.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/processor.c | 1 -
 lib/riscv/setup.c     | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/lib/riscv/processor.c b/lib/riscv/processor.c
index b055acc9..ddecc25e 100644
--- a/lib/riscv/processor.c
+++ b/lib/riscv/processor.c
@@ -81,7 +81,6 @@ void thread_info_init(void)
 	unsigned long hartid = csr_read(CSR_SSCRATCH);
 	int cpu = hartid_to_cpu(hartid);
 
-	isa_init(&cpus[cpu]);
 	csr_write(CSR_SSCRATCH, &cpus[cpu]);
 }
 
diff --git a/lib/riscv/setup.c b/lib/riscv/setup.c
index f1121573..547851f5 100644
--- a/lib/riscv/setup.c
+++ b/lib/riscv/setup.c
@@ -16,6 +16,7 @@
 #include <on-cpus.h>
 #include <vmalloc.h>
 #include <asm/csr.h>
+#include <asm/isa.h>
 #include <asm/mmu.h>
 #include <asm/page.h>
 #include <asm/processor.h>
@@ -61,6 +62,7 @@ static int cpu_set_acpi(struct acpi_subtable_header *header)
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = intc->hart_id;
 	cpus[cpu].uid = intc->uid;
+	isa_init(&cpus[cpu]);
 
 	if (intc->flags & ACPI_MADT_ENABLED) {
 		if (!sbi_hart_get_status(cpus[cpu].hartid).error)
@@ -79,6 +81,7 @@ static void cpu_set_fdt(int fdtnode __unused, u64 regval, void *info __unused)
 
 	cpus[cpu].cpu = cpu;
 	cpus[cpu].hartid = regval;
+	isa_init(&cpus[cpu]);
 
 	if (!sbi_hart_get_status(cpus[cpu].hartid).error)
 		set_cpu_present(cpu, true);
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
