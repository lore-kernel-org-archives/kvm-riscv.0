Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C032CA0EF2
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 21:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIQolJyQeCPoeJzblP+1Yp8jK8X5VGW16w4AySn9hJw=; b=pwGk8nopSsEegL
	Nl8qo5VZgFDWtSOKpH4IKUq1lrjB2DwNNIFq9GE/KFrF42Nxnz6TXgsrSQfD9T4x+iGGPZPHmOHTP
	ypHHArqqFeRm7CkzshTO2fqNYgKykEdEt30sumBiw0D2usMemAMG/2iDb4EaKIuyAn2wxxX7M9ObU
	2NkaCbNES85xiu859LxWwA8gzqVk59w84uUESW7Sjs+Th5i2IVruwC1gEVR66e8q7+nC6k3uwUR6x
	tZTE7woC5Bf60I6AuMhVscY0eXQyRnDnqTvlXlEiAmeGSI+r/02KHJuguynSRpD0ghXus0+rlO4nf
	0cxdN6s3O7YlU5pjAnKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo7O8-00000008iKT-2egV;
	Mon, 18 Aug 2025 21:27:32 +0000
Received: from mgamail.intel.com ([198.175.65.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo68x-00000008aWt-0HOk;
	Mon, 18 Aug 2025 20:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755547667; x=1787083667;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=HUP2AEiZfFgmlejZ9gs27ibEAHSKm6RtjRLDUuqDXBM=;
  b=M8ixLp5/m7XiMl3k9ifYx3QLHZKHAGfoKkyWDomrgVUSgnHoVnxhKCy1
   ThsFNhE4rdFF+i7WXk6I8HOmteCp+DqmjDOyA8ppopVRZNJLbcXPn2PvA
   ALBmzW80pmUReY1UsFNkOLx5DSNqqi4wzHK9/ilPaodp99Si4emSl3feE
   ZLOLv+H0JrxnmfZHo3x9N5KQRJsm9WYrDQ6Ij2ne3As6u1NsTqBmglFrR
   ZgWIGmWR9TaTFqdVGIR4FIW4S/F8CZuIK5nDRF6QbBec/1B6MwAW72OxA
   FZxCsJ/PVapgRqxbxfjAwblH4MSN3s2qRgq2b8DG1yxJk5VaNmX0OnKGc
   Q==;
X-CSE-ConnectionGUID: 95cFrr3CSkmcOeYKUE2U5A==
X-CSE-MsgGUID: ER6hlTXNQX26E0ti0xYMCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="69233310"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="69233310"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 13:07:43 -0700
X-CSE-ConnectionGUID: VPdWLgrPQ4q9Io7sk+4Srw==
X-CSE-MsgGUID: IPqmhJ93SHqaacsNGeVfjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="168055360"
Received: from linux.intel.com ([10.54.29.200])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 13:07:41 -0700
Received: from [10.124.163.195] (kliang2-mobl1.ccr.corp.intel.com [10.124.163.195])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTPS id D183720B571C;
	Mon, 18 Aug 2025 13:07:39 -0700 (PDT)
Message-ID: <4e58688f-22e0-4e20-9043-dee76d01d24f@linux.intel.com>
Date: Mon, 18 Aug 2025 13:07:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 09/44] perf/x86: Switch LVTPC to/from mediated PMI
 vector on guest load/put context
To: Peter Zijlstra <peterz@infradead.org>,
 Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-10-seanjc@google.com>
 <20250815113951.GC4067720@noisy.programming.kicks-ass.net>
 <aJ9VQH87ytkWf1dH@google.com> <aJ9YbZTJAg66IiVh@google.com>
 <20250818143204.GH3289052@noisy.programming.kicks-ass.net>
 <aKNF7jc4qr9ab-Es@google.com>
 <20250818161210.GJ3289052@noisy.programming.kicks-ass.net>
Content-Language: en-US
From: "Liang, Kan" <kan.liang@linux.intel.com>
In-Reply-To: <20250818161210.GJ3289052@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_130747_175855_3016CBD4 
X-CRM114-Status: GOOD (  22.80  )
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



On 2025-08-18 9:12 a.m., Peter Zijlstra wrote:
> On Mon, Aug 18, 2025 at 08:25:34AM -0700, Sean Christopherson wrote:
> 
>>> OK, so *IF* doing the VM-exit during PMI is sound, this is something
>>> that needs a comment somewhere. 
>>
>> I'm a bit lost here.  Are you essentially asking if it's ok to take a VM-Exit
>> while the guest is handling a PMI?  If so, that _has_ to work, because there are
>> myriad things that can/will trigger a VM-Exit at any point while the guest is
>> active.
> 
> Yes, that's what I'm asking. Why is this VM-exit during PMI nonsense not
> subject to the same failures that mandates the mid/late PMI ACK.
> 
> And yes, I realize this needs to work. But so far I'm not sure I
> understand why that is a safe thing to do.
> 
> Like I wrote, I suspect writing all the PMU MSRs serializes things
> sufficiently, but if that is the case, that needs to be explicitly
> mentioned. Because that also doesn't explain why we needs mid-ack
> instead of late-ack on ADL e-cores for instance.

The mid-ack and late-ack only require under some corner cases, e.g., two
PMIs are triggered simultaneously with PEBS.
Because the ucode of p-core and e-core handle the pending PEBS records
and PMIs differently.
For p-core, the ACK should be as close to EOM. Otherwise, the pending
PMI will trigger a spurious PMI warning.
For e-core, the uncode handles the pending PMI well. There is no
spurious PMI. However, it impacts the update of the PEBS_DATA_CFG. The
PEBS_DATA_CFG is global. If the ACK cannot be done before re-enabling
counters, the stale PEBS_DATA_CFG will somehow be written into the next
PEBS record of the pending PMI. It triggers the malformed PEBS record.

For the upcoming arch PEBS, the data cfg is per-counter.
The mid-ack workaround should not be required.
> 
> Could it perhaps be that we don't let the guests do PEBS because DS
> doesn't virtualize? And thus we don't have the malformed PEBS record?
>

Yes, I don't think it can impact the mediated PMU. The legacy PEBS for
vPMU is not supported.
Since the configuration is per-counter with the arch PEBS, the malformed
PEBS record should not be triggered either.


Thanks,
Kan

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
