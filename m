Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1C0FC982EE
	for <kvm-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 11:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BtB94eV4b+OIyumxr76fEyhDkLJHTmqu84fiZ8x3q7A=; b=N4imTDAqNZXZbh
	Oou6czTJHUHONLXcndXs9TCkYf7lYPG9UgxZcsvE8kq9+RAF6PZbCytshX35O0YDAXFV6Yj7/xdzJ
	Nk3S+ZT4Duhp2MX3xl6zjdBaimeFFPcY7LPnB1rwesLcWCtRzXS0EHUw53K541JVtZg7QZSAy4JFt
	np3LlnpOnzC75MDJLGW3cYSaqSz6X2iOR+db+KUtSZd720jX5IUlV3VhhnSS5T6y6ycNxD3bOrFO3
	teyEvShSsASDXunI7n0ajrUbnuKLs4Y7wQTWwtiuEJa5O/CSS/Gka4G1Di0P259OlO1dtauzyPlfY
	YR45hbW9mlsS49i/QW1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byi-00000001qBj-28W9;
	Mon, 21 Sep 2026 11:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8byh-00000001qAx-189y
	for kvm-riscv@bombadil.infradead.org;
	Mon, 21 Sep 2026 11:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=; b=dq6f9BrWHp55meJLH+CzXuPJ1B
	QTH0KWUYurtnErIy2RyuPKjjRxeejwVyV/UAfWiplifZB6lVtLRhsg0ID9C4tmgHx0PoZrlfiJMA3
	buLbof93eweffTVlRp+se5f/nFk/bI1qNS0nctT8Zd8AOYYmZTetlhxsMyDEW0O6w+EmlxtAwWgIK
	z+QXVpXzCCxWz5xD3lQgtkytXL/brzoF2S21dH4w2ZQMPHt2+KCo6rSiFn1f+q3yXmGKbyeD70Wpv
	I0IbkPnOFJEY5V41K61NvGyZKZ/aEt/0Cb0ybSE6Yea5/rpKIUj39E3QhE40WZD6eGODRbYUHF7Pi
	nYxYRelA==;
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8byU-0000000CB25-0x40
	for kvm-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 11:14:29 +0000
Received: by mail-pj2-x0e.google.com with SMTP id 98e67ed59e1d1-3a02902dce2so910221a91.1
        for <kvm-riscv@lists.infradead.org>; Mon, 21 Sep 2026 04:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789989255; x=1790594055; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=beTVo7EhWQSWptzjMV9NLyweWMJG+mrIXeoH4I6oW2Dv3dIhliLUuYhO0NS69GiDh0
         hlqt6qEjFvLNJH/6hlf5qNzZCJoyplIWE189S4loTzoyqoNkYBwlfJgszGTnPginO3hn
         hdMiPrNv7+cXdmM6WrDmje6jRSJT62CbQ6MR/A76C8gxPS2eFsCEn+eCRShr4dktGw4a
         7En/jTh9C/SDB/LbvEOm/Ml2w5ctIqycM7oqemn7lSR225HXnmnLdzxU3MSy5aFuTJZx
         OZP/28hW6x5LodumQRIKZv7pvtpFIDmkaYhezlICs+Y06LwwB1sviVJ8zzwsK5mI9uNG
         2Hhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989255; x=1790594055;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHUJIBm2U4V64OwaSBxvcTjq0/clFqcHASwuFrVtamA=;
        b=GOI7u2hEsrSWXFI/ipqfb4UQ9f2stVQs/lm5/C9SRLW8q0GOyk2ggWIG5l54NoLQPD
         riHALtYGGW3CSPbc5YyHR1RVLlKE2x16YXfYA9mHV2Fp4SlDTrC58pfQQQqFlMHI9gcR
         Hny5vf33Fq8sdBAcga4YSyJkRU3xFy9J+dk+nOQk1FYC7xpYCgtUdN3ufaxjej35jwOI
         4jUz5t4Bw93+/vd8AjU6YVPeMXtwWSCCnUqObBl5h2nz03XETe8W+ykaqL/bT3HtJq0Z
         f5oUhPbcDaO6Dj9h7OEBC8ukuXZVCMr208OQXrqRsYovPBWv8BNdw3uQ6qO23BtbTsNB
         h0ow==
