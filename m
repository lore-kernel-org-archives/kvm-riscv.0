Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7D3FCA0EF5
	for <kvm-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 13:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/qtaYOnVLdbLwcVDTVqRk6Y1ZyCzwa2MqinXqtZky7k=; b=dw7ou4kQk4x1fz
	mvl/i17w4Uum7DDU4OiIb0/E0xCPVQARieghR7OYuUAwuZY1IJJR4WrrwxWaWscAbCLzZQCIfIkFp
	fKsqcDxFPaxEt83PBKRHUt+X3OFWyjBq79RuLTmp9k70+bD5Bavg6nObPrQlQxMzcW9sIjWX04oWV
	fRhOFLFyGB6fbYWlMckGgJdVJFRHyACNnld7jsbvr3kYM7gly/iDBN/hUmn/ESN6EHNyrfe9u1QWo
	RTC48LWHckMYCnw9kPbBZ+yvQtQSBKcf8ouFKTv5MaMJKEe2BsMcwcIYVXhtgaEV3Ghnxa7SaM5Cl
	qkIDjMopNStJgHtEQ7KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiyn-0000000DpNr-1kF5;
	Wed, 20 Aug 2025 13:35:53 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoiQ9-0000000DhBr-0Aw4;
	Wed, 20 Aug 2025 13:00:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1755694799; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=U4wVJ4Rm1M27YjAVFx51yXXj7bzUgmhjmUV0DS4wCbY=;
	b=DVxyEguKOIi3dEQjyhAiek2Dp4PAZs1wmu9fsLJ6IsSsYS4rFgbMr2wXVdPyna24rtBXQPsMLRycbILHlhjR04DcM446nMcwzxXegfqlVd2cLP03ks76FNhkSAWiJTejVLfsBGq0LZZPgjQCI6objsXPUbcPicvP0nU67wC3wVA=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WmCQaZj_1755694796 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 20 Aug 2025 20:59:57 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 2/2] RISC-V KVM: Remove unnecessary HGATP csr_read
Date: Wed, 20 Aug 2025 20:59:52 +0800
Message-Id: <20250820125952.71689-3-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
References: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_060005_589415_DD6A7FD9 
X-CRM114-Status: UNSURE (   7.24  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

The HGATP has been set to zero in gstage_mode_detect(), so there
is no need to save the old context. Unify the code convention
with gstage_mode_detect().

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
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
2.49.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
