Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289E1FD5F79
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkh6ZLHdxsYZ1qe4asBwZa2a6WKxOu/x9sVx7fSRXeM=; b=NQzLprI/N/HZt4
	/9cngSaDJMRuXn4xoI16E25QHWhw2PQ2XT2XE+mXJUTQkpRGEjP22M60G8TxoJgaT2uAe3ZMPwbmb
	HkZ27UhXoFVKSJ8iZkLCdGRLQxQG/IAkQMP0NU/WhKJ8NcrmP8pLYVbwCKU8fZdf9Aff31vTdmVPW
	XkWjt0ThkIN0g47nwWHVs2ymQBbyX1FI+5XTbyX7hD8RePBYZfsssdK00Q5i7UsINaoc0eABcCNF8
	Qf4Sc1bG1RTUT1Y91Xzkk2o2ADqzdfXjLE55tDttRsnMmUNIDt10Ww2Vl86F2k5WLiugYbsYP182h
	0QqgavlME5kQtuCBqh2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoM-00000008Egs-3EnP;
	Wed, 08 Apr 2026 04:46:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoI-00000008Ea2-0SLa;
	Wed, 08 Apr 2026 04:46:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9ADC9444F6;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70BEBC19424;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623596;
	bh=28Pl+OELVDYrjnKHvpqyk9Nc5veDPYZ4OMPdmZMvW7E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GNN08DqyJ11gSxnD3eaQxOYp3CWGQGKpfPNAszmFVzKImsJMTa69z+zbJDChRfm+P
	 /ZgTJThtkkelUh2Ap2pvGpqJFjYO76Ob7MXcxwVJPR2TnqoLysVQXNbXk9eRxBDsNS
	 COwnDJj0ejmVnvyRc3/si1Ra+u3PIg7xeekAGlYEfYj+fPbeGn0aww3aEr+AqkqZBs
	 dn1FKdltjmPDI8NAiiNY7JzfxgiKvJyDhV7ZfwFKCbWG3peYCA9pvOFyIGo2Dr0qk4
	 90GiK2/F27D6jWbssQt5OzRk35xKWitKaHRk/u3Q/ZOKnYV7qNvrubBth88ktnLK03
	 TuaaCzzGL1dyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6838DFD5F75;
	Wed,  8 Apr 2026 04:46:36 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:51 -0700
Subject: [PATCH 03/16] riscv: kgdb: Use generated instruction headers
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-3-54b4736a1e77@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=7745;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=wLizDAcF3npqRdFIpBhaPhxXS6KiGYMhVbuxqiXTwRk=;
 b=ULkzl8mpC5vn084DwHwkXEygvEG8yVKFDX4RkJnxoCg2v5M1nwXI5/2tKWLCId8vNwihiojjR
 qy7/I6NRim+AGHMDsTRwrA8Glh20aIIJLuZCJ2UZKbKLgEYdkWmgRCu
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214638_215153_93B30997 
X-CRM114-Status: GOOD (  17.08  )
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

Migrate the code that is decoding instructions for the use of kgdb
single stepping to use the generated instruction headers instead of the
hand-written instruction functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

I tested this again by comparing the original get_step_address()
function with this new version and input all possible 32 bit numbers and
checked that the next_addr was the same in every case.

This is the code I used:

void check_step()
{
	for (unsigned long opcode = 0; opcode < ((1ULL << 32) - 1); opcode++) {
		unsigned long next_addr, next_addr2;
		get_step_address(opcode, &next_addr);
		get_step_address2(opcode, &next_addr2);
		if (next_addr != next_addr2) {
			printf("opcode: %lu -> %lu != %lu\n", opcode, next_addr, next_addr2);
		}
	}
}
---
 arch/riscv/include/asm/insn.h |  21 +++++++++
 arch/riscv/kernel/kgdb.c      | 102 ++++++++++++++++--------------------------
 2 files changed, 60 insertions(+), 63 deletions(-)

