Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F475FD5F7B
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sUK5HFWXDfSxibTQ+7RHa2k1anwc/8h4R9yaIhIhrU8=; b=21ON2S1HPxIAx1
	DLkjxTF1bs4lPZiQzeBG06MjNCS5b5nThT/pV5Rw+TyvpjHoyjogQCE5xeD9DFcS2HT7YpnmV/i6d
	7FgU+IKy6mGFfrgG9Z8L/Nrb3XWvImI+tsr0aPMeuyTbvANDkAAehxE+2MMx5dNq71/QSZmCUbQIa
	RQUREHsg2pZInyge5DwO8FucMR1rvB92vPVFd6CklUDCnFtr+poBnRPGZfr99Uky6OCPr40jfGDRF
	FM5znvLhhNIHOJ+q7NTZgbz0TGlLsvNLw0wXNPwpBHeNeplU5iU2tuwA6rSo47wbQagHc7Y/4p/2N
	tzuE/t0SMsFPLCVvEQFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoT-00000008EoQ-2kdp;
	Wed, 08 Apr 2026 04:46:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoK-00000008Ecp-2VYy;
	Wed, 08 Apr 2026 04:46:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 87CBD44454;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62BC1C2BCF6;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623597;
	bh=XY0ZstHXqfYfgtA1S8AQ7RSIe13mnUYY82OL/zH4KU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Tx3nmzri4AzMghvX4Tm1yaViqV7AaZlI8e24U5eM8Yi+4AVA16JvjXkE5fL83gycY
	 9cYxp20pmsJlu30GuoPEZkC2e8HU+Xv5HHLcWmV0M0j8HVj51YqPM2KHTD++gG/2tb
	 seD9vkX4Slqx51IFuXLFOWLc4ijchvVjr2ekgHgaB7gdq/hXEEn0J/WkEN8cn9ffh3
	 FvH+fFOpk8yDW8A05cqWO2vpUj+S7qUitGgxrzNfDG2iXeDkwHoSSnrf+s+yq0ZeJE
	 tneOnIBvr1ZR8E8wyI1lyH/UPDIBROxBAqgs5Hog7je8IuRYPaOVwmjjAbABIE2qBj
	 yHrO7kRKFpJTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 596C7FD5F73;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:45:59 -0700
Subject: [PATCH 11/16] riscv: kvm: Use generated instruction headers for
 mmio emulation
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-11-54b4736a1e77@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=8840;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=/UVDQrQUvbZ5aOgH8m1pSV2EuBX5B263I5vQY5SYago=;
 b=2HmEIVg9U6gaVnKq9aREtjrfTpOCkBdKmi1N5IKel6R8t3TNnM+d2/vvewRkS4i8HeULN99mu
 wc5BI2x2Y1TCxqBWTYmdg0F5JUiOA23t3o9g8BVjZVg1FxEghmBY89a
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214640_769711_4C75784E 
X-CRM114-Status: GOOD (  16.76  )
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

Migrate the mmio emulation code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |   2 +-
 arch/riscv/kvm/vcpu_insn.c             | 127 ++++++++++++++-------------------
 2 files changed, 55 insertions(+), 74 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 350011c83581..106fb4c45108 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -11,7 +11,7 @@ struct kvm_run;
 struct kvm_cpu_trap;
 
 struct kvm_mmio_decode {
-	unsigned long insn;
+	unsigned long rd;
 	int insn_len;
 	int len;
 	int shift;
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index 311e2530f888..1d8741d02242 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -376,7 +376,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     unsigned long htinst)
 {
 	u8 data_buf[8];
-	unsigned long insn;
+	unsigned long insn, rd;
 	int shift = 0, len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
 	struct kvm_cpu_context *ct = &vcpu->arch.guest_context;
@@ -408,44 +408,47 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	}
 
 	/* Decode length of MMIO and shift */
