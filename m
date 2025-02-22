Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B3C021B2
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jJb3/ALQiBsDVT27YHySBkzL7nRxWMFasLqmQ7Tw62c=; b=QuOZajGEL9Qk/M178Bf2Z0merR
	GVGwuL9YMWZ3XVEX5XTpGdNppflaOJBBEIMqDvBWdReaOyY/SV3wSg8nqSg14FzF96UkiRT/79PGb
	AqWGw4JN5ey1Q1ZBYA7ZplyEqmsfthswNFSsPxUqoy66O2mCRi8ltwdoB8cjZE275CBc02Bm/flaX
	0MYd/05wQy4Z1pLjNH/uSm3pm6/f5/zm9DPGRQaEZ267msPfRYBPThZtGd6bvnjEtVaH5Rq5DxPi0
	qTm9k7lyqCo7so9mE/D38fQSrURQNRYnBKbfubVkA1Ej250C+2fWLFshJvNoBsFKPmQJwvuZiASZ/
	gYQL0HAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlkgj-00000007co8-3PrA;
	Sat, 22 Feb 2025 08:16:41 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldry-00000007Fy9-1qze
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 00:59:53 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2fc3e239675so8801270a91.0
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 16:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740185989; x=1740790789; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rwc5UgLSNB0rCKaTqIsv//Y8qy92qRjDNyJOu6eJkJo=;
        b=XgWkcINXNXPsBSu7+gIspCnx5KZET0nYox79K5d5xSsIv/Dn43qT775AZUrrdFR5l0
         0J570fVWpD+Sp/BTbEVyDm0jbZRm9pvvjSAek9B1fi99cUYXNOig0hMeCrbn6HJk6FTn
         xdrkcxnP3MJDpz+yWlIUstFZJFrBBtp8uZaDsXub+Uv1f9Ijj8557dlawvlDYJW6Rg58
         5Q/B0gsfTqS8aPkheIr2QDDfZUtySSRMImWL2Yeh9Bib+Nnj1VYR26HYoJeB+1ALiUzY
         3ODfPcGVd/vwpZk3ZR3eDTJ9dOqzPmR2Hh29Fj0ns2CoMI6okfZK3Pgkx/5DdX7f5etf
         /FFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740185989; x=1740790789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rwc5UgLSNB0rCKaTqIsv//Y8qy92qRjDNyJOu6eJkJo=;
        b=kVNc+Gz/vLHoj11jUpQVwY9I4EfDX0TyAshakLye73Hqgmx8ajttYPF1N6VoBnvjJH
         5UF+pW4TszIiSLZjLjAOo0od8YlEmAPLodN2EsfTvLsjm/asRLUzo4a8h5c3VMZEIxyV
         Mlv/z30pHB39pPV2SU3vQLx6G5JJ9LcsXBtbiKfxABl4FUpb2zKdDwc2o71ts1oOaJE5
         Wzz9Fs5xbxSYAZhBId1RehygXu2kCgDz1ZR3NViFWDy0KFMiComje0klJUSlg4dZqjYY
         WZqyT9kuLgQGDMMwoY2rnbUtlT50omEB0BD7x9IMsexY5B8TQUdw/pk3GVo9v25puGkq
         EHig==
X-Forwarded-Encrypted: i=1; AJvYcCVMStWow32T90B268JhdJyr5LNAjQNcjxaQ/i/3FcjEup5mRPoNyUdT6AortpXysx7oPljLE4ptDyY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxLJzsUohVNTssZCT95eoJEmA5NFJxBwgzW8IsG0xe/dBL2y6gH
	B4jLRq+mlozDu3FMvJMSOiQQPQOz4MAj9awAviN4AW/KeUSEcrOKDUiU/KOCL+9PFkRqIEJ/paB
	un7zH+g==
X-Google-Smtp-Source: AGHT+IGNw3vBtvKGAnXqQcACuCpStqcQs8o6tpm+/7wavPlua4cZR0oxD3jZeJsnU1fVIuj0SFAwv9f8LXZK
X-Received: from pjg16.prod.google.com ([2002:a17:90b:3f50:b0:2e0:915d:d594])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3c84:b0:2fc:c262:ef4b
 with SMTP id 98e67ed59e1d1-2fce86cf0e0mr9177588a91.18.1740185989582; Fri, 21
 Feb 2025 16:59:49 -0800 (PST)
Date: Fri, 21 Feb 2025 16:59:29 -0800
In-Reply-To: <20250222005943.3348627-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250222005943.3348627-1-vipinsh@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222005943.3348627-2-vipinsh@google.com>
Subject: [PATCH 1/2] KVM: selftests: Add default testfiles for KVM selftests runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_165950_502401_9406CD3D 
X-CRM114-Status: GOOD (  11.26  )
X-Mailman-Approved-At: Sat, 22 Feb 2025 00:16:40 -0800
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

Create a root "testcases" folder in KVM selftests directory. Add test
files for all of the KVM selftests across all of the supported
platforms.  Write only default test execution command in the test files.
Commands written in the test files will be ran by KVM selftest runner.

Test files are organized based following rules:
1. All test files resides in "testcases" directory.
2. Test files should have .test extension. This is needed so that
   git doesn't ignore the test file changes.
3. Each KVM selftest resides in a folder in "testcases" directory.
   It follows the path of KVM selftests directory. For example,
   kvm/x86_64/vmx_msrs_test.c will be in
   kvm/testcases/x86_64/vmx_msrs_tests directory.
4. default.test name is reserved for the default command to execute the
   test.
5. Different configuration of the tests should reside in their own test
   files under the same test directory. For example dirty_log_perf_test
   can have:
   - testcases/dirty_log_perf_test/default.test
   - testcases/dirty_log_perf_test/hugetlb1g.test
   - testcases/dirty_log_perf_test/disable_dirty_log_manual.test
