Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA9CCFF885A
	for <kvm-riscv@archiver.kernel.org>; Sat, 25 Apr 2026 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=EsDa1xvsw5DAuXwKqEbE9Ki805aeTjLwB/ZUp9Fmqss=; b=zAlYBHK1uck/fn
	C22SUJyeKwI5174/2qZf2FgFncj2uqDPY+3ECI0lCqBGm4Z18CV13SnM+DjH5cdHRbsgxz6YI16wc
	QpoHCjgy7CduQ31d4B2VG6+CR4gPlQG68SP/LoTW6vGAzHJ5EsR+7UiHH+8xjJWNfVwtzyT6o5IKU
	rdpEl/l1sML4D6xu1/wQNI4IFTm6N3+sAchInnbws7huT2HhtsuLpVfUWV3Ri5tlb3kgM7UeDHMF2
	JWIP9Uh6xeYGtIC4k/oDAgz5VjmqDzm3BGQveOS6a/YPGuMxVGBw20w5oGOhyZuk1wTSlrNohmB+C
	hpSTC8v4/dn3seFyEDWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRN5-0000000DwWN-0WYg;
	Sat, 25 Apr 2026 00:59:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGRN2-0000000DwVw-1M2B;
	Sat, 25 Apr 2026 00:59:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE77D44401;
	Sat, 25 Apr 2026 00:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B860CC19425;
	Sat, 25 Apr 2026 00:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777078782;
	bh=yYiQ6GsQndYOT4lGdEa6Y9iOgOugX/DHS0AExKOebl0=;
	h=From:To:Cc:Subject:Date:From;
	b=TvcrsgzeeZk3k/3/Oa7tFn1mUl8S+MlTozSYqfRRRkZanl9QqfFUdxab5teGBahIm
	 0y7YVgmhGuSKjTtYDpDT5yha4kL+X54ar34oYgVSEv9YZBvSHaxbJge0K6mrDofOaW
	 KByW8elZLqTjoSuV6cuVU5nFfUOXpTFq04zzmRTeysY6ADUo5tjwZUsKtQJKHXbfu8
	 pQDvon2cg9r+l4trzrAO8pZJ7nNmOMFAVjYJVXdWTWe4M7KIKjKF9xJT00Fkuo7J71
	 64dCTrVfshdOOuLRztT4iLcKZDJ6fMfuy8RRBXxxKyWRzln8vOQaA07QE12DCRgVdX
	 /olUV3Cc1NtKA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cp0613@linux.alibaba.com,
	fangyu.yu@linux.alibaba.com,
	gaohan@iscas.ac.cn,
	inochiama@gmail.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	me@ziyao.cc,
	palmer@dabbelt.com,
	pjw@kernel.org,
	tglx@kernel.org
Subject: [PATCH V2 0/4] RISC-V: KVM: AIA: Convert HGEI management to fully per-HART
Date: Sat, 25 Apr 2026 00:59:12 +0000
Message-ID: <20260425005916.3321811-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_175944_382126_2E02FD70 
X-CRM114-Status: UNSURE (   7.71  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

This short series converts RISC-V KVM AIA's Hypervisor Guest External
Interrupt (HGEI) line management from a global "one-size-fits-all"
model to a fully per-HART (per-CPU) model. It also performs the
corresponding cleanup in the IMSIC irqchip driver.

The motivation is to properly support heterogeneous RISC-V SoCs
(big.LITTLE, multi-vendor core mixes) where different HARTs may
expose different numbers of guest interrupt files / HGEIE bits.
The old global `kvm_riscv_aia_nr_hgei` and
`imsic_global_config::nr_guest_files` assumptions are no longer
tenable and are removed.

After this series, HGEI allocation, freeing, and interrupt delivery
are completely per-HART, the code is simpler and clearer, and there
are no remaining global assumptions about guest interrupt file
counts.

Changelog:
V2:
 - Add per-HART IMSIC guest files to compute final HGEI count.
 - Add min(local->nr_guest_files, nr_guest_files);

V1:
https://lore.kernel.org/kvm-riscv/20260421145451.1597930-1-guoren@kernel.org/

Guo Ren (Alibaba DAMO Academy) (4):
  RISC-V: KVM: AIA: Make HGEI number and management fully per-CPU
  RISC-V: KVM: AIA: Replace global HGEI count with simple enabled bool
  irqchip/riscv-imsic: Move nr_guest_files to per-HART local config
  RISC-V: KVM: AIA: Use per-HART IMSIC guest files to compute final HGEI
    count

 arch/riscv/include/asm/kvm_aia.h        |  2 +-
 arch/riscv/kvm/aia.c                    | 66 +++++++++++++++----------
 arch/riscv/kvm/aia_device.c             |  4 +-
 arch/riscv/kvm/main.c                   |  3 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 10 ++--
 include/linux/irqchip/riscv-imsic.h     |  6 +--
 6 files changed, 53 insertions(+), 38 deletions(-)

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
