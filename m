Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAFC7C77B7F
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 21:34:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eKXPRb15QZ5AxzmTZXXMbBg+cFOlM5+qOAyCEwA3IVE=; b=o8w7ghIkN4qica
	EtTJXOccYarEAKoz0E0BxqIbRn2VJYA6/vryixNT1hsesFp6ZRPR/L6Pqz/3l9yh6s2cH58Wccs2p
	KWXtW24F+mGMue3zIMx7t70JRY8UrQdVuHcXgD473cT+1PlRYKkKiKJw1Kuqq/JAs/Wo1091/tI5o
	EUPabbhXEzTAMuPRWMH/6bNj+VN/Ur0bcTIcgbRq6pFRU/tByBmTzoPvYUy1daA2FJsZ2JavSEaH5
	6natVJsrJXRwTlJZvrU4oD6sWrcNG1pF7UgyzuCV+1IHjwj/oj9FVLlGublIQzBX80MtBLH344KQe
	uCq2owwTs/ieK+2glEqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUBHZ-00000006t2I-18Qe;
	Tue, 24 Jun 2025 21:34:21 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU9En-00000006avF-3Yqs
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 19:23:24 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7d0a0bcd3f3so24176685a.1
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Jun 2025 12:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750792999; x=1751397799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gJEHC7W7QNUQcjlQadx2lMB+Voeeq/w833ndZR1fDN0=;
        b=r7VBShCdDL4B2TVwIrOuv+3B+Btp9YR9mA4iaSR5XKt39swnd8xeM+Sld1uZBIw5r0
         2+cFOnk/JJkArHIVoJb0Th/EJ7dPgIgm/hCbTTQvNJAC49bAXtYLM+vruq7Spa8i1BsK
         vAM0nrEsWNuCxIJR7QBbVPp1qzPbTVJSv0mvftwSPpGihQ+0tQ/DBtm7PiZQeaD6NAT7
         Bi1GELxEG4PSMnLWbbG/2ZIon31T1gC0Czs+W42dW8rFbtaXnoFi4nkLAT4yQOHhg0uX
         2ToBjlp758U0NsInAGJX3NOu8aQB6+gShOu8ya8XZJgfCBT9fJ5y/EytS+JHLLeytv8N
         m1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792999; x=1751397799;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gJEHC7W7QNUQcjlQadx2lMB+Voeeq/w833ndZR1fDN0=;
        b=A3douS3spdTAOFDSJnlfi0bA6FInATCaQq1eTYu8enBnn4vTGEyQhikUGhlj4lrzQv
         m1a9BYQ5Ny1ORlWK0qjrogKHmUB9Ffrk7W74W0sJ84cjbb/NJljO0uBDVuVcnQR/hb0z
         UNsMG+ObaAS2WVGQujMPnsDzSLYUUGaxzeXenzQwgl/PJohRYB5k77a9/s7HYmnlnmuO
         TrKW6rcvhNbS3kWSGvqHCtBc3OTAcV4R1/cbUAm2dSzjEA8S+2lmUVotKNdVKJ+yPKcf
         92NxS6R3dK+i8m7zve2az1s1jon8/WPjyPra94lUJn3cX6HnXcdS0vS9EEDJy3edxSWd
         hxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2yC/QD5o2m/OZKzj8Rih8cpYybntcJyHkFlhSoGi/3oGN05/N4h3V1+EJtnhJOwUC4ZFYA9myE8s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yya8BdNMor3lxtMrZdql8d0CnWCYVGOBBUBJ2TvDm/RpLbz2ASp
	8hioIkB4+tkm92xBWVqLJmAlEwFHXIlcnPN8S3S8J4d2A8vMBpHzlzCjVKfxwvZXzwA=
