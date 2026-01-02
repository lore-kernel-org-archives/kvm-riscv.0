Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16FAFA3728
	for <kvm-riscv@archiver.kernel.org>; Fri,  2 Jan 2026 17:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mr/3/tdTTQFIM56+O+YAkG+4KaefNEwol/U0aGlLCT4=; b=AYeM5gtEENDLGv
	U62T3qwf6ssar5OLN9WWfXJcquEjmKA8ePd2/EzxTxJANm9ikFoN1xBvTrbrmr6Z/blq3vSO8vudz
	5Xfpb6IsLLrxKmjvqTNCLvzxP65KhdFRrdqB/j8USdYihwTZP4jjWK3iCS1cmfa+Rh1ga//hK3A+N
	YHQZGOP5+iPEzQ0mDjBYs4E+j8xPMDhl4AsVEyND8sOUCYQhEmD5FgKyhnYkSTR+FWTR2iYA48sG2
	XVptVK/JjQe9QnyYdiv+UPCfG2EX/aEjQQUe5YBvqcFB/2EgTWJGRXADozaJN2+iauZay34+FOcT9
	9++sk9Pay/HCSB+mPqJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbihk-00000008Yj3-2oTR;
	Fri, 02 Jan 2026 17:12:48 +0000
Received: from out-180.mta1.migadu.com ([2001:41d0:203:375::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbihi-00000008Yi7-33qP;
	Fri, 02 Jan 2026 17:12:48 +0000
Date: Fri, 2 Jan 2026 17:12:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767373964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=rBw6jLCJqAbKt1gkP3x7IcMHDaYkQ9qOJdP3tWYRjcc=;
	b=tE3edi5dhKdd1e36NLf+C61+fg98V5chjikLV24JwFiW9GnZCHh5NRwOvEyOW+ozrhieYo
	hHIlCrKKBYF/gSbrNYalY/OPgEJM8dNARujl6Uiuqa5V2geAPoIry9JOrOcH4h/2f3DEhM
	mOCd6qfzfDqEhcx2+z7etRL8NSM+u64=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yosry Ahmed <yosry.ahmed@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, loongarch@lists.linux.dev, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/21] KVM: selftests: Stop passing VMX metadata to
 TDP mapping functions
Message-ID: <rkbap4vemw6yu52djlg7lerquuhucw3urlvbvfpekfxgnibosf@ijebzfchpulp>
References: <20251230230150.4150236-1-seanjc@google.com>
 <20251230230150.4150236-12-seanjc@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251230230150.4150236-12-seanjc@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_091247_042689_8B2FF2F2 
X-CRM114-Status: GOOD (  20.00  )
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

On Tue, Dec 30, 2025 at 03:01:40PM -0800, Sean Christopherson wrote:
> From: Yosry Ahmed <yosry.ahmed@linux.dev>
> 
> The root GPA can now be retrieved from the nested MMU, stop passing VMX
> metadata. This is in preparation for making these functions work for
> NPTs as well.
> 
> Opportunistically drop tdp_pg_map() since it's unused.
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/include/x86/vmx.h | 11 ++-----
>  .../testing/selftests/kvm/lib/x86/memstress.c | 11 +++----
>  tools/testing/selftests/kvm/lib/x86/vmx.c     | 33 +++++++------------
>  .../selftests/kvm/x86/vmx_dirty_log_test.c    |  9 +++--
>  4 files changed, 24 insertions(+), 40 deletions(-)
> 
> diff --git a/tools/testing/selftests/kvm/include/x86/vmx.h b/tools/testing/selftests/kvm/include/x86/vmx.h
> index 1fd83c23529a..4dd4c2094ee6 100644
> --- a/tools/testing/selftests/kvm/include/x86/vmx.h
> +++ b/tools/testing/selftests/kvm/include/x86/vmx.h
> @@ -557,14 +557,9 @@ bool load_vmcs(struct vmx_pages *vmx);
>  
>  bool ept_1g_pages_supported(void);
>  
> -void tdp_pg_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
> -		uint64_t paddr);
> -void tdp_map(struct vmx_pages *vmx, struct kvm_vm *vm, uint64_t nested_paddr,
> -	     uint64_t paddr, uint64_t size);
> -void tdp_identity_map_default_memslots(struct vmx_pages *vmx,
> -				       struct kvm_vm *vm);
> -void tdp_identity_map_1g(struct vmx_pages *vmx, struct kvm_vm *vm,
> -			 uint64_t addr, uint64_t size);
> +void tdp_map(struct kvm_vm *vm, uint64_t nested_paddr, uint64_t paddr, uint64_t size);
> +void tdp_identity_map_default_memslots(struct kvm_vm *vm);
> +void tdp_identity_map_1g(struct kvm_vm *vm,  uint64_t addr, uint64_t size);
>  bool kvm_cpu_has_ept(void);
>  void vm_enable_ept(struct kvm_vm *vm);
>  void prepare_virtualize_apic_accesses(struct vmx_pages *vmx, struct kvm_vm *vm);
> diff --git a/tools/testing/selftests/kvm/lib/x86/memstress.c b/tools/testing/selftests/kvm/lib/x86/memstress.c
> index 00f7f11e5f0e..3319cb57a78d 100644
> --- a/tools/testing/selftests/kvm/lib/x86/memstress.c
> +++ b/tools/testing/selftests/kvm/lib/x86/memstress.c
> @@ -59,7 +59,7 @@ uint64_t memstress_nested_pages(int nr_vcpus)
>  	return 513 + 10 * nr_vcpus;
>  }
>  
> -static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *vm)
> +static void memstress_setup_ept_mappings(struct kvm_vm *vm)
>  {
>  	uint64_t start, end;
>  
> @@ -68,16 +68,15 @@ static void memstress_setup_ept_mappings(struct vmx_pages *vmx, struct kvm_vm *v
>  	 * KVM can shadow the EPT12 with the maximum huge page size supported
>  	 * by the backing source.
>  	 */
> -	tdp_identity_map_1g(vmx, vm, 0, 0x100000000ULL);
> +	tdp_identity_map_1g(vm, 0, 0x100000000ULL);
>  
>  	start = align_down(memstress_args.gpa, PG_SIZE_1G);
>  	end = align_up(memstress_args.gpa + memstress_args.size, PG_SIZE_1G);
> -	tdp_identity_map_1g(vmx, vm, start, end - start);
> +	tdp_identity_map_1g(vm, start, end - start);
>  }
>  
>  void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vcpus[])
>  {
> -	struct vmx_pages *vmx;
>  	struct kvm_regs regs;
>  	vm_vaddr_t vmx_gva;
>  	int vcpu_id;
> @@ -87,11 +86,11 @@ void memstress_setup_nested(struct kvm_vm *vm, int nr_vcpus, struct kvm_vcpu *vc
>  
>  	vm_enable_ept(vm);
>  	for (vcpu_id = 0; vcpu_id < nr_vcpus; vcpu_id++) {
> -		vmx = vcpu_alloc_vmx(vm, &vmx_gva);
> +		vcpu_alloc_vmx(vm, &vmx_gva);
>  
>  		/* The EPTs are shared across vCPUs, setup the mappings once */
>  		if (vcpu_id == 0)
> -			memstress_setup_ept_mappings(vmx, vm);
> +			memstress_setup_ept_mappings(vm);

Oh and if you're feeling nitpicky while applying, I think this call can
actually be moved outside of the loop now, right after vm_enable_ept(),
dropping the whole vcpu_id == 0 special case.

>  
>  		/*
>  		 * Override the vCPU to run memstress_l1_guest_code() which will

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
