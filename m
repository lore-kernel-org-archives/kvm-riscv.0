Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76985CA1013
	for <kvm-riscv@archiver.kernel.org>; Fri, 19 Sep 2025 00:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YiZPwMbYeR6JzZGIQ3mqjf6rCRLEItbjhwDBJAeA8tU=; b=iXr4U8MvLtqi2IK4Ji4Frl6P0V
	wPhayR57xg97Vpb42qo88/DvJLA+8/UCN9t6EMYLykM5n2SHTTE/eH+E1NMqhypYUxKiNSLwkD7hQ
	StoO/G52hbHhzdZjX17KEpFVLBSGeFXC5QhoyLKVEBKqAytyfsiBfgVFv8yYhUqNGIfstFSdJv9oV
	cUPerVjpnpnfYVrWAOzvUB59M4JCvswKwXPIkp3ZckTiNI1fiKHwu+fyZuplCYIkjR1Tj+qTJlK3c
	rd4k7dwbJsAOYlc22kDUHiNw5ajHh4Ncyl6yOYS/wdi+2xzQ8YaBXbySyeimbO2anPpabtobZUmkL
	JNhcsXxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOiy-00000001Uwh-0j9X;
	Fri, 19 Sep 2025 00:11:40 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOiv-00000001UvU-44wD
	for kvm-riscv@lists.infradead.org;
	Fri, 19 Sep 2025 00:11:39 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b54c46337c9so1993471a12.1
        for <kvm-riscv@lists.infradead.org>; Thu, 18 Sep 2025 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1758240697; x=1758845497; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5pHZG9bcElhtMtIe02tLqtkF2uGVTgQcC3bk12Urlxs=;
        b=IlMGW6tPvNpk3IW/km8vLsSnW471EIUdbYbWVXknuoRw0PEDTNWaohhCIg/+ANXNQK
         RtsmVmDO7W+BkzT24gXDy6ap0Y2WrrsebjXXEp5GBNZxV0tTMylnTghlgkSyTNSDhBa9
         uhqz6fgh91PIQO9V0P2cj8427tpakgAX+SWweY5aRa25/mY3YP3oZR5vEIpi5wuqLOZk
         MJeZJoFggRxkRuZ7oubTzARYA1xOgVv6sb5RSCgqTd0mm+6GJmMgP4xZd9awrnz059+I
         rjU23A7Br9iDmKiygeG4maB6y/Fx98yYZ8lvIg+k2oby3rZRgUZENccqis8sRu94Af+x
         zE+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758240697; x=1758845497;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5pHZG9bcElhtMtIe02tLqtkF2uGVTgQcC3bk12Urlxs=;
        b=qZjt+1q9/yhK6NqeVNVC/H8q3jGB3Tj10IzDH+dXdkftz0pJiJlX+y3ZEKnFiQvptK
         ND2V5As9mp88SCHoHM0pDb6HaLjRg1yaa1s3idqqIayoFzQgtlGdbibQvNDx5iOY5sJQ
         MQBFGwnLCwa1HlphhTBkxVJT0nlHGJL0c8s/blNm5AYXW3MKPK0d0+FQlmcPzSNOkt3o
         0qZKYj3p4UaSHiAus04VKdRGF8wiLVstHWtl13btUQe5PhAzTP2hpBOMeUs5xOF6SLLf
         QDc5/p45J4x6gc9SWQ5OD10qeKRaGhhp5A17JONW3PflL+VQ7mDg3YALIuqpT5QF4Fem
         eEjg==
X-Forwarded-Encrypted: i=1; AJvYcCWFLrN+gsEEjwtQSjpCzdm2Z08hZMaLcAJpbPPbdz/8mBTc4K0GR5rTcu0gjp1KFXqumF5onFBsVFU=@lists.infradead.org
X-Gm-Message-State: AOJu0YwseCyryITZwUDXVf1EyNp4W1I/Eh5MXctfsuUU35ppQNlBVP9k
	DDIULFLLy0/L9Att6KHwrIfoPUtwA57XN/iIl6Kv6L0Nu1ocd11vkznDiJn2edKvNJLJpsNSgTb
	Kau3Yng==