X-Gm-Gg: ASbGncszS6kH2zLAnHckY4QyHh6UlZ0pCVJAwBDclU3EB9jdCay+EHnj0q6iwFzsXRs
	aWDawP8lqhTvOKlynSxbXEHW92c5q80CYqxqHO87f7q9cMtyXMASQ0zFuhKBGTd6TlmdlPP71Hd
	ZkQ580qTR9Oii3eGelCxApL6VC15avyC3b29GE/wXD0UvLxNCOgo4r6ziGGaDqLNkWpqwvnvRl8
	CxN0IsftorW5qQN55J5y6RCnM2nFULpqbnkirWH5m4kW71M2NBhfiX0WvYUeXBel37eVCWg3Uuc
	UydhxtSVztP1TL8s0GKFQI8r6DJ+10hYzSruy4HFlGs+frmaW5i2RHqu503ZEMRbMi0PmNRTw5Q
	Ojr01KXbXedOcGOn+20DJlIHfJwUt3EiY6lNdPtm221B6lwaECjzsareleWqh+w==
X-Google-Smtp-Source: AGHT+IEpWt8zHh5hqZ66ViGmfWYuDSGLX7ZbSUGK79B47Y9xlyE9QioC0WusRzyQfrYBkVZ91oshfg==
X-Received: by 2002:a05:620a:1708:b0:7d3:a4fa:ee06 with SMTP id af79cd13be357-7d41ec6e85dmr607952985a.29.1750792999362;
        Tue, 24 Jun 2025 12:23:19 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3f99eed41sm534292085a.69.2025.06.24.12.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 12:23:19 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>,
	James Raphael Tiovalen <jamestiotio@gmail.com>,
	Sean Christopherson <seanjc@google.com>,
	Cade Richard <cade.richard@gmail.com>
Subject: [kvm-unit-tests PATCH v2] riscv: lib: sbi_shutdown add pass/fail exit code.
Date: Tue, 24 Jun 2025 12:23:17 -0700
Message-ID: <20250624192317.278437-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_122321_993905_FF1847D6 
X-CRM114-Status: GOOD (  10.38  )
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

When exiting it may be useful for the sbi implementation to know if
kvm-unit-tests passed or failed.
Add exit code to sbi_shutdown, and use it in exit() to pass
success/failure (0/1) to sbi.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/riscv/asm/sbi.h | 2 +-
 lib/riscv/io.c      | 2 +-
 lib/riscv/sbi.c     | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/riscv/asm/sbi.h b/lib/riscv/asm/sbi.h
index a5738a5c..de11c109 100644
--- a/lib/riscv/asm/sbi.h
+++ b/lib/riscv/asm/sbi.h
@@ -250,7 +250,7 @@ struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg3, unsigned long arg4,
 			unsigned long arg5);
 
-void sbi_shutdown(void);
+void sbi_shutdown(unsigned int code);
 struct sbiret sbi_hart_start(unsigned long hartid, unsigned long entry, unsigned long sp);
 struct sbiret sbi_hart_stop(void);
 struct sbiret sbi_hart_get_status(unsigned long hartid);
diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index fb40adb7..0bde25d4 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -150,7 +150,7 @@ void halt(int code);
 void exit(int code)
 {
 	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	sbi_shutdown();
+	sbi_shutdown(!!code);
 	halt(code);
 	__builtin_unreachable();
 }
diff --git a/lib/riscv/sbi.c b/lib/riscv/sbi.c
index 2959378f..9dd11e9d 100644
--- a/lib/riscv/sbi.c
+++ b/lib/riscv/sbi.c
@@ -107,9 +107,9 @@ struct sbiret sbi_sse_inject(unsigned long event_id, unsigned long hart_id)
 	return sbi_ecall(SBI_EXT_SSE, SBI_EXT_SSE_INJECT, event_id, hart_id, 0, 0, 0, 0);
 }
 
-void sbi_shutdown(void)
+void sbi_shutdown(unsigned int code)
 {
-	sbi_ecall(SBI_EXT_SRST, 0, 0, 0, 0, 0, 0, 0);
+	sbi_ecall(SBI_EXT_SRST, 0, 0, code, 0, 0, 0, 0);
 	puts("SBI shutdown failed!\n");
 }
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
