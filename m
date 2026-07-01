Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E8D6C43327
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ItkhNnbXYCqJRII+tFLrzanRIdzNltaVpHmgH42D7DU=; b=c7Qmtl35PzJTZy
	aFJBYRKSnhIyVQgUlQdbyFOIfpbaAsf5EJ9KDxQJGC6jV/i6jfOHJ9zj+TQnavdxssQoOfnSMvHTx
	2tYItVB/JVv193C0P8mPedtEsP2zt6f2wipNS7bAnpGlP9q1VqlLGQtce7wfBq/ObtHeAaOCnMdrQ
	77XyCRHUifhQHMxC0E8D34m/i4bPOeL5UiwsAbaLW+6BYDRBOPq2n0WctTiyH2FmnCFRHGWDEFjt9
	uLH5qidodbtcEL/bINadp4EqsBTFSwVyAfBr0woz/oqY0KUYUyBGAUIIgmcvPkAgrWMVgpPSCH1vM
	tZf5WXbNIIbI7rwgGzhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuQg-000000023IK-3quT;
	Wed, 01 Jul 2026 12:52:38 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuQe-000000023HZ-2hcg
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:52:38 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-847aa193d98so235240b3a.3
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910355; x=1783515155; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JeCbitpqWG7NX4xrzGZKImDD1kM8ZvDaFxEivFDYFVQ=;
        b=hgZRe+I9oSSEic+tXkf7faRZyzNGoFOWT6KOlZiidG468gv5NhHQXJ+55/7lRBkL3F
         7FTWnOi9L7QbBcwKPeJ/f0bjzt2d38i4VaE/WIigRiX+u/W/k1GEWVXgGYO5YjY8m2Fs
         yJzue2S0az4Eu9V7UuPr315CweFqyEVjdcXi4+eOxoxKOGKoCX1rS0SuWhpkb5ZcAU8W
         2sGkSFP7b/c58aRObysB0RwXeCzS9DnuoHeWPEiloHZzW5YDYEFmhCBQi0365IqlKwrd
         0lBi2OrYGp0ueHq9HCVwjAd7e8JarV0cuVaNzxJvD5bJtHJ7MPN+AJ28MpPPaOfvnHZY
         xRkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910355; x=1783515155;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JeCbitpqWG7NX4xrzGZKImDD1kM8ZvDaFxEivFDYFVQ=;
        b=mzz5687v6z5/EtbxvpLLWAcUK7tlw3KNfGjFpeJ5PW3tPwYmewKru5M227wrXOEa8+
         qfS0rY4FbcCIvuw3C0g+us4EU6Ii1qh8xHuHh+H2XRgLrWxpzpUh+I4fXXVdqhx3uf7V
         VGW804lrvHWywcEOEqOTxxDbzoK0J/lwHmnzuMEDZrexzzuzMOwgH0JNV4MEBjV5GBjU
         MG3jCM2AUKQLnL7nj4BBdlbD6GRFQ9lcbRNnn+njXr+ZV7eeCC28pQBuXox2/H+7N8I7
         VQXPztMgV+uchl06TPowricNW4bC+CDgRyuksLMW2O+rWu1Xsf3u1pAX8UJAblKf6Gv1
         xMiA==
X-Forwarded-Encrypted: i=1; AHgh+RrG7gPRDjCkJagcnAupijN9HMG6UC7IjTxYIRXPhXh2DHRjVE5AVeU9+BEG3kUyvM6qcQH9JtP8h6c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5iZafD59BrOijGik7I0z7ooEs83sU8/Jw95IG0TlksQPMLJir
	vY7LoaGjyTirACJ6tDga6CBclwZwHmGVWK8zCsSXWxmL0LLDyxmCmBtL
