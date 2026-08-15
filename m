Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6083DC5CFC1
	for <kvm-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mjiO6v4y9RKsemQpefukqJHgysk13c64W3LiNs5ejpw=; b=MyCtJO2EzYKOEP
	wB15RCoHvP18VwBq1+i4NGU0dn/rISh4eH+Te+DLCAu8gkz4UGZg680je4mQ1U965TPHxEcJ4mM+1
	kIm5w8Ml9tcGQV6yCBHzSqEgvNkhbrf6SaTBMLLI/uw34bb1+QdWFeE+imvgq65zTjpYcf/dCSNLZ
	swxIUS/m/apMtEi36zRbl9hBvHoShjtvlCFN0dyJZbq3z+n6OQC2URPqWprIhRJ/EdThNc3NeWXNj
	fp8Fr0sTDyFjt0oflWn/kmUxDtF6SqLTRpuTKLsssGmfi6NX3mll4ZIR/iNP9w4j0ajfSwwC9Xws0
	0zcuoHT1bKm0KstbTWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBdB-00000003jyR-05aP;
	Sat, 15 Aug 2026 10:28:49 +0000
Received: from out-145.mta0.migadu.com ([2001:41d0:1004:224b::91] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvBd7-00000003jxq-2ciQ
	for kvm-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 10:28:47 +0000
X-Envelope-To: kvm-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=0xdUqTsvy+qUrlfku4ZIUWyJOcx0knAT5Kmtq4e0nOA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1786789723; v=1; x=1787394523;
 b=YOZ4afsKxPNe1ujmq2/i6/adGvcyUtsaGstg3n8JaOrrb78iACU7oo1ti8IfQhhAT9tyaWXo
 6VKYs380HDYMKd2qQBW0ozRcEBlV9PglYBuxM4/keVo5fxDN4yyJumn4yv2i8c2SwkIpxXwq3Z/
 A0EDz74MA9CF5y519RWqDY+8=
X-Envelope-To: kvm-riscv@lists.infradead.org
Received: from localhost.localdomain (2408:823d:2011:2c0:e810:54f9:f0a3:99d)
	by smtp.migadu.com with ESMTPS id 18de2c252fa19764;
	Sat, 15 Aug 2026 10:28:43 +0000
X-Migadu-Flow: FLOW_OUT
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atish.patra@linux.dev>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>,
	Jinyu Tang <jinyu.tang@linux.dev>
Subject: [PATCH v4 RESEND 0/5] KVM: riscv: Add KVM_PRE_FAULT_MEMORY support
Date: Sat, 15 Aug 2026 06:28:28 -0400
Message-ID: <20260815102833.864330-1-jinyu.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260815_032845_887781_26C4F83D 
X-CRM114-Status: UNSURE (   7.79  )
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

Add RISC-V support for the generic KVM_PRE_FAULT_MEMORY ioctl.

Patch 1 and patch 2 fix existing G-stage huge-page corner cases. They
are included first because the prefault hook relies on the map path
reporting the mapping that actually covers the requested GPA.

Patch 3 adds the RISC-V arch hook for KVM_PRE_FAULT_MEMORY. Patch 4 adds
Sv57 indexing support to the RISC-V KVM selftest helpers, and patch 5
enables the generic pre_fault_memory_test for RISC-V.

Patch 1 folds the previously posted standalone G-stage table overwrite
fix into this series:

  https://lore.kernel.org/kvm-riscv/20260814105752.565325-1-jinyu.tang@linux.dev/T/#u

Changes in v4 resend:
- Resend the full series because the previous v4 send was interrupted
  and the kvm-riscv list archive did not show a complete thread. No
  code changes.

Changes in v4:
- Fold the standalone G-stage non-leaf overwrite fix into this series.
- Avoid THP adjustment when the original faulting GPA already has an
  existing 4K G-stage leaf.
- Return an error for HWPOISON instead of reporting success without a
  visible G-stage mapping. (Sashiko)

Changes in v3:
- Retry internally when the map path returns success without a visible
  G-stage mapping, instead of exposing -EAGAIN. (Sashiko)

Changes in v2:
- Drop the per-test guest_modes_append_default() call from
  pre_fault_memory_test.c. (Sean)

Jinyu Tang (5):
  KVM: riscv: Avoid overwriting G-stage tables with huge leaves
  KVM: riscv: Avoid THP adjustment for existing 4K G-stage leaves
  KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
  KVM: selftests: Add RISC-V Sv57 page table indexing
  KVM: selftests: Enable pre_fault_memory_test for RISC-V

 arch/riscv/kvm/Kconfig                        |  1 +
 arch/riscv/kvm/gstage.c                       |  9 ++
 arch/riscv/kvm/mmu.c                          | 83 ++++++++++++++++++-
 arch/riscv/kvm/vm.c                           |  1 +
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/include/riscv/processor.h   |  6 ++
 .../selftests/kvm/lib/riscv/processor.c       |  2 +
 7 files changed, 100 insertions(+), 3 deletions(-)

-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
