Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9C2C5AD49
	for <kvm-riscv@archiver.kernel.org>; Sat,  7 Jun 2025 00:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jZ0U5SZMoYHQx2ORNWatN+EBhDZTOwZD5Hb2xQyekbQ=; b=oW2I3+0ZP6qybtiY3d5ha/gkt2
	DPJjaBmYgSKphwbgT1Ngihv5EdkACEjqvNFmd6kXZJE27dw6c3vvd7Dtnw5ES3efCV7Cl65UZP5p6
	IXyu/DnHftCHuQ+ou11LNU6AumBTTwBx0OrQjnLqYw59PNjpCP7LprwG9LW59jRuaGRksWHjTaRHO
	qiDvJ3Jc7jOp7L1EKPu26l/yi05+Ej0p48Dj82kUt9cAWfyb3bff+WbdePIFPnnw43Fv4jrzIM2ej
	/hpZ1KgoutywLJOHzx1YqN2ZW7yvIrco8f1SLNKUpORzng3FIEFdnTrXzMObvD3hcsXuLOJg06Lnw
	Sm95GtjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNhKV-00000001BBC-2C9i;
	Sat, 07 Jun 2025 00:22:35 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNgvb-000000019EC-39zn
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Jun 2025 23:56:53 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-74834bc5d37so747119b3a.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Jun 2025 16:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749254210; x=1749859010; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bI+dCH5hC9M27KLLqOGE5y8W3x/cx8Zy7I+fEhr9Uww=;
        b=0NL9RK7bBCdatYugR9wH3cGctzA/q9fz5NlCVn0/JUA5s1hjEVkcQ81LhzIPl10Ixc
         esKOT05TuH/cNAhh20rYQW5rwtR1cQWPGaVLW9AoeyFgVxP2LNbfUtyIXJkYky20aIja
         awidsfVt0V2Ph3vmnUlALkdm+qwQmbSHA42uh6yJ9MZgTgAzNIoWn1/xiG5mG6NSQxHU
         ZszEz3+4ie3sWQBi8e0Gb11luNvYayJuLGk+q12WrtBQkK1UnuAcs2MdOloMtdZMwtiO
         pM+9bVre1vdeDK/LWnVmh5vtYMODy9usxUcGb7sK+EAC3YYudPilj8RV64wwa9oX8vnm
         PByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749254210; x=1749859010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI+dCH5hC9M27KLLqOGE5y8W3x/cx8Zy7I+fEhr9Uww=;
        b=X096JHJVhCYb87A4aHsPlaoIfGPpPCvV8j1S4kB2WOlCC1oRYF1qe+n+ap/oDJHXxb
         UUydcNJqUSurK3SSADHlSvztE2cxD2wSYFNYyLKNieJ81vjbcBxTU+cKfF7JyPwbUg8A
         8pHiThLOz5xE6sFgVmdav2FVihDUIUNqIyANLSNgzdar2E2ztdaOx6U5baaAbwcGlDH4
         XPVnA2rdCNvi5fbtuiEkCr1DTroKZUs5iqq46X7KVd3dbm1YvXcndv21MZX7FSnoNAGb
         yVA0AtS3UhSNALBDNfvD2/qHIM/BOEwnFmL/fNIG0DZumD29hcRGf3qJO5c4m5j1kb8T
         0Xug==
X-Forwarded-Encrypted: i=1; AJvYcCVf9ESmgJ/MoNlqetwTsVRHmFEdkU8uEw6A1yccIinRIQ2izSGT1Fe45JcpAd5o84g9zCPDe1oqfBw=@lists.infradead.org
X-Gm-Message-State: AOJu0YyD2RlRvMVLf1pk2ZHW/lamNJ+arOYIKY8RrZJD80OCx27gh8gp
	ImTjloSf2vtOsIe+4b4XFN3O0mQQfZoYdg7O3slzxKO6ZAwk3psGgFd+7O+JW9SmV9vrLhyRVBb
	L329iJobXyA==
