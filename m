Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632ACD3B7F2
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 15:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N7zAaXmq9vPVzdOhzZl0+nH4D/1uUp0Y2/og8Qxreas=; b=dW2J/9GzI+6ej6
	eLUXk+l8Xi49LuzB7uX8HyYuFI+2cC9V1Ll3FW4RN5JiSH5mk4zY6r7JQ2b7pU4bGtW6XKzn85E0J
	Ji/zrgJPTDPJpTKHyCfUfKvJDBcRzgRGEjjNuu9JggGI5fsoMgdlXV1anTFBbzBh5UG0mUSPMykjL
	sWbF2DzVJbaCjrxkcTqKXiCUt2VxU50qHt2/Kpsq25DsOP7UOdfGv1Du5+Ba2WbcXEuCBhWdgpBs/
	uepp1xm64CQoD11N1Yf2mGnv6jPj1CwqcnOrK3fVCeUA/uYSBAgbhRFOV7KbYUiNUIuqOfEwFt59M
	ZeycU0G8KTLudzzd7UqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdJ3-0000000DFYt-2lYp;
	Mon, 08 Dec 2025 15:37:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSdJ2-0000000DFYh-2H0E;
	Mon, 08 Dec 2025 15:37:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=wLn9Pj1RYBBe/ROihmPM3KswK8Z51Ugeg99R/pQhOhA=; b=OoWG4omeqgaxvUh8FgADNqjaaC
	juvgaLiAq5Ppq+sfIu8suggncnKgHn/WlW24ff8tjGhqnjjN334+IwwvaC920xcolbeImVxUh9kSO
	CyUgYV+zi6CeSG3tfhCi8pp5tjZQJ8Wu4pkseeK7UUuoy0SM3kJDM1L2svoJHUY0EdcDpdx+naGGm
	XrolU+XPp5CzvMG+WRw4XNArwKR6g3xoi8uZ0vGdE28D1RzEXp04ygB8Sd3PimzpthY+PAfkgzS3h
	eg+s9IvZgwFCOaH3wVz9RVWaw3Hwv4+L3Li68zpDe4K2DrcryVF8Qam+F59SRS5lRRfOsSzf3ifOv
	M6PIb97w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vScRR-0000000AQUo-1xw8;
	Mon, 08 Dec 2025 14:42:21 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 95ACC30301A; Mon, 08 Dec 2025 16:37:38 +0100 (CET)
Date: Mon, 8 Dec 2025 16:37:38 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	kvm@vger.kernel.org, loongarch@lists.linux.dev,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
	Mingwei Zhang <mizhang@google.com>,
	Xudong Hao <xudong.hao@intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Xiong Zhang <xiong.y.zhang@linux.intel.com>,
	Manali Shukla <manali.shukla@amd.com>,
	Jim Mattson <jmattson@google.com>
Subject: Re: [PATCH v6 00/44] KVM: x86: Add support for mediated vPMUs
Message-ID: <20251208153738.GC3707837@noisy.programming.kicks-ass.net>
References: <20251206001720.468579-1-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206001720.468579-1-seanjc@google.com>
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

On Fri, Dec 05, 2025 at 04:16:36PM -0800, Sean Christopherson wrote:
> My hope/plan is that the perf changes will go through the tip tree with a
> stable tag/branch, and the KVM changes will go the kvm-x86 tree.

> Kan Liang (7):
>   perf: Skip pmu_ctx based on event_type
>   perf: Add generic exclude_guest support
>   perf: Add APIs to create/release mediated guest vPMUs
>   perf: Clean up perf ctx time
>   perf: Add a EVENT_GUEST flag
>   perf: Add APIs to load/put guest mediated PMU context
>   perf/x86/intel: Support PERF_PMU_CAP_MEDIATED_VPMU
> 
> Mingwei Zhang (3):
>   perf/x86/core: Plumb mediated PMU capability from x86_pmu to
>     x86_pmu_cap
>
> Sandipan Das (3):
>   perf/x86/core: Do not set bit width for unavailable counters
>   perf/x86/amd: Support PERF_PMU_CAP_MEDIATED_VPMU for AMD host
> 
> Sean Christopherson (19):
>   perf: Move security_perf_event_free() call to __free_event()
>   perf/x86/core: Register a new vector for handling mediated guest PMIs
>   perf/x86/core: Add APIs to switch to/from mediated PMI vector (for
>     KVM)

That all looks to be in decent shape; lets go get this merged. There is
the nit on patch 4 and I think a number of the exports want to be
EXPORT_SYMBOL_FOR_KVM() instead, but we can do that on top.

I'll queue these patches after rc1.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
