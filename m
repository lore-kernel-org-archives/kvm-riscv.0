Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1275FC43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 03:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IpT3h6MDlZgrUH5wHvyYH+7brJu/q2M7GhS2Y2yWfS4=; b=2Sf7SW+3FOP2Gi
	9dwo8ZIY2zuZLOzDhAB+uO6yqr6oshNcSynIBUBhaTpmZY+y3aY8NonSpSeMeyL8x1dVDwkoOzSVF
	n5ftGPyfuneIEv2VBZbBZA/IK9zDJ2NTPqiuW997UJwmPoROUyAHyjLGxXIhtPoDPDgTi+YhckPCi
	9igBmf65CqWj0Qsdca/IdiGrMmPIockLNCmpdSlJ6u+vJ/Y2keB7snZmjUtzqdRj9CxkozBqV7On5
	c/pcBbui7LGNGHOv6jfZ4k6f0gFDn/ArOOjQDdC2ivzYdwNfaFfCNcxscjt9WsXh/spDBe5SY2qM6
	gESiN8mXO4KfMEx9YnWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ4l-0000000GFTU-2W0x;
	Wed, 08 Jul 2026 03:35:55 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whJ4i-0000000GFSL-05Pf;
	Wed, 08 Jul 2026 03:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yIm/R+UfKG6ozRg3WZyqHLKZhdaLouDOHlH/xTo8KtU=; b=jmTOj9Z1zbuC8
	QTDDjncUaA/bNYyRHJ11FQsetLK1gwXc5nbWf2nQfL2B6swi+Xd1k+L68m1xrf3j
	25SkZ4VNGAGxxp6CDJNLd0zlEL+IPVxP5lTI5X3hlbllufFDyPrUgC5O32m9iRxz
	J1Qlyy07tgENMe1GDWn7IDiCG/pOsU=
Received: from [127.0.1.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUKoxU1qq0gPAA--.15489S2;
	Wed, 08 Jul 2026 11:36:08 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>, kvm-riscv@lists.infradead.org
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Graf <graf@amazon.com>, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Xie Bo <xb@ultrarisc.com>
Subject: [PATCH v2 0/1] RISC-V: KVM: Serialize virtual interrupt pending state updates
Date: Wed, 08 Jul 2026 11:35:36 +0800
Message-ID: <178348173646.64306.17443207006998871369@ultrarisc.com>
X-Mailer: python-smtplib kernel patch sender
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwA3cUKoxU1qq0gPAA--.15489S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tw48Ww1rur15Aw1DCw48WFg_yoW8KF43pF
	Z8G34Sgr1kJrWfCwn3Jr48Zr1SgF1kGa15Grn7G347Ars0vF10vF1kKa4jyF1UCr97Zw1j
	vr4YgryDu3yUZaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfU5byZUUUUU
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQABB2pMd84ABQABsc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_203552_708074_4FFBE2AF 
X-CRM114-Status: GOOD (  11.28  )
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

Hi,

This is v2 of the RISC-V KVM virtual interrupt synchronization fix.

The first version described the irqs_pending/irqs_pending_mask race, but
it did not provide enough context on:

  - the exact lost-interrupt interleaving
  - the user-visible failure mode
  - why the existing lockless protocol is replaced instead of being
    repaired with additional barriers
  - what was exercised during validation

This version updates only the commit message and keeps the code change
the same.

Problem summary
===============

The current code treats irqs_pending and irqs_pending_mask as a lockless
multiple-producer, single-consumer state machine.  In practice,
kvm_riscv_vcpu_sync_interrupts() is not a pure consumer because it also
writes both bitmaps while synchronizing guest-visible HVIP state back
into KVM state.

That means the two bitmaps represent one logical state transition, but
they are updated independently.  A host-side interrupt injection can
race with guest-side VSSIP clearing and lose the newly injected pending
bit.

Observed symptom
================

The failure that motivated this patch was an occasional guest hang where
the guest remained blocked in WFI even though host-side virtual
interrupt injection and vCPU kick had already happened.

Why replace the lockless protocol
=================================

This is not just a missing barrier.  The bug comes from encoding one
shared state machine in two separate bitmaps while allowing both
producers and the sync path to modify them.

Repairing that while staying lockless would require redesigning the
state transition protocol itself.  A per-vCPU raw spinlock makes the
state transition explicit and keeps the fix small enough for stable
backporting.

Validation
==========

The issue was reproduced under RISC-V KVM stress workloads that exposed
guest stalls in WFI.  After applying this patch, the same stress setup
no longer reproduced the lost-VSSIP hang.

Thanks,
Xie Bo

Xie Bo (1):
  RISC-V: KVM: Serialize virtual interrupt pending state updates

 arch/riscv/include/asm/kvm_host.h | 10 +++++-----
 arch/riscv/kvm/aia.c              | 28 +++++++++++++++++++++-------
 arch/riscv/kvm/vcpu.c             | 27 ++++++++++++++++++++++-----
 arch/riscv/kvm/vcpu_onereg.c      | 13 +++++++++----
 4 files changed, 57 insertions(+), 21 deletions(-)

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
