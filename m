Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CCACC43602
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x6KANhhZE4kH4oXPJhwXh0NiPIzCjfZh8ggt9gqx7uw=; b=Z8ToWSoxVYEzdu
	OiHALDZy0wdSGGg/qSFccAjku8QsOEWdFPJ23AZUjIuehhXacEOuksEUK9Ypx/+Vq5AKuMmtDGk2F
	+VhhUxT/fQkYdHcWLo1WVq+axn6esnmlnlCmGeH8lwxxYe2d3WGxtLKeJjZ75/+HtAeRZ0ambto11
	P7odBmxDgqk/UsnfKkxnwzHL7gPS7PSMS3JEZ7a2nqfgzto4BtF6pSq/ZYa6IUeSa3KSZ1gsGiUv6
	CQmF6SUCh5SS9QwiAyVw3kEmcuxrPJzlyzaOfIUxlEp1PPX3Fb32Nn358mTkeus5Qln2NYOxmB+rn
	ozQuV1bBnkc26sQcNQQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ68-0000000GGcW-2Rvw;
	Wed, 08 Jul 2026 03:37:20 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5Z-0000000GFuR-0EGf
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:55 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-38511175ad3so172838a91.2
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481804; x=1784086604; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fwKZNNWDlhtCi/I1t4B53H1ja1azSKNpa2D1FOM09UA=;
        b=fKzbpYgEisLhcM/6Cq2W7wGqeCc9YPmQmpvkVA2fxOxPr9IJtESStOFWVkv62SYktJ
         smr0BTSKotY5HbFKbweeZ4lti66iKyHOqlSVC97wob83+3dyrYfyDMbiZdMvwqr/455B
         UBTEQ2fP6o7uMQWShoEATOrPmSzh2dwte+igVftCpaWiDWFvavb9HqnxeL/OSOgGNpn5
         g86R3Gi/2SUQZr8d76nt5ItNA61T5C3WCjHjaAhnicxPXQi4uNdMMx1KUUf1fxuzag1i
         faDByTKrC/jpD5mkBDa3X5hQj1ZgKlwaT31I3xmJ/jZbyU5G4wU2W7+rWIWrwDZGgdn1
         CQPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481804; x=1784086604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fwKZNNWDlhtCi/I1t4B53H1ja1azSKNpa2D1FOM09UA=;
        b=pqGfIbFgeypGPeiLlZEQAHJSmhGZosZ1ytWO7E6BVqvQaW0vP7TsVD8BpyYMYBg50L
         1lc7fWSj6bAd7MXGdh+YZi7CEwEpRjY8WkUCG7F0Ax5VKRvkNhT5d5TK+UQbHAJk7/fT
         v18uGDQr2jIaRNlcSRYaW5BnliCeLQC8u5+e1MxcZtTeli+RmEDF8bRifW72Y0nqu8F/
         qg8oGy3c5quVkiXQFk7OW/WQzNMgXcCM7/kWcWTm3Rxk+Kza+PZw6U3S/Ll56W/I+rx4
         rLfgHXHObi6O2gBqgLgIWiY/9ZsqCsME8DseI0NCvcL5xnMybGlhgG5yH4/BdEe5o5RG
         8yuQ==
X-Forwarded-Encrypted: i=1; AHgh+Rop2nALRoq2LUSAGIaxg+9S+1fpP6oTOuh7oNOLnuvlXYHIecoo84TCR/AFX1cKy5/x+oi2yQa7mDg=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy+1qdXJpnBe222C4ISwVqLmd118QqXwEWRXyK0vFB9oikDFHi4
	hd/D53Jw0izePYmtIx5nqfAZ0mConPxGDshP6XeO9t66y2PTt8uBpwdr
