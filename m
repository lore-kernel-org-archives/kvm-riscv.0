Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ACC4CD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YXFumuyshFAtjaOfv9PAlZcYEbX6TgYC5JCOaRrt9bo=; b=iFaLdu2q98Tk5d
	ssI6bbbqW1gOlQ5eSKMe0pYHQFIDdz3JRTeydCxUPVLiiNZaVXWkGj0vWaKE1IwCKSSC/+MTbCfDP
	WTTnb5ne6BocYraQdOqkx2DjY/ZlqzA/zHwiOxUAL/7XCCkWhK6rQC9eFmyZ5aCWv4DaEZvJOut8D
	fQ9vY/X41+wiF47t3yV2b9zCRJ6dwIK0m+qnprZSkHy+7R8/DHokAvmPHXxkZP9C7qRDJiRRCvPkd
	uZaZwE6w2lVKbe4ce3ShUM5CQCk8tNy4xtmfeMxkkwJAe8KF/kgcTcKpMpsV29luoN/riv8nYWpYR
	hH79uLcFTDytS1i/+HHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXllz-0000000A0Wg-1x6O;
	Thu, 11 Jun 2026 20:13:07 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXllv-0000000A0Vf-32Er
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:13:05 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c8587427468so79522a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781208783; x=1781813583; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4z0hl6gf2+Flj5FX9Tlv/6+ud0tivr1GWz8vDmFJRDs=;
        b=BlVsAVi5IJ9i9J6Os+1MUlqMv8MQcb9lSWb4T+zL6a8WT8aJkfueFlazN+sHTV+k2v
         Z1tKLjwSqIg+E0NR70fwWVjddJlkfbkWIuAfju0CSEP/ogob21/yGsJvs+P5GMKOOQEJ
         de9vUQYJJhTyHc2ael24FJoxhf4i6LDxB6K07dweuLjjRkEwxv3PNm7R+7Giv4liZ3SG
         uFTTHCZAxWZtI/j3Uugk5eARMLsIzJDKjJzCocLoeQW1KlmnCZmdGM27Bgz306LoMeu3
         OF9qRhvOhQGz8nHn2bEHXT5fECUP72Fbk7JIW4gE1YBLHDvUwdKBsXcUhpmPB06JDV5m
         ifOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781208783; x=1781813583;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4z0hl6gf2+Flj5FX9Tlv/6+ud0tivr1GWz8vDmFJRDs=;
        b=BI09Bs+1kqeL1r0MKYYrC9Y39pdnToFgzIjJkfXJk1ChpJvn6ZZ7NfDNX7JnVo+l2U
         miHgxJw4C1S6RMIvwvL/imgF6hqpgpFNQKBdYMncruSxSZWS8htGsnVxI3icfWezsI5e
         sla+1KJlh9eF6U95U7hw9sBO6l/T2fY886knhmHtx/GSjCirImDLKQHbt3SkSZmw2mkD
         R4pFU5QagLYAQJ3lWisuCsxDQVCqfeUOjOVbWhUGGiL194oILUk/IiVrTaNo3cJIchqy
         Z5VccMTdZ0eiXAntE5G6AvciUygeNN4T5B0Tv7U7l5oYQkF6qwcDhL/Lyb+4VezwPjpa
         DEyg==
X-Forwarded-Encrypted: i=1; AFNElJ8B633/szAv61STM24IwcsfgFZEhwieWxA8+4cyLpTpJVx4rbXqpGiq0fPp4N5RqpDkD5mgOqFKJd0=@lists.infradead.org
X-Gm-Message-State: AOJu0YyFfd6F8+6Oo/09b1WSsXz8OwDpKMuLgXSVoKUcb/FV43W+RmL8
	mTb3R65LM48NicqNgxScdARvgz0GBk4XwyKwaWuULnJdU131SaeM0ZbL