6. If there is an arch specific option of a common test then it should
   be specified under an arch name directory in the test directory. This
   will avoid test runner to execute the common test or its option on
   unsupported machine. For example:
   testcases/memslot_modification_stress_test/x86_64/disable_slot_zap_quirk.test

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 tools/testing/selftests/kvm/.gitignore                         | 3 ++-
 .../kvm/testcases/aarch64/aarch32_id_regs/default.test         | 1 +
 .../selftests/kvm/testcases/aarch64/arch_timer/default.test    | 1 +
 .../kvm/testcases/aarch64/arch_timer_edge_cases/default.test   | 1 +
 .../kvm/testcases/aarch64/debug-exceptions/default.test        | 1 +
 .../selftests/kvm/testcases/aarch64/get-reg-list/default.test  | 1 +
 .../selftests/kvm/testcases/aarch64/hypercalls/default.test    | 1 +
 .../selftests/kvm/testcases/aarch64/no-vgic-v3/default.test    | 1 +
 .../kvm/testcases/aarch64/page_fault_test/default.test         | 1 +
 .../selftests/kvm/testcases/aarch64/psci_test/default.test     | 1 +
 .../selftests/kvm/testcases/aarch64/set_id_regs/default.test   | 1 +
 .../selftests/kvm/testcases/aarch64/smccc_filter/default.test  | 1 +
 .../kvm/testcases/aarch64/vcpu_width_config/default.test       | 1 +
 .../selftests/kvm/testcases/aarch64/vgic_init/default.test     | 1 +
 .../selftests/kvm/testcases/aarch64/vgic_irq/default.test      | 1 +
 .../kvm/testcases/aarch64/vgic_lpi_stress/default.test         | 1 +
 .../kvm/testcases/aarch64/vpmu_counter_access/default.test     | 1 +
 .../kvm/testcases/access_tracking_perf_test/default.test       | 1 +
 .../selftests/kvm/testcases/coalesced_io_test/default.test     | 1 +
 .../selftests/kvm/testcases/demand_paging_test/default.test    | 1 +
 .../selftests/kvm/testcases/dirty_log_perf_test/default.test   | 1 +
 .../selftests/kvm/testcases/dirty_log_test/default.test        | 1 +
 .../selftests/kvm/testcases/guest_memfd_test/default.test      | 1 +
 .../selftests/kvm/testcases/guest_print_test/default.test      | 1 +
 .../selftests/kvm/testcases/hardware_disable_test/default.test | 1 +
 .../selftests/kvm/testcases/kvm_binary_stats_test/default.test | 1 +
 .../selftests/kvm/testcases/kvm_create_max_vcpus/default.test  | 1 +
 .../selftests/kvm/testcases/kvm_page_table_test/default.test   | 1 +
 .../selftests/kvm/testcases/max_guest_memory_test/default.test | 1 +
 .../testcases/memslot_modification_stress_test/default.test    | 1 +
 .../selftests/kvm/testcases/memslot_perf_test/default.test     | 1 +
 .../selftests/kvm/testcases/pre_fault_memory_test/default.test | 1 +
 .../selftests/kvm/testcases/riscv/arch_timer/default.test      | 1 +
 .../selftests/kvm/testcases/riscv/ebreak_test/default.test     | 1 +
 .../selftests/kvm/testcases/riscv/get-reg-list/default.test    | 1 +
 .../selftests/kvm/testcases/riscv/sbi_pmu_test/default.test    | 1 +
 tools/testing/selftests/kvm/testcases/rseq_test/default.test   | 1 +
 .../selftests/kvm/testcases/s390x/cmma_test/default.test       | 1 +
 .../selftests/kvm/testcases/s390x/debug_test/default.test      | 1 +
 tools/testing/selftests/kvm/testcases/s390x/memop/default.test | 1 +
 .../testing/selftests/kvm/testcases/s390x/resets/default.test  | 1 +
 .../kvm/testcases/s390x/shared_zeropage_test/default.test      | 1 +
 .../selftests/kvm/testcases/s390x/sync_regs_test/default.test  | 1 +
 tools/testing/selftests/kvm/testcases/s390x/tprot/default.test | 1 +
 .../selftests/kvm/testcases/s390x/ucontrol_test/default.test   | 1 +
 .../kvm/testcases/set_memory_region_test/default.test          | 1 +
 tools/testing/selftests/kvm/testcases/steal_time/default.test  | 1 +
 .../kvm/testcases/system_counter_offset_test/default.test      | 1 +
 .../selftests/kvm/testcases/x86_64/amx_test/default.test       | 1 +
 .../kvm/testcases/x86_64/apic_bus_clock_test/default.test      | 1 +
 .../selftests/kvm/testcases/x86_64/cpuid_test/default.test     | 1 +
 .../kvm/testcases/x86_64/cr4_cpuid_sync_test/default.test      | 1 +
 .../selftests/kvm/testcases/x86_64/debug_regs/default.test     | 1 +
 .../x86_64/dirty_log_page_splitting_test/default.test          | 1 +
 .../x86_64/exit_on_emulation_failure_test/default.test         | 1 +
 .../kvm/testcases/x86_64/feature_msrs_test/default.test        | 1 +
 .../kvm/testcases/x86_64/fix_hypercall_test/default.test       | 1 +
 .../selftests/kvm/testcases/x86_64/hwcr_msr_test/default.test  | 1 +
 .../selftests/kvm/testcases/x86_64/hyperv_clock/default.test   | 1 +
 .../selftests/kvm/testcases/x86_64/hyperv_cpuid/default.test   | 1 +
 .../selftests/kvm/testcases/x86_64/hyperv_evmcs/default.test   | 1 +
 .../testcases/x86_64/hyperv_extended_hypercalls/default.test   | 1 +
 .../kvm/testcases/x86_64/hyperv_features/default.test          | 1 +
 .../selftests/kvm/testcases/x86_64/hyperv_ipi/default.test     | 1 +
 .../kvm/testcases/x86_64/hyperv_svm_test/default.test          | 1 +
 .../kvm/testcases/x86_64/hyperv_tlb_flush/default.test         | 1 +
 .../selftests/kvm/testcases/x86_64/kvm_clock_test/default.test | 1 +
 .../selftests/kvm/testcases/x86_64/kvm_pv_test/default.test    | 1 +
 .../kvm/testcases/x86_64/max_vcpuid_cap_test/default.test      | 1 +
 .../kvm/testcases/x86_64/monitor_mwait_test/default.test       | 1 +
 .../kvm/testcases/x86_64/nested_exceptions_test/default.test   | 1 +
 .../kvm/testcases/x86_64/nx_huge_pages_test/default.test       | 1 +
 .../kvm/testcases/x86_64/platform_info_test/default.test       | 1 +
 .../kvm/testcases/x86_64/pmu_counters_test/default.test        | 1 +
 .../kvm/testcases/x86_64/pmu_event_filter_test/default.test    | 1 +
 .../testcases/x86_64/private_mem_conversions_test/default.test | 1 +
 .../testcases/x86_64/private_mem_kvm_exits_test/default.test   | 1 +
 .../kvm/testcases/x86_64/recalc_apic_map_test/default.test     | 1 +
 .../kvm/testcases/x86_64/set_boot_cpu_id/default.test          | 1 +
 .../selftests/kvm/testcases/x86_64/set_sregs_test/default.test | 1 +
 .../kvm/testcases/x86_64/sev_init2_tests/default.test          | 1 +
 .../kvm/testcases/x86_64/sev_migrate_tests/default.test        | 1 +
 .../selftests/kvm/testcases/x86_64/sev_smoke_test/default.test | 1 +
 .../x86_64/smaller_maxphyaddr_emulation_test/default.test      | 1 +
 .../selftests/kvm/testcases/x86_64/smm_test/default.test       | 1 +
 .../selftests/kvm/testcases/x86_64/state_test/default.test     | 1 +
 .../kvm/testcases/x86_64/svm_int_ctl_test/default.test         | 1 +
 .../kvm/testcases/x86_64/svm_nested_shutdown_test/default.test | 1 +
 .../testcases/x86_64/svm_nested_soft_inject_test/default.test  | 1 +
 .../kvm/testcases/x86_64/svm_vmcall_test/default.test          | 1 +
 .../selftests/kvm/testcases/x86_64/sync_regs_test/default.test | 1 +
 .../kvm/testcases/x86_64/triple_fault_event_test/default.test  | 1 +
 .../selftests/kvm/testcases/x86_64/tsc_msrs_test/default.test  | 1 +
 .../kvm/testcases/x86_64/tsc_scaling_sync/default.test         | 1 +
 .../kvm/testcases/x86_64/ucna_injection_test/default.test      | 1 +
 .../kvm/testcases/x86_64/userspace_io_test/default.test        | 1 +
 .../kvm/testcases/x86_64/userspace_msr_exit_test/default.test  | 1 +
 .../kvm/testcases/x86_64/vmx_apic_access_test/default.test     | 1 +
 .../testcases/x86_64/vmx_close_while_nested_test/default.test  | 1 +
 .../kvm/testcases/x86_64/vmx_dirty_log_test/default.test       | 1 +
 .../x86_64/vmx_exception_with_invalid_guest_state/default.test | 1 +
 .../x86_64/vmx_invalid_nested_guest_state/default.test         | 1 +
 .../selftests/kvm/testcases/x86_64/vmx_msrs_test/default.test  | 1 +
 .../testcases/x86_64/vmx_nested_tsc_scaling_test/default.test  | 1 +
 .../kvm/testcases/x86_64/vmx_pmu_caps_test/default.test        | 1 +
 .../testcases/x86_64/vmx_preemption_timer_test/default.test    | 1 +
 .../testcases/x86_64/vmx_set_nested_state_test/default.test    | 1 +
 .../kvm/testcases/x86_64/vmx_tsc_adjust_test/default.test      | 1 +
 .../selftests/kvm/testcases/x86_64/xapic_ipi_test/default.test | 1 +
 .../kvm/testcases/x86_64/xapic_state_test/default.test         | 1 +
 .../kvm/testcases/x86_64/xcr0_cpuid_test/default.test          | 1 +
 .../kvm/testcases/x86_64/xen_shinfo_test/default.test          | 1 +
 .../kvm/testcases/x86_64/xen_vmcall_test/default.test          | 1 +
 .../selftests/kvm/testcases/x86_64/xss_msr_test/default.test   | 1 +
 114 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/arch_timer/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/arch_timer_edge_cases/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/debug-exceptions/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/get-reg-list/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/no-vgic-v3/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/page_fault_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/psci_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/set_id_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/smccc_filter/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/vcpu_width_config/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/vgic_init/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/vgic_irq/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/vgic_lpi_stress/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/aarch64/vpmu_counter_access/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/access_tracking_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/coalesced_io_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/demand_paging_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/dirty_log_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/dirty_log_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/guest_memfd_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/guest_print_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/hardware_disable_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/kvm_binary_stats_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/kvm_create_max_vcpus/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/kvm_page_table_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/max_guest_memory_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/memslot_modification_stress_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/memslot_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/pre_fault_memory_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/riscv/arch_timer/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/riscv/ebreak_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/riscv/get-reg-list/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/riscv/sbi_pmu_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/rseq_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/cmma_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/debug_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/memop/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/resets/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/shared_zeropage_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/sync_regs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/tprot/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/s390x/ucontrol_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/set_memory_region_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/steal_time/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/system_counter_offset_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/amx_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/apic_bus_clock_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/cpuid_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/cr4_cpuid_sync_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/debug_regs/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/dirty_log_page_splitting_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/exit_on_emulation_failure_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/feature_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/fix_hypercall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hwcr_msr_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_clock/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_cpuid/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_evmcs/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_extended_hypercalls/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_features/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_ipi/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_svm_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/hyperv_tlb_flush/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/kvm_clock_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/kvm_pv_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/max_vcpuid_cap_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/monitor_mwait_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/nested_exceptions_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/nx_huge_pages_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/platform_info_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/pmu_counters_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/pmu_event_filter_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/private_mem_conversions_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/private_mem_kvm_exits_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/recalc_apic_map_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/set_boot_cpu_id/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/set_sregs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/sev_init2_tests/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/sev_migrate_tests/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/sev_smoke_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/smaller_maxphyaddr_emulation_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/smm_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/svm_int_ctl_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/svm_nested_shutdown_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/svm_nested_soft_inject_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/svm_vmcall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/sync_regs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/triple_fault_event_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/tsc_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/tsc_scaling_sync/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/ucna_injection_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/userspace_io_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/userspace_msr_exit_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_apic_access_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_close_while_nested_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_dirty_log_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_exception_with_invalid_guest_state/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_invalid_nested_guest_state/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_msrs_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_nested_tsc_scaling_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_pmu_caps_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_preemption_timer_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_set_nested_state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/vmx_tsc_adjust_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xapic_ipi_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xapic_state_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xcr0_cpuid_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xen_shinfo_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xen_vmcall_test/default.test
 create mode 100644 tools/testing/selftests/kvm/testcases/x86_64/xss_msr_test/default.test

