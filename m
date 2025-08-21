Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D0FCA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pin0SnOkwytwIVFxZHP7rFE8aLvczPc3kl+yYGDsT5U=; b=qjsoLvHcjcQ7DE
	jWrNxmy8GGwjGU7QDxOItt6gofSHLYIUf3Z3dqa6kHS8/1aV86JqBjCy8Pn94OTSkySmKPfedye4y
	sICsaAzPSFmVeknqNrFNpfO3WgIg4JJq6vmVfh8QOQ74slfP+fhK+SS+ZLoo0JaTZGsyluORy05Xf
	en9YnOM97iXGbhzcgYBitN0S/4XXZIFUN6Zzy3rnCRi6ZQBE0TBYtAC1iAGWQJSn/SRnDLpFK4u0a
	r74dmVr0EDFT2RCorTypiTA6Re5xWfoyK8buOzz8iA4DdA9zB9DinzhuAgZkS52JL9+SSjRlmtplL
	8gyQHBYud+wUqcVY2lXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAj6-00000000GJW-2NaX;
	Thu, 21 Aug 2025 19:13:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6F0-0000000HDHh-0fvh;
	Thu, 21 Aug 2025 14:26:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 54BE16022A;
	Thu, 21 Aug 2025 14:26:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A355C4CEF4;
	Thu, 21 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786368;
	bh=SjKIvgxvILxvhlxc+qvjcKbL1gYIOzuL2gDprUk8RXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eO4X4D+eJ5MIGDyLmCAoKu949pGua8tVh4BV2PyxZC+P8SacIeWNDxI2Vr5SCyFoX
	 zy+x6Ka7BoBc1yA8X5kn0LPDzC2S8wadzowzTntqQ+vJw0yQWs6GkhJAkGJzNJ1VW0
	 Ly65kHNc/RhvM8K23X9Q68UCIAK51yI3QD7fzcUpECZsu8rs1r7feFufMgOkatcSqm
	 yPcdTNvNRTTqb/NericCHeFH+vunh86qRgfYL+zkX0yJrD4MMwnHSNRWdqbYMHSurf
	 7PDsLy/iu64gaLE2x1ZMpRpnnS/b2U4/JtVCFfDf4t7jX1jwW8+pJqnVb92Iv21x+w
	 zAlnWQKzeILTA==
From: guoren@kernel.org
To: guoren@kernel.org,
	troy.mitchell@linux.dev
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Nutty Liu <nutty.liu@hotmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH V4 RESEND 1/3] RISC-V: KVM: Write hgatp register with valid mode bits
Date: Thu, 21 Aug 2025 10:25:40 -0400
Message-Id: <20250821142542.2472079-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250821142542.2472079-1-guoren@kernel.org>
References: <20250821142542.2472079-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

According to the RISC-V Privileged Architecture Spec, when MODE=Bare
is selected,software must write zero to the remaining fields of hgatp.

We have detected the valid mode supported by the HW before, So using a
valid mode to detect how many vmid bits are supported.

Fixes: fd7bb4a251df ("RISC-V: KVM: Implement VMID allocator")
Reviewed-by: Nutty Liu <nutty.liu@hotmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Reviewed-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kvm/vmid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 3b426c800480..5f33625f4070 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,7 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_tlb.h>
 #include <asm/kvm_vmid.h>
 
@@ -28,7 +29,7 @@ void __init kvm_riscv_gstage_vmid_detect(void)
 
 	/* Figure-out number of VMID bits in HW */
 	old = csr_read(CSR_HGATP);
-	csr_write(CSR_HGATP, old | HGATP_VMID);
+	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
 	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
