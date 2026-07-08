Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6576BC44501
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0AYaJKZAtotl52XORSouospt6LE9sd9laQgGbpiYzuM=; b=DrpR2QZ54qY0PD
	ta8PvtOPN040db9kxK3LJoaO1y0gNbILfhIhP5ww0B5/br4/S+rFlnDsWN7l7UZdZ6j2GP+oesUMj
	a89KT5PxGAsY6l4IN5PCZfXKafOF2O7yyOrTGuHspJ+8qbX66v90N19V0h4ZRK9UguDewHbVsPd2l
	WA0UUpmJi/5/9pssln/4jBXlql2fTO/OMjhojFuzx+lt7d6mVus1tRLLticQ4GVSEOe6yDr3vyTMr
	lql1VYOtRZ3OV8SciKq4t5gT9cCGdLvahvUy3l3Etmk3hy7ytOY9nRbtCudmFNh9WVCpFgB2geQt9
	9zao8bLMbw1Ok4dQ0Kig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ6F-0000000GGmb-0Qty;
	Wed, 08 Jul 2026 03:37:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5j-0000000GG4a-0wVv
	for kvm-riscv@bombadil.infradead.org;
	Wed, 08 Jul 2026 03:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SapdKhDDjstqtlZUxA166AcqG1VohysSxTDPc9ANn8c=; b=F/eMpHgWhFZm9OKkaeadr6DTIe
	8xRfsAysHJAy0oHXsdYMb14MT0wNz43h35zvrv52x7oMowfWcnrZez/Z6mcyu5ZV/PvfVQdDhrQee
	s9j8Nk+61pq6hPKgty+MlVgPpmh6ZqaQkZ5nl95Dl/3L2YAUNz5hcfnil9TGh8G/Gg/nOfJeEjrpV
	p1JsfDlm4GUj3NkYzcuJoiXYlXfSOTY3Q+3TYI9+5r6hdTFkssM9A0bqy+T/lWd4mFUvX7V9irvJo
	njoDn2+WdMBMD1OE4P2iNIGAPbJWb7GRkxW9/1DeqiJqJXu2KE3NAB/sI6mvUHldz/EXsgq0RMQTv
	0xmTb1Pg==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1whJ5d-00000007yYu-28cR
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:53 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-c88cc025f54so102301a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481807; x=1784086607; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SapdKhDDjstqtlZUxA166AcqG1VohysSxTDPc9ANn8c=;
        b=FmhDoiGuI7p+aKqre2z2E3/RVIEn5OunVL6Y3gP3M6QhRkAx7gy2tS6Dp25BSPTrtH
         M/A1gm+HN8tBtwVjp2rjpgff7IhwHSU4X1SAEalAW2EMucdzQilJKWn1FLD9M0EphQwR
         51kU+SjTdyMIA7FoZWN92X18wBqjf8vNaCxpnHQY+7aibPpMGL04voCMpCmfTmzdkiJW
         +sd9W4xiLbo155E2WvJGThh5vUqEpuw953PpoC1jZg90qQtGvB2K/mt6uiRVwAMyO1v8
         tmtzT4pgCH5WtzfjDTEf058bTv5aPfWdKVycLWPpp1meGSZGJ2jAqZV6Zh8w9bmyEXxU
         3TOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481807; x=1784086607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SapdKhDDjstqtlZUxA166AcqG1VohysSxTDPc9ANn8c=;
        b=BBWfrX8cuHD3y1eEjMjw3yHO/CUTiWFC2tz9fkwtIKETovZISemQmxgZi4iTGcM34J
         TkuPjww5805aT7Tu8fXvr2Chxwvchx9s5VqOWQGK2E2wgoS7qqjN7y9PLM+ZUmyrGx7f
         nExzOm1OrH27t8TguXOBHgN5vfFJDXxbPF7eM9Fe2GWVB6HSsIQOq1M4V7KbF1Lv6+yA
         xPytxCZ2WTdX2e5ShsBtByppnZOFKAJyFp5patPKWTufX52gDXRJZhvYa/O/eGwdUR0c
         u4NLbT+AEc2PqdDzCD73vOum5mrm6Ksz8oruL5lCRJdJ8nqzamYLnWMW7uLinIn5pYEe
         mPtA==
