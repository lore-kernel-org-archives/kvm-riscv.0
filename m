Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 424E4E937E4
	for <kvm-riscv@archiver.kernel.org>; Sun, 12 Apr 2026 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RDUBjc2PchAbLNyGNSIexhQK62AeGqzuxA+FXXkDFe4=; b=Xx5MGvwI5NkpUY
	o6zOM+VArhIGjm0utWq+2rp6yz9gf5tCEVsGq1KfzA2fN3mHHWfTStm2xe4A6wD9HGTi7OwVz6TmI
	7hVAI/NzL5rtYBm786+GCIHRcfUw84yd3cBeMNo9YsmVq56VGFELNIxhcgtsu8loIR3dXv63tWbZq
	Z1M92XS6it0WDMahILEnKuB1jp1ikSKWEoq5z7JNmoWDnpMoGnvPRT19PjOpVk4/DscMSpXddcAEK
	6Y73BSv8KPiV+WDy3J1gE/imn2PLJpteuUgOO5hIr0qg2QRhxEKN2/uJ60KiTUeeKZTF9rawRsO0p
	/hPSmUz9iTnfENgkFHow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBue8-0000000EK9M-3DWm;
	Sun, 12 Apr 2026 13:14:40 +0000
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBue5-0000000EK8R-30lt
	for kvm-riscv@lists.infradead.org;
	Sun, 12 Apr 2026 13:14:39 +0000
Received: by mail-oa1-x30.google.com with SMTP id 586e51a60fabf-40429b1d8baso1225613fac.0
        for <kvm-riscv@lists.infradead.org>; Sun, 12 Apr 2026 06:14:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775999676; cv=none;
        d=google.com; s=arc-20240605;
        b=WzebAy3xu0GRyAUtVFpsp1xOFFaqkavl9DJMJ6wkYMW9uB7kyg8YRwinTy1myJPaBk
         9L66rusn4Yl67Vh8pqIl276UZbMvBhChUa5EPjuwGGF+dmr17rAKkjPAhQQnGSB6Up7j
         l2szMjHClWKm/r8Jfuu8zmrIweyy797rU6tYy32h+ofhTUlfM+NHHoZxDhrLnunn3NVN
         AFSH7DhiiWxrToEnBVVcj/WUmuAzRkJ2p2V7HRSZh606KDJ2kNkrTG4r25rRUtIt8CT6
         gILu8AodaIXJHjkiukgzUddx2z9hF66Vpq62m+46TfKSlvsfu+kSnulqPqtBF/Kf+dBb
         Py+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=LgG7BhXRqBuLwTWbbmg1Dm6H9zvWjwsilKkHM4001AA=;
        fh=fH7Tg4MmjHAgvmTo2G4n9Kf21UxX+ss5dlQPXT997cE=;
        b=LaYzFaGdDJ31xci8wt7bcZ+kGWjZmMjTZnOAlGpyDG/bPJwZOO1FYNRFwLt17b+nBJ
         vr8h89vFPZSSAOZnxJl+SDH0hOlHk8RBE2W9MbRtiAEZrkeKKT6s1TtdDRVTkz5VEfxS
         D+fyHDnWwXyBmmuvtQjFg/P0t4GrS+vYcwTyRt+ColjbjW9EvAZ6gLLTafVTzt/ZLUDO
         c/flIcvdkbgYkMvGKmhfuTPOT2WsNUFXlsE6enGVNVFWiNatq6fwL9WiFxIScd+cF6c1
         oNEwPyP9PUsHBHXx2Wp2VzN0dXhohJWtui2CwPQbsIbK7sdeg+4K5EkYEyvDrm44dnsV
         lPGQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1775999676; x=1776604476; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LgG7BhXRqBuLwTWbbmg1Dm6H9zvWjwsilKkHM4001AA=;
        b=Kpn0MTy0PemxZd7RSV10gn7kC4W4pq/NT2iXzrcY2uqV6zwHqZX9Cs6KMjMdDt4ybW
         bejaXfuxdTzg+OleF2q6M/+slQGVpl5rggCuao1BbrGRDY5bfjRUTU6EgOYRSdKe2rdV
         8IgtK+QV7BF+Nwraf6iXXg/shuRkHfR/DeRoK25EAic3qNY0ZOdbbLl2Mp2Ksmsodc0b
         zh5kWoEZ2OX4LxkGdZhfwxcpZ7sueBuyOgYLb3mBOgccE5GhSEwT9Yg2i9GE3YEg85vL
         wtGRWCjkOvIRbRnAzIuEV04i7DjLViGqmBi0fBcx56Eq5iozTKaN+O9w4JWU6z7nkZYE
         6+6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775999676; x=1776604476;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LgG7BhXRqBuLwTWbbmg1Dm6H9zvWjwsilKkHM4001AA=;
        b=do4N0chwSBzEFWaWsHF8Pqx6/TVAzU4TPpHZ2dOc0jmJVTI9kuZ4Ed3hSEa4wgaDYe
         c/0LWu8XbuU/xDdxqDRxuFKzZyypuZL5R9kZxRxz+PZi5z9Jed0Hap0fn9NL3DmSBeBT
         8AN0XvIkrVUNJCyq+7kHiANMRFxFFLjTxuK14gXQxzktSMy9+0J23S8VN7gOWr7g++GG
         v13GjPOliaYKseErO4DmRmRjubNX03nyIdxx2pQxKDyNsYuEqjYomJ8TigVFIf8/qr2E
         d1KKeDrSY8ujUx5zvPsUoRzIxCGn5Ds2sVxgoq0W2+mauTiU+DolMJfOeB8v6RN9CeHm
         B3cw==