X-Google-Smtp-Source: AGHT+IEcm3TCu/f/rvFUhWHhOnJWkDnm0m8ygPSpPL6JO03WGLuMKDviodzbpYo0sDs2lozYhoSMzQ6GTbYK
X-Received: from pfgt25.prod.google.com ([2002:a05:6a00:1399:b0:747:cffb:bb21])
 (user=vipinsh job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1910:b0:736:5b85:a911
 with SMTP id d2e1a72fcca58-74827e74748mr8110047b3a.8.1749254210518; Fri, 06
 Jun 2025 16:56:50 -0700 (PDT)
Date: Fri,  6 Jun 2025 16:56:16 -0700
In-Reply-To: <20250606235619.1841595-1-vipinsh@google.com>
Mime-Version: 1.0
References: <20250606235619.1841595-1-vipinsh@google.com>
X-Mailer: git-send-email 2.50.0.rc0.604.gd4ff7b7c86-goog
Message-ID: <20250606235619.1841595-13-vipinsh@google.com>
Subject: [PATCH v2 12/15] KVM: selftests: Add x86 auto generated test files
 for KVM Selftests Runner
From: Vipin Sharma <vipinsh@google.com>
To: kvm@vger.kernel.org, kvmarm@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org
Cc: seanjc@google.com, pbonzini@redhat.com, anup@brainfault.org, 
	borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, 
	maz@kernel.org, oliver.upton@linux.dev, dmatlack@google.com, 
	Vipin Sharma <vipinsh@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_165651_804915_1CC69A52 
X-CRM114-Status: UNSURE (   8.06  )
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

Add auto generated test files for x86 platform.

These files will not show up in git-diff again unless a test is renamed.
In future patches more .test files will be added to run selftests with
their command line arguments.

Signed-off-by: Vipin Sharma <vipinsh@google.com>
---
 .../selftests/kvm/tests/access_tracking_perf_test/default.test   | 1 +
 tools/testing/selftests/kvm/tests/coalesced_io_test/default.test | 1 +
 .../testing/selftests/kvm/tests/demand_paging_test/default.test  | 1 +
 tools/testing/selftests/kvm/tests/dirty_log_test/default.test    | 1 +
 tools/testing/selftests/kvm/tests/guest_memfd_test/default.test  | 1 +
 tools/testing/selftests/kvm/tests/guest_print_test/default.test  | 1 +
 .../selftests/kvm/tests/hardware_disable_test/default.test       | 1 +
 .../selftests/kvm/tests/kvm_binary_stats_test/default.test       | 1 +
 .../selftests/kvm/tests/kvm_create_max_vcpus/default.test        | 1 +
 .../testing/selftests/kvm/tests/kvm_page_table_test/default.test | 1 +
 .../kvm/tests/memslot_modification_stress_test/default.test      | 1 +
 tools/testing/selftests/kvm/tests/memslot_perf_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/mmu_stress_test/default.test   | 1 +
 .../selftests/kvm/tests/pre_fault_memory_test/default.test       | 1 +
 tools/testing/selftests/kvm/tests/rseq_test/default.test         | 1 +
 .../selftests/kvm/tests/set_memory_region_test/default.test      | 1 +
 tools/testing/selftests/kvm/tests/steal_time/default.test        | 1 +
 .../selftests/kvm/tests/system_counter_offset_test/default.test  | 1 +
 tools/testing/selftests/kvm/tests/x86/amx_test/default.test      | 1 +
 .../selftests/kvm/tests/x86/apic_bus_clock_test/default.test     | 1 +
 tools/testing/selftests/kvm/tests/x86/cpuid_test/default.test    | 1 +
 .../selftests/kvm/tests/x86/cr4_cpuid_sync_test/default.test     | 1 +
 tools/testing/selftests/kvm/tests/x86/debug_regs/default.test    | 1 +
 .../kvm/tests/x86/dirty_log_page_splitting_test/default.test     | 1 +
 .../kvm/tests/x86/exit_on_emulation_failure_test/default.test    | 1 +
 tools/testing/selftests/kvm/tests/x86/fastops_test/default.test  | 1 +
 .../selftests/kvm/tests/x86/feature_msrs_test/default.test       | 1 +
 .../selftests/kvm/tests/x86/fix_hypercall_test/default.test      | 1 +
 tools/testing/selftests/kvm/tests/x86/hwcr_msr_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/x86/hyperv_clock/default.test  | 1 +
 tools/testing/selftests/kvm/tests/x86/hyperv_cpuid/default.test  | 1 +
 tools/testing/selftests/kvm/tests/x86/hyperv_evmcs/default.test  | 1 +
 .../kvm/tests/x86/hyperv_extended_hypercalls/default.test        | 1 +
 .../testing/selftests/kvm/tests/x86/hyperv_features/default.test | 1 +
 tools/testing/selftests/kvm/tests/x86/hyperv_ipi/default.test    | 1 +
 .../testing/selftests/kvm/tests/x86/hyperv_svm_test/default.test | 1 +
 .../selftests/kvm/tests/x86/hyperv_tlb_flush/default.test        | 1 +
 .../selftests/kvm/tests/x86/kvm_buslock_test/default.test        | 1 +
 .../testing/selftests/kvm/tests/x86/kvm_clock_test/default.test  | 1 +
 tools/testing/selftests/kvm/tests/x86/kvm_pv_test/default.test   | 1 +
 .../selftests/kvm/tests/x86/max_vcpuid_cap_test/default.test     | 1 +
 .../selftests/kvm/tests/x86/monitor_mwait_test/default.test      | 1 +
 .../selftests/kvm/tests/x86/nested_emulation_test/default.test   | 1 +
 .../selftests/kvm/tests/x86/nested_exceptions_test/default.test  | 1 +
 .../selftests/kvm/tests/x86/nx_huge_pages_test/default.test      | 1 +
 .../selftests/kvm/tests/x86/platform_info_test/default.test      | 1 +
 .../selftests/kvm/tests/x86/pmu_counters_test/default.test       | 1 +
 .../selftests/kvm/tests/x86/pmu_event_filter_test/default.test   | 1 +
 .../kvm/tests/x86/private_mem_conversions_test/default.test      | 1 +
 .../kvm/tests/x86/private_mem_kvm_exits_test/default.test        | 1 +
 .../selftests/kvm/tests/x86/recalc_apic_map_test/default.test    | 1 +
 .../testing/selftests/kvm/tests/x86/set_boot_cpu_id/default.test | 1 +
 .../testing/selftests/kvm/tests/x86/set_sregs_test/default.test  | 1 +
 .../testing/selftests/kvm/tests/x86/sev_init2_tests/default.test | 1 +
 .../selftests/kvm/tests/x86/sev_migrate_tests/default.test       | 1 +
 .../testing/selftests/kvm/tests/x86/sev_smoke_test/default.test  | 1 +
 .../kvm/tests/x86/smaller_maxphyaddr_emulation_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/x86/smm_test/default.test      | 1 +
 tools/testing/selftests/kvm/tests/x86/state_test/default.test    | 1 +
 .../selftests/kvm/tests/x86/svm_int_ctl_test/default.test        | 1 +
 .../kvm/tests/x86/svm_nested_shutdown_test/default.test          | 1 +
 .../kvm/tests/x86/svm_nested_soft_inject_test/default.test       | 1 +
 .../testing/selftests/kvm/tests/x86/svm_vmcall_test/default.test | 1 +
 .../testing/selftests/kvm/tests/x86/sync_regs_test/default.test  | 1 +
 .../selftests/kvm/tests/x86/triple_fault_event_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/x86/tsc_msrs_test/default.test | 1 +
 .../selftests/kvm/tests/x86/tsc_scaling_sync/default.test        | 1 +
 .../selftests/kvm/tests/x86/ucna_injection_test/default.test     | 1 +
 .../selftests/kvm/tests/x86/userspace_io_test/default.test       | 1 +
 .../selftests/kvm/tests/x86/userspace_msr_exit_test/default.test | 1 +
 .../selftests/kvm/tests/x86/vmx_apic_access_test/default.test    | 1 +
 .../kvm/tests/x86/vmx_close_while_nested_test/default.test       | 1 +
 .../selftests/kvm/tests/x86/vmx_dirty_log_test/default.test      | 1 +
 .../x86/vmx_exception_with_invalid_guest_state/default.test      | 1 +
 .../kvm/tests/x86/vmx_invalid_nested_guest_state/default.test    | 1 +
 tools/testing/selftests/kvm/tests/x86/vmx_msrs_test/default.test | 1 +
 .../kvm/tests/x86/vmx_nested_tsc_scaling_test/default.test       | 1 +
 .../selftests/kvm/tests/x86/vmx_pmu_caps_test/default.test       | 1 +
 .../kvm/tests/x86/vmx_preemption_timer_test/default.test         | 1 +
 .../kvm/tests/x86/vmx_set_nested_state_test/default.test         | 1 +
 .../selftests/kvm/tests/x86/vmx_tsc_adjust_test/default.test     | 1 +
 .../testing/selftests/kvm/tests/x86/xapic_ipi_test/default.test  | 1 +
 .../selftests/kvm/tests/x86/xapic_state_test/default.test        | 1 +
 .../testing/selftests/kvm/tests/x86/xcr0_cpuid_test/default.test | 1 +
 .../testing/selftests/kvm/tests/x86/xen_shinfo_test/default.test | 1 +
 .../testing/selftests/kvm/tests/x86/xen_vmcall_test/default.test | 1 +
 tools/testing/selftests/kvm/tests/x86/xss_msr_test/default.test  | 1 +
 87 files changed, 87 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/tests/access_tracking_perf_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/coalesced_io_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/demand_paging_test/default.test
 create mode 100644 tools/testing/selftests/kvm/tests/dirty_log_test/default.test
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
 create mode 100644 tools/testing/selftests/kvm/tests/rseq_test/default.test
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

diff --git a/tools/testing/selftests/kvm/tests/access_tracking_perf_test/default.test b/tools/testing/selftests/kvm/tests/access_tracking_perf_test/default.test
new file mode 100644
index 000000000000..93e0f5d35525
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/access_tracking_perf_test/default.test
@@ -0,0 +1 @@
+access_tracking_perf_test
diff --git a/tools/testing/selftests/kvm/tests/coalesced_io_test/default.test b/tools/testing/selftests/kvm/tests/coalesced_io_test/default.test
new file mode 100644
index 000000000000..9c3e8fb05142
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/coalesced_io_test/default.test
@@ -0,0 +1 @@
+coalesced_io_test
diff --git a/tools/testing/selftests/kvm/tests/demand_paging_test/default.test b/tools/testing/selftests/kvm/tests/demand_paging_test/default.test
new file mode 100644
index 000000000000..9ce2eaf620e1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/demand_paging_test/default.test
@@ -0,0 +1 @@
+demand_paging_test
diff --git a/tools/testing/selftests/kvm/tests/dirty_log_test/default.test b/tools/testing/selftests/kvm/tests/dirty_log_test/default.test
new file mode 100644
index 000000000000..56a07cffab15
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/dirty_log_test/default.test
@@ -0,0 +1 @@
+dirty_log_test
diff --git a/tools/testing/selftests/kvm/tests/guest_memfd_test/default.test b/tools/testing/selftests/kvm/tests/guest_memfd_test/default.test
new file mode 100644
index 000000000000..1e68140a8a4b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/guest_memfd_test/default.test
@@ -0,0 +1 @@
+guest_memfd_test
diff --git a/tools/testing/selftests/kvm/tests/guest_print_test/default.test b/tools/testing/selftests/kvm/tests/guest_print_test/default.test
new file mode 100644
index 000000000000..9f83cb6e379d
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/guest_print_test/default.test
@@ -0,0 +1 @@
+guest_print_test
diff --git a/tools/testing/selftests/kvm/tests/hardware_disable_test/default.test b/tools/testing/selftests/kvm/tests/hardware_disable_test/default.test
new file mode 100644
index 000000000000..bd0aae00519b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/hardware_disable_test/default.test
@@ -0,0 +1 @@
+hardware_disable_test
diff --git a/tools/testing/selftests/kvm/tests/kvm_binary_stats_test/default.test b/tools/testing/selftests/kvm/tests/kvm_binary_stats_test/default.test
new file mode 100644
index 000000000000..fd0f99fe7b94
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/kvm_binary_stats_test/default.test
@@ -0,0 +1 @@
+kvm_binary_stats_test
diff --git a/tools/testing/selftests/kvm/tests/kvm_create_max_vcpus/default.test b/tools/testing/selftests/kvm/tests/kvm_create_max_vcpus/default.test
new file mode 100644
index 000000000000..68e5174fb84d
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/kvm_create_max_vcpus/default.test
@@ -0,0 +1 @@
+kvm_create_max_vcpus
diff --git a/tools/testing/selftests/kvm/tests/kvm_page_table_test/default.test b/tools/testing/selftests/kvm/tests/kvm_page_table_test/default.test
new file mode 100644
index 000000000000..4988836740b7
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/kvm_page_table_test/default.test
@@ -0,0 +1 @@
+kvm_page_table_test
diff --git a/tools/testing/selftests/kvm/tests/memslot_modification_stress_test/default.test b/tools/testing/selftests/kvm/tests/memslot_modification_stress_test/default.test
new file mode 100644
index 000000000000..ccb1d45ab009
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/memslot_modification_stress_test/default.test
@@ -0,0 +1 @@
+memslot_modification_stress_test
diff --git a/tools/testing/selftests/kvm/tests/memslot_perf_test/default.test b/tools/testing/selftests/kvm/tests/memslot_perf_test/default.test
new file mode 100644
index 000000000000..2de1264b631b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/memslot_perf_test/default.test
@@ -0,0 +1 @@
+memslot_perf_test
diff --git a/tools/testing/selftests/kvm/tests/mmu_stress_test/default.test b/tools/testing/selftests/kvm/tests/mmu_stress_test/default.test
new file mode 100644
index 000000000000..0e1ed1e3b971
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/mmu_stress_test/default.test
@@ -0,0 +1 @@
+mmu_stress_test
diff --git a/tools/testing/selftests/kvm/tests/pre_fault_memory_test/default.test b/tools/testing/selftests/kvm/tests/pre_fault_memory_test/default.test
new file mode 100644
index 000000000000..4e352e629be5
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/pre_fault_memory_test/default.test
@@ -0,0 +1 @@
+pre_fault_memory_test
diff --git a/tools/testing/selftests/kvm/tests/rseq_test/default.test b/tools/testing/selftests/kvm/tests/rseq_test/default.test
new file mode 100644
index 000000000000..fabc9ae64128
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/rseq_test/default.test
@@ -0,0 +1 @@
+rseq_test
diff --git a/tools/testing/selftests/kvm/tests/set_memory_region_test/default.test b/tools/testing/selftests/kvm/tests/set_memory_region_test/default.test
new file mode 100644
index 000000000000..c3f91720e105
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/set_memory_region_test/default.test
@@ -0,0 +1 @@
+set_memory_region_test
diff --git a/tools/testing/selftests/kvm/tests/steal_time/default.test b/tools/testing/selftests/kvm/tests/steal_time/default.test
new file mode 100644
index 000000000000..5f3e20693d58
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/steal_time/default.test
@@ -0,0 +1 @@
+steal_time
diff --git a/tools/testing/selftests/kvm/tests/system_counter_offset_test/default.test b/tools/testing/selftests/kvm/tests/system_counter_offset_test/default.test
new file mode 100644
index 000000000000..4d76b9f44147
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/system_counter_offset_test/default.test
@@ -0,0 +1 @@
+system_counter_offset_test
diff --git a/tools/testing/selftests/kvm/tests/x86/amx_test/default.test b/tools/testing/selftests/kvm/tests/x86/amx_test/default.test
new file mode 100644
index 000000000000..423ce501efee
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/amx_test/default.test
@@ -0,0 +1 @@
+x86/amx_test
diff --git a/tools/testing/selftests/kvm/tests/x86/apic_bus_clock_test/default.test b/tools/testing/selftests/kvm/tests/x86/apic_bus_clock_test/default.test
new file mode 100644
index 000000000000..e985ff8520f5
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/apic_bus_clock_test/default.test
@@ -0,0 +1 @@
+x86/apic_bus_clock_test
diff --git a/tools/testing/selftests/kvm/tests/x86/cpuid_test/default.test b/tools/testing/selftests/kvm/tests/x86/cpuid_test/default.test
new file mode 100644
index 000000000000..d2b2a48b25af
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/cpuid_test/default.test
@@ -0,0 +1 @@
+x86/cpuid_test
diff --git a/tools/testing/selftests/kvm/tests/x86/cr4_cpuid_sync_test/default.test b/tools/testing/selftests/kvm/tests/x86/cr4_cpuid_sync_test/default.test
new file mode 100644
index 000000000000..0d8e182cd2ca
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/cr4_cpuid_sync_test/default.test
@@ -0,0 +1 @@
+x86/cr4_cpuid_sync_test
diff --git a/tools/testing/selftests/kvm/tests/x86/debug_regs/default.test b/tools/testing/selftests/kvm/tests/x86/debug_regs/default.test
new file mode 100644
index 000000000000..440eeb9ab33d
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/debug_regs/default.test
@@ -0,0 +1 @@
+x86/debug_regs
diff --git a/tools/testing/selftests/kvm/tests/x86/dirty_log_page_splitting_test/default.test b/tools/testing/selftests/kvm/tests/x86/dirty_log_page_splitting_test/default.test
new file mode 100644
index 000000000000..71e98eb3103c
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/dirty_log_page_splitting_test/default.test
@@ -0,0 +1 @@
+x86/dirty_log_page_splitting_test
diff --git a/tools/testing/selftests/kvm/tests/x86/exit_on_emulation_failure_test/default.test b/tools/testing/selftests/kvm/tests/x86/exit_on_emulation_failure_test/default.test
new file mode 100644
index 000000000000..351242070720
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/exit_on_emulation_failure_test/default.test
@@ -0,0 +1 @@
+x86/exit_on_emulation_failure_test
diff --git a/tools/testing/selftests/kvm/tests/x86/fastops_test/default.test b/tools/testing/selftests/kvm/tests/x86/fastops_test/default.test
new file mode 100644
index 000000000000..d51c860be0d9
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/fastops_test/default.test
@@ -0,0 +1 @@
+x86/fastops_test
diff --git a/tools/testing/selftests/kvm/tests/x86/feature_msrs_test/default.test b/tools/testing/selftests/kvm/tests/x86/feature_msrs_test/default.test
new file mode 100644
index 000000000000..57d867b6b94c
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/feature_msrs_test/default.test
@@ -0,0 +1 @@
+x86/feature_msrs_test
diff --git a/tools/testing/selftests/kvm/tests/x86/fix_hypercall_test/default.test b/tools/testing/selftests/kvm/tests/x86/fix_hypercall_test/default.test
new file mode 100644
index 000000000000..f95e114d8241
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/fix_hypercall_test/default.test
@@ -0,0 +1 @@
+x86/fix_hypercall_test
diff --git a/tools/testing/selftests/kvm/tests/x86/hwcr_msr_test/default.test b/tools/testing/selftests/kvm/tests/x86/hwcr_msr_test/default.test
new file mode 100644
index 000000000000..4a957c09db6b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hwcr_msr_test/default.test
@@ -0,0 +1 @@
+x86/hwcr_msr_test
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_clock/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_clock/default.test
new file mode 100644
index 000000000000..a3ff8a689773
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_clock/default.test
@@ -0,0 +1 @@
+x86/hyperv_clock
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_cpuid/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_cpuid/default.test
new file mode 100644
index 000000000000..66b0d85430eb
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_cpuid/default.test
@@ -0,0 +1 @@
+x86/hyperv_cpuid
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_evmcs/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_evmcs/default.test
new file mode 100644
index 000000000000..aa34233db0c1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_evmcs/default.test
@@ -0,0 +1 @@
+x86/hyperv_evmcs
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_extended_hypercalls/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_extended_hypercalls/default.test
new file mode 100644
index 000000000000..4fdfc3714d54
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_extended_hypercalls/default.test
@@ -0,0 +1 @@
+x86/hyperv_extended_hypercalls
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_features/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_features/default.test
new file mode 100644
index 000000000000..dc486adbe756
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_features/default.test
@@ -0,0 +1 @@
+x86/hyperv_features
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_ipi/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_ipi/default.test
new file mode 100644
index 000000000000..b21cc166efdb
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_ipi/default.test
@@ -0,0 +1 @@
+x86/hyperv_ipi
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_svm_test/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_svm_test/default.test
new file mode 100644
index 000000000000..0e973fbf7e5a
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_svm_test/default.test
@@ -0,0 +1 @@
+x86/hyperv_svm_test
diff --git a/tools/testing/selftests/kvm/tests/x86/hyperv_tlb_flush/default.test b/tools/testing/selftests/kvm/tests/x86/hyperv_tlb_flush/default.test
new file mode 100644
index 000000000000..bcbd02d50d68
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/hyperv_tlb_flush/default.test
@@ -0,0 +1 @@
+x86/hyperv_tlb_flush
diff --git a/tools/testing/selftests/kvm/tests/x86/kvm_buslock_test/default.test b/tools/testing/selftests/kvm/tests/x86/kvm_buslock_test/default.test
new file mode 100644
index 000000000000..b9e46fc3ecb8
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/kvm_buslock_test/default.test
@@ -0,0 +1 @@
+x86/kvm_buslock_test
diff --git a/tools/testing/selftests/kvm/tests/x86/kvm_clock_test/default.test b/tools/testing/selftests/kvm/tests/x86/kvm_clock_test/default.test
new file mode 100644
index 000000000000..434a1c13d9e6
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/kvm_clock_test/default.test
@@ -0,0 +1 @@
+x86/kvm_clock_test
diff --git a/tools/testing/selftests/kvm/tests/x86/kvm_pv_test/default.test b/tools/testing/selftests/kvm/tests/x86/kvm_pv_test/default.test
new file mode 100644
index 000000000000..c785934d98a8
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/kvm_pv_test/default.test
@@ -0,0 +1 @@
+x86/kvm_pv_test
diff --git a/tools/testing/selftests/kvm/tests/x86/max_vcpuid_cap_test/default.test b/tools/testing/selftests/kvm/tests/x86/max_vcpuid_cap_test/default.test
new file mode 100644
index 000000000000..3b36b5dcbbb3
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/max_vcpuid_cap_test/default.test
@@ -0,0 +1 @@
+x86/max_vcpuid_cap_test
diff --git a/tools/testing/selftests/kvm/tests/x86/monitor_mwait_test/default.test b/tools/testing/selftests/kvm/tests/x86/monitor_mwait_test/default.test
new file mode 100644
index 000000000000..ec31250b319a
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/monitor_mwait_test/default.test
@@ -0,0 +1 @@
+x86/monitor_mwait_test
diff --git a/tools/testing/selftests/kvm/tests/x86/nested_emulation_test/default.test b/tools/testing/selftests/kvm/tests/x86/nested_emulation_test/default.test
new file mode 100644
index 000000000000..68262f28e738
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/nested_emulation_test/default.test
@@ -0,0 +1 @@
+x86/nested_emulation_test
diff --git a/tools/testing/selftests/kvm/tests/x86/nested_exceptions_test/default.test b/tools/testing/selftests/kvm/tests/x86/nested_exceptions_test/default.test
new file mode 100644
index 000000000000..1361448740dd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/nested_exceptions_test/default.test
@@ -0,0 +1 @@
+x86/nested_exceptions_test
diff --git a/tools/testing/selftests/kvm/tests/x86/nx_huge_pages_test/default.test b/tools/testing/selftests/kvm/tests/x86/nx_huge_pages_test/default.test
new file mode 100644
index 000000000000..5229d1f85e2f
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/nx_huge_pages_test/default.test
@@ -0,0 +1 @@
+x86/nx_huge_pages_test.sh
diff --git a/tools/testing/selftests/kvm/tests/x86/platform_info_test/default.test b/tools/testing/selftests/kvm/tests/x86/platform_info_test/default.test
new file mode 100644
index 000000000000..2fe74d5d32bd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/platform_info_test/default.test
@@ -0,0 +1 @@
+x86/platform_info_test
diff --git a/tools/testing/selftests/kvm/tests/x86/pmu_counters_test/default.test b/tools/testing/selftests/kvm/tests/x86/pmu_counters_test/default.test
new file mode 100644
index 000000000000..c94201dbdfb3
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/pmu_counters_test/default.test
@@ -0,0 +1 @@
+x86/pmu_counters_test
diff --git a/tools/testing/selftests/kvm/tests/x86/pmu_event_filter_test/default.test b/tools/testing/selftests/kvm/tests/x86/pmu_event_filter_test/default.test
new file mode 100644
index 000000000000..c64ec1b8fba4
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/pmu_event_filter_test/default.test
@@ -0,0 +1 @@
+x86/pmu_event_filter_test
diff --git a/tools/testing/selftests/kvm/tests/x86/private_mem_conversions_test/default.test b/tools/testing/selftests/kvm/tests/x86/private_mem_conversions_test/default.test
new file mode 100644
index 000000000000..933293725304
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/private_mem_conversions_test/default.test
@@ -0,0 +1 @@
+x86/private_mem_conversions_test
diff --git a/tools/testing/selftests/kvm/tests/x86/private_mem_kvm_exits_test/default.test b/tools/testing/selftests/kvm/tests/x86/private_mem_kvm_exits_test/default.test
new file mode 100644
index 000000000000..a2dd9876cb54
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/private_mem_kvm_exits_test/default.test
@@ -0,0 +1 @@
+x86/private_mem_kvm_exits_test
diff --git a/tools/testing/selftests/kvm/tests/x86/recalc_apic_map_test/default.test b/tools/testing/selftests/kvm/tests/x86/recalc_apic_map_test/default.test
new file mode 100644
index 000000000000..bc01f48e2c3e
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/recalc_apic_map_test/default.test
@@ -0,0 +1 @@
+x86/recalc_apic_map_test
diff --git a/tools/testing/selftests/kvm/tests/x86/set_boot_cpu_id/default.test b/tools/testing/selftests/kvm/tests/x86/set_boot_cpu_id/default.test
new file mode 100644
index 000000000000..79ff27988952
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/set_boot_cpu_id/default.test
@@ -0,0 +1 @@
+x86/set_boot_cpu_id
diff --git a/tools/testing/selftests/kvm/tests/x86/set_sregs_test/default.test b/tools/testing/selftests/kvm/tests/x86/set_sregs_test/default.test
new file mode 100644
index 000000000000..fc02c20dda19
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/set_sregs_test/default.test
@@ -0,0 +1 @@
+x86/set_sregs_test
diff --git a/tools/testing/selftests/kvm/tests/x86/sev_init2_tests/default.test b/tools/testing/selftests/kvm/tests/x86/sev_init2_tests/default.test
new file mode 100644
index 000000000000..9d839dba35c1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/sev_init2_tests/default.test
@@ -0,0 +1 @@
+x86/sev_init2_tests
diff --git a/tools/testing/selftests/kvm/tests/x86/sev_migrate_tests/default.test b/tools/testing/selftests/kvm/tests/x86/sev_migrate_tests/default.test
new file mode 100644
index 000000000000..f0579e499629
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/sev_migrate_tests/default.test
@@ -0,0 +1 @@
+x86/sev_migrate_tests
diff --git a/tools/testing/selftests/kvm/tests/x86/sev_smoke_test/default.test b/tools/testing/selftests/kvm/tests/x86/sev_smoke_test/default.test
new file mode 100644
index 000000000000..2550f6eff2d6
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/sev_smoke_test/default.test
@@ -0,0 +1 @@
+x86/sev_smoke_test
diff --git a/tools/testing/selftests/kvm/tests/x86/smaller_maxphyaddr_emulation_test/default.test b/tools/testing/selftests/kvm/tests/x86/smaller_maxphyaddr_emulation_test/default.test
new file mode 100644
index 000000000000..1382d34b4863
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/smaller_maxphyaddr_emulation_test/default.test
@@ -0,0 +1 @@
+x86/smaller_maxphyaddr_emulation_test
diff --git a/tools/testing/selftests/kvm/tests/x86/smm_test/default.test b/tools/testing/selftests/kvm/tests/x86/smm_test/default.test
new file mode 100644
index 000000000000..4437978a3e77
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/smm_test/default.test
@@ -0,0 +1 @@
+x86/smm_test
diff --git a/tools/testing/selftests/kvm/tests/x86/state_test/default.test b/tools/testing/selftests/kvm/tests/x86/state_test/default.test
new file mode 100644
index 000000000000..9f222c727d7f
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/state_test/default.test
@@ -0,0 +1 @@
+x86/state_test
diff --git a/tools/testing/selftests/kvm/tests/x86/svm_int_ctl_test/default.test b/tools/testing/selftests/kvm/tests/x86/svm_int_ctl_test/default.test
new file mode 100644
index 000000000000..51fe44a36633
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/svm_int_ctl_test/default.test
@@ -0,0 +1 @@
+x86/svm_int_ctl_test
diff --git a/tools/testing/selftests/kvm/tests/x86/svm_nested_shutdown_test/default.test b/tools/testing/selftests/kvm/tests/x86/svm_nested_shutdown_test/default.test
new file mode 100644
index 000000000000..642895b3cb5b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/svm_nested_shutdown_test/default.test
@@ -0,0 +1 @@
+x86/svm_nested_shutdown_test
diff --git a/tools/testing/selftests/kvm/tests/x86/svm_nested_soft_inject_test/default.test b/tools/testing/selftests/kvm/tests/x86/svm_nested_soft_inject_test/default.test
new file mode 100644
index 000000000000..6947cbcb1da5
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/svm_nested_soft_inject_test/default.test
@@ -0,0 +1 @@
+x86/svm_nested_soft_inject_test
diff --git a/tools/testing/selftests/kvm/tests/x86/svm_vmcall_test/default.test b/tools/testing/selftests/kvm/tests/x86/svm_vmcall_test/default.test
new file mode 100644
index 000000000000..68f22e39b1d6
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/svm_vmcall_test/default.test
@@ -0,0 +1 @@
+x86/svm_vmcall_test
diff --git a/tools/testing/selftests/kvm/tests/x86/sync_regs_test/default.test b/tools/testing/selftests/kvm/tests/x86/sync_regs_test/default.test
new file mode 100644
index 000000000000..1c88e7df625a
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/sync_regs_test/default.test
@@ -0,0 +1 @@
+x86/sync_regs_test
diff --git a/tools/testing/selftests/kvm/tests/x86/triple_fault_event_test/default.test b/tools/testing/selftests/kvm/tests/x86/triple_fault_event_test/default.test
new file mode 100644
index 000000000000..868d1d396abd
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/triple_fault_event_test/default.test
@@ -0,0 +1 @@
+x86/triple_fault_event_test
diff --git a/tools/testing/selftests/kvm/tests/x86/tsc_msrs_test/default.test b/tools/testing/selftests/kvm/tests/x86/tsc_msrs_test/default.test
new file mode 100644
index 000000000000..b9e8ce298fe8
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/tsc_msrs_test/default.test
@@ -0,0 +1 @@
+x86/tsc_msrs_test
diff --git a/tools/testing/selftests/kvm/tests/x86/tsc_scaling_sync/default.test b/tools/testing/selftests/kvm/tests/x86/tsc_scaling_sync/default.test
new file mode 100644
index 000000000000..92dbcfdab5d0
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/tsc_scaling_sync/default.test
@@ -0,0 +1 @@
+x86/tsc_scaling_sync
diff --git a/tools/testing/selftests/kvm/tests/x86/ucna_injection_test/default.test b/tools/testing/selftests/kvm/tests/x86/ucna_injection_test/default.test
new file mode 100644
index 000000000000..135561c81334
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/ucna_injection_test/default.test
@@ -0,0 +1 @@
+x86/ucna_injection_test
diff --git a/tools/testing/selftests/kvm/tests/x86/userspace_io_test/default.test b/tools/testing/selftests/kvm/tests/x86/userspace_io_test/default.test
new file mode 100644
index 000000000000..9584eb38ca61
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/userspace_io_test/default.test
@@ -0,0 +1 @@
+x86/userspace_io_test
diff --git a/tools/testing/selftests/kvm/tests/x86/userspace_msr_exit_test/default.test b/tools/testing/selftests/kvm/tests/x86/userspace_msr_exit_test/default.test
new file mode 100644
index 000000000000..a2bbdd1a2469
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/userspace_msr_exit_test/default.test
@@ -0,0 +1 @@
+x86/userspace_msr_exit_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_apic_access_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_apic_access_test/default.test
new file mode 100644
index 000000000000..561e8b72a074
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_apic_access_test/default.test
@@ -0,0 +1 @@
+x86/vmx_apic_access_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_close_while_nested_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_close_while_nested_test/default.test
new file mode 100644
index 000000000000..fca3eaff03d4
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_close_while_nested_test/default.test
@@ -0,0 +1 @@
+x86/vmx_close_while_nested_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_dirty_log_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_dirty_log_test/default.test
new file mode 100644
index 000000000000..0332d8fbfec4
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_dirty_log_test/default.test
@@ -0,0 +1 @@
+x86/vmx_dirty_log_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_exception_with_invalid_guest_state/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_exception_with_invalid_guest_state/default.test
new file mode 100644
index 000000000000..8d89b505f680
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_exception_with_invalid_guest_state/default.test
@@ -0,0 +1 @@
+x86/vmx_exception_with_invalid_guest_state
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_invalid_nested_guest_state/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_invalid_nested_guest_state/default.test
new file mode 100644
index 000000000000..df2df912448b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_invalid_nested_guest_state/default.test
@@ -0,0 +1 @@
+x86/vmx_invalid_nested_guest_state
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_msrs_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_msrs_test/default.test
new file mode 100644
index 000000000000..677b1bdda6af
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_msrs_test/default.test
@@ -0,0 +1 @@
+x86/vmx_msrs_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_nested_tsc_scaling_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_nested_tsc_scaling_test/default.test
new file mode 100644
index 000000000000..c8400ea69265
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_nested_tsc_scaling_test/default.test
@@ -0,0 +1 @@
+x86/vmx_nested_tsc_scaling_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_pmu_caps_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_pmu_caps_test/default.test
new file mode 100644
index 000000000000..a641daa14081
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_pmu_caps_test/default.test
@@ -0,0 +1 @@
+x86/vmx_pmu_caps_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_preemption_timer_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_preemption_timer_test/default.test
new file mode 100644
index 000000000000..aba7235296f4
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_preemption_timer_test/default.test
@@ -0,0 +1 @@
+x86/vmx_preemption_timer_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_set_nested_state_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_set_nested_state_test/default.test
new file mode 100644
index 000000000000..4ee968527e4a
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_set_nested_state_test/default.test
@@ -0,0 +1 @@
+x86/vmx_set_nested_state_test
diff --git a/tools/testing/selftests/kvm/tests/x86/vmx_tsc_adjust_test/default.test b/tools/testing/selftests/kvm/tests/x86/vmx_tsc_adjust_test/default.test
new file mode 100644
index 000000000000..10c93b9145e7
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/vmx_tsc_adjust_test/default.test
@@ -0,0 +1 @@
+x86/vmx_tsc_adjust_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xapic_ipi_test/default.test b/tools/testing/selftests/kvm/tests/x86/xapic_ipi_test/default.test
new file mode 100644
index 000000000000..e1b4250bc93b
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xapic_ipi_test/default.test
@@ -0,0 +1 @@
+x86/xapic_ipi_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xapic_state_test/default.test b/tools/testing/selftests/kvm/tests/x86/xapic_state_test/default.test
new file mode 100644
index 000000000000..e700e34638b1
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xapic_state_test/default.test
@@ -0,0 +1 @@
+x86/xapic_state_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xcr0_cpuid_test/default.test b/tools/testing/selftests/kvm/tests/x86/xcr0_cpuid_test/default.test
new file mode 100644
index 000000000000..fd8909f37682
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xcr0_cpuid_test/default.test
@@ -0,0 +1 @@
+x86/xcr0_cpuid_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xen_shinfo_test/default.test b/tools/testing/selftests/kvm/tests/x86/xen_shinfo_test/default.test
new file mode 100644
index 000000000000..b948bbaed045
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xen_shinfo_test/default.test
@@ -0,0 +1 @@
+x86/xen_shinfo_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xen_vmcall_test/default.test b/tools/testing/selftests/kvm/tests/x86/xen_vmcall_test/default.test
new file mode 100644
index 000000000000..63b943d0544c
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xen_vmcall_test/default.test
@@ -0,0 +1 @@
+x86/xen_vmcall_test
diff --git a/tools/testing/selftests/kvm/tests/x86/xss_msr_test/default.test b/tools/testing/selftests/kvm/tests/x86/xss_msr_test/default.test
new file mode 100644
index 000000000000..f8322c6d0117
--- /dev/null
+++ b/tools/testing/selftests/kvm/tests/x86/xss_msr_test/default.test
@@ -0,0 +1 @@
+x86/xss_msr_test
-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
