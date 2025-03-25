Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBFC3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 00:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UU6rv1NRZSoRbtXukyUU+xxKHLVehICZrUgtFSKEXbI=; b=OQfTnKRU9NNxJM
	aqMslLLvw0j9GO86DXr+sYu3KCT7b3HLU7Q8WJlpFMVFykjdHs4tfKSDvMuda4mk8n83LkJQ605Gq
	toDAHCZ3X/Na4iKmxrKUHzB9KlNKjec6d/mB16Sxn7sV6FaZ9NsdebtubxUmW3WIYj0w6DgR8DwCa
	BsfkJQEc64WePiTOMbMrGqqfq0uFCv2NIIHh72K9NxipoOrdp4g3cxJRb5MLmEhEzMoue/TqJaae9
	193H1o0o/JK7VsJ26FAVspMBBu9uZQYZD5opDOoDwtPdbojiIAPksoWCiYu3r940whlB1P4DV1Ykb
	cekL6H8qx4OGHJVvIUfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLa-00000004Y8E-0sNM;
	Tue, 25 Mar 2025 00:40:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLV-00000004Y4J-3Myl
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 00:40:46 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-225df540edcso116624485ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 17:40:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742863245; x=1743468045; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XNqfGek6IDvMlkuJpE58iTKo9lOFsf02qvhKRUoqiBo=;
        b=x0LbciOU00CEvbSPPzj+gBq6Q8fu6XUFFwTolG9AZ2xalVWSYqIOFrKZC/vd7JWW+v
         LmP1fs0sLZUY9WnW3Yc3AQfKh11T2z4X6BAuJlnCXKCRh818552ddm4HPOjowMaLOoI/
         lDTguVsw6Vj78P5O+rt8BZQ35QrudD5xBKoe06gOROCLke1iCGN8sF6IrlWkfUR8VfJ8
         5bEe5ljMi6oJ94M9NPgi2QzYuyT7bNGMkLY/z61SEpm8Tu1AN9i8PKGRJL0eabMhwn3k
         BKrjvE5U59VK9u2hPl2Pli5etEHeVXL1fRyMN2C8wNUEDKvxbupUiVwerHQUEShbd39i
         iq5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742863245; x=1743468045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNqfGek6IDvMlkuJpE58iTKo9lOFsf02qvhKRUoqiBo=;
        b=S60QV4iGDudih/+2ohSpBM5gnN9726de9hFIRO0gzSAJWNl2BozMK56sLH2M5+T1Vw
         LVpOxxfhHTjy8X9feZF7xc4d7pt91LemOj6UADK5ItmNFwRKalUZ/kv5+0nfuQM9OT/s
         9B/IsTHRl5uict+cOtWYxmDuqT2H3hLqkIM4HBowCHAcUx96EkgajeoFL03z9xv3dR9J
         MFDCSE34405vUZmQ4jst7Mkm30kuufrHu+OBMAl1VLqWCzarhJEsDhPPvlTwRNWsp6Fj
         6BFaN1lAc0kYZpLHqIGFy43MjYH+fwaADHopcJJlxEMmXrskUa7g8UxcU5EXUoQ5PcyH
         kVfw==
X-Forwarded-Encrypted: i=1; AJvYcCXvTGtQda4vyzkwLNfr63YrQxI5BuicMa4wkJ0j3xTJ+JKgq6Tj5LEsIpIfabUU3/UvEuRiSgQYMN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyVEnvfwe68lJHBmmBQtCiI/ug9XMnJbxt8cRPDCSPwpr/Zc5OM
	uuyQjYE2dHkcHV3VcjdWX8Tzxl1BSX5ARwZ+3sL0WbvhQRU5q8nA286bajb3q8Y=
X-Gm-Gg: ASbGnctO64U/hnsASIxtk2XTw5zrwDqzjSA1L8rb2+xx7AsfLjX89ruU68its8+Ly2c
	ZT76WWgfNxQvlLlKVMlyaFk9CMutzSDycP1vi7LAFQdC78JtUxTXeM/zWSeG4fElfotWBzQvD2u
	I/TwY9p/st4CIA9ETCQ1FlZ3KNCK5lR0tvsUQz5BeoFs6gvfmmUbwV8YsiAw1FVSw+9yIPmYJ84
	Fu81IPVOijSIMyst38ReMaQQFeLCYrkKR1AF1AKJOmVJrC2HrN2Z1qxWatNiBKkR7j5xmj1bayG
	OnDjnWL9/YYh2ZHwgaZJ9xVVgErMlPfnRi+XC4DNKZcTuAT8MbcxQmVlRQ==
X-Google-Smtp-Source: AGHT+IEyY0aS2TVZ43j4wneKeZ/YRErGKGqWBRTFQa7kE7mGVqq6ifmaSYPLNtOafQQXufixCh8D6Q==
X-Received: by 2002:a05:6a00:638d:b0:736:aea8:c9b7 with SMTP id d2e1a72fcca58-7377a08766dmr27319740b3a.2.1742863244847;
        Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a501sm8705513b3a.79.2025.03.24.17.40.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 24 Mar 2025 17:40:30 -0700
Subject: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify exact
 exception type
MIME-Version: 1.0
Message-Id: <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_174045_846112_ADA8DEB4 
X-CRM114-Status: UNSURE (   9.70  )
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

Currently, the sbi_pmu_test continues if the exception type is illegal
instruction because access to hpmcounter will generate that. However, we
may get illegal for other reasons as well which should result in test
assertion.

Use the stval to decode the exact type of instructions and which csrs are
being accessed if it is csr access instructions. Assert in all cases
except if it is a csr access instructions that access valid PMU related
registers.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 32 ++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
index 03406de4989d..11bde69b5238 100644
--- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
+++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
@@ -128,11 +128,43 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
 		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
 }
 
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
 static void guest_illegal_exception_handler(struct ex_regs *regs)
 {
+	unsigned long insn;
+	int opcode, csr_num, funct3;
+
 	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
 		       "Unexpected exception handler %lx\n", regs->cause);
 
+	insn = regs->stval;
+	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
+	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
+		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
+
+	csr_num = GET_CSR_NUM(insn);
+	funct3 = GET_RM(insn);
+	/* Validate if it is a CSR read/write operation */
+	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 || funct3 != 4),
+		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
+		       funct3, csr_num);
+
+	/* Validate if it is a HPMCOUNTER CSR operation */
+	__GUEST_ASSERT(csr_num == CSR_CYCLE || csr_num <= CSR_HPMCOUNTER31,
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
