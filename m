Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83F6CD98CC
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 14:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9DhVqnW9TdwiI9l4oHoch+j7SBec6Kf5ulERS1p7dl4=; b=39Pziai2ErJKXk
	Q9TIRN3TFVGdDw9sk1ihzEtqsRw/zW8F74VhP6Qn29cuiPyM54nwLZLlw7fuen/OR9FUebAkd3GgZ
	pXz6zSP3sjKTR2q5D6FPQta8g7LgyaUDpjE8OcIrhmglozIqEk/cHigEpirNrGuteAtCCfQwpdNlS
	NCa3bNtHUXhugOSJfeL26XSQZDmD8Qms1/uPCkaXSzOcxFu3M06CFOcb+966xnu2NbtOeIfw2SGkI
	db9T2wJ8uzy6ByUVSaAhbJKLxJBTWfVlN/Exz9PtQV2YhQ4XVM0ktZFJ1/tgesJQvgzGjIwTqq268
	udC9BNU3odQ40NqlbARA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCM-00000003q4W-2oMt;
	Mon, 08 Jun 2026 14:43:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWbCF-00000003pn5-0Bqs
	for kvm-riscv@bombadil.infradead.org;
	Mon, 08 Jun 2026 14:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4idPmv3gw5ipZVUWVE9OuU2Z0pQsmOCSderM6jApiyY=; b=DK81SI5yIQnPKdbV5NPo7BbU60
	rsINYIieHkUTmzFwIjeUeue985joaNLXRP+ghJAl4aktjkEpPBq+F1dYg7vM/0/A0azuKY/8nIo/y
	8a86eF8WSFHyixiGelS1IBvlK2J87kP1NvkrU9nTXjFmsruMg/nNqGKh7MARJxmF9ZoBG274LATau
	CPUuYxa91P2ACUMNh1kFrOkjku8DTemHgacMY3XKYmTtXCnbZueOyRt0w9jdWAR3b38nWQpnyHwFi
	Eqk7nzCXHViOBB7EK2aIfNOVdPwgJR8LDMSHg/3WteuvaIHhJiqvaQLz5r4LvLE2IuD0w0JhhFxb4
	nlqm+zcg==;
Received: from mail.8bytes.org ([2a01:238:42d9:3f00:e505:6202:4f0c:f051])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wWbCB-0000000198z-3AZw
	for kvm-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 14:43:21 +0000
Received: from io.home.8bytes.org (p4ffe1d30.dip0.t-ipconnect.de [79.254.29.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id EF1012028D1;
	Mon,  8 Jun 2026 16:43:14 +0200 (CEST)
From: =?UTF-8?q?J=C3=B6rg=20R=C3=B6del?= <joro@8bytes.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	nsaenz@amazon.com,
	anelkz@amazon.de,
	James.Bottomley@HansenPartnership.com,
	Melody Wang <huibo.wang@amd.com>,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	x86@kernel.org,
	coconut-svsm@lists.linux.dev,
	joerg.roedel@amd.com
Subject: [PATCH 46/60] kvm: x86: Share MTRR state across planes
Date: Mon,  8 Jun 2026 16:42:38 +0200
Message-ID: <20260608144252.351443-47-joro@8bytes.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
References: <20260608144252.351443-1-joro@8bytes.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_154320_041093_9184F93D 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

From: Joerg Roedel <joerg.roedel@amd.com>

Share the MTRR state across all planes of a given VCPU index.

Signed-off-by: Joerg Roedel <joerg.roedel@amd.com>
---
 arch/x86/include/asm/kvm_host.h |  3 ++-
 arch/x86/kvm/mtrr.c             | 12 +++++++-----
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index b0d040528f9d..f30173093c44 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -817,6 +817,8 @@ struct kvm_vcpu_arch_common {
 	 */
 	u32 cpu_caps[NR_KVM_CPU_CAPS];
 
+	/* Cache configuration state */
+	struct kvm_mtrr mtrr_state;
 };
 
 int kvm_arch_vcpu_common_init(struct kvm_vcpu_common *common);
@@ -994,7 +996,6 @@ struct kvm_vcpu_arch {
 	bool smi_pending;    /* SMI queued after currently running handler */
 	u8 handling_intr_from_guest;
 
-	struct kvm_mtrr mtrr_state;
 	u64 pat;
 
 	unsigned switch_db_regs;
diff --git a/arch/x86/kvm/mtrr.c b/arch/x86/kvm/mtrr.c
index 6f74e2b27c1e..610ff975e022 100644
--- a/arch/x86/kvm/mtrr.c
+++ b/arch/x86/kvm/mtrr.c
@@ -23,18 +23,20 @@
 
 static u64 *find_mtrr(struct kvm_vcpu *vcpu, unsigned int msr)
 {
+	struct kvm_vcpu_common *common = vcpu->common;
+
 	int index;
 
 	switch (msr) {
 	case MTRRphysBase_MSR(0) ... MTRRphysMask_MSR(KVM_NR_VAR_MTRR - 1):
 		index = msr - MTRRphysBase_MSR(0);
-		return &vcpu->arch.mtrr_state.var[index];
+		return &common->arch.mtrr_state.var[index];
 	case MSR_MTRRfix64K_00000:
-		return &vcpu->arch.mtrr_state.fixed_64k;
+		return &common->arch.mtrr_state.fixed_64k;
 	case MSR_MTRRfix16K_80000:
 	case MSR_MTRRfix16K_A0000:
 		index = msr - MSR_MTRRfix16K_80000;
-		return &vcpu->arch.mtrr_state.fixed_16k[index];
+		return &common->arch.mtrr_state.fixed_16k[index];
 	case MSR_MTRRfix4K_C0000:
 	case MSR_MTRRfix4K_C8000:
 	case MSR_MTRRfix4K_D0000:
@@ -44,9 +46,9 @@ static u64 *find_mtrr(struct kvm_vcpu *vcpu, unsigned int msr)
 	case MSR_MTRRfix4K_F0000:
 	case MSR_MTRRfix4K_F8000:
 		index = msr - MSR_MTRRfix4K_C0000;
-		return &vcpu->arch.mtrr_state.fixed_4k[index];
+		return &common->arch.mtrr_state.fixed_4k[index];
 	case MSR_MTRRdefType:
-		return &vcpu->arch.mtrr_state.deftype;
+		return &common->arch.mtrr_state.deftype;
 	default:
 		break;
 	}
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
