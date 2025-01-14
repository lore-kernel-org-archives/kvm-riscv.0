Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D15DE77188
	for <kvm-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 22:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9xKmfGPUN5jg9GIs9mgRaeJ6dtXMYdVHPKneqMBBdxk=; b=alvXTzEc+0r4Mj
	54O+UAW6Z3bgQES2exhTq1TWQwtYGNZzk83MDCTIEGj20U+5C2LwSNnWtYG9soPwYXkDyHB123NRv
	p0pVsyOoEvXoHWf5r2TW+9Yl21lWJv8u1F/JJ5W7wkP9eIqA/5u3eezIDyEnE1zYYl35ho/UeAOzI
	Cw8+j4REHmhU0Fm2YE00LnhMQmTcueuBEtiILdON1NTMyfwmeo30T4xuRY2RGP3CirC2X03JI83Lu
	+x5+yDe5JqyYKkFUab9rNHqfHtuZU9TR3X2rAzTmAtH3Yl6u927uSTd11fTyTaqaofZV7BGy9yx/A
	mcGm91u2hHH8f2LtQk6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprZ-00000009zlO-3Xgz;
	Tue, 14 Jan 2025 22:58:21 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprW-00000009zhW-2Vq9
	for kvm-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:20 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2163b0c09afso111540575ad.0
        for <kvm-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895497; x=1737500297; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYkLU0NirAu9JE4/rkvv4iX0/5kO7v9LARooIOZwEJg=;
        b=WxQEJE+XPtmpSAB/49160zGGvndLZTIc2UiZZAukbWVxoBZDjJ0x2cSM28UHC/DY1y
         WGKm1iFIT+tQbc2anVoqju+7EhICuUGLknzoUJE08cOukL7x3t52FQS7Ep2OQ8em6CUc
         jCuWzo+1Ztixv8J1oJVMbVFZC8uMsfH3MA7DHlczveYFLnssI8LhHUwqg9HpRE2fnjbw
         nkmPTHjUQYxiSLm62qwnz9GNQuM6iFB3+KkBHj7fFPSgqZUoFAlw+eDD+z8fW/WvVzUF
         LIJenNVgY8WXqcTz0doSmNd/frRoHTM7iIZ5w6E2D3XFfyk4EqmUHtEMDZL+4p75q39L
         KCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895497; x=1737500297;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYkLU0NirAu9JE4/rkvv4iX0/5kO7v9LARooIOZwEJg=;
        b=RaXfPIQ9594rOnWjEzFOReC2d/ZhuIYtqfhTJAVo6Vm5sPfFPPgwTvXLCW1EDaI+bF
         D/I2+g18u5BkMRQIEsRC3DTWt/HigZ/cVVvqw59prepryXNIk8cNsMnR62Gqlq6FocKA
         Va0AAdiqaKDstoRugi90K0Ea9j8W9dP4ze5XZUR21wQJPx32x0/OXOF/vszjfZrUS9rQ
         V2usCUMcvjPsuyhsmZRAAPyHS6E/zq4zRjmTGrBU5+JpP6ffa3wCs/gFaBRbcr2Va8tV
         +8DqHQWDL6zfdHTAyIuh+YOhDaxdFDhNO+ViO2ZSxvdd3AO8y7s/8/Gz3zwgpqJzeKMO
         3LGg==
X-Forwarded-Encrypted: i=1; AJvYcCXc2DZmOC/17NK9ik00yXETD1j/OC1I/w2sjkQVg5DBadW7gL1y9yP/+1k6mj05RpWKeQHOYdTyUGs=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBMRQAsYo/gF0zE8uP/kmay6Ak30fwaYTn8Qk1ACGGYk3+AsKq
	bE1YCHPpSUF/OPjpSC5eETHCUSm46FAJqm4Q3us4Bv+3pDqT5yS6eahnKrdN7rk=
X-Gm-Gg: ASbGncsTHgpjCG+WGPm0hW4PVy4Ss4RGilIwXifhHbwQLfUrM+zIBm29zxXEuDTQv9V
	GpGRYQlbTRRNK4VNlE836QdG9EpHyVFzunn7CXZI6OO7q+RnR2VjghIBoFf0OtOW4Ubz6Jo1IMe
	6+6WKupNIzGPZMBIeN2TLJsadLWhI8EP/+3/NpQa8YrNGQB0NzkxHZfKIz+yZfBaV9Tzdrn6xua
	SIL1e3XI/lJSnLHgYrgoRMxdHGLmYlGTOvxbWFzJkQjwkZLKm2KMih5FMX6TMspyyIcpg==
