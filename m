Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C81606A31E
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FrOn/IGP
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=fBS4VV7Z/OTG7p5NKbXaNjLYvUEJVFYKN2i4QS1OUiU=; b=FrOn/IGPV8nrVuAGgoH60FiRZS
	Tx90ptUe6u8TIOZZ0dppaeovG8g/Kmoei+g6O7+pR0Si8RnaC7UO7nGUn7nIyw9lbLHxRO0uPCFTb
	5jAVLxBHzL3NeVp0xXc2eXoyBBPrsNiUjis6+kp6jpl+lSMzdZCr2XkbWmFRTM77Q2I/PxVeNckex
	H/rYIIADsunq0ELwn2qr7HFiHvJu91lS9IJKcfRuHG3zpRS2cprKMth5zVi5QtOAyQ7qDHHv1nNA3
	4u3g4ckwEuLehzBMc2vTPiXp1Lyn7he61bECSXXRxHR+HHre0c70iu4hhzx7MpKXXl0fxt/jRQNcG
	MOICfKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDq6-0000000A80m-14sy;
	Wed, 25 Nov 2026 14:19:14 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWDpu-0000000A7yg-2Z0u;
	Wed, 25 Nov 2026 14:19:13 +0000
Received: from k3-03 (unknown [159.226.43.8])
	by APP-03 (Coremail) with SMTP id rQCowACHlpdC7gZrNoDHAQ--.9257S2;
	Wed, 25 Nov 2026 22:18:43 +0800 (CST)
From: Tan Chi <tanchi25@mails.ucas.ac.cn>
To: anup@brainfault.org
Cc: atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	Tan Chi <tanchi25@mails.ucas.ac.cn>
Subject: [PATCH] RISC-V: KVM: Add missing write barrier when linking G-stage page tables
Date: Wed, 25 Nov 2026 22:18:40 +0800
Message-ID: <20261125141840.2047392-1-tanchi25@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHlpdC7gZrNoDHAQ--.9257S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF43Ar48Zry3JF43GF1DAwb_yoW8Xr1kpF
	Z7G3sa9r1rt3sagrnxtas2vrn3Wan3Gr13JrZ3CF1UZr4aqryjywnYg39FkFy5Gr9Yy34U
	ZrWUKF1kur4DA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBE14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
	YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwV
	W5XwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v2
	6r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2
	Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_
	Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMI
	IF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUhdbbUUUUU
	=
X-CM-SenderInfo: pwdquxrlsvqzpdlo2hpxfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061909_847288_F3BB156C 
X-CRM114-Status: UNSURE (   7.45  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -4.2 (----)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_riscv_gstage_set_pte() links a newly allocated page table
to its parent PTE without a write memory barrier.

A concurrent hardware page table walker may observe the parent
PTE before the child page table is fully initialized, potentially
interpreting stale contents as valid PTEs.

Add an smp_wmb() before linking the child page table, as is
already done in kvm_riscv_gstage_split_huge().

Sashiko reported this pre-existing issue while reviewing my
G-stage page table accounting patch. LLM assistance was used
to analyze the issue and prepare the changelog.

Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
Link: https://sashiko.dev/#/bug/linux-9339e577-5f31-42a2-a5ea-9844d30b43f8

Signed-off-by: Tan Chi <tanchi25@mails.ucas.ac.cn>
---
 arch/riscv/kvm/gstage.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
index 0aace3215d3e..61ab60adb616 100644
--- a/arch/riscv/kvm/gstage.c
+++ b/arch/riscv/kvm/gstage.c
@@ -160,6 +160,13 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
 			next_ptep = kvm_mmu_memory_cache_alloc(pcache);
 			if (!next_ptep)
 				return -ENOMEM;
+
+			/*
+			 * Ensure the initialization of the new page table is visible
+			 * before linking it to the parent PTE.
+			 */
+			smp_wmb();
+
 			set_pte(ptep, pfn_pte(PFN_DOWN(__pa(next_ptep)),
 					      __pgprot(_PAGE_TABLE)));
 		} else {
-- 
2.53.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