X-Gm-Gg: AfdE7cncsLnDKLPwrsm6zEPNxIsLhV0+qDVGd966pNBGtoOqeqXOSHlX+AOwJPWd5KU
	6qm6eOaO8XyMSJ+qLxX3LQsUhMN2iryUc0QvE55wbMd325nMdyPw//fw5g5uxY7sNfc9OoJZZC+
	peOdba5dA6fL2GyBgGLJGsnBzbcmqPGb1AKUmM5xIMkL/RLvTtqLXNZSu1eZ38GY636XWhT2vzC
	dxTdYUK1b20FhN5uAj2TjvnQ51RsfQvkbVq5dORSsGmHhQqXMzM7E5IWly64mbkHes+A5ttU/NT
	J6XxkOwo+LUjBEGOTCu2/GPDghctetMGG7GZ9PWi8IwGYe4d+MQTqEx6Gu16kO6DQRgmRFqxFbk
	U4ULpelXOKk4Ua5LaAsg3ymYVs9KOQMgY2m5OSd+PcsBD/kPnW6nhWBn0HKkC66j9n6zHkj0mwh
	Bqc4BowMqssYSgkLcIUChE25IpV2eQ2jNBka/EV/FYbuvmtH+HeA==
X-Received: by 2002:a17:90b:568c:b0:37f:c97a:939f with SMTP id 98e67ed59e1d1-3893f69432cmr693499a91.7.1783481804248;
        Tue, 07 Jul 2026 20:36:44 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:43 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:38 -0700
Subject: [PATCH v3 15/17] riscv: kvm: Use generated instruction headers for
 csr emulation
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-15-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481778; l=5969;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=hnVz9t5TgQFrn5i8H9B8U1HHkKZ7eeoy5Aq5WPkBZMA=;
 b=+XjFaVjA4ADLYfjCy0QAF21tn1MRxeL2Yc23hMKGiKfmZLsS7F6q4BenoZimYvWAU9jj5uzkF
 je6smMa/JoLAk9CNQMqAS7wP5VuOh5YfCAlJcWv2vnr14dGWzkq/8Q7
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203645_388299_3FEC31FF 
X-CRM114-Status: GOOD (  20.67  )
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

Migrate the csr emulation code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---
This can be tested with the introduced csr_test selftest.
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  3 +-
 arch/riscv/kvm/vcpu_insn.c             | 59 +++++++++++++++++-----------------
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_insn.h b/arch/riscv/include/asm/kvm_vcpu_insn.h
index 106fb4c45108..01efdaaede21 100644
--- a/arch/riscv/include/asm/kvm_vcpu_insn.h
+++ b/arch/riscv/include/asm/kvm_vcpu_insn.h
@@ -19,7 +19,8 @@ struct kvm_mmio_decode {
 };
 
 struct kvm_csr_decode {
-	unsigned long insn;
+	unsigned long rd;
+	unsigned long insn_len;
 	int return_handled;
 };
 
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index c3e4cf2cd44b..51eb2c717bff 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -13,8 +13,7 @@
 #include <asm/kvm_vcpu_test_csr.h>
 
 struct insn_func {
-	unsigned long mask;
-	unsigned long match;
+	bool (*cmp)(u32 insn);
 	/*
 	 * Possible return values are as follows:
 	 * 1) Returns < 0 for error case
@@ -131,20 +130,17 @@ static const struct csr_func csr_funcs[] = {
  */
 int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 {
-	ulong insn;
-
 	if (vcpu->arch.csr_decode.return_handled)
 		return 0;
 	vcpu->arch.csr_decode.return_handled = 1;
 
 	/* Update destination register for CSR reads */
-	insn = vcpu->arch.csr_decode.insn;
-	if ((insn >> SH_RD) & MASK_RX)
-		SET_RD(insn, &vcpu->arch.guest_context,
-		       run->riscv_csr.ret_value);
+	if (vcpu->arch.csr_decode.rd)
+		*((ulong *)&vcpu->arch.guest_context +
+		  vcpu->arch.csr_decode.rd) = run->riscv_csr.ret_value;
 
 	/* Move to next instruction */
-	vcpu->arch.guest_context.sepc += INSN_LEN(insn);
+	vcpu->arch.guest_context.sepc += vcpu->arch.csr_decode.insn_len;
 
 	return 0;
 }
@@ -157,7 +153,7 @@ static inline unsigned long get_reg(struct kvm_cpu_context *context, unsigned in
 static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num;
+	unsigned int csr_num, rd;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
@@ -166,26 +162,32 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 		wr_mask = -1UL;
 		new_val = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrw_extract_xs1(insn));
 		csr_num = riscv_insn_csrrw_extract_csr(insn);
+		rd = riscv_insn_csrrw_extract_xd(insn);
 	} else if (riscv_insn_is_csrrs(insn)) {
 		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
 		csr_num = riscv_insn_csrrs_extract_csr(insn);
+		rd = riscv_insn_csrrs_extract_xd(insn);
 	} else if (riscv_insn_is_csrrc(insn)) {
 		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrc_extract_xs1(insn));
 		new_val = 0;
 		csr_num = riscv_insn_csrrc_extract_csr(insn);