X-Forwarded-Encrypted: i=1; AHgh+Rq5Fx76TD6ijJlNCQllv4H28jvLl8NLthQ5y1L+wVPFHjDfb9IbjOPKFJKUVZg99jn45s02ED/x3io=@lists.infradead.org
X-Gm-Message-State: AOJu0Yydn+d/8z5Fw0zgWTMW6f4lm30kj+3C/n904uD3LxucdWfws92+
	cQRzHARAMFTSjCb451TE6SPO8f8t9Ubkt+EWZA/J2dzeIo45VBt3Odlf
X-Gm-Gg: AfdE7clEk1jzV5awC4cEpKKOgFR6I07S81dUnNWkOVYUSNdPdDBaHKFnoI4ho+eY3TX
	RcXAX/q1V58qWKshftXoZq/OOYwX4GCjAYHx13qOvftgzgMlhLDiUSRagG3sFc/wQ1uTqLyH/XV
	FpdeFfIBm+6sNA6pL2g7uM1SJRcGldprSMBUQa3Sa54DUG447mgrfNw4JMFOOMCfJ/2t7x2B/tu
	ro4nYqIiQxLTd47v4tuJSzZxHwf6n7JPCOmvRgJpoHqkhOxl4QPQ5ztHXaZj8dBoeybY7PNFbrv
	7ILIWYAXW1RtViBoNvaGgKbtH6CyHgrQ5YhwcmjWTXx3DG2vlCp7S31By8RiY6kCw2kxAv4ru5W
	ZhSX5BlyJMfbHcadVaNfGUfhh0LskFgGvQ4ChZQub+Qo5HCr1JFLw4Ubro5XHxGfy5/2FnRTGMQ
	ZMfq4GRmRW3a2Q8CT/twp+/Z2m7k/CO1edanbuLwc=
X-Received: by 2002:a05:6a20:939a:b0:3bf:9aa9:b2a4 with SMTP id adf61e73a8af0-3c0bcc5b894mr618782637.20.1783481807125;
        Tue, 07 Jul 2026 20:36:47 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:46 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:40 -0700
Subject: [PATCH v3 17/17] riscv: Remove unused instruction headers
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-17-3f8e5f75ba97@gmail.com>
References: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
In-Reply-To: <20260707-riscv_insn_table-v3-0-3f8e5f75ba97@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Jesse Taube <jtaubepe@redhat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=17862;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=K0LuSdwhSvVXMF9AV1nnY5iDQumiPoBelDjVoeYkwYA=;
 b=3svj/2jGsY5hkw5RnNQYlQm0xUfsp814T02YlcY/q5NOazYnWp9Pbjgbk9cf7+mi6bGS9koAa
 NcZ0FD06ROtCAUZUMlkKeiAI6KWkpJUT96W9U9jX5dq+bC6Tn9OBwYu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_043650_963702_526E01D7 
X-CRM114-Status: GOOD (  10.54  )
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

All usages of hard-coded riscv instruction have been migrated over to
the generated instruction headers so the old macros can be deleted.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/insn.h | 413 +-----------------------------------------
 1 file changed, 4 insertions(+), 409 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index bf6f5d530491..ea1f139d6d90 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -38,151 +38,22 @@ static __always_inline bool riscv_insn_is_##name(u32 _insn)		\
 
 #include <asm/insn_gen.h>
 
-#define RV_INSN_FUNCT3_MASK	GENMASK(14, 12)
-#define RV_INSN_FUNCT3_OPOFF	12
 #define RV_INSN_OPCODE_MASK	GENMASK(6, 0)