X-Forwarded-Encrypted: i=1; AJvYcCXE4NJgvt3AUide7GrW9732s8HYv3pzyLPsdp/oh/g/0Lru8L+T37CBj6R12DR7dioP946TnBIGz8E=@lists.infradead.org
X-Gm-Message-State: AOJu0YzmsfEVtjN3y7jkn4V7UUhAAq7rGnOj2imigKdGv2Hgp90Nr1SB
	6uFhPqPet2whMQLuhnb2L26Z32ZP0mb/uWJ+edDH1Dp4PGY8UvO4g8NKlB9E9jm3iv1u8JLZvqR
	t9EyZ1B6RZ+EH++CC5brHyvuHYz7Allmu4Vl8UY/9DA==
X-Gm-Gg: AeBDiesZvk32ke80qHjU40w7HK9yjNPFLT9Vv1RDuofqP4nxW4TcxcAr7lHYrQHZxgI
	vzoT1jKBPbz2d6DEYzVf9WY6b/a7SQ4MC/KvpnzbN52jeERS5ricVP7uo+u6ICb+7RiJP7lqUBe
	W9RA3xyCmytyUW1FyGggc39qpOXumwwHK0isp0almttrafL/vsUssOQ6WoGJf8tUXLp9+qJqdB5
	L8E4DkLjfj0KAKpX3NN3eieBLUUXA62VZZ6+ChzjhIzYRF5kCD4p2MgGokWhFu79wkZHjNJSucZ
	G6jPBI4+WJ/XPOLo8fNoJsPik1EBOcc21JccMVkUDuVvAX/Xdqsii0oW7yRjVf+nXwXYD6M2RJG
	8xYy4RSxqW0+MP3UHdMQRMQchrIg=
X-Received: by 2002:a05:6820:4b92:b0:680:51ef:f9d1 with SMTP id
 006d021491bc7-68be652db01mr5240094eaf.21.1775999675969; Sun, 12 Apr 2026
 06:14:35 -0700 (PDT)
MIME-Version: 1.0
From: Anup Patel <anup@brainfault.org>
Date: Sun, 12 Apr 2026 18:44:24 +0530
X-Gm-Features: AQROBzCUdDrPQORt6CjxveecMBhX-5A0Za-u8m_gR4edHpfzdPcYpLOQDe-EeWI
Message-ID: <CAAhSdy0sU997x67zZe00ZVPVrOT-=X8zOUk3OxWXeDcn-rHeXA@mail.gmail.com>
Subject: [GIT PULL] KVM/riscv changes for 7.1
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Atish Patra <atish.patra@linux.dev>, 
	"open list:KERNEL VIRTUAL MACHINE FOR RISC-V (KVM/riscv)" <kvm-riscv@lists.infradead.org>, KVM General <kvm@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_061438_036174_0430FE4C 
X-CRM114-Status: GOOD (  11.73  )
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

We have the following KVM RISC-V changes for 7.1:
1) Fixes for issues in steal time accounting, vector and
    PMU which were discovered by KVM API fuzzing
2) Split huge pages during fault handling for dirty logging
    so that write permission is restored for smaller pages
3) Improve kvm_arch_vcpu_load() performance by skipping
    CSR restore if VCPU is reloaded on the same core
4) Implement kvm_arch_has_default_irqchip() for KVM selftests
5) Support configuration of per-VM HGATP mode from KVM
    user space
6) Some more preparatory changes for nested virtualization
    such as:
    6.1) Factored-out ISA checks into separate sources
    6.2) Added hideleg to struct kvm_vcpu_config
    6.3) Factored-out VCPU config into separate sources

Please pull.

Regards,
Anup

The following changes since commit c369299895a591d96745d6492d4888259b004a9e:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  https://github.com/kvm-riscv/linux.git tags/kvm-riscv-7.1-1

for you to fetch changes up to ddbf9c76c4020bf63a0799b00faad40caa3de6c2:

  RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()
(2026-04-06 09:43:02 +0530)