+		rd = riscv_insn_csrrc_extract_xd(insn);
 	} else if (riscv_insn_is_csrrwi(insn)) {
 		wr_mask = -1UL;
 		new_val = riscv_insn_csrrwi_extract_imm(insn);
 		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+		rd = riscv_insn_csrrwi_extract_xd(insn);
 	} else if (riscv_insn_is_csrrsi(insn)) {
 		wr_mask = riscv_insn_csrrwi_extract_imm(insn);
 		new_val = -1UL;
 		csr_num = riscv_insn_csrrsi_extract_csr(insn);
+		rd = riscv_insn_csrrsi_extract_xd(insn);
 	} else if (riscv_insn_is_csrrci(insn)) {
-		wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
+		wr_mask = riscv_insn_csrrci_extract_imm(insn);
 		new_val = 0;
-		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+		csr_num = riscv_insn_csrrci_extract_csr(insn);
+		rd = riscv_insn_csrrci_extract_xd(insn);
 	} else {
 		return rc;
 	}
@@ -193,7 +195,8 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	#undef GET_REG
 
 	/* Save instruction decode info */
-	vcpu->arch.csr_decode.insn = insn;
+	vcpu->arch.csr_decode.rd = rd;
+	vcpu->arch.csr_decode.insn_len = INSN_LEN(insn);
 	vcpu->arch.csr_decode.return_handled = 0;
 
 	/* Update CSR details in kvm_run struct */
@@ -237,43 +240,39 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 
 static const struct insn_func system_opcode_funcs[] = {
 	{
-		.mask  = INSN_MASK_CSRRW,
-		.match = INSN_MATCH_CSRRW,
+		.cmp  = riscv_insn_is_csrrw,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRS,
-		.match = INSN_MATCH_CSRRS,
+		.cmp  = riscv_insn_is_csrrs,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRC,
-		.match = INSN_MATCH_CSRRC,
+		.cmp  = riscv_insn_is_csrrc,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRWI,
-		.match = INSN_MATCH_CSRRWI,
+		.cmp  = riscv_insn_is_csrrwi,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRSI,
-		.match = INSN_MATCH_CSRRSI,
+		.cmp  = riscv_insn_is_csrrsi,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_CSRRCI,
-		.match = INSN_MATCH_CSRRCI,
+		.cmp  = riscv_insn_is_csrrci,
 		.func  = csr_insn,
 	},
 	{
-		.mask  = INSN_MASK_WFI,
-		.match = INSN_MATCH_WFI,
+		.cmp  = riscv_insn_is_wfi,
 		.func  = wfi_insn,
 	},
 	{
-		.mask  = INSN_MASK_WRS,
-		.match = INSN_MATCH_WRS,
+		.cmp  = riscv_insn_is_wrs_nto,
+		.func  = wrs_insn,
+	},
+	{
+		.cmp  = riscv_insn_is_wrs_sto,
 		.func  = wrs_insn,
 	},
 };
@@ -286,7 +285,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
 		ifn = &system_opcode_funcs[i];
-		if ((insn & ifn->mask) == ifn->match) {
+		if (ifn->cmp(insn)) {
 			rc = ifn->func(vcpu, run, insn);
 			break;
 		}

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
