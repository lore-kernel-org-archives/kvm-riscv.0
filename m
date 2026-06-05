Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6029ACD6E6B
	for <kvm-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 08:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8q/ugO0HJTcW34TQAmDp0/c7wu6K0qvd/2kqUfHjWp8=; b=E6kbVpa63iKmBX
	whB2pEiVgJVKL9kHqQxk7qUOK/aG8jf/MWEi3arPLkLLBHwcQ1XeO93pg2BAI/HDfJIPkM4thgpHj
	49Iyqbu1OIzYWWGvLt+TwQXhWKtRzEZLjyNM4azn9yn4uqFHDnjFZ/8r5SDiirp5253rqLuYXyrnu
	p7Jy35vbYwrnb16sdfPKbC0wBZJw4UBhceiT6IQlx8frayhBL7LjXGeRdQqqPMkRTzSO21KaRymcv
	4u/jbfYDkHv2IzHreGGGN5JUH5On9S/hdqfxDET064eVMgmN6gQMQezHkrmzmhLOHNE0XU77vX4rA
	qBNICcsTgeNhoNkgeFBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPTm-00000000H8E-0Mqz;
	Fri, 05 Jun 2026 08:00:34 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVPTj-00000000H7B-0xK1;
	Fri, 05 Jun 2026 08:00:33 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gWv4T0CLgz8XrrM;
	Fri, 05 Jun 2026 16:00:25 +0800 (CST)
Received: from szxl2zmapp06.zte.com.cn ([10.1.32.108])
	by mse-fl1.zte.com.cn with SMTP id 65580Hva031765;
	Fri, 5 Jun 2026 16:00:17 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp04[null])
	by mapi (Zmail) with MAPI id mid12;
	Fri, 5 Jun 2026 16:00:19 +0800 (CST)
X-Zmail-TransId: 2b066a228213591-1cae8
X-Mailer: Zmail v1.0
Message-ID: <20260605160019772GJy5SDmWQQF7sSqvJ0JtC@zte.com.cn>
Date: Fri, 5 Jun 2026 16:00:19 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?wqBbUEFUQ0ggdjMgMC8zXSBSSVNDLVY6IEtWTTogSHVnZSBwYWdlIHJlY292ZXJ5IGR1cmluZyBkaXNhYmxlLWRpcnR5LWxvZw==?=
X-MAIL: mse-fl1.zte.com.cn 65580Hva031765
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 05 Jun 2026 16:00:25 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A228219.000/4gWv4T0CLgz8XrrM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_010031_427498_AA7254F6 
X-CRM114-Status: UNSURE (   7.72  )
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

When dirty logging is enabled, the gstage mappings are split into
4K pages to track dirty pages. If the migration fails or is canceled,
in order to keep the VM's performance consistent with that before
dirty logging was enabled, we need to recover the gstage huge page mappings
when dirty logging is disabled.

With this series, dirty_log_perf_test shows a decrease in the number of
vCPU faults:

$ perf stat -e kvm:kvm_page_fault \
/dirty_log_perf_test -s anonymous_hugetlb_1gb -v 1 -e -b 1G

Before: 524,819      kvm:kvm_page_fault
After : 263,211      kvm:kvm_page_fault

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

Changes in v2:
 - Rebased on Linux v7.1-rc1.
 - Skip recovering huge pte if the first child pte is not leaf.
 - Link to v2:
 https://lore.kernel.org/linux-riscv/20260429173002565bdp1o7P0bvOs6yTz64yNx@zte.com.cn/

 - Link to v1:
 https://lore.kernel.org/linux-riscv/20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn/

Wang Yechao (3):
  RISC-V: KVM: Refactor kvm_arch_commit_memory_region()
  RISC-V: KVM: add tracepoint for guest page faults
  RISC-V: KVM: Recover gstage huge page mappings during
    disable-dirty-log

 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             |  61 +++++++++++++++
 arch/riscv/kvm/mmu.c                | 112 +++++++++++++++++++++++++++-
 arch/riscv/kvm/trace.h              |  25 +++++++
 arch/riscv/kvm/vcpu_exit.c          |   3 +
 5 files changed, 204 insertions(+), 1 deletion(-)

-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