X-Gm-Gg: AfdE7ck4FUt6I1410ZK+noYt1nsglv1mUTwvS8yQjv9Eb1UpD/Hrn4kLChuIsXskVV/
	oC3SzT+iMF07z58DSHVr3S8dvM+ZR7Y0pyKYWPlHqYqywh/7nj7ocNGNqT9x1X4rwjxVD4W0oCW
	/KEkcCEBgqZXMido9eDPaa4v/rQLJnBfb+ZLGSQ1i7yxbCskdD1Qu+j4scNjGLw8ksCwGhUgshF
	Zl9ftcYmNnG2jGYKNBkzVIBU+aKviO1yzWETYzfIEaJ28xu9NZpaH2l3BF3E2mdGAWH96iAySpB
	lApe0iWTshrFGqhZrKB0THiMKuiVL2k1TDIHjUAfMpInflCqThs/B3g5ZEVrVgcwuhnYC+pupin
	JDnO9j6ho8KiFtPAU/IHQ5VrjI9d/QyCHkH4T4kOa1WnVw/1QqjxovI+gRYASsgAsmeJX8KssO5
	g/LCgKLCRvZwvCGHLSbvEJ
X-Received: by 2002:a05:6a00:9299:b0:847:8704:1c54 with SMTP id d2e1a72fcca58-847c07419cbmr1308909b3a.22.1782910355086;
        Wed, 01 Jul 2026 05:52:35 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:52:34 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v5 00/17] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Wed, 01 Jul 2026 08:52:13 -0400
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAH0NRWoC/3XOQQ7CIBAF0KsY1mJgGCp15T2MC6DUYrQ10KKm6
 d2laqILTWbzk5n3ZyTRBe8i2SxGElzy0XdtDnK5ILbR7cFRX+VMgEHBJFM0JA1iKJA210vojKM
 JKK+ArUVpjVGO5MtLcLW/PdXd/pXjYI7O9jM1bzQ+9l24P2sTzHvvBs5/NuRhFLiVWiLWvLLb4
 KONvQ4r253JXJLEhymY+M2IzEgJpV4bUELh9nDW/vQx8Mv49wpmQ9SMa0AsUalvY5qmB/vY9oF
 TAQAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, Jesse Taube <jesse@rivosinc.com>, 
 Qingwei Hu <qingwei.hu@bytedance.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=7202; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=clw0EOfLxOw8mtsU7lPIxvK677hYKTd1sOOAfWfxJ+Y=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3ibBuQlLRO5Iir2Xy9ZNzjX0Lsr5ZnqiosC1/v7Na
 2csrz7tKGVhEONikBVTZDl8tCV76yufaN/nnD9g5rAygQxh4OIUgIns9GT47+au1G12duU7n6fJ
 +VWn06qLt6x807xO3qm/SmfC3ckLixj+im3cdP7hprcPTArvWK4QUF3ZPKFDMi9Kbrb9f1PTo0u
 m8gAA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_055236_717670_068CE6ED 
X-CRM114-Status: GOOD (  14.85  )
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

This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
check for RVA23U64 conformance in one call, instead of walking hwprobe +
prctl across every mandatory extension.

The series adds a small framework that resolves profile-class bases (IMA
and RVA23U64) from the kernel's ISA extension bitmap at init time, and
surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
can add RVA23S64, and backward RVA22 / RVA20 detection, to
riscv_set_isa_bases() without changes to the surrounding code.

Series outline (v5):

  Housekeeping, clean-ups:
   1.  dt-bindings: sort the multi-letter Z extensions alphanumerically.
   2.  hwprobe.rst: normalize indentation.
   3.  hwprobe.rst: document EXT_ZICFISS / EXT_ZICFILP.
   4.  Standardize the single-letter extension macros to uppercase
       (RISCV_ISA_EXT_a -> RISCV_ISA_EXT_A, etc.).

  Per-extension cpufeature parsing + hwprobe export:
   5.  Zicclsm.
   6.  Ziccamoa, Ziccif, Ziccrse, Za64rs.
   7.  B (the Zba/Zbb/Zbs set).

  Zic64b (new first-class extension):
   8.  dt-bindings: require a cbom/cbop/cboz block-size property whenever
       the matching Zicbom/Zicbop/Zicboz is present (new in v5).
   9.  Zic64b dt-binding, with a schema check.
  10.  Zic64b cpufeature parsing + hwprobe export.
  11-13. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
         SG2044 device trees.

  RVA23U64 base detection and exposure:
  14.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
  15.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  16.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  17.  hwprobe: expose RVA23U64.

