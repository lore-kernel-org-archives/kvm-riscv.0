Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE52FCE086
	for <kvm-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 14:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0q2Wl0advnDPRTRGDsZ8ugaydEa+giORlcdZprOiYYI=; b=nEpJ4VSrmR0E7N
	4Vw3qwCwGzaj8oVZTqBPLaRL2lJ3IbGrx2wvR+cXFXVAjBTCai4arEOVWRtGG3jiWWTTWWOivPyG7
	pPszN33sghzHvoIM7NWSvNTI1eEkGsKVNiEdvVLz/CuuPwNTh0vUCUdYrFoFnKW5a/YfmaGY7+N2A
	zlgCMdBqW/jHWAyo+Ged8fXCg6QA5f85aDbhEmufuCMdD3jnCIwIWndGc97PzdzF6uQkuK/JqitLu
	SgNw/iGxnUm3kEYZwer7lkqbGVYR3DRcw19pFWyY+QpWUrwk046QJjDwP51uhv/D7Y8oUaTBH3cIq
	uc7SYw1occiDcl08VZ6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDr-00000006K9B-17hA;
	Thu, 26 Feb 2026 14:20:11 +0000
Received: from mx-2023-1.gwdg.de ([134.76.10.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcDl-00000006K1Z-0qag;
	Thu, 26 Feb 2026 14:20:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=cispa.de;
	s=2023-rsa; h=CC:To:In-Reply-To:References:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=y2EV8E69I5jJrpaeHXHly91RKfTm2Mt/UXnHLNf1qIo=; b=g0biczdiy3N2TWnxwivxJ+2VuE
	nlkN4XrKRP7q3LAV4Zfn4TLawUMxvEI/t+nHLBBnNEaxpE6YOMlThtTN//WJPZUr8srjTjIdLUrVY
	Vy1Oyk2v1hXXWdUiOQJXIZfqMiD6Gggjrj6pY0eO70pqsD0ZLmfpQjeM+K4WALV74Mcy6ZVf2gRxl
	dnEAn+nOQk6UvjtiypXNeVlmfKHTz7XgK8rUD+gKMhBP7Ts2ixJcLVDiJmJ+eIIu5xlt5IfQKWmz8
	PuAm9/Jca7A3VxX2hUrD1HDYCOnL1xyH75N7j766hst81T+HS9kdJ/CUYz59MsEX0i59En1v38zH2
	79jE7vAw==;
Received: from mailer.gwdg.de ([134.76.10.26]:41130)
	by mailer.gwdg.de with esmtp (GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDd-006EHN-36;
	Thu, 26 Feb 2026 15:19:58 +0100
Received: from mbx19-sub-05.um.gwdg.de ([10.108.142.70] helo=email.gwdg.de)
	by mailer.gwdg.de with esmtps (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
	(GWDG Mailer)
	(envelope-from <lukas.gerlach@cispa.de>)
	id 1vvcDe-000AAN-1W;
	Thu, 26 Feb 2026 15:19:58 +0100
Received: from
 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa
 (10.250.9.200) by MBX19-SUB-05.um.gwdg.de (10.108.142.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Thu, 26 Feb 2026 15:19:30 +0100
From: Lukas Gerlach <lukas.gerlach@cispa.de>
Date: Thu, 26 Feb 2026 15:19:00 +0100
Subject: [PATCH 3/4] KVM: riscv: Fix Spectre-v1 in floating-point register
 access
MIME-Version: 1.0
Message-ID: <20260226-kvm-riscv-spectre-v1-v1-3-5f930ea16691@cispa.de>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2543;
 i=lukas.gerlach@cispa.de; h=from:subject:message-id;
 bh=QO6W13mYtTFxnI3cEgo5wylvGnvsvcChLTvNH02DBEI=;
 b=owGbwMvMwCGWoTIjqP/42kTG02pJDJkLwuJTLbtiFk9ImH6Me/FHrZCV37W+bm/6n+idPUty7
 qY2iz1OHaUsDGIcDLJiiixTBV8z9u1x4EnKPHwOZg4rE8gQBi5OAZjIsX5Ghk9fC55YbCkLCTDq
 ulca9mvdym3sKnxsTpo8W2tVXzXVqjH897JfuWPL577733quJYuw9Gbq77B5brVz6yKxk7kufO8
 TmQA=
X-Developer-Key: i=lukas.gerlach@cispa.de; a=openpgp;
 fpr=9511EB018EBC400C6269C3CE682498528FC7AD61
X-Originating-IP: [10.250.9.200]
X-ClientProxiedBy: mbx19-sub-02.um.gwdg.de (10.108.142.55) To
 MBX19-SUB-05.um.gwdg.de (10.108.142.70)
X-Virus-Scanned: (clean) by clamav
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_062005_262753_D9D6F8BE 
X-CRM114-Status: UNSURE (   8.72  )
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

User-controlled indices are used to index into floating-point registers.
Sanitize them with array_index_nospec() to prevent speculative
out-of-bounds access.

Signed-off-by: Lukas Gerlach <lukas.gerlach@cispa.de>
---
 arch/riscv/kvm/vcpu_fp.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vcpu_fp.c b/arch/riscv/kvm/vcpu_fp.c
index 030904d82b58..bd5a9e7e7165 100644
--- a/arch/riscv/kvm/vcpu_fp.c
+++ b/arch/riscv/kvm/vcpu_fp.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/err.h>
 #include <linux/kvm_host.h>
+#include <linux/nospec.h>
 #include <linux/uaccess.h>
 #include <asm/cpufeature.h>
 
@@ -93,9 +94,11 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			reg_num = array_index_nospec(reg_num,
+					ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
-		else
+		} else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
 		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
@@ -107,6 +110,8 @@ int kvm_riscv_vcpu_get_reg_fp(struct kvm_vcpu *vcpu,
 			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
+			reg_num = array_index_nospec(reg_num,
+					ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;
@@ -138,9 +143,11 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 		if (reg_num == KVM_REG_RISCV_FP_F_REG(fcsr))
 			reg_val = &cntx->fp.f.fcsr;
 		else if ((KVM_REG_RISCV_FP_F_REG(f[0]) <= reg_num) &&
-			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31]))
+			  reg_num <= KVM_REG_RISCV_FP_F_REG(f[31])) {
+			reg_num = array_index_nospec(reg_num,
+					ARRAY_SIZE(cntx->fp.f.f));
 			reg_val = &cntx->fp.f.f[reg_num];
-		else
+		} else
 			return -ENOENT;
 	} else if ((rtype == KVM_REG_RISCV_FP_D) &&
 		   riscv_isa_extension_available(vcpu->arch.isa, d)) {
@@ -152,6 +159,8 @@ int kvm_riscv_vcpu_set_reg_fp(struct kvm_vcpu *vcpu,
 			   reg_num <= KVM_REG_RISCV_FP_D_REG(f[31])) {
 			if (KVM_REG_SIZE(reg->id) != sizeof(u64))
 				return -EINVAL;
+			reg_num = array_index_nospec(reg_num,
+					ARRAY_SIZE(cntx->fp.d.f));
 			reg_val = &cntx->fp.d.f[reg_num];
 		} else
 			return -ENOENT;

-- 
2.51.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
