Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E77EC021B3
	for <kvm-riscv@archiver.kernel.org>; Sat, 22 Feb 2025 00:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=y3bg2JcKFzedcY4CgZATAp65e/27yzQNSfoE+7a3Oss=; b=kWT
	IS8sF4aK/jQXxTgDL1xRZP93Ijp0bZx0+Vx60EOt0g5J/2jeVsfak3Adn0uH0T5zJ4AxZWX3I4rVd
	S2shgPjq+Qf1LtStUA/kyRe/w8Fl1tWK/6gpSYlcw7nFRxxw6Kxy0Dg3KjPj8hAITa14flfsZLB5f
	hq/PWeyRybTFAi7tbkQNZ11RyF2sxMbPrsqrSRiSBa0bWpiskFjXR3RpcPN02Y7F4Tn/VlPEGRzot
	aV3fvjeV37AwjCLjw6r3Q9bN7Yuth/VWbP4SGBfRLTXbCCQBMc2C2j8WO/mv/pOvfWsopkKITG0wJ
	hz7jr6WzYpo77QJPIoRYm3JEQhhCZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlds0-00000007FzE-3t8X;
	Sat, 22 Feb 2025 00:59:52 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tldrx-00000007Fxh-3HbC
	for kvm-riscv@lists.infradead.org;
	Sat, 22 Feb 2025 00:59:51 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2f2a9f056a8so5872674a91.2
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Feb 2025 16:59:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740185988; x=1740790788; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kBRd9F+mx4wFt4H+VE0Ydy83ogmyyqX60XghvKixac0=;
        b=BKEEy8hx4C9Jbvs5Zt4T436K06Gl9S6fCi75QddCiWChyQ4kKuzQ4nXC4EYxOR/T4y
         YKRsvj51foYLSe+SYvoX174z54urrtxW4qGKoMN5D9Iz0kwYNFJVpY8jIhwLlxT8Wrwt
         FYPzioss7YtylFzLyBZthZoOZ7gPcO9GqJ/bxC4xY4iKv7CUK+3J88s+7NJvoeSyA0x4
         VyB3BrDW7MPoxoIk0mTA86FVpIp9A3p4JXSnGM8vUT8pG6KvweJh9o/jpiAhKoUmo0YW
         9UWtXSNKEq9tAQjlew0E9QqhwSXmtI3UHFfnymtRneMKofEJoMr88KqU6Me/GfRe8ZmG
         qmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740185988; x=1740790788;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kBRd9F+mx4wFt4H+VE0Ydy83ogmyyqX60XghvKixac0=;
        b=MWb+GaLHTGDjLoGvMoThxH0BL9cbtb0I1X2XcrbJedZXuZVsyu4cTHX8SuXg+1SWzT
         OyMCBJKg1zHc5LhSjPAckDsDnSckBYKxSiWtgcNLQXszrX3E4OJzQTMMEQS5Cv3KHtna
         0NdHpyW82fHm2sM24xIRj4VOWi0VB1ihvBm7wYx+tffdrOf2lIGEMiyb0iksU+vkaKzB
         rHqM+8wXQ4cC+eAn5vfiX+829pp+FAVh1JqtlzTqhp9KKXyqvzI4Anmb5jDPkGcMWA8B
         75ZUpg0SZiz9vLTS6BDfJO3WhKAPn5v4uZhffWa4TEZgvEBf8MTfbuPcF7hE/koky3KC
         Vhog==
X-Forwarded-Encrypted: i=1; AJvYcCVV6qe7B7ASP6K3Tt7lFO8RDvGqKx0e8wGv7ZM2BBfom4swiulaLywGEgXA/GJBdsCqELibdXu12RQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YzsPTmlkvW8p2WxjLCieeFOLtQRt3vv84p4KL2FmtAxgi7uK9jw
	V7lYVK4OccBBddIS7w8nSEaOnQvEzqvF4Brt/G1Hoy9DhAfClREtcEUsWOljT81vk4olRcBOuYq
	QM7WbcQ==
X-Google-Smtp-Source: AGHT+IHFh+l8vBTEFEs3Y7eqKUizEgDHBm2dD/Rr3VO9twBVXR3MXf6pLXzxMgscxinv8InO1m/NzVZUfvdz
X-Received: from pjbdb16.prod.google.com ([2002:a17:90a:d650:b0:2fa:1b0c:4150])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4b83:b0:2f8:b2c:5ef3
 with SMTP id 98e67ed59e1d1-2fce789cedamr10422060a91.14.1740185987890; Fri, 21
 Feb 2025 16:59:47 -0800 (PST)
