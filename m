Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1369FF8FA8E
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 14:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W8QSmL62s7noXyJxJgWKvtzzZDfoDiHdsv7M63awBoU=; b=RzSw0GNgCh6THA
	657dIBOaUpU5hEElHwf9JzVY7pfvJt4iiaZuWZaTERowPzQlbW1CSLwlUCtr3GEzdVJVtp0SawiGs
	b/wwTd3t51ipvim060RtiPopKXf0jy2adB5EcvhiYTwosCEhsGrrgJxDjDRP2VakLGrruXZ/s9UoH
	oxCKACXDBWXpyyH9TlMXQz+wo4ZGpj1oC+VBT6I3ta1OwqkLNkdi6oKKWlFUUwvtpGaAgykDJtnbL
	YKvjI4kKw4LQivu7qWG/f3gqqBygH2mcv33LRfbjYrvGG4dwgUrQDlhn2hd2+Rhf9ze+yEiAQxKXM
	mZmpixnDKs750ZpaMrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVh-00000008n1I-2qJx;
	Tue, 21 Apr 2026 14:55:33 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCVg-00000008n19-24rS;
	Tue, 21 Apr 2026 14:55:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C1196001A;
	Tue, 21 Apr 2026 14:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37742C2BCB0;
	Tue, 21 Apr 2026 14:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783331;
	bh=YJ2E3MhSG9OVK7lke/JRpHjm6mu73ya3Y7+/iS3WWDM=;
	h=From:To:Cc:Subject:Date:From;
	b=HZ/sEA+K10hNXtWTJvFffYw8Z3Vg0VinNxwMcbVAvO33uI31wLuDQc0g8bj3/aTSX
	 gtOmieO+tBvgy/ufiZkK+9wVDFxD2xxQZBmqIU+zaSiSQNmZN9SYdtSUIfiK2Kyvua
	 wGfRaVQoD4+KjzCQzJzZ7o/Nzq/kR01SCP/9pvc8nFAMlZueDB08So+crDElLkPscZ
	 aEd8WHpEtf1OO7uAap7uHq5quL1CvY3j/0mDbqJnwWoqrSBIohIexYjpuBv+gcCJfP
	 d1Y8KZnhK/4gRINqaO7b4Yr2uLUzKjqe8xLBNRU6Ud/LZOeK6jHvy5kQUbXdM4lj9B
	 7zi6Dho/j6Lxg==
From: guoren@kernel.org
To: fangyu.yu@linux.alibaba.com,
	cp0613@linux.alibaba.com,
	inochiama@gmail.com,
	me@ziyao.cc,
	gaohan@iscas.ac.cn,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	tglx@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 0/3] RISC-V: KVM: AIA: Convert HGEI management to fully per-HART
Date: Tue, 21 Apr 2026 10:54:47 -0400
Message-Id: <20260421145451.1597930-1-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
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

This short series converts RISC-V KVM AIA's Hypervisor Guest External
Interrupt (HGEI) line management from a global "one-size-fits-all"
model to a fully per-HART (per-CPU) model. It also performs the
corresponding cleanup in the IMSIC irqchip driver.

The motivation is to properly support heterogeneous RISC-V SoCs
(big.LITTLE, multi-vendor core mixes) where different HARTs may
expose different numbers of guest interrupt files / HGEIE bits.
The old global `kvm_riscv_aia_nr_hgei` and
`imsic_global_config::nr_guest_files` assumptions are no longer
tenable and are removed.

After this series, HGEI allocation, freeing, and interrupt delivery
are completely per-HART, the code is simpler and clearer, and there
are no remaining global assumptions about guest interrupt file
counts.

Guo Ren (Alibaba DAMO Academy) (3):
  RISC-V: KVM: AIA: Make HGEI number and management fully per-CPU
  RISC-V: KVM: AIA: Replace global HGEI count with simple enabled bool
  irqchip/riscv-imsic: Remove global nr_guest_files after KVM AIA
    per-HART conversion

 arch/riscv/include/asm/kvm_aia.h        |  2 +-
 arch/riscv/kvm/aia.c                    | 58 ++++++++++++++-----------
 arch/riscv/kvm/aia_device.c             |  4 +-
 arch/riscv/kvm/main.c                   |  3 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 12 +----
 include/linux/irqchip/riscv-imsic.h     |  3 --
 6 files changed, 37 insertions(+), 45 deletions(-)

-- 
2.40.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
