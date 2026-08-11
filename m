Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AC60C5AC67
	for <kvm-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 06:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ySKjPaqW9C2QW655PS30j1OEskHl+yLPQE77dwWM+s=; b=jCD6i3g0BLvxTp
	+uognc/WguF1iheDJ5bci3fMWQcxLsEPIrgX2qRubvLHTh9iCEDvlQBlHtYVmbQOatez10foKcKDW
	L3J5kWuCgFuwTQoxgjqDjvcgXTn0/bkkWcE0nMFEctzaRsSQ4IVZzEl6hau5Aif2KRKl3JAO2VpQa
	J0JuYPSiJSp3zEJ1X8X2M6c5U+UjKOdU67nL7lgjvE2kHY/NPmEv3NrhQ9SKMwoLyEhm+bcN4NYYT
	wHr6Vu/0vUlfbbfQfdBEmbCPCwaudhr66N1NmjX0zEwxyXaFfrWLRstjBuSsBpNpdC2MYPQtlapOZ
	B7GTlmuZ9/wFYJPYCENw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZT-0000000DMpR-3o0f;
	Tue, 11 Aug 2026 06:02:43 +0000
Received: from out-185.mta1.migadu.com ([95.215.58.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtfZQ-0000000DMko-20ko
	for kvm-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 06:02:41 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786428154;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WYtY1rGPyp4UaCJfpmk8LbHxzINII5BxDNNg7wmiL1Y=;
	b=QhqBe4xVk3oISf6Sjp5+lCqhNofmL6YOa9bSVfi9LK3ixb3Hd4jhoAnAcqz6oz53U6TaWA
	I3wn59xB3anIbk2XphgJ4UUoFjkh17r1x+3FHBI3hHH7D+HX54IsBc7I5TcgWo7bw5OXS6
	RejMI+CaxQ7ZtYAo++Y61x5O1M/xbz0=
From: Jinyu Tang <jinyu.tang@linux.dev>
To: Anup Patel <anup@brainfault.org>,
	Anup Patel <apatel@ventanamicro.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>,
	Atish Patra <atish.patra@linux.dev>,
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
Subject: [PATCH 0/3] KVM: riscv: Add KVM_PRE_FAULT_MEMORY support
Date: Tue, 11 Aug 2026 14:01:31 +0800
Message-ID: <20260811060134.106973-1-jinyu.tang@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_230240_734632_2204052C 
X-CRM114-Status: UNSURE (   6.63  )
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

Tested with pre_fault_memory_test on a RISC-V KVM host.

Jinyu Tang (3):
  KVM: riscv: Implement KVM_PRE_FAULT_MEMORY
  KVM: selftests: Add RISC-V Sv57 page table indexing
  KVM: selftests: Enable pre_fault_memory_test for RISC-V

 arch/riscv/kvm/Kconfig                        |  1 +
 arch/riscv/kvm/gstage.c                       |  3 ++
 arch/riscv/kvm/mmu.c                          | 33 +++++++++++++++++++
 arch/riscv/kvm/vm.c                           |  1 +
 tools/testing/selftests/kvm/Makefile.kvm      |  1 +
 .../selftests/kvm/include/riscv/processor.h   |  6 ++++
 .../selftests/kvm/lib/riscv/processor.c       |  2 ++
 .../selftests/kvm/pre_fault_memory_test.c     |  3 ++
 8 files changed, 50 insertions(+)

-- 
2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
