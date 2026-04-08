Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3815FD5F68
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2I7gIqoxTXB4LVs6jC4n6Ogo1T4rjv9pJytZ2pRhmno=; b=xG4q5gZFXljLwV
	uubYSo7Weng6JtPzLyzcVBGCmAf/0+92xHdDNZoZj4bfFGM7eybC9hmUtxWQe0Vz7Q0p6twSfAJAj
	NGwnC+8EzAvZTxH0LcfsuPP0spGN2NPx39atw0lzP2lKMN1BvU9GGhNZVGDEFlZVMuzD7hiAwhQJP
	bTm2JN5AqTYRmOb5LrwClVibtIQazDuxGRnCcoZayDqaNTvjd+fLvEaBG1PgCkrjJEWqGnfgObC3S
	bV55epbq4BSgUlbrK/fZoMyevrp6Ame8iC3ROXhlQAQU1mmAOJDK3PVZ7onNTQor/W5qielNDw7+r
	mQl7mxTMC1Q9XJKphOmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoM-00000008EgZ-1ehZ;
	Wed, 08 Apr 2026 04:46:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoI-00000008Ea4-0NsG;
	Wed, 08 Apr 2026 04:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A881F4454C;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88D84C19425;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623596;
	bh=WXicD/hNpfCw4NB6cXINcHTlbDKL7VCawFxvYvSLarU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=S0qcOGVi9A+bTJ2mGsCdvuMPeJ4j5tULw57vWVgIMi0NJ6f8dKayDBf4W406Gs487
	 nGvhB6H3wEycOjOPArhEXI5hdcYhzAfkSrKRbduujePEEfULRwbD9o3hd2/rUa4VQy
	 9gN/Mdk4z2Qb2PFGkspHnMJObSPXcJU1ShKnjE943EnhinXRt+sZLvO/YGLTaISd3q
	 in1kT7loEYAQeGC/vxEpOxp/rCeEKOOLIKU91QbLp6ZblmVl9WOFYFHq81HIJtz0Xt
	 R6zElaWgwBS/nsHCng7BcPJU2uszPl/DJba0TwpW94iEb7pUMUxIpkxy8HScG4aMVI
	 B0zQbYkpCwEZA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F3FDFD5F73;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:52 -0700
Subject: [PATCH 04/16] riscv: kprobes: Use generated instruction headers
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-4-54b4736a1e77@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=13795;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=x0ANg2ba9l8Mn4apQlq7H0DQOpx0fCInS1ySm/aUzMQ=;
 b=WTs1MOLPde3fj267jM3YEanDHNNrb028JgS6eq7qaMAYL0Gym+xWHOr165xCcNxQ57MfgaqH5
 Vt1Q7N3e+ibDgXuNY2kBZz6UNFhRCTxbeq1Uaat0ra0CF1Wb6mo8WCy
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214638_194588_16D40F41 
X-CRM114-Status: GOOD (  16.55  )
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

Migrate the code that is decoding instruction for the use of kprobes to
use the generated instruction headers instead of the hand-written
instruction functions.

With the more granular instruction support, split the decoding of branches into
their own functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This was again verified by checking all 32-bit values for each of these
functions and checking that the two version have the same behavior.
---
 arch/riscv/include/asm/insn.h            |   7 +
 arch/riscv/kernel/probes/decode-insn.c   |   7 +-
 arch/riscv/kernel/probes/simulate-insn.c | 253 +++++++++++--------------------
 arch/riscv/kernel/probes/simulate-insn.h |   7 +-
 4 files changed, 109 insertions(+), 165 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index c808e1e15192..43440edc6f1d 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -520,6 +520,13 @@ static inline unsigned long riscv_insn_reg_get_val(unsigned long *regs, u32 inde
 	return index ? *(regs + index) : 0;
 }
 