X-Google-Smtp-Source: AGHT+IFtG/k42yCeVuHX0tPN9L9VOFBp4AdntnEMp6oqgm8Ihathe3ej6ZuJqnnMKmge/3JMw8KR8w==
X-Received: by 2002:a17:902:ecc5:b0:215:7dbf:f3de with SMTP id d9443c01a7336-21a83f5e4e5mr418050535ad.28.1736895496910;
        Tue, 14 Jan 2025 14:58:16 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:16 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v2 00/21] Add Counter delegation ISA extension support
Date: Tue, 14 Jan 2025 14:57:25 -0800
Message-Id: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANXrhmcC/yWNwQ6CMBBEf4Xs2ZJ2AYuc/A9DDFkW2ERb0iLRE
 P7disc3mXmzQeQgHKHJNgi8ShTvEuApA5o6N7KSPjGgxlJbUynyL7dwuPf84LFbUl2dse4KHGq
 6EEEazoEHeR/SW5t4krj48Dk+VvNL/zo0VuvKFnVe2LI0aJRRyRin+Rpk9VEc5eSf0O77/gUwy
 20VqQAAAA==
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, 
 Kaiwen Xue <kaiwenx@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145818_648020_131A8F6C 
X-CRM114-Status: GOOD (  33.58  )
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
changed which is patched in PATCH 20 based on existing script.

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

The Qemu patches can be found here:
https://github.com/atishp04/qemu/tree/b4/counter_delegation_v4

The Linux kernel patches can be found here:
https://github.com/atishp04/linux/tree/b4/counter_delegation_v2

[1] https://github.com/riscv/riscv-indirect-csr-access
[2] https://github.com/riscv/riscv-smcdeleg-ssccfg
[3] https://www.kernel.org/doc/Documentation/devicetree/bindings/perf/riscv%2Cpmu.yaml
[4] https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/src/ext-pmu.adoc
[5] https://lore.kernel.org/lkml/20240412210756.309828-1-weilin.wang@intel.com/
[6] https://lore.kernel.org/lkml/20250109222109.567031-1-irogers@google.com/
[7] https://lore.kernel.org/lkml/20241026121758.143259-1-irogers@google.com/T/#m653a6b98919a365a361a698032502bd26af9f6ba

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
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
      RISC-V: Add Ssccfg ISA extension definition and parsing
      dt-bindings: riscv: add Ssccfg ISA extension description
      RISC-V: Add Smcntrpmf extension parsing
      dt-bindings: riscv: add Smcntrpmf ISA extension description
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

 .../devicetree/bindings/riscv/extensions.yaml      |  34 +
 MAINTAINERS                                        |   4 +-
 arch/riscv/include/asm/csr.h                       |  57 ++
 arch/riscv/include/asm/csr_ind.h                   |  42 +
 arch/riscv/include/asm/hwcap.h                     |   8 +
 arch/riscv/include/asm/kvm_vcpu_pmu.h              |   4 +-
 arch/riscv/include/asm/kvm_vcpu_sbi.h              |   2 +-
 arch/riscv/include/asm/sbi.h                       |   2 +-
 arch/riscv/include/asm/vendorid_list.h             |   4 +
 arch/riscv/kernel/cpufeature.c                     |   5 +
 arch/riscv/kvm/Makefile                            |   4 +-
 arch/riscv/kvm/vcpu_pmu.c                          |   2 +-
 arch/riscv/kvm/vcpu_sbi.c                          |   2 +-
 drivers/perf/Kconfig                               |  16 +-
 drivers/perf/Makefile                              |   4 +-
 drivers/perf/{riscv_pmu.c => riscv_pmu_common.c}   |   0
 drivers/perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c}  | 941 +++++++++++++++++----
 include/linux/perf/riscv_pmu.h                     |  26 +-
 .../perf/pmu-events/arch/riscv/arch-standard.json  |  10 +
 tools/perf/pmu-events/empty-pmu-events.c           | 299 ++++---
 tools/perf/pmu-events/jevents.py                   | 218 ++++-
 tools/perf/pmu-events/pmu-events.h                 |  32 +-
 22 files changed, 1422 insertions(+), 294 deletions(-)
---
base-commit: 9d89551994a430b50c4fffcb1e617a057fa76e20
change-id: 20240715-counter_delegation-628a32f8c9cc
--
Regards,
Atish patra


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
