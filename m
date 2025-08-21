Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A44CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 22:35:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f8iSII+0eWIvuKg/fElT+epCYY1PhJJZAYFU63mABcI=; b=E7FtTwOHofzkQx
	9m7GDdaNSU+YU2BZQlDhkuW0XBJLPEW88Ee2shn+AxvPWmX0wKQk7cjCYY14iX0VVVEjfJCyl4KIo
	R6dSRszMyLPjqL4jbaqZVB8Novq18xclkpXgxSuhMJCzuc19nXTARb790S1aoSStu+0skajQS3bRV
	IWqy0mqh6Xtz+Fn2S2ssVYuyg0SR4r7USOGPcpeXiTm1gPsgaWQqxXpXhcI/Aw8EdAG89PgfC3BJN
	dxEwVPElkxcm6WQnGXqKFWSz5C2JS5Isext6bfy7bFyGsx6Fw7Pe6QpHRiuLgu15cRxzU74sxq7mH
	byShVfgyiGFE8VMX0low==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDsm-00000000kYL-282n;
	Thu, 21 Aug 2025 22:35:44 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6F3-0000000HDId-3Jgf;
	Thu, 21 Aug 2025 14:26:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7A69A58430;
	Thu, 21 Aug 2025 14:26:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78E13C4CEEB;
	Thu, 21 Aug 2025 14:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786372;
	bh=G0YrLOlqNEkhmNDKqjNXIej+ao+iP0qZxWm/nWbxgcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nIUwo+87Ry/oXZ6mg9Fw4HZ0MMFxJkXAarXgjf1itGfDNVkddF4Mp9uqfxoFzfwwq
	 dKkxZPxRYY1b8fD4Gzfy77M8ZwRGzu1RRdhCgLkhFVCyRl9G71eTogt/T+i5tI71u+
	 BllOOUXWaAO6HLOOnHNhwvJlDGq/Rmr3zM/Qy4lQu2tGIUSeYmZSvD2I3ubrSiHccA
	 h5aSW27p/WEpPX2u1iVBmgKU7a0nHp6CD+jOJXNj/XTA4RLvZAdRNMlxXbmUNEvnWf
	 gI32iy8/42hgb5rRDxJhwI6k52FpdkimxQJmeV9X99ERICX2upoWuiSF28m4VDYneg
	 VKarGoW2PNQRA==
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
Subject: [PATCH V4 RESEND 2/3] RISC-V: KVM: Remove unnecessary HGATP csr_read
Date: Thu, 21 Aug 2025 10:25:41 -0400
Message-Id: <20250821142542.2472079-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20250821142542.2472079-1-guoren@kernel.org>
References: <20250821142542.2472079-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_072613_892163_22BEEBB2 
X-CRM114-Status: UNSURE (   9.39  )
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

Reviewed-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
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
