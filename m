Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA89AC3600B
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YIw0xlE1gmTmA9/T5h2FlaSXEJroK3nje413xDqqwrA=; b=tTp2P1l73Sv7+o
	M2Qp69VxwbQLVRRzxhynKoXsCuoYeO6VcSOJMfv69G3gNWJriSZ3LgqHOlgq1Ou9xxpJFNLyc6TCP
	J70x8d81KDdfK1Uk5kxD/8e9RhPdseoATdepctatJP5/ol4MUDwtnWO7G+3a2LC7EoWAxRF5m2NPw
	vEvQrUsEIGZaa3mq/aQQUSScIvBvXEcl7rA93VFD6WodDkE+9FSZoUy323CsxaOYA79JaMZS4meHj
	sdsUrEpMfCWe025pV5SaN8xYr2WqhShqh70J6Rmv0lF4TYtaJC3QIF0wd8d7bNdTxDKQJiQKgKRYQ
	OJ0z2mUmrhUBQ+4nX4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt3G-0000000BqC8-11VK;
	Thu, 27 Mar 2025 19:38:06 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1Q-0000000BpRZ-3J49
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:17 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-22403cbb47fso32890765ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104171; x=1743708971; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jAY+Cg5HQZMci06K15j1dCXU1uO31X3ZHDkdY1vsxDU=;
        b=B2RPjTBQ77I9eakXM1tObvTaMRjhpcuKhLotHgwQeoiCK5OgdIJF5dy6FIyX/lrKf7
         B4kaoRo7G/txERLCM9Qf8LWoYC5Y/SoqHFUejIU2ott9HiBveOLnPvgvD/bAC6xEHqvA
         Uty77LokVy39Tc9MAWvX356LhzNjP4Ds4gvp89ONIwtq/mi7sQrUOEaIVFDYzdgOqaGe
         WLYPi4kalz74WdplW0s7/ThMmn/g6ySdL3rdrYzaecQyaRGxKbHxb6PVq4PmWdUhuVv1
         X85usWvHxPEjrx9sBsSos1o9cWbf36+PBeYXYqcVk5nacSnSqAQfLiSVy9II+CNPlJlu
         Bl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104171; x=1743708971;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jAY+Cg5HQZMci06K15j1dCXU1uO31X3ZHDkdY1vsxDU=;
        b=LYtcESybwklT0SHoQf4nHlqD60zLQ8htRvWTswoXPPAJJYsIfTY0Hvl3zjrjzXJ4Uc
         TdOGhLVC/Mw7BoFWb6x/gH8m1mbJvSydEolF+zNqqSc1C9csmVsmuUYUKvFd/BDAd1Yf
         KDHtsIndz8fq7E7adW63PLqZnCQ0hDkHloWl6sKGQlqrHIewMoT09s1kvutzPOW9vHLT
         3LMzOyQclUBPS/EadtU1TEnE34PCxxtyfFfpTwe3X8kBZr5MYosXwl+jpg4pzuLrQd7P
         9cv4mbZfyRZrXZbBH/nl2+O7Fp+GOzZDqS608mrJk23G6UiOP5ZcF/Qk8zJ8SO1hSfq9
         zvSA==
X-Forwarded-Encrypted: i=1; AJvYcCUUNk1eKO87G4q+V00oZiWxJFmXUT4Lec8JUYr4cZLFS1I9pHQAmX1Ho08J8oY/QcpJKa9yZOOn+kU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzq1zuSaXDbcMJfLFeG3YrOo4x7nOZ8stkTfBx/H5wPPIeD3uYa
	sTh+W0joCxST/g/6fsFU50Apbkc4bgQCSJ0WAJINXv83hOu4Zd5FuFCHrY3ot10=
X-Gm-Gg: ASbGnculzLNKnhOc98RaFkHAZEUeVN7TGq04IStZgHzzNHizsN4gnVStCcOU2jf7rP0
	TSssbFpQ3PG85+/DnXqfvKoFcbBittK1P2QEqomMsLz/HKTsUFD6BGc7dLydmqeFj278p+hsqrR
	5SfgPhbNVziRgXIA+Vj8mZQLJhejw8qy3hVxCvoUWlm9BPQbGKszBkj99K4cflhMVMo3d+VIqy0
	Cipunu/EcVft67lQrlKHb6UJVFrGEcI8tvCcP7wlpB2+TdPF6ka/S5GdFWeAbgpGUDLabfWzvlT
	s7WmPLcjFtnYDUBpuunw5UgbSu6hJK4st3B1KnfDfZlUuMLZUJSRQUYiKQ==
X-Google-Smtp-Source: AGHT+IG3jSHF5jFLlVLycbj1Jf3RB9Ho77/qkuBJy49ZMZVDs34odX6i7mszuOua7lZd9PrWcxgbeQ==
X-Received: by 2002:a17:90b:514b:b0:2ee:dd9b:e402 with SMTP id 98e67ed59e1d1-303a7d6a9a7mr8534491a91.12.1743104171302;
        Thu, 27 Mar 2025 12:36:11 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v5 00/21] Add Counter delegation ISA extension support