X-Forwarded-Encrypted: i=1; AKwUvBzbQ4EhGjDweoremQHSKAw+6o9OhvMziaT8t95MaLbzhlAa9Js3dYgTZg2OHPb/TswfK8rI08g5y5Y=@lists.infradead.org
X-Gm-Message-State: AFuF++l5zIRpOxVYW5OyuZrUFu2exygY7AqWGScAus+vPFAeGKlS8sHr
	2RtDjc5FdtMggQyx6IOaZlFyJ1noWJubI1Go76mFRUU+2QCCHq+tF3Z8
X-Gm-Gg: AYBFou2+6dQsQrW48LbEUELCp/0TEzhCDbS6RXfFh8WlqOh2T5BJYCKsipD+tGyYbq4
	wfFYo2sTTV/PQyfWv7ojEX3aFHzd4ivYw/+8invjN3RlTrlmZoK+1JdqoPpBKjb/BYxqIHbvCUD
	fnhuwMVMQtCtG40Yp9rW+Ycvh/AUzYMVFbABTiS8TrpEapmK8KS4XZo8iPpH33ydyTOK0n7eHro
	Kvw5yvWJYOHoWxva7eUoIB40yRk73se+dLPmUziNnfpUj667xYJ2UzBNo35+XfKk9/dBLKUP95Q
	7v4Ttrm3NckchIdkrJm6XdW9h3xVgxx7+LyhB3HP5YKdpu3pP0vqZWzYkjNdDzqXobrCurWYS6C
	727H9F85fAbCADr0LHj+/k5Qg1OmUEyqdjF8xbpG3MqqRXpROMvCfl550oBYHoyLFnENIaTQC/P
	vLPCvRZdWx/pkFCHlvscvGpyNmYZzuRRfGUi6gN5F5r60mcAMrjERq10U2QXpH13qjaDsq9WPG1
	WaE6xNh2kktrv5H/hkMHQ==
X-Received: by 2002:a17:90b:2d0c:b0:39e:6c6a:4b77 with SMTP id 98e67ed59e1d1-39e6c6a5492mr9909928a91.65.1789989255197;
        Mon, 21 Sep 2026 04:14:15 -0700 (PDT)
Received: from fedora ([61.74.238.173])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c6dd585sm13438703a91.0.2026.09.21.04.14.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 04:14:14 -0700 (PDT)
From: SeungJu Cheon <suunj1331@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jinyu Tang <tjytimi@163.com>,
	Wang Yechao <wang.yechao255@zte.com.cn>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	SeungJu Cheon <suunj1331@gmail.com>
Subject: [PATCH v1 0/5] KVM: riscv: Age G-stage PTEs locklessly
Date: Mon, 21 Sep 2026 20:13:57 +0900
Message-ID: <20260921111402.120911-1-suunj1331@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_121421_199801_C9A9BB9D 
X-CRM114-Status: GOOD (  13.22  )
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

Aging G-stage PTEs currently runs with mmu_lock held for write, taken
by the common MMU notifier code. When MGLRU or kswapd ages a large
range, every vCPU taking a G-stage fault blocks on the lock, and the
dirty-logging read-side fast path blocks behind aging as well.

This series lets RISC-V select KVM_MMU_LOCKLESS_AGING, so G-stage
aging can run without mmu_lock while protecting page-table walks with
RCU.

  1. Age all G-stage PTEs in a GFN range
     Bug fix, posted separately [1] and included unchanged so the
     series applies on riscv_kvm_queue. Drop it if already applied.

  2. Read G-stage PTEs once when walking page tables
     A lockless walker must derive presence, leaf-ness and the child
     address from a single snapshot of each entry.

  3. Write-protect G-stage PTEs atomically
     Aging will clear the Accessed bit without mmu_lock; the plain
     read-modify-write in GSTAGE_OP_WP could clobber that update.

  4. Free G-stage page tables after an RCU grace period
     Table pages and the root outlive any RCU reader. Root teardown
     keeps pgd_levels intact so a walker holding the old root sees
     consistent metadata.

  5. Age G-stage PTEs locklessly
     Select KVM_MMU_LOCKLESS_AGING and walk under rcu_read_lock().

