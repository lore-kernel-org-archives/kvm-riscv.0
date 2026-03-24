Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC276E9A776
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LrbH/EWK0uG6wCn65e1WSTyvOQzo8jElFlhf+kHm1+k=; b=5AWYq5qI4EIpko
	nNKxD7FkKH2P93pxkj3sIRWXlclfDCStkuV3i2n6+E1tfBBz4eoW6wKhY6yTx/E12jHn2LYfPY5aZ
	9FaXU1O1keFiY9GR9V8gT3Sg4TCp7+A84ajZciXcxcD5k5rzlP6UrpDzv8m0+9YN27HUHdUP0hO+0
	/06tq2ZP+fdp84E2hJ6vp2QVA43qnxstZ78Nxhadm75KsnAdbO5UzYVOCYH08bHHavG94RUggxMxQ
	Cg/RqBgS/rBxJ5RCai0KYnX4ZNIL+TdN8wjHL9/5Rt9i+dIyPhOtHkhz2f8NUKts2yf/2EA+c3pS1
	R/fKAX/BopzGmMb2vJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Cp-00000001IMe-0Q9C;
	Tue, 24 Mar 2026 11:45:55 +0000
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w50Ck-00000001IJN-3dF8;
	Tue, 24 Mar 2026 11:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1774352739; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=sYaekKiVbhvrlEXMmmW2ADmKnORVODY0c4WfQr6ka6I=;
	b=dWuGWHKxjozqX2HxzvI1mfTEFYKkSzBA3sOSWhEDZfB+md+i4bukkJanNxVtJC7VU8pxXpOH02QiUgzphVVhwHxhaqxVx1/dbpB3G6Wx7gTx4KPPdIEcfB6Co+5SZualyRf+iypx359syG6ZTJtZQaDhN+XeFUjbpj88wdp2vd4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R521e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0X.eWVEY_1774352731;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X.eWVEY_1774352731 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Mar 2026 19:45:33 +0800
From: fangyu.yu@linux.alibaba.com
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	songshuaishuai@tinylab.org,
	bjorn@rivosinc.com,
	ardb@kernel.org,
	arnd@arndb.de,
	bhelgaas@google.com,
	richard.lyu@suse.com,
	tzimmermann@suse.de,
	nathan@kernel.org
Cc: guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH 0/4] Add crashdump support in guest kernel
Date: Tue, 24 Mar 2026 19:45:23 +0800
Message-Id: <20260324114527.91494-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_044551_479242_711312FC 
X-CRM114-Status: UNSURE (   7.80  )
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

In a RISC-V kernel, crashdump needs to hand off execution to the crash
kernel after tearing down the current kernel address space. However,
under virtualization the guest uses two-stage address translation, PC
does not jump to stvec after setting satp to zero.

This patch set introduces a dedicated kexec trampoline text section and
builds a minimal trampoline page table for it. The crash handoff is then
reworked into a two-pass trampoline:

    1. First enter via the kernel VA, install the trampoline page table,
       and jump to the trampoline VA(=PA) of the norelocate code;
    2. Continue execution with trampoline VA(=PA) and directly jump to the
       crash kernel entry point with jr, instead of depending on a stvec
       redirection.

With this, crashdump in RISC-V guests becomes robust against the
two-stage translation.

Fangyu Yu (4):
  riscv: Add kexec trampoline text section to vmlinux.lds.S
  riscv: kexec: Place norelocate trampoline into .kexec.tramp.text
  riscv: kexec: Build trampoline page tables for crash kernel entry
  riscv: kexec: Switch to trampoline page table before norelocate

 arch/riscv/include/asm/kexec.h     |   9 +++
 arch/riscv/kernel/image-vars.h     |  13 ++++
 arch/riscv/kernel/kexec_relocate.S |  34 +++++++--
 arch/riscv/kernel/machine_kexec.c  | 116 ++++++++++++++++++++++++++++-
 arch/riscv/kernel/vmlinux.lds.S    |   1 +
 5 files changed, 166 insertions(+), 7 deletions(-)

-- 
2.50.1


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
