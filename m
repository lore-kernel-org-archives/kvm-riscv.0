Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4905CFC617E
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 15:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8CcxYiF5z33u8bPwUS79vZNID6fCcqCScFWt73HZuAE=; b=QHEoNsAwf283EH
	TuGANxIRDPnePzufNA0P8JPEInc+Tgwxyyo3RFDvKrwYZAjXmOu0+t72aoxNdeE2B301NNaq0hmTd
	CawjOepe24wfbKDcE72OHaj+F2Er4UrB6tfGdYUtfeahh8OYOFZpfkiSSXi+D7u1tOKWZU4dbB2es
	scRzYojGqD+7h9m9A5UjwkvzAFvcYcWDqJ2qNhQr4J3EcMkPpmS15P2ngsuLt4mS9vQg1imgCoWGY
	xMCR5zOpH17jq8nwV7CZsjDfP+AUiMc737ECMlvwOHR5E7wIMGGzn4/fjH9pjgngdxr3ZwYS+XUzN
	8jYEsxfH0jNLYTFlXhgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Ue-00000009Qz3-474o;
	Sat, 03 Jan 2026 15:24:41 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vc3Ub-00000009Qvr-041e
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 15:24:38 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-34c3cb504efso14550184a91.2
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Jan 2026 07:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767453876; x=1768058676; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N9tqN72DnRW3gbfss4TAn1MPl/pI0d3sx5WMZWESXiU=;
        b=HGOywvYx/jWil1TJGfm7H1q7DiLTX0UFzObzE2csPaZxi+GA5ou08KtSIujRmoQrwt
         GfAXe3+g2Z876TPMFNatO8vTMBrT0mLQxXSYHHjzWx5OzdL/Emu3nQ0vV0kakvoudjvR
         V2lRRkaumprY8tT6TnVg8tKvOXV2b/U0vwq99KnSLlQWdi+zmPX8nW9RZ+nQvFwA8Xit
         z9Aqn1g2PKVpNPdqt4MAJ6dA6h50pijCzb2+0i3fZe5TSxUdK38IAEu9dFB4xPImuJeW
         9IGomcGyGnT1l+GNoEBdpVhGzoAxY1ZuW2hFCtkeZAH6OZ22cKXdC8UFnGjpMUph0boq
         7Oag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767453876; x=1768058676;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N9tqN72DnRW3gbfss4TAn1MPl/pI0d3sx5WMZWESXiU=;
        b=RUyg02P+APAVJnO10/ZZiAHfCW+gU3aXrqwNDC9M3Jr5CKb6mwrypm6C1pYLWMbWTP
         303fA9wuQ8CBrtWdYlpiIMor4ET8aXPH5411WgVrQKxxskZWYy30bskshoo6Q7ZDLKze
         OIhSdrf0PzKTPaeOkTgiIJufha6BHya6hPbrCytvANRSNMc+5Shu8Zri/+HnvDSjAers
         GDFuIofJ11hRN/De3wIPENLju7CZkAMI7r6eanxBWPr9WKROsUvNyuMzarPgf5W5s7ZL
         DPDHid6bZg7+nGo+I5PRNKdgJFOUSWlLiBAynCyoC8I7R9i0O55LSIi6x7S90W1FMLEb
         1mew==
X-Forwarded-Encrypted: i=1; AJvYcCW6mTVFd3PR0f+lR5hpOwsr1MGTiJAdZ+fpdhXtSZ1qf8t5EYL6XHGSrBaI6Z75QzxDyAcdy05U67o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxbn0B3T6BKraZGE7P/xUxL00QYI3Rb35NZ9z3F33d/+B1pFoNN
	mvANrjyvpyzZ27vYqzZR5WRd5sxOJslmR+LJ7znWcZe+g1X7F4PSBqvh
X-Gm-Gg: AY/fxX6zUT9B7er/0YHpg1jBMkUp0kF5EYUKo1/rtfRoDgihFvLmjIsftlBmAVmQ4Ge
	tVNWmLpueQKHe8pYwOFQQEZ0X8MFxofZL6eme6TJ1Em0PiwqIsGrrnsh8zgqKvlCI99g/4KjAUt
	0fysGpyccbk7rYJCqAVPZV7t3TyUNIQv8HLsZGmxnBe0RYcFHfq64PPm1sKbk1e+Hfbaf+7szde
	w63JEFIrg5FSsokpF+9LLwjDYV5KVB2JUR0kuYI4QTQWecNX0PNdipkEiAT5sEmtrPlAZdSwshV
	n007tGiPeHoR9X8o8UJMdG9+p3XK/0qCl/jVbSSnGx5l/4HeOznKU7xbblH2e1zTgXGS42zgtDF
	cEcEgJQJnJtmsknNGLmv/ItU90TkN96gZPQ+A0D2LMxvPE9pZhqeorzhn6FnZ0KZu8qsHiwLNgR
	vJHYisURVQySITApN9F5dUgVtl505lRuVyfuU0DSK0uMTuS6fWMijneszKnUjVpKNhATo3btpqZ
	+s=
X-Google-Smtp-Source: AGHT+IHlInhhJ3xFCCOgA3SiqoyGe4GrNPNHAy5HiMlXuyqZ/J0ImxaOeRtEIO78Zh6IdYlfYS5myw==
X-Received: by 2002:a17:90b:54c8:b0:340:b908:9665 with SMTP id 98e67ed59e1d1-34e921ed466mr39711928a91.37.1767453876082;
        Sat, 03 Jan 2026 07:24:36 -0800 (PST)
Received: from localhost.localdomain (123-48-16-240.area55c.commufa.jp. [123.48.16.240])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f4770a256sm2107802a91.12.2026.01.03.07.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Jan 2026 07:24:35 -0800 (PST)
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
Subject: [PATCH v2 3/3] riscv: suspend: Fix stimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 00:24:00 +0900
Message-Id: <20260103152400.552-4-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260103152400.552-1-naohiko.shimizu@gmail.com>
References: <20260103152400.552-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_072437_095484_79BB5721 
X-CRM114-Status: GOOD (  10.40  )
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

Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>

riscv: fix timer register update hazard on RV32

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
---
 arch/riscv/kernel/suspend.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index 24b3f57d467f..aff93090c4ef 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -51,10 +51,11 @@ void suspend_restore_csrs(struct suspend_context *context)
 
 #ifdef CONFIG_MMU
 	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SSTC)) {
-		csr_write(CSR_STIMECMP, context->stimecmp);
 #if __riscv_xlen < 64
+		csr_write(CSR_STIMECMP, ULONG_MAX);
 		csr_write(CSR_STIMECMPH, context->stimecmph);
 #endif
+		csr_write(CSR_STIMECMP, context->stimecmp);
 	}
 
 	csr_write(CSR_SATP, context->satp);
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
