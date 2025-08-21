Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41EE9CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pin0SnOkwytwIVFxZHP7rFE8aLvczPc3kl+yYGDsT5U=; b=Z/mXyTNbl6Xor1
	l3ZPrMV61FfGpyPeGC3vVLvokLiMDAuy5ktLPNPE/CLoA1ebduzpfubdRVbe6QSpSdS9xjCouz/Tf
	eqxv67p6sE03WX0Ftwk0kKoP8BxxRS2+Li1/x755R1dsTdRbEimZM0WNzQpRa4ZXhRkBdUXQlK9TY
	JhdqmQqZXT+5ZgGYikYSlhN5T+vTMXQSDs7fTh18gSq3neDRxoqLlhcaF/MAuF6SLd6HpOrdWHhXP
	joopBdijfxlBbh02QhTvnwiwo+zu5yqNuGOHr35p3DyGB/c4w/mpl5oqEaEO9AqUlft0pKuu0hZ7o
	5M3hz1PZcHcQFVCh/MUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8r-0000000Ffkb-3S4v;
	Thu, 21 Aug 2025 03:39:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovo8-0000000Fbuo-1c6O;
	Thu, 21 Aug 2025 03:17:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 21CC643F8A;
	Thu, 21 Aug 2025 03:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1119C113CF;
	Thu, 21 Aug 2025 03:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755746264;
	bh=SjKIvgxvILxvhlxc+qvjcKbL1gYIOzuL2gDprUk8RXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F5Wz89RNFpDq21laO5HMZNdPCo2Fep3GFnnr/itXr2wAkW5inDAOjmOQgxqoIfLvl
	 Qr+pA84u66KkEzkjpzxaEgOZmj1iyD1VwbfixXaIKOjf+XRUqgFJ8UyyfDXNM8RE3y
	 TmugCQoXOWa6gkdn66zOYEQWfIVc4zH9i6g+GWQRybQCFEM3AfgkqYasCpe08mo1oN
	 BxfASjSVAS6YXwwQUIb27yC7/EwxIX0N0IBEAiMr/2Q/k6MUv/byvFKYHClwRB3eae
	 Y7Ei3+3SGET/+spA0p9kdJuaBHueHH3MvSgXLgtIodU253DJ8B/8Ts0Bma4n7/O9fy
	 Jvgm7Uf6IrU3w==
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
Subject: [PATCH V4 1/3] RISC-V: KVM: Write hgatp register with valid mode bits
Date: Wed, 20 Aug 2025 23:17:16 -0400
Message-Id: <20250821031719.2366017-2-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250821031719.2366017-1-guoren@kernel.org>
References: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
 <20250821031719.2366017-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_201744_444235_D1BE8192 
X-CRM114-Status: UNSURE (   9.83  )
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
