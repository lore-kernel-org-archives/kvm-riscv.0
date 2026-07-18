Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E61C4451C
	for <kvm-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 08:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q6uSU4SVPG+mWMAJPxZgKSCNQfymrgdrV8PTqjqCWRQ=; b=R25+0X9F5uqVeC
	taHzYlbTwW9JYBBqYzinNNDecKchO7yM86cUQaHoU4f3ZD+5lQUOK3lwCuW2bTgRO8r6OevP80Vz8
	mb0ncta/aHOeR+bVMVhh/cxQ/l8rdGUuQj7O8dalWb8/HelcWA/reRbJXcOyKtvhh1Pqesb10Rd83
	ENiBq4CBNJJzacrYlY35q387NgXY/GDgNKv/jZVobmnkOPfjl91+UuViGMMRgtVhpiOGVyaDLDbP1
	fBCUjGZYpybQgnGKqj+c0IoHL31GohSjNtEQd7xSLcXmQmWn1A5L25XaSipZb2efeegxGKwi4uUPp
	8vrPsD/TrpJKn1UmUJ5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl00k-00000003sSa-1jo9;
	Sat, 18 Jul 2026 08:03:02 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wl00h-00000003sRv-2oDl
	for kvm-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 08:03:01 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-49548aebcd8so9749065e9.3
        for <kvm-riscv@lists.infradead.org>; Sat, 18 Jul 2026 01:02:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784361777; cv=none;
        d=google.com; s=arc-20260327;
        b=Mjcrn5IsKaNIHNRtqB2KVtLd27egQ4G2sk5vEiE7CFGKCt4xPTusfkMJN5OdZrF21D
         w7d0Lyl4110DwvqMWimmwi2aaCpzSDlSf9dkHfKOweylb/kTfFsejXlTEeW3eel/szNf
         PTbRamP60nk3L13gcZkgI572GNo5oOfcK0o38W2/Vmi78QB45wnmBvMyY5pylHE6zroM
         dEYTok9fjq27K5doH/bfY85njxWX6YWiiqVyOowCZWV8J9wij4dzGeLwMfmR/R3wK8Dq
         KLoE2Atna4Z3Mva2ZgedULojGYx43RLY3l7utkF3+dPMZkWkvWfmg/nbzmsTxfXsze1N
         psCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        fh=07SwOF2h/hI+PkB82iAj/UojJX4yw7cBYU3VrwxNvPM=;
        b=eIZjP9FX1UirZwV56b4STXZUmYV6q8v4HGjc2q8/jx9iiFMjzEBugytptefpM7l2Pl
         trlwJiKBA60DvnNfbXymVy20FGS6XoOBegOgQ0/eA/6taD4PX3a7gEJBkz73b7PRc5qI
         HA/SwpbDmeNbpXXskt35bgv6KVvTiIUrsHIeVx1+fsbVATZTzYkhWE+LedTII3d/7PmB
         GBOnSLM6JTz1rFV5XELwH6LyAWBF2zvJRQzz7RffuWFmaDb+lmlHT10LH9uE6M29t/HT
         V8gHmWz/7PTSSGjgBjB4/9JTIhl9opi+FqfCfqkWAZ+kKZq0hr/480uoFe/KRxL3RW9h
         0ZWQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1784361777; x=1784966577; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        b=p4xw7sPglkYk0f4fjGdSEZHUZ5pVNhZIjClDLZce2DXhDxII6aa7rJ5z4KYJLrRLfj
         FFMa6qFd0tFPHfvtoUbTmWcJc3UdXW1qv7pgsDCcfeqW47FxUR5bwF4J6Mr/XdyqNZtP
         upFhaGItiw+X0Pg81pi9PMBLIdWZo2DzZnWkaq/6GzExJD87QzggFk3OPcyLQV89c7rL
         nr9rDPnl8lILW+dlBmaEf8FLWQsi+y6DrCFCv2hxVwb4LLfeXlk94H/7nlJ8uCSbS6gc
         qqPhYY7e3X2irAaXpw4u1sXmQ/e3QBOrIZ5TRDSchMqoZHCo0Fo/z01OJBRRRCY/F8dd
         PJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784361777; x=1784966577;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rm7XhSy4D7GsNEFlHs1pBrGpKvn/WVAo06Ys8zEN9MY=;
        b=OK1vbKm2nTQyG46ISupL4msjR9S1IeXascFsMmTx4NpcT5F21KxVVSakS61VBkgogG
         /ruy8iCJNUsKkkSIhHoyeDDGu/wtjpR+nFEsjl3K3UatuIAwKC/lea7gRk6T7r3qKpDV
         SPnhkGLPjrF4YmqCbSMODOJ5lC/tqV1TfXZwsLC8mLKDgoJ7UBrCpnBdhTevMN28LP2c
         KknNWAu0QmyxrYs+jN5/gch/HMZUr35flh/alcSel9ZDMq+3tnEcRWzsTBxkY2HXg3Vn
         VHehj05YDVDw+sxDS2/3L1nQ81RMI78yCqN1S1J5H2dBeEBSJtnyxI+fc6X6Eq+X3FWA
         gszg==
