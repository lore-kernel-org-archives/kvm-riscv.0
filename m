Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BDBCAC5AE
	for <kvm-riscv@archiver.kernel.org>; Sat, 20 Sep 2025 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xkgi9uOXFHirwmRbKrtBic3KHQI7aZL+Vpdp5rQvpc0=; b=M/P8z38jyuSiKc
	9WR6xMeA9m5Q81//2Kt9tt7/EFDqnkSSZ0hUKXL+g8gHeUUHjFJF8D+9N4+MLBqAW8vowxec7RN3/
	CUQoxIUYpl14jdAkF4Hc0JqiR1jbe5hPJ2kKIZtkg1F/38J00NDZr+X8v35ORkPmgGMHCvn76zOQe
	7x9N3v46DLHlbbCUiF6u1pcdMAFO0aAAB5bQF0fid/+xI7kp9yyATQcP6d0bvq8OBAuPtDhIFq7YF
	1oYrh+jvdj2KQ6TAEnR4dz89GNRhBZ85NPOQfmCc7bteEVMAZvvn2slqg6rqjDTPJF4jdNsEWl3Ga
	tgJX9TeRVf/nD87zeIfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04Ma-00000005tqY-04Xh;
	Sat, 20 Sep 2025 20:39:20 +0000
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v04MR-00000005ta4-3x6v
	for kvm-riscv@lists.infradead.org;
	Sat, 20 Sep 2025 20:39:13 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-425635acc4dso6654115ab.1
        for <kvm-riscv@lists.infradead.org>; Sat, 20 Sep 2025 13:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1758400751; x=1759005551; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TxscO8SXNrjDBekFMJlTFlhXiLgQFfajmO2RZqDfrAU=;
        b=WJx6LN9oT5I061YlI9UAgnYaUdpMz1SIDS1+QGaI1mVcTHX3GwOeKejn/IdePUg40G
         4NBr+Ym88iosHcwzAiOw6O6KZ1rEo3IjnV+8NSF1TIogGzFY+0hQqpnlxReE64frpMes
         bbtV5EvSG8gaKIfyhMiltW7ceORzqOFALwfF0ahO2Ir+ai7o5STKftg1JoX99/iQmMkg
         v2CF7KA1VbYnqaNDFe+A3XqffPQivk2KmNEl+E4xHvhvJBXRBjvzC2QqRXbfrpKx76oz
         CjWUkqf05xDyncDbk/6+vd4rK+mAccSOmPVjkjVzQQc+q8Afr1ySLAjuX1noMpek351O
         NHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758400751; x=1759005551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TxscO8SXNrjDBekFMJlTFlhXiLgQFfajmO2RZqDfrAU=;
        b=IRl7HaO3VULa0O6o5GgzWTuqALKR3PohIFxzgwugIn4zrh70/zsam77Kb3GkzHRT0+
         l8GPfRGgVcwRMra2pDE0DNLMRa/WvuKeibyB5TTb92fVyRv8ts7BnpTueIXinA/8fwES
         +ip++HcTXYIaRrxWDt2N9B94Wg1FamWJqDuevei49ulczKWA+sTeA+1qAe9vqWGTy4oz
         Rt21TXgy6SqK/ZofUUfCcXyDobk/ylRzxdnrTVHV/758pKrcRH3aa1594pp4PEBxP35i
         hhEMw4J6XEEP4XZlAgEsgWfQsVje6WqSn9ubfV7TXPVrLhMYJzlc6xD9zEiPvc5lFjbo
         o4aw==
X-Forwarded-Encrypted: i=1; AJvYcCXfrsPLRQG1eOOaGx1qdiM+st3dQCfNHo/UYGqE/lXzBl1jK8D9qlA2p1d7OmOQOH1ppEmt2KOH5TM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzKRUgSnJpk8gJLeRlUdwKwF+nX4ouzjwQlObOm6FtgyTofmsV5
	Gb2CDQ5JtopwygGbGyfoLSudNRPILYdVoUMYH0RRuRzPyy3k4do0xpI3N6+AArPV8uEgZHEKZfc
	oN07TQd8=
X-Gm-Gg: ASbGnctzVmj1zCsbB9pMxX9TQkIocTZ7/c2n39byA80bNvT6J7OVGS5LSyvuRI4FWA1
	qVVX1nkU6DVRZh3A8GybHO+zRQd4zhgpgkku8v+y+zHoXs5CEdHiCEjbzM2sZ9gKW0PY/3doKWP
	MHKfLolb8egAXRAzKAvQ6rQBiWz7J1BQ9DM7wX+zNuStWuqwfjPvrJ3ZVG3Hx1W204D5f86H0yn
	aPmOfYyDR5UjMHChoCYaXjg/OpJUKfQVOOKle3u9/UgST7oSoZtmnPjL8SDexZuqVX0hbpJ9Nfd
	px6HhuhKDe8+Wns6JaJn5fgjN+YG2EghzQgGdxbY9HM7rHBXEknUxcBcv8/S0hoISyc7ou6V3BA
	9jrGwLByItPXWVyR6kkQAQc7l
X-Google-Smtp-Source: AGHT+IERpRPEc12mV955tvnuQoeNvkZUC+MN7EtTp3JKXd3eHnM2oBc0U3F0kWPqnL99WZIdHZ+AuQ==
X-Received: by 2002:a05:6e02:1d9d:b0:410:cae9:a089 with SMTP id e9e14a558f8ab-42481922e1cmr116891435ab.2.1758400751055;
        Sat, 20 Sep 2025 13:39:11 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e429f3sm3768486173.74.2025.09.20.13.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:39:10 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: iommu@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: jgg@nvidia.com,
	zong.li@sifive.com,
	tjeznach@rivosinc.com,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	tglx@linutronix.de,
	alex.williamson@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr
Subject: [RFC PATCH v2 14/18] RISC-V: KVM: Enable KVM_VFIO interfaces on RISC-V arch
Date: Sat, 20 Sep 2025 15:39:04 -0500
Message-ID: <20250920203851.2205115-34-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250920203851.2205115-20-ajones@ventanamicro.com>
References: <20250920203851.2205115-20-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_133912_036313_C5562211 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Tomasz Jeznach <tjeznach@rivosinc.com>

Enable KVM/VFIO support on RISC-V architecture.

Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kvm/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 5a62091b0809..968a33ab23b8 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -30,10 +30,12 @@ config KVM
 	select KVM_GENERIC_DIRTYLOG_READ_PROTECT
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
+	select KVM_VFIO
 	select KVM_XFER_TO_GUEST_WORK
 	select KVM_GENERIC_MMU_NOTIFIER
 	select SCHED_INFO
 	select GUEST_PERF_EVENTS if PERF_EVENTS
+	select SRCU
 	help
 	  Support hosting virtualized guest machines.
 
-- 
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