-#define RV_INSN_OPCODE_OPOFF	0
-#define RV_INSN_FUNCT12_OPOFF	20
-
-#define RV_ENCODE_FUNCT3(f_)	(RVG_FUNCT3_##f_ << RV_INSN_FUNCT3_OPOFF)
-#define RV_ENCODE_FUNCT12(f_)	(RVG_FUNCT12_##f_ << RV_INSN_FUNCT12_OPOFF)
-
-/* The bit field of immediate value in I-type instruction */
-#define RV_I_IMM_SIGN_OPOFF	31
-#define RV_I_IMM_11_0_OPOFF	20
-#define RV_I_IMM_SIGN_OFF	12
-#define RV_I_IMM_11_0_OFF	0
-#define RV_I_IMM_11_0_MASK	GENMASK(11, 0)
-
-/* The bit field of immediate value in J-type instruction */
-#define RV_J_IMM_SIGN_OPOFF	31
-#define RV_J_IMM_10_1_OPOFF	21
-#define RV_J_IMM_11_OPOFF	20
-#define RV_J_IMM_19_12_OPOFF	12
-#define RV_J_IMM_SIGN_OFF	20
-#define RV_J_IMM_10_1_OFF	1
-#define RV_J_IMM_11_OFF		11
-#define RV_J_IMM_19_12_OFF	12
-#define RV_J_IMM_10_1_MASK	GENMASK(9, 0)
-#define RV_J_IMM_11_MASK	GENMASK(0, 0)
-#define RV_J_IMM_19_12_MASK	GENMASK(7, 0)
-
-/*
- * U-type IMMs contain the upper 20bits [31:20] of an immediate with
- * the rest filled in by zeros, so no shifting required. Similarly,
- * bit31 contains the signed state, so no sign extension necessary.
- */
-#define RV_U_IMM_SIGN_OPOFF	31
-#define RV_U_IMM_31_12_OPOFF	0
-#define RV_U_IMM_31_12_MASK	GENMASK(31, 12)
-
-/* The bit field of immediate value in B-type instruction */
-#define RV_B_IMM_SIGN_OPOFF	31
-#define RV_B_IMM_10_5_OPOFF	25
-#define RV_B_IMM_4_1_OPOFF	8
-#define RV_B_IMM_11_OPOFF	7
-#define RV_B_IMM_SIGN_OFF	12
-#define RV_B_IMM_10_5_OFF	5
-#define RV_B_IMM_4_1_OFF	1
-#define RV_B_IMM_11_OFF		11
-#define RV_B_IMM_10_5_MASK	GENMASK(5, 0)
-#define RV_B_IMM_4_1_MASK	GENMASK(3, 0)
-#define RV_B_IMM_11_MASK	GENMASK(0, 0)
-
-/* The register offset in RVG instruction */
-#define RVG_RS1_OPOFF		15
-#define RVG_RS2_OPOFF		20
-#define RVG_RD_OPOFF		7
-#define RVG_RS1_MASK		GENMASK(4, 0)
-#define RVG_RS2_MASK		GENMASK(4, 0)
-#define RVG_RD_MASK		GENMASK(4, 0)
-
-/* The bit field of immediate value in RVC J instruction */
-#define RVC_J_IMM_SIGN_OPOFF	12
-#define RVC_J_IMM_4_OPOFF	11
-#define RVC_J_IMM_9_8_OPOFF	9
-#define RVC_J_IMM_10_OPOFF	8
-#define RVC_J_IMM_6_OPOFF	7
-#define RVC_J_IMM_7_OPOFF	6
-#define RVC_J_IMM_3_1_OPOFF	3
-#define RVC_J_IMM_5_OPOFF	2
-#define RVC_J_IMM_SIGN_OFF	11
-#define RVC_J_IMM_4_OFF		4
-#define RVC_J_IMM_9_8_OFF	8
-#define RVC_J_IMM_10_OFF	10
-#define RVC_J_IMM_6_OFF		6
-#define RVC_J_IMM_7_OFF		7
-#define RVC_J_IMM_3_1_OFF	1
-#define RVC_J_IMM_5_OFF		5
-#define RVC_J_IMM_4_MASK	GENMASK(0, 0)
-#define RVC_J_IMM_9_8_MASK	GENMASK(1, 0)
-#define RVC_J_IMM_10_MASK	GENMASK(0, 0)
-#define RVC_J_IMM_6_MASK	GENMASK(0, 0)
-#define RVC_J_IMM_7_MASK	GENMASK(0, 0)
-#define RVC_J_IMM_3_1_MASK	GENMASK(2, 0)
-#define RVC_J_IMM_5_MASK	GENMASK(0, 0)
-
-/* The bit field of immediate value in RVC B instruction */
-#define RVC_B_IMM_SIGN_OPOFF	12
-#define RVC_B_IMM_4_3_OPOFF	10
-#define RVC_B_IMM_7_6_OPOFF	5
-#define RVC_B_IMM_2_1_OPOFF	3
-#define RVC_B_IMM_5_OPOFF	2
-#define RVC_B_IMM_SIGN_OFF	8
-#define RVC_B_IMM_4_3_OFF	3
-#define RVC_B_IMM_7_6_OFF	6
-#define RVC_B_IMM_2_1_OFF	1
-#define RVC_B_IMM_5_OFF		5
-#define RVC_B_IMM_4_3_MASK	GENMASK(1, 0)
-#define RVC_B_IMM_7_6_MASK	GENMASK(1, 0)
-#define RVC_B_IMM_2_1_MASK	GENMASK(1, 0)
-#define RVC_B_IMM_5_MASK	GENMASK(0, 0)
-
-#define RVC_INSN_FUNCT4_MASK	GENMASK(15, 12)
-#define RVC_INSN_FUNCT4_OPOFF	12
-#define RVC_INSN_FUNCT3_MASK	GENMASK(15, 13)
-#define RVC_INSN_FUNCT3_OPOFF	13
-#define RVC_INSN_J_RS1_MASK	GENMASK(11, 7)
-#define RVC_INSN_J_RS2_MASK	GENMASK(6, 2)
-#define RVC_INSN_OPCODE_MASK	GENMASK(1, 0)
-#define RVC_ENCODE_FUNCT3(f_)	(RVC_FUNCT3_##f_ << RVC_INSN_FUNCT3_OPOFF)
-#define RVC_ENCODE_FUNCT4(f_)	(RVC_FUNCT4_##f_ << RVC_INSN_FUNCT4_OPOFF)
-
-/* The register offset in RVC op=C0 instruction */
-#define RVC_C0_RS1_OPOFF	7
-#define RVC_C0_RS2_OPOFF	2
-#define RVC_C0_RD_OPOFF		2
-
-/* The register offset in RVC op=C1 instruction */
-#define RVC_C1_RS1_OPOFF	7
-#define RVC_C1_RS2_OPOFF	2
-#define RVC_C1_RD_OPOFF		7
-
-/* The register offset in RVC op=C2 instruction */
-#define RVC_C2_RS1_OPOFF	7
-#define RVC_C2_RS2_OPOFF	2
-#define RVC_C2_RD_OPOFF		7
-#define RVC_C2_RS1_MASK		GENMASK(4, 0)
 
 /* parts of opcode for RVG*/
