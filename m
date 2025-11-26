Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F980D1036F
	for <kvm-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 00:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tl2bdQp4fmxKS/hTCNlaV4MUXVEUzFEsO6oRbcHJlqY=; b=YaTgUQi6End0q4
	L+GjCvXNLxvVMwnwkDk0PgzLvv2FMQEhf/wNavSS/nCe33VEdEyhrK3vY2M/D9KAY0qAq6IUUVSm4
	oUHHxP1YcB2UaA/kOyMxLL0+8RnQnXHJIjjp5WI9UKQiOLbMfuPIXqSl80ZeBzYL5ROHwrQs1QJQX
	oAmaZuq56DdKLJfOP2uOObRYeBhKhzoOpXc89zq2XnqT46zvMMyvbXJdCvTVcTJro3PKkHSQeV5VR
	UvM3rhtWAK68uC/2r6Pc3exz9+kP4ZyZBAm9sVsxz48QbzoQo92SmdWcmL8qWf028e1n3+64H+S5w
	zgIEr7PObJ5j3hATvHwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3Jb-0000000E7Fe-00gj;
	Wed, 26 Nov 2025 00:23:23 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vO3JX-0000000E7Ew-2o0c;
	Wed, 26 Nov 2025 00:23:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764116600; x=1795652600;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=jNSFdQCLhdJyzqyDdBupTSBjX5ORPHs5VM+yw2SDmzU=;
  b=EFz8RAATr3f9V/LFFKelojZvsNmV0OUga53+WoDot+3gKYCX88W4PD+L
   F8YFPDon84CFX9sS+1WxI/e0kSGU/gZz8YJBtpjOnIXb+c7tsuy06i6DT
   kD6dRl9G1792TXe9x4dU5AGehJbOdrMRXL0mQspZLA9DfyQqjsB+83Cq4
   10VS6QpuMZO91Ca9DbY8PU7QGdNz2gsFCtBCVUpDO80BsRaiAJkISJvs6
   03SnDwnn0zPgH6Bf7mBDcNSU6vLqt9LpMVVFQjLS9oWWuWS1R3gR+fbWJ
   Uu2wi2ExrsImkUkp/9MCINoWkBCW1eZ9YDybVedaJS7Tr5PsH98LS+EXI
   g==;
X-CSE-ConnectionGUID: iyK1EJFWQ7mT8ODu6e1S+A==
X-CSE-MsgGUID: eqbUaUo7RCKXlKBqcUCNQg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="66306982"
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="66306982"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 16:23:18 -0800
X-CSE-ConnectionGUID: W+654JrHR0i0NNZKwcIPrQ==
X-CSE-MsgGUID: g62AlCY3TmyGnusI1wnrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,227,1758610800"; 
   d="scan'208";a="197267661"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.213]) ([10.124.240.213])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 16:23:10 -0800
Message-ID: <f7a84eb0-eb64-4cdf-801d-088bbdbce0b4@linux.intel.com>
Date: Wed, 26 Nov 2025 08:23:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 28/44] KVM: x86/pmu: Load/save GLOBAL_CTRL via
 entry/exit fields for mediated PMU
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Kan Liang <kan.liang@linux.intel.com>, Yongwei Ma <yongwei.ma@intel.com>,
 Mingwei Zhang <mizhang@google.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Sandipan Das <sandipan.das@amd.com>
References: <20250806195706.1650976-1-seanjc@google.com>
 <20250806195706.1650976-29-seanjc@google.com> <aSUK8FuWT4lpMP3F@google.com>
 <83067602-325a-4655-a1b7-e6bd6a31eed4@linux.intel.com>
 <aSXigAQznhuxZmy7@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aSXigAQznhuxZmy7@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_162319_764127_D6E0FE85 
X-CRM114-Status: GOOD (  28.59  )
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


