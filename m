Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F6BC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KCXhEmg/AHWnawpe6ZkplCe8XapVAiNTMl4FQwzMJFs=; b=HrwQp95riCWmab
	vuIQlw9LLPbqswSdFskdzoBqmg6w2c4zxizwowIumjredSbtDEZJvCcX38JpDuX7m7yv2p2/qVbt+
	TDUyYGZYipXZCvIk0RDJ8a9ZvXrr17v74OgIZrhGKMVF3K9U8tnj84Si08+OcWzxGmgp+6T+KoeVY
	RERmWhEJRzRyhPYQapHjzlVbbpfaB9GYjudkyADNV1jKjhuijcwMKExswzi9vWUB2TvfL+jlUac+a
	11/lkxNTm23EL3X9QnrTgWFklPo1Z1C8zk+lmnMOJQN0vfyCkQr8lWRpU7S2A5r9YrZ7hTk0NIie8
	VOtRlpETOTFWXtJ7gapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5M-0000000GFg9-0POU;
	Wed, 08 Jul 2026 03:36:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5D-0000000GFZw-2lJL
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:25 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2cad225673bso1999175ad.3
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481783; x=1784086583; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rhDw/6L+TZLtvHPPBhD5FTnHIpFKKZXbKXqoSYpJYxA=;
        b=bad43jRSY7JGhJi1+C+vbJuYjeWS2yj6GoWwUvDIuH/tgcgaekmRBw8CRoQYyld7hs
         DmW7/Z7RVxPp9rUGenwTnqEp+kyuWVdbGLKNV+0mdj+GbuN/fdySBzUl+RKN2Bo5soPv
         MGlS+7RNyJrJzvNFR3MVcCyyEspPqn5BEJ78WOvDVOZjBgmiX01ZpmDtwKzyL1712yme
         jx6a7N67Z5lux0VRFRzm+eHEP+Xq3yIG3xKiwbvTO1le4lCx0Fjk9Q0LRXAzI75Pgyl8
         VaKF+5hHESXuIojHcDH09+svtmSnjda0Xuo7Z04WWaSJH4FA6Q2fQet0FQKbhwqyobxb
         UfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481783; x=1784086583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rhDw/6L+TZLtvHPPBhD5FTnHIpFKKZXbKXqoSYpJYxA=;
        b=NdVVpeKI0ssd/lkQ0JnXMxln2/xtKon76jpSk9yci8QP737A2lYgpSLN+9N8IZ/zUt
         L+aJA5OQFsOwkAGq83EEMX0lKpl+Qd4YXSnyYP5/AX6vGJaN3zP1rvuZOH7mPDM0gipg
         VgWg3htxccuyoDpPlJxvtCxrGFxc+Ct+kKjHWlmo8LHGJldZ+yA9FWaB33n+JFy7mCOB
         4xDhkmGYLv8deSXrU3vqUvHS2p2/A5tfrgZVv8FsnymDfdEf3OlHtrgngi9Cj81uWmzc
         nfYEdT1arMqfUInDsWgBkXUZawwvVutzca7LIbm/R6OYtZVP5CcfLAgwcRLnRQzO4tdP
         eZJQ==
X-Forwarded-Encrypted: i=1; AHgh+RpGkqFtaO5r19eXmZps1xBfu2Vo2YXb3FA8mBpgCAhIzDNIdU0ddSQcm5R4sUwB0C17rg6DRbCkbtw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxBFQv0uiHqbsOZSJKY7ehZ0bAjLg/C8ihmovB1g0P0WnmL2iJA
	B0MScITPU/w365OX471hH6pB93JcmyxxnGa8nYoxJCSsvTW5zWHpxTct
X-Gm-Gg: AfdE7ckl78de6nEfJMTA0Wz8X3LHmiDdzjXxn1sJC4AvBDfqDL95blq0eDV8OURO+uE
	QNHW80zH0n+01OF6CEUxNQ/KrIGo36FBh8PjcTWgYkpR9uZ7v8EMss0J+QZy6VcKL8QDglqRgml
	ZOO88rqN0egW6e+ClVDCtma2ENbKglbKghdfUIb+sCWHGZUQ6RQY2A9ArCVhrsUkufkxUCrAXAk
	rxdqAvYVmz7seGaxm35mKHsIkpA8jI7Xan5GO/pcmLkfUPVd+UJMKQf5uK8AVSsGkrDyKLEhg5A
	vxW4tiTtOL9IoZXWsWkFhplwmegZk4ywqCoAUfYzl2rJEg7ag79PA0LSrXKEDz2Md+7sj0RkiUi
	xi/dUAizSK6iNgX6T9Xj1D9QRHFhFiZS7B47m+6V8CMvfmFme5FXnHmp39qaU1cd1gBK/XQADO6
	S5AsYpfWGcop3fq19yLjB5aUFTJORTV9q41Ttcm4A=