-#define RVG_OPCODE_FENCE	0x0f
-#define RVG_OPCODE_AUIPC	0x17
 #define RVG_OPCODE_BRANCH	0x63
-#define RVG_OPCODE_JALR		0x67
-#define RVG_OPCODE_JAL		0x6f
 #define RVG_OPCODE_SYSTEM	0x73
 #define RVG_SYSTEM_CSR_OFF	20
 #define RVG_SYSTEM_CSR_MASK	GENMASK(12, 0)
 
+// THESE ARE ALL ACTUALLY USED
 /* parts of opcode for RVF, RVD and RVQ */
 #define RVFDQ_FL_FS_WIDTH_OFF	12
 #define RVFDQ_FL_FS_WIDTH_MASK	GENMASK(2, 0)
-#define RVFDQ_FL_FS_WIDTH_W	2
-#define RVFDQ_FL_FS_WIDTH_D	3
-#define RVFDQ_LS_FS_WIDTH_Q	4
 #define RVFDQ_OPCODE_FL		0x07
 #define RVFDQ_OPCODE_FS		0x27
 
+// THESE ARE ALL ACTUALLY USED
 /* parts of opcode for RVV */
 #define RVV_OPCODE_VECTOR	0x57
 #define RVV_VL_VS_WIDTH_8	0
@@ -192,72 +63,6 @@ static __always_inline bool riscv_insn_is_##name(u32 _insn)		\
 #define RVV_OPCODE_VL		RVFDQ_OPCODE_FL
 #define RVV_OPCODE_VS		RVFDQ_OPCODE_FS
 
