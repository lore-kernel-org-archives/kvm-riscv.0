Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EBEDD3ABEF
	for <kvm-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1I3urQ6Osy09ltvRYT/K7Y8MKGByLmHMlu5YKe7JK8w=; b=rKDgl1NOKVS41O
	W1sGI7J/Un+57DcZ7PpOWL4AtNA15myN3W5QubdCxBEnyf5ix2smSTh/OgFv+VYF5jetC8JUkM7ae
	A639BW5Lbios+2UVnvKSvK/8ptyHszBYjnuPbgBl/8kG8lt0lPGFV9kBvpoLcp5INQvrotU4+cv4S
	45y1LRo6WlgGmGgmPoyh45Z0ZCmtlArI8LgLSWud9L/QYr2219b3C9MlFejlWlj0PI0MG21poR9Rn
	84WZQvLnVf22dZ12awlb2nXnAKreeCAJfSt+1jX8Dn/8EEaQ2KMZdflPPGqZCF9scPc8O/h4fe2Zw
	Pf3q+wHefHhU9LNzqQwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXdi-0000000Ct0C-3yCf;
	Mon, 08 Dec 2025 09:34:43 +0000
Received: from mgamail.intel.com ([198.175.65.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSXde-0000000Cszh-1GVi;
	Mon, 08 Dec 2025 09:34:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765186479; x=1796722479;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=nSxjb3iSvlhZrRlAmKEmJNxO+kFHROtO7j/bMcBHd/4=;
  b=CtNSkcDZOXLQqdVxNjx8qpbWNt0pPLZ3hN5IUwPvint6WMZq0Liof7eL
   zSK7zwYP7rzJ0ynsm3sI7KDH+aFMDHfNkxZvNs1lvY8YlVc7YeRT+TpGR
   9Frqp6IAFRGmlJ3RC/dlknseVk4yIZjNKj1H9uzIedXBI0JMjvgTKPztF
   wBuIkR6o9suXDufSBeFmbjeY0QgF3D/BAenlSU+fdqCzL8hfHc220cFmd
   fIrvIYoywERsX4oNd0fKT5usPA/qFceKX6aja7GPTYSUBg6iz/SQOUlFi
   8nR7MPDzFzPw2h9ve0Trp8QzY8HF+/xmQv02MvyBet6BZ1FkK2sF8UMv9
   A==;
X-CSE-ConnectionGUID: k7Bn4DJtSEW1B/733w3FXQ==
X-CSE-MsgGUID: PHidTj2/S7GWspgTJHDnyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67288126"
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="67288126"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:34:38 -0800
X-CSE-ConnectionGUID: jJDDhXNuTkyNrjKmaswHjw==
X-CSE-MsgGUID: 4F6FhXpxRu6nERmNjwerUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,258,1758610800"; 
   d="scan'208";a="196157352"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.240.12]) ([10.124.240.12])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 01:34:30 -0800
Message-ID: <04c70698-e523-43ae-9092-f360c848d797@linux.intel.com>
Date: Mon, 8 Dec 2025 17:34:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 39/44] KVM: VMX: Bug the VM if either MSR auto-load
 list is full
To: Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
 Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>,
 Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
 Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, loongarch@lists.linux.dev,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Mingwei Zhang <mizhang@google.com>, Xudong Hao <xudong.hao@intel.com>,
 Sandipan Das <sandipan.das@amd.com>,
 Xiong Zhang <xiong.y.zhang@linux.intel.com>,
 Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-40-seanjc@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <20251206001720.468579-40-seanjc@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251208_013438_386335_DA6F7F10 
X-CRM114-Status: GOOD (  17.83  )
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


On 12/6/2025 8:17 AM, Sean Christopherson wrote:
> WARN and bug the VM if either MSR auto-load list is full when adding an
> MSR to the lists, as the set of MSRs that KVM loads via the lists is
> finite and entirely KVM controlled, i.e. overflowing the lists shouldn't
> be possible in a fully released version of KVM.  Terminate the VM as the
> core KVM infrastructure has no insight as to _why_ an MSR is being added
> to the list, and failure to load an MSR on VM-Enter and/or VM-Exit could
> be fatal to the host.  E.g. running the host with a guest-controlled PEBS
> MSR could generate unexpected writes to the DS buffer and crash the host.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 38491962b2c1..2c50ebf4ff1b 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1098,6 +1098,7 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  {
>  	int i, j = 0;
>  	struct msr_autoload *m = &vmx->msr_autoload;
> +	struct kvm *kvm = vmx->vcpu.kvm;
>  
>  	switch (msr) {
>  	case MSR_EFER:
> @@ -1134,12 +1135,10 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
>  	j = vmx_find_loadstore_msr_slot(&m->host, msr);
>  
> -	if ((i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS) ||
> -	    (j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS)) {
> -		printk_once(KERN_WARNING "Not enough msr switch entries. "
> -				"Can't add msr %x\n", msr);
> +	if (KVM_BUG_ON(i < 0 && m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm) ||
> +	    KVM_BUG_ON(j < 0 &&  m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))

nit: Remove one extra space before "m->host.nr".


>  		return;
> -	}
> +
>  	if (i < 0) {
>  		i = m->guest.nr++;
>  		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
