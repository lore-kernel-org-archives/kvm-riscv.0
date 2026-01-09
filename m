Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC8E4D232C1
	for <kvm-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JDKtisWwqYV8ZW4RQH0ufeCIXO77lnfINHTQxlubdk=; b=L+KR6K6H+ZS/BT
	xVrSMe/GRzlE/PCeS5tKFvpBRFCBd31tLEPfgIn8LhX5i0qo5Wn4O4ch6Vcnza9LaeOPFRgTxNyKB
	kRGdNsONwAOuT4hSw9qbEsbo/k7LkEZP6h4C6FGY9b3wY35XasSI+gLCLjsDLGt5r9fOsGURJR0KN
	WT6qjjMptOKNt+zXsfBgU447G5q/PbiLXynGQoMK9ApSy5o2IA4ud4p56NeJvdKodZvpSZCwamD6s
	1uNkpetIo+GyF28nOXA/TWloVrS2gBjSiwKG6zPy1P9wkAxW/Ca1NS5V/THHtUvL6rRegwvYznDfO
	YdD2/vxVCwKgAl84R++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0OC-0000000122T-42c3;
	Fri, 09 Jan 2026 00:30:04 +0000
Received: from mgamail.intel.com ([198.175.65.10])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve0O9-0000000121m-3MPc;
	Fri, 09 Jan 2026 00:30:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767918602; x=1799454602;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=mX5XbuFq3oY1fgctrRQBbLXQxLXqk+y8wzPmf6LEIxk=;
  b=mQRGtRWEPhOTQPz8rZnco+84Znv5BdJDJPqm30oUvsgzF77qnXKYN/D3
   qvFKgse6rDrUZa1sRApJHn4A4/E0CFmcsE+DpViavbn1LSELYkUExGzoA
   NAv+uY809/PoljHCwkwrvj+2lNEOYeuaOXN9O37ka+g9by3TDkUCNaFfu
   Cjuzsk1BtrsjaTk1NxxYZR7IvQLAi6lAr8VG0c4TFkTaWYoUj7V9rnuSm
   ZVJN7MxZawJ7itsxvSqpoT84ceYQHfiUbHIEnBNStm//t9xwUNqMsRgzQ
   DvMrNZKZNVQajISC/FazvAKSwwrKR0ddZj2nUukOuaa7p0kfwqliF5FsQ
   Q==;
X-CSE-ConnectionGUID: +t9l5ZWsRp6CSE2IbNg5SA==
X-CSE-MsgGUID: 9ZhvOYyTQbqks6IbstYD6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86720688"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="86720688"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 16:30:00 -0800
X-CSE-ConnectionGUID: +aM55RQfSiK4CVJ+HHZuLw==
X-CSE-MsgGUID: FprPpiFKRD+vf2GC5TB/5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="203255856"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.14]) ([10.124.240.14])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 16:29:52 -0800
Message-ID: <a34caf32-a0e0-4bd1-a670-14ecb3756ae6@linux.intel.com>
Date: Fri, 9 Jan 2026 08:29:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load
 list is full
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
 Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>,
 Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-40-seanjc@google.com>
 <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
 <aWANuxukqWmo36N0@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aWANuxukqWmo36N0@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_163001_978636_6B663EE9 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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


On 1/9/2026 4:04 AM, Sean Christopherson wrote:
> On Mon, Dec 08, 2025, Dapeng Mi wrote:
>> On 12/6/2025 8:17 AM, Sean Christopherson wrote:
>>> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
>>> index 38491962b2c1..2c50ebf4ff1b 100644
>>> --- a/arch/x86/kvm/vmx/vmx.c
>>> +++ b/arch/x86/kvm/vmx/vmx.c
>>> @@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>>>  {
>>>  	int i, j = 0;
>>>  	struct msr_autoload *m = &vmx->msr_autoload;
>>> +	struct kvm *kvm = vmx->vcpu.kvm;
>>>  
>>>  	switch (msr) {
>>>  	case MSR_EFER:
>>> @@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>>>  	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
>>>  	j = vmx_find_loadstore_msr_slot(&m->host, msr);
>>>  
>>> -	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
>>> -	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
>>> -		printk_once(KERN_WARNING "Not enough msr switch entries. "
>>> -				"Can't add msr %x\n", msr);
>>> +	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
>>> +	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
>> nit: Remove one extra space before "m->host.nr".
> Oh, that's intentional, so that the rest of the line is aligned with the "guest"
> line above.

Good to know. Thanks.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