-/* parts of opcode for RVC*/
-#define RVC_OPCODE_C0		0x0
-#define RVC_OPCODE_C1		0x1
-#define RVC_OPCODE_C2		0x2
-
-/* parts of funct3 code for I, M, A extension*/
-#define RVG_FUNCT3_JALR		0x0
-#define RVG_FUNCT3_BEQ		0x0
-#define RVG_FUNCT3_BNE		0x1
-#define RVG_FUNCT3_BLT		0x4
-#define RVG_FUNCT3_BGE		0x5
-#define RVG_FUNCT3_BLTU		0x6
-#define RVG_FUNCT3_BGEU		0x7
-
-/* parts of funct3 code for C extension*/
-#define RVC_FUNCT3_C_BEQZ	0x6
-#define RVC_FUNCT3_C_BNEZ	0x7
-#define RVC_FUNCT3_C_J		0x5
-#define RVC_FUNCT3_C_JAL	0x1
-#define RVC_FUNCT4_C_JR		0x8
-#define RVC_FUNCT4_C_JALR	0x9
-#define RVC_FUNCT4_C_EBREAK	0x9
-
-#define RVG_FUNCT12_EBREAK	0x1
-#define RVG_FUNCT12_SRET	0x102
-
-#define RVG_MATCH_AUIPC		(RVG_OPCODE_AUIPC)
-#define RVG_MATCH_JALR		(RV_ENCODE_FUNCT3(JALR) | RVG_OPCODE_JALR)
-#define RVG_MATCH_JAL		(RVG_OPCODE_JAL)
-#define RVG_MATCH_FENCE		(RVG_OPCODE_FENCE)
-#define RVG_MATCH_BEQ		(RV_ENCODE_FUNCT3(BEQ) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BNE		(RV_ENCODE_FUNCT3(BNE) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BLT		(RV_ENCODE_FUNCT3(BLT) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BGE		(RV_ENCODE_FUNCT3(BGE) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BLTU		(RV_ENCODE_FUNCT3(BLTU) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_BGEU		(RV_ENCODE_FUNCT3(BGEU) | RVG_OPCODE_BRANCH)
-#define RVG_MATCH_EBREAK	(RV_ENCODE_FUNCT12(EBREAK) | RVG_OPCODE_SYSTEM)
-#define RVG_MATCH_SRET		(RV_ENCODE_FUNCT12(SRET) | RVG_OPCODE_SYSTEM)
-#define RVC_MATCH_C_BEQZ	(RVC_ENCODE_FUNCT3(C_BEQZ) | RVC_OPCODE_C1)
-#define RVC_MATCH_C_BNEZ	(RVC_ENCODE_FUNCT3(C_BNEZ) | RVC_OPCODE_C1)
-#define RVC_MATCH_C_J		(RVC_ENCODE_FUNCT3(C_J) | RVC_OPCODE_C1)
-#define RVC_MATCH_C_JAL		(RVC_ENCODE_FUNCT3(C_JAL) | RVC_OPCODE_C1)
-#define RVC_MATCH_C_JR		(RVC_ENCODE_FUNCT4(C_JR) | RVC_OPCODE_C2)
-#define RVC_MATCH_C_JALR	(RVC_ENCODE_FUNCT4(C_JALR) | RVC_OPCODE_C2)
-#define RVC_MATCH_C_EBREAK	(RVC_ENCODE_FUNCT4(C_EBREAK) | RVC_OPCODE_C2)
-
-#define RVG_MASK_AUIPC		(RV_INSN_OPCODE_MASK)
-#define RVG_MASK_JALR		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_JAL		(RV_INSN_OPCODE_MASK)
-#define RVG_MASK_FENCE		(RV_INSN_OPCODE_MASK)
-#define RVC_MASK_C_JALR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
-#define RVC_MASK_C_JR		(RVC_INSN_FUNCT4_MASK | RVC_INSN_J_RS2_MASK | RVC_INSN_OPCODE_MASK)
-#define RVC_MASK_C_JAL		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
-#define RVC_MASK_C_J		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
-#define RVG_MASK_BEQ		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_BNE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_BLT		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_BGE		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_BLTU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVG_MASK_BGEU		(RV_INSN_FUNCT3_MASK | RV_INSN_OPCODE_MASK)
-#define RVC_MASK_C_BEQZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
-#define RVC_MASK_C_BNEZ		(RVC_INSN_FUNCT3_MASK | RVC_INSN_OPCODE_MASK)
-#define RVC_MASK_C_EBREAK	0xffff
-#define RVG_MASK_EBREAK		0xffffffff
-#define RVG_MASK_SRET		0xffffffff
-
 #define __INSN_LENGTH_MASK	_UL(0x3)
 #define __INSN_LENGTH_GE_32	_UL(0x3)
 #define __INSN_OPCODE_MASK	_UL(0x7F)
@@ -275,236 +80,26 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 	return (code & RV_INSN_OPCODE_MASK) == RVG_OPCODE_BRANCH;
 }
 
