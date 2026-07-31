Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9CB6C55167
	for <kvm-riscv@archiver.kernel.org>; Fri, 31 Jul 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bt68ctHOvXYHOygnc9SDBMh5x/Ti4dOBLwgQgunHFYg=; b=F444F8BqGGi442
	UwWz2P+CPF8KPpvrsrQfc+Wu6dcJl6eGJ18m5tTgI/IEwEL5Pk/RDCGMeLeEbkPepToliR1RqzbjS
	Eswi++795AtAuB5avcndxvEpqS/DTrpZIif8VecSPiwfO/2QftZ667Bw1pB9JimJScsG8CUJQk+Fs
	nEJT+/Jn37R1ZeGPtmnHa/FEY0ZQXrLy8sJC612wgT1KheOkTz/gBG/kXRNBzIvdlPiemXnLn92Os
	HbyO+1S69Ub7+xSHoPIX/udTbXKW5z+qxR182//p3YgMhdDkUJ2b2EA2XKnZ8B7syBFYSKk9uZ3YK
	1ELsudwgOmaGL2cdlRig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkf-0000000CCzy-1hej;
	Fri, 31 Jul 2026 09:42:01 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjkc-0000000CCyu-1aIw;
	Fri, 31 Jul 2026 09:42:00 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4hBLgg25tHz58fc9;
	Fri, 31 Jul 2026 17:41:51 +0800 (CST)
Received: from szxl2zmapp07.zte.com.cn ([10.1.32.52])
	by mse-fl1.zte.com.cn with SMTP id 66V9flkM047195;
	Fri, 31 Jul 2026 17:41:47 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from localhost.localdomain (unknown [10.234.74.162])
	by smtp (Zmail) with SMTP;
	Fri, 31 Jul 2026 17:41:50 +0800
X-Zmail-TransId: 3e816a6c6ddd010-3f2b4
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
Subject: [PATCH v3 0/2] RISC-V: KVM: Optimize hfence request handling for SMP guests
Date: Fri, 31 Jul 2026 17:38:26 +0800
Message-ID: <20260731093833.1551341-1-wang.yechao255@zte.com.cn>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-MAIL: mse-fl1.zte.com.cn 66V9flkM047195
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Fri, 31 Jul 2026 17:41:51 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A6C6DDF.001/4hBLgg25tHz58fc9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_024158_974152_E9442D08 
X-CRM114-Status: UNSURE (   8.03  )
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

This series improves the hfence request handling in RISC-V KVM,
targeting scenarios where multiple VCPUs are running an SMP guest.

The first patch Introduce make_xfence_request_nodata for FENCE.I
requests and moves the hfence data/type validation out of the
VCPU loop to avoid redundant checks on every iteration. 

The second patch fixes a more subtle performance issue: when one
VCPU's hfence queue becomes full and triggers a fallback, the
current code applies the fallback to all VCPUs indiscriminately.
This unnecessarily degrades healthy VCPUs and can cause their
queues to fill up prematurely due to lack of processing it.

With these changes, fallback is applied only to the VCPUs that
actually need it, preserving the efficiency of the normal path
for others.

Changes in v3:
 - Re-order the PATCH1 and PATCH2, let the fix PATCH as first patch.
 - Link to v2:
 https://lore.kernel.org/kvm-riscv/20260707125034.416521-1-wang.yechao255@zte.com.cn/

Changes in v2:
 - Fix the patch01 broken the KVM_REQ_FENCE_I request(Sashiko AI review).

 - Link to v1:
 https://lore.kernel.org/linux-riscv/20260707113715.413265-1-wang.yechao255@zte.com.cn/

Wang Yechao (2):
  RISC-V: KVM: Separate req and fallback_req masks in
    make_xfence_request
  RISC-V: KVM: Introduce make_xfence_request_nodata for FENCE.I requests

 arch/riscv/kvm/tlb.c | 46 +++++++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 11 deletions(-)

-- 
2.39.3


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
