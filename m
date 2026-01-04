Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D765BC2A075
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/BJ9tGZfLr7yfpE0DQCAgS5VTAAfVxeuTbpOP9QiBuA=; b=LFIDsTNK6cdNV2
	CNnnAXYHdoHjo1sVXXjPiHTvcNO6dJPVDXQyscSBYtutbp/mQ880r175i7NqHsnLwfMZkWSSQfykr
	TMTiU3EEOEBg/NFTa9aIr95ErOC6JGsTAYUscqQ/nj/W452blfysQuPenYKDwk9BJ9P9PIkB6JjAP
	53ZZEau63oIyMeitc/tvR42+cOEvZFw4cx9uYgyEEUg0JVh59Vhy/olDisacFA/NAzlv+VeHtn6os
	HN3EZOV23csVLHwz60evuQMwItpTr710R8kZMsWdI8W2NVcL5jw+2jtDZ9wsWN2UtQS1FKYrz0EEW
	ogGwgkgvDery5dl2FZRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeV-0000000AH5r-2OCJ;
	Sun, 04 Jan 2026 14:00:15 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeS-0000000AH4b-3UW6
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2a09a3bd9c5so117984185ad.3
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535212; x=1768140012; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uKC0H97nVlNsmqfTcj9M3djnqsg1WIKTEJ/Ie/Lsi00=;
        b=U//YoWGyanXT8HJR+PI/odvAw/GMcDZ8DulxddnHBd5fwI5AN2/NGeU1RJqivxi8hm
         ol2fhK9/P2Mu3NJI2PxueGTWP8D/rtb4EIIxI3zh7DtIE8QnVR4QzpJDaVGTOFMfDNM0
         d4PbYpjyrmUDd/TD48ojDPyGR7wHGNwwUqO97T6iA/2aBvOxeR95plZ4EdBB+CdJemwT
         JW1q1B97BuE1L16v+sgxBtxBNSz4aDGoN+nonTr69QuMVyk217UR8M8fMoT7CWPPSDOs
         LkdaUg6FslQWvz3WonvgzY1oF9a/rlPWK6Dc9NGtctbIA7C+yv3msCF+TnfZEYIHDT/Q
         /52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535212; x=1768140012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uKC0H97nVlNsmqfTcj9M3djnqsg1WIKTEJ/Ie/Lsi00=;
        b=NsE14I4Z0UOntAut8geJ2hQFj6PX7p/CFDVaWzujMhi8nMIRopkMohEdSOTL1aMEVb
         aANtqA0LwPcIf7q/blGKcrdfWM7LsBPc5vvRcZHomTQKiALKCDPm0KU2eaxkOcjnugej
         YhfS6vG+gz/kc23s7s7j0LmOt2S1zGYZQ+YoyryS+3gUDou2Hgtj2wDKNcRX+Z49ZcqX
         478x/SAcU7Qc0qtRxs62Bz9sYRXOA1qXD8AWrySu/gemmnKWfKiDCL7+0MmwMdhZm1Sc
         K2wEMf1wUorgZd2MktVnKLG9w6J1ATqqfKSIpwzcBtLeunu1Imr7vLcNgydJgcvlCdf4
         GCCA==
X-Forwarded-Encrypted: i=1; AJvYcCUTRthOwd2tN4+MVaYdd/EEDONnG+BeW430VUtn7HTtbjVxPtGAZgNgdDTgAmno9Mxvr8aedx1ak4k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzfhl1koq2Whmy2TVnxrpr5CV8toxmLnALLA/0PQaF8idIL8q+G
	P6hrghDzfz1nRiBW4RLx189geOOuTVScKa4VGCkMs4mtQUezOAgxyWAP
X-Gm-Gg: AY/fxX5+h0EuPDj+k981mquuewEqC8dFO/9ia7odYAOXk90TgbfPzvBQM7akdzhcvKX
	HTO+5x+dpFsUBFKdHJTMS9pfgYp5Pb97EJNrNRYx739H5yMwRJZZoeurHBFzhoPlffLUiD+uWj6
	JzNoedRZ+/6si8eje24upImm7Txs1pJyzthcEtsoidqhOk5krMFmPT8X4JfRYyENu4Z4HsPI7Ag
	KXqpI8+Hqei9YEesRxV0ENNv7xqd4qqX1/Gdp4zYrOTV5wcvBfhbFQgWzq4BQGdMv/YeAOBqo5W
	9Ovm1XBacsthxQVN9Ee/y/n5SjtoIIJ61lT9e/+pWH/CtKZJPh7n/mkN5p05Q1Ml1qsrrS387En
	2XLWvi3OZvqmIijyYgFAzCFF5ai7piPL/2MVSjx++Phoe2ymOk9LPk1fw0P7EZf/j3w3GQ7rF2F
	lsNFc86FAndXq2V0E5Iq3XZ/Gq8o2sx/7cfe2zwTMSZmXHiiPbcTBILEwUA1IWpfP/
X-Google-Smtp-Source: AGHT+IFWhEWVgZjHasmxigK04Dcv536ZNizp8RTdkFnv5HseXa6ZLIKf5NEo+F1Jf/zNHtSMHWTSZw==
X-Received: by 2002:a17:903:2345:b0:2a0:d629:9035 with SMTP id d9443c01a7336-2a2f220cebfmr462612735ad.3.1767535211800;
        Sun, 04 Jan 2026 06:00:11 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:11 -0800 (PST)
From: Naohiko Shimizu <naohiko.shimizu@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	atish.patra@linux.dev,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	nick.hu@sifive.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Naohiko Shimizu <naohiko.shimizu@gmail.com>
Subject: [PATCH v3 1/3] riscv: clocksource: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 22:59:36 +0900
Message-Id: <20260104135938.524-2-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060012_917451_A207C3D2 
X-CRM114-Status: GOOD (  11.16  )
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

On RV32, updating the 64-bit stimecmp (or vstimecmp) CSR requires two
separate 32-bit writes. A race condition exists if the timer triggers
during these two writes.

The RISC-V Privileged Specification (e.g., Section 3.2.1 for mtimecmp)
recommends a specific 3-step sequence to avoid spurious interrupts
when updating 64-bit comparison registers on 32-bit systems:

1. Set the low-order bits (stimecmp) to all ones (ULONG_MAX).
2. Set the high-order bits (stimecmph) to the desired value.
3. Set the low-order bits (stimecmp) to the desired value.

Current implementation writes the LSB first without ensuring a future
value, which may lead to a transient state where the 64-bit comparison
is incorrectly evaluated as "expired" by the hardware. This results in
spurious timer interrupts.

This patch adopts the spec-recommended 3-step sequence to ensure the
intermediate 64-bit state is never smaller than the current time.

Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 drivers/clocksource/timer-riscv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4d7cf338824a..cfc4d83c42c0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -50,8 +50,9 @@ static int riscv_clock_next_event(unsigned long delta,
 
 	if (static_branch_likely(&riscv_sstc_available)) {
 #if defined(CONFIG_32BIT)
-		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, next_tval >> 32);
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
 #else
 		csr_write(CSR_STIMECMP, next_tval);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
