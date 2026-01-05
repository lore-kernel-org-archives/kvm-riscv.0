Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02ED0C79F9C
	for <kvm-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 14:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tjkE1kGcyjRcxGd8a8G5VLtQm6mN0l/fdmV5Coh/BPc=; b=AwX9La3U/8bAse
	iCWki6VjPCsDO7rT7z2h0zv4ji4BAZ/hyBMI046C7yqBMTv+2jxvZdsiqxtMAd+BzXgRJGeJ+hpYv
	N6LG1+PGsh5KyvowMoQGzd0nx7O1OZw5sMuZqXSFfJysQulny4RZM83KyQJAo8QquG1aLQu6yI/vh
	blOsQu/NwH3jcfoZ/45UrtG4oKjR50JULWnctIrw8lNeaG1vFOC/MqKZP8Zkd4YcwfevDTJVxy8MA
	wOM1WpkvaX1o54NKKsEzTGahzQ05yylXu2jWRlMs+c2GCBU5w2JGgIauU4FNXj2Xt3Gpsm4L1RC+E
	F3VyzOqZKuVJKalxYQ7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcldt-0000000BXpn-2rVb;
	Mon, 05 Jan 2026 14:33:09 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcldo-0000000BXj3-0WOD;
	Mon, 05 Jan 2026 14:33:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767623570; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=5joXXyv59ChfWJ+t1ELf3dssPeP3Cm1fUWtYyC4BYYM=;
	b=oZpE+PnAad8IRBswCpaj6jc2cYngrEJbm/7XBKkT5TeEgTtQBMXLcQRBBsOfmtHkLB9StkMu24d87OHEhWQG1LkJpxRTlihzrgKIlG0lB9Cmb3NcnHhpp7rqbrnVJ4QZ9kdn3pHhVNctoZr9qByXi4IPiQnZpKw2C+J7FeF8c2Q=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WwPuTvR_1767623564 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 05 Jan 2026 22:32:45 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	rkrcmar@ventanamicro.com,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v2] Support runtime configuration for per-VM's HGATP mode
Date: Mon,  5 Jan 2026 22:32:30 +0800
Message-Id: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_063305_413521_14C158DC 
X-CRM114-Status: UNSURE (   5.03  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Currently, RISC-V KVM hardcodes the G-stage page table format (HGATP mode)
to the maximum mode detected at boot time (e.g., SV57x4 if supported). but
often such a wide GPA is unnecessary, just as a host sometimes doesn't need
sv57.

This patch introduces per-VM configurability of the G-stage mode via a new
KVM capability: KVM_CAP_RISCV_SET_HGATP_MODE. User-space can now explicitly
request a specific HGATP mode (SV39x4, SV48x4, or SV57x4 on 64-bit) during
VM creation.

Fangyu Yu (2):
  RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
  RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE

 Documentation/virt/kvm/api.rst      | 14 +++++
 arch/riscv/include/asm/kvm_gstage.h | 12 ++---
 arch/riscv/include/asm/kvm_host.h   |  4 ++
 arch/riscv/kvm/gstage.c             | 82 +++++++++++++++++------------
 arch/riscv/kvm/main.c               |  4 +-
 arch/riscv/kvm/mmu.c                | 18 +++++--
 arch/riscv/kvm/vm.c                 | 28 ++++++++--
 arch/riscv/kvm/vmid.c               |  2 +-
 include/uapi/linux/kvm.h            |  1 +
 9 files changed, 113 insertions(+), 52 deletions(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
