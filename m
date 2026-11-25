Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80CA5606A323
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 01:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HXQ+PB2h;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=BxsmqQKq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oG9rW9R/UoomyGsKDD+97UYkNxc1W61FWbEs4DoFY48=; b=HXQ+PB2hklfFq7IL4Orojt1pEU
	w2srwJzJ5t4Zo9Gbg81Wp/zVc29nGbFLxTxmd85JmV4ZzC27AKHlpBtFG309yfeJ3RcB90S3y5zvO
	a4HwNKNQTB5Gbhl61cJCu2RaKQ/kVZDjBF/5oltrb3D5ZumZ6n9NjhBjoWFGwtp2K9hr0KDBeooWH
	YR19a+1O+gNUdpChE3rSDuMUwaa6qn3UhaCC3+llZgBt/5GmDBWoAy882yjdwYPWOIdlfC6ISeJuH
	LHVFcNPwCDd5Zf/O8TtjsGti5lQDqD/MP1yfO2PRH6JVLt5+DXTpu3Kw1OvWCv+jFEYI+szAJI0bm
	V20j8Eqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23w-00000008Cu9-112K;
	Wed, 25 Nov 2026 01:44:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23v-00000008CtF-1LxF
	for kvm-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 01:44:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=DQ2noZm5zCHHb7/oSScqzeGGuAbrQQoSEmOlcfHGp20=; b=BxsmqQKqmUUYQAAWyXJmFYMey3
	nOneRimmoNefZF/VmKiBDqA9tRX0UVWhfG/D1i9VWy/9vlF0PGNyFAq08IS0v2e1G/87VRF/7B9X/
	biroy9uSt9eifS9Cc1POdj06/H5tqviDw945WOKj/o4BJisF16nmaheNDpOasOrQHVYuVHh33Sb01
	zExIeRFt//284DaY3ixwEp8e6Dc65yiJjjzR+qYwwqjpvdgJkHVmfmhSQNii7/0pOF9XbtlLORo0F
	qTfakdhbGC8zoyZlVKXX2kbd2zwajn73eIch41+mJ8LMxZntG0aBQ9z19uKkZSZBw7ANnRAW5h879
	unoUiXOg==;
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW23q-00000004jXZ-1N4x
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 01:44:41 +0000
Received: from localhost (unknown [122.194.100.240])
	by APP-03 (Coremail) with SMTP id rQCowADn8JF7PQZrw9m8AQ--.22523S2;
	Wed, 25 Nov 2026 09:44:27 +0800 (CST)
From: Xiang W <wangxiang@iscas.ac.cn>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: andrew.jones@linux.dev,
	Xiang W <wangxiang@iscas.ac.cn>,
	pbonzini@redhat.com,
	thuth@redhat.com
Subject: [kvm-unit-tests PATCH v3 5/9] riscv: Fall back to SBI DBCN when no UART is available
Date: Wed, 25 Nov 2026 09:44:05 +0800
Message-ID: <20261125014409.79852-6-wangxiang@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
References: <20261125014409.79852-1-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowADn8JF7PQZrw9m8AQ--.22523S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAF18AFWDKw43Jr1fZF1kXwb_yoW5uw18pF
	ZIgFsxtry5GFnYq3Z7tr1kCw4rGr48W3ykKryxJw1xZw4DJrZ8Xw4fta1av343WFy3AF4Y
	yFsFvFyfCF4UZ3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-CRM114-CacheID: sfid-20261125_014438_845302_AAB1E21F 
X-CRM114-Status: GOOD (  14.50  )
X-Spam-Score: -2.3 (--)
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

Console setup currently relies on UART initialization. On EFI/ACPI
systems without a supported MMIO UART, initialization fails even when
the SBI DBCN console is available.

Probe SBI_EXT_DBCN during console initialization. Use the UART when it
is successfully initialized; if no UART is available, fall back to
SBI_EXT_DBCN_CONSOLE_WRITE when DBCN is supported. Report when early
printing may not work because the initialized UART differs from the
early UART base, or because DBCN is used instead.

Rename uart_lock to console_lock, since it protects both console
backends.

Signed-off-by: Xiang W <wangxiang@iscas.ac.cn>
---
 lib/riscv/io.c | 52 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 33 insertions(+), 19 deletions(-)

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index b1163404..45fe93f5 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -28,7 +28,8 @@
 static volatile u8 *uart0_base = UART_EARLY_BASE;
 static u32 uart0_reg_width = 1;
 static u32 uart0_reg_shift;
-static struct spinlock uart_lock;
+static struct spinlock console_lock;
+static bool prefer_dbcn;
 
 static u32 uart0_read(u32 num)
 {
@@ -71,16 +72,15 @@ static void uart0_init_fdt(void)
 				break;
 		}
 
-#ifdef CONFIG_SBI_CONSOLE
-		uart0_base = NULL;
-		return;
-#else
 		if (ret) {
+			if (prefer_dbcn) {
+				uart0_base = NULL;
+				return;
+			}
 			printf("%s: Compatible uart not found in the device tree, aborting...\n",
 			       __func__);
 			abort();
 		}
-#endif
 	} else {
 		const fdt32_t *val;
 		int len;
@@ -102,20 +102,33 @@ static void uart0_init_fdt(void)
 
 static void uart0_init_acpi(void)
 {
-	assert_msg(false, "ACPI not available");
+	if (prefer_dbcn)
+		uart0_base = NULL;
+	else
+		assert_msg(false, "ACPI UART not supported");
 }
 
 void io_init(void)
 {
+	prefer_dbcn = sbi_probe(SBI_EXT_DBCN);
+
 	if (dt_available())
 		uart0_init_fdt();
 	else
 		uart0_init_acpi();
 
+	if (!uart0_base && !prefer_dbcn)
+		assert_msg(false, "No console available");
+
 	if (uart0_base != UART_EARLY_BASE) {
-		printf("WARNING: early print support may not work. "
-		       "Found uart at %p, but early base is %p.\n",
-		       uart0_base, UART_EARLY_BASE);
+		if (uart0_base)
+			printf("WARNING: early print support may not work. "
+			       "Found uart at %p, but early base is %p.\n",
+			       uart0_base, UART_EARLY_BASE);
+		else
+			printf("WARNING: early print support may not work. "
+			       "Found DBCN console, but early base is %p.\n",
+			       UART_EARLY_BASE);
 	}
 }
 
@@ -126,31 +139,32 @@ void sbi_puts(const char *s)
 	unsigned long hi = upper_32_bits(addr);
 	unsigned long lo = lower_32_bits(addr);
 
-	spin_lock(&uart_lock);
+	spin_lock(&console_lock);
 	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE, strlen(s), lo, hi, 0, 0, 0);
-	spin_unlock(&uart_lock);
+	spin_unlock(&console_lock);
 }
 
 void uart0_puts(const char *s);
 void uart0_puts(const char *s)
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
-#ifdef CONFIG_SBI_CONSOLE
-	sbi_puts(s);
-#else
-	uart0_puts(s);
-#endif
+	if (uart0_base)
+		uart0_puts(s);
+	else if (prefer_dbcn)
+		sbi_puts(s);
+	else
+		assert_msg(false, "No console available");
 }
 
 /*
-- 
2.47.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
