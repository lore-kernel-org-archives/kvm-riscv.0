Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DCC1088E72
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 03:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h9EefwrjikySincOITFwNnMnZ/e8266THncnEWvPwuY=; b=hvBX0UQogXS0iT
	/NRZsHitKLTGAYDKJ9aHFoflJCBoIIsAp77zLcYGZYfQywbr3jAvwP+XPEP2miJEhKONUzPog8v2d
	z9VWjufgUsPuBEx31cxZD1iXZDqj5XQB4vycrjRKXSoq6Ao2TSgt2LdHlOkeyb8UCC8Mc0/E5VEIz
	8antSl3wE5E+sZwasZgeNOLRDiVjvIyHgeBt/ZkwE/vr18MBGCnCnZz9ILYKKuF7vZRMurxlcPNWS
	Y8urZGRLxLA0+bL1Wj3h0gCuK9Gwc4d+BwWs0Tre1jVasTfUutcFDoUAzJojogKUU2ami14vJ9wQX
	cCpzH7auYsf5NMavd2iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Xk-00000009rz4-467K;
	Thu, 19 Mar 2026 03:59:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Xj-00000009ryj-39Yi;
	Thu, 19 Mar 2026 03:59:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=KVi+eN+XOBHfLARggmA1jnAZgpDae5PHmqZb3ZDS6nY=; b=U9tyzclJ+smJjEtOtk4/XEnGLo
	awDR3Gekb21QahRJ8CATnSogcaLfiohdBX48yUnd4YGdyy4E2E8AMxXSs8EYrkryZVV5KirCmfLks
	X6kBWqL5Kb/CVSUcr9KzC2b/O1UI2bY9ADX3mEkDWIYLvIeszQ5/S8fCXvy5j7xIAVX98wbokWIfK
	SrE5xUAX+0QSon7g6aUcK3j85ocwrB6QxSy6oj4KywUMhyGtqvx7XLagrJTmne3c8Kw+1Z5iaHffs
	THYXeOBeg41SGPsXHfRNwC47IVGhYi8N6RXyMfYpVJOuxJ6NAtnm0lb6jzdEwgES19EFdQSAk2Qz+
	qWgItaWQ==;
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w34Xe-0000000CgnO-3EzE;
	Thu, 19 Mar 2026 03:59:30 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowAAHmQyKdLtpTTrUCg--.61883S2;
	Thu, 19 Mar 2026 11:59:07 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix integer overflow in kvm_pmu_validate_counter_mask()
Date: Thu, 19 Mar 2026 03:59:02 +0000
Message-Id: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowAAHmQyKdLtpTTrUCg--.61883S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1xZw1furW7Cw4Uuw43trb_yoW5AF4UpF
	WDGry5Grs5JF1kGa4UAws8Xr15Kr4kKanxCrs0k3yUtr90ga48Zrn5Kry2yrnrJFWkZFya
	yryDuayDuFW5Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_Gr4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU1xhlDUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiBwsLCWm7a4Mi3AAAsK
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_035927_652266_53D6CADC 
X-CRM114-Status: GOOD (  12.65  )
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

When a guest initiates an SBI_EXT_PMU_COUNTER_CFG_MATCH call with
ctr_base=0xfffffffffffffffe, ctr_mask=0xeb5f and flags=0x1
(SBI_PMU_CFG_FLAG_SKIP_MATCH), kvm_riscv_vcpu_pmu_ctr_cfg_match()
first invokes kvm_pmu_validate_counter_mask() to verify whether
ctr_base and ctr_mask are valid, by evaluating:
 !ctr_mask || (ctr_base + __fls(ctr_mask) >= kvm_pmu_num_counters(kvpmu))

With the above inputs, __fls(0xeb5f) equals 15, and adding 15 to
0xfffffffffffffffe causes an integer overflow, wrapping around to 13.
Since 13 is less than kvm_pmu_num_counters(), the validation wrongly
succeeds.

Thereafter, since flags & SBI_PMU_CFG_FLAG_SKIP_MATCH is satisfied,
the code evaluates:
 !test_bit(ctr_base + __ffs(ctr_mask), kvpmu->pmc_in_use)

Here __ffs(0xeb5f) equals 0, so test_bit() receives 0xfffffffffffffffe
as the bit index and attempts to access the corresponding element of
the kvpmu->pmc_in_use, which results in an invalid memory access. This
triggers the following Oops:
 Unable to handle kernel paging request at virtual address e3ebffff12abba89
  generic_test_bit include/asm-generic/bitops/generic-non-atomic.h:128
  kvm_riscv_vcpu_pmu_ctr_cfg_match arch/riscv/kvm/vcpu_pmu.c:758
  kvm_sbi_ext_pmu_handler arch/riscv/kvm/vcpu_sbi_pmu.c:49
  kvm_riscv_vcpu_sbi_ecall arch/riscv/kvm/vcpu_sbi.c:608
  kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:240

The root cause is that kvm_pmu_validate_counter_mask() does not account
for the case where ctr_base itself is out of range, allowing the
subsequent addition to silently overflow and bypass the check.

Fix this by explicitly validating ctr_base against kvm_pmu_num_counters()
before performing the addition.

This bug was found by fuzzing the KVM RISC-V PMU interface.

Fixes: 0cb74b65d2e5e6 ("RISC-V: KVM: Implement perf support without sampling")
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index e873430e596b2..a098a9b417ad8 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -266,8 +266,10 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
 static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ctr_base,
 					 unsigned long ctr_mask)
 {
-	/* Make sure the we have a valid counter mask requested from the caller */
-	if (!ctr_mask || (ctr_base + __fls(ctr_mask) >= kvm_pmu_num_counters(kvpmu)))
+	unsigned long num_ctrs = kvm_pmu_num_counters(kvpmu);
+
+	/* Make sure we have a valid counter mask requested from the caller */
+	if (!ctr_mask || ctr_base >= num_ctrs || (ctr_base + __fls(ctr_mask) >= num_ctrs))
 		return -EINVAL;
 
 	return 0;
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
