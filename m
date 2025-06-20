Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BE5C7115C
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 16:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gZbvtFDeQWXyVvlpwZA48g8YUxahEvvUY1JZoM2HX4U=; b=F46nmu/+rC+F+q
	tOwwrPOb/QUTYj3yzI3kEqM3XqNURabEa5A2PnBEXrnxiUoRQ5eKG2ONFm2Kw7K39QjWW+0yaMCqk
	76iW31eSDO05TtsB3SGnRU1BXSwLsDrw95ExNVKLWx4kklXHPlb7hL2c3pKHsxS2BrwYTgkIVb8yF
	eJd8KZteStJcMRiPTcL7G7DUM1C7DlGpYehuIQ+4f1qiDKE6APRLCeNEpHDYyLy9nbXgYQ4KAE84l
	ZIA2tIcDJz1o/aqRZen7HpFpc9k13bxjBM4goPSWjH4HnMAgTMMQu3g5tTJIAw+6nw47MzLcrP8+5
	05h1Y38SWGagnkC/OTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSeO2-0000000G6sA-0x9U;
	Fri, 20 Jun 2025 16:14:42 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSe10-0000000G3GR-1Ltc
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 15:50:55 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fadb9a0325so17810126d6.2
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Jun 2025 08:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1750434653; x=1751039453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lb0bY/htYmIjhjl7e6qeommZ2woeWEYXNTEbvyaBVDI=;
        b=njUSeo+qX60NeZPRUpLit58uCAh7Ra1jYVnm0E5uzcACVDoHh/1iixpYwarILPDYxE
         uuBZpifHvu+FVpp9PphPffi62cPt0uxxPhkVQnvSkwX8XdYRIGJm9xUTX+uPwKUIx/r/
         Idf5GuhxDQCNQhqW5F731qB/YDIQUN+FPCkMAaPYt+FsFvtWexK+vYBG3cHJeqJQvfMl
         NxqVTj08HRT7fLf5SjuML/cclzzBcgQ6NTVggnlvDzowKTCcuUn910HE0i3PDRCJIfpY
         oyp7p2LIVjQPKERNe8awvxckQyGOWPVbEmD19MuICZYT6Bm+2paj9DO/T3plDMBUUD9M
         qMAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750434653; x=1751039453;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lb0bY/htYmIjhjl7e6qeommZ2woeWEYXNTEbvyaBVDI=;
        b=XFm66FbmBmMhKaRugwUp42NpiV3d7ReGR3LlEgLv2cPWImPy9T80nWmR3ocHzUCtmp
         BYyKeq9rRzH/LCeurYZFosKBTZvIxsZssNEX9OaD2HFsWSiyPaABTe5vZ9W77tM5AEJP
         H2sUGBi+fQYR0T8ou5Bv6jeJiSH2zEBzx8uPpthq6oHWa+jRgM1zOnlMJ2y0n9c4s79D
         X+idl4Y1X1JF+YxslHoru9NqTtkTqD24LAttaRhlKfki2oTcKubKBQwGeBv4uZffTFn6
         4vf5Ri4apIxDdTYG4JzHQnlssBhVSkm0R4VkwKkzZyKD8VcwPImmxfJO2xYJMfX/KNOv
         Lz3g==
X-Forwarded-Encrypted: i=1; AJvYcCWWYYqDQ8afyhwW2suGsr5yjSiqLfPf/0hEO9+b3i2S+3NQH/RyQ/l4EXiJnOrk1pBiy0enbcWTk8o=@lists.infradead.org
X-Gm-Message-State: AOJu0YyE/WdFFCdSoV+aWBx8y5PD/FvuYsDQ/HeuML/wDY3CneItPrOk
	rraXJcOiZPHJU1b/dMj5LrsnmPErHeGpZmyd403nb6KB/Y1Ar2Zy5rayczU+mC/m6d0=
X-Gm-Gg: ASbGncsQeNHpq+d/spBuRJhsjmniGXHgkoD5eHk23Xa4IzYgzPDGw56+uKWm1oC1mpa
	z7Qyz0nheJIduXRwGA5pgW10OhREa6dbLjTyEhFZCwKZ2a7a17FCnyq6vDPyLOi9ox2XvoItyjc
	7o/ZJU4Roz0cEOJDSmar6+DhC4crA+G+1c13m9mIyHC2QX2sw0F8WOhHiikUsyRH04ziVMQd3El
	BgZUHg6LAorD89OgasjrbrkDcX7HizLM5UlVtZ8e0USqE6rinN53wr1ufzdXeoMZLaYYYSsOdDi
	r2NY8X8As7lGFVrYlnP8QOEHJe46c5nySXnTgNbD3tM3efQJooVNIf6aGFGIWxMK1iQSZM6tR03
	3YsF4Ek/aadH6SEVqT5K8puSzrzsRGB6AtcnVTk0ruKJcrAsBT3Y=
X-Google-Smtp-Source: AGHT+IETUJGmBTkpbC46zTXbh4bGWkFtIlbC6e1CPw3xSSEKzKZ4d32RaY3VpeK/E5rx0MhnNTQd5A==
X-Received: by 2002:ad4:5c66:0:b0:6fa:faf9:aabb with SMTP id 6a1803df08f44-6fd0a59692bmr61494516d6.38.1750434652753;
        Fri, 20 Jun 2025 08:50:52 -0700 (PDT)
Received: from jesse-lt.ba.rivosinc.com (pool-108-26-215-125.bstnma.fios.verizon.net. [108.26.215.125])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd095c8ccbsm13317606d6.122.2025.06.20.08.50.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 08:50:52 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH] riscv: lib: sbi_shutdown add exit code.
Date: Fri, 20 Jun 2025 08:50:51 -0700
Message-ID: <20250620155051.68377-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_085054_594454_314D3633 
X-CRM114-Status: UNSURE (   9.56  )
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

When exiting it may be useful for the sbi implementation to know the
exit code.
Add exit code to sbi_shutdown, and use it in exit().

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
index fb40adb7..02231268 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -150,7 +150,7 @@ void halt(int code);
 void exit(int code)
 {
 	printf("\nEXIT: STATUS=%d\n", ((code) << 1) | 1);
-	sbi_shutdown();
+	sbi_shutdown(code & 1);
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
