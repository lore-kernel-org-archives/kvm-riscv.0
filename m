Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338A1C43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5I362qcVR+SVgiB25ggqe1CPcUJHxZIKveq73Nsy/gk=; b=swCC3PfHPtygJx
	PM5yvpJUS3XFivthwr0OkespW78nTGhOe3U/ZP+cdH55zRnh03mJgXsENXMhM2EZ6fWyHyxgyj+Q6
	tePdUMT/3pxZSpiOvdjJo5Ho0zzJ/U2ijJpxKrlkYBFNFcG4FuaOSfusBqlucpw8Ix2mcEzXDVW2l
	zcHSEEW9CDyGiuRzmZmN5cpba+0A42kKtA8BUsBfLZ/NxtYjoCP9867rnbTf9m+HrObNfilX1gpgd
	UwHcw+FErL+/ytFJdX7RgWMAtvuqGQc4jNnu2teElAR1trqkBiOdrRUyyyjuhrnst7hEKHUprG8hJ
	ZtXkptjtm+zvAn8JEnfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5n-0000000GGAS-3qOL;
	Wed, 08 Jul 2026 03:36:59 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5N-0000000GFgs-3fHN
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:42 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c89636920a3so83345a12.1
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481793; x=1784086593; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XuL5cndtDjBcVPpgbJ+RzvkeL6t9sknxgo0zZEVVPzo=;
        b=m6t3evT8lcZBg+tFR33qI3uh9Kmd6G1AjjKaVB9kXlDZCiDdmpf1xDjs4NF6NZJ1kf
         DNhCeuyKRtWxdnktFvvl9QR8X2qqsii+BLy7f9M1rrFhZqlneoG3nbKCfr9ZnhTFwdFZ
         YV3zIlfwjwFaDW+0XLAx2wMBwPAWpba1NQVILS8uUFa0xz6fVvCjPrQrmnQjCxcYH3KI
         fXWXg7Roy030yk64LCBRb/P0Js675vk9kwOrv/gLDmf0qse0SqxzOkd4npPOyvHJSVVM
         zsVIQQjAAq9NN65fWUZnrCGfVnALDkIXDHhu0iShN5OBEhQ7C5iEqioOgRDOJW3kJBIL
         tTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481793; x=1784086593;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XuL5cndtDjBcVPpgbJ+RzvkeL6t9sknxgo0zZEVVPzo=;
        b=GxYcr+ay12uVHpBsMioTPdNsYezcd6AKpZy9MuJCR/uY6in3p9cf+8FKNsVDhgxlbD
         lmlGk3BuViVukSDm+Zj+N9Fp0gbM3O5VGcXJ0QEa323G5Zsw6zUmsjYZgCmM6ejoQ3HE
         HZBM9kb+Cgg5W59jLPLU/HVn2P9QVuGvduCW0y42HLWJfiuWtLB/2HF7uWm5rcE+klyR
         rDX8NvbZCvLVSDSQH4Me95s8kL76hbA9uJ21U5AcvT6Dat2CunUI8r+UIEMQiBSi0JBJ
         0VL1urbdNrdpDZ9Y0XAqJ216WwnB6tUEzdBhtdUUpPTXZM3p8g7O4iXAbnDDlJ50iGxT
         6nBg==
X-Forwarded-Encrypted: i=1; AHgh+RpTJrXZpZs2+thg231p/F8JUbxDO0ADoNZjwtL2IE3JsQ841+3rCPQIwNnLAEQlKiXxMXyoQHyk6FI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg/zrhycYFSDypT2lSRewuGavT/XaEyiUrgxE5/FV/E99Qu59O
	XbW0DO7vJBMBNaNpXly8AHuAykh5te5jNkJJXP0JfP0C9oB7PbiQSWTt