X-Gm-Gg: Acq92OFXyiKi+7TmTNfgZlcdTNMOLLgzVOQdDfJqKv0GnLQTLiZGH95uQUyX+tSc4g4
	j9h3VlySh/x3tCC0MG1B34Hm3U2tOJb072FgdRVygV3SUH98HjkSDOitNFxXGfs34Kkk0M+YY/u
	tn4GWwmQERZm8nBW/3tB1CUUavR6KuhGu9Wm+g+1eYeIkRcfim4NjuD3IOTcdKXW/3eClXsdpxt
	+ipxK5Ct5CZkMuqArwkimo/Ekg1pK/ETJWvFm8oBGkcujmGRQPOUWu4Ot4XPYvcdcbDBl3Vwy2s
	Hhf7vZrW9B17DEhibJCVZGOoIOf3I6t0fxeorR+XvqMqURzFT8iwHDDcv3m+FhHrhS2VSv54cKo
	K4FdnxgeUXqCANCVBRNm8jRoop7VnM8SfD/rXsHfts4guuYeHR1Qchw+GjtXEyPXTuMlnIO8fsw
	==
X-Received: by 2002:a17:903:2ac4:b0:2c0:ab82:6b99 with SMTP id d9443c01a7336-2c2f36399f1mr48272375ad.33.1781208782464;
        Thu, 11 Jun 2026 13:13:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::302d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f875casm288730475ad.22.2026.06.11.13.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:13:02 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Subject: [PATCH v4 00/16] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Thu, 11 Jun 2026 16:12:37 -0400
Message-Id: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALUWK2oC/22Nyw6DIBBFf8WwLg0M4KMr/6PpAhCVpj4CStsY/
 72oTbppMpuT3DlnQd44azy6JAtyJlhvhz4CPyVIt7JvDLZVZAQEUiJIjl2QwOaU4/Y5ukEZHAD
 TCkjGCq1UblD8HJ2p7Wu3Xm8H+1ndjZ421bZorZ8G996zAbbdt0Dp30I8goFqIQXnNa106azXf
 pLurIcObZHAfpqUsP8aFjVCQCEzBTnLedl00j4Ox7quH99o0TcPAQAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Qingwei Hu <qingwei.hu@bytedance.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6838; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=GS7X8iSTN4N+xNNFv8PFB8oM/gEHO+PcXo/VZaIMAiM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixtsV1M0pIfS9dk2yi2XM1WDGhwi7udZ9gdveG2q2WYZ
 j+vCGdHKQuDGBeDrJgiy+GjLdlbX/lE+z7n/AEzh5UJZAgDF6cATMRiLSPDg+TlLVX8a+yfbl9t
 2r/hz+rlrwSWn6pJWV70QN5nc6zEIkaGbqX1iR89tTSW8ExSSvUNTtynVWnroCbXe2hv8LV8q3n
 8AA==
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_131303_809937_CBC9CE34 
X-CRM114-Status: GOOD (  13.92  )
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

Series outline (v4):

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
   8.  dt-binding, with a schema check.
   9.  cpufeature parsing + hwprobe export.
  10-12. dts: declare zic64b in the SpacemiT K3, SpacemiT K1, and Sophgo
         SG2044 device trees.

  RVA23U64 base detection and exposure:
  13.  riscv_have_user_pmlen(): accessor for user pointer-masking PMLEN
       support.
  14.  cpufeature: per-hart and host-wide isa_bases bitmaps; IMA and
       RVA23U64 detection lives here.
  15.  /proc/cpuinfo: print "isa bases:" and "hart isa bases:", e.g.
       rva23u64.
  16.  hwprobe: expose RVA23U64.

Tested on both K3 Pico ITX and QEMU with -cpu rva23s64,sv39=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.1-rc6 plus [2]; happy to rebase onto another tree if needed.
A branch is available for all patches in the series: [3].

Note: [2] is only required to save the merge effort for adding 'Zic64b'
      and 'Ziccrse' into the same k3.dtsi file.

Link: Andrew's RFC v1:
      https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]
Link: Prerequisite for applying on K3 w/Ziccrse:
      https://lore.kernel.org/all/20260602070257-KYC5031219@kernel.org/ [2]
Link: Branch: https://github.com/docularxu/linux/commits/b4/rva23u64-hwprobe-v4/ [3]

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

Guodong Xu (9):
      dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
      riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
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
 .../devicetree/bindings/riscv/extensions.yaml      | 204 ++++++++++--------
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
 arch/riscv/kernel/cpufeature.c                     | 183 ++++++++++++++--
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  34 ++-
 arch/riscv/kvm/isa.c                               |  16 +-
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +-
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 21 files changed, 680 insertions(+), 388 deletions(-)
---
base-commit: 99c201dabc35bbd21252c4c682488209dcb4295e
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <docular.xu@gmail.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
