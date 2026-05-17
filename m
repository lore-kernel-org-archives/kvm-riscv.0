Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F6BCD37AC
	for <kvm-riscv@archiver.kernel.org>; Sun, 17 May 2026 15:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r+orEPs5ma7G6yUpGc1IHBD8dfeaRqtFlH5OM/Lfv0k=; b=p3BrKzYhtSxxZV
	CeG6HOVy4KzNCjLH0AOSI9duKElqOMnhHpyAv51CYNWI/pHKhsoWTrYrWHvvGzLDdCYldBqrcFHGA
	NVI3sA5GoruvK0X71vBkmlK24rAHcgriee3N8gPP5zZalKOh5seL19Jm/W8NSWbj0+8X4QOU4EWLC
	HD4y8hEpMjcJbzgaOEaAxWJV0kr8iNLfCqOzAg+NZFonk9PczGnnYGKODosayaH/a1zw3+fyC37ZK
	Fqx0iJbevIEYW67nTP8VylOQD1qGeBpEuFZspbVOKkjaOlwCPV+r6Ae041Gu5EeKemaFCCEHEuDbB
	Dn2W1/bBcAdli+FkzS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdY2-0000000CwHw-1Gyo;
	Sun, 17 May 2026 15:36:58 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOdXz-0000000CwGd-1vIZ;
	Sun, 17 May 2026 15:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=R2
	vdFoj/uYRCZ7Xe7zmYDyiQkstZgeSKUDsvCleEwA8=; b=J1W7Oelfr8fXM1QOFV
	OLSE7F3bmId4/hJ3lCuusehbacu3aI22bzz6GSsbxXLsIs7XKmS4WG5w1nzLhrBM
	+ACz8G2gMKxYu+bGePoOvmLSTY8m/SR7nVIUlTOBPoyiPxxiraNgfArSG8eTgiCD
	f9aDA5ubkeAsVEBQWMOamO/EI=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wA3ylwO4AlqyKW7Bw--.10227S2;
	Sun, 17 May 2026 23:34:39 +0800 (CST)
From: Jinyu Tang <tjytimi@163.com>
To: Anup Patel <apatel@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Radim=20Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yong-Xuan Wang <yongxuan.wang@sifive.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Jinyu Tang <tjytimi@163.com>
Subject: [PATCH 0/5] KVM: riscv: Speed up dirty logging write faults
Date: Sun, 17 May 2026 23:34:22 +0800
Message-ID: <20260517153427.94889-1-tjytimi@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wA3ylwO4AlqyKW7Bw--.10227S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF48Cr1DKryUuFy3Ww45Wrg_yoW8Kr1UpF
	WkWr4Fkws2gryxZ3s3C3WDCr909as3GrW7GF47X34DZFs0kry5Aayvg348XFZrJFyxXw12
	vFW0y34fu34UA37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0ziVbyZUUUUU=
X-Originating-IP: [2408:823d:2011:b54:9f00:c5fa:7b13:491e]
X-CM-SenderInfo: xwm13xlpl6il2tof0z/xtbC0A8YkGoJ4A+wjQAA3m
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_083655_960510_E5A5EF33 
X-CRM114-Status: UNSURE (   8.28  )
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

This series speeds up the common dirty logging write fault path for
RISC-V KVM.

When dirty logging is enabled, guest writes to write-protected G-stage
4K leaves currently go through the full fault path and take mmu_lock for
write.  That is expensive once the leaf already exists and
only needs its permission and dirty state updated.

The series first makes the existing MMU notifier locking contract
explicit, switches RISC-V KVM to KVM's rwlock form of mmu_lock, adds an
atomic G-stage PTE update helper, uses it for existing permission
updates, and finally handles dirty logging write faults under the read
side of mmu_lock when a 4K G-stage leaf is already present.

The locking and concurrency model follows existing KVM patterns from x86
and arm64: use an rwlock mmu_lock, keep structural page-table changes on
the write side, and use atomic PTE updates for permission-only changes
that may race with another vCPU.

The fast path marks the memslot page dirty before making the PTE writable
again.  It also sets the PTE dirty bit, so systems that trap when D is
clear do not fall back to the slow path for a writable-but-clean PTE.

Performance was measured with KVM selftests inside a QEMU RISC-V host.

  dirty_log_perf_test -m 19 -v 4 -b 1G -i 3
    base dirty memory avg, iterations 2-3: 53.262493s
    patch 1-4 dirty memory avg, iterations 2-3: 52.735675s
    patch 1-5 dirty memory avg, iterations 2-3: 26.422964s
    patch 1-5 improvement over base: 50.4%

  dirty_log_perf_test -m 19 -v 4 -b 64M -i 3
    base dirty memory avg, iterations 2-3: 3.203170s
    patch 1-5 dirty memory avg, iterations 2-3: 1.762452s
    improvement: 45.0%

Patch 1-4 are prerequisites for the read-side fast path. The
main speedup comes from patch 5 avoiding the full fault path 
for dirty logging write faults.

Jinyu Tang (5):
  KVM: riscv: Rely on common MMU notifier locking
  KVM: riscv: Use an rwlock for mmu_lock
  KVM: riscv: Add a G-stage PTE cmpxchg helper
  KVM: riscv: Update G-stage PTE permissions atomically
  KVM: riscv: Fast-path dirty logging write faults

 arch/riscv/include/asm/kvm_gstage.h |   4 ++
 arch/riscv/include/asm/kvm_host.h   |   2 +
 arch/riscv/kvm/gstage.c             |  35 +++++++---
 arch/riscv/kvm/mmu.c                | 105 +++++++++++++++++++++++-----
 4 files changed, 122 insertions(+), 24 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
