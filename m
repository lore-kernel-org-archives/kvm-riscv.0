Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC411C2A062
	for <kvm-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 14:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q9I56UNzaWkfDYW6XIGW7mpJ8WnYi4K0C6U8aGoG+MM=; b=qXtKz38UbVRY5m
	LWeqkCMB6c4N9MOFyT0n4Pofk9TJWInQUxFP8dR/3S0hfyMX3Stznhj254csTa86HQO9fWB077oHA
	vGVcXic5NEg20q7CbyVw0AN7RBzh+ECxpg4KPxboRV5AwpQUuk0z4PZ+JcY3Tbh0TrHqckE9LiAHH
	VLQO9qTj49rSjmHlOsZhNbejPBi8PIj1vvF6hBo+bsrl913LXy03dAHqW3YjiVQLGKKJvW1To5I+K
	kLZcUC4p9K0/qkWZeQ9QHzbjE0JId+TCpDbaZlskJfuZZKn0OVBfckogZrbzEaXvFYuFmBknquFvC
	XHSfagVianLOKlr4lMOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeZ-0000000AH87-2AKs;
	Sun, 04 Jan 2026 14:00:19 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcOeW-0000000AH6c-2jwp
	for kvm-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 14:00:18 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso136438865ad.1
        for <kvm-riscv@lists.infradead.org>; Sun, 04 Jan 2026 06:00:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767535216; x=1768140016; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKWm2q1i1+0+Z99C46AW9QGvFUwK/OoedXO5dcU1Nq0=;
        b=A4BLM2Sp0c1tHr1z5B9aUCCCi/Ul+vF5izONGD14fGm0hQLUpeX5SD0ncBHj8qRRFw
         SPEQ4VUSs3jJxhMqWujpJpBOnC30GteztPUWD00oMi3XbDCrEAvfXIXUQIAX0rB6eD7v
         XAGBNtRs1pLVjkjJuICUaFKOdeZfwcZw3mCQlvAsa8YNxy9mDuzkd2WqOf9fruEa9QuA
         30s4q5KnHzdJBG/NL9aoIy264d2PSFIppOmwoLiMyfmj82PQDAEyOXU7Le9smrZhwT5x
         L94rGm7pdY7q4kwrixjRB941BYgsdyOhJh4dZ4PZjTKRAUolidX36JvlCCIOZHYoDQ2P
         JNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767535216; x=1768140016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKWm2q1i1+0+Z99C46AW9QGvFUwK/OoedXO5dcU1Nq0=;
        b=CUSuqR4Jrf1MDlUjfS1Ly3jUP6H3/0Y+MRWm9seevgeAJPakfSLrmZddcVlZgvYyKR
         6iChdbm2uOc+828Y9rciruXck4YBkHE2XmRAKXX+TebYTqMpj7s+nu4wK78uS9N0gsyU
         SZwkOTdGgarfyB71Il5I4QvixHeXof6TeL+fXqBoverBLdhIgmhZ4Jxn/1z93BwtLZev
         iT4XFAnZ3qXoT6HknB3LuMJrN7JQY/6ONCoizIq1pZnjNU3VWaznFSBUhukS4qrqvRF/
         +NzmA/PGNaGwPU2WWUCimi4/gnkde/JiYn9rZl/2C0uW7IoJY+Ibj+PiK4HW2DI4OL8U
         Lb1A==
X-Forwarded-Encrypted: i=1; AJvYcCUHpw7PpQiU7t9fr34jzPV2gUq67R4R3y7y48C2cRXXiwvF32Yjz/4mdPJud4MlIkQNCmDzrSJjNDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxS/Q/YRMN1ABiGGcKXsxgYgGAgIh0CO1Q8REaNqn/J4F5tLmgr
	XTRiyspFEjI9uvRCb0l4t4/+VEQF7q9sWTdi/IYh+SR9gknsCVsSXGQ7
