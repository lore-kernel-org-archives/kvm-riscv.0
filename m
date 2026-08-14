Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45615C5CFC1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 11:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vNVzyjUk4VzFvoX17yNNlziPSnRFH/jYr1LgQu35a+8=; b=3bDl38TZvWI8qN
	o9qKXB4FHAOHJu8WuBt8GpRwtqtEOQoSA4C+mwHxkXh56Xm7OiMI9sb/8eL+JmbMy/1P8uB8lkwjS
	fpb0JATZcJxeTZZmDMx+kMB8RZd3Y/h/BToPFtbvGeTu38I3XmIXNONLuC6U8SVHZs8yfITmp3l2h
	JrHxYTHzbbh1y2v11S7ixNdTvwRj+DI/0/gEV1+vyOfNGVFPkN0Gicyb1j1AsHIFh16vBstfRN0eg
	2MWpbdfV/olKdydfcZFU9Ngjqp7s9Hqxaz74qpiElZ0yVsWi+1h1PA5rglvUtc9+FZUUjToipMP3D
	xBXB35GncVoIJZ7SDPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqLr-00000002bhu-3lEb;
	Fri, 14 Aug 2026 11:45:31 +0000
Received: from out-194.mta0.migadu.com ([2001:41d0:1004:224b::c2] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqLp-00000002bhE-0SOJ
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 11:45:30 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GOT8taQt6/EQFiPSFOU6QPaJFvivwjZtCf7FY3zWtvw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786707926; v=1; x=1787312726;
 b=dJ5BIi204qbL9joWj4vbh5NOkPKE9dGc+FEIk0tDnKwO/8anVKnbEyAl8e37fL8M38grg4J0
 aJWDQ6E3PTjE07rXnqAt3v7/lYcHm3UdHavLkBsNwp2kSKX5Z/ytHuRW3lrnpatRKlgsFc9HQCe
 3k1EvKHEhHSBMUpJ3GnNe/xA=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 7e7cb55356a33f08;
	Fri, 14 Aug 2026 11:45:26 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v3 0/3] KVM: riscv: Add KVM_PRE_FAULT_MEMORY support
Date: Fri, 14 Aug 2026 07:45:04 -0400
Message-ID: <20260814114507.583424-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_044529_431726_53F4E2F7 
X-CRM114-Status: UNSURE (   7.90  )
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

This series adds RISC-V support for the generic KVM_PRE_FAULT_MEMORY
vcpu ioctl and enables the existing generic KVM selftest for RISC-V.

KVM_PRE_FAULT_MEMORY lets userspace ask KVM to populate stage-2 mappings
for a GPA range before running a vCPU that is expected to access that
range.  x86 already supports the ioctl; RISC-V currently falls back to
normal first-touch G-stage faults.

Patch 1 implements the RISC-V arch hook using the existing G-stage map
path.  Patch 2 fixes the RISC-V selftest page-table walker for Sv57,
which can be selected as the default guest mode.  Patch 3 enables
pre_fault_memory_test for RISC-V.

Changes in v3:
- Retry internally when the map path returns success without a visible
  G-stage mapping, instead of exposing -EAGAIN.  (Sashiko)

Changes in v2:
- Drop the per-test guest_modes_append_default() call from
  pre_fault_memory_test.c.  RISC-V already initializes supported and
  default guest modes from kvm_selftest_arch_init(), which is called by
  the common kvm_selftest_init() constructor, as suggested by Sean.

Jinyu Tang (3):
  KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
  KVM: selftests: Add RISC-V Sv57 page table indexing
  KVM: selftests: Enable pre_fault_memory_test for RISC-V

 arch/riscv/kvm/Kconfig                        |  1 +
 arch/riscv/kvm/gstage.c                       |  3 ++
 arch/riscv/kvm/mmu.c                          | 42 +++++++++++++++++++
 arch/riscv/kvm/vm.c                           |  1 +
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/include/riscv/processor.h   |  6 +++
 .../selftests/kvm/lib/riscv/processor.c       |  2 +
 7 files changed, 56 insertions(+)

-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