diff --git a/arch/riscv/include/asm/insn.h b/arch/riscv/include/asm/insn.h
index d0e137f9bcd7..c808e1e15192 100644
--- a/arch/riscv/include/asm/insn.h
+++ b/arch/riscv/include/asm/insn.h
@@ -514,4 +514,25 @@ static __always_inline bool riscv_insn_is_branch(u32 code)
 
 #define RVV_EXTRACT_VL_VS_WIDTH(x) RVFDQ_EXTRACT_FL_FS_WIDTH(x)
 
+static inline unsigned long riscv_insn_reg_get_val(unsigned long *regs, u32 index)
+{
+	/* register 0 is always 0 and not stored in the register struct */
+	return index ? *(regs + index) : 0;
+}
+
+#define riscv_insn_branch(_insn, regs_ptr, _opcode, _pc, _comparison, type)     \
+	({                                                                      \
+		unsigned long _ret;                                             \
+		if ((type)riscv_insn_reg_get_val(                               \
+			    regs_ptr,                                           \
+			    riscv_insn_##_insn##_extract_xs1(_opcode))          \
+			    _comparison(type) riscv_insn_reg_get_val(           \
+				    regs_ptr,                                   \
+				    riscv_insn_##_insn##_extract_xs2(_opcode))) \
+			_ret = riscv_insn_##_insn##_extract_imm(_opcode);       \
+		else                                                            \
+			_ret = _pc + 4;                                         \
+		_ret;                                                           \
+	})
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 15fec5d1e6de..dd878ba6b47e 100644
--- a/arch/riscv/kernel/kgdb.c
+++ b/arch/riscv/kernel/kgdb.c
@@ -23,97 +23,73 @@ enum {
 static unsigned long stepped_address;
 static unsigned int stepped_opcode;
 
-static int decode_register_index(unsigned long opcode, int offset)
-{
-	return (opcode >> offset) & 0x1F;
-}
-
-static int decode_register_index_short(unsigned long opcode, int offset)
-{
-	return ((opcode >> offset) & 0x7) + 8;
-}
-
-/* Calculate the new address for after a step */
 static int get_step_address(struct pt_regs *regs, unsigned long *next_addr)
 {
 	unsigned long pc = regs->epc;
 	unsigned long *regs_ptr = (unsigned long *)regs;
-	unsigned int rs1_num, rs2_num;
+	unsigned int rs1_num;
 	int op_code;
 
 	if (get_kernel_nofault(op_code, (void *)pc))
 		return -EINVAL;
+
 	if ((op_code & __INSN_LENGTH_MASK) != __INSN_LENGTH_GE_32) {
-		if (riscv_insn_is_c_jalr(op_code) ||
-		    riscv_insn_is_c_jr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVC_C2_RS1_OPOFF);
-			*next_addr = regs_ptr[rs1_num];
-		} else if (riscv_insn_is_c_j(op_code) ||
-			   riscv_insn_is_c_jal(op_code)) {
-			*next_addr = RVC_EXTRACT_JTYPE_IMM(op_code) + pc;
+		if (riscv_insn_is_c_jalr(op_code)) {
+			*next_addr = regs_ptr[riscv_insn_c_jalr_extract_xs1(op_code)];
+		} else if (riscv_insn_is_c_jr(op_code)) {
+			*next_addr = regs_ptr[riscv_insn_c_jr_extract_xs1(op_code)];
+		} else if (riscv_insn_is_c_j(op_code)) {
+			*next_addr = riscv_insn_c_j_extract_imm(op_code) + pc;
+		} else if (riscv_insn_is_c_jal(op_code)) {
+			*next_addr = riscv_insn_c_jal_extract_imm(op_code) + pc;
 		} else if (riscv_insn_is_c_beqz(op_code)) {
-			rs1_num = decode_register_index_short(op_code,
-							      RVC_C1_RS1_OPOFF);
-			if (!rs1_num || regs_ptr[rs1_num] == 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+			rs1_num = riscv_insn_c_beqz_extract_xs1(op_code);
+			if (regs_ptr[8 + rs1_num] == 0)
+				*next_addr = riscv_insn_c_beqz_extract_imm(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else if (riscv_insn_is_c_bnez(op_code)) {
-			rs1_num =
-			    decode_register_index_short(op_code, RVC_C1_RS1_OPOFF);
-			if (rs1_num && regs_ptr[rs1_num] != 0)
-				*next_addr = RVC_EXTRACT_BTYPE_IMM(op_code) + pc;
+			rs1_num = riscv_insn_c_bnez_extract_xs1(op_code);
+			if (regs_ptr[8 + rs1_num] != 0)
+				*next_addr = riscv_insn_c_bnez_extract_imm(op_code) + pc;
 			else
 				*next_addr = pc + 2;
 		} else {
 			*next_addr = pc + 2;
 		}
 	} else {
-		if ((op_code & __INSN_OPCODE_MASK) == __INSN_BRANCH_OPCODE) {
-			bool result = false;
-			long imm = RV_EXTRACT_BTYPE_IMM(op_code);
-			unsigned long rs1_val = 0, rs2_val = 0;
-
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
-			rs2_num = decode_register_index(op_code, RVG_RS2_OPOFF);
-			if (rs1_num)
-				rs1_val = regs_ptr[rs1_num];
-			if (rs2_num)
-				rs2_val = regs_ptr[rs2_num];
-
-			if (riscv_insn_is_beq(op_code))
-				result = (rs1_val == rs2_val) ? true : false;
-			else if (riscv_insn_is_bne(op_code))
-				result = (rs1_val != rs2_val) ? true : false;
-			else if (riscv_insn_is_blt(op_code))
-				result =
-				    ((long)rs1_val <
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bge(op_code))
-				result =
-				    ((long)rs1_val >=
-				     (long)rs2_val) ? true : false;
-			else if (riscv_insn_is_bltu(op_code))
-				result = (rs1_val < rs2_val) ? true : false;
-			else if (riscv_insn_is_bgeu(op_code))
-				result = (rs1_val >= rs2_val) ? true : false;
-			if (result)
-				*next_addr = imm + pc;
-			else
-				*next_addr = pc + 4;
+		if (riscv_insn_is_beq(op_code)) {
+			*next_addr = riscv_insn_branch(beq, regs_ptr, op_code,
+						       pc, ==, unsigned long);
+		} else if (riscv_insn_is_bne(op_code)) {
+			*next_addr = riscv_insn_branch(bne, regs_ptr, op_code,
+						       pc, !=, unsigned long);
+		} else if (riscv_insn_is_blt(op_code)) {
+			*next_addr = riscv_insn_branch(blt, regs_ptr, op_code,
+						       pc, <, long);
+		} else if (riscv_insn_is_bge(op_code)) {
+			*next_addr = riscv_insn_branch(bge, regs_ptr, op_code,
+						       pc, >=, long);
+		} else if (riscv_insn_is_bltu(op_code)) {
+			*next_addr = riscv_insn_branch(bltu, regs_ptr, op_code,
+						       pc, <, unsigned long);
+		} else if (riscv_insn_is_bgeu(op_code)) {
+			*next_addr = riscv_insn_branch(bgeu, regs_ptr, op_code,
+						       pc, >=, unsigned long);
 		} else if (riscv_insn_is_jal(op_code)) {
-			*next_addr = RV_EXTRACT_JTYPE_IMM(op_code) + pc;
+			*next_addr = riscv_insn_jal_extract_imm(op_code) + pc;
 		} else if (riscv_insn_is_jalr(op_code)) {
-			rs1_num = decode_register_index(op_code, RVG_RS1_OPOFF);
+			rs1_num = riscv_insn_jalr_extract_xs1(op_code);
 			if (rs1_num)
-				*next_addr = ((unsigned long *)regs)[rs1_num];
-			*next_addr += RV_EXTRACT_ITYPE_IMM(op_code);
+				*next_addr = regs_ptr[rs1_num];
+			*next_addr += riscv_insn_jalr_extract_imm(op_code);
 		} else if (riscv_insn_is_sret(op_code)) {
 			*next_addr = pc;
 		} else {
 			*next_addr = pc + 4;
 		}
 	}
+
 	return 0;
 }
 

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