-	if ((insn & INSN_MASK_LW) == INSN_MATCH_LW) {
+	if (riscv_insn_is_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LB) == INSN_MATCH_LB) {
+		rd = riscv_insn_lw_extract_xd(insn);
+	} else if (riscv_insn_is_lb(insn)) {
 		len = 1;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LBU) == INSN_MATCH_LBU) {
+		rd = riscv_insn_lb_extract_xd(insn);
+	} else if (riscv_insn_is_lbu(insn)) {
 		len = 1;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_LD) == INSN_MATCH_LD) {
+		rd = riscv_insn_lbu_extract_xd(insn);
+	} else if (riscv_insn_is_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LWU) == INSN_MATCH_LWU) {
+		rd = riscv_insn_ld_extract_xd(insn);
+	} else if (riscv_insn_is_lwu(insn)) {
 		len = 4;
-#endif
-	} else if ((insn & INSN_MASK_LH) == INSN_MATCH_LH) {
+		rd = riscv_insn_lwu_extract_xd(insn);
+	} else if (riscv_insn_is_lh(insn)) {
 		len = 2;
 		shift = 8 * (sizeof(ulong) - len);
-	} else if ((insn & INSN_MASK_LHU) == INSN_MATCH_LHU) {
+		rd = riscv_insn_lh_extract_xd(insn);
+	} else if (riscv_insn_is_lhu(insn)) {
 		len = 2;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_C_LD) == INSN_MATCH_C_LD) {
+		rd = riscv_insn_lhu_extract_xd(insn);
+	} else if (riscv_insn_is_c_ld(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LDSP) == INSN_MATCH_C_LDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = riscv_insn_c_ld_extract_xd(insn);
+	} else if (riscv_insn_is_c_ldsp(insn)) {
 		len = 8;
 		shift = 8 * (sizeof(ulong) - len);
-#endif
-	} else if ((insn & INSN_MASK_C_LW) == INSN_MATCH_C_LW) {
+		rd = riscv_insn_c_ldsp_extract_xd(insn);
+	} else if (riscv_insn_is_c_lw(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
-		insn = RVC_RS2S(insn) << SH_RD;
-	} else if ((insn & INSN_MASK_C_LWSP) == INSN_MATCH_C_LWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rd = riscv_insn_c_lw_extract_xd(insn);
+	} else if (riscv_insn_is_c_lwsp(insn)) {
 		len = 4;
 		shift = 8 * (sizeof(ulong) - len);
+		rd = riscv_insn_c_lwsp_extract_xd(insn);
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -455,7 +458,7 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		return -EIO;
 
 	/* Save instruction decode info */
-	vcpu->arch.mmio_decode.insn = insn;
+	vcpu->arch.mmio_decode.rd = rd;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
 	vcpu->arch.mmio_decode.shift = shift;
 	vcpu->arch.mmio_decode.len = len;
@@ -498,11 +501,7 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			      unsigned long fault_addr,
 			      unsigned long htinst)
 {
-	u8 data8;
-	u16 data16;
-	u32 data32;
-	u64 data64;
-	ulong data;
+	ulong data, rs2;
 	unsigned long insn;
 	int len = 0, insn_len = 0;
 	struct kvm_cpu_trap utrap = { 0 };
@@ -534,35 +533,30 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		insn_len = INSN_LEN(insn);
 	}
 
-	data = GET_RS2(insn, &vcpu->arch.guest_context);
-	data8 = data16 = data32 = data64 = data;
-
-	if ((insn & INSN_MASK_SW) == INSN_MATCH_SW) {
+	if (riscv_insn_is_sw(insn)) {
 		len = 4;
-	} else if ((insn & INSN_MASK_SB) == INSN_MATCH_SB) {
+		rs2 = riscv_insn_sw_extract_xs2(insn);
+	} else if (riscv_insn_is_sb(insn)) {
 		len = 1;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_SD) == INSN_MATCH_SD) {
+		rs2 = riscv_insn_sb_extract_xs2(insn);
+	} else if (riscv_insn_is_sd(insn)) {
 		len = 8;
-#endif
-	} else if ((insn & INSN_MASK_SH) == INSN_MATCH_SH) {
+		rs2 = riscv_insn_sd_extract_xs2(insn);
+	} else if (riscv_insn_is_sh(insn)) {
 		len = 2;
-#ifdef CONFIG_64BIT
-	} else if ((insn & INSN_MASK_C_SD) == INSN_MATCH_C_SD) {
+		rs2 = riscv_insn_sh_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sd(insn)) {
 		len = 8;
-		data64 = GET_RS2S(insn, &vcpu->arch.guest_context);
-	} else if ((insn & INSN_MASK_C_SDSP) == INSN_MATCH_C_SDSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rs2 = riscv_insn_c_sd_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sdsp(insn)) {
 		len = 8;
-		data64 = GET_RS2C(insn, &vcpu->arch.guest_context);
-#endif
-	} else if ((insn & INSN_MASK_C_SW) == INSN_MATCH_C_SW) {
+		rs2 = riscv_insn_c_sdsp_extract_xs2(insn);
+	} else if (riscv_insn_is_c_sw(insn)) {
 		len = 4;
-		data32 = GET_RS2S(insn, &vcpu->arch.guest_context);
-	} else if ((insn & INSN_MASK_C_SWSP) == INSN_MATCH_C_SWSP &&
-		   ((insn >> SH_RD) & 0x1f)) {
+		rs2 = riscv_insn_c_sw_extract_xs2(insn);
+	} else if (riscv_insn_is_c_swsp(insn)) {
 		len = 4;
-		data32 = GET_RS2C(insn, &vcpu->arch.guest_context);
+		rs2 = riscv_insn_c_swsp_extract_xs2(insn);
 	} else {
 		return -EOPNOTSUPP;
 	}
@@ -571,26 +565,24 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
 	if (fault_addr & (len - 1))
 		return -EIO;
 
-	/* Save instruction decode info */
-	vcpu->arch.mmio_decode.insn = insn;
 	vcpu->arch.mmio_decode.insn_len = insn_len;
-	vcpu->arch.mmio_decode.shift = 0;
-	vcpu->arch.mmio_decode.len = len;
 	vcpu->arch.mmio_decode.return_handled = 0;
 
+	data = *((ulong *)(&vcpu->arch.guest_context) + rs2);
+
 	/* Copy data to kvm_run instance */
 	switch (len) {
 	case 1:
-		*((u8 *)run->mmio.data) = data8;
+		*((u8 *)run->mmio.data) = data;
 		break;
 	case 2:
-		*((u16 *)run->mmio.data) = data16;
+		*((u16 *)run->mmio.data) = data;
 		break;
 	case 4:
-		*((u32 *)run->mmio.data) = data32;
+		*((u32 *)run->mmio.data) = data;
 		break;
 	case 8:
-		*((u64 *)run->mmio.data) = data64;
+		*((u64 *)run->mmio.data) = data;
 		break;
 	default:
 		return -EOPNOTSUPP;
@@ -626,18 +618,13 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
  */
 int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
-	u8 data8;
-	u16 data16;
-	u32 data32;
-	u64 data64;
-	ulong insn;
 	int len, shift;
+	unsigned long data;
 
 	if (vcpu->arch.mmio_decode.return_handled)
 		return 0;
 
 	vcpu->arch.mmio_decode.return_handled = 1;
-	insn = vcpu->arch.mmio_decode.insn;
 
 	if (run->mmio.is_write)
 		goto done;
@@ -647,29 +634,23 @@ int kvm_riscv_vcpu_mmio_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 
 	switch (len) {
 	case 1:
-		data8 = *((u8 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)data8 << shift >> shift);
+		data = *((u8 *)run->mmio.data);
 		break;
 	case 2:
-		data16 = *((u16 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)data16 << shift >> shift);
+		data = *((u16 *)run->mmio.data);
 		break;
 	case 4:
-		data32 = *((u32 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)data32 << shift >> shift);
+		data = *((u32 *)run->mmio.data);
 		break;
 	case 8:
-		data64 = *((u64 *)run->mmio.data);
-		SET_RD(insn, &vcpu->arch.guest_context,
-			(long)data64 << shift >> shift);
+		data = *((u64 *)run->mmio.data);
 		break;
 	default:
 		return -EOPNOTSUPP;
 	}
 
+	*((ulong *)(&vcpu->arch.guest_context) + vcpu->arch.mmio_decode.rd) =
+		(long)data << shift >> shift;
 done:
 	/* Move to next instruction */
 	vcpu->arch.guest_context.sepc += vcpu->arch.mmio_decode.insn_len;

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
