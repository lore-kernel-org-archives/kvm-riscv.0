Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3365C5AD69
	for <kvm-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVwykCsQQkynjUXA2CU9+mHe66o99oaGX06i9NY3vN8=; b=r5gKMD1yFQ7GEL
	GRBDV1tqtEpYKsf1ufPDdFI/hDsnDCAisfrMyxwP/ozop3ZvDa7u0UNWY8YDyBpkTKmuA4PXRfkG9
	Cqm3JJVULa55C8V7EfxRofTlmIOOttf33gSXGBlgrb65+Kosfv+kAoMmDMblAM8oF+mL1HAoSJr2a
	5E+0QJvXlwCMLWy7IVJWWzkDzOegplT0jieEjGLBVcLjhnmKFa32FrHBcAWHUD3M2yrMfMihIj2oc
	iM4eLrzV0wTxkfJ2hS1Z4qJfjB0MK86QqkdRuJwam/3eaWduHyJ/6zTnfgPdSUJbMSDYsl178BJPA
	H5D/NXNrFypOGL1HzjMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVxo-0000000FUoC-1eZy;
	Fri, 20 Feb 2026 19:14:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVxm-0000000FUnG-0EIu;
	Fri, 20 Feb 2026 19:14:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 56FE8418D8;
	Fri, 20 Feb 2026 19:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA755C116C6;
	Fri, 20 Feb 2026 19:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771614892;
	bh=N/dul5YjHzDXPfrduHVCi4Yg6lOyDfk2HzDDWaV+YQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dl4K9twKTKk+64XuV3tx697p+tSKE4KpQAY+Nm3YF1p4RQ05z2krCL7vET+svQbq5
	 VG8ENPLrxvLm/+whZxz7wR4sSkpTeUfkYv0ng1u1YVUiDdnp8o8K/ltQpAb0sRhhOy
	 rXgnEi1fxdVV7wKy6o/+ac2dBU905VE6WwRTURFE2/UJPkevi35wRQJ3wcx8pxvJL3
	 qH7yoJBL8zTJatIySTsfhPDUB1BBxBRzyo1NKjJzbcnEssXaEJKTQi0Oye1uhAaXPh
	 P3BILrh7CooTpzS9Xd2cs8bvXzY3zgzfP1rVyzHWfNebJK+Q3V4jNuZh9AQyF9VNxU
	 mNL8AGmVqa1wA==
Date: Fri, 20 Feb 2026 11:14:49 -0800
From: Namhyung Kim <namhyung@kernel.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Tianrui Zhao <zhaotianrui@loongson.cn>,
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>,
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Xin Li <xin@zytor.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
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
Subject: Re: [PATCH v6 42/44] KVM: VMX: Dedup code for adding MSR to VMCS's
 auto list
Message-ID: <aZiyqcd2V6Ncm6wY@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-43-seanjc@google.com>
 <aZdlBkLEQyv9q5ll@google.com>
 <aZe6UR1EGg0RcB69@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aZe6UR1EGg0RcB69@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_111454_134905_5CED456F 
X-CRM114-Status: GOOD (  26.16  )
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

On Fri, Feb 20, 2026 at 08:46:07AM -0800, Sean Christopherson wrote:
> On Thu, Feb 19, 2026, Namhyung Kim wrote:
> > Hello,
> > 
> > On Fri, Dec 05, 2025 at 04:17:18PM -0800, Sean Christopherson wrote:
> > > Add a helper to add an MSR to a VMCS's "auto" list to deduplicate the code
> > > in add_atomic_switch_msr(), and so that the functionality can be used in
> > > the future for managing the MSR auto-store list.
> > > 
> > > No functional change intended.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> > >  arch/x86/kvm/vmx/vmx.c | 41 +++++++++++++++++++----------------------
> > >  1 file changed, 19 insertions(+), 22 deletions(-)
> > > 
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index 018e01daab68..3f64d4b1b19c 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -1093,12 +1093,28 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
> > >  	vm_exit_controls_setbit(vmx, exit);
> > >  }
> > >  
> > > +static void vmx_add_auto_msr(struct vmx_msrs *m, u32 msr, u64 value,
> > > +			     unsigned long vmcs_count_field, struct kvm *kvm)
> > > +{
> > > +	int i;
> > > +
> > > +	i = vmx_find_loadstore_msr_slot(m, msr);
> > > +	if (i < 0) {
> > > +		if (KVM_BUG_ON(m->nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > > +			return;
> > > +
> > > +		i = m->nr++;
> > > +		m->val[i].index = msr;
> > > +		vmcs_write32(vmcs_count_field, m->nr);
> > > +	}
> > > +	m->val[i].value = value;
> > > +}
> > > +
> > >  static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> > >  				  u64 guest_val, u64 host_val)
> > >  {
> > >  	struct msr_autoload *m = &vmx->msr_autoload;
> > >  	struct kvm *kvm = vmx->vcpu.kvm;
> > > -	int i;
> > >  
> > >  	switch (msr) {
> > >  	case MSR_EFER:
> > > @@ -1132,27 +1148,8 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
> > >  		wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
> > >  	}
> > >  
> > > -	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> > > -	if (i < 0) {
> > > -		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > > -			return;
> > > -
> > > -		i = m->guest.nr++;
> > > -		m->guest.val[i].index = msr;
> > > -		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
> > > -	}
> > > -	m->guest.val[i].value = guest_val;
> > > -
> > > -	i = vmx_find_loadstore_msr_slot(&m->host, msr);
> > > -	if (i < 0) {
> > > -		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> > > -			return;
> > > -
> > > -		i = m->host.nr++;
> > > -		m->host.val[i].index = msr;
> > > -		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
> > > -	}
> > > -	m->host.val[i].value = host_val;
> > > +	vmx_add_auto_msr(&m->guest, msr, guest_val, VM_ENTRY_MSR_LOAD_COUNT, kvm);
> > > +	vmx_add_auto_msr(&m->guest, msr, host_val, VM_EXIT_MSR_LOAD_COUNT, kvm);
> > 
> > Shouldn't it be &m->host for the host_val?
> 
> Ouch.  Yes.  How on earth did this escape testing...  Ah, because in practice
> only MSR_IA32_PEBS_ENABLE goes through the load lists, and the VM-Entry load list
> will use the guest's value due to VM_ENTRY_MSR_LOAD_COUNT not covering the bad
> host value.
> 
> Did you happen to run into problems when using PEBS events in the host?

No, I just found it by reading the patch.

> 
> Regardless, do you want to send a patch?  Either way, I'll figure out a way to
> verify the bug and the fix.

Sure, will do.

Thanks,
Namhyung


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