On 11/26/2025 1:08 AM, Sean Christopherson wrote:
> On Tue, Nov 25, 2025, Dapeng Mi wrote:
>> On 11/25/2025 9:48 AM, Sean Christopherson wrote:
>>>> +	if (host_pmu->version < 4 || !(host_perf_cap & PERF_CAP_FW_WRITES))
>>>> +		return false;
>>>> +
>>>> +	/*
>>>> +	 * All CPUs that support a mediated PMU are expected to support loading
>>>> +	 * and saving PERF_GLOBAL_CTRL via dedicated VMCS fields.
>>>> +	 */
>>>> +	if (WARN_ON_ONCE(!cpu_has_load_perf_global_ctrl() ||
>>>> +			 !cpu_has_save_perf_global_ctrl()))
>>>> +		return false;
>>> And so this WARN fires due to cpu_has_save_perf_global_ctrl() being false.  The
>>> bad changelog is mine, but the code isn't entirely my fault.  I did suggest the
>>> WARN in v3[1], probably because I forgot when PMU v4 was introduced and no one
>>> corrected me.
>>>
>>> v4 of the series[2] then made cpu_has_save_perf_global_ctrl() a hard requirement,
>>> based on my miguided feedback.
>>>
>>>    * Only support GLOBAL_CTRL save/restore with VMCS exec_ctrl, drop the MSR
>>>      save/retore list support for GLOBAL_CTRL, thus the support of mediated
>>>      vPMU is constrained to SapphireRapids and later CPUs on Intel side.
>>>
>>> Doubly frustrating is that this was discussed in the original RFC, where Jim
>>> pointed out[3] that requiring VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL would prevent
>>> enabling the mediated PMU on Skylake+, and I completely forgot that conversation
>>> by the time v3 of the series rolled around :-(
>> VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL is introduced from SPR and later. I
>> remember the original requirements includes to support Skylake and Icelake,
>> but I ever thought there were some offline sync and the requirement changed...
> Two things:
>
>  1) Upstream's "requirements" are not the same as Google's requirements (or those
>     of any company/individual).  Upstream most definitely is influenced by the
>     needs and desires of end users, but ultimately the decision to do something
>     (or not) is one that needs to be made by the upstream community.
>
>  2) Decisions made off-list need to be summarized and communicated on-list,
>     especially in cases like this where it's a relatively minor detail in a
>     large series/feature, and thus easy to overlook.
>
> I'll follow-up internally to make sure these points are well-understood by Google
> folks as well (at least, those working on KVM).

Understood and would follow.


>
>> My bad,
> Eh, this was a group "effort".  I'm as much to blame as anyone else.
>
>> I should double confirm this at then.
> No need, as above, Google's requirements (assuming the requirements you're referring
> to are coming from Google people) are effectively just one data point.  At this
> point, I want to drive the decision to support Sylake+ (or not) purely through
> discussion of upstream patches.
>
>>> As mentioned in the discussion with Jim, _if_ PMU v4 was introduced with ICX (or
>>> later), then I'd be in favor of making VM_EXIT_SAVE_IA32_PERF_GLOBAL_CTRL a hard
>>> requirement.  But losing supporting Skylake+ is a bit much.
>>>
>>> There are a few warts with nVMX's use of the auto-store list that need to be
>>> cleaned up, but on the plus side it's also a good excuse to clean up
>>> {add,clear}_atomic_switch_msr(), which have accumulated some cruft and quite a
>>> bit of duplicate code.  And while I still dislike using the auto-store list, the
>>> code isn't as ugly as it was back in v3 because we _can_ make the "load" VMCS
>>> controls mandatory without losing support for any CPUs (they predate PMU v4).
>> Yes, xxx_atomic_switch_msr() helpers need to be cleaned up and optimized. I
>> suppose we can have an independent patch-set to clean up and support
>> global_ctrl with auto-store list for Skylake and Icelake.
> I have the code written (I wanted to see how much complexity it would add before
> re-opening this discussion).  My plan is to put the Skylake+ support at the end
> of the series, not a separate series, so that it can be reviewed in one shot.
> E.g. if we can make a change in the "main" series that would simplify Skylake+
> support, then I'd prefer to find and implement any such change right away.

Sure. Thanks.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