X-Gm-Gg: AY/fxX6rPSxxhpkAw+cEt42+/HSbzjNLKWZH+73lgxVHZXfl3GOv38gNt4R8MeauD11
	rJxGwLCrD5AZ3L8nY9czVipZVVOma6Oi+uUuNNG64H9kpWQm5HR15v3ZXHsOMq48tMMe8qIkUCm
	Es9pIdS2YyFWIOxiZSUl9aAthpnVnDBowhttpBIwP/R/DXPusHUXAeGTio6ScmuxiRLec0303ZL
	s+E5y1VNPsgbgOPVa/F9Q6dbF43dm75ZasSAXfvgjTtWYo5E+vYp7lywhRccYtFoseS6W4474OY
	LhDh5Z04NBQTOc5J4kiptEgYEXeD1gqbjp10STNSvlgBG9HzrNwnzEA0Ed0DfTNNLtQgwDJDtoP
	/3wWIloAz6gcTA/QbiSgxSKW1zq3Ld6ZAcTblpskWCVYL4szYtRBDminwtmCJsp+xTrCE3IA6wI
	RgWU+B+24yNVRahAjpEebYZVwpelkTE5YyiFw5GmD/re4msEQnIg98lJlSj6i1bc4G
X-Google-Smtp-Source: AGHT+IFmQkAn76a6jPoUFSWskVsApd4EjT9EaQS9Lmch2wXWsdjxCu1JoZ0JGs1XSVlb+dqOkzOctw==
X-Received: by 2002:a17:903:32cf:b0:2a2:dc3f:be4c with SMTP id d9443c01a7336-2a2f220d883mr423015965ad.10.1767535215342;
        Sun, 04 Jan 2026 06:00:15 -0800 (PST)
Received: from localhost.localdomain (g163-131-201-140.scn-net.ne.jp. [163.131.201.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb25sm432327535ad.56.2026.01.04.06.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 06:00:14 -0800 (PST)
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
Subject: [PATCH v3 2/3] riscv: kvm: Fix vstimecmp update hazard on RV32
Date: Sun,  4 Jan 2026 22:59:37 +0900
Message-Id: <20260104135938.524-3-naohiko.shimizu@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260104135938.524-1-naohiko.shimizu@gmail.com>
References: <20260104135938.524-1-naohiko.shimizu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_060016_699529_100C0151 
X-CRM114-Status: GOOD (  10.92  )
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

Fixes: 8f5cb44b1bae ("RISC-V: KVM: Support sstc extension")
Signed-off-by: Naohiko Shimizu <naohiko.shimizu@gmail.com>
---
 arch/riscv/kvm/vcpu_timer.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_timer.c b/arch/riscv/kvm/vcpu_timer.c
index 85a7262115e1..f36247e4c783 100644
--- a/arch/riscv/kvm/vcpu_timer.c
+++ b/arch/riscv/kvm/vcpu_timer.c
@@ -72,8 +72,9 @@ static int kvm_riscv_vcpu_timer_cancel(struct kvm_vcpu_timer *t)
 static int kvm_riscv_vcpu_update_vstimecmp(struct kvm_vcpu *vcpu, u64 ncycles)
 {
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, ncycles & 0xFFFFFFFF);
+	ncsr_write(CSR_VSTIMECMP,  ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, ncycles >> 32);
+	ncsr_write(CSR_VSTIMECMP, (u32)ncycles);
 #else
 	ncsr_write(CSR_VSTIMECMP, ncycles);
 #endif
@@ -307,8 +308,9 @@ void kvm_riscv_vcpu_timer_restore(struct kvm_vcpu *vcpu)
 		return;
 
 #if defined(CONFIG_32BIT)
-	ncsr_write(CSR_VSTIMECMP, (u32)t->next_cycles);
+	ncsr_write(CSR_VSTIMECMP, ULONG_MAX);
 	ncsr_write(CSR_VSTIMECMPH, (u32)(t->next_cycles >> 32));
+	ncsr_write(CSR_VSTIMECMP, (u32)(t->next_cycles));
 #else
 	ncsr_write(CSR_VSTIMECMP, t->next_cycles);
 #endif
-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