+static inline void riscv_insn_reg_set_val(unsigned long *regs, u32 index, unsigned long val)
+{
+	/* register 0 is always 0 and not stored in the register struct */
+	if (index != 0)
+		*(regs + index) = val;
+}
+
 #define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
 	({                                                                      \
 		unsigned long _ret;                                             \
diff --git a/arch/riscv/kernel/probes/decode-insn.c b/arch/riscv/kernel/probes/decode-insn.c
index 65d9590bfb9f..0d70c8301a45 100644
--- a/arch/riscv/kernel/probes/decode-insn.c
+++ b/arch/riscv/kernel/probes/decode-insn.c
@@ -42,7 +42,12 @@ riscv_probe_decode_insn(probe_opcode_t *addr, struct arch_probe_insn *api)
 	RISCV_INSN_SET_SIMULATE(jal,		insn);
 	RISCV_INSN_SET_SIMULATE(jalr,		insn);
 	RISCV_INSN_SET_SIMULATE(auipc,		insn);
-	RISCV_INSN_SET_SIMULATE(branch,		insn);
+	RISCV_INSN_SET_SIMULATE(beq,		insn);
+	RISCV_INSN_SET_SIMULATE(bne,		insn);
+	RISCV_INSN_SET_SIMULATE(blt,		insn);
+	RISCV_INSN_SET_SIMULATE(bge,		insn);
+	RISCV_INSN_SET_SIMULATE(bltu,		insn);
+	RISCV_INSN_SET_SIMULATE(bgeu,		insn);
 
 	return INSN_GOOD;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.c b/arch/riscv/kernel/probes/simulate-insn.c
index fa581590c1f8..d086d3c6474c 100644
--- a/arch/riscv/kernel/probes/simulate-insn.c
+++ b/arch/riscv/kernel/probes/simulate-insn.c
@@ -4,236 +4,163 @@
 #include <linux/kernel.h>
 #include <linux/kprobes.h>
 
-#include "decode-insn.h"
+#include <asm/insn.h>
 #include "simulate-insn.h"
 
-static inline bool rv_insn_reg_get_val(struct pt_regs *regs, u32 index,
-				       unsigned long *ptr)
-{
-	if (index == 0)
-		*ptr = 0;
-	else if (index <= 31)
-		*ptr = *((unsigned long *)regs + index);
-	else
-		return false;
-
-	return true;
-}
-
-static inline bool rv_insn_reg_set_val(struct pt_regs *regs, u32 index,
-				       unsigned long val)
-{
-	if (index == 0)
-		return true;
-	else if (index <= 31)
-		*((unsigned long *)regs + index) = val;
-	else
-		return false;
-
-	return true;
-}
-
 bool __kprobes simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 *     31    30       21    20     19        12 11 7 6      0
-	 * imm [20] | imm[10:1] | imm[11] | imm[19:12] | rd | opcode
-	 *     1         10          1           8       5    JAL/J
-	 */
-	bool ret;
-	s32 imm;
-	u32 index = RV_EXTRACT_RD_REG(opcode);
+	s32 imm = riscv_insn_jal_extract_imm(opcode);
+	u32 index = riscv_insn_jal_extract_xd(opcode);
 
-	ret = rv_insn_reg_set_val(regs, index, addr + 4);
-	if (!ret)
-		return ret;
-
-	imm = RV_EXTRACT_JTYPE_IMM(opcode);
+	riscv_insn_reg_set_val((unsigned long *)regs, index, addr + 4);
 
 	instruction_pointer_set(regs, addr + imm);
 
-	return ret;
+	return true;
 }
 
 bool __kprobes simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 * 31          20 19 15 14 12 11 7 6      0
-	 *  offset[11:0] | rs1 | 010 | rd | opcode
-	 *      12         5      3    5    JALR/JR
-	 */
-	bool ret;
 	unsigned long base_addr;
-	u32 imm = RV_EXTRACT_ITYPE_IMM(opcode);
-	u32 rd_index = RV_EXTRACT_RD_REG(opcode);
-	u32 rs1_index = RV_EXTRACT_RS1_REG(opcode);
+	s32 imm = riscv_insn_jalr_extract_imm(opcode);
+	u32 rd_index = riscv_insn_jalr_extract_xd(opcode);
+	u32 rs1_index = riscv_insn_jalr_extract_xs1(opcode);
 
-	ret = rv_insn_reg_get_val(regs, rs1_index, &base_addr);
-	if (!ret)
-		return ret;
+	base_addr = riscv_insn_reg_get_val((unsigned long *)regs, rs1_index);
 
-	ret = rv_insn_reg_set_val(regs, rd_index, addr + 4);
-	if (!ret)
-		return ret;
+	riscv_insn_reg_set_val((unsigned long *)regs, rd_index, addr  + 4);
 
-	instruction_pointer_set(regs, (base_addr + sign_extend32((imm), 11))&~1);
+	instruction_pointer_set(regs, (base_addr + imm) & ~1);
 
-	return ret;
+	return true;
 }
 
 bool __kprobes simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 * auipc instruction:
-	 *  31        12 11 7 6      0
-	 * | imm[31:12] | rd | opcode |
-	 *        20       5     7
-	 */
+	u32 rd_index = riscv_insn_auipc_extract_xd(opcode);
+	unsigned long rd_val = addr + (s32)riscv_insn_auipc_extract_imm(opcode);
 
