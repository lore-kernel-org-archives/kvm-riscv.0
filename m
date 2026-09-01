Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA919C624C6
	for <kvm-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QVS/vcjpXd4AiDQf+cMuCJ2BhSE9tFXWwflT6FniZdA=; b=idIWmnZhkm06Os
	6xpF7LIBq6VVv7DvMJGm8VPTLZxtKZGT1U06GXhdT0h5NUGCQa6Y9dYgaRWpcxAF19jpcYoCVojGt
	HtE6y5W5SEXN8YW2LFuk8y7BQnRS+UocGMudQYtEV4j/nCCQx0n3T8j9g/Fwi1JReraYvDAZnN7dY
	6vH7dkBS2CT0x2M2Zw7XgskRCf+73qxL2LbUNXyumn94BGOzkDAT+4FMyuI4hAqD5lX89IvybVqn1
	nxQ0mcno8DSWTYSWkZlTVHaaWxat3PC3AMYCtDdDOD/Z+0zzep8+j995bl77AYVIGbF8Drp5TW6Dt
	acsqmlaqEngEgdxPSGfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JVn-0000000BCB6-1btB;
	Tue, 01 Sep 2026 08:06:31 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1JVj-0000000BC8S-1nlK;
	Tue, 01 Sep 2026 08:06:30 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-01 (Coremail) with SMTP id qwCowADHYPR1h5ZqTaP9Bg--.30584S2;
	Tue, 01 Sep 2026 16:06:13 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Preserve LCOFIP when checking pending interrupts
Date: Tue,  1 Sep 2026 16:06:08 +0800
Message-ID: <20260901080610.91993-1-pengpeng@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowADHYPR1h5ZqTaP9Bg--.30584S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CrW7tF1xWF1xCrWfuw47CFg_yoW8Zry7pr
	4Ikw1YqrW0qa4Ik342gr40gr1Yg3ykJr43uFZ29a4UJr42qa4ruF4kKa4UAF4rGryF9a4x
	XryIga45uas8Zw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_010627_891686_215B5E7B 
X-CRM114-Status: UNSURE (   9.84  )
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

KVM injects the guest counter-overflow interrupt into HVIP bit 13 and
records the same bit in irqs_pending. The guest enables it through VSIE
LCOFIE, also at bit 13.

kvm_riscv_vcpu_has_interrupts() shifts the complete VSIP valid mask by
VSIP_TO_HVIP_SHIFT before matching it against irqs_pending. That maps
SSIP, STIP, and SEIP to VSSIP, VSTIP, and VSEIP, but incorrectly moves
LCOFIP from bit 13 to bit 14. The following high-interrupt term excludes
all local interrupt bits, so it cannot recover LCOFIP.

As a result, kvm_arch_vcpu_runnable() can report false for a vCPU waiting
in WFI even though an enabled PMU overflow interrupt is pending.

Keep LCOFIP in place while shifting the three interrupt classes that have
distinct VS-level bit positions. This makes a vCPU halted in WFI runnable
when its PMU overflow interrupt is pending.

Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 arch/riscv/kvm/vcpu.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index e062ca1..c6eb3bd 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -487,12 +487,14 @@ int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, u64 mask)
 {
 	unsigned long flags;
-	unsigned long ie;
+	unsigned long ie, vsie;
 	bool ret;
 
 	raw_spin_lock_irqsave(&vcpu->arch.irqs_pending_lock, flags);
-	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-		<< VSIP_TO_HVIP_SHIFT) & (unsigned long)mask;
+	vsie = vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK;
+	ie = ((vsie & ~SIP_LCOFIP) << VSIP_TO_HVIP_SHIFT) |
+	     (vsie & SIP_LCOFIP);
+	ie &= (unsigned long)mask;
 	ie |= vcpu->arch.guest_csr.vsie & ~IRQ_LOCAL_MASK &
 		(unsigned long)mask;
 	ret = vcpu->arch.irqs_pending[0] & ie;


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
