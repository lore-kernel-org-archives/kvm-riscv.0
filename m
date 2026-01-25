Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE09AE63CA2
	for <kvm-riscv@archiver.kernel.org>; Sun, 25 Jan 2026 15:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6+4vFDPFxL0L6D5IVvmQpQtCImHhfbpFVhb5SfsdYHs=; b=DD5sdynBVv3VYU
	beQls9SjCMZsgBOnktf/Zb9r3StnscjThRMARpSaT7dnGIuzE+js3uEqymsB5ZOGTRQVODNz7V1vd
	tULnJzWFUd0TC/bJQR4dpXzld28Q7n0lCFZqu0iIi8rwiBO66echhWYg9aS4GVZrgtT1tFzXuNAFZ
	jzvTtXi1maLxLQMtjSlHmNiRwIuqHXls5p7upEpLnKx2bG07rES9vP60XmvKII0qL5OLt+KYaovp3
	7yZOw3nfXUvK7A3OpHu7Da2yLe4ZoIcrq8JzuluXKvp9CNapw9uOcJoqUWVFu6K0uQBw9PDZl5p+p
	NJoMuPhsnZyKSJlvIEAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1gB-0000000BG3t-1EEG;
	Sun, 25 Jan 2026 15:05:31 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vk1g6-0000000BG2O-00nj;
	Sun, 25 Jan 2026 15:05:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769353511; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PMCCCq1cM6dVorAxjoEzFrWStzc4ERTOWpMKDxiriBk=;
	b=TuA3YYOXauM15LsRJcD9utNPgj3PvfHtY7Eu3xPir7EihsiH4//24cQe1O/it3Vn+VHiRvwGLwXRVPZUxhd96uDbxIZrxGAUz0Cbjf7eG4gvfc6o4QJ0w8bqoKv9xDimQTaOLDelBh5jg4OfjPjgGf34VYm8c5c9tfVRrxvdMbE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxlpgTJ_1769353503 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 25 Jan 2026 23:05:06 +0800
From: fangyu.yu@linux.alibaba.com
To: pbonzini@redhat.com,
	corbet@lwn.net,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	radim.krcmar@oss.qualcomm.com,
	andrew.jones@oss.qualcomm.com
Cc: guoren@kernel.org,
	ajones@ventanamicro.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH v3 0/2] Support runtime configuration for per-VM's HGATP mode
Date: Sun, 25 Jan 2026 23:04:48 +0800
Message-Id: <20260125150450.27068-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_070527_635138_6DD72E5B 
X-CRM114-Status: UNSURE (   6.68  )
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

---
Changes in v3:
    - Reworked the patch formatting (per Drew).
    - Dropped kvm->arch.kvm_riscv_gstage_mode and derive HGATP.MODE from
      kvm_riscv_gstage_pgd_levels via a helper, avoiding redundant per-VM state(per Drew).
    - Removed kvm_riscv_gstage_max_mode and keep only kvm_riscv_gstage_max_pgd_levels
      for host capability detection(per Drew).
    - Other initialization and return value issues(per Drew).
    - Enforce that KVM_CAP_RISCV_SET_HGATP_MODE can only be enabled before any vCPUs
      are created by rejecting the ioctl once kvm->created_vcpus is non-zero(per Radim).
    - Add a memslot safety check and reject the capability unless
      kvm_are_all_memslots_empty(kvm) is true, ensuring the G-stage format is not
      changed after any memslots have been installed(per Radim).
    - Link to v2:
      https://lore.kernel.org/linux-riscv/20260105143232.76715-1-fangyu.yu@linux.alibaba.com/
---

Fangyu Yu (2):
  RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
  RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE

 Documentation/virt/kvm/api.rst      | 18 +++++++
 arch/riscv/include/asm/kvm_gstage.h | 11 ++---
 arch/riscv/include/asm/kvm_host.h   | 19 +++++++
 arch/riscv/kvm/gstage.c             | 77 ++++++++++++++++-------------
 arch/riscv/kvm/main.c               | 12 ++---
 arch/riscv/kvm/mmu.c                | 23 ++++++---
 arch/riscv/kvm/vm.c                 | 28 +++++++++--
 arch/riscv/kvm/vmid.c               |  3 +-
 include/uapi/linux/kvm.h            |  1 +
 9 files changed, 133 insertions(+), 59 deletions(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
