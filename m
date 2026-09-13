Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0899C88E56
	for <kvm-riscv@archiver.kernel.org>; Sun, 13 Sep 2026 07:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YnuYJpUV2Won7u2GH3/0hR89VRGqNdEvNvGsNZAyVXg=; b=EbbiRaCdYdidzw
	M/0ISS9BlVULQmZecqWBdpoiBnE4P1o4qSUgaBiRT3wMN/KXSvND2GGVJ3hhSoFB86K6R/QGEVwmC
	8d9yY1PFt/jgW7mUxHeXpPS5Cp+NGFGABpRFNgKxjlWoREEW2ARL+gmYxtUkPp3CWPbBso1R/ZKCN
	+iywbiillfR691TQEpOZy/i9CwWAnKfw+/6KH+o8k75ZHTG8A+VK8VQ8/vh6ZHV8lwdjYV1Xe6Jay
	bKd1CeRpxgQEu48Z1Wu0xdZmtFUoa+V2EPO17Ld3yCn5E7/0PnlMF8Oti3mYP9InNdaECl5nuGDmr
	a0Jqt6CyCYs1ILByCJVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNI-00000001Thq-0AuY;
	Sun, 13 Sep 2026 07:11:40 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5eNE-00000001Tga-2LKv;
	Sun, 13 Sep 2026 07:11:38 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4hjKFp52lNz8XrrJ;
	Sun, 13 Sep 2026 15:11:26 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 68D7BMJB059910;
	Sun, 13 Sep 2026 15:11:22 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Sun, 13 Sep 2026 15:11:24 +0800
X-Zmail-TransId: 3e816aa64c9b01c-64937
X-Zmail-LocalSMTP: 1
X-ZMAIL-USEORIGINALEMLTOOUTBOUND: 1
X-Zmail-RealSender: wang.yechao255@zte.com.cn
From: Wang Yechao <wang.yechao255@zte.com.cn>
To: Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atish.patra@linux.dev>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Wang Yechao <wang.yechao255@zte.com.cn>
Subject: [PATCH v4 0/2] RISC-V: KVM: Huge page recovery during disable-dirty-log
Date: Sun, 13 Sep 2026 15:03:44 +0800
Message-ID: <20260913070352.3626956-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-MAIL: mse-fl2.zte.com.cn 68D7BMJB059910
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.133 unknown Sun, 13 Sep 2026 15:11:26 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AA64C9E.000/4hjKFp52lNz8XrrJ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_001136_757510_662EC945 
X-CRM114-Status: UNSURE (   9.34  )
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

When dirty logging is enabled, the gstage mappings are split into
4K pages to track dirty pages. If the migration fails or is canceled,
in order to keep the VM's performance consistent with that before
dirty logging was enabled, we need to recover the gstage huge page mappings
when dirty logging is disabled.

With this series, dirty_log_perf_test shows a decrease in the number of
vCPU faults:

$ perf stat -e kvm:kvm_page_fault \
/dirty_log_perf_test -s anonymous_hugetlb_1gb -v 1 -e -b 1G

Before: 1,574,460    kvm:kvm_page_fault 
After : 788,048      kvm:kvm_page_fault

Changes in v4:
 - Rebased on Linux v7.3-rc2.
 - Squash Patch01 into Patch03.
 - The 1G mapping recovery is performed only after all 2M leaf recover succeed.

Changes in v3:
 - Rebased on https://github.com/kvm-riscv/linux/tree/riscv_kvm_queue
 - Add support to recover 1GB mappings for gstage.
 - Refactor kvm_arch_commit_memory_region to be identical to arm64.
 (sashiko AI Reviews)
 - Scan the child page table for the first valid leaf PTE to recover.
 - Add the memslot boundaries check when recover hugepages.
 - Move the cond_resched_lock to the start loop iteration.
 - The kvm_page_fault tracepoint be placed before the conditional block.
 - Remove the fault_supports_gstage_huge_mapping check.
 https://lore.kernel.org/linux-riscv/20260605160019772GJy5SDmWQQF7sSqvJ0JtC@zte.com.cn/

Changes in v2:
 - Rebased on Linux v7.1-rc1.
 - Skip recovering huge pte if the first child pte is not leaf.
 - Link to v2:
 https://lore.kernel.org/linux-riscv/20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn/

 - Link to v1:
 https://lore.kernel.org/linux-riscv/20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn/

Wang Yechao (2):
  RISC-V: KVM: add tracepoint for guest page faults
  RISC-V: KVM: Recover gstage huge page mappings during
    disable-dirty-log

 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             |  67 +++++++++++++++
 arch/riscv/kvm/mmu.c                | 127 +++++++++++++++++++++++++++-
 arch/riscv/kvm/trace.h              |  22 +++++
 arch/riscv/kvm/vcpu_exit.c          |   2 +
 5 files changed, 221 insertions(+), 1 deletion(-)

-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
