Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAEC1C3ABAA
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 05:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AuW2DtjUpn7wZ0pJEdhz2ds3/EQodHrIGW5UE9ivVno=; b=j6oaDmlHqGOI3K
	/5AEfTSgOBXn8+Fr5hq6oi7X7+EgVXrC653Rq4c0zikeXJPWRtoBSTK4t+KZzHC8jDtcEe+b0r8MV
	YC8xBUonGaCo0yeI05ghVWLHs8CSnB0kUNgV3BHMhx47JnfEXxZba/dFfnPP6/4oCWrQuCCwZZa5h
	YuNL/eLV8b79NjticXEOk3RIFrYpBGem1b/ZMjUxeyND+LYAk0JDXveLETmjsWmRQ0elTppzdxbBF
	rLJbuSdy+ioVL1TKggt44/8PYorM9nRWHCh80cY/0+bkgle1o+K7kTn5kYBsqixvCxOkG/rCg2Z+Q
	XhtpE7Y6HpCW4X/6XUqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9zny-0000000Bj4c-2FkU;
	Wed, 30 Apr 2025 05:16:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9vAK-0000000BHz4-25gh
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 00:19:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=PXzfu17kptCXUybkiNKPVF1lS3Ix7IXO5RDr+gMnAkc=; b=KYPEcfyPbu8YprHpacx8IDwpRA
	Vcsxo+tx87/W1FNV6wSmQEuYTQkXY2AjdT58OH4KkM9FefE5hsRRtlKlAMoM9vxVhgnDgoqZMaB56
	AGarEmE7p2DC2y7WVif/7Aa74UlRu2VolNGfWKURe/ZzxJo9GcNyiyGJSVN/I26wbSrcbP633nonx
	HA7zR75fvmB1ZjPu79fv83HGbzZuxl9n/O28Xy2zYFHGegt+L1A0SjIOIHtw+IOwVEkcyr7ZrN6bx
	MUDiP0jOsVHjipgY8uTzWgUwLi+l8cIBCXmPqeXUwNf6EfKzm2IlqKe2fULJCfS7ZbgEC0Iv9aRI9
	Nc654oag==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9vA9-0000000DYKj-2g3R
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 00:19:06 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-736aaeed234so5554971b3a.0
        for <kvm-riscv@lists.infradead.org>; Tue, 29 Apr 2025 17:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745972334; x=1746577134; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXzfu17kptCXUybkiNKPVF1lS3Ix7IXO5RDr+gMnAkc=;
        b=Z3Emd9t886Wutw70BOpTtv7IuOa1uygQ4Dfw6CwNoDBXlYxsBOsawP+EEDw2TvbEdc
         xZ+xMnHh5H/L1MB8mnnHfzVva1D0rYTvFs/4R10lZG8+xk8HMsQNM6PH70/bA4wgE8su
         e6ICStSC3vomL+pdEdQq8w52rE9BSaA3fEOQpLwHfR3CsmDgJ4A3iEYHVYmtVpLgQguL
         tWKZhoD2rt76hodZCQP6AYgbis4U9jmBhTp0iIJofAi7VnHOKJFzc8hwM/cCOADa4b+v
         jwBq3EEZsanYb+J8iH/y6sTM28VsLszU6K8JLpilxIBA59Gi45Gc6aBI0BLsEjMUekc2
         s14w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745972334; x=1746577134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PXzfu17kptCXUybkiNKPVF1lS3Ix7IXO5RDr+gMnAkc=;
        b=J9Auk/47BIsTQ+NbC85wh4duMR+tFNxNXP2IfNGuN11ioNn6cKEYS5GBhzePmQHkDP
         gbqKxmR5fKdaMGOQ58ilXWho7JcTt07JJEFT1gGvQS0zecDbfmuQ2sy0IPZkL/YUhnz5
         ZE1ACVmwdvDAUahnE9Cu+sC88L5PqgX/0mBwphzJ+PcVgOS5czQThNnayuK6LCbYYa1y
         AYmAR3xQj05QrVJeIW5+nnaXL2one6QUkXYh7KQ8Z7tCijJQ2vN5cRf4JAZs438q6FZl
         8rEeoF76z6n3Dnw69heDBh8hoLO1/60IH6RPGNnlLOsk5JEQ9dZkTO/qkDrfk7Y3rIoO
         H8cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmpmRJ7xfesQxDRJ5AYTMpBcQjPVUdLUIJMizPgEYvVUi+ow6Ax8BhelYryOgOz/eTgsgUw1dILfo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwDNSPRB8GK8EUnfRytdh3hmcg9rBEyiG3OgqUWxjB9SYnUOpGi
	0/gtEJJjzwNWjeCT7DzV2t1k4FD9uid4CR8jmPQROXxl3aPL2XWPJGcmirSTEts=
