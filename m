Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F5D5CDB47F
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 08:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ICmBY6oE0L5Ijog4N/tET3sqhRG69Lz3uWMQkvhHJco=; b=smOS3M3urfM/fw
	K7a9K7c/M+Qs1skF6I//58q7OzPZjFC00Y+xTV+RApqj1oF0nI6mkgxqe8DK9keCH3Q6rolG6CbJQ
	K+0S2AP2c4Ka1EcDOvbHvjlZeRHGvXwqR0yhr5WXL5+L/KptMXVa/YwRpS5tZzeEHfz/lHue9lLoU
	x152IVlWgHXxABVyZ6TCwiiI5dZYzEE9e7wqLP9ARXN9t76nanVF8ELyJli2ws79sr85l+QmC2hqf
	1M60qlLpo1Gobsio37DC3nnFm2NUBLEyBLMC7MIIZ4Fbcocu7fS8K87lyll0AsN0/Lr/ZSPV32sR2
	qPGWzeO7vl5xLJwlyQ4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIXl-00000007MhF-0MVD;
	Wed, 24 Jun 2026 08:01:09 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcIXi-00000007Mgl-0cuX;
	Wed, 24 Jun 2026 08:01:07 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4glZBR49Ywz8Xrrf;
	Wed, 24 Jun 2026 16:01:03 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl2.zte.com.cn with SMTP id 65O80qZY088369;
	Wed, 24 Jun 2026 16:00:52 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 24 Jun 2026 16:00:54 +0800 (CST)
X-Zmail-TransId: 2b046a3b8eb661b-fd032
X-Mailer: Zmail v1.0
Message-ID: <20260624160054463wcDvJaMoydSggcNOWgcfB@zte.com.cn>
Date: Wed, 24 Jun 2026 16:00:54 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <kvm@vger.kernel.org>,
        <kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Cc: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
        <atish.patra@linux.dev>, <alex@ghiti.fr>, <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIFJFU0VORCAwLzVdIEltcGxlbWVudCBFYWdlciBQYWdlIFNwbGl0dGluZyBmb3IgUklTQy1W?=
X-MAIL: mse-fl2.zte.com.cn 65O80qZY088369
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Wed, 24 Jun 2026 16:01:03 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A3B8EBF.001/4glZBR49Ywz8Xrrf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_010106_350281_8E34521F 
X-CRM114-Status: GOOD (  10.83  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

Eager Page Splitting is implemented on x86 and ARM. It improves the
performance of dirty logging (used in live migrations) when guest memory
is backed by huge pages.

This series implement Eager Page Splitting for RISC-V. The Implementation
similar to x86 and ARM. It provides two ways to split huge pages in ioctl
context instead of on fault in vCPU context:

- Split huge pages when dirty logging is enabled when
  KVM_DIRTY_LOG_INITIALLY_SET is not set. This happens when enabling the
  KVM_MEM_LOG_DIRTY_PAGES flag of a memslot, and splits the whole memslot
  into 4K mappings.

- Split huge pages during KVM_CLEAR_DIRTY_LOG when
  KVM_DIRTY_LOG_INITIALLY_SET is set. This happens when enabling dirty log
  in small chunks. It does not split the whole memslot, but only the
  requested chunk range.

Changes in v3 resend:
 - Fix patch format to ensure emails reach the linux-riscv and kvm-riscv
   mailing lists.
 - Move the free pgd_split_page_cache into kvm_arch_destroy_vm().

Changes in v3:
 - Rebase on v7.1 version.
 - Add patch03 to remove the redundant TLB flush operations.

 sashiko-bot AI review
 (https://sashiko.dev/#/message/20260603104847.9692C1F00893%40smtp.kernel.org)
 - Check the kvm->arch.pgd before split huge pages.
 - Align the start address to PMD_SIZE before split.
 - Flushing remote TLBs before Dropping mmu_lock.

Changes in v2:
 - Rename the split_page_cache.
 - Rename the kvm_riscv_split_huge_pages and
   kvm_riscv_split_memory_region.
 - Add lockdep_assert_held check before split huge pages.
 - Update Documentation/admin-guide/kernel-parameters.txt.
 - Link to v2
 https://lore.kernel.org/linux-riscv/20260603175256408L0jnqGs1cJGc0ijCdujci@zte.com.cn/

 - Link to v1:
 https://lore.kernel.org/linux-riscv/20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn/


Wang Yechao (5):
  RISC-V: KVM: Add the split page cache for ioctl context
  RISC-V: KVM: Split huge pages when dirty logging is enabled
  RISC-V: KVM: Remove redundant TLB flush operations
  RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
  RISC-V: KVM: Add the eager_page_split module parameter

 .../admin-guide/kernel-parameters.txt         |  7 +-
 arch/riscv/include/asm/kvm_gstage.h           |  6 +-
 arch/riscv/include/asm/kvm_host.h             |  1 +
 arch/riscv/kvm/gstage.c                       | 21 +++--
 arch/riscv/kvm/mmu.c                          | 91 ++++++++++++++++++-
 arch/riscv/kvm/vm.c                           |  6 ++
 6 files changed, 116 insertions(+), 16 deletions(-)

-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