Tested on both K3 Pico ITX and QEMU with -cpu rva23s64,sv39=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.2-rc1. A branch is available for all patches in the series: [2].

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v5/ [2]

Changes in v5:
- Rebased onto v7.2-rc1.
- New patch: make riscv,cbom/cbop/cboz-block-size required whenever the
  matching Zicbom/Zicbop/Zicboz extension is present (Conor).
- Ziccamoa/Za64rs: drop the Zaamo/Zalrsc validate callbacks (Conor).
- Zic64b dt-binding: fix a double space in the commit message (Conor).
- Collected Reviewed-by and Acked-by tags in v4.
- Link to v4: https://patch.msgid.link/20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com

Changes in v4:
- New patch: sort the multi-letter Z extensions alphanumerically in the
  dt-binding (Conor), and place zic64b at its sorted position.
- Zic64b cpufeature: validate only the CBO block sizes that are present;
  overlaps Qingwei Hu's earlier patch, so it is now authored by Qingwei.
- Document EXT_ZICFISS / EXT_ZICFILP: cite the riscv-cfi v1.0 tag commit.
- Picked up Inochi Amaoto's Acked-by (SG2044 dts) and Andrew Jones's
  Reviewed-by (documentation patch).
- Link to v3: https://patch.msgid.link/20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com

Changes in v3:
- Add Zic64b as a first-class ISA extension: dt-binding, cpufeature
  parsing with a validate check, hwprobe export, and device-tree
  declarations for K3/K1/SG2044.
- Patch 1 is now a clean up of hwprobe.rst indentation.
- Document RISCV_HWPROBE_EXT_ZICFILP alongside ZICFISS.
- Move the Zicclsm hwprobe.rst entry to the IMA_EXT_1 section to match
  its bit allocation.
- Collect Anup Patel's Acked-by/Reviewed-by on Patch 3, the capitalization.
- In cpufeature.c, set the local ext_mask with __set_bit().
- Update Guodong Xu's email to docular.xu@gmail.com.
- Link to v2: https://patch.msgid.link/20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com

Changes in v2 (since Andrew's RFC v1):
- Rebased onto v7.1-rc2.
- Reworked rva23u64 detection into per-hart and host isa_bases bitmaps,
  shared by /proc/cpuinfo and hwprobe.
- Scoped to IMA and RVA23U64 (RVA23S64, RVA20/RVA22 cpuinfo output deferred).
- Link to v1:  https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com

Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Make indentation consistent
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (10):
      dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
      dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
      dt-bindings: riscv: Add Zic64b extension description
      riscv: dts: spacemit: k3: Add Zic64b ISA extension
      riscv: dts: spacemit: k1: Add Zic64b ISA extension
      riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

Qingwei Hu (1):
      riscv: Add Zic64b to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               | 240 ++++++++++++---------
 .../devicetree/bindings/riscv/extensions.yaml      | 230 ++++++++++++--------
 arch/riscv/boot/dts/sophgo/sg2044-cpus.dtsi        | 128 +++++------
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  80 +++----
 arch/riscv/boot/dts/spacemit/k3.dtsi               |  48 ++---
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  24 ++-
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |  10 +-
 arch/riscv/kernel/cpu.c                            |  26 +++
 arch/riscv/kernel/cpufeature.c                     | 165 ++++++++++++--
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++-
 arch/riscv/kvm/isa.c                               |  16 +-
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 21 files changed, 688 insertions(+), 388 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