X-Gm-Gg: ASbGnctDq74TuA4gq7PTqu6h5YB5+38D9DJUp6/gWHMxWlGEs6OPD0/Wwj0ZYvrnh5f
	WGVx8rPODwiZwndXQVnb8NOtdj3N7nL3/GGCU6UXsjEyGH6aTD4IXTnIzLoiD2T3sCYv+ciGy5D
	hH90vPGELcZdhenW+z27PmWi0UQe0NXDJd5heGCPaLRHX2C/aozj7KF6Vs/sOLH2KIFviVRmYRK
	j++0DGeodLNpd9EACnctPND70+weKgrI0I/4FaH8fr2F+FHBPgdLu9jbmsWFAeeMsL7M2dortKJ
	lZr91R1xJXZ8F/VA/dSPJu+79NqfanXY+C0E6B+Qs4QZ+NtRHRbbNA==
X-Google-Smtp-Source: AGHT+IE5FGxbdrNxcaxfBpPfWj8KR2q9JaLnQXvsvsKUG6zRtpkDcoXAsF7QbIKH9zgJl0KjaYQMgA==
X-Received: by 2002:a05:6a21:6711:b0:1f5:5ed0:4d75 with SMTP id adf61e73a8af0-20a88e1cf7cmr1303250637.31.1745972334596;
        Tue, 29 Apr 2025 17:18:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1f68988ca4sm1907790a12.74.2025.04.29.17.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 17:18:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 29 Apr 2025 17:18:46 -0700
Subject: [PATCH v2 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
MIME-Version: 1.0
Message-Id: <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250430_011857_846223_5DD8C1AA 
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

Currently, the sbi_pmu_test continues if the exception type is illegal
instruction because access to hpmcounter will generate that. However
illegal instruction exception may occur due to the other reasons
which should result in test assertion.

Use the stval to decode the exact type of instructions and which csrs are
being accessed if it is csr access instructions. Assert in all cases
except if it is a csr access instructions that access valid PMU related
registers.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../testing/selftests/kvm/include/riscv/processor.h  | 13 +++++++++++++
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c     | 20 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 1b5aef87de0f..162f303d9daa 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -11,6 +11,19 @@
 #include <asm/csr.h>
 #include "kvm_util.h"
 
+#define INSN_OPCODE_MASK	0x007c
+#define INSN_OPCODE_SHIFT	2
+#define INSN_OPCODE_SYSTEM	28
+
+#define INSN_MASK_FUNCT3	0x7000
+#define INSN_SHIFT_FUNCT3	12
+
+#define INSN_CSR_MASK		0xfff00000
+#define INSN_CSR_SHIFT		20
+
+#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
+#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)
+
 static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
 				    uint64_t idx, uint64_t size)
 {
diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 6e66833e5941..3c47268df262 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -130,9 +130,29 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 
 static void guest_illegal_exception_handler(struct pt_regs *regs)
 {
+	unsigned long insn;
+	int opcode, csr_num, funct3;
+
 	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
 		       "Unexpected exception handler %lx\n", regs->cause);
 
+	insn = regs->badaddr;
+	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
+	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
+		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
+
+	csr_num = GET_CSR_NUM(insn);
+	funct3 = GET_RM(insn);
+	/* Validate if it is a CSR read/write operation */
+	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 && funct3 != 4),
+		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
+		       funct3, csr_num);
+
+	/* Validate if it is a HPMCOUNTER CSR operation */
+	__GUEST_ASSERT((csr_num >= CSR_CYCLE && csr_num <= CSR_HPMCOUNTER31) ||
+		       (csr_num >= CSR_CYCLEH && csr_num <= CSR_HPMCOUNTER31H),
+		       "Unexpected csr_num 0x%x\n", csr_num);
+
 	illegal_handler_invoked = true;
 	/* skip the trapping instruction */
 	regs->epc += 4;

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
