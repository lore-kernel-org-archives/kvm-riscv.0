Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA878F5A8C5
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n4f9B0EVPCIi/DXqvLoM45eUGr0m06LCGw6XhSiKvok=; b=hh0xVDRypLmk5I
	V8XGxmUomyqNqRdztjWw+M1Qk8KUIGtL+X7jYn4/RXip3IE3OTma9mOx3VcUSO7BORZRioGF2imEV
	Tjg7W2kxrvW9Fw5jYQigaTaQTmBp0rBzEASerYjExTtT+1bglKxWwdE4jEQHb30IBEF1T4Bk3mqnw
	BrWOA8Nh6HJK5cQm1+jwj9+MgvheUFSh8/SVhVTUsjDIDHP0DyK+7dWGSFtHi3C1Ek6ZgopPHnKb2
	eHzwqADVbgNM2Vrkj7BS50YHeISP23+oE8UrFHvIJTawdXZbuFxjXpxohBH9bqCAoVtXdGbJ6wOO9
	J3dYW17ftmVmFEKowkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2M-00000007fSt-1apm;
	Mon, 20 Apr 2026 21:20:10 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEw2J-00000007fRF-48tb
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 21:20:09 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-2b2d0c1ead1so67676485ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 20 Apr 2026 14:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776720006; x=1777324806; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ay36onivd4dX+Z1a2tz7QaER4k6wTnDl5SDdSR+0YAI=;
        b=v1PhXw+t2crxV4PVt0TKs6G39HKLtwWU/pXkPdYHJwYTeWj6eeh6nuwfBZ6eXXTgjn
         1TwkoKWx+n8wtaNMD4o3SfxvTWZJYFD9X1aFoJ7yq81NqnGmJqpwO41VlkHm3GfJyPqz
         5mdR059e48vNKUjg4Ly/KNNd33je709hkDTUv61FTVhm1rX+4y0csIybGxcxxRUo8Qzr
         vE58J7MuzRWZ9x/yEqQ/ojUTeN7XbfNSli8AYTPMa2+oly+lI5wqnWWLwJay9LIRFFAi
         gfP7y26TiQ6Q+av8pUMR+lIDSjK0qF/q0vc3fY52LDSoMarNJUIexSmdGcckn1HwVnAD
         1bcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776720006; x=1777324806;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ay36onivd4dX+Z1a2tz7QaER4k6wTnDl5SDdSR+0YAI=;
        b=c/ZAiCchLGJ0H9zYyJW+Cw4BoRh74vHjZ8yuL18XhI/uLKGLszzE5SoOXyfdcr66X1
         IkFc4j4xuNzyTdzhe4S8AiJBONaWawx/1lJjAR6LgyXBVsI4W3wklJ+7Ol3Vjd1Xlxni
         qwdTMdr0vz0vINmwqYBw5VpGdPKBD6KsvsP7ToTCSF2MVS16/wW7FdJ7455/viMIXxz6
         +P8fFWiNrcF25JdY/+gfiZ4l5Y0tkPkUC25IesLo0taqATRtMQmdNDebWB3K06sS2HSb
         sGs90LvE3eSL5UfxtI1Vrl5i/RCWVLzeAvns0JKG914CWDz9BzI+3WZXXYCeB7u9qeJj
         4taA==
X-Forwarded-Encrypted: i=1; AFNElJ8UM39nc1pBLyOwbn3VzUL7V0fzMvZRq2MjK313OCi/D/MpfELOGmCWF9DHhJpKLB7/z6w6MFs05FE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz9HzZEgN0TamYbqcOHolRnx6VSh3KJWpu4fR2w8nSlx0O33HB
	JCmUMYjwjjnDb6zV4w3UdolSDGBOzgfhqU2NIX/SUBa3/DTwbKzJc8l75VWkvUpWQqenwDWbsrg
	RPlXIQA==
