Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE7C5AD49
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Jun 2025 23:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pC/XMS3K5/oairEevckNOvBlr+V8n0LNnecG6OPUYGc=; b=ePW
	q72VLWHtuWM3kbMig+MV3pke/bNrlv4fTt+V4SkIT7Cft48MvSwtjNzSmtf9vhZJXQXPw6Abc4yiA
	b7ZoUGlbwe2TS+n7ElepaEFtnIqX57G/cuyuys4Q9f74AdjOaf5FRYXXWtl9Mqt4sUcVHUArbbq2M
	akaOwGxdzCgLt33EWOSOB7k3EwzPliWrTPf8YoSC5SDjR4LHTSDUFIECM8oxhf5UVblAlva14SMNQ
	ryOfgW6iCupBJMuPFieqMZJ0Ieo5GS9IZeO5mU9i0G3IJsDxFrxwnN2z97KJhspxqiU6RY3paqYNT
	6y7lcOMSVLJdX5DElMnkhGf3qR24BPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgxS-000000019bB-1fo7;
	Fri, 06 Jun 2025 23:58:46 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvI-0000000193r-3Q6S
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:34 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b26e0fee459so1927499a12.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254191; x=1749858991; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XN0VAsCT1CWdgagP9CPqT2NYJ16ltbDcNqmn3oGzFBA=;
        b=B3CRH8ITKxKR2eya5dSLUyEkYrCKt95wgfm60WRt2+a/vZz9668TlgSnTjjWZIFc+L
         hZetu9l8Kj8O721mMhxxiPRv+1zeavsMWYPOGPv7vaGr2RsdsNSgiNySfSSNwujmVVDn
         f4RKdyYKGJk/tkeCgqzkp//hPwh8uLtDtpIXDbbLoMcevYXw7PfZZI/zalyUJGoWqOEg
         KQOhGzwTcGSvw4vYQIqZGJLxd/PPD0zZ9xc2bBl+OsfsNmkaHyZfuEdLTDHmblmUkpnc
         BV4xnL/ekg/SaSaEMnQmL2OqQZq/9rjykhZ+Oo3IUc5OWlj6kWnFALLue22n5BBh9qIS
         HiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254191; x=1749858991;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XN0VAsCT1CWdgagP9CPqT2NYJ16ltbDcNqmn3oGzFBA=;
        b=IGVuaBCvVFjOorJ0knVzcgyX0p+j9X/KftZu5A8hEvmZklBQpIsfcjfz5cWSO7a6RA
         lDHynbaiDiO5r4Lz5WRJyDczbmYvp31jyt35EganmFUYwj2+78g0fCI5dHQbHAXip+95
         0YvbJwzkCXX4GG2d+EPa5Rf2pHKvLFcxRw6MpN8vg6VpFIkBGppy7mkfovdP10RBFxAo
         nrqchYWrnWXc4JwI3pPwbEq9wexROHamj1eDsekRr8QPmqnU/4rgzR+uqQ2vzGPzsLcj
         OAjvNEova7Lyz5trrcgm0bFisutHqWtsEMEYvwiLZhEOXipwNx6lJret5LrUcLZXqwOd
         q6Ag==
X-Forwarded-Encrypted: i=1; AJvYcCWhDKyAQb6Y4UB63K0HbYqSPTH44ZBDiJmKkGvpMWJwDs6ukCsL2nbbQQWUOY3xcpTnMtVovDfcQ4A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgb4dxUPT/rR9oNW9fxcZkoruhjKmBUAwcrqC8YotOWd62dGYx
	Lsks1bn8GHDiQVD+PpmupoAQ8js+F10RSyFBvg012vgBsPKnARt3jGEoszRrU143n5EpmXPZpJd
	Pxem70OCzEw==
X-Google-Smtp-Source: AGHT+IHeEVfH9wv5FWIJzUeYXcQ/zi0u5Uf0vhP1yOhYLsqyKUu35wm23VvWwVGse0eCH5m6iscBFYWFXqXu
X-Received: from pfgs41.prod.google.com ([2002:a05:6a00:17a9:b0:747:9faf:ed39])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6494:b0:215:d41d:9183
 with SMTP id adf61e73a8af0-21ee2559addmr6535389637.1.1749254191550; Fri, 06
 Jun 2025 16:56:31 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:04 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-1-vipinsh@google.com>
Subject: [PATCH v2 00/15] Add KVM Selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165632_857699_698D1FC1 
X-CRM114-Status: GOOD (  17.97  )
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

Hello,

Create KVM Selftest Runner which allows running KVM selftests with added
features not present in default selftest runner provided by selftests
framework.

This Runner has two broad goals:
1. Make it easier for contributors and maintainers to run various
   configuration of tests with features like preserving output,
   controlling output verbosity, parallelism, different combinations of
   command line arguments.
