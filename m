Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA52AC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d+i264iahFFES8F+JuSI5QDiXHCpgCibZsDItRcsLrk=; b=W3L3v21PF7DczG
	vh1ipRyGIGk5g/msMANxoc70bHIs6gsaID73ofmg0AKh2BPQIivsqlPYPtbJCFKFIwT6g8q+4wmiI
	ckscwNnproRrZVEN3jLumWqIKavMse3E1pb4yZg4+4qezfpZhgA+ofb5KfyHY79Vsen+/NIoDFKmK
	7B1Pp75goqcMU08ip/tRfsQFCH/HVSEFdbevIvMHngEFzKkrzE2eQw5rdHFPM9Xjm4GgCkWyf2NlL
	SLiENfi+LcHNiTIAhWrgqmZ1K7Xrq/3iby7cvaTtrjsvrUIQZctE2iGNkNQDqZ+ZsWU//BOEbxDCp
	3BXxJdtXZ/Abvp/dk1ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5r-0000000GGDr-0z0A;
	Wed, 08 Jul 2026 03:37:03 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ5P-0000000GFiE-2DE7
	for kvm-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 03:36:44 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-847aa193d98so160032b3a.3
        for <kvm-riscv@lists.infradead.org>; Tue, 07 Jul 2026 20:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783481795; x=1784086595; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SQP7Zg98ed5QAQ3p607k58/RvHAX4L5abtdMGBqW+Xg=;
        b=djM3WRXmsozQ0irz9TAjI/ELKFyRNT9Su2wLMFRcb1hBwzKlEzHYTFuuvlDpDi/Aag
         8uwRg8lSRm5EvpMiLtKfVsHwj8tkLqV8Ef7dwfV9GnfZaer5RNHoMX5y2xcUTq+yUy71
         iYIzcjtpfm5EQj9gmJMOLuBdAO1qhgucpAOpEZU9JsKQ6PR1z73de+6BTnheGJjbJiOo
         pwUcU7nPD66FIhJhuFBnQDPF3+4ikUnqx1El8x4GNlwiOBePrlTlucfEC+qKfRPmuAZN
         fjnpObUtJjB9EHDFHrnj5TR9vc+SeTFfsOA2+LToMrEfzwYKbPOG5Ddjhhyk1Dm7cxrl
         IWEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783481795; x=1784086595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SQP7Zg98ed5QAQ3p607k58/RvHAX4L5abtdMGBqW+Xg=;
        b=GqPhejGYplEHspjg1jAb5ldI4ONhlHp8aQkWg2iqGlxaLpGwxLeFsaX2iBaQg5Aj/X
         S1BvtHgDYnVNTV6RgpuSiNNtonQRkgUzdwSevyyavBGNe0CnjWyUZVy0K+B0fLQE/4Y8
         EGB1TkccXr5x4T9RXJXfcK8qFw5fvcORgLSXC0SHJ4boWWAQBrMni29uATgxYREH1gYI
         teCueiJkwHt+JqtHzUtKT5n7w3FSZnZ5gKo7enzwglaWC4fjfhah2Va3fTr69u0G+bkn
         sVyUahM+4FjjJm5mRQocdmJgxFMs0pNfeXAr7IgpenZzhZsvm69hurmTsZYGpKA1YisM
         i0Gw==
X-Forwarded-Encrypted: i=1; AHgh+RrUWEU3XOoZDL8VLPazsGNYcjW3YrQ6Mvh2+3iial/JqGmmZznBn2Jjo9UiOQ2rx5Obe5xS0BVmbWQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbOcXw3DJef+FgoIZZ/UTRWvXj5qOqkHM9S754B0CyqSFlyfNV
	ObdOOj6RZhdYKedsh7ZOx92fmc8zACz9RrO6b6dLVc0+EVL6RyninX4Z
X-Gm-Gg: AfdE7clV6nJghKUPXSxAMZLcfNVou+v41rzTuW74Fnm9Ah+tB+Z3uEI9krOrnrXAR7Q
	mgXdwQmBqhqnNNG84gHHkS7gp1flf2SObN/5s7wBitUFTEGxTEGj6DPmzysy1isqEwBVGqaNS9E
	88CHmPFDzUHIIj0SBxomPxFLFPQrudm6UZ7faeBvMpGV0c5HAjbJmfmB1K7CkS5HZ3uxVN76pj/
	p0cu4mJrekxFY9wiTAuvdysGSx1u9ZyYNzW0CddfEDtTNpcNzPH1ekchXeFi3HK+2wBson2Cjk/
	/a1dPh35jNaIfi0aEYOIURwJomDBsHp5hxjA4Lcy8qgzdRkj39AaPv0pfeAP/s5JSrWCgCvITOj
	n1E93yZUbPtsDmLy3DRgHLHbfXE4ArzUdqTqdAkLDtz3WCm2tYQzUHt5+B2Bm3v+bNMCHqvc8/r
	vytIdJ2bjmHhULEm2yLk0ZBvmg/fPLczRW+k524Z4=
