Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72EECA0EFA
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7Jr7PUwxXaLHm73zaHvJez+e4dLFmbrTxxDvSjvCFPI=; b=qssIDE6rQhwk0Q
	QZoe2jlnwgT4fODr7ATRWIqmRuGuYfaO+J8seVjeMpHWJdzgdN95B0eEj+Y+Ehyj5JDIpCMxzQsZY
	+HDP+ZGYqE0Q00Ge9ZJ3aTUZGgCwDlQSaRcrtjivhLe6DG1UOHxA1M7ftj9dRCqrxWENgUVZpi6lj
	7sxWmrVeH/NY4NonNk+fZUaiXAOcFRieiYh8zaxeg9/c+ymzxONY0cOwBy7J4HsdmsLCzZHbvAXRQ
	RuRIV5NcFO543Q9AudkNzl22TXaKcq/GmOnyse+mJESYSiIONyZjPg26FWAPCPAcaPAhP5cRhpj8l
	Te3dfpuWLivQ7anIYBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uow8x-0000000FfvY-3tex;
	Thu, 21 Aug 2025 03:39:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovoE-0000000Fbw9-1dZf;
	Thu, 21 Aug 2025 03:17:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACE0F613F6;
	Thu, 21 Aug 2025 03:17:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DEC9C4CEF4;
	Thu, 21 Aug 2025 03:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755746269;
	bh=h+RF8Zb0d9oJ8hZkMq/D3wvDV9FwApYP4YjX6BOlwV0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RSGJq1DPysGgIf+Lr/1513mNXeTyr7qdgoGdnWxlqycHWI1Gn+d7cX/ZgRfWAONco
	 ZkVGg+aiH9OHwm5T9ph0bNE8BaRYfpN0U4a/E9YGtoZpda05aOtiEPM0Cb2ziq0do2
	 +lA9oPDwkbUCOhBbBb0lIA+v8Nf6Pd1rRJxS9s6Ur1KrzEZmT3ua+BTknKhaokBYoV
	 4FVfXrvAbmhDjpo0UfcsQzQOo+Q2r0zpRUwOANSzriB/1T5vE8XqtruRQ2uXWi+ybJ
	 2zkw2MV7OK0tkfGm6C3hqb7h2futgD97togXhjc13T9DT1sOlOtgkt3HmBezphki4n
	 8s8bZg3T+GkXQ==
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
	paul.walmsley@sifive.com
Subject: [PATCH V4 2/3] RISC-V: KVM: Remove unnecessary HGATP csr_read
Date: Wed, 20 Aug 2025 23:17:17 -0400
Message-Id: <20250821031719.2366017-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250821031719.2366017-1-guoren@kernel.org>
References: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
 <20250821031719.2366017-1-guoren@kernel.org>
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The HGATP has been set to zero in gstage_mode_detect(), so there
is no need to save the old context. Unify the code convention
with gstage_mode_detect().

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 arch/riscv/kvm/vmid.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 5f33625f4070..abb1c2bf2542 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -25,15 +25,12 @@ static DEFINE_SPINLOCK(vmid_lock);
 
 void __init kvm_riscv_gstage_vmid_detect(void)
 {
-	unsigned long old;
-
 	/* Figure-out number of VMID bits in HW */
-	old = csr_read(CSR_HGATP);
 	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
 	vmid_bits = csr_read(CSR_HGATP);
 	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
 	vmid_bits = fls_long(vmid_bits);
-	csr_write(CSR_HGATP, old);
+	csr_write(CSR_HGATP, 0);
 
 	/* We polluted local TLB so flush all guest TLB */
 	kvm_riscv_local_hfence_gvma_all();
-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