2. Provide common place to write interesting and useful combinations of
   tests command line arguments to improve KVM test coverage. Default
   selftests runner provide little to no control over this.

Patch 1 adds a very basic sefltest runner.
Patches 2-10 add various features to runner.
Patch 11 provides a way to auto generate test files.
Patch 12-15 commits the generated files for each architecture supported
by KVM selftests.

This version doesn't have all of the features envisioned in RFC and v1.
Future patches will add features like:

- Print process id of the test in execution.
- Skip other platform tests. Currently, runner expects test binary will
  not be available and it marks that test as it didn't run in the
  output. This can be handled by either hardcoding paths in runner or
  extending *.test schema. I will work on it in the next version.
- CTRL+C currently spits out lots of warning (depending on --job value).
  This will be fixed in the next version.
- Add more tests configurations.
- Provide a way to set the environment in which runner will start tests. For
  example, setting huge pages, stress testing based on resources
  available on host.


v2:
- Automatic default test generation.
- Command line flag to provide executables location
- Dump output to filesystem with timestamp
- Accept absolute path of *.test files/directory location
- Sticky status at bottom for the current state of runner.
- Knobs to control output verbosity
- Colored output for terminals.

v1: https://lore.kernel.org/kvm/20250222005943.3348627-1-vipinsh@google.com/
- Parallel test execution.
- Dumping separate output for each test.
- Timeout for test execution
- Specify single test or a test directory.

RFC: https://lore.kernel.org/kvm/20240821223012.3757828-1-vipinsh@google.com/

