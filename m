Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A672E7718E
	for <kvm-riscv@archiver.kernel.org>; Sat, 21 Dec 2024 21:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4+lbDAGnR2bsPaJL+P3y/qbSx/jRxZlvty6kwAzaDQ4=; b=PZ/qOXjLAd9zf4
	zpm4KCB/EceEJ/sy0ulm6SJ5SbWsM+d3KzOLPUJiKP6xRDkI5n4pJWxzv3YNXoXC3vUZNh5mv+Uvj
	jpwGmJE1DWH6hXwiiNO77PNMBcSTphRAB+1qsmHXvvEeM+4FKcFikiiTp+CK/AG2QaHIV6i7pqu8G
	YVsWfY9NX+DAvAhAvYJgzLn+qRvI7HFfcGDGoBOeug8Z2hRru63+FpFRCs1BtG+llffasyC6FC5Id
	jIWWpOJF5S/IN4q2VhX/Ew2iRu25y+UpsTr7WwusIwU+85Z7Yj2CDuxwH9WEYbhLUgoL3g440OqQ3
	NTr/sO93tjjWgNtDOlww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7LO-00000007SUj-2s8O;
	Sat, 21 Dec 2024 21:49:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tP7LL-00000007STc-25QD;
	Sat, 21 Dec 2024 21:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 147E5A403F5;
	Sat, 21 Dec 2024 21:47:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA08C4CECE;
	Sat, 21 Dec 2024 21:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734817739;
	bh=liSnJKHt137nDINsiNS8bBle3Cakfhe3aWwZ4NxRgcA=;
	h=From:To:Cc:Subject:Date:From;
	b=f9y2FsCZXSDafB5TbgOF65PJ7LnEv+LO6b/B2wnLgowdZ6Rzly5Ph9Gnu5IvLiwLr
	 Cytt5GW/+3ZIlLFHNp2Ne6ZsmfOYsIPAX5hMhGJbIIK97SehoSLQaoiM/R2ZCUQ3cm
	 XELo0Bt0XTaJR0dDn/VelQXxX4uf2TkbBZBGLg/qbnYRNSXsIgW9KHdTX6KpOeIIgY
	 2AnjB8pwrt0wr97UXs0ymdOIft+CgjBpbx5hfXbdjsgzA3Hm7yufnoAB1ROPWOwMZh
	 j2a+QU4yvoLiaM3vOHQ6x8sMcVdQM00CK2/aDqbJEs+QNpcTNHoLfoWMr9gI/Vdjqx
	 PkqvYDjziUKwQ==
From: Arnd Bergmann <arnd@kernel.org>
To: kvm@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Graf <graf@amazon.com>,
	Crystal Wood <crwood@redhat.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Paul Durrant <paul@xen.org>,
	Marc Zyngier <maz@kernel.org>,
	"A. Wilcox" <AWilcox@Wilcox-Tech.com>,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/5] KVM: drop 32-bit host support on all architectures
Date: Sat, 21 Dec 2024 22:42:18 +0100
Message-Id: <20241221214223.3046298-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241221_134903_671884_97BD39F2 
X-CRM114-Status: GOOD (  18.24  )
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

From: Arnd Bergmann <arnd@arndb.de>

I've updated my RFC patches based on the feedback, changing mainly
the powerpc code. 

I submitted a patch to remove KVM support for x86-32 hosts earlier
this month, but there were still concerns that this might be useful for
testing 32-bit host in general, as that remains supported on three other
architectures. I have gone through those three now and prepared similar
patches, as all of them seem to be equally obsolete.

Support for 32-bit KVM host on Arm hardware was dropped back in 2020
because of lack of users, despite Cortex-A7/A15/A17 based SoCs being
much more widely deployed than the other virtualization capable 32-bit
CPUs (Intel Core Duo/Silverthorne, PowerPC e300/e500/e600, MIPS P5600)
combined.

I hope this can get merged through the KVM tree as a whole series.

      Arnd

---
v2 changes:
 - rebase to kvm #next branch
 - improve changelog text for x86
 - many updates for powerpc, thanks to Christophe Leroy for suggestions

Link: https://lore.kernel.org/lkml/Z1B1phcpbiYWLgCD@google.com/
Link: https://lore.kernel.org/lkml/20241212125516.467123-1-arnd@kernel.org/

Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Alexander Graf <graf@amazon.com>
Cc: Crystal Wood <crwood@redhat.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atishp@atishpatra.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Durrant <paul@xen.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: "A. Wilcox" <AWilcox@Wilcox-Tech.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: kvm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kvm-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org

