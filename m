Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCDED172C3
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 04:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h4Mym99sSUTc3uUpSsdr+ZO/5GUEoM0pZjXhm9U8zC0=; b=UPoeZDP4C+c5ye
	t5EUjSDngNGEFMjz3dEOnODyxP/u8Cw5UgD1uJ8EnKfOmnabYitdXvoVxmA52O0VyLu3WEVPQ+YaJ
	gN9JNeRRAN/dUr5jCNOg1Ra/hpjmttw0X8xW9Md3DRpm18hKQpIsr3AfpsB8sBIRmLbXTUuYmfvsU
	jF49LNYApkr0E0hs7P6n2Q11eXQrCDOD3obENqFLtnYg/KJf1mQSktSK4cmLRBZvacurye3rmS5ra
	06r910r0iJz0o6FfhlPSpwzcYGqsa5rbHv+1xctz6WxzwsS6Z1bVadtJktRoE/Kgl6WvKdDlOStF8
	lmrsrLzYuC7zELWD7EFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vml7k-00000004OzE-46um;
	Mon, 02 Feb 2026 04:01:17 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vml7d-00000004Oyl-1YCw;
	Mon, 02 Feb 2026 04:01:12 +0000
Received: from fric.. (unknown [210.73.43.101])
	by APP-03 (Coremail) with SMTP id rQCowAAnDON8IYBpot59Bw--.49852S2;
	Mon, 02 Feb 2026 12:01:01 +0800 (CST)
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
Subject: [PATCH v2] RISC-V: KVM: Fix use-after-free in kvm_riscv_gstage_get_leaf()
Date: Mon,  2 Feb 2026 04:00:59 +0000
Message-Id: <20260202040059.1801167-1-xujiakai2025@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAnDON8IYBpot59Bw--.49852S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4UtrW7XF4Utw45tF13Jwb_yoW5JFykpF
	Z8Gry3CryrJr4kCry7tryDZrWDWw4UWrWkCFy5CF9rGrsIqa97Zrna9as2qry5ArykXFy3
	ZrWDKa4rCr4Fya7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBF14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
	0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
	rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x
	0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E
	7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcV
	C0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF
	04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7
	CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JU6c_3UUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: 50xmxthndljiysv6x2xfdvhtffof0/1tbiDAUGCWl-a8ajEgABsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_200110_008491_91569B58 
X-CRM114-Status: UNSURE (   6.31  )
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
V1 -> V2: Removed kvm->mmu_lock in kvm_arch_flush_shadow_all().

 arch/riscv/kvm/mmu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index a1c3b2ec1dde5..1d71c1cb429ca 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -268,9 +268,11 @@ bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range)
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