-#define INSN_MATCH_LB		0x3
-#define INSN_MASK_LB		0x707f
-#define INSN_MATCH_LH		0x1003
-#define INSN_MASK_LH		0x707f
-#define INSN_MATCH_LW		0x2003
-#define INSN_MASK_LW		0x707f
-#define INSN_MATCH_LD		0x3003
-#define INSN_MASK_LD		0x707f
-#define INSN_MATCH_LBU		0x4003
-#define INSN_MASK_LBU		0x707f
-#define INSN_MATCH_LHU		0x5003
-#define INSN_MASK_LHU		0x707f
-#define INSN_MATCH_LWU		0x6003
-#define INSN_MASK_LWU		0x707f
-#define INSN_MATCH_SB		0x23
-#define INSN_MASK_SB		0x707f
-#define INSN_MATCH_SH		0x1023
-#define INSN_MASK_SH		0x707f
-#define INSN_MATCH_SW		0x2023
-#define INSN_MASK_SW		0x707f
-#define INSN_MATCH_SD		0x3023
-#define INSN_MASK_SD		0x707f
-
-#define INSN_MATCH_C_LD		0x6000
-#define INSN_MASK_C_LD		0xe003
-#define INSN_MATCH_C_SD		0xe000
-#define INSN_MASK_C_SD		0xe003
-#define INSN_MATCH_C_LW		0x4000
-#define INSN_MASK_C_LW		0xe003
-#define INSN_MATCH_C_SW		0xc000
-#define INSN_MASK_C_SW		0xe003
-#define INSN_MATCH_C_LDSP	0x6002
-#define INSN_MASK_C_LDSP	0xe003
-#define INSN_MATCH_C_SDSP	0xe002
-#define INSN_MASK_C_SDSP	0xe003
-#define INSN_MATCH_C_LWSP	0x4002
-#define INSN_MASK_C_LWSP	0xe003
-#define INSN_MATCH_C_SWSP	0xc002
-#define INSN_MASK_C_SWSP	0xe003
-
 #define INSN_OPCODE_MASK	0x007c
 #define INSN_OPCODE_SHIFT	2
 #define INSN_OPCODE_SYSTEM	28
 
-#define INSN_MASK_WFI		0xffffffff
-#define INSN_MATCH_WFI		0x10500073
-
-#define INSN_MASK_WRS		0xffffffff
-#define INSN_MATCH_WRS		0x00d00073
-
-#define INSN_MATCH_CSRRW	0x1073
-#define INSN_MASK_CSRRW		0x707f
-#define INSN_MATCH_CSRRS	0x2073
-#define INSN_MASK_CSRRS		0x707f
-#define INSN_MATCH_CSRRC	0x3073
-#define INSN_MASK_CSRRC		0x707f
-#define INSN_MATCH_CSRRWI	0x5073
-#define INSN_MASK_CSRRWI	0x707f
-#define INSN_MATCH_CSRRSI	0x6073
-#define INSN_MASK_CSRRSI	0x707f
-#define INSN_MATCH_CSRRCI	0x7073
-#define INSN_MASK_CSRRCI	0x707f
-
-#define INSN_MATCH_FLW		0x2007
-#define INSN_MASK_FLW		0x707f
-#define INSN_MATCH_FLD		0x3007
-#define INSN_MASK_FLD		0x707f
-#define INSN_MATCH_FLQ		0x4007
-#define INSN_MASK_FLQ		0x707f
-#define INSN_MATCH_FSW		0x2027
-#define INSN_MASK_FSW		0x707f
-#define INSN_MATCH_FSD		0x3027
-#define INSN_MASK_FSD		0x707f
-#define INSN_MATCH_FSQ		0x4027
-#define INSN_MASK_FSQ		0x707f
-
-#define INSN_MATCH_C_FLD	0x2000
-#define INSN_MASK_C_FLD		0xe003
-#define INSN_MATCH_C_FLW	0x6000
-#define INSN_MASK_C_FLW		0xe003
-#define INSN_MATCH_C_FSD	0xa000
-#define INSN_MASK_C_FSD		0xe003
-#define INSN_MATCH_C_FSW	0xe000
-#define INSN_MASK_C_FSW		0xe003
-#define INSN_MATCH_C_FLDSP	0x2002
-#define INSN_MASK_C_FLDSP	0xe003
-#define INSN_MATCH_C_FSDSP	0xa002
-#define INSN_MASK_C_FSDSP	0xe003
-#define INSN_MATCH_C_FLWSP	0x6002
-#define INSN_MASK_C_FLWSP	0xe003
-#define INSN_MATCH_C_FSWSP	0xe002
-#define INSN_MASK_C_FSWSP	0xe003
-
-#define INSN_MATCH_C_LHU		0x8400
-#define INSN_MASK_C_LHU			0xfc43
-#define INSN_MATCH_C_LH			0x8440
-#define INSN_MASK_C_LH			0xfc43
-#define INSN_MATCH_C_SH			0x8c00
-#define INSN_MASK_C_SH			0xfc43
-
 #define INSN_16BIT_MASK		0x3
 #define INSN_IS_16BIT(insn)	(((insn) & INSN_16BIT_MASK) != INSN_16BIT_MASK)
 #define INSN_LEN(insn)		(INSN_IS_16BIT(insn) ? 2 : 4)
 
