Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8F3C87FD3
	for <kvm-riscv@archiver.kernel.org>; Wed,  6 Aug 2025 20:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:Mime-Version:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kP3RKyesFLCVILuj7y8Ni25FthvNRBF7w/pohuk3Nw4=; b=1t235gettAxHef
	iwSSRKuOmR14fs2eRttwF9jdTkTF0kTjYlQOGzummeDByWWlHEIAOQZj/+shj+674KgUFiOZCd5Wl
	PZRPOkANqJnHalGrsjRWF7DBgzWZR+5KJfw+b0Esv6v2OAXH8DdqoR3id8qXR2xWw7NK9wleMglb9
	BlD1maxj6t4UktpsNuSIs63WYlGTNh5M6xcVZb73MHzHT+ZSTsjE/P986l7dHkzXCnf6R70BN8dA+
	xGkRKZ1tm64MZaucy9Y6u5wWplNyYC480h1y9mzS24Rpz244pnalxIIjjGT8TjreL6dNzp48jdudB
	S+ttzWq5mHhzpunWIISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkJj-0000000GI5r-3ugI;
	Wed, 06 Aug 2025 20:00:55 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujkGQ-0000000GG1m-0LK1
	for kvm-riscv@lists.infradead.org;
	Wed, 06 Aug 2025 19:57:31 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b38ec062983so115855a12.3
        for <kvm-riscv@lists.infradead.org>; Wed, 06 Aug 2025 12:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1754510249; x=1755115049; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YiSAi80MlZj2ytBXJIndfL/QD0SGw7awSa7/LhzXfd4=;
        b=TM/jxCvJUPJRpfAcPigNWUpx1SOSfMplZS7C/isfHCFmtSx3UkghgHg4uVIyjuaq17
         RnpSUvQsqAGs7EpFOrJttf0zvUdmYbJF0fU5Ovsr8jh4W48nIboOPat8Fc898kBTa2mO
         7fY4qCaSh9sdc1+eLfzRnFxZDiauAyceOyMWQ8P0ZDBCILus98SB4kL07ABCG5AsQEYR
         drHVqQL8eAgscLvbxkqHP1uS8p1D9HY8QNEK1VQdnacK7hQYlR6ziMLbGz4rqkbfVkz9
         LhJyX0pAiLCkDi91ZVmf5hImMGlConw1dB0f6kmB8CNs3w3ck9Lr5H2SL108XUxhOskM
         J/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754510249; x=1755115049;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YiSAi80MlZj2ytBXJIndfL/QD0SGw7awSa7/LhzXfd4=;
        b=Ryr1SG4ilmIdgV6va5gqQ7/rouC9J9FlNPVK9i5W1X2LV3vTxgVL/4hNteQ3kh8QYQ
         /v3An0fpwFqKTV86vZ4jdrsTvP9QW+tM5lxc456I7xnlZGnwSpBwDmNsqozudIUXD/lH
         Pyu5K0mXUSAWy2a+Nk4tSRb3KQ3GD82DvZyJRfDztft7AUcUIpsXypQkC2gNfyXfWw1A
         4QgOH+80UIaz4nX2Tux7KY9GRFXigsTlw26Cfdj3eRyPsIO1NJfA2XKo7KQHIiYCNT+9
         BQrZEfTurZQw0V1cXEUnDAy6wtx5NnNY3Kj8GBptBGQbJKczDGTqyczMSIMXN91ML0m0
         eYbg==
X-Forwarded-Encrypted: i=1; AJvYcCUZwfONkPpe9DYFlaIky6B3cdPsYkLI6Dp962vtMugs+z1ktI1o9ps96/v4QPlt5Y/RBcuxg82SbXk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwdoBX8kq+J3tyjc+EH6sX3NhgZMtVymowO265jrukn3OXqyc6P
	FqG6ZPDaBouIVbxAEG16YVwrk5O0vlGcVUvRKv5VUhssaFLcC1jALiCR/mGMzkuZ4Naqc2E6VEU
	leI2+Pg==
