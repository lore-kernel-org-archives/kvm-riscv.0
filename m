Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F1C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RgX7dPxilvQsWdwQrDmDbFhnxHgKkyfyTxOQQsCIfoY=; b=SLBywktLpgAKpf
	EaqtDdbeqZ+AnQK3OTBkOxFenA5ocOa5ygBOGiwtACwb3V2dQX+OnJbw3KF0Z4LUiDC87mkCepYpj
	p5L3ZyL9wtlRfy/FTSyZW7bS+i10UtPOeO1aufQb13yCRB+gyOtcZD5Uc3KGi6ggdXnShpgnLkfeW
	jKX5ex4InF9fJAjpToHhNIOLzgLrRzOdRvQ6R5lMwJICtXjfUfwjP+SDaBr2/4IwUXP2tRU8ueLKA
	A+IxhrQOo9rhoxORAjZ5jSc85GD91IiyodkMjYDOCUKOdBVtu4o7zBtjo/6iOSETARJcxyGqu/GU9
	/z5tjBe8conwASw3Z+hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMjn-0000000GVjD-09kZ;
	Wed, 08 Jul 2026 07:30:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMjl-0000000GViz-1FtY;
	Wed, 08 Jul 2026 07:30:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D1F9601D9;
	Wed,  8 Jul 2026 07:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3D21F00A3A;
	Wed,  8 Jul 2026 07:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783495828;
	bh=6XPCFtqPmjIBOfArNEHzU0v8CdudEoKzUfONk1mxyWs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=KwqlhTDaQqRylyKDCQc64J/xr0ZZUKLtdJ0u//WfIwq01nHTSJc9ZbSmfhk+5Csmv
	 7PcMLRDYbGYCbJGFvsWGEIxgn6twSeIUnY/IVcHt/hqJFmsjV3B+Dw5xpxf1pjYB6P
	 yePp4LiNzte683pBkGJZ8dKsnoAP4ycLLk+bsnQc4MAu4kr/u1AwhDpvfR73nebWGG
	 Z5Gi6fYgoiDkKNDAMw/Bd3rXsHKZZXiP/m7kI03ynStt3Vw4jsOjwHGtDIMElfASLY
	 crnEPX04QPhKnEwnlAUlTYQ5pNiF04+Rdlf7/uQfbRhSBxahJDfA3pSJqT7wEkyYFZ
	 i0oLb+JsvykwQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0AB53926257;
	Wed,  8 Jul 2026 07:30:08 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v5 00/17] riscv: hwprobe: Expose RVA23U64 base behavior
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <178349580738.2343578.10382638352162559486.git-patchwork-notify@kernel.org>
Date: Wed, 08 Jul 2026 07:30:07 +0000
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: linux-riscv@lists.infradead.org, corbet@lwn.net,
 skhan@linuxfoundation.org, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, zong.li@sifive.com, debug@rivosinc.com,
 anup@brainfault.org, atish.patra@linux.dev, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, dlan@kernel.org,
 unicorn_wang@outlook.com, inochiama@gmail.com, chen.wang@linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, paul.walmsley@sifive.com, conor@kernel.org,
 jtaubepe@redhat.com, thecharlesjenkins@gmail.com,
 andrew.jones@oss.qualcomm.com, devicetree@vger.kernel.org,
 spacemit@lists.linux.dev, sophgo@lists.linux.dev,
 linux-kselftest@vger.kernel.org, conor.dooley@microchip.com,
 charlie@rivosinc.com, jesse@rivosinc.com, qingwei.hu@bytedance.com,
 andybnac@gmail.com
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 01 Jul 2026 08:52:13 -0400 you wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets userspace
> check for RVA23U64 conformance in one call, instead of walking hwprobe +
> prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class bases (IMA
> and RVA23U64) from the kernel's ISA extension bitmap at init time, and
> surfaces the result through both /proc/cpuinfo and hwprobe. Later patches
> can add RVA23S64, and backward RVA22 / RVA20 detection, to
> riscv_set_isa_bases() without changes to the surrounding code.
> 
> [...]

Here is the summary with links:
  - [v5,01/17] dt-bindings: riscv: sort multi-letter Z extensions alphanumerically
    https://git.kernel.org/riscv/c/e0776dde101a
  - [v5,02/17] riscv: hwprobe.rst: Make indentation consistent
    https://git.kernel.org/riscv/c/dbff3646369c
  - [v5,03/17] riscv: hwprobe.rst: Document EXT_ZICFISS and EXT_ZICFILP
    https://git.kernel.org/riscv/c/a914034334c4
  - [v5,04/17] riscv: Standardize extension capitalization
    (no matching commit)
  - [v5,05/17] riscv: Add Zicclsm to cpufeature and hwprobe
    (no matching commit)
  - [v5,06/17] riscv: Add Ziccamoa, Ziccif, Ziccrse, and Za64rs to cpufeature and hwprobe
    (no matching commit)
  - [v5,07/17] riscv: Add B to hwcap and hwprobe
    (no matching commit)
  - [v5,08/17] dt-bindings: riscv: Require block-size for Zicbom, Zicbop, and Zicboz
    (no matching commit)
  - [v5,09/17] dt-bindings: riscv: Add Zic64b extension description
    (no matching commit)
  - [v5,10/17] riscv: Add Zic64b to cpufeature and hwprobe
    (no matching commit)
  - [v5,11/17] riscv: dts: spacemit: k3: Add Zic64b ISA extension
    (no matching commit)
  - [v5,12/17] riscv: dts: spacemit: k1: Add Zic64b ISA extension
    (no matching commit)
  - [v5,13/17] riscv: dts: sophgo: sg2044: Add Zic64b ISA extension
    (no matching commit)
  - [v5,14/17] riscv: Add a getter for user PMLEN support
    (no matching commit)
  - [v5,15/17] riscv: cpufeature: Introduce ISA bases bitmap and rva23u64 detection
    (no matching commit)
  - [v5,16/17] riscv: cpu: Output isa bases lines in cpuinfo
    (no matching commit)
  - [v5,17/17] riscv: hwprobe: Introduce rva23u64 base behavior
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
