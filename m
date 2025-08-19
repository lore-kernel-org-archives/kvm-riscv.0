Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB7CCA0EE6
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=97toSLrZJhzBADkomQVeTmMY3w0SOiXvg51Ch7B7pRE=; b=MD3bsFCVlXnikv
	BtHd92KLDDcf2aRmQeNPYiTOCDJZh/XUzaBWvGD9wzl3DHCV2m4S3P2f0OP4IIQwvQFxHWC3x60WD
	xB3OCAOpWJTrTSm4FkelpkdUp3xYpu5fDNGDKBzYBr5TMoxIKmu0usgDIRlCDiqzHRjRCrtAAwB/O
	+E+dReTCdPs3sZ5sYBnVWShG/23VYr3XaWHno5XU5ebJaK61pOZlmrs1HHoowyTZFRqNGp6IfCenq
	ESxq9CM8lAG0itm38FjqH/lfpvTr1b2K+eO0zJIlus2RO/+RF3Hui0yenzBP4iGxyBnl5M8EUzZAc
	G4JVbuQce88+p0xCrUVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoGQQ-00000009cPZ-0KnD;
	Tue, 19 Aug 2025 07:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoG5o-00000009ZYF-3VvI;
	Tue, 19 Aug 2025 06:45:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41CDE601EE;
	Tue, 19 Aug 2025 06:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25906C4CEF4;
	Tue, 19 Aug 2025 06:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755585912;
	bh=UP9QrxfK6QYEHcUJrlYlyfxkQRb2pZ0b31ddHRriPIQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pF7BZ0Lh144HFRdf5oCuVGgwhS7bRIQEywwzSk6HQeJ/ALSsZDqbmX1Mk168Z/kKe
	 jx8wzNKp4rnFXGafekaeWb0JvrWmtmuqGF0cdq2pPSKfH47PD7fUhvSYR+5FQdb0Jb
	 yjuLh6wYWTqAGcx8RghQz0VbMo2YtdGRGhH8cuz7qXaZre0aivb9DwwW4pdxQRKgRZ
	 N6sZgsVkPlM20oc+MnJq7W9u2yH30quU+dSMjTfmiHxsq2QiksdauUpz2oXQrrx9Op
	 JdtbmLse2hd8SIF+h0v2IZq9ZdQq8vrM6R+ibymfYLih6iS4zxZVWvDNUyqe1zhhrv
	 LcUn7JuQFMOrQ==
From: guoren@kernel.org
To: guoren@kernel.org
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
Subject: [PATCH] RISC-V KVM: Remove unnecessary HGATP csr_read
Date: Tue, 19 Aug 2025 02:44:29 -0400
Message-Id: <20250819064429.1947476-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
References: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
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

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
This cleanup is based on yufang.yu's vmid fixup patch.
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