X-Received: by 2002:a05:6a20:3d0c:b0:3b4:93b9:2b91 with SMTP id adf61e73a8af0-3c0bcf16364mr637734637.12.1783481782784;
        Tue, 07 Jul 2026 20:36:22 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:22 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:25 -0700
Subject: [PATCH v3 02/17] riscv: alternatives: Use generated instruction
 headers for patching code
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-2-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=7624;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=/mGMT1v7H7ryJQYOPUJnYKV/ZslC9IYBB4cPOktM6Oo=;
 b=e8bI9wklaU/9ul8UJWwZF5PYDwtXiPtCzuAV+L08M3Fv25bkjIl7li3QDgxaI6e2+O7fJNUMy
 yum6AxIuRxJBWVmIFA1eRmXPQaB1gU8b1e2MPbL6fWUFncPwZkWvAdl
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203623_844382_C7DF39EC 
X-CRM114-Status: GOOD (  24.35  )
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

Migrate the alternatives patching code to use the generated instruction
headers instead of the hand-written instruction composition functions.

Reviewed-by: Jesse Taube <jtaubepe@redhat.com>
Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

These function expansions are very simple and almost expand to the same
thing in the new and old version. The main difference is
riscv_insn_auipc_extract_imm() in the new version expands to:

((_insn >> 12 & GENMASK(19, 0)) << 12)

while it expands to the following in the old version:

((_insn >> 0) & GENMASK(31, 12))

These are the same thing, but GCC is unable to properly optimize the
second one so the first one ends up using almost half as many
instructions. With this finding and other similar examples, I made
the generated headers construct in the first way to help GCC optimize
all of these functions.

Brute force can also be checked with this code:

void check_auipc_jalr() {
	for (unsigned int auipc = 0; auipc < ((1ULL << 12) - 1); auipc++) {
		for (unsigned int jalr = 0; jalr < ((1ULL << 20) - 1); jalr++) {
			unsigned int auipc_t=riscv_insn_auipc(auipc, 0), jalr_t=riscv_insn_jalr(jalr, 0, 0), auipc_t2=riscv_insn_auipc(auipc, 0), jalr_t2=riscv_insn_jalr(jalr, 0, 0);
			riscv_alternative_fix_auipc_jalr(&auipc_t, &jalr_t, 0);
			riscv_alternative_fix_auipc_jalr2(&auipc_t2, &jalr_t2, 0);

			if (auipc_t != auipc_t2) {
				printf("auipcs don't match %u, %u: %u != %u\n", auipc, jalr, auipc_t, auipc_t2);
				return;
			}

			if (jalr_t != jalr_t2) {
				printf("jalrs don't match %u: %u != %u\n", i, jalr_t, jalr_t2);
			}
		}
	}
}
---
 arch/riscv/include/asm/insn.h   | 74 -----------------------------------------
 arch/riscv/kernel/alternative.c | 23 +++++++++----
 2 files changed, 17 insertions(+), 80 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index d562b2b40ba1..d0e137f9bcd7 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -514,78 +514,4 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 
 #define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
