Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE5CC369DC
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 05:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDhLf+J2319FRHpYeJkBKbs+f1B1L8Hh5j0GKrfPpIE=; b=pRQ1JvDcDAbCyT
	bDUSCKKAcQ4oZQQoq0O9DHq7SAxMeuhAnwlcIQp9KLVJV9zTKSP4F9lZDLR9bBKLKIr2F4drOHkuF
	GZdYa4Tdk59GyyFXOpzbNBZQH2SuPD6f+kiefb9QON2BWq/vhOtCIYHg197vWbIlxSw2NdDFRcdEl
	KgOoef2mixOX7tofZgL4eNhVekoLDvEKlKcftX628/EEi4GqVTrOJMdW3UglybOLW5CFJQ4Xd6x1/
	5pM3h5jGauo3C5aRAbbv/uGzm46lA4xjJk05DGfaY0lQ7SXCg8GhVu3ouJ6NH1zaSLYa5g4pBkW+W
	HA4Zy/f/Lknll71YvyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9znz-0000000Bj5D-1Xjg;
	Wed, 30 Apr 2025 05:16:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vAK-0000000BHz5-2OKp
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=HzFnMDKxDRe5ptrjbu29rP2FmnodbvAdzA5LPi8A4Ws=; b=MS3tD2fNNv7nJSL0YtJyV1R1Bs
	kTVEyXbgJzj+Qo5phjZOFBBQtf4ADXhs/0f98cDemTcNln9kiX+u2Q7r0vdWE0rkR3cL945hZ4L2X
	yKmIQxIyRPKyUQCiHcsPzkUv0uJ9cPD1YBrpMmHR3d/q+qeMzONLMWYuejsY1le6Mv5aDX56nqVcs
	QLjMsQth8GStGPqSihMME2gW4ct+Z9PRjb0WFOcbBROI9YtpaoUfiuiEnMWjLLsiLHS+9EAeQVnAJ
	SthOSDzRAF6n6BdRXbOTrOZIbi+O3tqYf5AfK/hEFkZdwk1Xa5Ttl/PWfcGL9HGAemFldHxHbgCEM
	E9DqvS1Q==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vA8-0000000DYKX-2HuO
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:19:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-223f4c06e9fso4009075ad.1
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972333; x=1746577133; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzFnMDKxDRe5ptrjbu29rP2FmnodbvAdzA5LPi8A4Ws=;
        b=l5EumbOdfFNaGA4DJaMeLRicL2cea6sTZ6wj30IfElc8ngCMTD4OgOQYMN71N1tic0
         y+G/O5OCmu4LzGq2+yzvJ1hMPh0jzeVLXq5ldhayyHikA32dUXnwMWwBCNx5pvrcGhVc
         M5T2f1SOBMButhCHPc3IdPiVH+Pz4S+/pTdq3GSept/aNfhuE2NLbVO0d9xQTNG9HSsT
         beTbnbPCp8qXs27/4cw/xwvf2HwNDG0rF0Za6+z987mE9xMOgx8Qkad9SANFVlLMHoCI
         Lm+dm1Fx6Yhxq3RsM5XbGWTsg/ZOkkaAlrasK/uKP6hT0xH5j4MnBks3SufS56pIKHsB
         cNyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972333; x=1746577133;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HzFnMDKxDRe5ptrjbu29rP2FmnodbvAdzA5LPi8A4Ws=;
        b=U6IMusLPccDQCJ1vhn6kyv0bDxvAYNGx6btixl4FSENI3t88FWCQ7QaOz72nkwJQyJ
         c1UQywzEP/a95NcSmAHvf94hleTxCGDIAafL68gDLd5P+szBBdQulZWhcCSraBvSNzFZ
         IBEZbbp1IMAgFiaE+ALAB1sgk5zfm7ZSecO5Stu3b2BEtu1AJfbLZnGHn1lyxGmPEh4C
         cR9l9SVMFt5q+MaFI0xw8gO2N7/2zxbyq/UFbegIVdLYYHpdxp1F9JwB7vyD43oNIyJa
         lVoXOXTeGTYOLv26VakHohIrzvwhkhe7YyeI9UDwuENLKqT9MHhpSlKVyQIRhoEUlzEo
         tUGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwiPxfN2GUZJwhIGFfzf1NVg1iFJEjqdCgt9b85WWwElGwSFXI+fqO9G7ErsyvSCO/P2zTxCFLlGo=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywt+H5BF+2QtsH94zumhE1wYG6Eu2DAMRezzmjppN4dPhuDdHOh
	A1Hhrob99SEyxh8XXYpN6JlHWveY6i3XQWWGEyRNMq/55q+RYpVaSTqzvPhvnng=
