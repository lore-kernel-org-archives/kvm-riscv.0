Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE360A2616
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 10:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=VFZ7PNfc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fzECUmiL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=vAv/fObM18otZtd5UnoTwz4VDB46Dsd3DcnaAT+yVpA=; b=VFZ7PNfcXD9Tt4FYFd9S1Glb4Q
	AU3YYbpq24dlJdd6FjoJrFiCZ383yLq5UPPf6jVtU960rT9g9dX7QYQ6hNfduZJVRGaGUMIAcnxaV
	B5CHguCwPwsK2brZj+I9LuDbzdpmmzNw4EK4MHiAQJgMbdDyNWY2EYscP7cjaWU5l7IYp2IVYM8O2
	TXXIPA+PLcGc6IftxmYZMvstwd+D8fAslt8PdXgz7a8pyl0xQaOIXqs3majshnOtIdT3JbbvZiX6F
	qwKalC7Z77f+tJWOjZsih1OckURXPQZw7lIXE7oR9jm9LZWiX5qPtsNSssXee1WGHZy4zCpihttgL
	FylAZ8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULYk-0000000EZpJ-22jT;
	Fri, 20 Nov 2026 10:09:34 +0000
Received: from out-37.mta1.migadu.com ([95.215.58.37] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xULYh-0000000EZnS-1sqw
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 10:09:32 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=P0qrC4mC5wPI0uNFi0/eqyjXHkxpX4a02QQNu5yIipA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795169369; v=1; x=1795774169;
 b=fzECUmiLzPUvYi6RAYuAglbE99OzMBGX63ylbmMKzlLfzGwBVX89gLjbqToy7yGiZcBJ7Myb
 rbVs+v3v/6ooL7+E0Y/0Inzw88xtkuGM03nzwlpWJvu+V69TxFXx6DE2FC8F/Ij2QCrLCbJ96QN
 R/pzTkCjAYj5Rq1+6h+8wEWc=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 86bed2740540ad58;
	Fri, 20 Nov 2026 10:09:29 +0000
X-Mizu-Trace-ID: 86bed2740540ad58
X-Migadu-Flow: FLOW_OUT
Date: Fri, 20 Nov 2026 11:08:56 +0100
From: Andrew Jones <andrew.jones@linux.dev>
To: Xiang W <wangxiang@iscas.ac.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	pbonzini@redhat.com, thuth@redhat.com
Subject: Re: [kvm-unit-tests PATCH v2 5/8] riscv: Prefer SBI DBCN console
 with UART fallback
Message-ID: <awAQYxcqIrJwxRl2@orel>
References: <20261105082035.133680-1-wangxiang@iscas.ac.cn>
 <20261105082035.133680-6-wangxiang@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105082035.133680-6-wangxiang@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_020931_636140_410F78D2 
X-CRM114-Status: GOOD (  13.89  )
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 05, 2026 at 04:20:32PM +0800, Xiang W wrote:
> CONFIG_SBI_CONSOLE already routes output through SBI DBCN, but console
> setup still always went through the UART init path. uart0_init_fdt()
> could skip a missing UART while uart0_init_acpi() aborted, so EFI/ACPI
> guests without a described MMIO UART could not print.
> 
> Probe SBI_EXT_DBCN first. When it is available, use
> SBI_EXT_DBCN_CONSOLE_WRITE and skip UART setup. Otherwise fall back to
> the existing FDT or ACPI UART path. This keeps a UART fallback (as
> required by the server platform spec on ACPI systems) while allowing

Your patch actually didn't support the fallback for early prints.
Let's go with the following approach instead.

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index b11634046b8f..e92c9288b3ad 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -28,7 +28,12 @@
 static volatile u8 *uart0_base = UART_EARLY_BASE;
 static u32 uart0_reg_width = 1;
 static u32 uart0_reg_shift;
-static struct spinlock uart_lock;
+static struct spinlock console_lock;
+#ifdef CONFIG_SBI_CONSOLE
+static bool prefer_dbcn = true;
+#else
+static bool prefer_dbcn = false;
+#endif
 
 static u32 uart0_read(u32 num)
 {
@@ -71,16 +76,15 @@ static void uart0_init_fdt(void)
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
@@ -102,17 +106,23 @@ static void uart0_init_fdt(void)
 
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
+	if (prefer_dbcn && !sbi_probe(SBI_EXT_DBCN))
+		prefer_dbcn = false;
+
 	if (dt_available())
 		uart0_init_fdt();
 	else
 		uart0_init_acpi();
 
-	if (uart0_base != UART_EARLY_BASE) {
+	if (!prefer_dbcn && uart0_base != UART_EARLY_BASE) {
 		printf("WARNING: early print support may not work. "
 		       "Found uart at %p, but early base is %p.\n",
 		       uart0_base, UART_EARLY_BASE);
@@ -126,31 +136,30 @@ void sbi_puts(const char *s)
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
+	if (prefer_dbcn)
+		sbi_puts(s);
+	else
+		uart0_puts(s);
 }
 
 /*

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
