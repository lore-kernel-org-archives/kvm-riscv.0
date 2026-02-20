Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2A9C531EA
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 00:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=DWxXLyuTnNjUa+wq5opC0DnmrUxOhDxoPzGXNhwty3s=; b=cfy
	9I+d2IAjoM1uY35RYm9ajSPr1VOs7FJwDDJQdwAIZmx7+o/VOVaXdN0mXyfsdQY3uvvJCRNWe2V2w
	hDpodSmwpjbOMBdDUDFQA/NIbTxZ0SbOxTFLfekMf+ipcaqRpQL6gp4b6tB89aK//eWqMuuQEdH/A
	ddJ27TKuM3fratPoJKTQoVWxQko3Euk18W9AjrDT1NzVceHwV31W5XmGS7ll/VGtpw9duGw6sIeXc
	0L+1K8LwKE/n+3QSpPpBDwdFn4rpbbsmH4EuzosWkKfRwdOHDjlzoSGFn1dWhRxoFCgY4QS4qGVzl
	LcFgwgCsTKpnypMxErmm7gdYgwDuaEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbP-0000000ClpU-0hW6;
	Fri, 20 Feb 2026 00:42:39 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtEbL-0000000ClmQ-3Eha
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 00:42:37 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2ab0b2e804cso17962735ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 19 Feb 2026 16:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771548154; x=1772152954; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dg8JwpDSolSLBMhrmXm5uOOceqMFfere5VVKNjBSeNo=;
        b=cMXpH5Wd2yR7uu2UJ+d/RZXeV9EFkB5/ODkrsKWBkS8oJA/g7gjkXtg+GxT5Lly7i1
         ritSo/8VMFBA/j8W/6VPnz3n9btw50XjUpxV0xTqqYSDoqP3W7nbVpa9V9oJWP3kD816
         OU84qS3W6XE4mBaO6GMsVmlPsfJCCk9RRAcjs2adR8ki2s9rgbczaDQ1TonEc2JhHPct
         ve20bA2uy/bo/63GFGURm57yNVuAubJFhG1XKMVuQTHpHsVosMnlI8328sJQIlkwZZHn
         vTSbtax+xbq2pKuPOglYpSfu3UUZcESGnWgH7tsp6NdxX6Q5G+/Pc0KDu+WG0xnxspqg
         lCSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548154; x=1772152954;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dg8JwpDSolSLBMhrmXm5uOOceqMFfere5VVKNjBSeNo=;
        b=BUECvznLToM0CdpTUEdQVTzSYCE5BppOonUqNN/TIdVWWhZCRdqLKvfrKrArIdZarx
         NHqbUpsXKWBQhSR5YuwTHhBqiN1YZFmn5dD6z2h2UjmH7iP6RLNiufjnoypYWUWgd2N8
         Mk4lno96lBtCDc2ExzkMKimtAu3N03XK1CPcUuz9gNH78iDLW+R1CL8LlPL4nl6CJBcj
         nsYpUCAha2KwnI3E4pN03wSPI2D6OmZCEsmTe2O51Je2B0DzyImHqhEH9CML3wexFfWv
         XjoitKg6QXTFHAL5qRY2jjlhcRsuNElOBFTQh0gQY1dI0QqC/ju+TDu9q7RLJIET/yxJ
         tK2w==
X-Forwarded-Encrypted: i=1; AJvYcCUp5OHbf8ipV6mtSAVtYT56+98eQXL8cCbOmlW64KxsbP3A9QNTSp/DR3hOymxKfR88wgvFHTPWgMo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGMKhuGaaUFLFojEiXgwk+seimaOHHbYLF11LYmVfsEfXO+KBc
	+TelfdLcGtiJPku2SmHHVJfnhR1tU+HsuwpnwLGLsz74OKmaX7vml7EEfIjXHHElfsFxkDhuJa5
	Jx6gRDcvQoaljqw==
