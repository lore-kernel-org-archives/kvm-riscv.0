Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0DD6FCE087
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAwBKZS1d5PdwLXmZgCScUhkkNNXLh3Uyov/Zcl4T0I=; b=s2SBNM7Cl6lyy0
	RfzYd9eVtf3TgBsSP49G4FJPCchj8IzBH5XAMf8ZBwsMI+Ca5VsTatlETTwztfMFO6go7CyjNlf80
	+TY3LH7Ts4V9VZblEyWddIocG9EinIm12F46ITJxqFkhhiTY+v8uhE6pQPmSVogVnRfI0Fps3KXFT
	mWnxK1/7+Fv4DPRYNa7OaFG3ae2CmXUhL8I9KXAQxHWPDJBHcGULvwPZjZOXJmwTMKO0V3cZo4waJ
	A8wau/P9YEl61YBpaYQB6oBO6JnAJuy+zwl1uB+fdVUtwCPHv8vY/BqQSwDfAyja3z1gCMB4Gf6a6
	+iEJhBFCZcWmhOuUKx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDP-00000006JeD-0Lkb;
	Thu, 26 Feb 2026 14:19:43 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDM-00000006JTA-3Hjd;
	Thu, 26 Feb 2026 14:19:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jAeCECNlZO1euMlCtdN550hykLYZFsNroN+0wfjKXiE=; b=U/Xd5ZKkugLw4jKH46vDneAvZt
	thgWfeRlQiGg57cm5hQq1sFPZpOyeZpwDSvQHndFDsW8VhO1wCSNRxq2NKDBKTqGC2UR87ky/toI0
	sv2v3QzTEeCIMwbHaRQO4JcyJXh7V2nYbFX9JGgHtgzOGaKu2KjHwz7Sy3S9L4ztcv40rHoeOm7g9
	rhfAuT1aaHG78sjRl9Ji6OcEQSjjVO11rd4K6ltPFL5CssSp7DWii4qjvtthmWh4dWhOUY/C/igou
	IHrMhsZ22Zw+SjzyLhpU3dNjMnuZlzvKgkoByFEBkytskW1PWxV0G5zZcT6eI8WbVhJ9BXrA25EI3
	7pEMUIyQ==;
Received: from mailer.gwdg.de ([134.76.10.26]:60674)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDC-006EG9-09;
	Thu, 26 Feb 2026 15:19:30 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDC-0009wl-1u;
	Thu, 26 Feb 2026 15:19:30 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 15:19:24 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Thu, 26 Feb 2026 15:18:59 +0100
Subject: [PATCH 2/4] KVM: riscv: Fix Spectre-v1 in AIA CSR access
MIME-Version: 1.0
Message-ID: <20260226-kvm-riscv-spectre-v1-v1-2-5f930ea16691@cispa.de>
References: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
In-Reply-To: <20260226-kvm-riscv-spectre-v1-v1-0-5f930ea16691@cispa.de>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
	<ajones@ventanamicro.com>
CC: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Daniel
 Weber <daniel.weber@cispa.de>, Michael Schwarz <michael.schwarz@cispa.de>,
	Marton Bognar <marton.bognar@kuleuven.be>, Jo Van Bulck
	<jo.vanbulck@kuleuven.be>, Lukas Gerlach <lukas.gerlach@cispa.de>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2015;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=GFfVWFqoNPRvvXxOXJ4Garf8GrDfVffFbdN0xbFwWQM=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLwuIfLzVcePOR7OkbR7qXJLL5P7wzzfT4Pc9ZSyb8Z
 g1+mqH3rqOUhUGMg0FWTJFlquBrxr49DjxJmYfPwcxhZQIZwsDFKQATyXrHyHC74nK1qUAi67n9
 K6pE1sinnhXMZouL+RNyir+l+IfpV12G/xEpN+e9u7Pni+8smeeh8m0Ppr0MzihVuLpZoM64eGd
 GEzcA
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-02.um.gwdg.de (10.108.142.55) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_061940_853465_839B566D 
X-CRM114-Status: UNSURE (   9.23  )
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

User-controlled indices are used to access AIA CSR registers.
Sanitize them with array_index_nospec() to prevent speculative
out-of-bounds access.

Similar to x86 commit 8c86405f606c ("KVM: x86: Protect
ioapic_read_indirect() from Spectre-v1/L1TF attacks") and arm64
commit 41b87599c743 ("KVM: arm/arm64: vgic: fix possible spectre-v1
in vgic_get_irq()").

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kvm/aia.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
index cac3c2b51d72..38de97d2f5b8 100644
--- a/arch/riscv/kvm/aia.c
+++ b/arch/riscv/kvm/aia.c
@@ -13,6 +13,7 @@
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/irqdomain.h>
 #include <linux/kvm_host.h>
+#include <linux/nospec.h>
 #include <linux/percpu.h>
 #include <linux/spinlock.h>
 #include <asm/cpufeature.h>
@@ -182,10 +183,13 @@ int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
 			       unsigned long *out_val)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	*out_val = 0;
 	if (kvm_riscv_aia_available())
 		*out_val = ((unsigned long *)csr)[reg_num];
@@ -198,10 +202,13 @@ int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
 			       unsigned long val)
 {
 	struct kvm_vcpu_aia_csr *csr = &vcpu->arch.aia_context.guest_csr;
+	unsigned long regs_max = sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long);
 
-	if (reg_num >= sizeof(struct kvm_riscv_aia_csr) / sizeof(unsigned long))
+	if (reg_num >= regs_max)
 		return -ENOENT;
 
+	reg_num = array_index_nospec(reg_num, regs_max);
+
 	if (kvm_riscv_aia_available()) {
 		((unsigned long *)csr)[reg_num] = val;
 

-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