----------------------------------------------------------------
KVM/riscv changes for 7.1

 - Fix steal time shared memory alignment checks
 - Fix vector context allocation leak
 - Fix array out-of-bounds in pmu_ctr_read() and pmu_fw_ctr_read_hi()
 - Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
 - Fix integer overflow in kvm_pmu_validate_counter_mask()
 - Fix shift-out-of-bounds in make_xfence_request()
 - Fix lost write protection on huge pages during dirty logging
 - Split huge pages during fault handling for dirty logging
 - Skip CSR restore if VCPU is reloaded on the same core
 - Implement kvm_arch_has_default_irqchip() for KVM selftests
 - Factored-out ISA checks into separate sources
 - Added hideleg to struct kvm_vcpu_config
 - Factored-out VCPU config into separate sources
 - Support configuration of per-VM HGATP mode from KVM user space

----------------------------------------------------------------
Anup Patel (6):
      RISC-V: KVM: Introduce common kvm_riscv_isa_check_host()
      RISC-V: KVM: Factor-out ISA checks into separate sources
      RISC-V: KVM: Move timer state defines closer to struct in UAPI header
      RISC-V: KVM: Add hideleg to struct kvm_vcpu_config
      RISC-V: KVM: Factor-out VCPU config into separate sources
      RISC-V: KVM: Don't check hstateen0 when updating sstateen0 CSR

Fangyu Yu (3):
      RISC-V: KVM: Support runtime configuration for per-VM's HGATP mode
      RISC-V: KVM: Cache gstage pgd_levels in struct kvm_gstage
      RISC-V: KVM: Reuse KVM_CAP_VM_GPA_BITS to select HGATP.MODE

Jiakai Xu (8):
      RISC-V: KVM: Validate SBI STA shmem alignment in kvm_sbi_ext_sta_set_reg()
      KVM: selftests: Refactor UAPI tests into dedicated function
      RISC-V: KVM: selftests: Add RISC-V SBI STA shmem alignment tests
      RISC-V: KVM: Fix array out-of-bounds in pmu_ctr_read() and
pmu_fw_ctr_read_hi()
      RISC-V: KVM: selftests: Fix firmware counter read in sbi_pmu_test
      RISC-V: KVM: Fix double-free of sdata in kvm_pmu_clear_snapshot_area()
      RISC-V: KVM: Fix integer overflow in kvm_pmu_validate_counter_mask()
      RISC-V: KVM: Fix shift-out-of-bounds in make_xfence_request()

Jinyu Tang (1):
      KVM: riscv: Skip CSR restore if VCPU is reloaded on the same core

Mayuresh Chitale (1):
      KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip

Osama Abdelkader (2):
      RISC-V: KVM: fix PMU snapshot_set_shmem on 32-bit hosts
      riscv: kvm: fix vector context allocation leak

Wang Yechao (2):
      RISC-V: KVM: Fix lost write protection on huge pages during dirty logging
      RISC-V: KVM: Split huge pages during fault handling for dirty logging

Yufeng Wang (1):
      riscv: kvm: add null pointer check for vector datap

 arch/riscv/include/asm/kvm_gstage.h                |  51 +++-
 arch/riscv/include/asm/kvm_host.h                  |  23 +-
 arch/riscv/include/asm/kvm_isa.h                   |  20 ++
 arch/riscv/include/asm/kvm_vcpu_config.h           |  25 ++
 arch/riscv/include/uapi/asm/kvm.h                  |   8 +-
 arch/riscv/kvm/Makefile                            |   2 +
 arch/riscv/kvm/aia_device.c                        |   4 +-
 arch/riscv/kvm/gstage.c                            | 198 +++++++++++---
 arch/riscv/kvm/isa.c                               | 253 ++++++++++++++++++
 arch/riscv/kvm/main.c                              |  16 +-
 arch/riscv/kvm/mmu.c                               |  70 ++---
 arch/riscv/kvm/tlb.c                               |   3 +-
 arch/riscv/kvm/vcpu.c                              | 111 +++-----
 arch/riscv/kvm/vcpu_config.c                       | 103 ++++++++
 arch/riscv/kvm/vcpu_fp.c                           |   9 +-
 arch/riscv/kvm/vcpu_onereg.c                       | 284 ++-------------------
 arch/riscv/kvm/vcpu_pmu.c                          |  33 ++-
 arch/riscv/kvm/vcpu_sbi_sta.c                      |  16 +-
 arch/riscv/kvm/vcpu_timer.c                        |   3 +-
 arch/riscv/kvm/vcpu_vector.c                       |  11 +-
 arch/riscv/kvm/vm.c                                |  49 +++-
 arch/riscv/kvm/vmid.c                              |   3 +-
 .../testing/selftests/kvm/include/kvm_util_types.h |   2 +
 tools/testing/selftests/kvm/include/riscv/sbi.h    |  37 +++
 tools/testing/selftests/kvm/lib/riscv/processor.c  |   5 +
 tools/testing/selftests/kvm/riscv/sbi_pmu_test.c   |  20 +-
 tools/testing/selftests/kvm/steal_time.c           |  98 +++++--
 27 files changed, 956 insertions(+), 501 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_isa.h
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_config.h
 create mode 100644 arch/riscv/kvm/isa.c
 create mode 100644 arch/riscv/kvm/vcpu_config.c

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
