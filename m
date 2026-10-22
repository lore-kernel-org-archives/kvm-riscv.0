Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3AA606A319
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 02:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yFCWiGYN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=K7HDombO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6doxN7jBaxe/WHlzb+eCT+GEA/YOqMgbWwHVynb1st8=; b=yFCWiGYN+402Wv
	iNOr8nf/0SzF/T7dmYv22ncayGMUNUpIpgTDjubCC1CDjYr0mDNS0b+VQzXSgW6SuPB74OmRH3kZ4
	gyBm/ltfIgdX6PbMj3GARQYhcbU8SMVfTkZeRrto4BSTfiXMVZ9AUf0f8O4dkmeKASa6Db/Gmp7Mi
	miexL3k/wzMCMQOu79BunarRu93v6DzqdErwL/9HIS5Tyo/D7IvdvGlQ2R8NL64GElPrY+kX+mLjc
	9ZAp3WljcdVndyeeFlAQrObq4DKYdUZoNGwnCW/cxwwlQRM4iJibbQwhC4DnVPh5qmUu7vD72PjoS
	lHxI0JNtJgdgkuLko9sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJivO-0000000DEoL-2qDX;
	Thu, 22 Oct 2026 02:53:02 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJivL-0000000DEni-13Hd;
	Thu, 22 Oct 2026 02:53:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792637573; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=DejVP3KnOQCw446A7rW8sW1DdnpwryfI3tnU/3cckYc=;
	b=K7HDombO92t7FztwmrYMJx2aLWg66iDabeqziplSln86brrtfQ31QcoYDr56JpdTfImgfewQi+xfgJb04ILwzSdk8xhTi8dE1y5DslISaxX3OTScitgyQpPvE8RJzRz/4zY1/Dixak+XaJ1qJeKNO+YDwXIgMfflr6/0kVYxkkI=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=jinyue.li@linux.alibaba.com;NM=1;PH=DS;RN=12;SR=0;TI=SMTPD_---0XDHoSgz_1792637568;
Received: from aa8c952a0f58..(mailfrom:jinyue.li@linux.alibaba.com fp:SMTPD_---0XDHoSgz_1792637568 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 22 Oct 2026 10:52:53 +0800
From: Li Jinyue <jinyue.li@linux.alibaba.com>
To: kvm-riscv@lists.infradead.org
Cc: kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	wang.yechao255@zte.com.cn,
	stable@vger.kernel.org
Subject: [PATCH] RISC-V: KVM: Fix double free of the split page cache
Date: Thu, 22 Oct 2026 02:52:48 +0000
Message-Id: <20261022025248.477832-1-jinyue.li@linux.alibaba.com>
X-Mailer: git-send-email 2.25.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_195259_996007_91844AB1 
X-CRM114-Status: UNSURE (   9.18  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -17.6 (-----------------)
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
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

kvm_riscv_mmu_free_pgd() frees pgd_split_page_cache after dropping
mmu_lock. It is reached from kvm_arch_flush_shadow_all(), i.e. from the
MMU notifier ->release() callback, which can run concurrently for the
same VM from exit_mmap() and from mmu_notifier_unregister() in
kvm_destroy_vm(). The stage-2 teardown is serialized by mmu_lock and the
second caller finds kvm->arch.pgd already cleared, but both callers then
go on to free the cache, and kvm_mmu_free_memory_cache() does not
tolerate concurrent callers:

  BUG: KASAN: double-free in kvfree+0x28/0x32
  ...
   kfree+0xc4/0x428
   kvfree+0x28/0x32
   kvm_mmu_free_memory_cache+0x178/0x246
   kvm_riscv_mmu_free_pgd+0x20e/0x2b4
   kvm_arch_flush_shadow_all+0x1a/0x24
   kvm_mmu_notifier_release+0x36/0x7c
   __mmu_notifier_release+0x182/0x66a
   exit_mmap+0x7f8/0x8c4
   mmput+0x7e/0x2fc
   do_exit+0x57a/0x22b4
  ...
  Freed by task 15956 on cpu 3 at 8926.103524s:
  ...
   kvm_mmu_free_memory_cache+0x178/0x246
   kvm_riscv_mmu_free_pgd+0x20e/0x2b4
   kvm_arch_flush_shadow_all+0x1a/0x24
   kvm_mmu_notifier_release+0x36/0x7c
   mmu_notifier_unregister+0xf0/0x328
   kvm_put_kvm+0x32a/0x7b8
   kvm_vm_release+0x3a/0x50
   __fput+0x330/0x974

The cache only feeds huge page splitting from VM ioctls, so it does not
need to be released together with the page table. Free it from
kvm_arch_destroy_vm() instead, which runs once after the MMU notifier
has been unregistered, as arm64 and x86 already do. The error path in
kvm_arch_init_vm() is not affected because the cache cannot have been
filled at that point.

Found by syzkaller.

Fixes: 6c7f75ef096a ("RISC-V: KVM: Add the split page cache for ioctl context")
Cc: stable@vger.kernel.org
Signed-off-by: Li Jinyue <jinyue.li@linux.alibaba.com>
---
 arch/riscv/kvm/mmu.c | 2 --
 arch/riscv/kvm/vm.c  | 2 ++
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 3e955d808743..74dece22d172 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -798,8 +798,6 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
 
 	if (pgd)
 		free_pages((unsigned long)pgd, get_order(kvm_riscv_gstage_pgd_size));
-
-	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }
 
 void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index a9f083feeb76..a7e1b518257a 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -54,6 +54,8 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kvm_destroy_vcpus(kvm);
 
 	kvm_riscv_aia_destroy_vm(kvm);
+
+	kvm_mmu_free_memory_cache(&kvm->arch.pgd_split_page_cache);
 }
 
 int kvm_vm_ioctl_irq_line(struct kvm *kvm, struct kvm_irq_level *irql,

base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
-- 
2.25.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
