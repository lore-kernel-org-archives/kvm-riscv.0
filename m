Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81DE1CD37AC
	for <kvm-riscv@archiver.kernel.org>; Mon, 11 May 2026 13:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RGBks/sBv9iCllRAtjyJc/EJCv1yYNAWtBohHyyxe0Q=; b=C2eWmHk+rLkYNj
	7d+Hw/nwfDbYB1CdM8I2fgspu7UFNvx2NNBGtyrozKKx0bO8sYydBu3eUrO9UCbQTtJSJhdAxEF++
	ewQ4rO1UXwRF77u6QK8Ux6Ga+1YBer8iLPOsGdep+gjZTEwXaoaCnYOkwNhghSab6GdZyvavOTdtW
	EDxFEdZ9OthrqwmFZ0fWIoX+avuVXhb9WDtSYoTSIZ7pCm9o3h1LSWFNnO68z2Xdz85j6yZwIQ+0Z
	gsB/xq+3mNFXkIxosYjP/LfXWBujN9GfNWyrwI8MnUv7FOTmG8Vr3tSu1b3vMUiuyW9KP1MFeXvIL
	fYBeC2WTGlx7BVDc5+Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQo9-0000000Dlbk-0dBm;
	Mon, 11 May 2026 13:36:29 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMQo5-0000000Dlab-0Aqn
	for kvm-riscv@lists.infradead.org;
	Mon, 11 May 2026 13:36:28 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-3664df32e91so2821799a91.3
        for <kvm-riscv@lists.infradead.org>; Mon, 11 May 2026 06:36:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1778506583; x=1779111383; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=ZsNjaqP+98CStfWEVFhINGNg/4L6ijY0mjzWaJ1jVc3RT+fwkxwcN2JrOkrPaYiI3/
         peXdyByTz7fjNfX2BpJBIM3Xpni8oSZv1WPjhEgE37vRDW6GmxjcsSRyg/GVBklIm5KQ
         DgY8q0vehnwOHym+DBU6PswtGQ3J6qnzZC9ECly7YG7XqJ3Ljl0xLlvOSH4ar6FvB+/n
         279Y5sGInKRXTD58vSOTKsuzpuugm9dcT1bvZo7TLz22+1XZblTT2MKyMuzS3GCyxukf
         237WT4shirz356uTxJmSCyNRZU0OCtRwL0vfMMmJwtJVSglelBhJCDUUG94pylVvrknn
         Ik8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778506583; x=1779111383;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Z29fhkBQbknShosTsnNNQxT5IXOqOhrJTIx7eoQ358=;
        b=BbBNLZghyRvwwbdR/hDF02QQ67dP3ZB1Xipk7IwMh1BfDqHd+UbIcd++Y/dBqhXRli
         SwFKdsyQnXe++1H94qUf1K0NDtihHFe+GxHOuB9eHryrtW7fZXh3MesVKRqyuNEHSUkm
         Qeb5SLncVZa8O7ORshNvvvLMHK+3U6JMqXQ+UFLl3cLoCn0aCpgP43tMwStO7bfVG8dC
         /5bRSqqpICiJVt/i5RzNfiMu8IDIJ5FgaJjXHEKz7JVFT2zfHhqLCJikZ0TiuxpbT5v5
         FCY5GrKnCq0cM1SnIj+LSXEyHIV5uIjhdVUD20bk0lgY2NFoZUN6B3gOy0nvpwTUS4v6
         saEQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3XImcP0KMZ/AyuY6S8B2M0l6rOwuGniRTxU09MgiVsgQ638tbSva4mA3BoI57jaxDYqcWIOcLyRg=@lists.infradead.org
X-Gm-Message-State: AOJu0YyZogI/zUlCGCuYSwpyP1FTHGFjrVH7HhvwT0QYQ/bhacBneCJ4
	svnVL5JOWNgwrGHLEfOTmn65fRzsT3K09i/FEmGztzh8aQlHTVw/sBoYOfiesoK7/oA=
X-Gm-Gg: Acq92OEkNbliO/kk6S6karxC1rAficdF8MeteZaEUJUpdCAbWWUUzr8rI0Yvlu7rh5Y
	zkjpQkdTgDebxpNVl8Biqyoq03vOOsfk/Ca8aia0Olkqw2ZFqvEGLNXNZ+6S/zlgcu28+ebRNzT
	YrQAa1hVeSR/KIXuL1PO7xs17DdKYYxMSKx5OnJZMdlAIVQu1rzGd9vy2N+Z2Uea9Lx/+E5+IIR
	sxSRpfvnclfLI/4qLLJGwmNiY+wcMj9hgJhIGkgwaHo45o3nayEf4um/PgBUe/wT4wcUsOU4cxZ
	S9+FjA/cdHG/vll9BDGCBSxW2Fs9K0CvrwlKPPgPSh4JpBIIGG8z/c9Mnadol5EOKgUxicIAUQz
	rtwjSg5Nbih4OAjFifALV0e9nknJK63TeYBbKfXs2ZohRNu3isrTIdLncsWmJFrImhIXvD8y95P
	i3tXkJ4FSyGaSBHX27hvbJWuXw5+SNeQ7JLEgF1fFLPyI=