-	u32 rd_idx = RV_EXTRACT_RD_REG(opcode);
-	unsigned long rd_val = addr + (s32)RV_EXTRACT_UTYPE_IMM(opcode);
-
-	if (!rv_insn_reg_set_val(regs, rd_idx, rd_val))
-		return false;
+	riscv_insn_reg_set_val((unsigned long *)regs, rd_index, rd_val);
 
 	instruction_pointer_set(regs, addr + 4);
-
 	return true;
 }
 
-bool __kprobes simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs)
+bool __kprobes simulate_beq(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 * branch instructions:
-	 *      31    30       25 24 20 19 15 14    12 11       8    7      6      0
-	 * | imm[12] | imm[10:5] | rs2 | rs1 | funct3 | imm[4:1] | imm[11] | opcode |
-	 *     1           6        5     5      3         4         1         7
-	 *     imm[12|10:5]        rs2   rs1    000       imm[4:1|11]       1100011  BEQ
-	 *     imm[12|10:5]        rs2   rs1    001       imm[4:1|11]       1100011  BNE
-	 *     imm[12|10:5]        rs2   rs1    100       imm[4:1|11]       1100011  BLT
-	 *     imm[12|10:5]        rs2   rs1    101       imm[4:1|11]       1100011  BGE
-	 *     imm[12|10:5]        rs2   rs1    110       imm[4:1|11]       1100011  BLTU
-	 *     imm[12|10:5]        rs2   rs1    111       imm[4:1|11]       1100011  BGEU
-	 */
-
-	s32 offset;
-	s32 offset_tmp;
-	unsigned long rs1_val;
-	unsigned long rs2_val;
-
-	if (!rv_insn_reg_get_val(regs, RV_EXTRACT_RS1_REG(opcode), &rs1_val) ||
-	    !rv_insn_reg_get_val(regs, RV_EXTRACT_RS2_REG(opcode), &rs2_val))
-		return false;
-
-	offset_tmp = RV_EXTRACT_BTYPE_IMM(opcode);
-	switch (RV_EXTRACT_FUNCT3(opcode)) {
-	case RVG_FUNCT3_BEQ:
-		offset = (rs1_val == rs2_val) ? offset_tmp : 4;
-		break;
-	case RVG_FUNCT3_BNE:
-		offset = (rs1_val != rs2_val) ? offset_tmp : 4;
-		break;
-	case RVG_FUNCT3_BLT:
-		offset = ((long)rs1_val < (long)rs2_val) ? offset_tmp : 4;
-		break;
-	case RVG_FUNCT3_BGE:
-		offset = ((long)rs1_val >= (long)rs2_val) ? offset_tmp : 4;
-		break;
-	case RVG_FUNCT3_BLTU:
-		offset = (rs1_val < rs2_val) ? offset_tmp : 4;
-		break;
-	case RVG_FUNCT3_BGEU:
-		offset = (rs1_val >= rs2_val) ? offset_tmp : 4;
-		break;
-	default:
-		return false;
-	}
-
-	instruction_pointer_set(regs, addr + offset);
+	unsigned long next_addr;
 
+	next_addr = riscv_insn_branch(beq, (unsigned long *)regs, opcode, addr, ==, unsigned long);
+	instruction_pointer_set(regs, next_addr);
 	return true;
 }
 
-bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
+bool __kprobes simulate_bne(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	s32 offset = RVC_EXTRACT_JTYPE_IMM(opcode);
+	unsigned long next_addr;
 
-	instruction_pointer_set(regs, addr + offset);
+	next_addr = riscv_insn_branch(bne, (unsigned long *)regs, opcode, addr, !=, unsigned long);
+	instruction_pointer_set(regs, next_addr);
+	return true;
+}
 
+bool __kprobes simulate_blt(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	unsigned long next_addr;
+
+	next_addr = riscv_insn_branch(blt, (unsigned long *)regs, opcode, addr, <, long);
+	instruction_pointer_set(regs, next_addr);
 	return true;
 }
 
-static bool __kprobes simulate_c_jr_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs,
-					 bool is_jalr)
+bool __kprobes simulate_bge(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 *  15    12 11  7 6   2 1  0
-	 * | funct4 | rs1 | rs2 | op |
-	 *     4       5     5    2
-	 */
+	unsigned long next_addr;
 
-	unsigned long jump_addr;
+	next_addr = riscv_insn_branch(bge, (unsigned long *)regs, opcode, addr, >=, long);
+	instruction_pointer_set(regs, next_addr);
+	return true;
+}
 
-	u32 rs1 = RVC_EXTRACT_C2_RS1_REG(opcode);
+bool __kprobes simulate_bltu(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	unsigned long next_addr;
 
-	if (rs1 == 0) /* C.JR is only valid when rs1 != x0 */
-		return false;
+	next_addr = riscv_insn_branch(bltu, (unsigned long *)regs, opcode, addr, <, unsigned long);
+	instruction_pointer_set(regs, next_addr);
+	return true;
+}
 