X-Google-Smtp-Source: AGHT+IHL6wVIYMVXo/qF+C7m2xAthhi9wrZHJ6iKg3qq/wSUNMfIVTHCzCbvYXSzkHH/AND/3vPqEr/ALak=
X-Received: from pjyf16.prod.google.com ([2002:a17:90a:ec90:b0:330:75c7:341c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:99a8:b0:252:3c5e:45cc
 with SMTP id adf61e73a8af0-2925d5abc4cmr2117916637.19.1758240696687; Thu, 18
 Sep 2025 17:11:36 -0700 (PDT)
Date: Thu, 18 Sep 2025 17:10:50 -0700
In-Reply-To: <20250806195706.1650976-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250806195706.1650976-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.0.470.ga7dc726c21-goog
Message-ID: <175824021167.1343722.9290387002572827825.b4-ty@google.com>
Subject: Re: [PATCH v5 00/44] KVM: x86: Add support for mediated vPMUs
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>, 
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kan Liang <kan.liang@linux.intel.com>, 
	Yongwei Ma <yongwei.ma@intel.com>, Mingwei Zhang <mizhang@google.com>, 
	Xiong Zhang <xiong.y.zhang@linux.intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_171138_007175_0B109FA8 
X-CRM114-Status: GOOD (  14.51  )
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

On Wed, 06 Aug 2025 12:56:22 -0700, Sean Christopherson wrote:
> This series is based on the fastpath+PMU cleanups series[*] (which is based on
> kvm/queue), but the non-KVM changes apply cleanly on v6.16 or Linus' tree.
> I.e. if you only care about the perf changes, I would just apply on whatever
> branch is convenient and stop when you hit the KVM changes.
> 
> My hope/plan is that the perf changes will go through the tip tree with a
> stable tag/branch, and the KVM changes will go the kvm-x86 tree.
> 
> [...]

Applied a subset (roughtly 1/4) of the KVM patches to kvm-x86 misc, as the full
thing is far too late for 6.18.  In a nutshell, all of the random prep work and
cleanups that aren't directly related to mediated PMU support.

I want to get "setup VMCS prior to kvm_x86_vendor_init()" in particular landed
to establish the order of setup operations.  The in-progress CET series moves
the _nested_ VMCS setup later, and I had a moment of panic that I was creating
incompatible patches.

[14/44] KVM: VMX: Setup canonical VMCS config prior to kvm_x86_vendor_init()
        https://github.com/kvm-x86/linux/commit/4687a2c4e6a6
[15/44] KVM: SVM: Check pmu->version, not enable_pmu, when getting PMC MSRs
        https://github.com/kvm-x86/linux/commit/e3d1f2826da6

[17/44] KVM: x86/pmu: Snapshot host (i.e. perf's) reported PMU capabilities
        https://github.com/kvm-x86/linux/commit/51f34b1e650f

[22/44] KVM: x86: Rename vmx_vmentry/vmexit_ctrl() helpers
        https://github.com/kvm-x86/linux/commit/1e24bece2681
[23/44] KVM: x86/pmu: Move PMU_CAP_{FW_WRITES,LBR_FMT} into msr-index.h header
        https://github.com/kvm-x86/linux/commit/cdfed9370b96
[24/44] KVM: x86: Rework KVM_REQ_MSR_FILTER_CHANGED into a generic RECALC_INTERCEPTS
        https://github.com/kvm-x86/linux/commit/6057497336bb
[25/44] KVM: x86: Use KVM_REQ_RECALC_INTERCEPTS to react to CPUID updates
        https://github.com/kvm-x86/linux/commit/5a1a726e68ff
[26/44] KVM: VMX: Add helpers to toggle/change a bit in VMCS execution controls
        https://github.com/kvm-x86/linux/commit/2bff2edf69ed

[29/44] KVM: x86/pmu: Use BIT_ULL() instead of open coded equivalents
        https://github.com/kvm-x86/linux/commit/30c0267f1581
[30/44] KVM: x86/pmu: Move initialization of valid PMCs bitmask to common x86
        https://github.com/kvm-x86/linux/commit/9bae7a086394
[31/44] KVM: x86/pmu: Restrict GLOBAL_{CTRL,STATUS}, fixed PMCs, and PEBS to PMU v2+
        https://github.com/kvm-x86/linux/commit/c49aa9837686

--
https://github.com/kvm-x86/linux/tree/next

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
