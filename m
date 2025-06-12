Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC440C61CE8
	for <kvm-riscv@archiver.kernel.org>; Thu, 12 Jun 2025 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bpKt7g3hiBSautwpwqIwg+I6fh7SSRuLrZD/6Qsnxxs=; b=ODu5UUnPE4JOQs
	VhaSLIQmb58QICOO1w27hwlXBBqYEbTMSIMV1Bc0g5x6lYimmsEYP2mWzsb0xTPUy0noFcmXe+VNC
	4imdBtKr7jmlNhH21yS4DYZl6djApFZIvTRYcqXRohz7sKQpyByPFVoeWRSXA32HwvitZf8fj2/8t
	FhbcsaWsxEyFJai/vBh4ZNqEg1jPgLHdcvbSkiuK9V/I3Zsifpj6FcAstvZuSAwO9ej3UOMyIkasm
	CFktyB386zXXDJnP7MjqYMBqflR1dZlbyNp1vJjE/OOyvO9UH8q9NsvEvBA+uB/oh3O6foalUo08Q
	n0DPzPMY1O00gqSXfuuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoDI-0000000ESG5-2nPG;
	Thu, 12 Jun 2025 20:07:52 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPoDF-0000000ESFF-36Om
	for kvm-riscv@lists.infradead.org;
	Thu, 12 Jun 2025 20:07:51 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6f0ad744811so11601826d6.1
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Jun 2025 13:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749758869; x=1750363669; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IoCF2baTBMbN485tov+kTyy1ox66YTUHGdu6p7Q2Pjs=;
        b=a7t6Ji62cgHsxqDVZZZvzwm5P0d0uSz3UIFIK9+ObxyTIKbHFxZLy6ymvofQE/47F/
         dS2VcVtNhvIeSna6IuQbWzHIAn4T+duGs+3euk9FRoAmjPv5N31E+c/t0S278hYYX1YB
         pNpfVxe2qzp+M4D7KOGACClp/Dyed8KgSVzrW8CwUC27hxJxE2xO4ydB5hrXz++x5VLW
         1mn8kqM5AMfS498N4TLNh7NhZQzQyQvQeELXv0kyvA3YoDpCCGTrLORT6qT2H8yS5toJ
         g2oIyDZkUdOCO5HgvsApTLC6N/pAZMLPsyHF1QmQWILJ95pjJGmWnnSiC5q8Xn5oq1Ge
         GiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749758869; x=1750363669;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IoCF2baTBMbN485tov+kTyy1ox66YTUHGdu6p7Q2Pjs=;
        b=O0ksa1Nqvp5JksJ7/aOrxL2EUiL6ozeBipyHtOmO2t3NDd2/ABZuWnL2+Ml3KWIIo3
         Z0NIn8GPCMhc0PnTM5dqnXvfP+q1D7kC836wJYQxmQ5o2td9jDJUpNQ0ATpL0LGDOBph
         VOxUMGVo4eyH5NO8Wm3llRWsdHhDWddw4tps1trnfx5QaWnlPxFUn9EEC2hd5tfjRGjD
         Y+LMtjBPBgJ86K7GYz92i+R/x19kAuDPaWMrCByI+CozFDwJk0cFNCwihvwu9TDsjxcM
         7rTtY3vPDFwwAb3lqU8OPcYqiui6zGodwzge6ecGNTMfiPR2ALVIiSvEYwnBMVGPXmem
         5erA==
X-Forwarded-Encrypted: i=1; AJvYcCXl4gHkY5MTKonQFyArv4n0afutx0qyw449q+gI+YLchyvh6j8j51HQp3/tiuXTg081QlD/oL8Hc7M=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1kuO6qsOqnJ9R4+JlgZLpPr9pBZ3a+OKXafdaQANVR1inanTx
	aNdnVl9C6X3DbRyKX3Z9W6q4vDserNaqxOLE/jVmzjFRHYfiIPJpymnNSS+lywNaK5E=
X-Gm-Gg: ASbGncvADSlmMzxlGJCRniauF83AKAmK1eqHBD1rlbH6OCduMS5YY6h0f+2SWhHifz1
	OUOU1EgXR3psRbK/r1R0f/U5xMlL13auETDxigI3su0n0u9JuDLgQ9Vdk8AW0oU5rB+SFfteal5
	xcaJxbNkH6/eeO7oQFvPDYHlJ5aK4FbWJso+fL06xQqivfjW/TmpooVnEEfVLrmyA0rzofobemn
	eSM7a3SRX1LMxbxB33nLw49K9lejpbaamy6sOsQNINJ35JW7R/oGAE5vwkvk+seJKyHfgq8Cbf6
	jFKJdsK4EikDAESAH+TQc3vzq5G23ifpKHemDG+cvS7GDva7OS4BFn3Ffk4cmyYmgC7gc8RwFu/
	UFp5wL51VUwuO6ZrFZqYUxV7S17v85A1Jfqb4yq2Cm+k=
X-Google-Smtp-Source: AGHT+IF7ZOtN55FB9YsoHYExZAH41WMoG3UxkGYtgNp99PihSoVpgb/lhT7vGhmzKBFUsNoGNC5TcQ==
X-Received: by 2002:a05:6214:2a48:b0:6fa:ce87:230c with SMTP id 6a1803df08f44-6fb3e67aeffmr2776616d6.25.1749758868792;
        Thu, 12 Jun 2025 13:07:48 -0700 (PDT)
Received: from jesse-lt.jtp-bos.lab (pool-108-26-224-24.bstnma.fios.verizon.net. [108.26.224.24])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c895f2sm13496096d6.116.2025.06.12.13.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 13:07:48 -0700 (PDT)
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
Subject: [kvm-unit-tests PATCH 1/2] riscv: Allow SBI_CONSOLE with no uart in device tree
Date: Thu, 12 Jun 2025 13:07:47 -0700
Message-ID: <20250612200747.683635-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_130749_841377_96B5D617 
X-CRM114-Status: UNSURE (   8.43  )
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

When CONFIG_SBI_CONSOLE is enabled and there is no uart defined in the
device tree kvm-unit-tests fails to start.

Only check if uart exists in device tree if SBI_CONSOLE is false.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 lib/riscv/io.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/lib/riscv/io.c b/lib/riscv/io.c
index fb40adb7..96a3c048 100644
--- a/lib/riscv/io.c
+++ b/lib/riscv/io.c
@@ -104,6 +104,7 @@ static void uart0_init_acpi(void)
 
 void io_init(void)
 {
+#ifndef CONFIG_SBI_CONSOLE
 	if (dt_available())
 		uart0_init_fdt();
 	else
@@ -114,6 +115,7 @@ void io_init(void)
 		       "Found uart at %p, but early base is %p.\n",
 		       uart0_base, UART_EARLY_BASE);
 	}
+#endif
 }
 
 #ifdef CONFIG_SBI_CONSOLE
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
