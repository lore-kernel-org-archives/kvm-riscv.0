Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1C8C36010
	for <kvm-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IF5q9m7ZEiw5TDG/EM/E853pGlMzgXxX2qkRwkkzEk=; b=hFXaujZ5cpM7Cx
	cRU+h6vJ8kS3pV0KVUGiTWpvRhzb7cJbXok6wYU2g/+c0/FfVG5WOq8D9WJ/IROjUtdTaqDUlDabp
	2Coga7ZEVnWOnQONPiN21lACNtnc6TF740rNxGgEbV0AT4CfAORJbKHlvtbzUQve70TUMnKd/3cu3
	F5CNBnSeXdEguu/H3yzsfttbfTQF5B4BD7Xd8ImCSTE1zc/QehMAi4+UTI89JBbAKczjqrXEzk3kP
	dhaSUMe8c8NBg/1Mr2VSRZ5CqB3o6shJ4Q78PH8gxPJZ5DJxs8j5LfvWHlIRFfYgUCoU2zIesW0ds
	I7h9eNnuGWaDkXxwMVSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hY9-0000000Bucl-0oV2;
	Fri, 04 Apr 2025 13:57:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hQZ-0000000Bt1u-0LnV;
	Fri, 04 Apr 2025 13:49:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E642E614BA;
	Fri,  4 Apr 2025 13:49:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E89C4CEDD;
	Fri,  4 Apr 2025 13:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743774586;
	bh=InZ0uos7yT9Kf1hkWBsUYLcrp43412OOZl/bw7DO4Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USi10D+naSHmsOpLEbclvvoUV8OCZArB3n9xpGD99on1UMZaLkaUh+brOpqRUHjUM
	 z0XibKT/P/RSxfymt/L40cXSF8H9LKoNMf1OFTMr2U3NQCMAR2Ux6Hm3enCUZmWiNX
	 3VMeGo/FM5zIrC468kOaLBCkZyOEsCxCJ1pPuSBWPFOVfilk0ZeJkRltCqUO5YRa0R
	 4uhZNjLKNaCACgVmbORjBmkJlsqgdEBlTEA1QHIUiVg/sY8PhuaW1352AymUDAS/jD
	 TIwikh2QEHHjedoxXiB3TpY2lpVaofO50dMmp1j9XakRekMytpGDUvOeLbL8RA9l7S
	 F9qLsRuerEHMw==
Date: Fri, 4 Apr 2025 14:49:38 +0100
From: Will Deacon <will@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>
Subject: Re: [PATCH v5 11/21] RISC-V: perf: Restructure the SBI PMU code
Message-ID: <20250404134937.GA29394@willie-the-truck>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
 <20250327-counter_delegation-v5-11-1ee538468d1b@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250327-counter_delegation-v5-11-1ee538468d1b@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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

On Thu, Mar 27, 2025 at 12:35:52PM -0700, Atish Patra wrote:
> With Ssccfg/Smcdeleg, we no longer need SBI PMU extension to program/
> access hpmcounter/events. However, we do need it for firmware counters.
> Rename the driver and its related code to represent generic name
> that will handle both sbi and ISA mechanism for hpmcounter related
> operations. Take this opportunity to update the Kconfig names to
> match the new driver name closely.
> =

> No functional change intended.
> =

> Reviewed-by: Cl=E9ment L=E9ger <cleger@rivosinc.com>
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  MAINTAINERS                                       |   4 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h             |   4 +-
>  arch/riscv/include/asm/kvm_vcpu_sbi.h             |   2 +-
>  arch/riscv/kvm/Makefile                           |   4 +-
>  arch/riscv/kvm/vcpu_sbi.c                         |   2 +-
>  drivers/perf/Kconfig                              |  16 +-
>  drivers/perf/Makefile                             |   4 +-
>  drivers/perf/{riscv_pmu.c =3D> riscv_pmu_common.c}  |   0
>  drivers/perf/{riscv_pmu_sbi.c =3D> riscv_pmu_dev.c} | 214 +++++++++++++-=
--------

I'm still against this renaming churn. It sucks for backporting and
you're also changing the name of the driver, which could be used by
scripts in userspace (e.g. module listings, udev rules, cmdline options)

Will

-- =

kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
