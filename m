Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC20CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 04:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hfcq3zO7mIPdES6FtUWWqes09hwsJE73hG/G5kiafqU=; b=1sy/bsNcqMdpTt
	U916fgZdB3ulfKXuvagjqO2FZ4yqhz6hTYUX9DvhTqBEN1Bjb5f0d3MNXL/b1EoY8R9oBfPPft81i
	eZysmuVgWmONDslXB4UCr/k1FRCf4l18abk7L5MHEooN2yfiW4+UhGXLVmKeut03jhymlUqzN6gFx
	I8FASKFgwlLfyK9fiAzga5QqpIZbsHza6Yk8cGPFhEfbwcs7jQoJvwCoJoBbyvI6t4+tG+elM7Og3
	HhqUza65yvL82rRlovoFa7ImGgWb93uAij1TYX4qD6Rs3GeTxEB9ppBCpmq97Dpi3dNcNmGZuniR4
	cEiUh6ndRw3iNKXCE4+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoxES-0000000FpDS-2WrT;
	Thu, 21 Aug 2025 04:49:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uovo5-0000000FbuM-0pnU;
	Thu, 21 Aug 2025 03:17:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82FB843733;
	Thu, 21 Aug 2025 03:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B18E6C4CEF4;
	Thu, 21 Aug 2025 03:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755746259;
	bh=CBOysjUe33h5qBQdWPGsKZycqcns/K6/wD6KCp8bJ4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gERcbd2EuZ5hjCz6I/jeym8J3EtLtekmyIuMroYF7gM9WQFIylCeQu1vHpKDbNN50
	 qgig2GOUoHsHwrZ0eVUJYRrb8qMifxNkRh8yODx146yCCz+OKihkkgeVt27nCbmo2x
	 wTrWU6rOpl/D+IYNyT4TetLt/dI9AlUKioCA3A5cEu6twe14BdqjQf3vL57aL1lK6X
	 1Gi9UpplCQ/mQ/beqxvv3tnOlkXCAKWHRpmdbycU+b7T3OBsILddI14pJd97bDoi9K
	 m10+ihe31cgcBljRdtYo2avcMJXS4P9/Ben6ge0TNGq/pMWTMzQvaNFz8lX++E8bKM
	 EJlnV/NyP6/MQ==
From: guoren@kernel.org
To: guoren@kernel.org,
	troy.mitchell@linux.dev
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@linux.alibaba.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: [PATCH V4 0/3] Fixup & optimize hgatp mode & vmid detect functions
Date: Wed, 20 Aug 2025 23:17:15 -0400
Message-Id: <20250821031719.2366017-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
References: <CAJF2gTQFWJzHhRoQ-oASO9nn1kC0dv+NuK-DD=JgfeHE90RWqw@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_201741_260359_B3812999 
X-CRM114-Status: UNSURE (   6.51  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

Here are serval fixup & optmizitions for hgatp detect according to the RISC-V Privileged Architecture Spec.

---
Changes in v4:
 - Involve ("RISC-V: KVM: Prevent HGATP_MODE_BARE passed"), which
   explain why gstage_mode_detect needs reset HGATP to zero.
 
Changes in v3:
 - Add "Fixes" tag.
 - Involve("RISC-V: KVM: Remove unnecessary HGATP csr_read"), which
   depends on patch 1.

Changes in v2:
 - Fixed build error since kvm_riscv_gstage_mode() has been modified.
---

Fangyu Yu (1):
  RISC-V: KVM: Write hgatp register with valid mode bits

Guo Ren (Alibaba DAMO Academy) (2):
  RISC-V: KVM: Remove unnecessary HGATP csr_read
  RISC-V: KVM: Prevent HGATP_MODE_BARE passed

 arch/riscv/kvm/gstage.c | 27 ++++++++++++++++++++++++---
 arch/riscv/kvm/main.c   | 35 +++++++++++++++++------------------
 arch/riscv/kvm/vmid.c   |  8 +++-----
 3 files changed, 44 insertions(+), 26 deletions(-)

-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