X-Received: by 2002:a05:6a20:12d0:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3c0bc8c3838mr706484637.5.1783481794544;
        Tue, 07 Jul 2026 20:36:34 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::94ac])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accae5sm21092850eec.29.2026.07.07.20.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 20:36:34 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Tue, 07 Jul 2026 20:34:32 -0700
Subject: [PATCH v3 09/17] riscv: kvm: Use generated instruction headers for
 csr code
MIME-Version: 1.0
Message-Id: <20260707-riscv_insn_table-v3-9-3f8e5f75ba97@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783481777; l=3063;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=8h6OBVit0ds2zZ8RVCdpLv2LV7rJmlpswIauG6njnhM=;
 b=nvPyCvQ98MT+LzRjxR/eVGC5foeEGKAjYI/KWit5kqNp0b4lsnz1ixztK11IvVWEoTuM2qj9P
 MpHVRzte8/HCD0KZ4tfz44btH0dFJxu0tvHmYpcZ8QBhsv3AvWMzkeH
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203636_018037_878F9982 
X-CRM114-Status: GOOD (  13.81  )
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

Migrate the csr parsing code to use the generated instruction headers
instead of the hand-written instruction composition functions.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This is a simple transformation that I have again validated through
brute force.
---
 arch/riscv/kvm/vcpu_insn.c | 50 +++++++++++++++++++++++++---------------------
 1 file changed, 27 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f09f9251d1f0..a1898ab8bbe8 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -144,45 +144,49 @@ int kvm_riscv_vcpu_csr_return(struct kvm_vcpu *vcpu, struct kvm_run *run)
 	return 0;
 }
 
+static inline unsigned long get_reg(struct kvm_cpu_context *context, unsigned int rd)
+{
+	return *((unsigned long *)(context) + rd);
+}
+
 static int csr_insn(struct kvm_vcpu *vcpu, struct kvm_run *run, ulong insn)
 {
 	int i, rc = KVM_INSN_ILLEGAL_TRAP;
-	unsigned int csr_num = insn >> SH_RS2;
-	unsigned int rs1_num = (insn >> SH_RS1) & MASK_RX;
-	ulong rs1_val = GET_RS1(insn, &vcpu->arch.guest_context);
+	unsigned int csr_num;
 	const struct csr_func *tcfn, *cfn = NULL;
 	ulong val = 0, wr_mask = 0, new_val = 0;
 
 	/* Decode the CSR instruction */
-	switch (GET_FUNCT3(insn)) {
-	case GET_FUNCT3(INSN_MATCH_CSRRW):
+	if (riscv_insn_is_csrrw(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_val;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRS):
-		wr_mask = rs1_val;
+		new_val = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrw_extract_xs1(insn));
+		csr_num = riscv_insn_csrrw_extract_csr(insn);
+	} else if (riscv_insn_is_csrrs(insn)) {
+		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrs_extract_xs1(insn));
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRC):
-		wr_mask = rs1_val;
+		csr_num = riscv_insn_csrrs_extract_csr(insn);
+	} else if (riscv_insn_is_csrrc(insn)) {
+		wr_mask = get_reg(&vcpu->arch.guest_context, riscv_insn_csrrc_extract_xs1(insn));
 		new_val = 0;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRWI):
+		csr_num = riscv_insn_csrrc_extract_csr(insn);
+	} else if (riscv_insn_is_csrrwi(insn)) {
 		wr_mask = -1UL;
-		new_val = rs1_num;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRSI):
-		wr_mask = rs1_num;
+		new_val = riscv_insn_csrrwi_extract_imm(insn);
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrsi(insn)) {
+		wr_mask = riscv_insn_csrrwi_extract_imm(insn);
 		new_val = -1UL;
-		break;
-	case GET_FUNCT3(INSN_MATCH_CSRRCI):
-		wr_mask = rs1_num;
+		csr_num = riscv_insn_csrrsi_extract_csr(insn);
+	} else if (riscv_insn_is_csrrci(insn)) {
+		wr_mask = GET_REG(riscv_insn_csrrwi_extract_imm(insn));
 		new_val = 0;
-		break;
-	default:
+		csr_num = riscv_insn_csrrwi_extract_csr(insn);
+	} else {
 		return rc;
 	}
 
+	#undef GET_REG
+
 	/* Save instruction decode info */
 	vcpu->arch.csr_decode.insn = insn;
 	vcpu->arch.csr_decode.return_handled = 0;

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