Date: Fri, 21 Feb 2025 16:59:28 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Message-ID: <20250222005943.3348627-1-vipinsh@google.com>
Subject: [PATCH 0/2] Add KVM selftest runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_165949_816301_8FECC31D 
X-CRM114-Status: UNSURE (   9.03  )
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

Hello,

This series in continuation of the selftest runner discussion we had
some months ago.
https://lore.kernel.org/kvm/20240821223012.3757828-1-vipinsh@google.com/

Based on the discussion, this is phase 1 implementation of KVM selftest
runner. Patch 1 is providing the testcase files and patch 2 is runner
implementation which uses testcase files.

This version has following features:
- Parallel test execution.
- Dumping separate output for each test.
- Timeout for test execution
- Specify single test or a test directory.

Vipin Sharma (2):
  KVM: selftests: Add default testfiles for KVM selftests runner
  KVM: selftests: Create KVM selftest runner

 tools/testing/selftests/kvm/.gitignore        |  4 +-
 .../testing/selftests/kvm/runner/__main__.py  | 96 +++++++++++++++++++
 tools/testing/selftests/kvm/runner/command.py | 42 ++++++++
 .../testing/selftests/kvm/runner/selftest.py  | 49 ++++++++++
 .../selftests/kvm/runner/test_runner.py       | 40 ++++++++
 .../aarch64/aarch32_id_regs/default.test      |  1 +
 .../testcases/aarch64/arch_timer/default.test |  1 +
 .../arch_timer_edge_cases/default.test        |  1 +
 .../aarch64/debug-exceptions/default.test     |  1 +
 .../aarch64/get-reg-list/default.test         |  1 +
 .../testcases/aarch64/hypercalls/default.test |  1 +
 .../testcases/aarch64/no-vgic-v3/default.test |  1 +
 .../aarch64/page_fault_test/default.test      |  1 +
 .../testcases/aarch64/psci_test/default.test  |  1 +
 .../aarch64/set_id_regs/default.test          |  1 +
 .../aarch64/smccc_filter/default.test         |  1 +
 .../aarch64/vcpu_width_config/default.test    |  1 +
 .../testcases/aarch64/vgic_init/default.test  |  1 +
 .../testcases/aarch64/vgic_irq/default.test   |  1 +
 .../aarch64/vgic_lpi_stress/default.test      |  1 +
 .../aarch64/vpmu_counter_access/default.test  |  1 +
 .../access_tracking_perf_test/default.test    |  1 +
 .../testcases/coalesced_io_test/default.test  |  1 +
 .../testcases/demand_paging_test/default.test |  1 +
 .../dirty_log_perf_test/default.test          |  1 +
 .../kvm/testcases/dirty_log_test/default.test |  1 +
 .../testcases/guest_memfd_test/default.test   |  1 +
 .../testcases/guest_print_test/default.test   |  1 +
 .../hardware_disable_test/default.test        |  1 +
 .../kvm_binary_stats_test/default.test        |  1 +
 .../kvm_create_max_vcpus/default.test         |  1 +
 .../kvm_page_table_test/default.test          |  1 +
 .../max_guest_memory_test/default.test        |  1 +
 .../default.test                              |  1 +
 .../testcases/memslot_perf_test/default.test  |  1 +
 .../pre_fault_memory_test/default.test        |  1 +
 .../testcases/riscv/arch_timer/default.test   |  1 +
 .../testcases/riscv/ebreak_test/default.test  |  1 +
 .../testcases/riscv/get-reg-list/default.test |  1 +
 .../testcases/riscv/sbi_pmu_test/default.test |  1 +
 .../kvm/testcases/rseq_test/default.test      |  1 +
 .../testcases/s390x/cmma_test/default.test    |  1 +
 .../testcases/s390x/debug_test/default.test   |  1 +
 .../kvm/testcases/s390x/memop/default.test    |  1 +
 .../kvm/testcases/s390x/resets/default.test   |  1 +
 .../s390x/shared_zeropage_test/default.test   |  1 +
 .../s390x/sync_regs_test/default.test         |  1 +
 .../kvm/testcases/s390x/tprot/default.test    |  1 +
 .../s390x/ucontrol_test/default.test          |  1 +
 .../set_memory_region_test/default.test       |  1 +
 .../kvm/testcases/steal_time/default.test     |  1 +
 .../system_counter_offset_test/default.test   |  1 +
 .../testcases/x86_64/amx_test/default.test    |  1 +
 .../x86_64/apic_bus_clock_test/default.test   |  1 +
 .../testcases/x86_64/cpuid_test/default.test  |  1 +
 .../x86_64/cr4_cpuid_sync_test/default.test   |  1 +
 .../testcases/x86_64/debug_regs/default.test  |  1 +
 .../default.test                              |  1 +
 .../default.test                              |  1 +
 .../x86_64/feature_msrs_test/default.test     |  1 +
 .../x86_64/fix_hypercall_test/default.test    |  1 +
 .../x86_64/hwcr_msr_test/default.test         |  1 +
 .../x86_64/hyperv_clock/default.test          |  1 +
 .../x86_64/hyperv_cpuid/default.test          |  1 +
 .../x86_64/hyperv_evmcs/default.test          |  1 +
 .../hyperv_extended_hypercalls/default.test   |  1 +
 .../x86_64/hyperv_features/default.test       |  1 +
 .../testcases/x86_64/hyperv_ipi/default.test  |  1 +
 .../x86_64/hyperv_svm_test/default.test       |  1 +
 .../x86_64/hyperv_tlb_flush/default.test      |  1 +
 .../x86_64/kvm_clock_test/default.test        |  1 +
 .../testcases/x86_64/kvm_pv_test/default.test |  1 +
 .../x86_64/max_vcpuid_cap_test/default.test   |  1 +
 .../x86_64/monitor_mwait_test/default.test    |  1 +
 .../nested_exceptions_test/default.test       |  1 +
 .../x86_64/nx_huge_pages_test/default.test    |  1 +
 .../x86_64/platform_info_test/default.test    |  1 +
 .../x86_64/pmu_counters_test/default.test     |  1 +
 .../x86_64/pmu_event_filter_test/default.test |  1 +
 .../private_mem_conversions_test/default.test |  1 +
 .../private_mem_kvm_exits_test/default.test   |  1 +
 .../x86_64/recalc_apic_map_test/default.test  |  1 +
 .../x86_64/set_boot_cpu_id/default.test       |  1 +
 .../x86_64/set_sregs_test/default.test        |  1 +
 .../x86_64/sev_init2_tests/default.test       |  1 +
 .../x86_64/sev_migrate_tests/default.test     |  1 +
 .../x86_64/sev_smoke_test/default.test        |  1 +
 .../default.test                              |  1 +
 .../testcases/x86_64/smm_test/default.test    |  1 +
 .../testcases/x86_64/state_test/default.test  |  1 +
 .../x86_64/svm_int_ctl_test/default.test      |  1 +
 .../svm_nested_shutdown_test/default.test     |  1 +
 .../svm_nested_soft_inject_test/default.test  |  1 +
 .../x86_64/svm_vmcall_test/default.test       |  1 +
 .../x86_64/sync_regs_test/default.test        |  1 +
 .../triple_fault_event_test/default.test      |  1 +
 .../x86_64/tsc_msrs_test/default.test         |  1 +
 .../x86_64/tsc_scaling_sync/default.test      |  1 +
 .../x86_64/ucna_injection_test/default.test   |  1 +
 .../x86_64/userspace_io_test/default.test     |  1 +
 .../userspace_msr_exit_test/default.test      |  1 +
 .../x86_64/vmx_apic_access_test/default.test  |  1 +
 .../vmx_close_while_nested_test/default.test  |  1 +
 .../x86_64/vmx_dirty_log_test/default.test    |  1 +
 .../default.test                              |  1 +
 .../default.test                              |  1 +
 .../x86_64/vmx_msrs_test/default.test         |  1 +
 .../vmx_nested_tsc_scaling_test/default.test  |  1 +
 .../x86_64/vmx_pmu_caps_test/default.test     |  1 +
 .../vmx_preemption_timer_test/default.test    |  1 +
 .../vmx_set_nested_state_test/default.test    |  1 +
 .../x86_64/vmx_tsc_adjust_test/default.test   |  1 +
 .../x86_64/xapic_ipi_test/default.test        |  1 +
 .../x86_64/xapic_state_test/default.test      |  1 +
 .../x86_64/xcr0_cpuid_test/default.test       |  1 +
 .../x86_64/xen_shinfo_test/default.test       |  1 +
 .../x86_64/xen_vmcall_test/default.test       |  1 +
 .../x86_64/xss_msr_test/default.test          |  1 +
 118 files changed, 343 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/kvm/runner/__main__.py
 create mode 100644 tools/testing/selftests/kvm/runner/command.py
 create mode 100644 tools/testing/selftests/kvm/runner/selftest.py
 create mode 100644 tools/testing/selftests/kvm/runner/test_runner.py
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


base-commit: fed48e2967f402f561d80075a20c5c9e16866e53
-- 
2.48.1.601.g30ceb7b040-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
