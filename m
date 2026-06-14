Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 443D1CD98D2
	for <kvm-riscv@archiver.kernel.org>; Sun, 14 Jun 2026 09:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kIFARhH+UgafB4TQF6kuQUizWUcsJCxBAEjXO48x4aE=; b=Zs/iy6sDT3KFR2
	Z4AmXA4KkqQ4z6nYs/6bt0y11SW0HbU/TcPwcRzwsVbDlCfc4UTZFMXJrFelQB+NnqIGQ9A7I/ZUM
	v7D1/Ya29sU8fKTK/rvlv0TXx37LgfokuxC8+94i3GH3/SV67DmpphN7eSkaC+W7Z52DxunpGaM4g
	VjNTyUEd842xPwg/JG8fvEAQLOhFVkVAV7Owpyuigrjxw6TNtmPD8RAoE/PW6NO6MJG9i/c7815er
	LgGpC4PZNJpnzEip4R9uPIspCApHwRrOC/HyAlQqh4q6esyWJQwzPZC46c5ohvPjdX/vOzZXk40P/
	bNcLNUjJ7FprLMDGBNbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhTl-0000000Cqxf-2xjT;
	Sun, 14 Jun 2026 09:50:09 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYhTi-0000000Cqwz-38Ai
	for kvm-riscv@lists.infradead.org;
	Sun, 14 Jun 2026 09:50:08 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e71dd64ea2so1426652a34.3
        for <kvm-riscv@lists.infradead.org>; Sun, 14 Jun 2026 02:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781430605; cv=none;
        d=google.com; s=arc-20240605;
        b=emk3dDL/abHWix+riwTHOMDE+oiR/V+kPeYxWSoUymnIF8j9E7Gyn9LNZpgpW9ACtf
         WnitnF/mNNb/zRPwniWuzn77eVWu/yEGZwWIu9GcRPyX/MfoO1loPqMlaHg36iuH2iKA
         VST/ZUP4Oa9hU5/yBl+gm+jJJ0aN0AgPsJsPz0GT9yj0aTyG3aimPp4uAHx4k7+GR/MQ
         FYG0pQ++I5HH1H5OK4DVm7koHbHlGVTaWMoZBd9qC44E0oC4pP+G2QuKl5bWn9BssUx3
         BjbXECKInYyN0QrBc7tEl//veNECRd27cxeXbjjpfk2vWN1gTWHjku9jTMmz34z/R3Ct
         z9Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        fh=3vtOFYPISQydfp0oqq6eATM58/DKdhfZ0WA8ky430Z8=;
        b=C9M6VwQ6swIjc19W6lDq6R1e4xtCpxQpAUuLmQLvyoOxJ+Qs15ZyFjkU2tm6/hhi4p
         48TnsQJfHUlIDK2mGe1xah3Z6YMglBXFiNIkkfLSw4B/UkhO59vbgRHpUi3SZjvlEHAS
         qCaNzSeGL2DUzuwPLJWkh9YqROmEGhO2qQAf4rESIhYunMuWGTSNdNJame9xS4zwHnbO
         elEEJpT9S+WWQ2Qbpv49LwocEWbG7GIB+XUkkPPScMm6K2VvGuNIOtLsD7YKf26jfUHC
         PYKFCcwO50yo9qzmZ4aXLok340RSFClLICE3BVJmdkPIxsaFQseyawpgeYfkyPGNBlX8
         2dYQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1781430605; x=1782035405; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        b=x3x3Xfw8Bn9q2Ug/f23jG4xQEq6aMIMwVLA/XoDG1alClpgEMFV1XXU1kWMoc/9ML2
         W1QEkLSPQQEvVByCDJbYx8Pe1hojT4ADTKLX6tHg233UfIFs0E4eOisyhAmW5b4QKs1C
         JMPtCes5p+Chc6BOov2c3g9ZV+S+/gtKvdT4dNRSlyGPnOoQ4U+IewD/OldnDDSwTcEf
         D65S4lH7hYrsmhpSaRiS8lcJ65NtxStBnjtBxlHq79YollQn8pPrJYM0RDItonRPemyC
         wgqVenPmf+q/0q44DPIRcuGVc987BhrSVfjVJK8iKR/eJkNUl4K4kFC7bQLyyR7wHdd+
         FF3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781430605; x=1782035405;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VcEaPc+InRyngVPx1TmveUSubcUpXss3FM5/ylmJY7w=;
        b=gMKe6oZS635QeDlee04UOY1EDpzHX8m8ful2lO8TbvGPvMUmG2srn/352kLWeNzrur
         8t6DOj50qXXWiw742NzVm4duGzqzuB7nHbQAsWLIBlNPS0KtKobzb3za5na1es1gNypT
         Us4lpLC0JivNUloF+YsMTGNmghqQzGrKldtqWc94jy3N/mHlgQ0ReHLN9wVXPqgEqSRc
         EKSqAZyXehdSWSVRp8AWoVo4apYjb2ypZF7zpjpQ+2HlEmxLT5/7IC/+8G0excW8EF+b
         /Ge/0gvx1ixgsPAjatTNJFH7kJSzTEc12h0aOcLB09nDAslgWy85pEIwVWJJvNudU6y1
         ivag==
