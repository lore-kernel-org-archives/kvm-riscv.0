Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2D46C369D9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHnsBJlFHatc5Mg1p6IueboOLHSjBa4xhB3woIqGkrc=; b=BohjcYrsdVnXFm
	ukIhuSYLoFhBa7tuPsZHTsk1zod2E7vuLKZCAnHjCBzhHLRjRZYxvRRpPcktiNfp0YmRDro4SFr8l
	gIPQQDjdnyTEWTJJdsjE9oqFKFCtojRn5PDI7OuSUoTE0OXz86sifSN8DmlZOEGc+NSIoxURv3Ukx
	bw5pO+egVHcEAdmVQ1HE5EyJFTZOiFxvdX84lJlV5s+Isg+Tz8CkxHKJqmsN9awbpZQDTwbluUwmt
	4aTpshfhAgySi3rTVzu9cddylvF+peUUMS/cmMXxhK0/dAJaKzV0FRlUig3hWKCTSAI2hjrRQlue/
	EVgtOSjxKegj+BxnNOWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2ot-0000000C9Xe-1Roo;
	Wed, 30 Apr 2025 08:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA2cW-0000000C7MS-0dGw
	for kvm-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 08:16:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=aRFZ5FKZBztRGxrY6vVfDYbRzHdpxr6eQNzNURiD5s8=; b=g6pjriGygilQpfy8V5xDc1GN85
	mz0kxajZYYz4I7K5/s9xGx4mkxcoqxXa/XE3gFcIMSuTfXmvBvfMjBNXJrk1SVRxPUe7SajCsK29k
	/Qjnbba64S4es/Rtb5jj0V4F2HN8872dc8fw4hsNPLCF2xZPv8jqfWxujKu3ikpyYv+j9yz3IMurg
	Z6XcZi4KykUwatkrKfUTJ/X9OUaUxS0drt0DZq4KQrjqYhRMVIGZIe1zWLpxjxMLUTh+u24AeeCtu
	CBbXQFdhS1bsLUB4KnKKkt53bGyocn2h7br6kPOMf2FMv7NnKT/fhc3VS2HxwE715nGn4oTXZyVT1
	IK3nPG8w==;
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA2cT-0000000DjX5-0EMt
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 08:16:42 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-73712952e1cso7342696b3a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 30 Apr 2025 01:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1746000996; x=1746605796; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRFZ5FKZBztRGxrY6vVfDYbRzHdpxr6eQNzNURiD5s8=;
        b=C1PWMjOtQdOJ44Q0ljJthegrvhX9nQC5Mro1wHcKR71jJ3bmKpzELJc/L5LyrTRioB
         3mp8B+YNmvsvwZmb/M3zcTiyO9zD2TogOc6ZvSAWSwzCYxZ7SK0W+2O+vJssrbwD+Kas
         YEOUJKZ0H0Q6OaVrbs5AuV9KUDBv1zAt+SN5hvBPher4D2yolDUElQlFQ4FazhhMn9H4
         n7HrPa5nbhBd/G+eCq+svGZGKNtdwrzU1y/GOL6uAq+MjT/GDeSkvH2W2SlReHO4rEy2
         PwuQxMYN3vkkkoXYDN3sjuXKEiQ2qd1b5boLr53kGkPGCu/C7q93XljAkURFyG6naghF
         SZmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746000996; x=1746605796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aRFZ5FKZBztRGxrY6vVfDYbRzHdpxr6eQNzNURiD5s8=;
        b=qjPRIsP7L7vP0xgfmXznfIQ3jHBhkz8lLiezEZiV71RNm3Z/fyWJRfDB1YeMPXi+ZZ
         Er8zUUZ3sXE/8Fh5Qwgisr9wPJWyAw4VLT9iSXpOiP4EdlEe2QewYfi2UsDTz8H+ZBzm
         eC20U7s+qZ7eUJOy4tiWo+NDdu1l3GmnrfLi0YBKOYx1xdIf0wWNKApShH5D8rVxfzeq
         If64L3bwykZD3DqxOgfNiDlsTuFBwWnOl8nDNO3eSFt/I0zICmR4cjrOrQHjvWGJy1EF
         9QcSEtMpMkgXdKd+W8mSvTMYIFs/MC0a9h4LCSHV/UypbZ7yCxkBXgKCGcU7FiApyOyS
         JzRg==
X-Forwarded-Encrypted: i=1; AJvYcCVLyxgUd/hvlnJCKTcklmjiOaX0XGkCmgnNyg8WPuDruY0+UPK8t8GEvApKEqK1S7v48Zdjr29mkYQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfPnP0tuWISP3yRIWs9/rfwMS4J+8N3yIXaBNe96PSSnqBWEZQ
	wdkoBZUGVDwijP94Agsz9Q5siXskVHrnY5N9g5J1vNX7WczH+LJsIYrFoWNbhZ4=
X-Gm-Gg: ASbGncs83FnIZoBR1lAp7NvrlCiKJtSASqyxB8b7zwSJc3hS+7PBp05wMLSC3KedTj9
	tf+MjtguCmQYX/vXMIMA7gAzYVk2zjxT1btuoUl0/RdjzPXuRI1zdh1p65jEnGjuCcAubO6fEwu
	RFKQSNDFJNjVij/3D+RMh/do9tG0A1clMuYQ3faSLqhHTvoUA88Tp2P/za5+kdwDEuv36cS6Np6
	ZkN86nF8QDjzU08qu/wShGZajWPRJkg7YSiX7cA2oMkVPeq188DWbCShrdD7cgemXI5GjiK5Rox
	9Kgrk6lSZP5Yod8TqOKrSZRI84IsOB+/LKwrqOIScamkDFq5Nr1fIHJxvgtrNmqH
X-Google-Smtp-Source: AGHT+IGbD1Zl91/g/+st4aTTgt5Bkror5XgxZ0mOSUBOJaMyTd1yJdlz0KXAlGwPjFYFs62/1RdnzA==
X-Received: by 2002:a05:6a00:2e05:b0:732:2484:e0ce with SMTP id d2e1a72fcca58-7403a811cadmr2252321b3a.17.1746000996180;
        Wed, 30 Apr 2025 01:16:36 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74039a309edsm1073084b3a.91.2025.04.30.01.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:16:35 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 30 Apr 2025 01:16:29 -0700
Subject: [PATCH v3 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
MIME-Version: 1.0
Message-Id: <20250430-kvm_selftest_improve-v3-2-eea270ff080b@rivosinc.com>
References: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
In-Reply-To: <20250430-kvm_selftest_improve-v3-0-eea270ff080b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250430_091641_193184_EB5A9C86 
X-CRM114-Status: GOOD (  11.83  )
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

Take this opportunity to remove the CSR_CYCLEH reference as the test is
compiled for RV64 only.

Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../testing/selftests/kvm/include/riscv/processor.h  | 13 +++++++++++++
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c     | 20 +++++++++++++++++++-
 2 files changed, 32 insertions(+), 1 deletion(-)

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
index 6e66833e5941..924a335d2262 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -73,7 +73,6 @@ unsigned long pmu_csr_read_num(int csr_num)
 
 	switch (csr_num) {
 	switchcase_csr_read_32(CSR_CYCLE, ret)
-	switchcase_csr_read_32(CSR_CYCLEH, ret)
 	default :
 		break;
 	}
@@ -130,9 +129,28 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 
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
+	__GUEST_ASSERT((csr_num >= CSR_CYCLE && csr_num <= CSR_HPMCOUNTER31),
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
