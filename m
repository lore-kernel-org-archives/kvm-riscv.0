Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1FBCD4851
	for <kvm-riscv@archiver.kernel.org>; Wed, 13 May 2026 07:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rSWT53nNLjADKp0uOzwoRZhNG/q7FdK/b0BL7fxvw3g=; b=UH8Z8FGN8ZOtlh
	kSQqU85rUNpXKnCrP7Df7Km1ZS/MdbTwWfJLpBhw184M4Unv0iFd8hdFJaFM+H9nwRySUNvvRstzA
	XRgr+AYXjgVr8SyVDUljQsM51hY05efv5nNDbWZCpuBNJ2dPli3QxpKoc2WKOxS77LHKmDnwoNrny
	YwgR1cuAcAyLOwiQ5Pcu63cuwSaxbor+lVDCH/hI2KHCwmFchkPnPOZWH6ZKZGdFOmhXJ2+wvMmim
	ZF9yN+JG1LVk6q8pv4zqejuv2cQ111Jhas9dBOFjIsL20vpyO6Rbv6UyXLcdkLxCCjRKGRs6nn29T
	RhsCUEBYDLw3P/POReQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN49j-00000001amC-3cdD;
	Wed, 13 May 2026 07:37:23 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN49d-00000001akC-4C2Y;
	Wed, 13 May 2026 07:37:20 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gFlfG2Kmkz8Xs7X;
	Wed, 13 May 2026 15:37:10 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl2.zte.com.cn with SMTP id 64D7askB083926;
	Wed, 13 May 2026 15:36:54 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp02[null])
	by mapi (Zmail) with MAPI id mid12;
	Wed, 13 May 2026 15:36:56 +0800 (CST)
X-Zmail-TransId: 2b046a042a18452-b7a1c
X-Mailer: Zmail v1.0
Message-ID: <20260513153656847l3c4fI5hBsAyoIZi8aGIs@zte.com.cn>
Date: Wed, 13 May 2026 15:36:56 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIDAvNF0gSW1wbGVtZW50IEVhZ2VyIFBhZ2UgU3BsaXR0aW5nIGZvciBSSVNDLVY=?=
X-MAIL: mse-fl2.zte.com.cn 64D7askB083926
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Wed, 13 May 2026 15:37:10 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A042A25.003/4gFlfG2Kmkz8Xs7X
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_003718_199621_269CFDA2 
X-CRM114-Status: UNSURE (   7.10  )
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

Wang Yechao (4):
  RISC-V: KVM: Add the split page cache for ioctl context
  RISC-V: KVM: Split huge pages when dirty logging is enabled
  RISC-V: KVM: Split huge pages during KVM_CLEAR_DIRTY_LOG
  RISC-V: KVM: Add the eager_page_split module parameter

 arch/riscv/include/asm/kvm_host.h |  2 +
 arch/riscv/kvm/mmu.c              | 75 +++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)

-- 
2.43.5

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