-#define SHIFT_RIGHT(x, y)		\
-	((y) < 0 ? ((x) << -(y)) : ((x) >> (y)))
-
 #define REG_MASK			\
 	((1 << (5 + LOG_REGBYTES)) - (1 << LOG_REGBYTES))
 
-#define REG_OFFSET(insn, pos)		\
-	(SHIFT_RIGHT((insn), (pos) - LOG_REGBYTES) & REG_MASK)
-
-#define REG_PTR(insn, pos, regs)	\
-	((ulong *)((ulong)(regs) + REG_OFFSET(insn, pos)))
-
-#define GET_RS1(insn, regs)	(*REG_PTR(insn, SH_RS1, regs))
-#define GET_RS2(insn, regs)	(*REG_PTR(insn, SH_RS2, regs))
-#define GET_RS1S(insn, regs)	(*REG_PTR(RVC_RS1S(insn), 0, regs))
-#define GET_RS2S(insn, regs)	(*REG_PTR(RVC_RS2S(insn), 0, regs))
-#define GET_RS2C(insn, regs)	(*REG_PTR(insn, SH_RS2C, regs))
-#define GET_SP(regs)		(*REG_PTR(2, 0, regs))
-#define SET_RD(insn, regs, val)	(*REG_PTR(insn, SH_RD, regs) = (val))
-#define IMM_I(insn)		((s32)(insn) >> 20)
-#define IMM_S(insn)		(((s32)(insn) >> 25 << 5) | \
-				 (s32)(((insn) >> 7) & 0x1f))
-
-#define SH_RD			7
-#define SH_RS1			15
-#define SH_RS2			20
-#define SH_RS2C			2
-#define MASK_RX			0x1f
-
 #if defined(CONFIG_64BIT)
 #define LOG_REGBYTES		3
 #else
 #define LOG_REGBYTES		2
 #endif
 