Vipin Sharma (15):
  KVM: selftest: Create KVM selftest runner
  KVM: selftests: Enable selftests runner to find executables in
    different path
  KVM: selftests: Add timeout option in selftests runner
  KVM: selftests: Add option to save selftest runner output to a
    directory
  KVM: selftests: Run tests concurrently in KVM selftests runner
  KVM: selftests: Add a flag to print only test status in KVM Selftests
    run
  KVM: selftests: Add various print flags to KVM Selftest Runner
  KVM: selftests: Print sticky KVM Selftests Runner status at bottom
  KVM: selftests: Add a flag to print only sticky summary in the
    selftests runner
  KVM: selftests: Add flag to suppress all output from Selftest KVM
    Runner
  KVM: selftests: Auto generate default tests for KVM Selftests Runner
  KVM: selftests: Add x86 auto generated test files for KVM Selftests
    Runner
  KVM: selftests: Add arm64 auto generated test files for KVM Selftests
    Runner
  KVM: selftests: Add s390 auto generated test files for KVM Selftests
    Runner
  KVM: selftests: Add riscv auto generated test files for KVM Selftests
    Runner

 tools/testing/selftests/kvm/.gitignore        |   4 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   8 +
 .../testing/selftests/kvm/runner/__main__.py  | 271 ++++++++++++++++++
 tools/testing/selftests/kvm/runner/command.py |  53 ++++
 .../testing/selftests/kvm/runner/selftest.py  |  66 +++++
 .../selftests/kvm/runner/test_runner.py       |  88 ++++++
 .../access_tracking_perf_test/default.test    |   1 +
 .../kvm/tests/arch_timer/default.test         |   1 +
 .../tests/arm64/aarch32_id_regs/default.test  |   1 +
 .../arm64/arch_timer_edge_cases/default.test  |   1 +
 .../tests/arm64/debug-exceptions/default.test |   1 +
 .../kvm/tests/arm64/hypercalls/default.test   |   1 +
 .../kvm/tests/arm64/mmio_abort/default.test   |   1 +
 .../kvm/tests/arm64/no-vgic-v3/default.test   |   1 +
 .../tests/arm64/page_fault_test/default.test  |   1 +
 .../kvm/tests/arm64/psci_test/default.test    |   1 +
 .../kvm/tests/arm64/set_id_regs/default.test  |   1 +
 .../kvm/tests/arm64/smccc_filter/default.test |   1 +
 .../arm64/vcpu_width_config/default.test      |   1 +
 .../kvm/tests/arm64/vgic_init/default.test    |   1 +
 .../kvm/tests/arm64/vgic_irq/default.test     |   1 +
 .../tests/arm64/vgic_lpi_stress/default.test  |   1 +
 .../arm64/vpmu_counter_access/default.test    |   1 +
 .../kvm/tests/coalesced_io_test/default.test  |   1 +
 .../kvm/tests/demand_paging_test/default.test |   1 +
 .../2slot_5vcpu_10iter.test                   |   1 +
 .../tests/dirty_log_perf_test/default.test    |   1 +
 .../no_dirty_log_protect.test                 |   1 +
 .../kvm/tests/dirty_log_test/default.test     |   1 +
 .../kvm/tests/get-reg-list/default.test       |   1 +
 .../kvm/tests/guest_memfd_test/default.test   |   1 +
 .../kvm/tests/guest_print_test/default.test   |   1 +
 .../tests/hardware_disable_test/default.test  |   1 +
 .../tests/kvm_binary_stats_test/default.test  |   1 +
 .../tests/kvm_create_max_vcpus/default.test   |   1 +
 .../tests/kvm_page_table_test/default.test    |   1 +
 .../default.test                              |   1 +
 .../kvm/tests/memslot_perf_test/default.test  |   1 +
 .../kvm/tests/mmu_stress_test/default.test    |   1 +
 .../tests/pre_fault_memory_test/default.test  |   1 +
 .../kvm/tests/riscv/ebreak_test/default.test  |   1 +
 .../kvm/tests/riscv/sbi_pmu_test/default.test |   1 +
 .../kvm/tests/rseq_test/default.test          |   1 +
 .../kvm/tests/s390/cmma_test/default.test     |   1 +
 .../s390/cpumodel_subfuncs_test/default.test  |   1 +
 .../kvm/tests/s390/debug_test/default.test    |   1 +
 .../kvm/tests/s390/memop/default.test         |   1 +
 .../kvm/tests/s390/resets/default.test        |   1 +
 .../s390/shared_zeropage_test/default.test    |   1 +
 .../tests/s390/sync_regs_test/default.test    |   1 +
 .../kvm/tests/s390/tprot/default.test         |   1 +
 .../kvm/tests/s390/ucontrol_test/default.test |   1 +
 .../tests/set_memory_region_test/default.test |   1 +
 .../kvm/tests/steal_time/default.test         |   1 +
 .../system_counter_offset_test/default.test   |   1 +
 .../kvm/tests/x86/amx_test/default.test       |   1 +
 .../x86/apic_bus_clock_test/default.test      |   1 +
 .../kvm/tests/x86/cpuid_test/default.test     |   1 +
 .../x86/cr4_cpuid_sync_test/default.test      |   1 +
 .../kvm/tests/x86/debug_regs/default.test     |   1 +
 .../default.test                              |   1 +
 .../default.test                              |   1 +
 .../kvm/tests/x86/fastops_test/default.test   |   1 +
 .../tests/x86/feature_msrs_test/default.test  |   1 +
 .../tests/x86/fix_hypercall_test/default.test |   1 +
 .../kvm/tests/x86/hwcr_msr_test/default.test  |   1 +
 .../kvm/tests/x86/hyperv_clock/default.test   |   1 +
 .../kvm/tests/x86/hyperv_cpuid/default.test   |   1 +
 .../kvm/tests/x86/hyperv_evmcs/default.test   |   1 +
 .../hyperv_extended_hypercalls/default.test   |   1 +
 .../tests/x86/hyperv_features/default.test    |   1 +
 .../kvm/tests/x86/hyperv_ipi/default.test     |   1 +
 .../tests/x86/hyperv_svm_test/default.test    |   1 +
 .../tests/x86/hyperv_tlb_flush/default.test   |   1 +
 .../tests/x86/kvm_buslock_test/default.test   |   1 +
 .../kvm/tests/x86/kvm_clock_test/default.test |   1 +
 .../kvm/tests/x86/kvm_pv_test/default.test    |   1 +
 .../x86/max_vcpuid_cap_test/default.test      |   1 +
 .../tests/x86/monitor_mwait_test/default.test |   1 +
 .../x86/nested_emulation_test/default.test    |   1 +
 .../x86/nested_exceptions_test/default.test   |   1 +
 .../tests/x86/nx_huge_pages_test/default.test |   1 +
 .../tests/x86/platform_info_test/default.test |   1 +
 .../tests/x86/pmu_counters_test/default.test  |   1 +
 .../x86/pmu_event_filter_test/default.test    |   1 +
 .../private_mem_conversions_test/default.test |   1 +
 .../private_mem_kvm_exits_test/default.test   |   1 +
 .../x86/recalc_apic_map_test/default.test     |   1 +
 .../tests/x86/set_boot_cpu_id/default.test    |   1 +
 .../kvm/tests/x86/set_sregs_test/default.test |   1 +
 .../tests/x86/sev_init2_tests/default.test    |   1 +
 .../tests/x86/sev_migrate_tests/default.test  |   1 +
 .../kvm/tests/x86/sev_smoke_test/default.test |   1 +
 .../default.test                              |   1 +
 .../kvm/tests/x86/smm_test/default.test       |   1 +
 .../kvm/tests/x86/state_test/default.test     |   1 +
 .../tests/x86/svm_int_ctl_test/default.test   |   1 +
 .../x86/svm_nested_shutdown_test/default.test |   1 +
 .../svm_nested_soft_inject_test/default.test  |   1 +
 .../tests/x86/svm_vmcall_test/default.test    |   1 +
 .../kvm/tests/x86/sync_regs_test/default.test |   1 +
 .../x86/triple_fault_event_test/default.test  |   1 +
 .../kvm/tests/x86/tsc_msrs_test/default.test  |   1 +
 .../tests/x86/tsc_scaling_sync/default.test   |   1 +
 .../x86/ucna_injection_test/default.test      |   1 +
 .../tests/x86/userspace_io_test/default.test  |   1 +
 .../x86/userspace_msr_exit_test/default.test  |   1 +
 .../x86/vmx_apic_access_test/default.test     |   1 +
 .../vmx_close_while_nested_test/default.test  |   1 +
 .../tests/x86/vmx_dirty_log_test/default.test |   1 +
 .../default.test                              |   1 +
 .../default.test                              |   1 +
 .../kvm/tests/x86/vmx_msrs_test/default.test  |   1 +
 .../vmx_nested_tsc_scaling_test/default.test  |   1 +
 .../tests/x86/vmx_pmu_caps_test/default.test  |   1 +
 .../vmx_preemption_timer_test/default.test    |   1 +
 .../vmx_set_nested_state_test/default.test    |   1 +
 .../x86/vmx_tsc_adjust_test/default.test      |   1 +
 .../kvm/tests/x86/xapic_ipi_test/default.test |   1 +
 .../tests/x86/xapic_state_test/default.test   |   1 +
 .../tests/x86/xcr0_cpuid_test/default.test    |   1 +
 .../tests/x86/xen_shinfo_test/default.test    |   1 +
 .../tests/x86/xen_vmcall_test/default.test    |   1 +
 .../kvm/tests/x86/xss_msr_test/default.test   |   1 +
 124 files changed, 607 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/command.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
 create mode 100644 tools/testing/selftests/kvm/tests/access_tracking_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arch_timer/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/aarch32_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/arch_timer_edge_cases/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/debug-exceptions/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/mmio_abort/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/no-vgic-v3/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/page_fault_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/psci_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/set_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/smccc_filter/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vcpu_width_config/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_init/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_irq/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vgic_lpi_stress/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/arm64/vpmu_counter_access/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/coalesced_io_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/demand_paging_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/2slot_5vcpu_10iter.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_perf_test/no_dirty_log_protect.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/get-reg-list/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/guest_memfd_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/guest_print_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/hardware_disable_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/kvm_binary_stats_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/kvm_create_max_vcpus/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/kvm_page_table_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/memslot_modification_stress_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/memslot_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/mmu_stress_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/pre_fault_memory_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/ebreak_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/riscv/sbi_pmu_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/rseq_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/cmma_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/cpumodel_subfuncs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/debug_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/memop/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/resets/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/shared_zeropage_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/sync_regs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/tprot/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/s390/ucontrol_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/set_memory_region_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/steal_time/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/system_counter_offset_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/amx_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/apic_bus_clock_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/cpuid_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/cr4_cpuid_sync_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/debug_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/dirty_log_page_splitting_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/exit_on_emulation_failure_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/fastops_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/feature_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/fix_hypercall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hwcr_msr_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_clock/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_cpuid/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_evmcs/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_extended_hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_features/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_ipi/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_svm_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/hyperv_tlb_flush/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/kvm_buslock_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/kvm_clock_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/kvm_pv_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/max_vcpuid_cap_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/monitor_mwait_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/nested_emulation_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/nested_exceptions_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/nx_huge_pages_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/platform_info_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/pmu_counters_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/pmu_event_filter_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/private_mem_conversions_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/private_mem_kvm_exits_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/recalc_apic_map_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/set_boot_cpu_id/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/set_sregs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/sev_init2_tests/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/sev_migrate_tests/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/sev_smoke_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/smaller_maxphyaddr_emulation_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/smm_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/svm_int_ctl_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/svm_nested_shutdown_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/svm_nested_soft_inject_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/svm_vmcall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/sync_regs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/triple_fault_event_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/tsc_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/tsc_scaling_sync/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/ucna_injection_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/userspace_io_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/userspace_msr_exit_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_apic_access_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_close_while_nested_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_dirty_log_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_exception_with_invalid_guest_state/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_invalid_nested_guest_state/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_nested_tsc_scaling_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_pmu_caps_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_preemption_timer_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_set_nested_state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/vmx_tsc_adjust_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xapic_ipi_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xapic_state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xcr0_cpuid_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xen_shinfo_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xen_vmcall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/x86/xss_msr_test/default.test


base-commit: 3f7b307757ecffc1c18ede9ee3cf9ce8101f3cc9
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