-/*
- * Get the immediate from a J-type instruction.
- *
- * @insn: instruction to process
- * Return: immediate
- */
-static inline s32 riscv_insn_extract_jtype_imm(u32 insn)
-{
-	return RV_EXTRACT_JTYPE_IMM(insn);
-}
-
-/*
- * Update a J-type instruction with an immediate value.
- *
- * @insn: pointer to the jtype instruction
- * @imm: the immediate to insert into the instruction
- */
-static inline void riscv_insn_insert_jtype_imm(u32 *insn, s32 imm)
-{
-	/* drop the old IMMs, all jal IMM bits sit at 31:12 */
-	*insn &= ~GENMASK(31, 12);
-	*insn |= (RV_X_MASK(imm, RV_J_IMM_10_1_OFF, RV_J_IMM_10_1_MASK) << RV_J_IMM_10_1_OPOFF) |
-		 (RV_X_MASK(imm, RV_J_IMM_11_OFF, RV_J_IMM_11_MASK) << RV_J_IMM_11_OPOFF) |
-		 (RV_X_MASK(imm, RV_J_IMM_19_12_OFF, RV_J_IMM_19_12_MASK) << RV_J_IMM_19_12_OPOFF) |
-		 (RV_X_MASK(imm, RV_J_IMM_SIGN_OFF, 1) << RV_J_IMM_SIGN_OPOFF);
-}
-
-/*
- * Put together one immediate from a U-type and I-type instruction pair.
- *
- * The U-type contains an upper immediate, meaning bits[31:12] with [11:0]
- * being zero, while the I-type contains a 12bit immediate.
- * Combined these can encode larger 32bit values and are used for example
- * in auipc + jalr pairs to allow larger jumps.
- *
- * @utype_insn: instruction containing the upper immediate
- * @itype_insn: instruction
- * Return: combined immediate
- */
-static inline s32 riscv_insn_extract_utype_itype_imm(u32 utype_insn, u32 itype_insn)
-{
-	s32 imm;
-
-	imm = RV_EXTRACT_UTYPE_IMM(utype_insn);
-	imm += RV_EXTRACT_ITYPE_IMM(itype_insn);
-
-	return imm;
-}
-
-/*
- * Update a set of two instructions (U-type + I-type) with an immediate value.
- *
- * Used for example in auipc+jalrs pairs the U-type instructions contains
- * a 20bit upper immediate representing bits[31:12], while the I-type
- * instruction contains a 12bit immediate representing bits[11:0].
- *
- * This also takes into account that both separate immediates are
- * considered as signed values, so if the I-type immediate becomes
- * negative (BIT(11) set) the U-type part gets adjusted.
- *
- * @utype_insn: pointer to the utype instruction of the pair
- * @itype_insn: pointer to the itype instruction of the pair
- * @imm: the immediate to insert into the two instructions
- */
-static inline void riscv_insn_insert_utype_itype_imm(u32 *utype_insn, u32 *itype_insn, s32 imm)
-{
-	/* drop possible old IMM values */
-	*utype_insn &= ~(RV_U_IMM_31_12_MASK);
-	*itype_insn &= ~(RV_I_IMM_11_0_MASK << RV_I_IMM_11_0_OPOFF);
-
-	/* add the adapted IMMs */
-	*utype_insn |= (imm & RV_U_IMM_31_12_MASK) + ((imm & BIT(11)) << 1);
-	*itype_insn |= ((imm & RV_I_IMM_11_0_MASK) << RV_I_IMM_11_0_OPOFF);
-}
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index 7642704c7f18..5e9a74ed97e9 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -11,6 +11,7 @@
 #include <linux/cpu.h>
 #include <linux/uaccess.h>
 #include <asm/alternative.h>
+#include <asm/insn.h>
 #include <asm/module.h>
 #include <asm/sections.h>
 #include <asm/vdso.h>
@@ -78,14 +79,24 @@ static void riscv_alternative_fix_auipc_jalr(void *ptr, u32 auipc_insn,
 					     u32 jalr_insn, int patch_offset)
 {
 	u32 call[2] = { auipc_insn, jalr_insn };
+	u32 auipc_imm;
 	s32 imm;
 
 	/* get and adjust new target address */
-	imm = riscv_insn_extract_utype_itype_imm(auipc_insn, jalr_insn);
+	imm = riscv_insn_auipc_extract_imm(auipc_insn) + riscv_insn_jalr_extract_imm(jalr_insn);
 	imm -= patch_offset;
 
+	/*
+	 * When the 32-bit immediate is split across auipc and jalr, the
+	 * constructed immediates need to be treated as individually sign
+	 * extended numbers. Add the sign bit of the lower 12 bits to the upper
+	 * 20 bits to undo the bleeding of the sign.
+	 */
+	auipc_imm = (imm & BIT(11)) << 1;
+
 	/* update instructions */
-	riscv_insn_insert_utype_itype_imm(&call[0], &call[1], imm);
+	riscv_insn_auipc_insert_imm(&call[0], auipc_imm);
+	riscv_insn_jalr_insert_imm(&call[1], imm);
 
 	/* patch the call place again */
 	patch_text_nosync(ptr, call, sizeof(u32) * 2);
@@ -96,11 +107,11 @@ static void riscv_alternative_fix_jal(void *ptr, u32 jal_insn, int patch_offset)
 	s32 imm;
 
 	/* get and adjust new target address */
-	imm = riscv_insn_extract_jtype_imm(jal_insn);
+	imm = riscv_insn_jal_extract_imm(jal_insn);
 	imm -= patch_offset;
 
 	/* update instruction */
-	riscv_insn_insert_jtype_imm(&jal_insn, imm);
+	riscv_insn_jal_insert_imm(&jal_insn, imm);
 
 	/* patch the call place again */
 	patch_text_nosync(ptr, &jal_insn, sizeof(u32));
@@ -127,7 +138,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 				continue;
 
 			/* if instruction pair is a call, it will use the ra register */
-			if (RV_EXTRACT_RD_REG(insn) != 1)
+			if (riscv_insn_jalr_extract_xd(insn) != 1)
 				continue;
 
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
@@ -136,7 +147,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 		}
 
 		if (riscv_insn_is_jal(insn)) {
-			s32 imm = riscv_insn_extract_jtype_imm(insn);
+			s32 imm = riscv_insn_jal_extract_imm(insn);
 
 			/* Don't modify jumps inside the alternative block */
 			if ((alt_ptr + i * sizeof(u32) + imm) >= alt_ptr &&

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
