Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9B1C5B543
	for <kvm-riscv@archiver.kernel.org>; Wed,  4 Jun 2025 20:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ADdTGF3+tglOcQ4bz2mlB+ikYoOXzFhgIXOerXtNKCk=; b=ntuWhECqPpj0L8
	H7DT3HkmZfNrYijdRCVD7n9uDjaxL75jJCB9YlhTwQdxHBwSqxFgyl7IRSQgIb9nv6v+mQoz4qv+G
	9EFUBACsKycr6+jfNwkf6bVgpeht30F5NKLu5Mlhro9PtrowdmClWgakSuYC2b1ocnGfljWxSH1T2
	IRqmCKduut3blQW3s7x01x8M/6ic9BEVsKDAkKXU1xAKy2CHPVSsIBawQISYIFbLeroDmzMB/gFAk
	i+CnDb92QxSalydOVvm6K5k9efUswZ+9qHSAml/fQZvWvk3dqiZz+sRbyvOj8TVCIvIbWZkOwoa+D
	ofqkyDXn5IXZWlopC3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMuxY-0000000ECrX-2p9F;
	Wed, 04 Jun 2025 20:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtqi-0000000E5uZ-1scw
	for kvm-riscv@bombadil.infradead.org;
	Wed, 04 Jun 2025 19:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NX/Z2ZCFXvF2DvUI6aHShSd2vbVmdhiwIYLPP28K2UE=; b=eeX3KWxHtqIw9GpAEgHE9nk5hL
	d/92ane67tEyj44xqgzCQkRF+UAcLhUSAqWiK3PbUUBPlGIxgNf0GUqFQ3157xr1J5v0LAfCP91fN
	AZiAJH1+Epdbjz2s6rqbFW6i1jCUZWM05QCgfdkDTOfjZDM+RE04e+TIirwW8gL75bSY+K9kx0BSK
	N34cQOkdpscFwFIFMaMfJg183JNZytFPa0+H+9UEg++xnrm1iPBWHpGJc5dtP0vaRuiw3TVd8PD8k
	roIIyt1yLc0ivI1uBemm1gIdZn2sMWCmPyDtJXeEnzOWdK5v4VCqmebj/cMRyHFKBHlfIJvCcypHu
	zNxw//CA==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMtqe-00000000zfa-0kyW
	for kvm-riscv@lists.infradead.org;
	Wed, 04 Jun 2025 19:32:30 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b1fde81de05so93781a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 04 Jun 2025 12:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1749065544; x=1749670344; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NX/Z2ZCFXvF2DvUI6aHShSd2vbVmdhiwIYLPP28K2UE=;
        b=2m4JsvE/LnJfq7KL5ja0+6a4Zt54PzTYgh+YDfHDtPji26h6fAnPB/q6NOhZu9yonD
         Z0MJUvz5crWnaQ7P572USJ8d5fixqGMqhlvi9Ob82Bmmg3xxdksr1ZOHhQkypLw2FbFy
         ek1CtsmteKin0x2kxcEH2yu4volATgqz7sIQugTT1exNn+ybgOzvbYFhbwPjFoEUPvTD
         zMj5ZbMzXynit6AVok0bN0LFgm8XzEQBAd5IKNgpAEdhlmNDmA0wKMNnKRSiuTOaZefR
         aksITegeS9wYmt2rE9SM+4Ds8jh1u2dcnlUgMgn/twB/JwlbKQp8S54LyrK4HS9NOJAO
         j/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749065544; x=1749670344;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NX/Z2ZCFXvF2DvUI6aHShSd2vbVmdhiwIYLPP28K2UE=;
        b=XOjozcxPPCaKvsTH11uKWn1NRS0fiPYFfcOfxzdmbyY6otC5fYM8QOFwit2rlX5qwT
         YlLt1e4GkVn92sDRYAukhugY3c5fJY2mfV1B87W1vnxyAkZfp0dQcrAbyGvzFUO89Esv
         o73/FD9M9c0jsfcrwtzljOyTNL4IjwZDCwPQZlvBzFSIVxJylo/d8tc3ZuOtLfEBPS7Z
         17zpyxlemz1n0dSROwOglImsWpu0bAw6vjydf1hhNps5fOg8dt5eBuSOORBxxfCczUR5
         ef4fAUM8PEnmCvQ+8PRS2ntcrrKJyhpCLlS7jVbDttoRrfzG3Dh8HS0czMfEy6E/kQ9q
         cOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWNA62E/djTItSPsHXtlUQbjuq7LLD0ZongYrOd1ipLL+x8f21JYXD0GrqpPmFg5ZVvSe/F3RBbgbo=@lists.infradead.org