X-Received: by 2002:a17:90b:2648:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-367d46b8be5mr9758495a91.8.1778506583435;
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::30f3])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367be3daafesm3034326a91.8.2026.05.11.06.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:36:23 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 00/10] riscv: hwprobe: Expose RVA23U64 base behavior
Date: Mon, 11 May 2026 21:34:45 -0400
Message-Id: <20260511-rva23u64-hwprobe-v2-v2-0-21c5a544f1dc@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALaDAmoC/yXMPQ6DMAxA4asgz1hKzW+5StWBBAPuAMiBtBLi7
 qQwfsN7O3hWYQ9NsoNyEC/zFEFpAm5sp4FRumggQ6UpTI0aWsq2Msfxu+hsGQPhoyNTZU9nbc0
 Qy0W5l991fb1v+81+2K3/FRzHCXxjjPl3AAAA
X-Change-ID: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>, 
 Deepak Gupta <debug@rivosinc.com>, Zong Li <zong.li@sifive.com>, 
 Christian Brauner <brauner@kernel.org>
Cc: Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Samuel Holland <samuel.holland@sifive.com>, linux-doc@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Guodong Xu <guodong@riscstar.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_063626_321298_C93BE418 
X-CRM114-Status: GOOD (  13.12  )
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

This series builds on Andrew Jones's earlier RFC [1]. It lets
userspace check for RVA23U64 conformance in one call, instead of
walking hwprobe + prctl across every mandatory extension.

The series adds a small framework that resolves profile-class
bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
init time, and surfaces the result through both /proc/cpuinfo and
hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
detection, to riscv_set_isa_bases() without changes to the
surrounding code.

To detect RVA23U64 the kernel first has to recognise every extension
it mandates, so patches 4-6 bring Zicclsm; Ziccamoa, Ziccif,
Ziccrse, Za64rs; and B into the cpufeature parser. The framework
then reads the resulting bitmap, and the final patch exposes the
RVA23U64 bit through RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Series outline:

  1-3. hwprobe.rst clean-ups: document EXT_ZICFISS, normalize
       indentation, and standardize extension capitalization.

   4.  Zicclsm: cpufeature parsing + hwprobe export.
   5.  Ziccamoa, Ziccif, Ziccrse, Za64rs: cpufeature parsing + hwprobe
       export, with cpufeature dependency validation for
       Ziccamoa->Zaamo and Za64rs->Zalrsc.
   6.  B (hwcap + hwprobe), as the Zba/Zbb/Zbs set.

   7.  riscv_have_user_pmlen(): arch-level accessor for user
       pointer-masking PMLEN support, used by RVA23U64 detection.

   8.  cpufeature: per-hart and host-wide isa_bases bitmaps,
       populated at init time. IMA and RVA23U64 detection lives
       here; /proc/cpuinfo and hwprobe both read from these bitmaps.

   9.  /proc/cpuinfo: print "isa bases" / "hart isa bases" lines
       sourced from the cached bitmaps.

  10.  hwprobe: expose RVA23U64 via
       RISCV_HWPROBE_BASE_BEHAVIOR_RVA23U64.

Tested on qemu booted with -cpu rva23s64,sv39=on,pmp=on:
  - /proc/cpuinfo reports "isa bases : rv64ima rva23u64" on both the
    aggregated and per-hart lines.
  - hwprobe RISCV_HWPROBE_KEY_BASE_BEHAVIOR returns
    BASE_BEHAVIOR_IMA | BASE_BEHAVIOR_RVA23U64.

Based on v7.2-rc2; happy to rebase onto another tree if needed.

Link: https://lore.kernel.org/linux-riscv/20260206002349.96740-1-andrew.jones@oss.qualcomm.com/ [1]

BR,
Guodong Xu

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Andrew Jones (4):
      riscv: hwprobe.rst: Replace tabs with spaces
      riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
      riscv: Add B to hwcap and hwprobe
      riscv: Add a getter for user PMLEN support

Charlie Jenkins (1):
      riscv: Standardize extension capitalization

Guodong Xu (4):
      riscv: hwprobe.rst: Document EXT_ZICFISS
      riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
      riscv: cpu: Output isa bases lines in cpuinfo
      riscv: hwprobe: Introduce rva23u64 base behavior

Jesse Taube (1):
      riscv: Add Zicclsm to cpufeature and hwprobe

 Documentation/arch/riscv/hwprobe.rst               |  46 +++++-
 arch/riscv/include/asm/cpufeature.h                |  14 ++
 arch/riscv/include/asm/hwcap.h                     |  23 +--
 arch/riscv/include/asm/processor.h                 |   4 +
 arch/riscv/include/asm/switch_to.h                 |   4 +-
 arch/riscv/include/uapi/asm/hwcap.h                |   1 +
 arch/riscv/include/uapi/asm/hwprobe.h              |   9 +-
 arch/riscv/kernel/cpu.c                            |  26 ++++
 arch/riscv/kernel/cpufeature.c                     | 154 ++++++++++++++++++---
 arch/riscv/kernel/process.c                        |  12 ++
 arch/riscv/kernel/sys_hwprobe.c                    |  33 +++--
 arch/riscv/kvm/isa.c                               |  16 +--
 arch/riscv/kvm/main.c                              |   2 +-
 arch/riscv/kvm/vcpu_fp.c                           |  20 +--
 arch/riscv/kvm/vcpu_onereg.c                       |   6 +-
 arch/riscv/kvm/vcpu_vector.c                       |  10 +-
 tools/testing/selftests/riscv/hwprobe/which-cpus.c |   2 +-
 17 files changed, 312 insertions(+), 70 deletions(-)
---
base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
change-id: 20260508-rva23u64-hwprobe-v2-1d20739cbb8e

Best regards,
--  
Guodong Xu <guodong@riscstar.com>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