-#define MASK_FUNCT3		0x7000
-
-#define GET_FUNCT3(insn)	(((insn) >> 12) & 7)
-
-#define RV_IMM_SIGN(x)		(-(((x) >> 31) & 1))
-#define RVC_IMM_SIGN(x)		(-(((x) >> 12) & 1))
-#define RV_X_MASK(X, s, mask)	(((X) >> (s)) & (mask))
-#define RV_X(X, s, n)		RV_X_MASK(X, s, ((1 << (n)) - 1))
-#define RVC_LW_IMM(x)		((RV_X(x, 6, 1) << 2) | \
-				 (RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 1) << 6))
-#define RVC_LD_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 5, 2) << 6))
-#define RVC_LWSP_IMM(x)		((RV_X(x, 4, 3) << 2) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 2) << 6))
-#define RVC_LDSP_IMM(x)		((RV_X(x, 5, 2) << 3) | \
-				 (RV_X(x, 12, 1) << 5) | \
-				 (RV_X(x, 2, 3) << 6))
-#define RVC_SWSP_IMM(x)		((RV_X(x, 9, 4) << 2) | \
-				 (RV_X(x, 7, 2) << 6))
-#define RVC_SDSP_IMM(x)		((RV_X(x, 10, 3) << 3) | \
-				 (RV_X(x, 7, 3) << 6))
-#define RVC_RS1S(insn)		(8 + RV_X(insn, SH_RD, 3))
-#define RVC_RS2S(insn)		(8 + RV_X(insn, SH_RS2C, 3))
-#define RVC_RS2(insn)		RV_X(insn, SH_RS2C, 5)
-#define RVC_X(X, s, mask)	RV_X_MASK(X, s, mask)
-
-#define RV_EXTRACT_FUNCT3(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RV_INSN_FUNCT3_OPOFF, \
-		   RV_INSN_FUNCT3_MASK >> RV_INSN_FUNCT3_OPOFF)); })
-
-#define RV_EXTRACT_RS1_REG(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RVG_RS1_OPOFF, RVG_RS1_MASK)); })
-
-#define RV_EXTRACT_RS2_REG(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RVG_RS2_OPOFF, RVG_RS2_MASK)); })
-
-#define RV_EXTRACT_RD_REG(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RVG_RD_OPOFF, RVG_RD_MASK)); })
-
-#define RV_EXTRACT_UTYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RV_U_IMM_31_12_OPOFF, RV_U_IMM_31_12_MASK)); })
-
-#define RV_EXTRACT_JTYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RV_J_IMM_10_1_OPOFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OFF) | \
-	(RV_X_MASK(x_, RV_J_IMM_11_OPOFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OFF) | \
-	(RV_X_MASK(x_, RV_J_IMM_19_12_OPOFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OFF) | \
-	(RV_IMM_SIGN(x_) << RV_J_IMM_SIGN_OFF); })
-
-#define RV_EXTRACT_ITYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RV_I_IMM_11_0_OPOFF, RV_I_IMM_11_0_MASK)) | \
-	(RV_IMM_SIGN(x_) << RV_I_IMM_SIGN_OFF); })
-
-#define RV_EXTRACT_BTYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RV_B_IMM_4_1_OPOFF, RV_B_IMM_4_1_MASK) << RV_B_IMM_4_1_OFF) | \
-	(RV_X_MASK(x_, RV_B_IMM_10_5_OPOFF, RV_B_IMM_10_5_MASK) << RV_B_IMM_10_5_OFF) | \
-	(RV_X_MASK(x_, RV_B_IMM_11_OPOFF, RV_B_IMM_11_MASK) << RV_B_IMM_11_OFF) | \
-	(RV_IMM_SIGN(x_) << RV_B_IMM_SIGN_OFF); })
-
-#define RVC_EXTRACT_C2_RS1_REG(x) \
-	({typeof(x) x_ = (x); \
-	(RV_X_MASK(x_, RVC_C2_RS1_OPOFF, RVC_C2_RS1_MASK)); })
-
-#define RVC_EXTRACT_JTYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RVC_X(x_, RVC_J_IMM_3_1_OPOFF, RVC_J_IMM_3_1_MASK) << RVC_J_IMM_3_1_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_4_OPOFF, RVC_J_IMM_4_MASK) << RVC_J_IMM_4_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_5_OPOFF, RVC_J_IMM_5_MASK) << RVC_J_IMM_5_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_6_OPOFF, RVC_J_IMM_6_MASK) << RVC_J_IMM_6_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_7_OPOFF, RVC_J_IMM_7_MASK) << RVC_J_IMM_7_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_9_8_OPOFF, RVC_J_IMM_9_8_MASK) << RVC_J_IMM_9_8_OFF) | \
-	(RVC_X(x_, RVC_J_IMM_10_OPOFF, RVC_J_IMM_10_MASK) << RVC_J_IMM_10_OFF) | \
-	(RVC_IMM_SIGN(x_) << RVC_J_IMM_SIGN_OFF); })
-
-#define RVC_EXTRACT_BTYPE_IMM(x) \
-	({typeof(x) x_ = (x); \
-	(RVC_X(x_, RVC_B_IMM_2_1_OPOFF, RVC_B_IMM_2_1_MASK) << RVC_B_IMM_2_1_OFF) | \
-	(RVC_X(x_, RVC_B_IMM_4_3_OPOFF, RVC_B_IMM_4_3_MASK) << RVC_B_IMM_4_3_OFF) | \
-	(RVC_X(x_, RVC_B_IMM_5_OPOFF, RVC_B_IMM_5_MASK) << RVC_B_IMM_5_OFF) | \
-	(RVC_X(x_, RVC_B_IMM_7_6_OPOFF, RVC_B_IMM_7_6_MASK) << RVC_B_IMM_7_6_OFF) | \
-	(RVC_IMM_SIGN(x_) << RVC_B_IMM_SIGN_OFF); })
+#define RV_X_MASK(X, s, mask)  (((X) >> (s)) & (mask))
 
+// These three are used by vector stuff
 #define RVG_EXTRACT_SYSTEM_CSR(x) \
 	({typeof(x) x_ = (x); RV_X_MASK(x_, RVG_SYSTEM_CSR_OFF, RVG_SYSTEM_CSR_MASK); })
 

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
