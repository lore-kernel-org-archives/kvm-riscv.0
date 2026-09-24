Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3E49C98310
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 03:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fe7OOzeMViSuu/xJA7qdD44aujNEQXN8QtJ1z7HXVmc=; b=PM81gAvW/t6eHO
	7UfLmHTM8iISh8GCRi3aQzXXyNeWQHlWXCrGXZKTfioKrYRbVH4NsCijMkwXJZXSgEonV1EycV2ZI
	CPBuTn7ViSXjCGIWjggLsCEzM7hH1OFTq6w7eNo7F4Bd5XluRwhetXsWKTomd4icRtWSdPhv6EV32
	uQB2bESR5/crD5h//MdFYBCqR0XE+iuK7u+fHJ3S/RpWWkIw1f3c85BjRsnOzUgYbGcdmUtpsnHxi
	JBVxob3qC6wHtMctOIdCaVr9zrVbpAKSVWTgpEeeWaggv4FMRbVNKXDYd9wx1Iqi5VBbeVQFu4dSA
	3CpRmlyYr9eFCUgdwRfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJR-00000009xVg-1WLV;
	Thu, 24 Sep 2026 03:39:57 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9aJO-00000009xUg-1qpp
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 03:39:55 +0000
Received: from localhost (unknown [122.194.100.201])
	by APP-01 (Coremail) with SMTP id qwCowADHnvKIm7RqE0_JCA--.1133S2;
	Thu, 24 Sep 2026 11:39:52 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	pbonzini@redhat.com,
	thuth@redhat.com,
	Xiang W <wangxiang@iscas.ac.cn>
Subject: [kvm-unit-tests PATCH 5/7] riscv: Decouple SBI console from UART init
Date: Thu, 24 Sep 2026 11:39:43 +0800
Message-ID: <20260924033945.176581-6-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
References: <20260924033945.176581-1-wangxiang@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHnvKIm7RqE0_JCA--.1133S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXF45uFy8Kr1DuFW3AFyxKrg_yoW5Xw4fpF
	sxKFZxtryrJr4fu3Wxtw1kuwn8KFn7Cr4Sgr17Aw1FyayDXayDXws5KayIv34DWFyxZFWU
	AFWSqF93JF48uaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVWUJVW8JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r
	xl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r126r1DMxkIecxEwVAFwVW8GwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUFksgUUUUU=
X-Originating-IP: [122.194.100.201]
X-CM-SenderInfo: pzdqw5pldqwq5lvft2wodfhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_203954_843347_D046547B 
X-CRM114-Status: GOOD (  12.32  )
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

CONFIG_SBI_CONSOLE already routes puts() through SBI DBCN, but console
setup still went through the UART init path. uart0_init_fdt() could skip
a missing UART, while uart0_init_acpi() aborted, so EFI/ACPI guests
with no described UART could not print.

Split the SBI console out of the UART driver. When CONFIG_SBI_CONSOLE is
set, io_init() is a no-op and puts() issues SBI_EXT_DBCN_CONSOLE_WRITE
directly. The UART probe and MMIO path are compiled only when SBI
console is disabled, so ACPI and DT boots no longer depend on an MMIO
UART for output.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/io.c | 50 +++++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 29 deletions(-)

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index b1163404..6656cd32 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -14,6 +14,26 @@
 #include <asm/setup.h>
 #include <asm/spinlock.h>
 
+static struct spinlock uart_lock;
+
+#ifdef CONFIG_SBI_CONSOLE
+
+void io_init(void)
+{
+}
+
+void puts(const char *s)
+{
+	phys_addr_t addr = virt_to_phys((void *)s);
+	unsigned long hi = upper_32_bits(addr);
+	unsigned long lo = lower_32_bits(addr);
+
+	spin_lock(&uart_lock);
+	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE, strlen(s), lo, hi, 0, 0, 0);
+	spin_unlock(&uart_lock);
+}
+
+#else
 #define UART_LSR_OFFSET		5
 #define UART_LSR_THRE		0x20
 
@@ -28,7 +48,6 @@
 static volatile u8 *uart0_base = UART_EARLY_BASE;
 static u32 uart0_reg_width = 1;
 static u32 uart0_reg_shift;
-static struct spinlock uart_lock;
 
 static u32 uart0_read(u32 num)
 {
@@ -71,16 +90,11 @@ static void uart0_init_fdt(void)
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
@@ -118,21 +132,7 @@ void io_init(void)
 		       uart0_base, UART_EARLY_BASE);
 	}
 }
-
-void sbi_puts(const char *s);
-void sbi_puts(const char *s)
-{
-	phys_addr_t addr = virt_to_phys((void *)s);
-	unsigned long hi = upper_32_bits(addr);
-	unsigned long lo = lower_32_bits(addr);
-
-	spin_lock(&uart_lock);
-	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE, strlen(s), lo, hi, 0, 0, 0);
-	spin_unlock(&uart_lock);
-}
-
-void uart0_puts(const char *s);
-void uart0_puts(const char *s)
+void puts(const char *s)
 {
 	assert(uart0_base);
 	spin_lock(&uart_lock);
@@ -143,15 +143,7 @@ void uart0_puts(const char *s)
 	}
 	spin_unlock(&uart_lock);
 }
-
-void puts(const char *s)
-{
-#ifdef CONFIG_SBI_CONSOLE
-	sbi_puts(s);
-#else
-	uart0_puts(s);
 #endif
-}
 
 /*
  * Defining halt to take 'code' as an argument guarantees that it will
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
