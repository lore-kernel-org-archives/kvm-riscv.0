Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E2B9CDB46F
	for <kvm-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 04:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2DtsZ/HI9a7fa1upg9NVLuNf3E/c1f1GtnHX2CbsQBw=; b=RUAni69QOxISxX
	6U05NmDc1jrpDNnN80MLUKxj9ZNACIIeND8BeqqKjlW0mhHKwNZRLsBDwsGc4YdnXf3azjCvupgBU
	H2eKZHcjSSccka2o1xuOQyv/Fuwq2q80iP60z/kp0M9kIkfSM/20wrAQLbNBMlCkj54oNRq4xgwzj
	O9GYAPhH7T1StoRgEMIIWpFvGTY1LWPkk3V55atzNe1NTwR7Y8bZvz6b0ELbjeBVyHTs7TFPSmdHv
	DzdyFyzt8sv2dNZiDOf5sV6sKW/g46dsZhYeMrgdFpfmdRXsPZbqSn563pR5mwcFE264r8butK9cn
	++umqqgVOusPSmtDq5aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVqy-00000004MVo-188n;
	Mon, 22 Jun 2026 04:01:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbVqw-00000004MTQ-2h74;
	Mon, 22 Jun 2026 04:01:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C70EB44543;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B03C4AF0F;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782100901;
	bh=bl8bqy5n0SUc6nwqkyl4Zjq5llPXFc6fIFQnzW3sCvk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=lXXUTEBMRmH9nF9S/9oGHurafzIpiEQ8eO55/DZUn1VONa+1XrlATpqK0Jxdt6lql
	 eKvYZ8RKpuqD4PQRuEKrETeF6SN2tH/YLmwhXJgbclgxk7F5ycUoJyidS6eofGtCNZ
	 hY5FNxH2rJceC3d1RKUs8gdk9DXFOGHP+jUB2gHrCbTpx7CO7cwzahMjNfpecz180H
	 5x4X9O2TN2IMfW3Hcvzlb6Gl6Hq7coCbWWW/+5gViygrLavIWUPTijoDfY3Dfnrd2S
	 FvusMPfZaSBIHgjOVF57kYIwxtBI2VijlXRq98+56UEKtaXfmxf49VCPc5Tzdat0Wt
	 QuA6uxpbpbi6Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D1BCDB470;
	Mon, 22 Jun 2026 04:01:41 +0000 (UTC)
From: Charlie Jenkins via B4 Relay <devnull+thecharlesjenkins.gmail.com@kernel.org>
Date: Sun, 21 Jun 2026 21:01:24 -0700
Subject: [PATCH v2 06/16] riscv: cfi: Use generated instruction headers
MIME-Version: 1.0
Message-Id: <20260621-riscv_insn_table-v2-6-7f0810ee2274@gmail.com>
References: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
In-Reply-To: <20260621-riscv_insn_table-v2-0-7f0810ee2274@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Nam Cao <namcao@linutronix.de>, Alexandre Ghiti <alex@ghiti.fr>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Conor Dooley <conor@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782100900; l=1198;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=1tICEVIvaC4ZLr/Ax7sSaci3FTAyWazsJABtM7N8+oQ=;
 b=cj48hhT9/crCMIqdmT/HMa6q0vDybyuUu6PkaMxzG4Wbulb7zCbgf3j8oz9FPs5+HtjmMrrPN
 pHcOnVIJ+0pCvD7Bo9NqpBGHgiYkApd4kB90aUQdDZ0fMLBriiT6QVe
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=
X-Endpoint-Received: by B4 Relay for thecharlesjenkins@gmail.com/20260605
 with auth_id=810
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

Migrate the code that is decoding cfi instructions to use the generated
instruction headers.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>

---

This function generates the same assembly as before.
---
 arch/riscv/kernel/cfi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/cfi.c b/arch/riscv/kernel/cfi.c
index 6ec9dbd7292e..e38d5f863747 100644
--- a/arch/riscv/kernel/cfi.c
+++ b/arch/riscv/kernel/cfi.c
@@ -40,16 +40,16 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	if (!riscv_insn_is_beq(insn))
 		return false;
 
-	*type = (u32)regs_ptr[RV_EXTRACT_RS1_REG(insn)];
+	*type = (u32)regs_ptr[riscv_insn_beq_extract_xs1(insn)];
 
 	if (get_kernel_nofault(insn, (void *)regs->epc) ||
 	    get_kernel_nofault(insn, (void *)regs->epc + GET_INSN_LENGTH(insn)))
 		return false;
 
 	if (riscv_insn_is_jalr(insn))
-		rs1_num = RV_EXTRACT_RS1_REG(insn);
+		rs1_num = riscv_insn_jalr_extract_xs1(insn);
 	else if (riscv_insn_is_c_jalr(insn))
-		rs1_num = RVC_EXTRACT_C2_RS1_REG(insn);
+		rs1_num = riscv_insn_c_jalr_extract_xs1(insn);
 	else
 		return false;
 

-- 
2.54.0



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