X-Gm-Gg: ASbGnctulX/8+fwBfivwCDOAovRrSPqs0jPvtcBSIDYEMQirDjGf3cyi34SjkISYDe1
	igTHRTCOpwyn2YwFmfqxrqaFg6kw4TqS3AMWGDZP+65WsogvMRsG0A6IfBCQ+wI75D02gvjGxn2
	XLKJHnz5n0NeMzwj1I0qYFFWbaQzagiJFoP8Olz2k7RzS6xdu581ddfSx/pbX3++IN2IGfF159t
	tOQjGBDc35x/xK9eBLkBkxWgdo7nqDZZUQFV1kPMslsyEtu18new7WMjZW/r9pm4HjBSioxGIrB
	ZRsWlso8LGG50O6LJ/Kb2d4tASjhK976nh6HpkEyhjssZ/LwnZJkDQ==
X-Google-Smtp-Source: AGHT+IHZ4bXOCLBk1HNkU29TPfhwANakA0aDa7Ppfdx6LhdeljekYFvEKUGr3JIdqCo3Zpa4RxJbKw==
X-Received: by 2002:a17:902:ce82:b0:21f:58fd:d215 with SMTP id d9443c01a7336-22df4787428mr10314435ad.11.1745972333526;
        Tue, 29 Apr 2025 17:18:53 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f68988ca4sm1907790a12.74.2025.04.29.17.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:18:53 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 29 Apr 2025 17:18:45 -0700
Subject: [PATCH v2 1/3] KVM: riscv: selftests: Align the trap information
 wiht pt_regs
MIME-Version: 1.0
Message-Id: <20250429-kvm_selftest_improve-v2-1-51713f91e04a@rivosinc.com>
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
In-Reply-To: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_011856_833935_F8843BF8 
X-CRM114-Status: GOOD (  12.34  )
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

The current exeception register structure in selftests are missing
few registers (e.g stval). Instead of adding it manually, change
the ex_regs to align with pt_regs to make it future proof.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/include/riscv/processor.h        |  10 +-
 tools/testing/selftests/kvm/lib/riscv/handlers.S   | 164 ++++++++++++---------
 tools/testing/selftests/kvm/lib/riscv/processor.c  |   2 +-
 tools/testing/selftests/kvm/riscv/arch_timer.c     |   2 +-
 tools/testing/selftests/kvm/riscv/ebreak_test.c    |   2 +-
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |   4 +-
 6 files changed, 104 insertions(+), 80 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5f389166338c..1b5aef87de0f 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -60,7 +60,8 @@ static inline bool __vcpu_has_sbi_ext(struct kvm_vcpu *vcpu, uint64_t sbi_ext)
 	return __vcpu_has_ext(vcpu, RISCV_SBI_EXT_REG(sbi_ext));
 }
 
