Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C9ECA0EFF
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X+7qJmNrOAzX87fgjAuwJVZ8jbkuK9CvB1X+wZU74Do=; b=13hxKyl911wARA
	3kQSs5OrxmSrfsz71n8UPKRvszW478vGct3Dt/M36pgMhMLCecWpCwjc7S67QXV/IQxb9hIpgmG+w
	/mrRqBuNHMVuzrNshX4kk3gzK6Uro8GAae7Y2czaizduaTwm2zo9QLVWRGfavFG8WzgdIr8lte81v
	tLgi6GLPc93SH7jHJY8faUhlD/9Kia84IfbehWhjOWYHzlfoI4hCm6zr9XL58IgOBYoQfsUJuxiLi
	ZUW8QmL0a4liUY58GgFiyLRpEnn8LcMm6zFk9lxLQu3ImhBq6TnXcpotQ6lBCiBQAwOWRiAcaOOFO
	JbBOsg9lx+dls1e18rGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAj4-00000000GFv-2ODX;
	Thu, 21 Aug 2025 19:13:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6Eu-0000000HDGt-1BXr;
	Thu, 21 Aug 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC8B65C1100;
	Thu, 21 Aug 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F3AC4CEEB;
	Thu, 21 Aug 2025 14:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755786363;
	bh=vf5Fi2dD1hhyyDWhuRPa6MLAXnOLAHxSyHEh1kLOyk8=;
	h=From:To:Cc:Subject:Date:From;
	b=jqBcBWXif+fIThL2sAHLO6P+dezcJUD6B52uyjHEhlGr4G2F3sudhSN7uIWye1M4F
	 mrwuL1Yyarc1DGE5SuyKM0Pq2xOfSzMT1BbQZL9OWHjwlrJvTRSMGe65mxyaCn7zck
	 ICYuQ7jaay+7UeUdQiSrERxZH50CFVgAh83mhcgZRsev0oUaYncD4XqaQwOUYYivMl
	 P5FxSILMXi8HpKYDy6z/JdrUzYAd2UaufXHKE4ULD1M3OjrK9PnwTf/cnsL/R28Y7d
	 OUppzyuTbuuURCsHkqxKvxmSfdaUFU9Y5mM4tQThNIm6d8eQKB8bHje65F5YU5I7kB
	 mNNuFXp94m/sA==
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
Subject: [PATCH V4 RESEND 0/3] Fixup & optimize hgatp mode & vmid detect functions
Date: Thu, 21 Aug 2025 10:25:39 -0400
Message-Id: <20250821142542.2472079-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_072604_363475_937D7620 
X-CRM114-Status: UNSURE (   6.25  )
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

Here are serval fixup & optmizitions for hgatp detect according
to the RISC-V Privileged Architecture Spec.

---
Changes in v4:
 - Involve ("RISC-V: KVM: Prevent HGATP_MODE_BARE passed"), which
   explain why gstage_mode_detect needs reset HGATP to zero.
 - RESEND for wrong mailing thread.
 
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
