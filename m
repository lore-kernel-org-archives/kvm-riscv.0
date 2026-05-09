Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 643FFCD3447
	for <kvm-riscv@archiver.kernel.org>; Sat,  9 May 2026 11:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uv7/qTuNYlEUCdR492ZDvnFdp4N+Wfhkg+9omhSrzhw=; b=R17NeSNIV+TMhA
	qFeZKsFRsqwwa2KpSS2RtbHSlCAJJ5XMHmjEd9sgpF/PgF1ncqKirSGToWSwrSdHzjeeP3NxyUZrP
	fRhgmTiNywedsMIhrDtgTlVV6YjsN7pC5t0Uz8K3PoD0Czm2ty8qKLb1KHNmYB1vOuCIMDQseOUwi
	s+Qz/Aw2godAoHhbYFqAagtHM3N14ZaWcck0disS5yKTRcZ6V4BbquoGN0CeM96HrC+ataeDEtUng
	QFFCcHXadVjBUC0fM8P19PHd3Urq8FVgYGwDwIxM7VqzOtf80ZQ9Y4XFcyuJwr7eHpQRXrkvSp5y0
	J19kMqfP3aFOnQ0UT1dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLg3x-00000008rNy-0zUX;
	Sat, 09 May 2026 11:41:41 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLg3s-00000008rMl-2Byk;
	Sat, 09 May 2026 11:41:39 +0000
Received: from yzs (unknown [115.199.218.204])
	by APP-05 (Coremail) with SMTP id zQCowAAHlQhjHf9pbOLKDw--.3401S2;
	Sat, 09 May 2026 19:41:24 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Atish Patra <atish.patra@linux.dev>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] riscv: KVM: Fix missing TLB flush on HENVCFG.PMM updates
Date: Sat,  9 May 2026 19:41:22 +0800
Message-ID: <20260509114122.1868327-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHlQhjHf9pbOLKDw--.3401S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KrWrJF4fXF43CrWktr17GFg_yoW8Ar4UpF
	W3uF95uaykJF1xGF9rta12gF4jkr4vgasIgr9rA342vrZFyF1Fq3yvg34IyryUC3y8X3yF
	kr4YqFW5urn0v3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [115.199.218.204]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiCRACA2n+2gnStgAAs4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_044137_086378_F2C29CF0 
X-CRM114-Status: UNSURE (   9.49  )
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

According to the RISC-V Privileged ISA specification, if henvcfg.PMM is
changed from or to a value where (XLEN-PMLEN) is less than the GPA width
supported by the hgatp translation mode of that guest, hypervisors must
execute an HFENCE.GVMA with rs1=x0.

Currently, when a guest dynamically changes pointer masking mode via the
SBI FWFT extension, kvm_sbi_fwft_set_pointer_masking_pmlen() directly
modifies the hardware CSR_HENVCFG from the non-one-reg-access path
without issuing the required TLB invalidation

Fix this by adding an unconditional HFENCE.GVMA after the CSR write.

This vulnerability was discovered and reported by my SpecHunter, an
AI-driven architecture specification analysis tool.

Link: https://github.com/yizishun/rv-isa-sec/blob/master/output/riscv-isa-manual/pr-2494/linux.txt
Fixes: 48d67106f4a7 ("RISC-V: KVM: Implement ONE_REG interface for SBI FWFT state")
Assisted-by: DeepSeek:DeepSeek-V4-Pro
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_sbi_fwft.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
index 2eab15339694..c2bd3ae699fd 100644
--- a/arch/riscv/kvm/vcpu_sbi_fwft.c
+++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
@@ -186,8 +186,10 @@ static long kvm_sbi_fwft_set_pointer_masking_pmlen(struct kvm_vcpu *vcpu,
 	 * update here so that VCPU see's pointer masking mode change
 	 * immediately.
 	 */
-	if (!one_reg_access)
+	if (!one_reg_access) {
 		csr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
+		kvm_riscv_local_hfence_gvma_all();
+	}
 
 	return SBI_SUCCESS;
 }
-- 
2.51.2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