X-Gm-Message-State: AOJu0YwXfZRtYYC7BqEslX1eA6q0YVeRbdMVJRt5UPYAax4Dj9ylMjhn
	HGHe2Adwza6bJge1sILj8njjxoejdbAX+vnLtimjqWl3F3Tb8CovUmbwKgD/VqAGwAo=
X-Gm-Gg: ASbGncv1c/hQeFft5+1q9f1xYy3zLM+4gSzvUfvzRL/9g15JdtWbsLMGs8UEu3310P7
	a2B4wHAI7ZPXM56WnpFwpUHSMuPRaLZw50SzHgOQl/vyDZ9nud7sbvaGzTJKD6U8eMuWivxeAoC
	I7083wGwqbr9u+HPa+Un2McznA/dBn9gAM+RMSz9VYdFt+61BvXyPOi2aygOB/7rYJ3VTRi58mI
	6P4YylFNFYqD8eEo3tg1YOG+wV7k/Edy4tAvvlfz57WDUteLsILZPoilSFH7phAHnZdhptACKLE
	Vepn8yYNZ6Fyd9jW5AEJaMTGqMePsa+XBobtTR3fDQ==
X-Google-Smtp-Source: AGHT+IFLeN5tBysOV9rnQFTJ45qBsmpEqs3WhKfupnGpcc7ue7whOvYTzRW3AaxeC9M+Me0Ca9V3Ig==
X-Received: by 2002:a17:90b:1e07:b0:2fe:e9c6:689e with SMTP id 98e67ed59e1d1-31310fff2d3mr4850333a91.8.1749065543993;
        Wed, 04 Jun 2025 12:32:23 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132bff67ddsm39458a91.2.2025.06.04.12.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 12:32:23 -0700 (PDT)
Date: Wed, 4 Jun 2025 12:32:21 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: cleger@rivosinc.com, Paul Walmsley <paul.walmsley@sifive.com>,
	anup@brainfault.org, atishp@atishpatra.org, shuah@kernel.org,
	corbet@lwn.net, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org, samuel.holland@sifive.com,
	ajones@ventanamicro.com, debug@rivosinc.com
Subject: Re: [PATCH v8 00/14] riscv: add SBI FWFT misaligned exception
 delegation support
Message-ID: <aECfReNdxc1ERz6K@ghost>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
 <mhng-C1CE13EE-C4E6-490D-ABF4-CE7BD84737C3@palmerdabbelt-mac>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-C1CE13EE-C4E6-490D-ABF4-CE7BD84737C3@palmerdabbelt-mac>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_203228_672024_6FFBA71F 
