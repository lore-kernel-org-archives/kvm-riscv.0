Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3D8FF4959
	for <kvm-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8p8YT19aFNFiygVndrY8Wp/zn8/xlhKcu/PCwB0EwYQ=; b=nluIdCR6YoxZPt
	K2nLEMkGowb67kwb3J7mA9Qa+IQjOu9k03RFMSYlOFjej/aZF31wyliXZYKyrPaaVZb101oB5HG6v
	jx9KEAcqCJ5jFlOEjt7TqfpsH9LnnXSUVK/IX6iIBnuctDaRpjlqlZn3tVw7JbhFEFcu5qlhbYFr7
	w8cLf4XMW0QrbYXmT//CSkVMO70757ljttiBUnTwyn6guGbAe3PREHSk7yLryloH45m4Z83aa+rFJ
	kdHO8GIQN15gGWo0U5byVCA5ol+cRaEHALUwU0rCzcFALTUrp1oZFnPsLhLCpvkGAagj7naPAqI5O
	W7exihtj/KHBmpnPn3Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77fx-0000000Aokn-3KDv;
	Mon, 30 Mar 2026 08:08:45 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w77fq-0000000AoiG-1xmU;
	Mon, 30 Mar 2026 08:08:44 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fkkQk0flzz57DCw;
	Mon, 30 Mar 2026 16:08:30 +0800 (CST)
Received: from szxlzmapp01.zte.com.cn ([10.5.231.85])
	by mse-fl1.zte.com.cn with SMTP id 62U88E6C045693;
	Mon, 30 Mar 2026 16:08:14 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxl2zmapp06[null])
	by mapi (Zmail) with MAPI id mid12;
	Mon, 30 Mar 2026 16:08:17 +0800 (CST)
X-Zmail-TransId: 2b0869ca2f71866-3f7af
X-Mailer: Zmail v1.0
Message-ID: <202603301608170032mtkGKX7wRcAkPKDQ5I-F@zte.com.cn>
Date: Mon, 30 Mar 2026 16:08:17 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <wang.yechao255@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIIHY0IDAvMl0gUklTQy1WOiBLVk06IEZpeCBodWdlcGFnZSBtYXBwaW5nIGhhbmRsaW5nIGR1cmluZyBkaXJ0eSBsb2dnaW5n?=
X-MAIL: mse-fl1.zte.com.cn 62U88E6C045693
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Mon, 30 Mar 2026 16:08:30 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69CA2F7E.001/4fkkQk0flzz57DCw
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_010838_663041_8A8AF81D 
X-CRM114-Status: UNSURE (   6.40  )
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

v3 -> v4:
  - Squash PATCH2 into PATCH3, and adjust according to Anup's comments.
  - Link to v3:
  https://lore.kernel.org/linux-riscv/20260316141234007qSAOsesu2cSQsj-LA-qq3@zte.com.cn/T/#t

v2 -> v3:
  - patch01: Add reference to the specific commit being fixed
  - patch02: Fill the page table entry before replacing the ptep value
  - patch03: Add handling for dirty logging disable to avoid memory leak in gstage page tables
  - Link to v2:
  https://lore.kernel.org/linux-riscv/20260304172139131ChDubMSpGDUB03lY4UCbK@zte.com.cn/T/#t

v1 -> v2:
  - fix the lost write protection on huge pages
  - split huge pages before handling the write protection fault.

  - Link to v1:
  https://lore.kernel.org/linux-riscv/20260226172245358qVZavIykLL2QC0KoqTO-I@zte.com.cn/T/#u

Wang Yechao (2):
  RISC-V: KVM: Fix lost write protection on huge pages during dirty logging
  RISC-V: KVM: Split huge pages during fault handling for dirty logging

 arch/riscv/include/asm/kvm_gstage.h |   4 +
 arch/riscv/kvm/gstage.c             | 133 +++++++++++++++++++++++++++-
 2 files changed, 133 insertions(+), 4 deletions(-)

-- 
2.47.3

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