Date: Thu, 27 Mar 2025 12:35:41 -0700
Message-Id: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAI2o5WcC/23QwWoEIQwG4FdZPNfFRB3dPfU9SimOZnaEdlx0K
 i3LvHudLaWlePxD8iXkxgrlSIWdDzeWqcYS09KCfjgwP7vlQjyGlhkKVMKA5j69Lyvll0CvdHF
 ra+cDWidxsv7kPWuD10xT/LijT88tz7GsKX/ed1TYq98cghFCG2mP0igFCBx4E8t8fcyxphIXf
 /Tpje1GxZ85LQBU74yKXHA7OqN8GK2GsaPIPwqariKbMih7UsEQDEF3FPWroOi+pKr9Fqn95Kw
 lOcI/Zdu2LwUgSlt7AQAA
X-Change-ID: 20240715-counter_delegation-628a32f8c9cc
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>, Kaiwen Xue <kaiwenx@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123613_037645_53BCAB77 
X-CRM114-Status: GOOD (  35.60  )
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

This series adds the counter delegation extension support. It is based on
very early PoC work done by Kevin Xue and mostly rewritten after that.
The counter delegation ISA extension(Smcdeleg/Ssccfg) actually depends
on multiple ISA extensions.

1. S[m|s]csrind : The indirect CSR extension[1] which defines additional
   5 ([M|S|VS]IREG2-[M|S|VS]IREG6) register to address size limitation of
   RISC-V CSR address space.
2. Smstateen: The stateen bit[60] controls the access to the registers
   indirectly via the above indirect registers.
3. Smcdeleg/Ssccfg: The counter delegation extensions[2]

The counter delegation extension allows Supervisor mode to program the
hpmevent and hpmcounters directly without needing the assistance from the
M-mode via SBI calls. This results in a faster perf profiling and very
few traps. This extension also introduces a scountinhibit CSR which allows
to stop/start any counter directly from the S-mode. As the counter
delegation extension potentially can have more than 100 CSRs, the specification
leverages the indirect CSR extension to save the precious CSR address range.

Due to the dependency of these extensions, the following extensions must be
enabled in qemu to use the counter delegation feature in S-mode.

"smstateen=true,sscofpmf=true,ssccfg=true,smcdeleg=true,smcsrind=true,sscsrind=true"
or Virt machine users can just "max" cpu instead.

When we access the counters directly in S-mode, we also need to solve the
following problems.

1. Event to counter mapping
2. Event encoding discovery

The RISC-V ISA doesn't define any standard either for event encoding or the
event to counter mapping rules. Until now, the SBI PMU implementation relies
on device tree binding[3] to discover the event to counter mapping in RISC-V
platform in the firmware. The SBI PMU specification[4] defines event encoding
for standard perf events as well. Thus, the kernel can query the appropriate
counter for an given event from the firmware.

However, the kernel doesn't need any firmware interaction for hardware
counters if counter delegation is available in the hardware. Thus, the driver
needs to discover the above mappings/encodings by itself without any assistance
from firmware.

Solution to Problem #1:
This patch series solves the above problem #1 by extending the perf tool in a
way so that event json file can specify the counter constraints of each event
and that can be passed to the driver to choose the best counter for a given
event. The perf stat metric series[5] from Weilin already extend the perf tool
to parse "Counter" property to specify the hardware counter restriction.
As that series was not revised in a while, I have rebased it and included in
this series. I can only include the necessary parts from that patch required
for this series if required.

This series extends that support by converting comma separated string to a
bitmap. The counter constraint bitmap is passed to the perf driver via
newly introduced "counterid_mask" property set in "config2".
However, it results in the following event string which has repeated information
about the counters both in list and bitmask format. I am not sure how I can pass
the list information to the driver directly. That's why I added a
counterid_mask property.

Additionaly, the PATCH5 in [5] parses the bitmask information from the
string and puts it into the metric group structure. We can just convert it in
python easily and pass it to the metric group instead. The PATCH19 does exactly
that and sets the counterid_mask property.

@Weilin @Ian : Please let me know if there is a better way to solve the problem I
described.

Due to the new counterid_mask property, the layout in empty-pmu-events.c got
changed which is patched in PATCH 21 based on existing script.

Possible solutions to Problem #2:

1. Extend the PMU DT parsing support to kernel as well. However, that requires
additional support in ACPI based system. It also needs more infrastructure in
the virtualization as well.

2. Rename perf legacy events to riscv specific names. This will require users to
use perf differently than other ISAs which is not ideal.

3. Define a architecture specific override function for legacy events. Earlier
RFC version did that but it is not preferred as arch specific behavior in perf
tool has other ramifications on the tests.

4. Ian graciously helped and sent a generic fix[6] for #3 that prefers json
over legacy encoding. Unfortunately, it had some regressions and the discussions
are ongoing if it is a viable solution.

5. Specify the encodings in the driver. There were earlier concerns of managing
these in the driver as these encodings are vendor specific in absence of an ISA
guidelines. However, we also need to support counter virtualization and legacy
event users (without perf tool) as described in [7]. That's why, this series
adapts this solution similar to other ISAs. The vendors can define their pmu
event encoding and event to counter mapping in the driver.