X-Forwarded-Encrypted: i=1; AFNElJ9oGQ2E6joLZ3hettp/fbenwEeWPrUa4bIZ4q1FYObA7Uwl+y/HY0frOm4lGalSDaJxcm35X1Ba8is=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfzdyU01oKCL/I3DyFuTAy8ijrWez+8wxStqZle8GaqiDksZgi
	r0EtqEe2RScNuhiyIbpvoQapO6yIHnX4YSjWGyovAkwFRTP+pdNZ+pHLjnfIcmfafheWzv9sSfN
	RaxSa4NJEN0JeebTlfM4xfxKW8llTWBbcDhjLXMQCbA==
X-Gm-Gg: Acq92OFzNVRKCzNkVGr2l4jq7SfyCWP0ByXDZDd6xgrakXmN9txI3t45KqQ2NsemM1u
	UiIDtH1awhZehZMeOblq2kcsQPdnP1Ta4V2jAhoBG8JgOnwLAKvvyWM6ROfVSYFZtWBxYsrJi83
	au3lfYMB2hUIqlI5E76aRMQW1vjGjGHHd8FnLkmemf48uHEqZk/IhP8fCHldPpcXgmICTTUU/9Q
	fgjC4abZbsA02arJlEvUlvkf7EAJxwOykdjkGTLDzifNJpVTvsAd6nakawkyl90MXRl2SbT7ZjK
	bjTgB8bDV2Ecre1d/FI26nq+aOC0Ikqov+cWXaeCXWJbOpHMebuzXMXH6NnGvGhCBCpxguD9iYQ
	FYwVCmsgy7f5m6R/PWLgGw4UA
X-Received: by 2002:a05:6808:f8b:b0:47b:c703:4239 with SMTP id
 5614622812f47-48741bd0be7mr4157764b6e.37.1781430605198; Sun, 14 Jun 2026
 02:50:05 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 14 Jun 2026 15:19:53 +0530
X-Gm-Features: AVVi8CfHnWnteBOIh40QsRCyc8p5St1as7WBgGCWiIu98anP84j67OfEd2A8iWA
Message-ID: <CAAhSdy0WTa-jDxg0cQxwqfGM+Det+WxM-ELV3F2ktrcbw8g7Bw@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.2
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"KVM RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260614_025007_071524_5FD2062E 
X-CRM114-Status: UNSURE (   8.30  )
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

We have the following KVM RISC-V changes for 7.2:
1) Batch G-stage TLB flushes for GPA range based page table updates
2) Convert HGEI line management to fully per-HART
3) Speed up dirty logging write faults using MMU rwlock and atomic
    PTE updates for permission-only changes
4) Use flexible array for APLIC IRQ state
5) FWFT fixes for missing CSR dirty marking and stale feature
    exposure to Guest/VM
6) Fix logging enable check on a memslot by using
    kvm_slot_dirty_track_enabled()
7) Fixes to avoid skipping valid pages in kvm_riscv_gstage_wp_range()
    and kvm_riscv_gstage_unmap_range()

Please pull.

Regards,
Anup

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.2-1

for you to fetch changes up to 52738352a6f29279e15285fcb7b50241ef867e27:

  riscv: kvm: Use endian-specific __lelong for NACL shared memory
