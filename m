Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 350F0C982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 12:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mqeEaXgemF6nukV/OUIFWr/sh5x0+3PmgyXiTT2UM88=; b=TtCQhLDfViv61Z
	O56ZE4qoKwSoZN5s2WLy5++4NwDMLYpkLOwnSM3DRTIKn3P3uqniH8LvfKml9OFPXbhsPprs7OUl9
	J4U7Q7JnbkKcZHfZ2yg8BOMXpRL4VZmSlVRj35Fdrst/rcNbKQsX1bHYul0Q8MhICr+EbdE6uLPe1
	ngxlAPYzD65AwWUe6GY9A4C1qLhHXqPd7B0lWwMKTQgRAAPQVuCyPzOkkI8TAE19vnQVaQtN94qYk
	Lwp9K3NqL9KznljsBJHiNIx2f1Htw6xGB4aijLdGniQ2g2TnvkTOJmVT5ZBlDZIvBVwdu1PcJfT4I
	8P94TvdORu3pSKRQvhmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7E-000000023Vr-2vfF;
	Mon, 21 Sep 2026 12:27:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8d7D-000000023VJ-0bVv;
	Mon, 21 Sep 2026 12:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A8EE6021E;
	Mon, 21 Sep 2026 12:27:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC701F000FF;
	Mon, 21 Sep 2026 12:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789993642;
	bh=u3kpT48+EAjuEBOYW9Un4dFvspIcpqydYwj1Scn9tqY=;
	h=From:Subject:Date:To:Cc;
	b=gWbfEfo8+iZGckv2O6ms2ErMihHJC39wCp36OIo9ypFslxaoOPH9SjskVsGQ5PHQ0
	 VLLiKZEafOXRBjdpUKBaeFGoBJEPfKtU+0RI/QI3/PdC17D11z0+Uom0leM/isd2AN
	 aibgohAuEvnOKVYIkY3vMei0iKOD+KzTCgKwIwKZT4sf4ceTpJ7QBco1cxaFZFbUtB
	 /p9vS5++0wqgE72ezmjq/rAv6Wl5GS1CoqFUBztUc587DFSrb2bw6cnrH9vdtlkgJc
	 ZlbE+L+SbcchctcRjgKQDr3oFwT9U/PqHig1gGeAzLbrEfqih6W9S4eVzKXy/PABnC
	 RZNAnEdnGhVZw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Subject: [PATCH RFC v4 0/4] RISC-V: Add PARAVIRT_SPINLOCKS support
Date: Mon, 21 Sep 2026 12:27:00 +0000
Message-Id: <20260921-pvqspinlock-v4-0-409a22aed6ef@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJQisWoC/zWMyw6CMBBFf4XM2pJpeSiuTEz8ALfGBZQBKtjiF
 IgJ4d8Fjctzc8+ZwRMb8nAMZmCajDfOrhDvAtBNbmsSplwZFKoUMyVFP718b2zndCv2UV6iroo
 4KSSsRs9Umfe3doPr5Qz33+jH4kF62DrbrWL3FEPDlP/TiVQoESOMZZhmCR6kkKIeHZM9tcSWu
 tBxDcvyAUHIQhywAAAA
X-Change-ID: 20260921-pvqspinlock-73ad0cfb45b1
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Fangyu Yu <fangyu.yu@linux.alibaba.com>, 
 CHEN Jiankang <yubin.cjk@alibaba-inc.com>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Leonardo Bras <leobras@redhat.com>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

Paravirtualized spinlocks allow an unfair qspinlock to replace the
ticket-lock or native fair qspinlock implementation with something
virtualization-friendly, for example, halting the virtual CPU rather
than spinning.

You can observe the paravirt qspinlock behavior with the pv_kick and
pv_wait tracepoints under /sys/kernel/debug/tracing/:

  # echo 1 > /sys/kernel/debug/tracing/events/paravirt/enable
  # cat /sys/kernel/debug/tracing/trace
            TASK-PID     CPU#  |||||  TIMESTAMP  FUNCTION
               | |         |   |||||     |         |
             sh-100     [001] d..2.    28.312294: pv_wait: cpu 1 out of wfi
         <idle>-0       [000] d.h4.    28.322030: pv_kick: cpu 0 kick target cpu 1

This series is split from [1]. The newest discussion is at [2].