X-Forwarded-Encrypted: i=1; AHgh+RqQzt6xv+S1Ytajcm9/I4zkGsDM4F/DMTIo+pfc/HEvHC1ipEPURuyhFLrtc+Z0xHXeG0GQbST22/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxexM2NWRaH9q8zFmlON6nczgTDESWL/uyi9XXn40VxKuMAL4HJ
	lTMEt8T9XE8xxOTG+RHHVloc8m6yIyBwLtIkjMH500AhuIcGnPVIvBKzlOQ5rnQdz9wgAZql6Oa
	wKG+n9H46L+rpEkLrOhrmLlgSC9xEtl4zNRq8FAg0U78C7juIjn06PB8=
X-Gm-Gg: AfdE7cmwkhkljdu7E51thL3eYw29BO8YhNEsRCUj+dzX74TOETpamiDqi7c7ErBtJzh
	T8WJenCTByjR8XJnuZNo4LGbLCiwNcGBKNCKCP2/Q6VWJQ8YiEs0tEALawnhTo+9HtkW6/K15KS
	FORhXREJ0XN//XipayyjUx9tcY38ccDNohrfcqL6pDfK+ze4iCztilisgkMg5ZZpA7HcAXEQKoG
	rl+bZuZx6C3nUDFCu3oPN9cRoWFTduQTgy1ZMOKunIabQT8ZB0SlJdNYGFkG8vIL7ZCNW1F2xhV
	8T8LtDuNui5wApikx05riKEI4NP8QsPySHOs0Kys8Wq7mUZpWq0udntBiVSwNiMgOOp8TD4+wdY
	GZLBy
X-Received: by 2002:a05:600c:4f09:b0:490:e19b:bd99 with SMTP id
 5b1f17b1804b1-4954a40bc1emr61521315e9.30.1784361776913; Sat, 18 Jul 2026
 01:02:56 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sat, 18 Jul 2026 13:32:45 +0530
X-Gm-Features: AUfX_myMNGzt4ZSbXXn9B7HyuNCD1fPJy5lCNbHrmQgj6yVz1oiBXt5EwnVWQEg
Message-ID: <CAAhSdy2iT3GmYz+n_jzbQ4V_5P7UdfFhmq=BSOgYCDEQ6PPuZA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv fixes for 7.2 take #1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <andrew.jones@oss.qualcomm.com>, 
	KVM General <kvm@vger.kernel.org>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260718_010259_947614_CF382A6C 
X-CRM114-Status: UNSURE (   6.45  )
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

Hi Paolo,

We have the following fixes for the 7.2 kernel:
1) Avoid redundant page-table allocations in ioremap pcache topup
2) Apply SBI FWFT LOCK flag only on successful set
3) Bound SBI PMU counter mask scan to BITS_PER_LONG
4) Skip TLB flush when G-stage PTE becomes valid with Svvptc
5) Zicbo[m|z|p] block sizes should be always present in ONE_REG
6) Inject instruction access fault on unmapped guest fetch
7) Serialize virtual interrupt pending state updates using a raw spinlock
8) Fix Spectre-v1 in vector register access via ONE_REG

Please pull.

Regards,
Anup

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-fixes-7.2-1

for you to fetch changes up to 8d9c9b135b5c23de9811a8426257cbd2fa024a99:

  KVM: riscv: Fix Spectre-v1 in vector register access (2026-07-15
18:06:16 +0530)

----------------------------------------------------------------
KVM/riscv fixes for 7.2, take #1

- Avoid redundant page-table allocations in ioremap pcache topup
- Apply SBI FWFT LOCK flag only on successful set
- Bound SBI PMU counter mask scan to BITS_PER_LONG
- Skip TLB flush when G-stage PTE becomes valid with Svvptc
- Zicbo[m|z|p] block sizes should be always present in ONE_REG
- Inject instruction access fault on unmapped guest fetch
- Serialize virtual interrupt pending state updates using raw spinlock
- Fix Spectre-v1 in vector register access via ONE_REG

----------------------------------------------------------------
Anup Patel (1):
      RISC-V: KVM: Zicbo[m|z|p] block sizes should be always present in ONE_REG

Dylan.Wu (1):
      riscv: kvm: Skip TLB flush when G-stage PTE becomes valid with Svvptc

Fangyu Yu (1):
      RISC-V: KVM: Avoid redundant page-table allocations in ioremap topup

Qingwei Hu (1):
      RISC-V: KVM: Inject instruction access fault on unmapped guest fetch

SeungJu Cheon (1):
      KVM: riscv: SBI FWFT: Apply LOCK flag only on successful set

Shengwen Cheng (1):
      KVM: riscv: PMU: Bound counter mask scan to BITS_PER_LONG

Xie Bo (1):
      RISC-V: KVM: Serialize virtual interrupt pending state updates

Zongmin Zhou (1):
      KVM: riscv: Fix Spectre-v1 in vector register access

 arch/riscv/include/asm/kvm_host.h | 10 +++---
 arch/riscv/kvm/aia.c              | 35 ++++++++++++++++----
 arch/riscv/kvm/gstage.c           |  6 +++-
 arch/riscv/kvm/mmu.c              |  3 +-
 arch/riscv/kvm/vcpu.c             | 68 +++++++++++++++++++++++++++------------
 arch/riscv/kvm/vcpu_exit.c        | 19 +++++++++++
 arch/riscv/kvm/vcpu_onereg.c      | 46 +++++++-------------------
 arch/riscv/kvm/vcpu_pmu.c         |  4 +--
 arch/riscv/kvm/vcpu_sbi_fwft.c    |  6 ++--
 arch/riscv/kvm/vcpu_vector.c      | 14 ++++++--
 10 files changed, 137 insertions(+), 74 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
