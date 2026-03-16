Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC318EFCBB6
	for <kvm-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 06:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J7zIALUpa9Z2hQJPrurvnS7R5gHO44Bn3Y3ue4pAcok=; b=D/4aGL+fIMnSd3
	DQ5zdyx+PBot4yDxOLdpYGbObUS/2z2Z/mPmRO2dc52SZaeLDwk19k9/vT57K0DwMMWeKccxW/pLk
	5CIrSwf164q+eEW1911rPwne4gIvKdsvwW/IDibHnP0rYg51TW+zF/Q4tfbr8T0Ese1oAeJgtghQT
	nvYgJ/ckgVKq/1ZyxdNt0u+kTP9JB2GwVg3d1QWtovGYnqLZdf5zGpJM/Yimj34+P+fglp7J7o1WG
	XBDEgLjO/UReox6NofHU+n953Rti+u8z1jlYl0Bki/7zbeqnjdWMkFt6PXBsYFZGv7U+cihTJXZQH
	JPCGGRfqhVmiZEVt4VhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21C5-00000003OXv-1CNZ;
	Mon, 16 Mar 2026 06:12:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w21C0-00000003OXQ-3VjV;
	Mon, 16 Mar 2026 06:12:47 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fZ4WT0f3Sz8Xs6v;
	Mon, 16 Mar 2026 14:12:37 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl2.zte.com.cn with SMTP id 62G6CWaV081774;
	Mon, 16 Mar 2026 14:12:32 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp05[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 16 Mar 2026 14:12:34 +0800 (CST)
X-Zmail-TransId: 2b0769b79f52168-0b36a
X-Mailer: Zmail v1.0
Message-ID: <20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn>
Date: Mon, 16 Mar 2026 14:12:34 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHYzIDAvM10gUklTQy1WOiBLVk06IEZpeCBodWdlcGFnZSBtYXBwaW5nIGhhbmRsaW5nIGR1cmluZyBkaXJ0eSBsb2dnaW5n?=
X-MAIL: mse-fl2.zte.com.cn 62G6CWaV081774
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Mon, 16 Mar 2026 14:12:37 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69B79F55.000/4fZ4WT0f3Sz8Xs6v
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_231245_046968_2692CD1E 
X-CRM114-Status: UNSURE (   5.69  )
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

This series fixes an issue where dirty logging fails to work correctly
with huge pages.

v2 -> v3:
  - patch01: Add reference to the specific commit being fixed
  - patch02: Fill the page table entry before replacing the ptep value
  - patch03: Add handling for dirty logging disable to avoid memory leak
  - Link to v2:
  https://lore.kernel.org/linux-riscv/20260304172139131ChDubMSpGDUB03lY4UCbK@zte.com.cn/T/#t

v1 -> v2:
  - fix the lost write protection on huge pages
  - split huge pages before handling the write protection fault.

  - Link to v1:
  https://lore.kernel.org/linux-riscv/20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn/T/#u

Wang Yechao (3):
  RISC-V: KVM: Fix lost write protection on huge pages during dirty logging
  RISC-V: KVM: Allow splitting huge pages to arbitrary level
  RISC-V: KVM: Split huge pages during fault handling for dirty logging

 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             | 132 +++++++++++++++++++++++++++-
 2 files changed, 132 insertions(+), 4 deletions(-)

-- 
2.27.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