X-Google-Smtp-Source: AGHT+IEiZF4ZVXP/srLo4kntXv21eK34Ewron2VGf18IaFFGcm86hQQPlcpG9BeCZl+mVxBNNadcXtcYKE4=
X-Received: from pjoa3.prod.google.com ([2002:a17:90a:8c03:b0:312:14e5:174b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7c2:b0:31c:15d9:8aa
 with SMTP id 98e67ed59e1d1-32166cd17a9mr5063314a91.34.1754510248842; Wed, 06
 Aug 2025 12:57:28 -0700 (PDT)
Date: Wed,  6 Aug 2025 12:56:22 -0700
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.1.565.gc32cd1483b-goog
Message-ID: <20250806195706.1650976-1-seanjc@google.com>
Subject: [PATCH v5 00/44] KVM: x86: Add support for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_125730_117736_1A230482 
X-CRM114-Status: GOOD (  26.37  )
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

This series is based on the fastpath+PMU cleanups series[*] (which is based on
kvm/queue), but the non-KVM changes apply cleanly on v6.16 or Linus' tree.
I.e. if you only care about the perf changes, I would just apply on whatever
branch is convenient and stop when you hit the KVM changes.

My hope/plan is that the perf changes will go through the tip tree with a
stable tag/branch, and the KVM changes will go the kvm-x86 tree.

Non-x86 KVM folks, y'all are getting Cc'd due to minor changes in "KVM: Add a
simplified wrapper for registering perf callbacks".

The full set is also available at:

  https://github.com/sean-jc/linux.git tags/mediated-vpmu-v5

Add support for mediated vPMUs in KVM x86, where "mediated" aligns with the
standard definition of intercepting control operations (e.g. event selectors),
while allowing the guest to perform data operations (e.g. read PMCs, toggle
counters on/off) without KVM getting involed.

For an in-depth description of the what and why, please see the cover letter
from the original RFC:

  https://lore.kernel.org/all/20240126085444.324918-1-xiong.y.zhang@linux.intel.com

All KVM tests pass (or fail the same before and after), and I've manually
verified MSR/PMC are passed through as expected, but I haven't done much at all
to actually utilize the PMU in a guest.  I'll be amazed if I didn't make at
least one major goof.

Similarly, I tried to address all feedback, but there are many, many changes
relative to v4.  If I missed something, I apologize in advance.

In other words, please thoroughly review and test.

[*] https://lore.kernel.org/all/20250805190526.1453366-1-seanjc@google.com

v5:
 - Add a patch to call security_perf_event_free() from __free_event()
   instead of _free_event() (necessitated by the __cleanup() changes).
 - Add CONFIG_PERF_GUEST_MEDIATED_PMU to guard the new perf functionality.
 - Ensure the PMU is fully disabled in perf_{load,put}_guest_context() when
   when switching between guest and host context. [Kan, Namhyung]
 - Route the new system IRQ, PERF_GUEST_MEDIATED_PMI_VECTOR, through perf,
   not KVM, and play nice with FRED.
 - Rename and combine perf_{guest,host}_{enter,exit}() to a single set of
   APIs, perf_{load,put}_guest_context().
 - Rename perf_{get,put}_mediated_pmu() to perf_{create,release}_mediated_pmu()
   to (hopefully) better differentiate them from perf_{load,put}_guest_context().
 - Change the param to the load/put APIs from "u32 guest_lvtpc" to
   "unsigned long data" to decouple arch code as much as possible.  E.g. if
   a non-x86 arch were to ever support a mediated vPMU, @data could be used
   to pass a pointer to a struct.
 - Use pmu->version to detect if a vCPU has a mediated PMU.
 - Use a kvm_x86_ops hook to check for mediated PMU support.
 - Cull "passthrough" from as many places as I could find.
 - Improve the changelog/documentation related to RDPMC interception.
 - Check harware capabilities, not KVM capabilities, when calculating
   MSR and RDPMC intercepts.
 - Rework intercept (re)calculation to use a request and the existing (well,
   will be existing as of 6.17-rc1) vendor hooks for recalculating intercepts.
 - Always read PERF_GLOBAL_CTRL on VM-Exit if writes weren't intercepted while
   running the vCPU.
 - Call setup_vmcs_config() before kvm_x86_vendor_init() so that the golden
   VMCS configuration is known before kvm_init_pmu_capability() is called.
 - Keep as much refresh/init code in common x86 as possible.
 - Context switch PMCs and event selectors in common x86, not vendor code.
 - Bail from the VM-Exit fastpath if the guest is counting instructions
   retired and the mediated PMU is enabled (because guest state hasn't yet
   been synchronized with hardware).
 - Don't require an userspace to opt-in via KVM_CAP_PMU_CAPABILITY, and instead
   automatically "create" a mediated PMU on the first KVM_CREATE_VCPU call if
   the VM has an in-kernel local APIC.
 - Add entries in kernel-parameters.txt for the PMU params.
 - Add a patch to elide PMC writes when possible.
 - Many more fixups and tweaks...

v4:
 - https://lore.kernel.org/all/20250324173121.1275209-1-mizhang@google.com
 - Rebase whole patchset on 6.14-rc3 base.
 - Address Peter's comments on Perf part.
 - Address Sean's comments on KVM part.
   * Change key word "passthrough" to "mediated" in all patches
   * Change static enabling to user space dynamic enabling via KVM_CAP_PMU_CAPABILITY.
   * Only support GLOBAL_CTRL save/restore with VMCS exec_ctrl, drop the MSR
     save/retore list support for GLOBAL_CTRL, thus the support of mediated
     vPMU is constrained to SapphireRapids and later CPUs on Intel side.
   * Merge some small changes into a single patch.
 - Address Sandipan's comment on invalid pmu pointer.
 - Add back "eventsel_hw" and "fixed_ctr_ctrl_hw" to avoid to directly
   manipulate pmc->eventsel and pmu->fixed_ctr_ctrl.

v3: https://lore.kernel.org/all/20240801045907.4010984-1-mizhang@google.com
v2: https://lore.kernel.org/all/20240506053020.3911940-1-mizhang@google.com
v1: https://lore.kernel.org/all/20240126085444.324918-1-xiong.y.zhang@linux.intel.com

Dapeng Mi (15):
  KVM: x86/pmu: Start stubbing in mediated PMU support
  KVM: x86/pmu: Implement Intel mediated PMU requirements and
    constraints
  KVM: x86: Rename vmx_vmentry/vmexit_ctrl() helpers
  KVM: x86/pmu: Move PMU_CAP_{FW_WRITES,LBR_FMT} into msr-index.h header
  KVM: VMX: Add helpers to toggle/change a bit in VMCS execution
    controls
  KVM: x86/pmu: Disable RDPMC interception for compatible mediated vPMU
  KVM: x86/pmu: Load/save GLOBAL_CTRL via entry/exit fields for mediated
    PMU
  KVM: x86/pmu: Use BIT_ULL() instead of open coded equivalents
  KVM: x86/pmu: Disable interception of select PMU MSRs for mediated
    vPMUs
  KVM: x86/pmu: Bypass perf checks when emulating mediated PMU counter
    accesses
  KVM: x86/pmu: Reprogram mediated PMU event selectors on event filter
    updates
  KVM: x86/pmu: Load/put mediated PMU context when entering/exiting
    guest
  KVM: x86/pmu: Handle emulated instruction for mediated vPMU
  KVM: nVMX: Add macros to simplify nested MSR interception setting
  KVM: x86/pmu: Expose enable_mediated_pmu parameter to user space

Kan Liang (7):
  perf: Skip pmu_ctx based on event_type
  perf: Add generic exclude_guest support
  perf: Add APIs to create/release mediated guest vPMUs
  perf: Clean up perf ctx time
  perf: Add a EVENT_GUEST flag
  perf: Add APIs to load/put guest mediated PMU context
  perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU

Mingwei Zhang (3):
  perf/x86/core: Plumb mediated PMU capability from x86_pmu to
    x86_pmu_cap
  KVM: x86/pmu: Introduce eventsel_hw to prepare for pmu event filtering
  KVM: nVMX: Disable PMU MSR interception as appropriate while running
    L2

Sandipan Das (3):
  perf/x86/core: Do not set bit width for unavailable counters
  perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for AMD host
  KVM: x86/pmu: Always stuff GuestOnly=1,HostOnly=0 for mediated PMCs on
    AMD

Sean Christopherson (15):
  perf: Move security_perf_event_free() call to __free_event()
  perf: core/x86: Register a new vector for handling mediated guest PMIs
  perf/x86: Switch LVTPC to/from mediated PMI vector on guest load/put
    context
  KVM: VMX: Setup canonical VMCS config prior to kvm_x86_vendor_init()
  KVM: SVM: Check pmu->version, not enable_pmu, when getting PMC MSRs
  KVM: Add a simplified wrapper for registering perf callbacks
  KVM: x86/pmu: Snapshot host (i.e. perf's) reported PMU capabilities
  KVM: x86/pmu: Implement AMD mediated PMU requirements
  KVM: x86: Rework KVM_REQ_MSR_FILTER_CHANGED into a generic
    RECALC_INTERCEPTS
  KVM: x86: Use KVM_REQ_RECALC_INTERCEPTS to react to CPUID updates
  KVM: x86/pmu: Move initialization of valid PMCs bitmask to common x86
  KVM: x86/pmu: Restrict GLOBAL_{CTRL,STATUS}, fixed PMCs, and PEBS to
    PMU v2+
  KVM: x86/pmu: Disallow emulation in the fastpath if mediated PMCs are
    active
  KVM: nSVM: Disable PMU MSR interception as appropriate while running
    L2
  KVM: x86/pmu: Elide WRMSRs when loading guest PMCs if values already
    match

Xiong Zhang (1):
  KVM: x86/pmu: Register PMI handler for mediated vPMU

 .../admin-guide/kernel-parameters.txt         |  49 ++
 arch/arm64/kvm/arm.c                          |   2 +-
 arch/loongarch/kvm/main.c                     |   2 +-
 arch/riscv/kvm/main.c                         |   2 +-
 arch/x86/entry/entry_fred.c                   |   1 +
 arch/x86/events/amd/core.c                    |   2 +
 arch/x86/events/core.c                        |  32 +-
 arch/x86/events/intel/core.c                  |   5 +
 arch/x86/include/asm/hardirq.h                |   3 +
 arch/x86/include/asm/idtentry.h               |   6 +
 arch/x86/include/asm/irq_vectors.h            |   4 +-
 arch/x86/include/asm/kvm-x86-ops.h            |   2 +-
 arch/x86/include/asm/kvm-x86-pmu-ops.h        |   4 +
 arch/x86/include/asm/kvm_host.h               |   7 +-
 arch/x86/include/asm/msr-index.h              |  17 +-
 arch/x86/include/asm/perf_event.h             |   1 +
 arch/x86/include/asm/vmx.h                    |   1 +
 arch/x86/kernel/idt.c                         |   3 +
 arch/x86/kernel/irq.c                         |  19 +
 arch/x86/kvm/Kconfig                          |   1 +
 arch/x86/kvm/cpuid.c                          |   2 +
 arch/x86/kvm/pmu.c                            | 272 ++++++++-
 arch/x86/kvm/pmu.h                            |  37 +-
 arch/x86/kvm/svm/nested.c                     |  18 +-
 arch/x86/kvm/svm/pmu.c                        |  51 +-
 arch/x86/kvm/svm/svm.c                        |  54 +-
 arch/x86/kvm/vmx/capabilities.h               |  11 +-
 arch/x86/kvm/vmx/main.c                       |  14 +-
 arch/x86/kvm/vmx/nested.c                     |  65 ++-
 arch/x86/kvm/vmx/pmu_intel.c                  | 169 ++++--
 arch/x86/kvm/vmx/pmu_intel.h                  |  15 +
 arch/x86/kvm/vmx/vmx.c                        | 143 +++--
 arch/x86/kvm/vmx/vmx.h                        |  11 +-
 arch/x86/kvm/vmx/x86_ops.h                    |   2 +-
 arch/x86/kvm/x86.c                            |  69 ++-
 arch/x86/kvm/x86.h                            |   1 +
 include/linux/kvm_host.h                      |  11 +-
 include/linux/perf_event.h                    |  38 +-
 init/Kconfig                                  |   4 +
 kernel/events/core.c                          | 521 ++++++++++++++----
 .../beauty/arch/x86/include/asm/irq_vectors.h |   3 +-
 virt/kvm/kvm_main.c                           |   6 +-
 42 files changed, 1385 insertions(+), 295 deletions(-)


base-commit: 53d61a43a7973f812caa08fa922b607574befef4
-- 
2.50.1.565.gc32cd1483b-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
