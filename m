Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3508DC71136
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 16:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2sylVRhYwws4svzuoD1QlZR5JQt6MdjmM+kFHUOkIwA=; b=zRAg29Gp7NvsLg
	DQZATt2fEUuZk8r6YsZDhBMp2PORvAaWjS1AztlawpGXpcO4bzn70/kBtHTPSWZLLlnrftL0HxtZM
	OzlT2kpLsfub6UvrmgzJraEmzbkFM7YTKu+Hx/K6D5X05TvIDNegRShn525qKEZLJ4KQBGxRp39T8
	upGt2VsUYXu2FkqHYSj9l21uUyKEITY1WkV8dXD/luetlNa/Zzkg0QjAzpaWRtJ5LB6zeCXNvJPZa
	94UsaSaiImh94gAGgTVg6VoqBPqEGdK92V+v47k9APf9v1Tj3x5BtNcH8hTrHPoCKsxe/2I5VjKAw
	ipq2QGLp7zQYO1UMzwCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ75g-0000000H1r4-2raC;
	Fri, 13 Jun 2025 16:17:16 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5w6-0000000GoKJ-4B4l
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 15:03:20 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-235f9e87f78so23664455ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Jun 2025 08:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749826998; x=1750431798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ByGbrP/BhXTu/tB+D/uo9uO7b8hyy6jujdxcKOmL7bw=;
        b=xQRfC76iEQpSXe5FlWazS8fCCq+DUckUECM7CmxKCyVjrqf6iZkqXEt/UqePon6ADl
         LBupa2FDJEPe1zlIwe/QmuuO6e/crolTdrVvtsqg4nIVyxyST93Mx6ceTMllkUegcjR4
         KOYuK3UeOWgQq1OnVL/1zUpUhS8UcW9UJjO3SnByftKfN+xLYfYIHP70YwRYyoxMhe34
         LAwZSU8U6y7grrCLI35zkJzXwLDMt+4NbzE8UYZSFNpwRwEPExsjFTRQOZUgSPIAIALq
         yOK8kZthwLFL53yQ2n1cD72r0uZOfBTtSt1/2xmcM4HkjA4e+EBMWVhvsNgK8J2bZGTm
         L2Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749826998; x=1750431798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ByGbrP/BhXTu/tB+D/uo9uO7b8hyy6jujdxcKOmL7bw=;
        b=bPKw20lbnwNYAS6PVjJggNECiDC/nCioQqQc0L/wbjuTwIElqyLAjI+hF7zIeRelL9
         8GuB30QZI0SyyIdnA4STuJr+HgNxV/ZIHNWTpAuX79D/bZjKt092suqHxq7VgNdv65OU
         myua1dzR8TSdNNjj2kwhpa0fFUUUivz29fEEgpX2HxRGUvNtO9N+NCTNHKq6gJE597/3
         A03nXcBtAPS136GdVsTYYWBCnO6II+VOZ/wLlDy/KHlHqV2l8F2DUjyNPh1ZiybGMGVs
         mI6BMduyHuUINpjOd/dEyTgoiyqwu6fDqvLi7gG9Pf3a1wpXbMmBsQatovqUqe4iNZLF
         H3zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXphWmHSdZCTIdMoqKV8GIRfEAWtZDryxNMjNFeM15ncH5zJmAErQ9K42IYSXbPsDrpZfxwTRiC5Qo=@lists.infradead.org
X-Gm-Message-State: AOJu0YzNQjmdEe10wwOPk2i+a4emIdIwwQGax2Iw6uqVboAYKc3w+6tV
	Hd5b35CKpT5FkHJqGaoTIRYwnI4ZKNwq7dN0AwDNg759cK2J0qcq2QcYkoPuB46L3Nc=