X-CRM114-Status: GOOD (  35.24  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 04, 2025 at 11:02:35AM -0700, Palmer Dabbelt wrote:
> On Fri, 23 May 2025 03:19:17 PDT (-0700), cleger@rivosinc.com wrote:
> > The SBI Firmware Feature extension allows the S-mode to request some
> > specific features (either hardware or software) to be enabled. This
> > series uses this extension to request misaligned access exception
> > delegation to S-mode in order to let the kernel handle it. It also adds
> > support for the KVM FWFT SBI extension based on the misaligned access
> > handling infrastructure.
> > =

> > FWFT SBI extension is part of the SBI V3.0 specifications [1]. It can be
> > tested using the qemu provided at [2] which contains the series from
> > [3]. Upstream kvm-unit-tests can be used inside kvm to tests the correct
> > delegation of misaligned exceptions. Upstream OpenSBI can be used.
> > =

> > Note: Since SBI V3.0 is not yet ratified, FWFT extension API is split
> > between interface only and implementation, allowing to pick only the
> > interface which do not have hard dependencies on SBI.
> > =

> > The tests can be run using the kselftest from series [4].
> > =

> > $ qemu-system-riscv64 \
> > 	-cpu rv64,trap-misaligned-access=3Dtrue,v=3Dtrue \
> > 	-M virt \
> > 	-m 1024M \
> > 	-bios fw_dynamic.bin \
> > 	-kernel Image
> >  ...
> > =

> >  # ./misaligned
> >  TAP version 13
> >  1..23
> >  # Starting 23 tests from 1 test cases.
> >  #  RUN           global.gp_load_lh ...
> >  #            OK  global.gp_load_lh
> >  ok 1 global.gp_load_lh
> >  #  RUN           global.gp_load_lhu ...
> >  #            OK  global.gp_load_lhu
> >  ok 2 global.gp_load_lhu
> >  #  RUN           global.gp_load_lw ...
> >  #            OK  global.gp_load_lw
> >  ok 3 global.gp_load_lw
> >  #  RUN           global.gp_load_lwu ...
> >  #            OK  global.gp_load_lwu
> >  ok 4 global.gp_load_lwu
> >  #  RUN           global.gp_load_ld ...
> >  #            OK  global.gp_load_ld
> >  ok 5 global.gp_load_ld
> >  #  RUN           global.gp_load_c_lw ...
> >  #            OK  global.gp_load_c_lw
> >  ok 6 global.gp_load_c_lw
> >  #  RUN           global.gp_load_c_ld ...
> >  #            OK  global.gp_load_c_ld
> >  ok 7 global.gp_load_c_ld
> >  #  RUN           global.gp_load_c_ldsp ...
> >  #            OK  global.gp_load_c_ldsp
> >  ok 8 global.gp_load_c_ldsp
> >  #  RUN           global.gp_load_sh ...
> >  #            OK  global.gp_load_sh
> >  ok 9 global.gp_load_sh
> >  #  RUN           global.gp_load_sw ...
> >  #            OK  global.gp_load_sw
> >  ok 10 global.gp_load_sw
> >  #  RUN           global.gp_load_sd ...
> >  #            OK  global.gp_load_sd
> >  ok 11 global.gp_load_sd
> >  #  RUN           global.gp_load_c_sw ...
> >  #            OK  global.gp_load_c_sw
> >  ok 12 global.gp_load_c_sw
> >  #  RUN           global.gp_load_c_sd ...
> >  #            OK  global.gp_load_c_sd
> >  ok 13 global.gp_load_c_sd
> >  #  RUN           global.gp_load_c_sdsp ...
> >  #            OK  global.gp_load_c_sdsp
> >  ok 14 global.gp_load_c_sdsp
> >  #  RUN           global.fpu_load_flw ...
> >  #            OK  global.fpu_load_flw
> >  ok 15 global.fpu_load_flw
> >  #  RUN           global.fpu_load_fld ...
> >  #            OK  global.fpu_load_fld
> >  ok 16 global.fpu_load_fld
> >  #  RUN           global.fpu_load_c_fld ...
> >  #            OK  global.fpu_load_c_fld
> >  ok 17 global.fpu_load_c_fld
> >  #  RUN           global.fpu_load_c_fldsp ...
> >  #            OK  global.fpu_load_c_fldsp
> >  ok 18 global.fpu_load_c_fldsp
> >  #  RUN           global.fpu_store_fsw ...
> >  #            OK  global.fpu_store_fsw
> >  ok 19 global.fpu_store_fsw
> >  #  RUN           global.fpu_store_fsd ...
> >  #            OK  global.fpu_store_fsd
> >  ok 20 global.fpu_store_fsd
> >  #  RUN           global.fpu_store_c_fsd ...
> >  #            OK  global.fpu_store_c_fsd
> >  ok 21 global.fpu_store_c_fsd
> >  #  RUN           global.fpu_store_c_fsdsp ...
> >  #            OK  global.fpu_store_c_fsdsp
> >  ok 22 global.fpu_store_c_fsdsp
> >  #  RUN           global.gen_sigbus ...
> >  [12797.988647] misaligned[618]: unhandled signal 7 code 0x1 at 0x00000=
00000014dc0 in misaligned[4dc0,10000+76000]
> >  [12797.988990] CPU: 0 UID: 0 PID: 618 Comm: misaligned Not tainted 6.1=
3.0-rc6-00008-g4ec4468967c9-dirty #51
> >  [12797.989169] Hardware name: riscv-virtio,qemu (DT)
> >  [12797.989264] epc : 0000000000014dc0 ra : 0000000000014d00 sp : 00007=
fffe165d100
> >  [12797.989407]  gp : 000000000008f6e8 tp : 0000000000095760 t0 : 00000=
00000000008
> >  [12797.989544]  t1 : 00000000000965d8 t2 : 000000000008e830 s0 : 00007=
fffe165d160
> >  [12797.989692]  s1 : 000000000000001a a0 : 0000000000000000 a1 : 00000=
00000000002
> >  [12797.989831]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : fffff=
fffdeadbeef
> >  [12797.989964]  a5 : 000000000008ef61 a6 : 626769735f6e0000 a7 : fffff=
ffffffff000
> >  [12797.990094]  s2 : 0000000000000001 s3 : 00007fffe165d838 s4 : 00007=
fffe165d848
> >  [12797.990238]  s5 : 000000000000001a s6 : 0000000000010442 s7 : 00000=
00000010200
> >  [12797.990391]  s8 : 000000000000003a s9 : 0000000000094508 s10: 00000=
00000000000
> >  [12797.990526]  s11: 0000555567460668 t3 : 00007fffe165d070 t4 : 00000=
000000965d0
> >  [12797.990656]  t5 : fefefefefefefeff t6 : 0000000000000073
> >  [12797.990756] status: 0000000200004020 badaddr: 000000000008ef61 caus=
e: 0000000000000006
> >  [12797.990911] Code: 8793 8791 3423 fcf4 3783 fc84 c737 dead 0713 eef7=
 (c398) 0001
> >  #            OK  global.gen_sigbus
> >  ok 23 global.gen_sigbus
> >  # PASSED: 23 / 23 tests passed.
> >  # Totals: pass:23 fail:0 xfail:0 xpass:0 skip:0 error:0
> > =

> > With kvm-tools:
> > =

> >  # lkvm run -k sbi.flat -m 128
> >   Info: # lkvm run -k sbi.flat -m 128 -c 1 --name guest-97
> >   Info: Removed ghost socket file "/root/.lkvm//guest-97.sock".
> > =

> >  ######################################################################=
####
> >  #    kvm-unit-tests
> >  ######################################################################=
####
> > =

> >  ... [test messages elided]
> >  PASS: sbi: fwft: FWFT extension probing no error
> >  PASS: sbi: fwft: get/set reserved feature 0x6 error =3D=3D SBI_ERR_DEN=
IED
> >  PASS: sbi: fwft: get/set reserved feature 0x3fffffff error =3D=3D SBI_=
ERR_DENIED
> >  PASS: sbi: fwft: get/set reserved feature 0x80000000 error =3D=3D SBI_=
ERR_DENIED
> >  PASS: sbi: fwft: get/set reserved feature 0xbfffffff error =3D=3D SBI_=
ERR_DENIED
> >  PASS: sbi: fwft: misaligned_deleg: Get misaligned deleg feature no err=
or
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature invali=
d value error
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature invali=
d value error
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature value =
no error
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature value 0
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature value =
no error
> >  PASS: sbi: fwft: misaligned_deleg: Set misaligned deleg feature value 1
> >  PASS: sbi: fwft: misaligned_deleg: Verify misaligned load exception tr=
ap in supervisor
> >  SUMMARY: 50 tests, 2 unexpected failures, 12 skipped
> > =

> > This series is available at [5].
> > =

> > Link: https://github.com/riscv-non-isa/riscv-sbi-doc/releases/download/=
vv3.0-rc2/riscv-sbi.pdf [1]
> > Link: https://github.com/rivosinc/qemu/tree/dev/cleger/misaligned [2]
> > Link: https://lore.kernel.org/all/20241211211933.198792-3-fkonrad@amd.c=
om/T/ [3]
> > Link: https://lore.kernel.org/linux-riscv/20250414123543.1615478-1-cleg=
er@rivosinc.com [4]
> > Link: https://github.com/rivosinc/linux/tree/dev/cleger/fwft [5]
> > ---
> > =

> > V8:
> >  - Move misaligned_access_speed under CONFIG_RISCV_MISALIGNED and add a
> >    separate commit for that.
> > =

> > V7:
> >  - Fix ifdefery build problems
> >  - Move sbi_fwft_is_supported with fwft_set_req struct
> >  - Added Atish Reviewed-by
> >  - Updated KVM vcpu cfg hedeleg value in set_delegation
> >  - Changed SBI ETIME error mapping to ETIMEDOUT
> >  - Fixed a few typo reported by Alok
> > =

> > V6:
> >  - Rename FWFT interface to remove "_local"
> >  - Fix test for MEDELEG values in KVM FWFT support
> >  - Add __init for unaligned_access_init()
> >  - Rebased on master
> > =

> > V5:
> >  - Return ERANGE as mapping for SBI_ERR_BAD_RANGE
> >  - Removed unused sbi_fwft_get()
> >  - Fix kernel for sbi_fwft_local_set_cpumask()
> >  - Fix indentation for sbi_fwft_local_set()
> >  - Remove spurious space in kvm_sbi_fwft_ops.
> >  - Rebased on origin/master
> >  - Remove fixes commits and sent them as a separate series [4]
> > =

> > V4:
> >  - Check SBI version 3.0 instead of 2.0 for FWFT presence
> >  - Use long for kvm_sbi_fwft operation return value
> >  - Init KVM sbi extension even if default_disabled
> >  - Remove revert_on_fail parameter for sbi_fwft_feature_set().
> >  - Fix comments for sbi_fwft_set/get()
> >  - Only handle local features (there are no globals yet in the spec)
> >  - Add new SBI errors to sbi_err_map_linux_errno()
> > =

> > V3:
> >  - Added comment about kvm sbi fwft supported/set/get callback
> >    requirements
> >  - Move struct kvm_sbi_fwft_feature in kvm_sbi_fwft.c
> >  - Add a FWFT interface
> > =

> > V2:
> >  - Added Kselftest for misaligned testing
> >  - Added get_user() usage instead of __get_user()
> >  - Reenable interrupt when possible in misaligned access handling
> >  - Document that riscv supports unaligned-traps
> >  - Fix KVM extension state when an init function is present
> >  - Rework SBI misaligned accesses trap delegation code
> >  - Added support for CPU hotplugging
> >  - Added KVM SBI reset callback
> >  - Added reset for KVM SBI FWFT lock
> >  - Return SBI_ERR_DENIED_LOCKED when LOCK flag is set
> > =

> > Cl=E9ment L=E9ger (14):
> >   riscv: sbi: add Firmware Feature (FWFT) SBI extensions definitions
> >   riscv: sbi: remove useless parenthesis
> >   riscv: sbi: add new SBI error mappings
> >   riscv: sbi: add FWFT extension interface
> >   riscv: sbi: add SBI FWFT extension calls
> >   riscv: misaligned: request misaligned exception from SBI
> >   riscv: misaligned: use on_each_cpu() for scalar misaligned access
> >     probing
> >   riscv: misaligned: declare misaligned_access_speed under
> >     CONFIG_RISCV_MISALIGNED
> >   riscv: misaligned: move emulated access uniformity check in a function
> >   riscv: misaligned: add a function to check misalign trap delegability
> >   RISC-V: KVM: add SBI extension init()/deinit() functions
> >   RISC-V: KVM: add SBI extension reset callback
> >   RISC-V: KVM: add support for FWFT SBI extension
> >   RISC-V: KVM: add support for SBI_FWFT_MISALIGNED_DELEG
> > =

> >  arch/riscv/include/asm/cpufeature.h        |  14 +-
> >  arch/riscv/include/asm/kvm_host.h          |   5 +-
> >  arch/riscv/include/asm/kvm_vcpu_sbi.h      |  12 +
> >  arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h |  29 +++
> >  arch/riscv/include/asm/sbi.h               |  60 +++++
> >  arch/riscv/include/uapi/asm/kvm.h          |   1 +
> >  arch/riscv/kernel/sbi.c                    |  81 ++++++-
> >  arch/riscv/kernel/traps_misaligned.c       | 112 ++++++++-
> >  arch/riscv/kernel/unaligned_access_speed.c |   8 +-
> >  arch/riscv/kvm/Makefile                    |   1 +
> >  arch/riscv/kvm/vcpu.c                      |   4 +-
> >  arch/riscv/kvm/vcpu_sbi.c                  |  54 +++++
> >  arch/riscv/kvm/vcpu_sbi_fwft.c             | 257 +++++++++++++++++++++
> >  arch/riscv/kvm/vcpu_sbi_sta.c              |   3 +-
> >  14 files changed, 620 insertions(+), 21 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/kvm_vcpu_sbi_fwft.h
> >  create mode 100644 arch/riscv/kvm/vcpu_sbi_fwft.c
> =

> Sorry I'm still kind of out of it here, but I think Alex was saying this =
has
> dependencies in the patchwork call this morning?

The "dependency" is that the kvm tree will not accept patches this late.
The KVM patches can be dropped and the riscv patches can be merged, but
it is pretty late now.

- Charlie


-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