X-Received: from pgam23.prod.google.com ([2002:a05:6a02:2b57:b0:c76:a4b1:60cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3947:b0:3a2:e26b:2940
 with SMTP id adf61e73a8af0-3a2e26c9037mr1652980637.0.1776720006241; Mon, 20
 Apr 2026 14:20:06 -0700 (PDT)
Date: Mon, 20 Apr 2026 14:19:45 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260420212004.3938325-1-seanjc@google.com>
Subject: [PATCH v3 00/19] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_142008_046431_6CB6E9A0 
X-CRM114-Status: GOOD (  14.09  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

David's series to renames types across all KVM selftests.  I'm going to apply
this ~now in order to get it into -next ASAP.  Unless someone screams in the
next few days, I'm going to send a pull request on Thursday, with the goal of
getting this into -rc1 so that all architectures (and developers) can use the
new types straightaway.

Fully tested on x86, and I verified a handful of tests generate identical
code.  I tried to do the same for other architectures, but gcc at least doesn't
seem to provide reproducible builds for other architectures.  E.g. on arm64 and
LoongArch, a completely benign vaddr_t => gva_t rename would sometimes result
in different offsets in the generated code.  But based on manual diffs from
objdump, I'm fairly confident in the result.

The primary goal is to more closely align KVM selftests with the types used in
the kernel proper (selftests are mostly developed by kernel developers):

  vm_vaddr_t -> gva_t
  vm_paddr_t -> gpa_t

  uint64_t -> u64
  uint32_t -> u32
  uint16_t -> u16
  uint8_t  -> u8

  int64_t -> s64
  int32_t -> s32
  int16_t -> s16
  int8_t  -> s8

As a bonus, the new type names are shorter and thus make the KVM selftests code
more concise.

v3:
 - Use vm_alloc() instead of gva_alloc(), and put the API renames in a separate
   patch.
 - Rename vaddr => gva and paddr => gpa throughout KVM selftests.
 - Convert a pile of "u64" variables to gva_t or gpa_t as appropriate.
 - Clarify ambiguous variables and function names in arm64's inject_uer()
   and translate_to_host_paddr().
 - Rename pread_uint64() => pread_u64().

v2: https://lore.kernel.org/all/20260220004223.4168331-1-dmatlack@google.com

v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@google.com

David Matlack (10):
  KVM: selftests: Use gva_t instead of vm_vaddr_t
  KVM: selftests: Use gpa_t instead of vm_paddr_t
  KVM: selftests: Use gpa_t for GPAs in Hyper-V selftests
  KVM: selftests: Use u64 instead of uint64_t
  KVM: selftests: Use s64 instead of int64_t
  KVM: selftests: Use u32 instead of uint32_t
  KVM: selftests: Use s32 instead of int32_t
  KVM: selftests: Use u16 instead of uint16_t
  KVM: selftests: Use s16 instead of int16_t
  KVM: selftests: Use u8 instead of uint8_t

Sean Christopherson (9):
  KVM: selftests: Drop "vaddr_" from APIs that allocate memory for a
    given VM
  KVM: selftests: Rename vm_vaddr_unused_gap() => vm_unused_gva_gap()
  KVM: selftests: Rename vm_vaddr_populate_bitmap() =>
    vm_populate_gva_bitmap()
  KVM: selftests: Rename translate_to_host_paddr() =>
    translate_hva_to_hpa()
  KVM: selftests: Clarify that arm64's inject_uer() takes a host PA, not
    a guest PA
  KVM: selftests: Replace "vaddr" with "gva" throughout
  KVM: selftests: Replace "u64 gpa" with "gpa_t" throughout
  KVM: selftests: Replace "u64 nested_paddr" with "gpa_t l2_gpa"
  KVM: selftests: Replace "paddr" with "gpa" throughout

 .../selftests/kvm/access_tracking_perf_test.c |  44 +--
 tools/testing/selftests/kvm/arch_timer.c      |   6 +-
 .../selftests/kvm/arm64/aarch32_id_regs.c     |  14 +-
 .../testing/selftests/kvm/arm64/arch_timer.c  |   8 +-
 .../kvm/arm64/arch_timer_edge_cases.c         | 161 ++++----
 .../selftests/kvm/arm64/debug-exceptions.c    |  72 ++--
 .../testing/selftests/kvm/arm64/hypercalls.c  |  24 +-
 .../testing/selftests/kvm/arm64/idreg-idst.c  |   4 +-
 tools/testing/selftests/kvm/arm64/no-vgic.c   |   8 +-
 .../selftests/kvm/arm64/page_fault_test.c     |  82 ++--
 tools/testing/selftests/kvm/arm64/psci_test.c |  26 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  41 +-
 .../testing/selftests/kvm/arm64/set_id_regs.c |  70 ++--
 .../selftests/kvm/arm64/smccc_filter.c        |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_init.c |  56 +--
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 137 +++----
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  20 +-
 tools/testing/selftests/kvm/arm64/vgic_v5.c   |  10 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c |  56 +--
 .../testing/selftests/kvm/coalesced_io_test.c |  38 +-
 .../selftests/kvm/demand_paging_test.c        |  10 +-
 .../selftests/kvm/dirty_log_perf_test.c       |  14 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  82 ++--
 tools/testing/selftests/kvm/get-reg-list.c    |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  18 +-
 .../testing/selftests/kvm/guest_print_test.c  |  22 +-
 .../selftests/kvm/hardware_disable_test.c     |   6 +-
 .../selftests/kvm/include/arm64/arch_timer.h  |  30 +-
 .../selftests/kvm/include/arm64/delay.h       |   4 +-
 .../testing/selftests/kvm/include/arm64/gic.h |   8 +-
 .../selftests/kvm/include/arm64/gic_v3_its.h  |   7 +-
 .../selftests/kvm/include/arm64/processor.h   |  22 +-
 .../selftests/kvm/include/arm64/ucall.h       |   4 +-
 .../selftests/kvm/include/arm64/vgic.h        |  22 +-
 .../testing/selftests/kvm/include/kvm_util.h  | 344 ++++++++---------
 .../selftests/kvm/include/kvm_util_types.h    |   8 +-
 .../kvm/include/loongarch/arch_timer.h        |   4 +-
 .../selftests/kvm/include/loongarch/ucall.h   |   4 +-
 .../testing/selftests/kvm/include/memstress.h |  30 +-
 .../selftests/kvm/include/riscv/arch_timer.h  |  22 +-
 .../selftests/kvm/include/riscv/processor.h   |   9 +-
 .../selftests/kvm/include/riscv/ucall.h       |   4 +-
 .../kvm/include/s390/diag318_test_handler.h   |   2 +-
 .../selftests/kvm/include/s390/facility.h     |   4 +-
 .../selftests/kvm/include/s390/ucall.h        |   4 +-
 .../testing/selftests/kvm/include/sparsebit.h |   6 +-
 .../testing/selftests/kvm/include/test_util.h |  40 +-
 .../selftests/kvm/include/timer_test.h        |  18 +-
 .../selftests/kvm/include/ucall_common.h      |  22 +-
 .../selftests/kvm/include/userfaultfd_util.h  |   6 +-
 .../testing/selftests/kvm/include/x86/apic.h  |  22 +-
 .../testing/selftests/kvm/include/x86/evmcs.h |  22 +-
 .../selftests/kvm/include/x86/hyperv.h        |  28 +-
 .../selftests/kvm/include/x86/kvm_util_arch.h |  36 +-
 tools/testing/selftests/kvm/include/x86/pmu.h |   9 +-
 .../selftests/kvm/include/x86/processor.h     | 292 +++++++-------
 tools/testing/selftests/kvm/include/x86/sev.h |  20 +-
 tools/testing/selftests/kvm/include/x86/smm.h |   3 +-
 .../selftests/kvm/include/x86/svm_util.h      |  12 +-
 .../testing/selftests/kvm/include/x86/ucall.h |   2 +-
 tools/testing/selftests/kvm/include/x86/vmx.h |  70 ++--
 .../selftests/kvm/kvm_page_table_test.c       |  54 +--
 tools/testing/selftests/kvm/lib/arm64/gic.c   |   6 +-
 .../selftests/kvm/lib/arm64/gic_private.h     |  26 +-
 .../testing/selftests/kvm/lib/arm64/gic_v3.c  |  90 ++---
 .../selftests/kvm/lib/arm64/gic_v3_its.c      |  11 +-
 .../selftests/kvm/lib/arm64/processor.c       | 163 ++++----
 tools/testing/selftests/kvm/lib/arm64/ucall.c |  12 +-
 tools/testing/selftests/kvm/lib/arm64/vgic.c  |  40 +-
 tools/testing/selftests/kvm/lib/elf.c         |  17 +-
 tools/testing/selftests/kvm/lib/guest_modes.c |   2 +-
 .../testing/selftests/kvm/lib/guest_sprintf.c |  18 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 359 +++++++-----------
 .../selftests/kvm/lib/loongarch/processor.c   | 110 +++---
 .../selftests/kvm/lib/loongarch/ucall.c       |  12 +-
 tools/testing/selftests/kvm/lib/memstress.c   |  38 +-
 .../selftests/kvm/lib/riscv/processor.c       |  91 +++--
 .../kvm/lib/s390/diag318_test_handler.c       |  12 +-
 .../testing/selftests/kvm/lib/s390/facility.c |   2 +-
 .../selftests/kvm/lib/s390/processor.c        |  65 ++--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  18 +-
 tools/testing/selftests/kvm/lib/test_util.c   |  30 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |  34 +-
 .../selftests/kvm/lib/userfaultfd_util.c      |  14 +-
 tools/testing/selftests/kvm/lib/x86/apic.c    |   2 +-
 tools/testing/selftests/kvm/lib/x86/hyperv.c  |  14 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  14 +-
 tools/testing/selftests/kvm/lib/x86/pmu.c     |   8 +-
 .../testing/selftests/kvm/lib/x86/processor.c | 292 +++++++-------
 tools/testing/selftests/kvm/lib/x86/sev.c     |  20 +-
 tools/testing/selftests/kvm/lib/x86/svm.c     |  16 +-
 tools/testing/selftests/kvm/lib/x86/ucall.c   |   4 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  44 +--
 .../selftests/kvm/loongarch/arch_timer.c      |  28 +-
 .../selftests/kvm/loongarch/pmu_test.c        |  10 +-
 .../kvm/memslot_modification_stress_test.c    |  10 +-
 .../testing/selftests/kvm/memslot_perf_test.c | 164 ++++----
 tools/testing/selftests/kvm/mmu_stress_test.c |  28 +-
 .../selftests/kvm/pre_fault_memory_test.c     |  12 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  |   8 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   6 +-
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   8 +-
 tools/testing/selftests/kvm/s390/debug_test.c |   8 +-
 .../testing/selftests/kvm/s390/irq_routing.c  |   2 +-
 tools/testing/selftests/kvm/s390/memop.c      |  94 ++---
 tools/testing/selftests/kvm/s390/resets.c     |   6 +-
 .../selftests/kvm/s390/shared_zeropage_test.c |   2 +-
 tools/testing/selftests/kvm/s390/tprot.c      |  24 +-
 .../selftests/kvm/s390/ucontrol_test.c        |   8 +-
 .../selftests/kvm/set_memory_region_test.c    |  40 +-
 tools/testing/selftests/kvm/steal_time.c      |  74 ++--
 .../kvm/system_counter_offset_test.c          |  12 +-
 tools/testing/selftests/kvm/x86/amx_test.c    |  14 +-
 .../selftests/kvm/x86/aperfmperf_test.c       |  16 +-
 .../selftests/kvm/x86/apic_bus_clock_test.c   |  24 +-
 tools/testing/selftests/kvm/x86/cpuid_test.c  |   6 +-
 tools/testing/selftests/kvm/x86/debug_regs.c  |   4 +-
 .../kvm/x86/dirty_log_page_splitting_test.c   |  16 +-
 .../kvm/x86/evmcs_smm_controls_test.c         |   6 +-
 .../testing/selftests/kvm/x86/fastops_test.c  |  52 +--
 .../selftests/kvm/x86/feature_msrs_test.c     |  12 +-
 .../selftests/kvm/x86/fix_hypercall_test.c    |  20 +-
 .../selftests/kvm/x86/flds_emulation.h        |   6 +-
 .../testing/selftests/kvm/x86/hwcr_msr_test.c |  10 +-
 .../testing/selftests/kvm/x86/hyperv_clock.c  |   6 +-
 .../testing/selftests/kvm/x86/hyperv_evmcs.c  |  10 +-
 .../kvm/x86/hyperv_extended_hypercalls.c      |  20 +-
 .../selftests/kvm/x86/hyperv_features.c       |  26 +-
 tools/testing/selftests/kvm/x86/hyperv_ipi.c  |  12 +-
 .../selftests/kvm/x86/hyperv_svm_test.c       |  10 +-
 .../selftests/kvm/x86/hyperv_tlb_flush.c      |  36 +-
 .../selftests/kvm/x86/kvm_buslock_test.c      |   2 +-
 .../selftests/kvm/x86/kvm_clock_test.c        |  14 +-
 tools/testing/selftests/kvm/x86/kvm_pv_test.c |  10 +-
 .../selftests/kvm/x86/monitor_mwait_test.c    |   2 +-
 .../selftests/kvm/x86/nested_close_kvm_test.c |   2 +-
 .../selftests/kvm/x86/nested_dirty_log_test.c |  10 +-
 .../selftests/kvm/x86/nested_emulation_test.c |  20 +-
 .../kvm/x86/nested_exceptions_test.c          |   6 +-
 .../kvm/x86/nested_invalid_cr3_test.c         |   2 +-
 .../selftests/kvm/x86/nested_set_state_test.c |   4 +-
 .../kvm/x86/nested_tsc_adjust_test.c          |  12 +-
 .../kvm/x86/nested_tsc_scaling_test.c         |  24 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |   2 +-
 .../selftests/kvm/x86/nx_huge_pages_test.c    |  18 +-
 .../selftests/kvm/x86/platform_info_test.c    |   6 +-
 .../selftests/kvm/x86/pmu_counters_test.c     | 109 +++---
 .../selftests/kvm/x86/pmu_event_filter_test.c | 102 ++---
 .../kvm/x86/private_mem_conversions_test.c    |  78 ++--
 .../kvm/x86/private_mem_kvm_exits_test.c      |  14 +-
 .../selftests/kvm/x86/set_boot_cpu_id.c       |   6 +-
 .../selftests/kvm/x86/set_sregs_test.c        |   6 +-
 .../selftests/kvm/x86/sev_init2_tests.c       |   6 +-
 .../selftests/kvm/x86/sev_smoke_test.c        |  22 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |   8 +-
 tools/testing/selftests/kvm/x86/smm_test.c    |   8 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  14 +-
 .../selftests/kvm/x86/svm_int_ctl_test.c      |   2 +-
 .../selftests/kvm/x86/svm_lbr_nested_state.c  |   2 +-
 .../kvm/x86/svm_nested_clear_efer_svme.c      |   2 +-
 .../kvm/x86/svm_nested_shutdown_test.c        |   2 +-
 .../kvm/x86/svm_nested_soft_inject_test.c     |  10 +-
 .../selftests/kvm/x86/svm_nested_vmcb12_gpa.c |  14 +-
 .../selftests/kvm/x86/svm_vmcall_test.c       |   2 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   2 +-
 .../kvm/x86/triple_fault_event_test.c         |   4 +-
 .../testing/selftests/kvm/x86/tsc_msrs_test.c |   2 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/ucna_injection_test.c   |  45 +--
 .../selftests/kvm/x86/userspace_io_test.c     |   4 +-
 .../kvm/x86/userspace_msr_exit_test.c         |  58 +--
 .../selftests/kvm/x86/vmx_apic_access_test.c  |   4 +-
 .../kvm/x86/vmx_apicv_updates_test.c          |   4 +-
 .../kvm/x86/vmx_invalid_nested_guest_state.c  |   2 +-
 .../testing/selftests/kvm/x86/vmx_msrs_test.c |  22 +-
 .../kvm/x86/vmx_nested_la57_state_test.c      |   4 +-
 .../selftests/kvm/x86/vmx_pmu_caps_test.c     |  12 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |   2 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  64 ++--
 .../selftests/kvm/x86/xapic_state_test.c      |  20 +-
 .../selftests/kvm/x86/xapic_tpr_test.c        |  24 +-
 .../selftests/kvm/x86/xcr0_cpuid_test.c       |   8 +-
 .../selftests/kvm/x86/xen_shinfo_test.c       |  22 +-
 .../testing/selftests/kvm/x86/xss_msr_test.c  |   2 +-
 185 files changed, 2706 insertions(+), 2817 deletions(-)


base-commit: 6b802031877a995456c528095c41d1948546bf45
-- 
2.54.0.rc1.555.g9c883467ad-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
