Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0803B606A31B
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Mtp5AJiB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7jPGc6P5j8zDsxItWoc9Q3yGIo44QfDWhfu22JCrB0M=; b=Mtp5AJiBbtZkmv4S/5vhfkJpQP
	h/1E3B/lW1EShin6dWmnQJVZXmLMzaOJA1JoToy/SSeVGeezRXWwzsXagyawnK29EHh1u7Q+iQeV7
	niaoJqFc0YQNyaRAUfWgJuR0Dai191as3l/OaXOc7DW7y1rstOjf7MUGsxTi0Hsmm/ZE/PuP+AsmP
	pf6TjB/J9lFVHeeQlMpJMlk7xidvY0IwAIGn9VBAIqK2xRtXl4MUXm1QFYtyAHu443Y/Lli1PmI3/
	KPlSK5E23drrddn09ygfMuS8DYnRJF2IHKqLvmzlhq4/Do5WWheKyw8YDMeh69px/6jVt4gnNLuMy
	/IC2Mt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiO-000000088eY-3Dh4;
	Thu, 05 Nov 2026 08:20:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsiF-000000088WE-07Bf
	for kvm-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:20:55 +0000
Received: from localhost (unknown [122.194.100.204])
	by APP-01 (Coremail) with SMTP id qwCowAD3I_5ZPOxq3idRAA--.3647S2;
	Thu, 05 Nov 2026 16:20:41 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 5/8] riscv: Prefer SBI DBCN console with UART fallback
Date: Thu,  5 Nov 2026 16:20:32 +0800
Message-ID: <20261105082035.133680-6-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: qwCowAD3I_5ZPOxq3idRAA--.3647S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAw48JFW7tr1rZryxXF1kXwb_yoW5Ar1UpF
	sxKFZIyr1rJFs5Xa97Jr1kuws8K3Z7u345Kr48Jw1Sv3yDX3yDZws5ta4av3sxWry7JF45
	AFsagr93CF4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvv14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	AVWUtwCY02Avz4vE14v_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73Uj
	IFyTuYvjfU8a9aDUUUU
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002049_366312_1F610ADE 
X-CRM114-Status: GOOD (  11.18  )
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

CONFIG_SBI_CONSOLE already routes output through SBI DBCN, but console
setup still always went through the UART init path. uart0_init_fdt()
could skip a missing UART while uart0_init_acpi() aborted, so EFI/ACPI
guests without a described MMIO UART could not print.

Probe SBI_EXT_DBCN first. When it is available, use
SBI_EXT_DBCN_CONSOLE_WRITE and skip UART setup. Otherwise fall back to
the existing FDT or ACPI UART path. This keeps a UART fallback (as
required by the server platform spec on ACPI systems) while allowing
pure SBI-console environments to boot without an MMIO UART.

Rename the lock from uart_lock to console_lock since it now protects
both console backends.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/io.c | 41 ++++++++++++++++++++++++-----------------
 1 file changed, 24 insertions(+), 17 deletions(-)

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index b1163404..af38a540 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -28,7 +28,10 @@
 static volatile u8 *uart0_base = UART_EARLY_BASE;
 static u32 uart0_reg_width = 1;
 static u32 uart0_reg_shift;
-static struct spinlock uart_lock;
+static struct spinlock console_lock;
+#ifdef CONFIG_SBI_CONSOLE
+static bool has_dbcn;
+#endif
 
 static u32 uart0_read(u32 num)
 {
@@ -71,16 +74,11 @@ static void uart0_init_fdt(void)
 				break;
 		}
 
-#ifdef CONFIG_SBI_CONSOLE
-		uart0_base = NULL;
-		return;
-#else
 		if (ret) {
 			printf("%s: Compatible uart not found in the device tree, aborting...\n",
 			       __func__);
 			abort();
 		}
-#endif
 	} else {
 		const fdt32_t *val;
 		int len;
@@ -107,6 +105,12 @@ static void uart0_init_acpi(void)
 
 void io_init(void)
 {
+#ifdef CONFIG_SBI_CONSOLE
+	if (sbi_probe(SBI_EXT_DBCN)) {
+		has_dbcn = true;
+		return;
+	}
+#endif
 	if (dt_available())
 		uart0_init_fdt();
 	else
@@ -119,38 +123,41 @@ void io_init(void)
 	}
 }
 
-void sbi_puts(const char *s);
-void sbi_puts(const char *s)
+#ifdef CONFIG_SBI_CONSOLE
+static void sbi_puts(const char *s)
 {
 	phys_addr_t addr = virt_to_phys((void *)s);
 	unsigned long hi = upper_32_bits(addr);
 	unsigned long lo = lower_32_bits(addr);
 
-	spin_lock(&uart_lock);
+	spin_lock(&console_lock);
 	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE, strlen(s), lo, hi, 0, 0, 0);
-	spin_unlock(&uart_lock);
+	spin_unlock(&console_lock);
 }
+#endif
 
-void uart0_puts(const char *s);
-void uart0_puts(const char *s)
+static void uart0_puts(const char *s)
 {
 	assert(uart0_base);
-	spin_lock(&uart_lock);
+	spin_lock(&console_lock);
 	while (*s) {
 		while (!(uart0_read(UART_LSR_OFFSET) & UART_LSR_THRE))
 			;
 		uart0_write(0, *s++);
 	}
-	spin_unlock(&uart_lock);
+	spin_unlock(&console_lock);
 }
 
 void puts(const char *s)
 {
 #ifdef CONFIG_SBI_CONSOLE
-	sbi_puts(s);
-#else
-	uart0_puts(s);
+	if (has_dbcn) {
+		sbi_puts(s);
+		return;
+	}
 #endif
+
+	uart0_puts(s);
 }
 
 /*
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