(2026-06-14 11:09:41 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.2

- Batch G-stage TLB flushes for GPA range based page table updates
- Convert HGEI line management to fully per-HART
- Fix missing CSR dirty marking when FWFT state updated via ONE_REG
- Fix stale FWFT feature exposure to Guest/VM
- Speed up dirty logging write faults using MMU rwlock and atomic
  PTE updates using cmpxchg() for permission-only changes
- Use flexible array for APLIC IRQ state
- Use kvm_slot_dirty_track_enabled() for logging enable check on
  a memslot
- Avoid skipping valid pages in kvm_riscv_gstage_wp_range()
- Avoid skipping valid pages in kvm_riscv_gstage_unmap_range()
- Use endian-specific __lelong for NACL shared memory

----------------------------------------------------------------
Guo Ren (Alibaba DAMO Academy) (2):
      irqchip/riscv-imsic: Add nr_guest_files in per-HART local config
      RISC-V: KVM: AIA: Make HGEI number management fully per-CPU

Inochi Amaoto (1):
      RISC-V: KVM: Enhance the logging check for mmu mapping

Jiakai Xu (2):
      RISC-V: KVM: Document a TOCTOU race in SBI system suspend handler
      RISC-V: KVM: Fix NULL pointer dereference in AIA IMSIC functions

Jinyu Tang (8):
      RISC-V: KVM: Batch stage-2 TLB flushes
      KVM: riscv: Rely on common MMU notifier locking
      KVM: riscv: Use an rwlock for mmu_lock
      KVM: riscv: Add a G-stage PTE cmpxchg helper
      KVM: riscv: Update G-stage PTE permissions atomically
      KVM: riscv: Fast-path dirty logging write faults
      KVM: riscv: Check hugetlb block mappings against memslot bounds
      KVM: selftests: Add a hugetlb memslot alignment test mode

Mayuresh Chitale (1):
      RISC-V: KVM: Fix ebreak self test failure

Qiang Ma (1):
      RISC-V: KVM: Fix timer state restore

Rosen Penev (1):
      RISC-V: KVM: Use flexible array for APLIC IRQ state

Sean Chang (1):
      riscv: kvm: Use endian-specific __lelong for NACL shared memory

Wu Fei (2):
      RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_wp_range
      RISC-V: KVM: Fix skip of valid pages in kvm_riscv_gstage_unmap_range

Yong-Xuan Wang (5):
      KVM: RISC-V: SBI FWFT: Mark vCPU CSRs dirty after setting feature value
      KVM: RISC-V: SBI FWFT: Add optional init() callback for hardware probing
      KVM: RISC-V: SBI FWFT: Fix stale feature exposure after runtime
extension changes
      KVM: riscv: selftests: Refactor ISA and SBI extension sublist macros
      KVM: riscv: selftests: Split SBI FWFT into separate
feature-specific sublists

 arch/riscv/include/asm/kvm_aia.h                  |   2 +-
 arch/riscv/include/asm/kvm_gstage.h               |  10 +-
 arch/riscv/include/asm/kvm_host.h                 |   2 +
 arch/riscv/include/asm/kvm_nacl.h                 |  14 +-
 arch/riscv/include/asm/uaccess.h                  |   2 +-
 arch/riscv/kvm/aia.c                              |  88 +++++----
 arch/riscv/kvm/aia_aplic.c                        |  15 +-
 arch/riscv/kvm/aia_device.c                       |   4 +-
 arch/riscv/kvm/aia_imsic.c                        |   9 +
 arch/riscv/kvm/gstage.c                           | 100 ++++++----
 arch/riscv/kvm/main.c                             |   8 +-
 arch/riscv/kvm/mmu.c                              | 211 ++++++++++++++++++----
 arch/riscv/kvm/nacl.c                             |   2 +-
 arch/riscv/kvm/vcpu.c                             |   1 +
 arch/riscv/kvm/vcpu_sbi_fwft.c                    |  44 ++++-
 arch/riscv/kvm/vcpu_sbi_system.c                  |  14 ++
 arch/riscv/kvm/vcpu_timer.c                       |   2 +-
 drivers/irqchip/irq-riscv-imsic-state.c           |   9 +-
 include/linux/irqchip/riscv-imsic.h               |   5 +-
 tools/testing/selftests/kvm/kvm_page_table_test.c |  28 ++-
 tools/testing/selftests/kvm/riscv/get-reg-list.c  | 138 ++++++++------
 21 files changed, 499 insertions(+), 209 deletions(-)

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
