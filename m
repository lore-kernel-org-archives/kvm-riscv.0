Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC5B4C5ACD3
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AUN7HPNz1N/vCvzQn0pxwecK8RnIu8aRBp9L21gU2as=; b=pdjVz+wi4CmyGUEdYWIqrkAHZ7
	Kl4JRPMnaHGCqyEjWfVE8F9wATXRLI8zTpdhiyIRY5+DeJplx2QX4bp5ObEFdvdj67/xFUebjQiTa
	zmJtf38Wza3eo2FaOAbMo7orr68O16CCVgrQEgmWqHJC1Qg+BmPxduKcQ6naA4UB4yWRQfuvg6T2j
	ywHXu/NUuF3r44EEh+GqN+MHKsNJ75zdHNIc5SlJzZhiENj70Yr6NFXhY1hraeyR8x+DJPHmEzCxQ
	uq3rGcxyaxuzSn95YEPn5vE19rD1aHfsuDaF4HnibfNbe4PPV5Hn8+DEJ5ByOyAyx2yWZCvuVj0Xs
	FVOMhD8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTdu-0000000FJZW-1HKJ;
	Fri, 20 Feb 2026 16:46:14 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTdr-0000000FJXj-2MXb
	for kvm-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 16:46:12 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-2a79164b686so35036245ad.0
        for <kvm-riscv@lists.infradead.org>; Fri, 20 Feb 2026 08:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771605969; x=1772210769; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o2NjEt0nlzd3sSfAI7ozchxl45oY7orW7xyZnr6QEkg=;
        b=LQWCe5f3XmIjbise9KGht1W67PR/CECsFeB06ivaU8xg/6Ei9A2Laj9muG9icO2Ph2
         hco1N0hIBUr0T2N3411kodWqYhNE9LzX0mNJNth4Fuzn6ORR47sfVwX7Vp8SAwpDTCmx
         mp79UittUckifmNYO66w1w9zDOs91ikLqYyKyfMwaiPYu3IMXH281+3Nl+bZt+QkexWu
         27abSCCF68guKM5YQQoKXmzTY/wKlQ7C9Hk7IuWMsRXxSgZBxLYyYhykOpa/WfrX7SaQ
         afU+6Pr/9pDtC0q0I+zFh9pftuR2nWU2SMDxsbR2SUifWrJ0HLW+un8XQqAXydsyNxjk
         1Kgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771605969; x=1772210769;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o2NjEt0nlzd3sSfAI7ozchxl45oY7orW7xyZnr6QEkg=;
        b=S2KKGHJDc23Yc6nX/cIvjd6/NM8P8qG3YsO4ztUUeWbw1CtXXr7FSj/PxkXWGSngMz
         L7VqsWJQ1Z+gZB8+ZWIhB1stLc2+iBWApaaQMBChokruS8kY7Nde05ht2Ju3k+qwr08E
         qT8t2KQDmgxsP6SBwmQOk7X/a6bdM+MPQwzniztXy+fiAPic6ACLL/bjY99FtHumPXH2
         UEiQeSHnbPvjX5gzAWo5Ahu5zkD9eJQmRbYkB8tOAlezObdclRW9PbeRutM0iuuthQOd
         YmAd+KuSpWgPCK71nC1t+Z4hbRYw9WVRXxCnStTI/BJTtK/KTOdVqurmQRgFS1dy5i0x
         gGeA==
X-Forwarded-Encrypted: i=1; AJvYcCWKHfyZ1DdMkoVQ9J63YSehDns2lZoN4WaLpacKSMvef5W37jtwGUIiZ7ioRuNJVTM5wstUtSrqYkw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzULWf5MWzRvq68m/uKzDXEjOmXPCYYPcog+kBOwhgllIsXxsGb
	La32HZ6HBHrtLvXQ1TuF4a2b/fURzFn62+PNMXTy27RxMHW08NP5bwRbNvbOvI6ZAKvZ5OCEumj
	qSE7FWw==
X-Received: from plma6.prod.google.com ([2002:a17:902:7d86:b0:2a9:622c:47d6])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e80c:b0:2a1:388d:8ef3
 with SMTP id d9443c01a7336-2ad7444e7fcmr1749985ad.18.1771605969111; Fri, 20
 Feb 2026 08:46:09 -0800 (PST)