X-Gm-Gg: ASbGncvRsUwKS1MSNNVswtZJBg/quOrxF/59eLhJp2xEaYvNHMC5+LalnpSojf3Reog
	jV86spU959JEQ6OlCi9izwaaGd9YRmHMq869OMrDrFPElXNuO7wZnO+A3MRvkS14Jq2+dzth7QC
	C3x+Pi1FxdgFtvP0aZlsNwg65Pljdt6QMBLFwm5FIiHMzavry/yUVfYSzNpeYU2dUENEGzo/aMD
	xrvqji2NwLnLNOzegqTPi2RFXxXlaenay3ZFxC6mplOalOuqBufLv07GmgYxbCtojVnBkI9q8xa
	kaCau6pdULWgUmUPnb9HFqyLVki9AO3GrkRaoqNFxiOgVMw5gPx9oGp7CCVj42Ble8j43j0UrN0
	/o7XQ
X-Google-Smtp-Source: AGHT+IEkVhWzhAXI3tcZMCIrTOwssgtXLWKplMIQXljnP5TEt6Tv6Fn/ix1rs1omTiBAqTROVanQgg==
X-Received: by 2002:a17:903:228b:b0:235:be0:db53 with SMTP id d9443c01a7336-2365de3fc55mr46130975ad.51.1749826998209;
        Fri, 13 Jun 2025 08:03:18 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com ([2600:1000:b0a7:aa8d:70e3:1b4a:46b0:77bf])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de783a8sm15242055ad.99.2025.06.13.08.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 08:03:17 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Himanshu Chauhan <hchauhan@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v2] riscv: Allow SBI_CONSOLE with no uart in device tree
Date: Fri, 13 Jun 2025 08:03:13 -0700
Message-ID: <20250613150313.2042132-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_080319_270789_1BD38CFE 
X-CRM114-Status: GOOD (  12.15  )
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

When CONFIG_SBI_CONSOLE is enabled and there is no uart defined in the
device tree kvm-unit-tests fails to start.

Only abort when uart is not found in device tree if SBI_CONSOLE is false

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/riscv/io.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index fb40adb7..e64e9253 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -30,7 +30,6 @@ static u32 uart0_reg_width = 1;
 static u32 uart0_reg_shift;
 static struct spinlock uart_lock;
 
-#ifndef CONFIG_SBI_CONSOLE
 static u32 uart0_read(u32 num)
 {
 	u32 offset = num << uart0_reg_shift;
@@ -54,7 +53,6 @@ static void uart0_write(u32 num, u32 val)
 	else
 		writel(val, uart0_base + offset);
 }
-#endif
 
 static void uart0_init_fdt(void)
 {
@@ -73,11 +71,16 @@ static void uart0_init_fdt(void)
 				break;
 		}
 
+#ifdef CONFIG_SBI_CONSOLE
+		uart0_base = NULL;
+		return;
+#else
 		if (ret) {
 			printf("%s: Compatible uart not found in the device tree, aborting...\n",
 			       __func__);
 			abort();
 		}
+#endif
 	} else {
 		const fdt32_t *val;
 		int len;
@@ -116,8 +119,8 @@ void io_init(void)
 	}
 }
 
-#ifdef CONFIG_SBI_CONSOLE
-void puts(const char *s)
+void sbi_puts(const char *s);
+void sbi_puts(const char *s)
 {
 	phys_addr_t addr = virt_to_phys((void *)s);
 	unsigned long hi = upper_32_bits(addr);
@@ -127,9 +130,11 @@ void puts(const char *s)
 	sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE, strlen(s), lo, hi, 0, 0, 0);
 	spin_unlock(&uart_lock);
 }
-#else
-void puts(const char *s)
+
+void uart0_puts(const char *s);
+void uart0_puts(const char *s)
 {
+	assert(uart0_base);
 	spin_lock(&uart_lock);
 	while (*s) {
 		while (!(uart0_read(UART_LSR_OFFSET) & UART_LSR_THRE))
@@ -138,7 +143,15 @@ void puts(const char *s)
 	}
 	spin_unlock(&uart_lock);
 }
+
+void puts(const char *s)
+{
+#ifdef CONFIG_SBI_CONSOLE
+	sbi_puts(s);
+#else
+	uart0_puts(s);
 #endif
+}
 
 /*
  * Defining halt to take 'code' as an argument guarantees that it will
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