X-Received: from pjbsz4.prod.google.com ([2002:a17:90b:2d44:b0:354:aa76:8270])
 (user=dmatlack job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:190d:b0:29e:c2de:4ad with SMTP id d9443c01a7336-2ad5b03d9eamr38042765ad.24.1771548154020;
 Thu, 19 Feb 2026 16:42:34 -0800 (PST)
Date: Fri, 20 Feb 2026 00:42:13 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260220004223.4168331-1-dmatlack@google.com>
Subject: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
From: David Matlack <dmatlack@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Ackerley Tng <ackerleytng@google.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>, 
	Bibo Mao <maobibo@loongson.cn>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Colin Ian King <colin.i.king@gmail.com>, 
	David Hildenbrand <david@kernel.org>, David Matlack <dmatlack@google.com>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, 
	Sean Christopherson <seanjc@google.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_164235_848351_9A9C6CB9 
X-CRM114-Status: GOOD (  11.16  )
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

This series renames types across all KVM selftests to more align with
types used in the kernel:

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

The goal of this series is to make the KVM selftests code more concise
(the new type names are shorter) and more similar to the kernel, since
selftests are developed by kernel developers.

v2:
 - Reapply the series on top of kvm/queue

v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@google.com/

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

 .../selftests/kvm/access_tracking_perf_test.c |  42 +--
 tools/testing/selftests/kvm/arch_timer.c      |   6 +-
 .../selftests/kvm/arm64/aarch32_id_regs.c     |  14 +-
 .../testing/selftests/kvm/arm64/arch_timer.c  |   8 +-
 .../kvm/arm64/arch_timer_edge_cases.c         | 161 +++++----
 .../selftests/kvm/arm64/debug-exceptions.c    |  72 ++--
 .../testing/selftests/kvm/arm64/hypercalls.c  |  24 +-
 .../testing/selftests/kvm/arm64/idreg-idst.c  |   4 +-
 .../testing/selftests/kvm/arm64/no-vgic-v3.c  |   6 +-
 .../selftests/kvm/arm64/page_fault_test.c     |  82 ++---
 tools/testing/selftests/kvm/arm64/psci_test.c |  26 +-
 .../testing/selftests/kvm/arm64/sea_to_user.c |  32 +-
 .../testing/selftests/kvm/arm64/set_id_regs.c |  66 ++--
 .../selftests/kvm/arm64/smccc_filter.c        |  10 +-
 tools/testing/selftests/kvm/arm64/vgic_init.c |  56 +--
 tools/testing/selftests/kvm/arm64/vgic_irq.c  | 137 ++++----
 .../selftests/kvm/arm64/vgic_lpi_stress.c     |  20 +-
 .../selftests/kvm/arm64/vpmu_counter_access.c |  56 +--
 .../testing/selftests/kvm/coalesced_io_test.c |  38 +-
 .../selftests/kvm/demand_paging_test.c        |  10 +-
 .../selftests/kvm/dirty_log_perf_test.c       |  14 +-
 tools/testing/selftests/kvm/dirty_log_test.c  |  82 ++---
 tools/testing/selftests/kvm/get-reg-list.c    |   2 +-
 .../testing/selftests/kvm/guest_memfd_test.c  |  16 +-
 .../testing/selftests/kvm/guest_print_test.c  |  22 +-
 .../selftests/kvm/hardware_disable_test.c     |   6 +-
 .../selftests/kvm/include/arm64/arch_timer.h  |  30 +-
 .../selftests/kvm/include/arm64/delay.h       |   4 +-
 .../testing/selftests/kvm/include/arm64/gic.h |   8 +-
 .../selftests/kvm/include/arm64/gic_v3_its.h  |   8 +-
 .../selftests/kvm/include/arm64/processor.h   |  22 +-
 .../selftests/kvm/include/arm64/ucall.h       |   4 +-
 .../selftests/kvm/include/arm64/vgic.h        |  22 +-
 .../testing/selftests/kvm/include/kvm_util.h  | 328 +++++++++---------
 .../selftests/kvm/include/kvm_util_types.h    |   4 +-
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
 .../testing/selftests/kvm/include/test_util.h |  40 ++-
 .../selftests/kvm/include/timer_test.h        |  18 +-
 .../selftests/kvm/include/ucall_common.h      |  22 +-
 .../selftests/kvm/include/userfaultfd_util.h  |   6 +-
 .../testing/selftests/kvm/include/x86/apic.h  |  22 +-
 .../testing/selftests/kvm/include/x86/evmcs.h |  22 +-
 .../selftests/kvm/include/x86/hyperv.h        |  28 +-
 .../selftests/kvm/include/x86/kvm_util_arch.h |  36 +-
 tools/testing/selftests/kvm/include/x86/pmu.h |   9 +-
 .../selftests/kvm/include/x86/processor.h     | 282 ++++++++-------
 tools/testing/selftests/kvm/include/x86/sev.h |  20 +-
 .../selftests/kvm/include/x86/svm_util.h      |  12 +-
 .../testing/selftests/kvm/include/x86/ucall.h |   2 +-
 tools/testing/selftests/kvm/include/x86/vmx.h |  70 ++--
 .../selftests/kvm/kvm_page_table_test.c       |  54 +--
 tools/testing/selftests/kvm/lib/arm64/gic.c   |   6 +-
 .../selftests/kvm/lib/arm64/gic_private.h     |  26 +-
 .../testing/selftests/kvm/lib/arm64/gic_v3.c  |  90 ++---
 .../selftests/kvm/lib/arm64/gic_v3_its.c      |  12 +-
 .../selftests/kvm/lib/arm64/processor.c       | 126 +++----
 tools/testing/selftests/kvm/lib/arm64/ucall.c |  12 +-
 tools/testing/selftests/kvm/lib/arm64/vgic.c  |  40 +--
 tools/testing/selftests/kvm/lib/elf.c         |   8 +-
 tools/testing/selftests/kvm/lib/guest_modes.c |   2 +-
 .../testing/selftests/kvm/lib/guest_sprintf.c |  18 +-
 tools/testing/selftests/kvm/lib/kvm_util.c    | 220 ++++++------
 .../selftests/kvm/lib/loongarch/processor.c   |  79 +++--
 .../selftests/kvm/lib/loongarch/ucall.c       |  12 +-
 tools/testing/selftests/kvm/lib/memstress.c   |  38 +-
 .../selftests/kvm/lib/riscv/processor.c       |  58 ++--
 .../kvm/lib/s390/diag318_test_handler.c       |  12 +-
 .../testing/selftests/kvm/lib/s390/facility.c |   2 +-
 .../selftests/kvm/lib/s390/processor.c        |  42 +--
 tools/testing/selftests/kvm/lib/sparsebit.c   |  18 +-
 tools/testing/selftests/kvm/lib/test_util.c   |  30 +-
 .../testing/selftests/kvm/lib/ucall_common.c  |  30 +-
 .../selftests/kvm/lib/userfaultfd_util.c      |  14 +-
 tools/testing/selftests/kvm/lib/x86/apic.c    |   2 +-
 tools/testing/selftests/kvm/lib/x86/hyperv.c  |  14 +-
 .../testing/selftests/kvm/lib/x86/memstress.c |  14 +-
 tools/testing/selftests/kvm/lib/x86/pmu.c     |   8 +-
 .../testing/selftests/kvm/lib/x86/processor.c | 199 ++++++-----
 tools/testing/selftests/kvm/lib/x86/sev.c     |  20 +-
 tools/testing/selftests/kvm/lib/x86/svm.c     |  16 +-
 tools/testing/selftests/kvm/lib/x86/ucall.c   |   4 +-
 tools/testing/selftests/kvm/lib/x86/vmx.c     |  44 +--
 .../selftests/kvm/loongarch/arch_timer.c      |  28 +-
 .../kvm/memslot_modification_stress_test.c    |  10 +-
 .../testing/selftests/kvm/memslot_perf_test.c | 164 ++++-----
 tools/testing/selftests/kvm/mmu_stress_test.c |  28 +-
 .../selftests/kvm/pre_fault_memory_test.c     |  10 +-
 .../testing/selftests/kvm/riscv/arch_timer.c  |   8 +-
 .../testing/selftests/kvm/riscv/ebreak_test.c |   6 +-
 .../selftests/kvm/riscv/get-reg-list.c        |   4 +-
 .../selftests/kvm/riscv/sbi_pmu_test.c        |   8 +-
 tools/testing/selftests/kvm/s390/debug_test.c |   8 +-
 tools/testing/selftests/kvm/s390/memop.c      |  94 ++---
 tools/testing/selftests/kvm/s390/resets.c     |   6 +-
 .../selftests/kvm/s390/shared_zeropage_test.c |   2 +-
 tools/testing/selftests/kvm/s390/tprot.c      |  24 +-
 .../selftests/kvm/s390/ucontrol_test.c        |   2 +-
 .../selftests/kvm/set_memory_region_test.c    |  40 +--
 tools/testing/selftests/kvm/steal_time.c      |  66 ++--
 .../kvm/system_counter_offset_test.c          |  12 +-
 tools/testing/selftests/kvm/x86/amx_test.c    |  14 +-
 .../selftests/kvm/x86/aperfmperf_test.c       |  16 +-
 .../selftests/kvm/x86/apic_bus_clock_test.c   |  24 +-
 tools/testing/selftests/kvm/x86/cpuid_test.c  |   6 +-
 tools/testing/selftests/kvm/x86/debug_regs.c  |   4 +-
 .../kvm/x86/dirty_log_page_splitting_test.c   |  16 +-
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
 .../kvm/x86/nested_tsc_scaling_test.c         |  26 +-
 .../kvm/x86/nested_vmsave_vmload_test.c       |   2 +-
 .../selftests/kvm/x86/nx_huge_pages_test.c    |  18 +-
 .../selftests/kvm/x86/platform_info_test.c    |   6 +-
 .../selftests/kvm/x86/pmu_counters_test.c     | 110 +++---
 .../selftests/kvm/x86/pmu_event_filter_test.c | 102 +++---
 .../kvm/x86/private_mem_conversions_test.c    |  78 ++---
 .../kvm/x86/private_mem_kvm_exits_test.c      |  14 +-
 .../selftests/kvm/x86/set_boot_cpu_id.c       |   6 +-
 .../selftests/kvm/x86/set_sregs_test.c        |   6 +-
 .../selftests/kvm/x86/sev_init2_tests.c       |   6 +-
 .../selftests/kvm/x86/sev_smoke_test.c        |  16 +-
 .../x86/smaller_maxphyaddr_emulation_test.c   |   8 +-
 tools/testing/selftests/kvm/x86/smm_test.c    |   8 +-
 tools/testing/selftests/kvm/x86/state_test.c  |  14 +-
 .../selftests/kvm/x86/svm_int_ctl_test.c      |   2 +-
 .../kvm/x86/svm_nested_shutdown_test.c        |   2 +-
 .../kvm/x86/svm_nested_soft_inject_test.c     |  10 +-
 .../selftests/kvm/x86/svm_vmcall_test.c       |   2 +-
 .../selftests/kvm/x86/sync_regs_test.c        |   2 +-
 .../kvm/x86/triple_fault_event_test.c         |   4 +-
 .../testing/selftests/kvm/x86/tsc_msrs_test.c |   2 +-
 .../selftests/kvm/x86/tsc_scaling_sync.c      |   4 +-
 .../selftests/kvm/x86/ucna_injection_test.c   |  45 +--
 .../selftests/kvm/x86/userspace_io_test.c     |   4 +-
 .../kvm/x86/userspace_msr_exit_test.c         |  58 ++--
 .../selftests/kvm/x86/vmx_apic_access_test.c  |   4 +-
 .../kvm/x86/vmx_apicv_updates_test.c          |   4 +-
 .../kvm/x86/vmx_invalid_nested_guest_state.c  |   2 +-
 .../testing/selftests/kvm/x86/vmx_msrs_test.c |  22 +-
 .../kvm/x86/vmx_nested_la57_state_test.c      |   4 +-
 .../selftests/kvm/x86/vmx_pmu_caps_test.c     |  12 +-
 .../kvm/x86/vmx_preemption_timer_test.c       |   2 +-
 .../selftests/kvm/x86/xapic_ipi_test.c        |  58 ++--
 .../selftests/kvm/x86/xapic_state_test.c      |  20 +-
 .../selftests/kvm/x86/xapic_tpr_test.c        |  24 +-
 .../selftests/kvm/x86/xcr0_cpuid_test.c       |   8 +-
 .../selftests/kvm/x86/xen_shinfo_test.c       |  22 +-
 .../testing/selftests/kvm/x86/xss_msr_test.c  |   2 +-
 177 files changed, 2514 insertions(+), 2519 deletions(-)


base-commit: b1195183ed42f1522fae3fe44ebee3af437aa000
-- 
2.53.0.414.gf7e9f6c205-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