-struct ex_regs {
+struct pt_regs {
+	unsigned long epc;
 	unsigned long ra;
 	unsigned long sp;
 	unsigned long gp;
@@ -92,16 +93,19 @@ struct ex_regs {
 	unsigned long t4;
 	unsigned long t5;
 	unsigned long t6;
-	unsigned long epc;
+	/* Supervisor/Machine CSRs */
 	unsigned long status;
+	unsigned long badaddr;
 	unsigned long cause;
+	/* a0 value before the syscall */
+	unsigned long orig_a0;
 };
 
 #define NR_VECTORS  2
 #define NR_EXCEPTIONS  32
 #define EC_MASK  (NR_EXCEPTIONS - 1)
 
-typedef void(*exception_handler_fn)(struct ex_regs *);
+typedef void(*exception_handler_fn)(struct pt_regs *);
 
 void vm_init_vector_tables(struct kvm_vm *vm);
 void vcpu_init_vector_tables(struct kvm_vcpu *vcpu);
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
index aa0abd3f35bb..9c99b258cae7 100644
--- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -9,86 +9,106 @@
 
 #include <asm/csr.h>
 
+#ifdef __ASSEMBLY__
+#define __ASM_STR(x)	x
+#else
+#define __ASM_STR(x)	#x
+#endif
+
+#if __riscv_xlen == 64
+#define __REG_SEL(a, b)	__ASM_STR(a)
+#elif __riscv_xlen == 32
+#define __REG_SEL(a, b)	__ASM_STR(b)
+#else
+#error "Unexpected __riscv_xlen"
+#endif
+
+#define REG_L		__REG_SEL(ld, lw)
+#define REG_S		__REG_SEL(sd, sw)
+
 .macro save_context
-	addi  sp, sp, (-8*34)
-	sd    x1, 0(sp)
-	sd    x2, 8(sp)
-	sd    x3, 16(sp)
-	sd    x4, 24(sp)
-	sd    x5, 32(sp)
-	sd    x6, 40(sp)
-	sd    x7, 48(sp)
-	sd    x8, 56(sp)
-	sd    x9, 64(sp)
-	sd    x10, 72(sp)
-	sd    x11, 80(sp)
-	sd    x12, 88(sp)
-	sd    x13, 96(sp)
-	sd    x14, 104(sp)
-	sd    x15, 112(sp)
-	sd    x16, 120(sp)
-	sd    x17, 128(sp)
-	sd    x18, 136(sp)
-	sd    x19, 144(sp)
-	sd    x20, 152(sp)
-	sd    x21, 160(sp)
-	sd    x22, 168(sp)
-	sd    x23, 176(sp)
-	sd    x24, 184(sp)
-	sd    x25, 192(sp)
-	sd    x26, 200(sp)
-	sd    x27, 208(sp)
-	sd    x28, 216(sp)
-	sd    x29, 224(sp)
-	sd    x30, 232(sp)
-	sd    x31, 240(sp)
+	addi  sp, sp, (-8*36)
+	REG_S    x1, 8(sp)
+	REG_S    x2, 16(sp)
+	REG_S    x3, 24(sp)
+	REG_S    x4, 32(sp)
+	REG_S    x5, 40(sp)
+	REG_S    x6, 48(sp)
+	REG_S    x7, 56(sp)
+	REG_S    x8, 64(sp)
+	REG_S    x9, 72(sp)
+	REG_S    x10, 80(sp)
+	REG_S    x11, 88(sp)
+	REG_S    x12, 96(sp)
+	REG_S    x13, 104(sp)
+	REG_S    x14, 112(sp)
+	REG_S    x15, 120(sp)
+	REG_S    x16, 128(sp)
+	REG_S    x17, 136(sp)
+	REG_S    x18, 144(sp)
+	REG_S    x19, 152(sp)
+	REG_S    x20, 160(sp)
+	REG_S    x21, 168(sp)
+	REG_S    x22, 176(sp)
+	REG_S    x23, 184(sp)
+	REG_S    x24, 192(sp)
+	REG_S    x25, 200(sp)
+	REG_S    x26, 208(sp)
+	REG_S    x27, 216(sp)
+	REG_S    x28, 224(sp)
+	REG_S    x29, 232(sp)
+	REG_S    x30, 240(sp)
+	REG_S    x31, 248(sp)
 	csrr  s0, CSR_SEPC
 	csrr  s1, CSR_SSTATUS
-	csrr  s2, CSR_SCAUSE
-	sd    s0, 248(sp)
-	sd    s1, 256(sp)
-	sd    s2, 264(sp)
+	csrr  s2, CSR_STVAL
+	csrr  s3, CSR_SCAUSE
+	REG_S    s0, 0(sp)
+	REG_S    s1, 256(sp)
+	REG_S    s2, 264(sp)
+	REG_S    s3, 272(sp)
 .endm
 
 .macro restore_context
-	ld    s2, 264(sp)
-	ld    s1, 256(sp)
-	ld    s0, 248(sp)
-	csrw  CSR_SCAUSE, s2
+	REG_L    s3, 272(sp)
+	REG_L    s2, 264(sp)
+	REG_L    s1, 256(sp)
+	REG_L    s0, 0(sp)
+	csrw  CSR_SCAUSE, s3
 	csrw  CSR_SSTATUS, s1
 	csrw  CSR_SEPC, s0
-	ld    x31, 240(sp)
-	ld    x30, 232(sp)
-	ld    x29, 224(sp)
-	ld    x28, 216(sp)
-	ld    x27, 208(sp)
-	ld    x26, 200(sp)
-	ld    x25, 192(sp)
-	ld    x24, 184(sp)
-	ld    x23, 176(sp)
-	ld    x22, 168(sp)
-	ld    x21, 160(sp)
-	ld    x20, 152(sp)
-	ld    x19, 144(sp)
-	ld    x18, 136(sp)
-	ld    x17, 128(sp)
-	ld    x16, 120(sp)
-	ld    x15, 112(sp)
-	ld    x14, 104(sp)
-	ld    x13, 96(sp)
-	ld    x12, 88(sp)
-	ld    x11, 80(sp)
-	ld    x10, 72(sp)
-	ld    x9, 64(sp)
-	ld    x8, 56(sp)
-	ld    x7, 48(sp)
-	ld    x6, 40(sp)
-	ld    x5, 32(sp)
-	ld    x4, 24(sp)
-	ld    x3, 16(sp)
-	ld    x2, 8(sp)
-	ld    x1, 0(sp)
-	addi  sp, sp, (8*34)
+	REG_L    x31, 248(sp)
+	REG_L    x30, 240(sp)
+	REG_L    x29, 232(sp)
+	REG_L    x28, 224(sp)
+	REG_L    x27, 216(sp)
+	REG_L    x26, 208(sp)
+	REG_L    x25, 200(sp)
+	REG_L    x24, 192(sp)
+	REG_L    x23, 184(sp)
+	REG_L    x22, 176(sp)
+	REG_L    x21, 168(sp)
+	REG_L    x20, 160(sp)
+	REG_L    x19, 152(sp)
+	REG_L    x18, 144(sp)
+	REG_L    x17, 136(sp)
+	REG_L    x16, 128(sp)
+	REG_L    x15, 120(sp)
+	REG_L    x14, 112(sp)
+	REG_L    x13, 104(sp)
+	REG_L    x12, 96(sp)
+	REG_L    x11, 88(sp)
+	REG_L    x10, 80(sp)
+	REG_L    x9, 72(sp)
+	REG_L    x8, 64(sp)
+	REG_L    x7, 56(sp)
+	REG_L    x6, 48(sp)
+	REG_L    x5, 40(sp)
+	REG_L    x4, 32(sp)
+	REG_L    x3, 24(sp)
+	REG_L    x2, 16(sp)
+	REG_L    x1, 8(sp)
+	addi  sp, sp, (8*36)
 .endm
 
 .balign 4
diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index dd663bcf0cc0..2eac7d4b59e9 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -402,7 +402,7 @@ struct handlers {
 	exception_handler_fn exception_handlers[NR_VECTORS][NR_EXCEPTIONS];
 };
 
-void route_exception(struct ex_regs *regs)
+void route_exception(struct pt_regs *regs)
 {
 	struct handlers *handlers = (struct handlers *)exception_handlers;
 	int vector = 0, ec;
diff --git a/tools/testing/selftests/kvm/riscv/arch_timer.c b/tools/testing/selftests/kvm/riscv/arch_timer.c
index 9e370800a6a2..f962fefc48fa 100644
--- a/tools/testing/selftests/kvm/riscv/arch_timer.c
+++ b/tools/testing/selftests/kvm/riscv/arch_timer.c
@@ -15,7 +15,7 @@
 
 static int timer_irq = IRQ_S_TIMER;
 
-static void guest_irq_handler(struct ex_regs *regs)
+static void guest_irq_handler(struct pt_regs *regs)
 {
 	uint64_t xcnt, xcnt_diff_us, cmp;
 	unsigned int intid = regs->cause & ~CAUSE_IRQ_FLAG;
diff --git a/tools/testing/selftests/kvm/riscv/ebreak_test.c b/tools/testing/selftests/kvm/riscv/ebreak_test.c
index cfed6c727bfc..739d17befb5a 100644
--- a/tools/testing/selftests/kvm/riscv/ebreak_test.c
+++ b/tools/testing/selftests/kvm/riscv/ebreak_test.c
@@ -27,7 +27,7 @@ static void guest_code(void)
 	GUEST_DONE();
 }
 
-static void guest_breakpoint_handler(struct ex_regs *regs)
+static void guest_breakpoint_handler(struct pt_regs *regs)
 {
 	WRITE_ONCE(sw_bp_addr, regs->epc);
 	regs->epc += 4;
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 03406de4989d..6e66833e5941 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -128,7 +128,7 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
 }
 
-static void guest_illegal_exception_handler(struct ex_regs *regs)
+static void guest_illegal_exception_handler(struct pt_regs *regs)
 {
 	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
 		       "Unexpected exception handler %lx\n", regs->cause);
@@ -138,7 +138,7 @@ static void guest_illegal_exception_handler(struct ex_regs *regs)
 	regs->epc += 4;
 }
 
-static void guest_irq_handler(struct ex_regs *regs)
+static void guest_irq_handler(struct pt_regs *regs)
 {
 	unsigned int irq_num = regs->cause & ~CAUSE_IRQ_FLAG;
 	struct riscv_pmu_snapshot_data *snapshot_data = snapshot_gva;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
