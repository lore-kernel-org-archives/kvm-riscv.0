Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10732E9A054
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Feb 2026 19:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aSpkXEjWnPIyTt0RDqoWyrOYvOYcIfYD/AVnMcxmRB4=; b=TEU/9OCpIasW51
	ULaBSY1kopX1VTCqNxCs5cYs88d12DjVIsh/rSNGLrbyirAb3fCKV7dzdOPQSgZRKjjO8/U1WMEiZ
	XDkEN3OL0dK5+1rfr9944Am/RRYnV/X6cAHpS6ijeMKkx1W8RcPICoYKRRE1Zzkz7n3iOQkDYcuYK
	9/lEoTnmRyHmLH/sS9TlzQkVKlsFqu4QNZxSPGFtSBsO54S8JJlGsjBrqzHPwV3qlUpQuKDYH8JUc
	2O3YxBvw2Gq+A75dFuw3O5lO/+/eK0n3flDpP+VbzHRZ7dyOI9pWeCTlFXeAS0q5qgPa0JfV9TauM
	Hhj9Ie3YiH6RNLiQOfsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9kB-0000000Bqax-3zPn;
	Thu, 19 Feb 2026 19:31:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt9kA-0000000Bqaj-2UtM;
	Thu, 19 Feb 2026 19:31:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9FE7560054;
	Thu, 19 Feb 2026 19:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0939BC4CEF7;
	Thu, 19 Feb 2026 19:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771529481;
	bh=eEbIoo2q1/IW9azGPa53pZmcMQrNecjqCKNKnaoLUAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eFaGOqs/Ut2CksfJcyyCXPz/G+49WQAqARVkkt7s0uuz77lzNCcFABEsPoxLrM/+/
	 stFVezcwfKsdB5T+uHpWZIfYS+Xkw+9tMLF2j9W7gXqlB2NK2jloyauUQ5R1KtMQ+C
	 pEy8TliEZzi8KHpeXkl39ilFhF+tz5Z7pFd+wMpggDxJcQxP7N1LWGJ+O+4gytrAnf
	 FHPVhqTzXarIfMAIh88xDSwQ9dAJ8j2Tyg6iW+wqHVBG+M2S/f7rDdHSvEn10qzOF7
	 Nt+ju4WrkNa+cagWpaRY3uoJtyitTIw3KEO2S0qTJbt9irBD5+Lm3zpUm4L0Icp1F8
	 QvqvcyrboX9nA==
Date: Thu, 19 Feb 2026 11:31:18 -0800
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
Message-ID: <aZdlBkLEQyv9q5ll@google.com>
References: <20251206001720.468579-1-seanjc@google.com>
 <20251206001720.468579-43-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251206001720.468579-43-seanjc@google.com>
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

Hello,

On Fri, Dec 05, 2025 at 04:17:18PM -0800, Sean Christopherson wrote:
> Add a helper to add an MSR to a VMCS's "auto" list to deduplicate the code
> in add_atomic_switch_msr(), and so that the functionality can be used in
> the future for managing the MSR auto-store list.
> 
> No functional change intended.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 41 +++++++++++++++++++----------------------
>  1 file changed, 19 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index 018e01daab68..3f64d4b1b19c 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -1093,12 +1093,28 @@ static __always_inline void add_atomic_switch_msr_special(struct vcpu_vmx *vmx,
>  	vm_exit_controls_setbit(vmx, exit);
>  }
>  
> +static void vmx_add_auto_msr(struct vmx_msrs *m, u32 msr, u64 value,
> +			     unsigned long vmcs_count_field, struct kvm *kvm)
> +{
> +	int i;
> +
> +	i = vmx_find_loadstore_msr_slot(m, msr);
> +	if (i < 0) {
> +		if (KVM_BUG_ON(m->nr == MAX_NR_LOADSTORE_MSRS, kvm))
> +			return;
> +
> +		i = m->nr++;
> +		m->val[i].index = msr;
> +		vmcs_write32(vmcs_count_field, m->nr);
> +	}
> +	m->val[i].value = value;
> +}
> +
>  static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  				  u64 guest_val, u64 host_val)
>  {
>  	struct msr_autoload *m = &vmx->msr_autoload;
>  	struct kvm *kvm = vmx->vcpu.kvm;
> -	int i;
>  
>  	switch (msr) {
>  	case MSR_EFER:
> @@ -1132,27 +1148,8 @@ static void add_atomic_switch_msr(struct vcpu_vmx *vmx, unsigned msr,
>  		wrmsrq(MSR_IA32_PEBS_ENABLE, 0);
>  	}
>  
> -	i = vmx_find_loadstore_msr_slot(&m->guest, msr);
> -	if (i < 0) {
> -		if (KVM_BUG_ON(m->guest.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> -			return;
> -
> -		i = m->guest.nr++;
> -		m->guest.val[i].index = msr;
> -		vmcs_write32(VM_ENTRY_MSR_LOAD_COUNT, m->guest.nr);
> -	}
> -	m->guest.val[i].value = guest_val;
> -
> -	i = vmx_find_loadstore_msr_slot(&m->host, msr);
> -	if (i < 0) {
> -		if (KVM_BUG_ON(m->host.nr == MAX_NR_LOADSTORE_MSRS, kvm))
> -			return;
> -
> -		i = m->host.nr++;
> -		m->host.val[i].index = msr;
> -		vmcs_write32(VM_EXIT_MSR_LOAD_COUNT, m->host.nr);
> -	}
> -	m->host.val[i].value = host_val;
> +	vmx_add_auto_msr(&m->guest, msr, guest_val, VM_ENTRY_MSR_LOAD_COUNT, kvm);
> +	vmx_add_auto_msr(&m->guest, msr, host_val, VM_EXIT_MSR_LOAD_COUNT, kvm);

Shouldn't it be &m->host for the host_val?

Thanks,
Namhyung

>  }
>  
>  static bool update_transition_efer(struct vcpu_vmx *vmx)
> -- 
> 2.52.0.223.gf5cc29aaa4-goog
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