diff --git a/tools/testing/selftests/kvm/.gitignore b/tools/testing/selftests/kvm/.gitignore
index 1d41a046a7bf..550b7c2b4a0c 100644
--- a/tools/testing/selftests/kvm/.gitignore
+++ b/tools/testing/selftests/kvm/.gitignore
@@ -9,4 +9,5 @@
 !config
 !settings
 !Makefile
-!Makefile.kvm
\ No newline at end of file
+!Makefile.kvm
+!*.test
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
new file mode 100644
index 000000000000..5db8723f554f
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/aarch32_id_regs/default.test
@@ -0,0 +1 @@
+./aarch64/aarch32_id_regs
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/arch_timer/default.test b/tools/testing/selftests/kvm/testcases/aarch64/arch_timer/default.test
new file mode 100644
index 000000000000..4eabd25b1c88
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/arch_timer/default.test
@@ -0,0 +1 @@
+./aarch64/arch_timer
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/arch_timer_edge_cases/default.test b/tools/testing/selftests/kvm/testcases/aarch64/arch_timer_edge_cases/default.test
new file mode 100644
index 000000000000..c2c17884d6ff
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/arch_timer_edge_cases/default.test
@@ -0,0 +1 @@
+./aarch64/arch_timer_edge_cases
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/debug-exceptions/default.test b/tools/testing/selftests/kvm/testcases/aarch64/debug-exceptions/default.test
new file mode 100644
index 000000000000..3dd50672ea2a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/debug-exceptions/default.test
@@ -0,0 +1 @@
+./aarch64/debug-exceptions
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/get-reg-list/default.test b/tools/testing/selftests/kvm/testcases/aarch64/get-reg-list/default.test
new file mode 100644
index 000000000000..a7656ab23faa
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/get-reg-list/default.test
@@ -0,0 +1 @@
+./aarch64/get-reg-list
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/hypercalls/default.test b/tools/testing/selftests/kvm/testcases/aarch64/hypercalls/default.test
new file mode 100644
index 000000000000..c206440ad0e4
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/hypercalls/default.test
@@ -0,0 +1 @@
+./aarch64/hypercalls
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/no-vgic-v3/default.test b/tools/testing/selftests/kvm/testcases/aarch64/no-vgic-v3/default.test
new file mode 100644
index 000000000000..2dc6002ec63b
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/no-vgic-v3/default.test
@@ -0,0 +1 @@
+./aarch64/no-vgic-v3
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/page_fault_test/default.test b/tools/testing/selftests/kvm/testcases/aarch64/page_fault_test/default.test
new file mode 100644
index 000000000000..90d59bf94b53
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/page_fault_test/default.test
@@ -0,0 +1 @@
+./aarch64/page_fault_test
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/psci_test/default.test b/tools/testing/selftests/kvm/testcases/aarch64/psci_test/default.test
new file mode 100644
index 000000000000..55342f569e9e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/psci_test/default.test
@@ -0,0 +1 @@
+./aarch64/psci_test
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/set_id_regs/default.test b/tools/testing/selftests/kvm/testcases/aarch64/set_id_regs/default.test
new file mode 100644
index 000000000000..ffabfceae569
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/set_id_regs/default.test
@@ -0,0 +1 @@
+./aarch64/set_id_regs
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/smccc_filter/default.test b/tools/testing/selftests/kvm/testcases/aarch64/smccc_filter/default.test
new file mode 100644
index 000000000000..e4ae3145f15e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/smccc_filter/default.test
@@ -0,0 +1 @@
+./aarch64/smccc_filter
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/vcpu_width_config/default.test b/tools/testing/selftests/kvm/testcases/aarch64/vcpu_width_config/default.test
new file mode 100644
index 000000000000..489c20dc6cf0
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/vcpu_width_config/default.test
@@ -0,0 +1 @@
+./aarch64/vcpu_width_config
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/vgic_init/default.test b/tools/testing/selftests/kvm/testcases/aarch64/vgic_init/default.test
new file mode 100644
index 000000000000..b8e1a8a7cfb6
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/vgic_init/default.test
@@ -0,0 +1 @@
+./aarch64/vgic_init
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/vgic_irq/default.test b/tools/testing/selftests/kvm/testcases/aarch64/vgic_irq/default.test
new file mode 100644
index 000000000000..308c12aa5f13
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/vgic_irq/default.test
@@ -0,0 +1 @@
+./aarch64/vgic_irq
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/vgic_lpi_stress/default.test b/tools/testing/selftests/kvm/testcases/aarch64/vgic_lpi_stress/default.test
new file mode 100644
index 000000000000..b33c45fb8998
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/vgic_lpi_stress/default.test
@@ -0,0 +1 @@
+./aarch64/vgic_lpi_stress
diff --git a/tools/testing/selftests/kvm/testcases/aarch64/vpmu_counter_access/default.test b/tools/testing/selftests/kvm/testcases/aarch64/vpmu_counter_access/default.test
new file mode 100644
index 000000000000..cd3ef4c21274
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/aarch64/vpmu_counter_access/default.test
@@ -0,0 +1 @@
+./aarch64/vpmu_counter_access
diff --git a/tools/testing/selftests/kvm/testcases/access_tracking_perf_test/default.test b/tools/testing/selftests/kvm/testcases/access_tracking_perf_test/default.test
new file mode 100644
index 000000000000..e940543be193
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/access_tracking_perf_test/default.test
@@ -0,0 +1 @@
+./access_tracking_perf_test
diff --git a/tools/testing/selftests/kvm/testcases/coalesced_io_test/default.test b/tools/testing/selftests/kvm/testcases/coalesced_io_test/default.test
new file mode 100644
index 000000000000..08dfcbb4fcd0
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/coalesced_io_test/default.test
@@ -0,0 +1 @@
+./coalesced_io_test
diff --git a/tools/testing/selftests/kvm/testcases/demand_paging_test/default.test b/tools/testing/selftests/kvm/testcases/demand_paging_test/default.test
new file mode 100644
index 000000000000..26043696d095
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/demand_paging_test/default.test
@@ -0,0 +1 @@
+./demand_paging_test
diff --git a/tools/testing/selftests/kvm/testcases/dirty_log_perf_test/default.test b/tools/testing/selftests/kvm/testcases/dirty_log_perf_test/default.test
new file mode 100644
index 000000000000..8968bf6eb881
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/dirty_log_perf_test/default.test
@@ -0,0 +1 @@
+./dirty_log_perf_test
diff --git a/tools/testing/selftests/kvm/testcases/dirty_log_test/default.test b/tools/testing/selftests/kvm/testcases/dirty_log_test/default.test
new file mode 100644
index 000000000000..87bc10443ff9
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/dirty_log_test/default.test
@@ -0,0 +1 @@
+./dirty_log_test
diff --git a/tools/testing/selftests/kvm/testcases/guest_memfd_test/default.test b/tools/testing/selftests/kvm/testcases/guest_memfd_test/default.test
new file mode 100644
index 000000000000..4bba43fcca8d
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/guest_memfd_test/default.test
@@ -0,0 +1 @@
+./guest_memfd_test
diff --git a/tools/testing/selftests/kvm/testcases/guest_print_test/default.test b/tools/testing/selftests/kvm/testcases/guest_print_test/default.test
new file mode 100644
index 000000000000..2b7d376d6b09
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/guest_print_test/default.test
@@ -0,0 +1 @@
+./guest_print_test
diff --git a/tools/testing/selftests/kvm/testcases/hardware_disable_test/default.test b/tools/testing/selftests/kvm/testcases/hardware_disable_test/default.test
new file mode 100644
index 000000000000..e960b290d00a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/hardware_disable_test/default.test
@@ -0,0 +1 @@
+./hardware_disable_test
diff --git a/tools/testing/selftests/kvm/testcases/kvm_binary_stats_test/default.test b/tools/testing/selftests/kvm/testcases/kvm_binary_stats_test/default.test
new file mode 100644
index 000000000000..a8c0240251ce
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/kvm_binary_stats_test/default.test
@@ -0,0 +1 @@
+./kvm_binary_stats_test
diff --git a/tools/testing/selftests/kvm/testcases/kvm_create_max_vcpus/default.test b/tools/testing/selftests/kvm/testcases/kvm_create_max_vcpus/default.test
new file mode 100644
index 000000000000..a23226454cdc
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/kvm_create_max_vcpus/default.test
@@ -0,0 +1 @@
+./kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/testcases/kvm_page_table_test/default.test b/tools/testing/selftests/kvm/testcases/kvm_page_table_test/default.test
new file mode 100644
index 000000000000..0efb9a150562
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/kvm_page_table_test/default.test
@@ -0,0 +1 @@
+./kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/testcases/max_guest_memory_test/default.test b/tools/testing/selftests/kvm/testcases/max_guest_memory_test/default.test
new file mode 100644
index 000000000000..85c43b0a0f74
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/max_guest_memory_test/default.test
@@ -0,0 +1 @@
+./max_guest_memory_test
diff --git a/tools/testing/selftests/kvm/testcases/memslot_modification_stress_test/default.test b/tools/testing/selftests/kvm/testcases/memslot_modification_stress_test/default.test
new file mode 100644
index 000000000000..4a4bb75db039
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/memslot_modification_stress_test/default.test
@@ -0,0 +1 @@
+./memslot_modification_stress_test
diff --git a/tools/testing/selftests/kvm/testcases/memslot_perf_test/default.test b/tools/testing/selftests/kvm/testcases/memslot_perf_test/default.test
new file mode 100644
index 000000000000..70889328cea3
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/memslot_perf_test/default.test
@@ -0,0 +1 @@
+./memslot_perf_test
diff --git a/tools/testing/selftests/kvm/testcases/pre_fault_memory_test/default.test b/tools/testing/selftests/kvm/testcases/pre_fault_memory_test/default.test
new file mode 100644
index 000000000000..2b7c896d7c54
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/pre_fault_memory_test/default.test
@@ -0,0 +1 @@
+./pre_fault_memory_test
diff --git a/tools/testing/selftests/kvm/testcases/riscv/arch_timer/default.test b/tools/testing/selftests/kvm/testcases/riscv/arch_timer/default.test
new file mode 100644
index 000000000000..c16ee2797869
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/riscv/arch_timer/default.test
@@ -0,0 +1 @@
+./riscv/arch_timer
diff --git a/tools/testing/selftests/kvm/testcases/riscv/ebreak_test/default.test b/tools/testing/selftests/kvm/testcases/riscv/ebreak_test/default.test
new file mode 100644
index 000000000000..8415f42d391a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/riscv/ebreak_test/default.test
@@ -0,0 +1 @@
+./riscv/ebreak_test
diff --git a/tools/testing/selftests/kvm/testcases/riscv/get-reg-list/default.test b/tools/testing/selftests/kvm/testcases/riscv/get-reg-list/default.test
new file mode 100644
index 000000000000..0238b91deecd
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/riscv/get-reg-list/default.test
@@ -0,0 +1 @@
+./riscv/get-reg-list
diff --git a/tools/testing/selftests/kvm/testcases/riscv/sbi_pmu_test/default.test b/tools/testing/selftests/kvm/testcases/riscv/sbi_pmu_test/default.test
new file mode 100644
index 000000000000..efa41caabe3e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/riscv/sbi_pmu_test/default.test
@@ -0,0 +1 @@
+./riscv/sbi_pmu_test
diff --git a/tools/testing/selftests/kvm/testcases/rseq_test/default.test b/tools/testing/selftests/kvm/testcases/rseq_test/default.test
new file mode 100644
index 000000000000..6098cd71bd56
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/rseq_test/default.test
@@ -0,0 +1 @@
+./rseq_test
diff --git a/tools/testing/selftests/kvm/testcases/s390x/cmma_test/default.test b/tools/testing/selftests/kvm/testcases/s390x/cmma_test/default.test
new file mode 100644
index 000000000000..b36736b053dc
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/cmma_test/default.test
@@ -0,0 +1 @@
+./s390x/cmma_test
diff --git a/tools/testing/selftests/kvm/testcases/s390x/debug_test/default.test b/tools/testing/selftests/kvm/testcases/s390x/debug_test/default.test
new file mode 100644
index 000000000000..56eadb53ff96
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/debug_test/default.test
@@ -0,0 +1 @@
+./s390x/debug_test
diff --git a/tools/testing/selftests/kvm/testcases/s390x/memop/default.test b/tools/testing/selftests/kvm/testcases/s390x/memop/default.test
new file mode 100644
index 000000000000..b80932431521
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/memop/default.test
@@ -0,0 +1 @@
+./s390x/memop
diff --git a/tools/testing/selftests/kvm/testcases/s390x/resets/default.test b/tools/testing/selftests/kvm/testcases/s390x/resets/default.test
new file mode 100644
index 000000000000..7e116efaf6e3
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/resets/default.test
@@ -0,0 +1 @@
+./s390x/resets
diff --git a/tools/testing/selftests/kvm/testcases/s390x/shared_zeropage_test/default.test b/tools/testing/selftests/kvm/testcases/s390x/shared_zeropage_test/default.test
new file mode 100644
index 000000000000..d7ed954a5d87
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/shared_zeropage_test/default.test
@@ -0,0 +1 @@
+./s390x/shared_zeropage_test
diff --git a/tools/testing/selftests/kvm/testcases/s390x/sync_regs_test/default.test b/tools/testing/selftests/kvm/testcases/s390x/sync_regs_test/default.test
new file mode 100644
index 000000000000..fb5a97dc1a60
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/sync_regs_test/default.test
@@ -0,0 +1 @@
+./s390x/sync_regs_test
diff --git a/tools/testing/selftests/kvm/testcases/s390x/tprot/default.test b/tools/testing/selftests/kvm/testcases/s390x/tprot/default.test
new file mode 100644
index 000000000000..16476e6f7fe7
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/tprot/default.test
@@ -0,0 +1 @@
+./s390x/tprot
diff --git a/tools/testing/selftests/kvm/testcases/s390x/ucontrol_test/default.test b/tools/testing/selftests/kvm/testcases/s390x/ucontrol_test/default.test
new file mode 100644
index 000000000000..1a9a32db0d99
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/s390x/ucontrol_test/default.test
@@ -0,0 +1 @@
+./s390x/ucontrol_test
diff --git a/tools/testing/selftests/kvm/testcases/set_memory_region_test/default.test b/tools/testing/selftests/kvm/testcases/set_memory_region_test/default.test
new file mode 100644
index 000000000000..356c31e88471
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/set_memory_region_test/default.test
@@ -0,0 +1 @@
+./set_memory_region_test
diff --git a/tools/testing/selftests/kvm/testcases/steal_time/default.test b/tools/testing/selftests/kvm/testcases/steal_time/default.test
new file mode 100644
index 000000000000..10a490246d2d
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/steal_time/default.test
@@ -0,0 +1 @@
+./steal_time
diff --git a/tools/testing/selftests/kvm/testcases/system_counter_offset_test/default.test b/tools/testing/selftests/kvm/testcases/system_counter_offset_test/default.test
new file mode 100644
index 000000000000..a35557a85f79
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/system_counter_offset_test/default.test
@@ -0,0 +1 @@
+./system_counter_offset_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/amx_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/amx_test/default.test
new file mode 100644
index 000000000000..9328a4997849
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/amx_test/default.test
@@ -0,0 +1 @@
+./x86_64/amx_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/apic_bus_clock_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/apic_bus_clock_test/default.test
new file mode 100644
index 000000000000..71dc5be7a4de
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/apic_bus_clock_test/default.test
@@ -0,0 +1 @@
+./x86_64/apic_bus_clock_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/cpuid_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/cpuid_test/default.test
new file mode 100644
index 000000000000..f9f518c76732
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/cpuid_test/default.test
@@ -0,0 +1 @@
+./x86_64/cpuid_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/cr4_cpuid_sync_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/cr4_cpuid_sync_test/default.test
new file mode 100644
index 000000000000..a7ebd6d37523
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/cr4_cpuid_sync_test/default.test
@@ -0,0 +1 @@
+./x86_64/cr4_cpuid_sync_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/debug_regs/default.test b/tools/testing/selftests/kvm/testcases/x86_64/debug_regs/default.test
new file mode 100644
index 000000000000..972e16d8ae80
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/debug_regs/default.test
@@ -0,0 +1 @@
+./x86_64/debug_regs
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/dirty_log_page_splitting_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/dirty_log_page_splitting_test/default.test
new file mode 100644
index 000000000000..5e5eedb125fb
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/dirty_log_page_splitting_test/default.test
@@ -0,0 +1 @@
+./x86_64/dirty_log_page_splitting_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/exit_on_emulation_failure_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/exit_on_emulation_failure_test/default.test
new file mode 100644
index 000000000000..5e8d932a985a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/exit_on_emulation_failure_test/default.test
@@ -0,0 +1 @@
+./x86_64/exit_on_emulation_failure_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/feature_msrs_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/feature_msrs_test/default.test
new file mode 100644
index 000000000000..a7f2bbf4bf56
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/feature_msrs_test/default.test
@@ -0,0 +1 @@
+./x86_64/feature_msrs_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/fix_hypercall_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/fix_hypercall_test/default.test
new file mode 100644
index 000000000000..e14c80fa8f45
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/fix_hypercall_test/default.test
@@ -0,0 +1 @@
+./x86_64/fix_hypercall_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hwcr_msr_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hwcr_msr_test/default.test
new file mode 100644
index 000000000000..62edde1e311d
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hwcr_msr_test/default.test
@@ -0,0 +1 @@
+./x86_64/hwcr_msr_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_clock/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_clock/default.test
new file mode 100644
index 000000000000..f636d01c1c04
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_clock/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_clock
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_cpuid/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_cpuid/default.test
new file mode 100644
index 000000000000..eafad0b1579e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_cpuid/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_cpuid
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_evmcs/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_evmcs/default.test
new file mode 100644
index 000000000000..851add3c6e81
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_evmcs/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_evmcs
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_extended_hypercalls/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_extended_hypercalls/default.test
new file mode 100644
index 000000000000..f66c5faa362b
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_extended_hypercalls/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_extended_hypercalls
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_features/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_features/default.test
new file mode 100644
index 000000000000..fbf677334f30
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_features/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_features
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_ipi/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_ipi/default.test
new file mode 100644
index 000000000000..5e080d57c89a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_ipi/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_ipi
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_svm_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_svm_test/default.test
new file mode 100644
index 000000000000..4d10b12513cb
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_svm_test/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_svm_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/hyperv_tlb_flush/default.test b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_tlb_flush/default.test
new file mode 100644
index 000000000000..0eb679f846e7
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/hyperv_tlb_flush/default.test
@@ -0,0 +1 @@
+./x86_64/hyperv_tlb_flush
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/kvm_clock_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/kvm_clock_test/default.test
new file mode 100644
index 000000000000..7d448d089a65
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/kvm_clock_test/default.test
@@ -0,0 +1 @@
+./x86_64/kvm_clock_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/kvm_pv_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/kvm_pv_test/default.test
new file mode 100644
index 000000000000..fb71a5fd8544
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/kvm_pv_test/default.test
@@ -0,0 +1 @@
+./x86_64/kvm_pv_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/max_vcpuid_cap_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/max_vcpuid_cap_test/default.test
new file mode 100644
index 000000000000..cc83f9b0224a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/max_vcpuid_cap_test/default.test
@@ -0,0 +1 @@
+./x86_64/max_vcpuid_cap_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/monitor_mwait_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/monitor_mwait_test/default.test
new file mode 100644
index 000000000000..b863c909f6c6
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/monitor_mwait_test/default.test
@@ -0,0 +1 @@
+./x86_64/monitor_mwait_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/nested_exceptions_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/nested_exceptions_test/default.test
new file mode 100644
index 000000000000..bc326f0a4607
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/nested_exceptions_test/default.test
@@ -0,0 +1 @@
+./x86_64/nested_exceptions_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/nx_huge_pages_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/nx_huge_pages_test/default.test
new file mode 100644
index 000000000000..7195b59fe8a5
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/nx_huge_pages_test/default.test
@@ -0,0 +1 @@
+./x86_64/nx_huge_pages_test.sh
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/platform_info_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/platform_info_test/default.test
new file mode 100644
index 000000000000..d8e9803516ae
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/platform_info_test/default.test
@@ -0,0 +1 @@
+./x86_64/platform_info_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/pmu_counters_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/pmu_counters_test/default.test
new file mode 100644
index 000000000000..08f30fffe000
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/pmu_counters_test/default.test
@@ -0,0 +1 @@
+./x86_64/pmu_counters_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/pmu_event_filter_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/pmu_event_filter_test/default.test
new file mode 100644
index 000000000000..58f0afe0af50
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/pmu_event_filter_test/default.test
@@ -0,0 +1 @@
+./x86_64/pmu_event_filter_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/private_mem_conversions_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/private_mem_conversions_test/default.test
new file mode 100644
index 000000000000..8bb591b63967
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/private_mem_conversions_test/default.test
@@ -0,0 +1 @@
+./x86_64/private_mem_conversions_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/private_mem_kvm_exits_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/private_mem_kvm_exits_test/default.test
new file mode 100644
index 000000000000..9c624949de95
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/private_mem_kvm_exits_test/default.test
@@ -0,0 +1 @@
+./x86_64/private_mem_kvm_exits_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/recalc_apic_map_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/recalc_apic_map_test/default.test
new file mode 100644
index 000000000000..441e3bea8b71
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/recalc_apic_map_test/default.test
@@ -0,0 +1 @@
+./x86_64/recalc_apic_map_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/set_boot_cpu_id/default.test b/tools/testing/selftests/kvm/testcases/x86_64/set_boot_cpu_id/default.test
new file mode 100644
index 000000000000..80d5156f0623
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/set_boot_cpu_id/default.test
@@ -0,0 +1 @@
+./x86_64/set_boot_cpu_id
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/set_sregs_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/set_sregs_test/default.test
new file mode 100644
index 000000000000..83531913d381
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/set_sregs_test/default.test
@@ -0,0 +1 @@
+./x86_64/set_sregs_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/sev_init2_tests/default.test b/tools/testing/selftests/kvm/testcases/x86_64/sev_init2_tests/default.test
new file mode 100644
index 000000000000..9c356b1d7717
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/sev_init2_tests/default.test
@@ -0,0 +1 @@
+./x86_64/sev_init2_tests
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/sev_migrate_tests/default.test b/tools/testing/selftests/kvm/testcases/x86_64/sev_migrate_tests/default.test
new file mode 100644
index 000000000000..f0e2742cf6b4
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/sev_migrate_tests/default.test
@@ -0,0 +1 @@
+./x86_64/sev_migrate_tests
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/sev_smoke_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/sev_smoke_test/default.test
new file mode 100644
index 000000000000..56733d3d47d5
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/sev_smoke_test/default.test
@@ -0,0 +1 @@
+./x86_64/sev_smoke_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/smaller_maxphyaddr_emulation_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/smaller_maxphyaddr_emulation_test/default.test
new file mode 100644
index 000000000000..52f6dcebe18e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/smaller_maxphyaddr_emulation_test/default.test
@@ -0,0 +1 @@
+./x86_64/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/smm_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/smm_test/default.test
new file mode 100644
index 000000000000..bd50d1fe0e39
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/smm_test/default.test
@@ -0,0 +1 @@
+./x86_64/smm_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/state_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/state_test/default.test
new file mode 100644
index 000000000000..e2f261ecb141
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/state_test/default.test
@@ -0,0 +1 @@
+./x86_64/state_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/svm_int_ctl_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/svm_int_ctl_test/default.test
new file mode 100644
index 000000000000..51c2b1a4d7ea
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/svm_int_ctl_test/default.test
@@ -0,0 +1 @@
+./x86_64/svm_int_ctl_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_shutdown_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_shutdown_test/default.test
new file mode 100644
index 000000000000..aa1320afb235
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_shutdown_test/default.test
@@ -0,0 +1 @@
+./x86_64/svm_nested_shutdown_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_soft_inject_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_soft_inject_test/default.test
new file mode 100644
index 000000000000..75ffe38b0246
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/svm_nested_soft_inject_test/default.test
@@ -0,0 +1 @@
+./x86_64/svm_nested_soft_inject_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/svm_vmcall_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/svm_vmcall_test/default.test
new file mode 100644
index 000000000000..415f8112e873
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/svm_vmcall_test/default.test
@@ -0,0 +1 @@
+./x86_64/svm_vmcall_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/sync_regs_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/sync_regs_test/default.test
new file mode 100644
index 000000000000..26f1e3c00208
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/sync_regs_test/default.test
@@ -0,0 +1 @@
+./x86_64/sync_regs_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/triple_fault_event_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/triple_fault_event_test/default.test
new file mode 100644
index 000000000000..86709ec1af57
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/triple_fault_event_test/default.test
@@ -0,0 +1 @@
+./x86_64/triple_fault_event_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/tsc_msrs_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/tsc_msrs_test/default.test
new file mode 100644
index 000000000000..e7eca5c5425b
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/tsc_msrs_test/default.test
@@ -0,0 +1 @@
+./x86_64/tsc_msrs_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/tsc_scaling_sync/default.test b/tools/testing/selftests/kvm/testcases/x86_64/tsc_scaling_sync/default.test
new file mode 100644
index 000000000000..75cec395980e
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/tsc_scaling_sync/default.test
@@ -0,0 +1 @@
+./x86_64/tsc_scaling_sync
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/ucna_injection_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/ucna_injection_test/default.test
new file mode 100644
index 000000000000..991ab4b35376
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/ucna_injection_test/default.test
@@ -0,0 +1 @@
+./x86_64/ucna_injection_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/userspace_io_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/userspace_io_test/default.test
new file mode 100644
index 000000000000..3401aa68ec4f
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/userspace_io_test/default.test
@@ -0,0 +1 @@
+./x86_64/userspace_io_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/userspace_msr_exit_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/userspace_msr_exit_test/default.test
new file mode 100644
index 000000000000..25d34dbb542d
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/userspace_msr_exit_test/default.test
@@ -0,0 +1 @@
+./x86_64/userspace_msr_exit_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_apic_access_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_apic_access_test/default.test
new file mode 100644
index 000000000000..970ce4a87b69
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_apic_access_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_apic_access_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_close_while_nested_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_close_while_nested_test/default.test
new file mode 100644
index 000000000000..97b5c9bc2385
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_close_while_nested_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_close_while_nested_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_dirty_log_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_dirty_log_test/default.test
new file mode 100644
index 000000000000..dbbc6771830d
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_dirty_log_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_dirty_log_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_exception_with_invalid_guest_state/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_exception_with_invalid_guest_state/default.test
new file mode 100644
index 000000000000..d9cb4e720d2b
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_exception_with_invalid_guest_state/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_exception_with_invalid_guest_state
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_invalid_nested_guest_state/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_invalid_nested_guest_state/default.test
new file mode 100644
index 000000000000..396253417646
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_invalid_nested_guest_state/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_invalid_nested_guest_state
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_msrs_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_msrs_test/default.test
new file mode 100644
index 000000000000..5eb96a67bc3a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_msrs_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_msrs_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_nested_tsc_scaling_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_nested_tsc_scaling_test/default.test
new file mode 100644
index 000000000000..9ffd06d52cce
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_nested_tsc_scaling_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_nested_tsc_scaling_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_pmu_caps_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_pmu_caps_test/default.test
new file mode 100644
index 000000000000..e7bbc34d0d98
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_pmu_caps_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_pmu_caps_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_preemption_timer_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_preemption_timer_test/default.test
new file mode 100644
index 000000000000..08432fd3071a
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_preemption_timer_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_preemption_timer_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_set_nested_state_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_set_nested_state_test/default.test
new file mode 100644
index 000000000000..58b2bc65f767
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_set_nested_state_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_set_nested_state_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/vmx_tsc_adjust_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/vmx_tsc_adjust_test/default.test
new file mode 100644
index 000000000000..3ec7560cab11
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/vmx_tsc_adjust_test/default.test
@@ -0,0 +1 @@
+./x86_64/vmx_tsc_adjust_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xapic_ipi_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xapic_ipi_test/default.test
new file mode 100644
index 000000000000..2cbd6b12f6e3
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xapic_ipi_test/default.test
@@ -0,0 +1 @@
+./x86_64/xapic_ipi_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xapic_state_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xapic_state_test/default.test
new file mode 100644
index 000000000000..649e0268d6fd
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xapic_state_test/default.test
@@ -0,0 +1 @@
+./x86_64/xapic_state_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xcr0_cpuid_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xcr0_cpuid_test/default.test
new file mode 100644
index 000000000000..d5ea6a4e2b20
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xcr0_cpuid_test/default.test
@@ -0,0 +1 @@
+./x86_64/xcr0_cpuid_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xen_shinfo_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xen_shinfo_test/default.test
new file mode 100644
index 000000000000..79423b5a11e1
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xen_shinfo_test/default.test
@@ -0,0 +1 @@
+./x86_64/xen_shinfo_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xen_vmcall_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xen_vmcall_test/default.test
new file mode 100644
index 000000000000..32ba7eb9d7e9
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xen_vmcall_test/default.test
@@ -0,0 +1 @@
+./x86_64/xen_vmcall_test
diff --git a/tools/testing/selftests/kvm/testcases/x86_64/xss_msr_test/default.test b/tools/testing/selftests/kvm/testcases/x86_64/xss_msr_test/default.test
new file mode 100644
index 000000000000..c61ac639825b
--- /dev/null
+++ b/tools/testing/selftests/kvm/testcases/x86_64/xss_msr_test/default.test
@@ -0,0 +1 @@
+./x86_64/xss_msr_test
-- 
2.48.1.601.g30ceb7b040-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
