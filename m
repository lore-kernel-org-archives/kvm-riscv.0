Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F0FC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:36:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4QBxFM+lWS4VsaslX8GhW/WFqqFG21wGV344SJ0xtY=; b=AIJSxpC8CJUiSG
	bwCyj51Unz2CFRjO/1b7RBfgMR15gAJiuvetZp9zQ+np//2vSVzxx9zLyNB3ddixuiYo1KocA14Bw
	qIfvT7Y8bXSFk0J+f5Pwo8XVWuLSWoc5EMNWFE48T+bSqgeRU8Z7SASlXEr8UKqCU5OvyKCFxDAPO
	apbnZy8l0DmnWMf7wVg8cnLkbM6hbqk7wUh/pC1sUHwkNweTMhxConWaJ3g23U7boTwj41Qj7DBPi
	PGTWBM0d+6p0NkYxql7vFP1q+QDbdtSzFZwh658zYzGNKznLE47sBr+nuTeXKx3tdDvFWHGgsSgMW
	w7vhPiAuuFcqVnxr6o3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5T-0000000GFmV-0fU2;
	Wed, 08 Jul 2026 03:36:39 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5F-0000000GFbL-1QgH
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:27 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-37fc02e660bso296944a91.0
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481784; x=1784086584; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvffsWlG6NIDI4wpXBTvJiGnizG3fIiSLad7tqLqNo8=;
        b=e/eYYarbz/zN82ZdprY+wAAI8P+aCENdC07AeTLYftwlO8whx52q9Z4wZzUgYYfy7J
         f2PSwVlCAQLsYy8b+Z9vOUxOB36ORdP+6VvB4O89a+EdQH3wndQPyLsUTIufevhaLk4G
         g+TGam7ZScOy1Mo2IhR4nJar+4pMXvzto3V43BzSHIplZtg+V8Zu46orzSnybhKG1v9R
         uqbycQanWJTIJwZyohmGdaRgNquQaFkRRwUvj00DUB5ZzMAxjRYcsJkqw7SEQM0Ohe7M
         QaenNXshDc050v5FB4ME+NM/9I2AS84+myh0icbzF9TGinQAP1/mfkgsdRUExwnq0MPh
         VLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481784; x=1784086584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvffsWlG6NIDI4wpXBTvJiGnizG3fIiSLad7tqLqNo8=;
        b=o4EScScRyBw3b+kchhxMmmUs2gk+9QxkqHhUl5ZL2wsx67S9CIZuIIZ65n/myCgTJ7
         HcYo7Q5L2a1hjYXsAOe+Pn6Fw+5zNV+P/jb/CzI/rE/24TaD9ntC58uOJll2Su/U3V71
         qitbSLcBCTo4o68b+5h2LLXzIJfx2NpXRALhzxZ0hdRazu9BVwB7BHYGfG0TBuatu1HB
         4vax1rIGC4tug7mNzI88xekSRAw/efDgSXnlApaMumAanZo4sCV16QsATj2mQImn6pb+
         83Hx/JwVODCtQ2pb5KwC1ltJfSXryvsRtlo/jzDYY2vk4bo5E/pB5s+u+oV4akmf5pEl
         bn6A==
X-Forwarded-Encrypted: i=1; AHgh+RqahpOfANiBZuBiTOmexXlJ2oEbj7mbTvR64XYMZUxAgNZnHxgvMiXMeyHmrhagTuCW+c0OYcvY0Wk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5wYZfeIZJ2o5f/wFJGipjnEuMmJ7UKyTEN0g9mYVB4UBRWoyn
	x11I3h+3OoSZ6BF5UcpZOKWDsdPFv6AXBCH7thNO3qmqMlBN4wcQ7Hmu
X-Gm-Gg: AfdE7cn3tJWK6M4E3oUeBsP3Jc1i4Q6KyqmXWa+WWur6ylABXnXHLXhwWmUOMiDU2lt
	sSC30Zhqaj7YrdavsEgesqrnJEacwbxzqcLR+jPi6MhS++qjqtdmRf+31LtitO+bDu6Q+giynqr
	5SKZilDKGJuNwrG9VHiabLsUMcNMi47xO6kAyzJO5Ldg5yQVpk8aGbrKB6n4XRt11RIg+uAO9XL
	DmFxGYdbTuJpUkYTuRSgYDv5nuVhwQPggUgmFOazoTYiSXhxip8Yb04QWhHulWxl9prbgAzW0/t
	uZ0NBwTW4aiv4ItkK6M2qia+xGk6eeIcHlFjtquBNvC+d3AfRG8y5GbvF8HrFYN789NfWliIkFl
	4SGLLXTMcczJDcg9vaZp7nFvo707is8+wyYurl1T5NAknpCO4BA5lJlfHbnTefeF9/ZHAU5vI9X
	WLx/iV2+YfnW35A41Hny3uNWh5jgonW0+Sg3nAelY=
X-Received: by 2002:a05:6a20:428b:b0:3c0:9c19:658f with SMTP id adf61e73a8af0-3c0bd00234cmr649122637.73.1783481784340;
        Tue, 07 Jul 2026 20:36:24 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:23 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:26 -0700
Subject: [PATCH v3 03/17] riscv: kgdb: Use generated instruction headers
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-3-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=7745;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=IjVaLmAyDsdmOm3A507KtKDP292jEnsVxwzZ/J7AzEQ=;
 b=mBC0UXZEz49zdrNmAX+X8iCdHwZI8pY0Y8/OGEoAve1HO2d2ZHbPUA3ECdGF8IjqpPMzn/c/h
 vQ+Yx+OV20OCyC33LTSB7DIlSCICWxDFemHYeAoWep7czBEeu1Y3L8R
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203625_586383_68D77928 
X-CRM114-Status: GOOD (  18.42  )
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
index d0e137f9bcd7..b92c71896c00 100644
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
+			_ret = _pc + riscv_insn_##_insn##_extract_imm(_opcode); \
+		else                                                            \
+			_ret = _pc + 4;                                         \
+		_ret;                                                           \
+	})
+
 #endif /* _ASM_RISCV_INSN_H */
diff --git a/arch/riscv/kernel/kgdb.c b/arch/riscv/kernel/kgdb.c
index 0bf629204c76..fcf7cda3cc33 100644
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
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
