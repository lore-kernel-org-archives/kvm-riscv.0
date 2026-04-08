Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 506CBFD5F68
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=66f4v+sQ42CHwQ8zAbHFeKmT09b+PfiA/USfxN96q/E=; b=fyS4VBsX4KJDt2
	9deII7kMTI7wqH8dRjW2kpmpWyMzP9PjuFtoHNcmVevATRgDuVbI31I+Q8glCmCGymBfLKf6taUMv
	jbwcLmiOMZXb+TjbWCYCrGesN+s+8bL5GS3t2yzTnD5K+mH9IyJ2frWyN8kLfGVH3efG0n1lURos6
	BqSrubh5G50amONMJdNCW6zUHcNaQfVAuoRjEC7eSz0++al9uffiyMcj3KIF1cApQv79nLYi9a3T5
	Ix9APHm/qG4eiXLhf5eGQRk6KqZJFTgWO1GSwTVyz6ZwG9m6H7w3XQi3JZVNHEUCaGU0gRySr0sIb
	t3DkwOZcV9Twh86Ql88Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoI-00000008Eb7-3Sbr;
	Wed, 08 Apr 2026 04:46:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoH-00000008Ea3-2kUt;
	Wed, 08 Apr 2026 04:46:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AD82A60139;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59833C2BCB1;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623596;
	bh=m0dL3yAYZBo0Ax2wYzAYaVBbrxY2QN9Hxv/9SE5tFGY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kv/VIE24QHxEqDoJvqHVV/om+O7OBCFjULsoUbBqrmj+i2EXIalq72/62E1eXawu3
	 AhgIbHmao776Qu2iISaPLoyesEqxREI/5egAQMcfuawwotFdH6ybF2ct5sSp6T709P
	 6yKI4VXzG75qZELMTtroRpAdHX9F4cYpFZhs8gW/y0Lxyk97kGEvt1jNKvVC08NXPz
	 /qYqZQgCpc1z/TIGPlmyxK7uKiJmj9bmNcZClWkqZQup7ZNxeaTx0fcIYhQgK5Lrrp
	 mZ+ExWg1ipa0fqI097qoulUDwVxicd3Nvj3pmcTL3wXZe01y1C6h1GBhEFiQoQnw+S
	 6kdTVs4kOoEVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51006FD5F70;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:50 -0700
Subject: [PATCH 02/16] riscv: alternatives: Use generated instruction
 headers for patching code
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-2-54b4736a1e77@gmail.com>
References: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
In-Reply-To: <20260407-riscv_insn_table-v1-0-54b4736a1e77@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Conor Dooley <conor@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=7576;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=JXCpev2GGkdP2+kuuGxKizLYqir1lPNREbstw34ToJM=;
 b=6q4DOCxE9sLo80b7JYetbMtU5or5ZBqteeBHI2mFsiqGtLpaJqFo5BUe4eI6FgA26GZtvU+Fr
 vQrx97MDhwtCnXyonXn7V5FYkLE/CXQ832/D6lHjVuv1JiWHyKE+Da/
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
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
Reply-To: thecharlesjenkins@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <thecharlesjenkins@gmail.com>

Migrate the alternatives patching code to use the generated instruction
headers instead of the hand-written instruction composition functions.

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
index 7642704c7f18..b26a90eb65cc 100644
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
+	auipc_imm = imm + (BIT(11) << 1);
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
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