X-Gm-Gg: AfdE7ck1zjx+7qSn8Z/QD8VPG4h1kp57B1W+c6jDJxUhQ7EvgJuqHCBh6kdzKZsBTHA
	IcTShoH9Hpeh1ez40ipx7xS/O6nNX/ixH4s9WsCs2YNrcEHpgGH7LJTMRyEQrPo+4tAXkA0ovNV
	qY67U3Prf3rNuo/4k18TMuyxSvMmxHTbSJDgLww9CPxPvf3eHaT9jdgVJOuTKpPME7hm37gIgJf
	yN/EvpnCPDSoQ3dBi1lFASgZnd0FMyGV/Y3rcra5lk1CEELYwIYtb7kCdsJJQ1eaxPoUkCRzyRt
	8d0RpOAcOjKWM7F2dwX/9oPvrYuh1mBUa5BB29RyxskNdspqqpAf7LS3OTgq/tXGLnJoUOkNQud
	ld95CAe+m7qSsqoJZC68CszkdNywzvuYiVa53QYLk+AJcodq7f8owHx0gQAPOa9K0fPZNnSuuf/
	cpK1J/25B0I+DndGyaya0NzIF7MqptElT9ZzWxEdNOLR8r5eKDsg==
X-Received: by 2002:a05:6a21:4516:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3c0bc9d0fbcmr684699637.34.1783481792993;
        Tue, 07 Jul 2026 20:36:32 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:32 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:31 -0700
Subject: [PATCH v3 08/17] riscv: Use generated instruction headers for
 misaligned loads/stores
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-8-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=13216;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=sxLtVDSOFNa/G4iQ6MMmQTH9uBA/e/XtcS9fjLnlddk=;
 b=bUmzwV+6NqMTkJe5SGVTjMDWe5ErNckgKrdmp3FdCB4yh2hC9ITsfAVF4B59OY1guEPytgE49
 JJWPOcpJqqPDg1DvdfmL/Ul+zJ3lBpKe8O4k1S1QhltHT0tPvUC5zQ3
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203634_175212_934A0C7E 
X-CRM114-Status: GOOD (  16.89  )
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

Migrate the misaligned loads/store code to use the generated instruction
headers instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

