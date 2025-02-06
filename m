Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CEEC02194
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 10:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bETKTjLBGP+rLEfMX6OnZ+uyqVzsd7ieWD6soBiuS1w=; b=eb1EhaXcWJ0aVo
	l0ywTjl+4MBw+rNEh03mVJ7k5ei7dGofqalTuAxcXksJ+4gUIezdHo+aYFYmFXHwHyNSxq9VXY1ZT
	HQTmCcW+NaNerkCn5/9yBBFpWwe/sEuKVfVU/b47Te0T32L1tzk1iIszJZl7DphF4/mNBxKvvLh5O
	0DVG30/OEr27k+1S1hiGcfcbdQSs0rKuDVIo02hfaHtY6IbzWShHpM9JprKBqpu5SNQB8LvV7OCGo
	Ze1F1WCye7t8CUF8ftaiZgpY/4lLjURXkStBuExcRmIsakc/5TxH2V0I18e+V8XXm6GSCYp1JhxDe
	w84IMGhQ5q3gLggopiCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzTV-0000000618A-0GNx;
	Thu, 06 Feb 2025 10:51:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfzTS-0000000617P-3J5N;
	Thu, 06 Feb 2025 10:51:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EBD3C5C1850;
	Thu,  6 Feb 2025 10:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C4F4C4CEDD;
	Thu,  6 Feb 2025 10:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738839069;
	bh=BAc/DzaeLywP5/G7nSsTgMS/1oP0U4tjnQ8klgx+HLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KdGg+q3XY0ZrBG5LQlQYmL7B3IpBT4V4qnZ7GHv5wEEx3b7Dr57ydkhDbFb5j3mwX
	 tg6DhXoiHPjM0CDTr4gCjDdh+sIAUu9zc5Nb8aUXhAbZAAWpxn1f4d1qUkv05VWWUn
	 MneCpfPJ3pH1tjVEASi7nDe6fkdz9Obkl4r9LiIsI7tfP7Z+NQevktY8zUigTG59uK
	 KZMsb5jop8HVBJLbc90MuAsOc/c7QzCIkoJgEw/kYWfbjiPVyvo8rXLZsoPh16TSnO
	 uX8D2NeK/SC0qI1AYpMoWVcpAfQgz+V9T1c2h+ONYXCc8e49/Ju7BrjtZHhbNX0Xsv
	 mObGH9QVWJ9vw==
Date: Thu, 6 Feb 2025 10:51:01 +0000
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
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH v4 11/21] RISC-V: perf: Restructure the SBI PMU code
Message-ID: <20250206105100.GA2971@willie-the-truck>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-11-835cfa88e3b1@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250205-counter_delegation-v4-11-835cfa88e3b1@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_025110_868659_3881CB02 
X-CRM114-Status: GOOD (  12.40  )
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

On Wed, Feb 05, 2025 at 11:23:16PM -0800, Atish Patra wrote:
> With Ssccfg/Smcdeleg, we no longer need SBI PMU extension to program/
> access hpmcounter/events. However, we do need it for firmware counters.
> Rename the driver and its related code to represent generic name
> that will handle both sbi and ISA mechanism for hpmcounter related
> operations. Take this opportunity to update the Kconfig names to
> match the new driver name closely.
> 
> No functional change intended.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  MAINTAINERS                                       |   4 +-
>  arch/riscv/include/asm/kvm_vcpu_pmu.h             |   4 +-
>  arch/riscv/include/asm/kvm_vcpu_sbi.h             |   2 +-
>  arch/riscv/kvm/Makefile                           |   4 +-
>  arch/riscv/kvm/vcpu_sbi.c                         |   2 +-
>  drivers/perf/Kconfig                              |  16 +-
>  drivers/perf/Makefile                             |   4 +-
>  drivers/perf/{riscv_pmu.c => riscv_pmu_common.c}  |   0
>  drivers/perf/{riscv_pmu_sbi.c => riscv_pmu_dev.c} | 214 +++++++++++++---------

This seems... gratuitous? It feels like renaming the file could be a pain
for managing backports and renaming the driver might cause some headaches
in userspace.

What do you gain from such an invasive change?

Will

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