-	if (!rv_insn_reg_get_val(regs, rs1, &jump_addr))
-		return false;
+bool __kprobes simulate_bgeu(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	unsigned long next_addr;
+
+	next_addr = riscv_insn_branch(bgeu, (unsigned long *)regs, opcode, addr, >=, unsigned long);
+	instruction_pointer_set(regs, next_addr);
+	return true;
+}
 
-	if (is_jalr && !rv_insn_reg_set_val(regs, 1, addr + 2))
-		return false;
+bool __kprobes simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs)
+{
+	s32 offset = riscv_insn_c_j_extract_imm(opcode);
 
-	instruction_pointer_set(regs, jump_addr);
+	instruction_pointer_set(regs, addr + offset);
 
 	return true;
 }
 
 bool __kprobes simulate_c_jr(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	return simulate_c_jr_jalr(opcode, addr, regs, false);
+	unsigned long next_addr;
+	unsigned long *regs_ptr = (unsigned long *)regs;
+
+	next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(opcode)];
+	instruction_pointer_set(regs, next_addr);
+
+	regs->ra = addr + 2;
+	return true;
 }
 
 bool __kprobes simulate_c_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	return simulate_c_jr_jalr(opcode, addr, regs, true);
+	unsigned long next_addr;
+	unsigned long *regs_ptr = (unsigned long *)regs;
+
+	next_addr = regs_ptr[riscv_insn_c_jalr_extract_xs1(opcode)];
+	instruction_pointer_set(regs, next_addr);
+
+	regs->ra = addr + 2;
+	return true;
 }
 
-static bool __kprobes simulate_c_bnez_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs,
-					   bool is_bnez)
+bool __kprobes simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	/*
-	 *  15    13 12           10 9    7 6                 2 1  0
-	 * | funct3 | offset[8|4:3] | rs1' | offset[7:6|2:1|5] | op |
-	 *     3            3          3             5           2
-	 */
-
-	s32 offset;
 	u32 rs1;
-	unsigned long rs1_val;
+	unsigned long offset;
+	unsigned long *regs_ptr = (unsigned long *)regs;
 
-	rs1 = 0x8 | ((opcode >> 7) & 0x7);
-
-	if (!rv_insn_reg_get_val(regs, rs1, &rs1_val))
-		return false;
-
-	if ((rs1_val != 0 && is_bnez) || (rs1_val == 0 && !is_bnez))
-		offset = RVC_EXTRACT_BTYPE_IMM(opcode);
+	rs1 = riscv_insn_c_bnez_extract_xs1(opcode);
+	if (regs_ptr[8 + rs1] != 0)
+		offset = riscv_insn_c_bnez_extract_imm(opcode);
 	else
 		offset = 2;
 
 	instruction_pointer_set(regs, addr + offset);
-
 	return true;
 }
 
-bool __kprobes simulate_c_bnez(u32 opcode, unsigned long addr, struct pt_regs *regs)
-{
-	return simulate_c_bnez_beqz(opcode, addr, regs, true);
-}
-
 bool __kprobes simulate_c_beqz(u32 opcode, unsigned long addr, struct pt_regs *regs)
 {
-	return simulate_c_bnez_beqz(opcode, addr, regs, false);
+	u32 rs1;
+	unsigned long offset;
+	unsigned long *regs_ptr = (unsigned long *)regs;
+
+	rs1 = riscv_insn_c_beqz_extract_xs1(opcode);
+	if (regs_ptr[8 + rs1] == 0)
+		offset = riscv_insn_c_beqz_extract_imm(opcode);
+	else
+		offset = 2;
+
+	instruction_pointer_set(regs, addr + offset);
+	return true;
 }
diff --git a/arch/riscv/kernel/probes/simulate-insn.h b/arch/riscv/kernel/probes/simulate-insn.h
index 44ebbc444db9..f2f707e92dee 100644
--- a/arch/riscv/kernel/probes/simulate-insn.h
+++ b/arch/riscv/kernel/probes/simulate-insn.h
@@ -21,7 +21,12 @@
 	} while (0)
 
 bool simulate_auipc(u32 opcode, unsigned long addr, struct pt_regs *regs);
-bool simulate_branch(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_beq(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_bne(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_blt(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_bge(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_bltu(u32 opcode, unsigned long addr, struct pt_regs *regs);
+bool simulate_bgeu(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jal(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_jalr(u32 opcode, unsigned long addr, struct pt_regs *regs);
 bool simulate_c_j(u32 opcode, unsigned long addr, struct pt_regs *regs);

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