Similar to the other patches of this series, I extracted out the logic
of this function and brute forced all possible inputs to validate that
the outputs are the same. To verify this change in the kernel, I booted
on Spike and used the misaligned access checker which does some
misaligned accesses.
---
 arch/riscv/kernel/traps_misaligned.c | 205 +++++++++++++++++------------------
 1 file changed, 97 insertions(+), 108 deletions(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 524215a186e0..ca9a3da3d24f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -22,15 +22,11 @@
 
 #ifdef CONFIG_FPU
 
-#define FP_GET_RD(insn)		(insn >> 7 & 0x1F)
-
 extern void put_f32_reg(unsigned long fp_reg, unsigned long value);
 
-static int set_f32_rd(unsigned long insn, struct pt_regs *regs,
+static int set_f32_rd(unsigned long fp_reg, struct pt_regs *regs,
 		      unsigned long val)
 {
-	unsigned long fp_reg = FP_GET_RD(insn);
-
 	put_f32_reg(fp_reg, val);
 	regs->status |= SR_FS_DIRTY;
 
@@ -39,9 +35,8 @@ static int set_f32_rd(unsigned long insn, struct pt_regs *regs,
 
 extern void put_f64_reg(unsigned long fp_reg, unsigned long value);
 
-static int set_f64_rd(unsigned long insn, struct pt_regs *regs, u64 val)
+static int set_f64_rd(unsigned long fp_reg, struct pt_regs *regs, u64 val)
 {
-	unsigned long fp_reg = FP_GET_RD(insn);
 	unsigned long value;
 
 #if __riscv_xlen == 32
@@ -58,10 +53,8 @@ static int set_f64_rd(unsigned long insn, struct pt_regs *regs, u64 val)
 #if __riscv_xlen == 32
 extern void get_f64_reg(unsigned long fp_reg, u64 *value);
 
-static u64 get_f64_rs(unsigned long insn, u8 fp_reg_offset,
-		      struct pt_regs *regs)
+static u64 get_f64_rs(unsigned long fp_reg, struct pt_regs *regs)
 {
-	unsigned long fp_reg = (insn >> fp_reg_offset) & 0x1F;
 	u64 val;
 
 	get_f64_reg(fp_reg, &val);
@@ -73,10 +66,8 @@ static u64 get_f64_rs(unsigned long insn, u8 fp_reg_offset,
 
 extern unsigned long get_f64_reg(unsigned long fp_reg);
 
-static unsigned long get_f64_rs(unsigned long insn, u8 fp_reg_offset,
-				struct pt_regs *regs)
+static unsigned long get_f64_rs(unsigned long fp_reg, struct pt_regs *regs)
 {
-	unsigned long fp_reg = (insn >> fp_reg_offset) & 0x1F;
 	unsigned long val;
 
 	val = get_f64_reg(fp_reg);
@@ -89,10 +80,8 @@ static unsigned long get_f64_rs(unsigned long insn, u8 fp_reg_offset,
 
 extern unsigned long get_f32_reg(unsigned long fp_reg);
 
-static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
-				struct pt_regs *regs)
+static unsigned long get_f32_rs(unsigned long fp_reg, struct pt_regs *regs)
 {
-	unsigned long fp_reg = (insn >> fp_reg_offset) & 0x1F;
 	unsigned long val;
 
 	val = get_f32_reg(fp_reg);
@@ -107,28 +96,18 @@ static void set_f32_rd(unsigned long insn, struct pt_regs *regs,
 
 static void set_f64_rd(unsigned long insn, struct pt_regs *regs, u64 val) {}
 
-static unsigned long get_f64_rs(unsigned long insn, u8 fp_reg_offset,
-				struct pt_regs *regs)
+static unsigned long get_f64_rs(unsigned long fp_reg, struct pt_regs *regs)
 {
 	return 0;
 }
 
-static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
-				struct pt_regs *regs)
+static unsigned long get_f32_rs(unsigned long fp_reg, struct pt_regs *regs)
 {
 	return 0;
 }
 
 #endif
 
-#define GET_F64_RS2(insn, regs) (get_f64_rs(insn, 20, regs))
-#define GET_F64_RS2C(insn, regs) (get_f64_rs(insn, 2, regs))
-#define GET_F64_RS2S(insn, regs) (get_f64_rs(RVC_RS2S(insn), 0, regs))
-
-#define GET_F32_RS2(insn, regs) (get_f32_rs(insn, 20, regs))
-#define GET_F32_RS2C(insn, regs) (get_f32_rs(insn, 2, regs))
-#define GET_F32_RS2S(insn, regs) (get_f32_rs(RVC_RS2S(insn), 0, regs))
-
 #define __read_insn(regs, insn, insn_addr, type)	\
 ({							\
 	int __ret;					\
@@ -217,13 +196,13 @@ static int handle_vector_misaligned_load(struct pt_regs *regs)
 }
 #endif
 
-static int handle_scalar_misaligned_load(struct pt_regs *regs)
+static noinline int handle_scalar_misaligned_load(struct pt_regs *regs)
 {
 	union reg_data val;
 	unsigned long epc = regs->epc;
 	unsigned long insn;
 	unsigned long addr = regs->badaddr;
-	int fp = 0, shift = 0, len = 0;
+	int fp = 0, shift = 0, len = 0, rd = 0;
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
@@ -238,68 +217,71 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
+	if (riscv_insn_is_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(unsigned long) - len);
-#if defined(CONFIG_64BIT)
-	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
+		rd = riscv_insn_lw_extract_xd(insn);
+	} else if (riscv_insn_is_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(unsigned long) - len);
-	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
+		rd = riscv_insn_ld_extract_xd(insn);
+	} else if (riscv_insn_is_lwu(insn)) {
 		len = 4;
-#endif
-	} else if ((insn & INSN_MASK_FLD) == INSN_MATCH_FLD) {
+		rd = riscv_insn_lwu_extract_xd(insn);
+	} else if (riscv_insn_is_fld(insn)) {
 		fp = 1;
 		len = 8;
-	} else if ((insn & INSN_MASK_FLW) == INSN_MATCH_FLW) {
+		rd = riscv_insn_fld_extract_fd(insn);
+	} else if (riscv_insn_is_flw(insn)) {
 		fp = 1;
 		len = 4;
-	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
+		rd = riscv_insn_flw_extract_fd(insn);
+	} else if (riscv_insn_is_lh(insn)) {
 		len = 2;
 		shift = 8 * (sizeof(unsigned long) - len);
-	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
+		rd = riscv_insn_lh_extract_xd(insn);
+	} else if (riscv_insn_is_lhu(insn)) {
 		len = 2;
-#if defined(CONFIG_64BIT)
-	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
+		rd = riscv_insn_lhu_extract_xd(insn);
+	} else if (riscv_insn_is_c_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(unsigned long) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = (8 + riscv_insn_c_ld_extract_xd(insn));
+	} else if (riscv_insn_is_c_ldsp(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(unsigned long) - len);
-#endif
-	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
+		rd = riscv_insn_c_ldsp_extract_xd(insn);
+	} else if (riscv_insn_is_c_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(unsigned long) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = (8 + riscv_insn_c_lw_extract_xd(insn));
+	} else if (riscv_insn_is_c_lwsp(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(unsigned long) - len);
-	} else if ((insn & INSN_MASK_C_FLD) == INSN_MATCH_C_FLD) {
+		rd = riscv_insn_c_lwsp_extract_xd(insn);
+	} else if (riscv_insn_is_c_fld(insn)) {
 		fp = 1;
 		len = 8;
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_FLDSP) == INSN_MATCH_C_FLDSP) {
+		rd = (8 + riscv_insn_c_fld_extract_fd(insn));
+	} else if (riscv_insn_is_c_fldsp(insn)) {
 		fp = 1;
 		len = 8;
-#if defined(CONFIG_32BIT)
-	} else if ((insn & INSN_MASK_C_FLW) == INSN_MATCH_C_FLW) {
+		rd = riscv_insn_c_fldsp_extract_fd(insn);
+	} else if (riscv_insn_is_c_flw(insn)) {
 		fp = 1;
 		len = 4;
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_FLWSP) == INSN_MATCH_C_FLWSP) {
+		rd = (8 + riscv_insn_c_flw_extract_fd(insn));
+	} else if (riscv_insn_is_c_flwsp(insn)) {
 		fp = 1;
 		len = 4;
-#endif
-	} else if ((insn & INSN_MASK_C_LHU) == INSN_MATCH_C_LHU) {
+		rd = riscv_insn_c_flwsp_extract_fd(insn);
+	} else if (riscv_insn_is_c_lhu(insn)) {
 		len = 2;
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LH) == INSN_MATCH_C_LH) {
+		rd = (8 + riscv_insn_c_lhu_extract_xd(insn));
+	} else if (riscv_insn_is_c_lh(insn)) {
 		len = 2;
-		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
+		shift = 8 * (sizeof(unsigned long) - len);
+		rd = (8 + riscv_insn_c_lh_extract_xd(insn));
 	} else {
 		return -1;
 	}
@@ -315,14 +297,16 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 		memcpy(&val, (u8 *)addr, len);
 	}
 
-	if (!fp)
-		SET_RD(insn, regs, (long)(val.data_ulong << shift) >> shift);
-	else if (len == 8)
-		set_f64_rd(insn, regs, val.data_u64);
-	else
-		set_f32_rd(insn, regs, val.data_ulong);
+	if (rd) {
+		if (!fp)
+			*(unsigned long *)((unsigned long *)regs + rd) = (val.data_ulong << shift) >> shift;
+		else if (len == 8)
+			set_f64_rd(rd, regs, val.data_u64);
+		else
+			set_f32_rd(rd, regs, val.data_ulong);
 
-	regs->epc = epc + INSN_LEN(insn);
+		regs->epc = epc + INSN_LEN(insn);
+	}
 
 	return 0;
 }
@@ -333,7 +317,7 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	unsigned long epc = regs->epc;
 	unsigned long insn;
 	unsigned long addr = regs->badaddr;
-	int len = 0, fp = 0;
+	int fp = 0, len = 0, rd = 0;
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
@@ -346,71 +330,76 @@ static int handle_scalar_misaligned_store(struct pt_regs *regs)
 	if (get_insn(regs, epc, &insn))
 		return -1;
 
-	val.data_ulong = GET_RS2(insn, regs);
-
-	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
+	if (riscv_insn_is_sw(insn)) {
 		len = 4;
-#if defined(CONFIG_64BIT)
-	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
+		rd = riscv_insn_sw_extract_xs2(insn);
+	} else if (riscv_insn_is_sd(insn)) {
 		len = 8;
-#endif
-	} else if ((insn & INSN_MASK_FSD) == INSN_MATCH_FSD) {
+		rd = riscv_insn_sd_extract_xs2(insn);
+	} else if (riscv_insn_is_fsd(insn)) {
 		fp = 1;
 		len = 8;
-		val.data_u64 = GET_F64_RS2(insn, regs);
-	} else if ((insn & INSN_MASK_FSW) == INSN_MATCH_FSW) {
+		rd = riscv_insn_fsd_extract_fs2(insn);
+	} else if (riscv_insn_is_fsw(insn)) {
 		fp = 1;
 		len = 4;
-		val.data_ulong = GET_F32_RS2(insn, regs);
-	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
+		rd = riscv_insn_fsw_extract_fs2(insn);
+	} else if (riscv_insn_is_sh(insn)) {
 		len = 2;
-#if defined(CONFIG_64BIT)
-	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
+		rd = riscv_insn_sh_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sd(insn)) {
 		len = 8;
-		val.data_ulong = GET_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP) {
+		rd = (8 + riscv_insn_c_sd_extract_xs2(insn));
+	} else if (riscv_insn_is_c_sdsp(insn)) {
 		len = 8;
-		val.data_ulong = GET_RS2C(insn, regs);
-#endif
-	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
+		rd = riscv_insn_c_sdsp_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sw(insn)) {
 		len = 4;
-		val.data_ulong = GET_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP) {
+		rd = (8 + riscv_insn_c_sw_extract_xs2(insn));
+	} else if (riscv_insn_is_c_swsp(insn)) {
 		len = 4;
-		val.data_ulong = GET_RS2C(insn, regs);
-	} else if ((insn & INSN_MASK_C_FSD) == INSN_MATCH_C_FSD) {
+		rd = riscv_insn_c_swsp_extract_xs2(insn);
+	} else if (riscv_insn_is_c_fsd(insn)) {
 		fp = 1;
 		len = 8;
-		val.data_u64 = GET_F64_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_FSDSP) == INSN_MATCH_C_FSDSP) {
+		rd = (8 + riscv_insn_c_fsd_extract_fs2(insn));
+	} else if (riscv_insn_is_c_fsdsp(insn)) {
 		fp = 1;
 		len = 8;
-		val.data_u64 = GET_F64_RS2C(insn, regs);
-#if !defined(CONFIG_64BIT)
-	} else if ((insn & INSN_MASK_C_FSW) == INSN_MATCH_C_FSW) {
+		rd = riscv_insn_c_fsdsp_extract_fs2(insn);
+	} else if (riscv_insn_is_c_fsw(insn)) {
 		fp = 1;
 		len = 4;
-		val.data_ulong = GET_F32_RS2S(insn, regs);
-	} else if ((insn & INSN_MASK_C_FSWSP) == INSN_MATCH_C_FSWSP) {
+		rd = (8 + riscv_insn_c_fsw_extract_fs2(insn));
+	} else if (riscv_insn_is_c_fswsp(insn)) {
 		fp = 1;
 		len = 4;
-		val.data_ulong = GET_F32_RS2C(insn, regs);
-#endif
-	} else if ((insn & INSN_MASK_C_SH) == INSN_MATCH_C_SH) {
+		rd = riscv_insn_c_fswsp_extract_fs2(insn);
+	} else if (riscv_insn_is_c_sh(insn)) {
 		len = 2;
-		val.data_ulong = GET_RS2S(insn, regs);
+		rd = (8 + riscv_insn_c_sh_extract_xs2(insn));
 	} else {
+		regs->epc = epc;
 		return -1;
 	}
 
 	if (!IS_ENABLED(CONFIG_FPU) && fp)
 		return -EOPNOTSUPP;
 
-	if (user_mode(regs)) {
-		if (copy_to_user((u8 __user *)addr, &val, len))
-			return -1;
-	} else {
-		memcpy((u8 *)addr, &val, len);
+	if (rd) {
+		if (!fp)
+			val.data_ulong = *(unsigned long *)((unsigned long *)regs + rd);
+		else if (len == 8)
+			val.data_u64 = get_f64_rs(rd, regs);
+		else
+			val.data_ulong = get_f32_rs(rd, regs);
+
+		if (user_mode(regs)) {
+			if (copy_to_user((u8 __user *)addr, &val, len))
+				return -1;
+		} else {
+			memcpy((u8 *)addr, &val, len);
+		}
 	}
 
 	regs->epc = epc + INSN_LEN(insn);

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