This builds on Jinyu Tang's rwlock and cmpxchg helpers already in
riscv_kvm_queue. Wang Yechao's huge page recovery series [2] adds a
second page-table free site in kvm_riscv_gstage_recover_huge();
whichever lands second will need to switch that put_page() to
gstage_free_page_table(). I can rebase the series as needed.

A possible follow-up is to run clear-dirty-log and the general fault
path under the read side of mmu_lock, as arm64 and x86 do. Patch 3
provides the atomic write-protection needed for the former.

Testing
-------
QEMU virt, -cpu rv64,h=true (Svadu), 4 vCPUs, TCG. The host kernel
was built with KASAN, PROVE_LOCKING, PROVE_RCU, LOCK_STAT and LRU_GEN.

After each patch:
  - dirty_log_perf_test -v 2 -b 256M -i 3
  - access_tracking_perf_test -v 2 -b 256M -s anonymous_thp
    (2M THP disabled and 64K mTHP enabled)
  - 20 VM create/destroy iterations

With MGLRU aging forced on the VM's cgroup every 50-100ms:
  - dirty_log_perf_test -v 3 -b 256M -i 3
  - 30 VM create/destroy iterations

With CONFIG_KVM=m, 5 module load/unload cycles, each with a VM created
and destroyed immediately before module unload, to exercise module
teardown after queuing RCU frees.

No WARN, KASAN, lockdep or RCU reports were observed. The kvm_age_hva
tracepoint recorded approximately 65k events per aging pass.

Performance results from dirty_log_perf_test -v 3 -b 256M -i 3, with
lock_stat enabled for mmu_lock and 86 aging passes:

                           no aging          aging
                         before  after     before   after
  guest dirty time       12.5s   12.4s     18.6s    16.7s
  mmu_lock W wait total  0.15s   0.17s     44.4s    0.15s
  mmu_lock W contentions  35k     35k      1.0M     30k
  mmu_lock R wait total   0       0        7.5s     0

Before the series, 93% of write-lock waiters were from
kvm_mmu_notifier_clear_young(), and the dirty-log read-side fast path
waited for mmu_lock 352k times. After the series, aging does not
acquire mmu_lock.

Absolute numbers are inflated by TCG; only the relative change is
meaningful. Under TCG, the atomic write-protect change in patch 3
increased the clear-dirty-log time from approximately 16ms to 30ms,
as TCG serialises AMO instructions; hardware numbers would be welcome.

[1] https://lore.kernel.org/all/20260918072622.284188-1-suunj1331@gmail.com/
[2] https://lore.kernel.org/kvm-riscv/20260914055936.3672758-1-wang.yechao255@zte.com.cn/

SeungJu Cheon (5):
  KVM: riscv: Age all G-stage PTEs in a GFN range
  KVM: riscv: Read G-stage PTEs once when walking page tables
  KVM: riscv: Write-protect G-stage PTEs atomically
  KVM: riscv: Free G-stage page tables after an RCU grace period
  KVM: riscv: Age G-stage PTEs locklessly

 arch/riscv/include/asm/kvm_gstage.h |   4 +-
 arch/riscv/kvm/Kconfig              |   1 +
 arch/riscv/kvm/gstage.c             | 111 +++++++++++++++++++++-------
 arch/riscv/kvm/main.c               |   3 +
 arch/riscv/kvm/mmu.c                |  56 +++++++-------
 5 files changed, 117 insertions(+), 58 deletions(-)


base-commit: 41e81f7e3ef96594fb840445343c0ee7723aa550
-- 
2.52.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