Note: This solution is still compatible with solution #4 by Ian. It gives vendors
flexibility to define legacy event encoding in either the driver or json file
if Ian's series [6] is merged. If we can get rid of the legacy events in the
future, we can just rely on the json encodings. I have not added a json file for
qemu as I have not included Ian's patches in this series. But I have verified them
with a virt machine specific json file.

The Qemu patches are available in upstream now.

The Linux kernel patches can be found here:
https://github.com/atishp04/linux/tree/b4/counter_delegation_v4

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/perf/riscv%2Cpmu.yaml
[4] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc
[5] https://lore.kernel.org/lkml/20240412210756.309828-1-weilin.wang@intel.com/
[6] https://lore.kernel.org/lkml/20250109222109.567031-1-irogers@google.com/
[7] https://lore.kernel.org/lkml/20241026121758.143259-1-irogers@google.com/T/#m653a6b98919a365a361a698032502bd26af9f6ba

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
Changes in v5:
- Fixed dt_binding_check errors.
- Added the ISA extension dependancy for counter delegation extensions. 
- Replaced the boolean variables with static key conditional check required at boot time.
- Miscellaneous minor code restructuring. 
- Link to v4: https://lore.kernel.org/r/20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com

Changes in v4:
- Added ISA dependencies as per dt schema instead of description.
- Fixed few compilation issues due to patch reordering in v3.
- Link to v3: https://lore.kernel.org/r/20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com

Changes in v3:
- Fixed the dtb binding check failures.
- Inlcuded the fix reported by Rajnesh Kanwal for guest counter overflow.
- Rearranged the overflow handling more efficiently for better modularity.
- Link to v2: https://lore.kernel.org/r/20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com

Changes in v2:
- Dropped architecture specific overrides for event encoding.
- Dropped hwprobe bits.
- Added a vendor specific event encoding table to support vendor specific event
  encoding and counter mapping.
- Fixed few bugs and cleanup.
- Link to v1: https://lore.kernel.org/r/20240217005738.3744121-1-atishp@rivosinc.com

---
Atish Patra (17):
      RISC-V: Add Sxcsrind ISA extension definition and parsing
      dt-bindings: riscv: add Sxcsrind ISA extension description
      RISC-V: Define indirect CSR access helpers
      RISC-V: Add Smcntrpmf extension parsing
      dt-bindings: riscv: add Smcntrpmf ISA extension description
      RISC-V: Add Ssccfg/Smcdeleg ISA extension definition and parsing
      dt-bindings: riscv: add Counter delegation ISA extensions description
      RISC-V: perf: Restructure the SBI PMU code
      RISC-V: perf: Modify the counter discovery mechanism
      RISC-V: perf: Add a mechanism to defined legacy event encoding
      RISC-V: perf: Implement supervisor counter delegation support
      RISC-V: perf: Use config2/vendor table for event to counter mapping
      RISC-V: perf: Add legacy event encodings via sysfs
      RISC-V: perf: Add Qemu virt machine events
      tools/perf: Support event code for arch standard events
      tools/perf: Pass the Counter constraint values in the pmu events
      Sync empty-pmu-events.c with autogenerated one

Charlie Jenkins (1):
      RISC-V: perf: Skip PMU SBI extension when not implemented

Kaiwen Xue (2):
      RISC-V: Add Sxcsrind ISA extension CSR definitions
      RISC-V: Add Sscfg extension CSR definition

Weilin Wang (1):
      perf pmu-events: Add functions in jevent.py to parse counter and event info for hardware aware grouping

 .../devicetree/bindings/riscv/extensions.yaml      |  67 ++
 MAINTAINERS                                        |   4 +-
 arch/riscv/include/asm/csr.h                       |  57 ++
 arch/riscv/include/asm/csr_ind.h                   |  42 +
 arch/riscv/include/asm/hwcap.h                     |   8 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h              |   4 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |   2 +-
 arch/riscv/include/asm/vendorid_list.h             |   4 +
 arch/riscv/kernel/cpufeature.c                     |  27 +
 arch/riscv/kvm/Makefile                            |   4 +-
 arch/riscv/kvm/vcpu_sbi.c                          |   2 +-
 drivers/perf/Kconfig                               |  16 +-
 drivers/perf/Makefile                              |   4 +-
 drivers/perf/{riscv_pmu.c => riscv_pmu_common.c}   |   0
 drivers/perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c}  | 982 +++++++++++++++++----
 include/linux/perf/riscv_pmu.h                     |  26 +-
 .../perf/pmu-events/arch/riscv/arch-standard.json  |  10 +
 tools/perf/pmu-events/empty-pmu-events.c           | 299 ++++---
 tools/perf/pmu-events/jevents.py                   | 218 ++++-
 tools/perf/pmu-events/pmu-events.h                 |  32 +-
 20 files changed, 1490 insertions(+), 318 deletions(-)
---
base-commit: 74e48c9286409128a3dccd0efd4b83b3f9ef95fd
change-id: 20240715-counter_delegation-628a32f8c9cc
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