Arnd Bergmann (5):
  mips: kvm: drop support for 32-bit hosts
  riscv: kvm: drop 32-bit host support
  powerpc: kvm: drop 32-bit booke
  powerpc: kvm: drop 32-bit book3s
  x86: kvm drop 32-bit host support

 MAINTAINERS                                 |   2 +-
 arch/mips/Kconfig                           |   3 -
 arch/mips/include/asm/kvm_host.h            |   4 -
 arch/mips/kvm/Kconfig                       |   1 +
 arch/mips/kvm/emulate.c                     |   8 -
 arch/mips/kvm/msa.S                         |  12 -
 arch/mips/kvm/vz.c                          |  22 -
 arch/powerpc/include/asm/kvm_book3s.h       |  17 -
 arch/powerpc/include/asm/kvm_book3s_32.h    |  36 --
 arch/powerpc/include/asm/kvm_book3s_asm.h   |  10 -
 arch/powerpc/include/asm/kvm_booke.h        |   4 -
 arch/powerpc/include/asm/kvm_booke_hv_asm.h |   2 -
 arch/powerpc/include/asm/kvm_host.h         |   2 +-
 arch/powerpc/include/asm/kvm_ppc.h          |   2 +-
 arch/powerpc/include/asm/processor.h        |   3 -
 arch/powerpc/kernel/asm-offsets.c           |  21 +-
 arch/powerpc/kernel/head_32.h               |  10 -
 arch/powerpc/kernel/head_85xx.S             |  14 -
 arch/powerpc/kernel/head_book3s_32.S        |   5 -
 arch/powerpc/kernel/head_booke.h            |  39 --
 arch/powerpc/kvm/Kconfig                    |  44 +-
 arch/powerpc/kvm/Makefile                   |  30 --
 arch/powerpc/kvm/book3s.c                   |  18 -
 arch/powerpc/kvm/book3s_32_mmu_host.c       | 396 --------------
 arch/powerpc/kvm/book3s_emulate.c           |  37 --
 arch/powerpc/kvm/book3s_interrupts.S        |  11 -
 arch/powerpc/kvm/book3s_mmu_hpte.c          |  12 -
 arch/powerpc/kvm/book3s_pr.c                | 122 +----
 arch/powerpc/kvm/book3s_rmhandlers.S        | 110 ----
 arch/powerpc/kvm/book3s_segment.S           |  30 +-
 arch/powerpc/kvm/booke.c                    | 268 ----------
 arch/powerpc/kvm/booke.h                    |   8 -
 arch/powerpc/kvm/booke_emulate.c            |  44 --
 arch/powerpc/kvm/booke_interrupts.S         | 535 -------------------
 arch/powerpc/kvm/bookehv_interrupts.S       | 102 ----
 arch/powerpc/kvm/e500.c                     | 553 --------------------
 arch/powerpc/kvm/e500.h                     |  40 --
 arch/powerpc/kvm/e500_emulate.c             | 100 ----
 arch/powerpc/kvm/e500_mmu_host.c            |  54 --
 arch/powerpc/kvm/e500mc.c                   |   5 +-
 arch/powerpc/kvm/emulate.c                  |   2 -
 arch/powerpc/kvm/powerpc.c                  |   2 -
 arch/powerpc/kvm/trace_booke.h              |  14 -
 arch/riscv/kvm/Kconfig                      |   2 +-
 arch/riscv/kvm/aia.c                        | 105 ----
 arch/riscv/kvm/aia_imsic.c                  |  34 --
 arch/riscv/kvm/mmu.c                        |   8 -
 arch/riscv/kvm/vcpu_exit.c                  |   4 -
 arch/riscv/kvm/vcpu_insn.c                  |  12 -
 arch/riscv/kvm/vcpu_sbi_pmu.c               |   8 -
 arch/riscv/kvm/vcpu_sbi_replace.c           |   4 -
 arch/riscv/kvm/vcpu_sbi_v01.c               |   4 -
 arch/riscv/kvm/vcpu_timer.c                 |  20 -
 arch/x86/kvm/Kconfig                        |   6 +-
 arch/x86/kvm/Makefile                       |   4 +-
 arch/x86/kvm/cpuid.c                        |   2 +-
 arch/x86/kvm/emulate.c                      |  34 +-
 arch/x86/kvm/fpu.h                          |   4 -
 arch/x86/kvm/hyperv.c                       |   5 +-
 arch/x86/kvm/i8254.c                        |   4 -
 arch/x86/kvm/kvm_cache_regs.h               |   2 -
 arch/x86/kvm/kvm_emulate.h                  |   8 -
 arch/x86/kvm/lapic.c                        |   4 -
 arch/x86/kvm/mmu.h                          |   4 -
 arch/x86/kvm/mmu/mmu.c                      | 134 -----
 arch/x86/kvm/mmu/mmu_internal.h             |   9 -
 arch/x86/kvm/mmu/paging_tmpl.h              |   9 -
 arch/x86/kvm/mmu/spte.h                     |   5 -
 arch/x86/kvm/mmu/tdp_mmu.h                  |   4 -
 arch/x86/kvm/smm.c                          |  19 -
 arch/x86/kvm/svm/sev.c                      |   2 -
 arch/x86/kvm/svm/svm.c                      |  23 +-
 arch/x86/kvm/svm/vmenter.S                  |  20 -
 arch/x86/kvm/trace.h                        |   4 -
 arch/x86/kvm/vmx/main.c                     |   2 -
 arch/x86/kvm/vmx/nested.c                   |  24 +-
 arch/x86/kvm/vmx/vmcs.h                     |   2 -
 arch/x86/kvm/vmx/vmenter.S                  |  25 +-
 arch/x86/kvm/vmx/vmx.c                      | 117 +----
 arch/x86/kvm/vmx/vmx.h                      |  23 +-
 arch/x86/kvm/vmx/vmx_ops.h                  |   7 -
 arch/x86/kvm/vmx/x86_ops.h                  |   2 -
 arch/x86/kvm/x86.c                          |  74 +--
 arch/x86/kvm/x86.h                          |   4 -
 arch/x86/kvm/xen.c                          |  61 +--
 85 files changed, 66 insertions(+), 3536 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/kvm_book3s_32.h
 delete mode 100644 arch/powerpc/kvm/book3s_32_mmu_host.c
 delete mode 100644 arch/powerpc/kvm/booke_interrupts.S
 delete mode 100644 arch/powerpc/kvm/e500.c

-- 
2.39.5


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
