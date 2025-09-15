Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61BF9CAC597
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 12:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uh5jaEN9qxHaf8XXKIO9inNzODLAGitJ+GnA8IZeMlk=; b=47fnocTaVakZkF
	iqmB435CEZmD7FdhwdDIG/9WOJMPTBOErWd4XW2lS2bHkOozpCCpJvAsmjrerFOw7m7NR9u/XYC8Z
	go5Ec6cERvuDkP8TK1omr6lgxZ4mxR15nKcJKdTaOdld655aMOeVo3SO/AqAjYfjvztpE4Ek0/Gk0
	D2bEVc9fXo1d0r3/B2T3Oms1bFxAh1ZfDgwbacA/d8Jg8l4QhE0p4nIrhdE/wJeLp5YeYeKvy78xj
	8sUp3qR0XsdgMmsZ1T43v7a1gtBAhMt2hlWpxDWM+WTkXYwQPAOyv9L2N+SlzIOXzsqSLwoD6Rm00
	+O+pkcps57kEpUYZ8X9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Fk-000000047zP-0Zga;
	Mon, 15 Sep 2025 12:24:16 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy8Fg-000000047xa-2s6H;
	Mon, 15 Sep 2025 12:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=sj
	SqrG5JGVjvm9XZFoJOiIfn6ve0j4UMsIKI6ctHudQ=; b=chg9d1BBpnn4ZrjdV0
	WUky7UkIjXQoZESll/Y9skCu57lKq2VeA7G9TP4OzH6PxFJcCYj17HL7//VfXddT
	hsemxghAV/vPoq5xTGyI4Zh7SwX4qKS8d5BF218UGMM2q7j89pffcYPEG8qMCHVe
	G0ex2BOTUbyGgAIDZ8xWbDF/A=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3_2xJBchoOwBzBQ--.20956S2;
	Mon, 15 Sep 2025 20:23:39 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Tianshun Sun <stsmail163@163.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH] KVM: riscv: Power on secondary vCPUs from migration
Date: Mon, 15 Sep 2025 20:23:34 +0800
Message-ID: <20250915122334.1351865-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3_2xJBchoOwBzBQ--.20956S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tryDXF1UtryxXF4UXw48Xrb_yoW8CrWUpF
	4jkrZY9395JFW7Gw4qyw4kuF4YyFsYg3WaqryDZryjyr4Ygw10yr4kKayjyF95Xrs5Zwna
	vF4YyFy8Crn0ya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-Originating-IP: [2408:823d:2011:2f19:4657:e776:64ca:e2f2]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiTgTJeGjH+nKkeQABsA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_052413_096601_556CD7D2 
X-CRM114-Status: GOOD (  13.98  )
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

The current logic keeps all secondary VCPUs powered off on their
first run in kvm_arch_vcpu_postcreate(), relying on the boot VCPU 
to wake them up by sbi call. This is correct for a fresh VM start,
where VCPUs begin execution at the bootaddress (0x80000000).

However, this behavior is not suitable for VCPUs that are being
restored from a state (e.g., during migration resume or snapshot
load). These VCPUs have a saved program counter (sepc). Forcing
them to wait for a wake-up from the boot VCPU, which may not
happen or may happen incorrectly, leaves them in a stuck state
when using Qemu to migration if smp is larger than one.

So check a cold start and a warm resumption by the value of the 
guest's sepc register. If the VCPU is running for the first time 
*and* its sepc is not the hardware boot address, it indicates a 
resumed vCPU that must be powered on immediately to continue 
execution from its saved context.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Tested-by: Tianshun Sun <stsmail163@163.com>
---
 arch/riscv/kvm/vcpu.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 3ebcfffaa..86aeba886 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -867,8 +867,16 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 	struct kvm_cpu_trap trap;
 	struct kvm_run *run = vcpu->run;
 
-	if (!vcpu->arch.ran_atleast_once)
+	if (!vcpu->arch.ran_atleast_once) {
 		kvm_riscv_vcpu_setup_config(vcpu);
+		/*
+		 * For VCPUs that are resuming (e.g., from migration)
+		 * and not starting from the boot address, explicitly
+		 * power them on.
+		 */
+		if (vcpu->arch.guest_context.sepc != 0x80000000)
+			kvm_riscv_vcpu_power_on(vcpu);
+	}
 
 	/* Mark this VCPU ran at least once */
 	vcpu->arch.ran_atleast_once = true;
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
