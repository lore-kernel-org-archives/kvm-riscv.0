Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D2DD49C92
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 10:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9egCLrMqmTsRn5QN8V6L0Y51EcNDTU5gqPduh732vig=; b=g2kj6ssmW8lvj4
	hqlWMNIwNwzYHpWA67l1BN//AAgkjeV9v5/jFNQs0SU79NjHFJ3pmRIs/Gp7oi5jnYKbtpPoRAsl5
	xrEwxILz/X8NHqKoZa8Vr8oPasheRMxF5ureuW+OPAs+zoTtPdjdS6953sMlMw26XA/KtDzaUFEUH
	WCYP2Sn8xvcV29xhDe1ZDQsk+YDaKeEohj7fUpSn+zNpdkwwIl6IwfNHYcpFfQJwZMOGxj8AU4Rcr
	d0VaPUGPgAlBS0NHy7CQ0L938O/mcVvaCibvSOiXM397dvShow2imWRuHSjVUoFAtwIdjBog18TX8
	7vYg2wAnUklhyfR05U/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXQ-00000001IrP-43SQ;
	Fri, 30 Jan 2026 10:15:40 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vllXM-00000001IqM-3SJh;
	Fri, 30 Jan 2026 10:15:39 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowADXaw+8hHxpTvkMBw--.50196S2;
	Fri, 30 Jan 2026 18:15:24 +0800 (CST)
From: Jiakai Xu <xujiakai2025@iscas.ac.cn>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	Jiakai Xu <xujiakai2025@iscas.ac.cn>,
	Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: [PATCH] RISC-V: KVM: Fix use-after-free in kvm_riscv_gstage_get_leaf()
Date: Fri, 30 Jan 2026 10:15:23 +0000
Message-Id: <20260130101523.1314053-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXaw+8hHxpTvkMBw--.50196S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF43XF47Gw4rCF13uF4kZwb_yoW5XF4kpF
	W5GrZxCryrJrs7CFy7tr1kZrsruw48Wr97Ca45CF98GFnIqrs7Zrn29as2qr15Ar18Zry3
	ZFyDKa4rCr4Fya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPj14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE14
	v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AK
	xVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrx
	kI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v2
	6r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8Jw
	CI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5o7KDUUU
	U
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAYBCWl6JcUB-gABsP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_021537_227870_11C04F5E 
X-CRM114-Status: UNSURE (   6.57  )
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

While fuzzing KVM on RISC-V, a use-after-free was observed in
kvm_riscv_gstage_get_leaf(),  where ptep_get() dereferences a
freed gstage page table page during gfn unmap.

The crash manifests as:
  use-after-free in ptep_get include/linux/pgtable.h:340 [inline]
  use-after-free in kvm_riscv_gstage_get_leaf arch/riscv/kvm/gstage.c:89
  Call Trace:
    ptep_get include/linux/pgtable.h:340 [inline]
    kvm_riscv_gstage_get_leaf+0x2ea/0x358 arch/riscv/kvm/gstage.c:89
    kvm_riscv_gstage_unmap_range+0xf0/0x308 arch/riscv/kvm/gstage.c:265
    kvm_unmap_gfn_range+0x168/0x1fc arch/riscv/kvm/mmu.c:256
    kvm_mmu_unmap_gfn_range virt/kvm/kvm_main.c:724 [inline]
  page last free pid 808 tgid 808 stack trace:
    kvm_riscv_mmu_free_pgd+0x1b6/0x26a arch/riscv/kvm/mmu.c:457
    kvm_arch_flush_shadow_all+0x1a/0x24 arch/riscv/kvm/mmu.c:134
    kvm_flush_shadow_all virt/kvm/kvm_main.c:344 [inline]

The UAF is caused by gstage page table walks running concurrently with
gstage pgd teardown. In particular, kvm_unmap_gfn_range() can traverse
gstage page tables while kvm_arch_flush_shadow_all() frees the pgd,
leading to use-after-free of page table pages.

Fix the issue by serializing gstage unmap and pgd teardown with
kvm->mmu_lock. Holding mmu_lock ensures that gstage page tables
remain valid for the duration of unmap operations and prevents
concurrent frees.

This matches existing RISC-V KVM usage of mmu_lock to protect gstage
map/unmap operations, e.g. kvm_riscv_mmu_iounmap.

Fixes: dd82e35638d67f ("RISC-V: KVM: Factor-out g-stage page table management")
Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
---
 arch/riscv/kvm/mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index a1c3b2ec1dde5..08316e433d729 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -128,7 +128,9 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
 
 void kvm_arch_flush_shadow_all(struct kvm *kvm)
 {
+	spin_lock(&kvm->mmu_lock);
 	kvm_riscv_mmu_free_pgd(kvm);
+	spin_unlock(&kvm->mmu_lock);
 }
 
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
@@ -268,9 +270,11 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
 	gstage.flags = 0;
 	gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
 	gstage.pgd = kvm->arch.pgd;
+	spin_lock(&kvm->mmu_lock);
 	kvm_riscv_gstage_unmap_range(&gstage, range->start << PAGE_SHIFT,
 				     (range->end - range->start) << PAGE_SHIFT,
 				     range->may_block);
+	spin_unlock(&kvm->mmu_lock);
 	return false;
 }
 
-- 
2.34.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