Date: Fri, 20 Feb 2026 08:46:07 -0800
In-Reply-To: <aZdlBkLEQyv9q5ll@google.com>
Mime-Version: 1.0
References: <20251206001720.468579-1-seanjc@google.com> <20251206001720.468579-43-seanjc@google.com>
 <aZdlBkLEQyv9q5ll@google.com>
Message-ID: <aZe6UR1EGg0RcB69@google.com>
Subject: Re: [PATCH v6 42/44] KVM: VMX: Dedup code for adding MSR to VMCS's
 auto list
From: Sean Christopherson <seanjc@google.com>
To: Namhyung Kim <namhyung@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Xin Li <xin@zytor.com>, "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Mingwei Zhang <mizhang@google.com>, 
	Xudong Hao <xudong.hao@intel.com>, Sandipan Das <sandipan.das@amd.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Xiong Zhang <xiong.y.zhang@linux.intel.com>, 
	Manali Shukla <manali.shukla@amd.com>, Jim Mattson <jmattson@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_084611_649619_747005B0 
X-CRM114-Status: GOOD (  23.94  )
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

On Thu, Feb 19, 2026, Namhyung Kim wrote:
> Hello,
> 
> On Fri, Dec 05, 2025 at 04:17:18PM -0800, Sean Christopherson wrote:
> > Add a helper to add an MSR to a VMCS's "auto" list to deduplicate the code
> > in add_atomic_switch_msr(), and so that the functionality can be used in
> > the future for managing the MSR auto-store list.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/kvm/vmx/vmx.c | 41 +++++++++++++++++++----------------------
> >  1 file changed, 19 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > index 018e01daab68..3f64d4b1b19c 100644
> > --- a/arch/x86/kvm/vmx/vmx.c
> > +++ b/arch/x86/kvm/vmx/vmx.c
> > @@ -1093,12 +1093,28 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
> >  	vm_exit_controls_setbit(vmx, exit);
> >  }
> >  
> > +static void vmx_add_auto_msr(struct vmx_msrs *m, u32 msr, u64 value,
> > +			     unsigned long vmcs_count_field, struct kvm *kvm)
> > +{
> > +	int i;
> > +
> > +	i = vmx_find_loadstore_msr_slot(m, msr);
> > +	if (i < 0) {
> > +		if (KVM_BUG_ON(m->nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > +			return;
> > +
> > +		i = m->nr++;
> > +		m->val[i].index = msr;
> > +		vmcs_write32(vmcs_count_field, m->nr);
> > +	}
> > +	m->val[i].value = value;
> > +}
> > +
> >  static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  				  u64 guest_val, u64 host_val)
> >  {
> >  	struct msr_autoload *m = &vmx->msr_autoload;
> >  	struct kvm *kvm = vmx->vcpu.kvm;
> > -	int i;
> >  
> >  	switch (msr) {
> >  	case MSR_EFER:
> > @@ -1132,27 +1148,8 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> >  		wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
> >  	}
> >  
> > -	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> > -	if (i < 0) {
> > -		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > -			return;
> > -
> > -		i = m->guest.nr++;
> > -		m->guest.val[i].index = msr;
> > -		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
> > -	}
> > -	m->guest.val[i].value = guest_val;
> > -
> > -	i = vmx_find_loadstore_msr_slot(&m->host, msr);
> > -	if (i < 0) {
> > -		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > -			return;
> > -
> > -		i = m->host.nr++;
> > -		m->host.val[i].index = msr;
> > -		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
> > -	}
> > -	m->host.val[i].value = host_val;
> > +	vmx_add_auto_msr(&m->guest, msr, guest_val, VM_ENTRY_MSR_LOAD_COUNT, kvm);
> > +	vmx_add_auto_msr(&m->guest, msr, host_val, VM_EXIT_MSR_LOAD_COUNT, kvm);
> 
> Shouldn't it be &m->host for the host_val?

Ouch.  Yes.  How on earth did this escape testing...  Ah, because in practice
only MSR_IA32_PEBS_ENABLE goes through the load lists, and the VM-Entry load list
will use the guest's value due to VM_ENTRY_MSR_LOAD_COUNT not covering the bad
host value.

Did you happen to run into problems when using PEBS events in the host?

Regardless, do you want to send a patch?  Either way, I'll figure out a way to
verify the bug and the fix.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
