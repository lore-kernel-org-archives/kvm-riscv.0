Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3C0FD5F80
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 04:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x29t8KcJJgsRyx+Ty+bv9wYo5sBLjQlCRtdJUfW77nw=; b=GNyK8WWiUl3Rq1
	h6+In8d+gIzTQi3HxXEC7if2H6oPDn+skWl76kELqA2gZdVVaovikC15L7O0/qkNAi4MEJPXEpbNX
	b7PV+9CxVAM8dWmh7Py6VOxU63PWQmCYduLiROGLGF+cbXQkmQITq1nUSr91ig/NkilUNtchpn4ta
	/k/xGMxCL4yDejlkIiRyUsTTPTnl69Da8jfetkSv+zlzROqyUlflQpm2Gj4gNeEOkX0dR/M3zBW+2
	jNNoNdfrMoZrTJhiCuz95ba4PP82XL+UTxa3dkzF9QgHmut58toQZbeZIudHiVRQf/jGry0/zS3nQ
	uYcAJzn0x9ymaIiOLTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoX-00000008EuW-00Lu;
	Wed, 08 Apr 2026 04:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAKoK-00000008EbP-3nwV;
	Wed, 08 Apr 2026 04:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB0C544566;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7A71C4AF0C;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775623597;
	bh=aXtJER1i/jiZHz0CW84YvOWxpOmtfS3CoUtbXJp9/Cc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OR9xTHeT3MlNKwPS8U1Y1pb05eJyHV3/U3E4VrTKW3LVqZasKC1F57rCw90u+/O6k
	 dA+JeWIg0DvrTQ3fr5OhaTjUUjk0KG1o6jthz0EIfjUnDAP/NieCbW+wlcCS52bt/g
	 8NIzlSzq2bphL0e4UnQLAibzsHjSRUdPgCbURsmnDuoZl7HELkIa9qQSpGRPeZeXpf
	 viLjp/o6cCMRY1Bs638WUC+mqtUYoPSOJCZemP8twWojaEe6TH3567MLMGCZ1kJJaC
	 AzDN0rA0W32RlzaaMQZIUhVMkFgscUQlOAYE6u/af23Uh6RLJV6+CkZ+EV7alfwpsG
	 qpPFgLDVdz3yg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED8BFD5F61;
	Wed,  8 Apr 2026 04:46:37 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Tue, 07 Apr 2026 21:46:02 -0700
Subject: [PATCH 14/16] riscv: kvm: Use generated instruction headers for
 csr emulation
MIME-Version: 1.0
Message-Id: <20260407-riscv_insn_table-v1-14-54b4736a1e77@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775623594; l=5943;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=TwE25wT4s7hjayLJ5PBMi46uU0NYnVibnmjh3qrn1zU=;
 b=XfQ/Lc+Oog5aucttwcQK8XV7UR4f3VcYrjcyjIMQ8IPEQOeTwTcmtUzSR4T51lalVGpW9hPeG
 1FVo5tma6BeAhjyhR91dIJZI97CuktklLLZLLQQH5Zp/je9lrj4hcmc
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/2026030
 with auth_id=663
X-Original-From: Charlie Jenkins <thecharlesjenkins@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_214641_043267_42C05983 
X-CRM114-Status: GOOD (  19.15  )
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

Migrate the csr emulation code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---
This can be tested with the introduced csr_test selftest.
---
 arch/riscv/include/asm/kvm_vcpu_insn.h |  3 +-
 arch/riscv/kvm/vcpu_insn.c             | 61 +++++++++++++++++-----------------
 2 files changed, 32 insertions(+), 32 deletions(-)

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
index c5a70de4a579..d666cd24f8c0 100644
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
@@ -154,7 +150,7 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	#define GET_REG(_rd) (*((unsigned long *)(&vcpu->arch.guest_context) + _rd))
 
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num;
+	unsigned int csr_num, rd;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
@@ -163,26 +159,32 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 		wr_mask = -1UL;
 		new_val = GET_REG(riscv_insn_csrrw_extract_xs1(insn));
 		csr_num = riscv_insn_csrrw_extract_csr(insn);
+		rd = riscv_insn_csrrw_extract_xd(insn);
 	} else if (riscv_insn_is_csrrs(insn)) {
 		wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
 		csr_num = riscv_insn_csrrs_extract_csr(insn);
+		rd = riscv_insn_csrrs_extract_xd(insn);
 	} else if (riscv_insn_is_csrrc(insn)) {
-		wr_mask = GET_REG(riscv_insn_csrrs_extract_xs1(insn));
+		wr_mask = GET_REG(riscv_insn_csrrc_extract_xs1(insn));
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
@@ -190,7 +192,8 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 	#undef GET_REG
 
 	/* Save instruction decode info */
-	vcpu->arch.csr_decode.insn = insn;
+	vcpu->arch.csr_decode.rd = rd;
+	vcpu->arch.csr_decode.insn_len = INSN_LEN(insn);
 	vcpu->arch.csr_decode.return_handled = 0;
 
 	/* Update CSR details in kvm_run struct */
@@ -234,43 +237,39 @@ static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 
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
@@ -283,7 +282,7 @@ static int system_opcode_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
 
 	for (i = 0; i < ARRAY_SIZE(system_opcode_funcs); i++) {
 		ifn = &system_opcode_funcs[i];
-		if ((insn & ifn->mask) == ifn->match) {
+		if (ifn->cmp(insn)) {
 			rc = ifn->func(vcpu, run, insn);
 			break;
 		}

-- 
2.52.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