[1]: https://lore.kernel.org/linux-riscv/20231225125847.2778638-1-guoren@kernel.org/
[2]: https://lists.riscv.org/g/tech-prs/message/1211

Changelog:
v4:
 - Rebase onto v7.3-rc4.
 - Normalize the author identity to "GUO Ren (XuanTie)".
 - Minor commit log cleanups (fix line-wrap artifacts and typos).

v3:
https://lore.kernel.org/linux-riscv/20251201003041.695081-1-guoren@kernel.org/
 - Rebase on linux-6.18-rc7.
 - Simplify nopvspin usage.

v2:
https://lore.kernel.org/linux-riscv/20241227011011.2331381-1-guoren@kernel.org/
 - Add RFC tag.
 - Using new SBI_EXT_PVLOCK ID.
 - Add virt_spin_lock support.
 - Add nopvspin support.

v1:
https://lore.kernel.org/linux-riscv/20241222033917.1754495-1-guoren@kernel.org/

GUO Ren (XuanTie) (5):
  RISC-V: Add PARAVIRT_SPINLOCKS support
  RISC-V: paravirt: Add pvqspinlock KVM backend
  RISC-V: paravirt: Add pvqspinlock frontend
  RISC-V: paravirt: pvqspinlock: Add trace point for pv_kick/wait
  RISC-V: paravirt: Support nopvspin to disable PARAVIRT_SPINLOCKS

 .../admin-guide/kernel-parameters.txt         |  2 +-
 arch/riscv/Kconfig                            | 12 +++
 arch/riscv/include/asm/Kbuild                 |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  1 +
 arch/riscv/include/asm/qspinlock.h            | 57 +++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h   | 26 ++++++
 arch/riscv/include/asm/sbi.h                  |  5 ++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kernel/Makefile                    |  2 +
 arch/riscv/kernel/qspinlock_paravirt.c        | 82 +++++++++++++++++++
 arch/riscv/kernel/setup.c                     |  5 ++
 .../kernel/trace_events_filter_paravirt.h     | 58 +++++++++++++
 arch/riscv/kvm/Makefile                       |  1 +
 arch/riscv/kvm/vcpu_sbi.c                     |  4 +
 arch/riscv/kvm/vcpu_sbi_pvlock.c              | 54 ++++++++++++
 15 files changed, 309 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/qspinlock.h
 create mode 100644 arch/riscv/include/asm/qspinlock_paravirt.h
 create mode 100644 arch/riscv/kernel/qspinlock_paravirt.c
 create mode 100644 arch/riscv/kernel/trace_events_filter_paravirt.h
 create mode 100644 arch/riscv/kvm/vcpu_sbi_pvlock.c

--
2.43.1

---
GUO Ren (XuanTie) (4):
      RISC-V: paravirt: Add pvqspinlock KVM backend
      RISC-V: paravirt: Add pvqspinlock frontend
      RISC-V: paravirt: pvqspinlock: Add trace point for pv_kick/wait
      RISC-V: paravirt: Support nopvspin to disable PARAVIRT_SPINLOCKS

 Documentation/admin-guide/kernel-parameters.txt  |  2 +-
 arch/riscv/Kconfig                               | 12 ++++
 arch/riscv/include/asm/Kbuild                    |  1 -
 arch/riscv/include/asm/kvm_vcpu_sbi.h            |  1 +
 arch/riscv/include/asm/qspinlock.h               | 57 ++++++++++++++++
 arch/riscv/include/asm/qspinlock_paravirt.h      | 26 ++++++++
 arch/riscv/include/asm/sbi.h                     |  5 ++
 arch/riscv/include/uapi/asm/kvm.h                |  1 +
 arch/riscv/kernel/Makefile                       |  2 +
 arch/riscv/kernel/qspinlock_paravirt.c           | 82 ++++++++++++++++++++++++
 arch/riscv/kernel/setup.c                        |  5 ++
 arch/riscv/kernel/trace_events_filter_paravirt.h | 58 +++++++++++++++++
 arch/riscv/kvm/Makefile                          |  1 +
 arch/riscv/kvm/vcpu_sbi.c                        |  4 ++
 arch/riscv/kvm/vcpu_sbi_pvlock.c                 | 54 ++++++++++++++++
 15 files changed, 309 insertions(+), 2 deletions(-)
---
base-commit: 93f51579e7df248780214094418f205253383cc5
change-id: 20260921-pvqspinlock-73ad0cfb45b1

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
