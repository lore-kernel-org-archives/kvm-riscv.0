Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BAE9CAC592
	for <kvm-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 15:31:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rLa5apuoaqpJxpTlPQq5wjXhzUi992ItFJAFFnYb8OE=; b=DF4/dJgO4wYATn
	wP4pzA2deyoUSDySspTkfSiWqjI+/vT2zSOZZrLpyiTZYol5fIMOONWZbnxYliyuWUlOthlmjp6zC
	9q5UyrDXwpiQxwgYCWDVR2b/g2CQ5XHvFsePwu9Kc2kFYXmK/GchGE5UaoqC//Zb+YDSuRZFfU1OV
	MO4ej/7VSww2ZoBQ5isG+9xFHmVhm9yny8rfJ/dCJGlku7BO3eWhkBZzqZCsIcEg1QjjN54EBcpHb
	CfRQ1mDpIHremvlyjKHUHhcyDddBTtFhDzQtNNoq8Nc+J75qoMjb+N4ZOvU6wtH+qNS1/5oiGGXml
	ebm9WOLd7cCtgTC/bh4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBAn-00000004xIu-3sot;
	Mon, 15 Sep 2025 15:31:21 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyBAl-00000004xI0-0U1k;
	Mon, 15 Sep 2025 15:31:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=2Z
	MhoW1DNs7CX4cb16cWpeKngS2s2Gd2rkB8a0nMfaU=; b=QfjXwgF9hRiVp/8zHs
	1XR7KqjVOiZ52kFXVwRkLoh5NBsTzbaFxcjZFvTyMw7unAu6olB4TBKRg7N0T8Nq
	ce7iCLX51qU6LDSmTD0YQqx+3t3jdxs/l17WyQURh4NlydJLSwbSXqvUuYiEfSvB
	d3d5Rs0zve3upTjVJBjlxlJ9w=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCnk+BnMMho_C9hDA--.18834S2;
	Mon, 15 Sep 2025 23:27:36 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Radim Krcmar <rkrcmar@ventanamicro.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jinyu Tang <tjytimi@163.com>,
	Tianshun Sun <stsmail163@163.com>
Subject: [RFC PATCH] kvm/riscv: Add ctxsstatus and ctxhstatus for migration
Date: Mon, 15 Sep 2025 23:27:31 +0800
Message-ID: <20250915152731.1371067-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: PigvCgCnk+BnMMho_C9hDA--.18834S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxAryxJw4ruw47ZF4DZF17Awb_yoW5uFy7pF
	ZakwsY9rW0qrWSka42kF4qgry5W3s5G34akr92qry5ZF4UtF4rZrs5K3y5AFyDJFWrXFn2
	kFyrtF18Can0q37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piHa0PUUUUU=
X-Originating-IP: [2408:823d:2011:2f19:4657:e776:64ca:e2f2]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/1tbiTg3JeGjIGXU-ywAEsO
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_083119_645814_1CB80496 
X-CRM114-Status: GOOD (  14.45  )
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

When migrating a VM which guest running in user mode 
(e.g., executing a while(1) application), the target 
VM fails to run because it loses the information of 
guest_context.hstatus and guest_context.sstatus. The 
VM uses the initialized values instead of the correct ones.

This patch adds two new context registers (ctxsstatus and 
ctxhstatus) to the kvm_vcpu_csr structure and implements 
the necessary KVM get and set logic to preserve these values 
during migration.

QEMU needs to be updated to support these new registers.
See https://github.com/tjy-zhu/qemu
for the corresponding QEMU changes.

I'm not sure if adding these CSR registers is a right way. RISCV
KVM doesn't have API to save these two context csrs now. I will
submit the corresponding QEMU patch to the QEMU community if
KVM has API to get and set them.

Signed-off-by: Jinyu Tang <tjytimi@163.com>
Tested-by: Tianshun Sun <stsmail163@163.com>
---
 arch/riscv/include/asm/kvm_host.h |  2 ++
 arch/riscv/include/uapi/asm/kvm.h |  2 ++
 arch/riscv/kvm/vcpu_onereg.c      | 16 ++++++++++++++++
 3 files changed, 20 insertions(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index d71d3299a..55604b075 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -161,6 +161,8 @@ struct kvm_vcpu_csr {
 	unsigned long vsatp;
 	unsigned long scounteren;
 	unsigned long senvcfg;
+	unsigned long ctxsstatus;
+	unsigned long ctxhstatus;
 };
 
 struct kvm_vcpu_config {
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index ef27d4289..cd7d7087f 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -81,6 +81,8 @@ struct kvm_riscv_csr {
 	unsigned long satp;
 	unsigned long scounteren;
 	unsigned long senvcfg;
+	unsigned long ctxsstatus;
+	unsigned long ctxhstatus;
 };
 
 /* AIA CSR registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index cce6a38ea..284ee6e81 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -489,6 +489,12 @@ static int kvm_riscv_vcpu_general_get_csr(struct kvm_vcpu *vcpu,
 	if (reg_num >= sizeof(struct kvm_riscv_csr) / sizeof(unsigned long))
 		return -ENOENT;
 
+	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus))
+		csr->ctxsstatus = vcpu->arch.guest_context.sstatus;
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus))
+		csr->ctxhstatus = vcpu->arch.guest_context.hstatus;
+
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip)) {
 		kvm_riscv_vcpu_flush_interrupts(vcpu);
 		*out_val = (csr->hvip >> VSIP_TO_HVIP_SHIFT) & VSIP_VALID_MASK;
@@ -515,6 +521,16 @@ static int kvm_riscv_vcpu_general_set_csr(struct kvm_vcpu *vcpu,
 
 	((unsigned long *)csr)[reg_num] = reg_val;
 
+	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxsstatus)) {
+		if (csr->ctxsstatus != 0)
+			vcpu->arch.guest_context.sstatus = csr->ctxsstatus;
+	}
+
+	if (reg_num == KVM_REG_RISCV_CSR_REG(ctxhstatus)) {
+		if (csr->ctxhstatus != 0)
+			vcpu->arch.guest_context.hstatus = csr->ctxhstatus;
+	}
+
 	if (reg_num == KVM_REG_RISCV_CSR_REG(sip))
 		WRITE_ONCE(vcpu->arch.irqs_pending_mask[0], 0);
 
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
