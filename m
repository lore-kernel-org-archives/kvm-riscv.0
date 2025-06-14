Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0575FC71150
	for <kvm-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 19:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3V45vbOVeSF3emXKYNozRc6/dZ8GrRxXuqaIZjXI+c=; b=F57UMcRMzHaEnG
	IfulL4fRumhskBMgj2TaaGnjMrR3rmCImJzkBPj/m9dHrNUVN4CqRy35SIb5j4Olxs+csHLbu0FWY
	dYzhKQfH1xNdUrgmI/GB1XOWMKdXaemRplMs4nbu+sD2vrRy2y1l0oLIYTtWY+LirwoC+/ZepMn/W
	vT5fEjyiRw2epXaL6+QqAO1kyo9YB1pQGKZ+mFgX/wFNg+zYWCi/5LOI+SSaeoA0FVKA9fsS3jb2w
	Z3YHVuyCV9TfBlcLQLA7S/y4B+M4gTyDMjnyGFZHJnt5263X2TvkQSF1GztBqMeQlfxJiQjv4vXmx
	uXWET1e6/wkyxKAoOMUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWZZ-00000001kLg-31ck;
	Sat, 14 Jun 2025 19:29:49 +0000
Received: from out-171.mta1.migadu.com ([2001:41d0:203:375::ab])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQWZX-00000001kJy-1NYB
	for kvm-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 19:29:48 +0000
Message-ID: <a581401c-01e1-45b6-a55e-0361185114ff@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749929375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xN5d4MLrE2OQ8z204hwuo+c3IAo79fmudrGii3bZ0SQ=;
	b=gu4kqTYosEX2z8Jawy6sUn46pmdpjICOMDHx+kLeGU0mzgiTJ4fVGt/ibuHu5MUM0+R9Mu
	P1YwF+4/pf/EbxfN6DYizSvGglPO8OCBpveXpJNJdfdrPY0huFfbinUlr/3016VVYNgXIj
	mWnCv6Up2cMXDw/23G+K2QwBYkzdvd0=
Date: Sat, 14 Jun 2025 12:29:28 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 10/12] RISC-V: KVM: Add vmid field to struct
 kvm_riscv_hfence
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250613065743.737102-1-apatel@ventanamicro.com>
 <20250613065743.737102-11-apatel@ventanamicro.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250613065743.737102-11-apatel@ventanamicro.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_122947_654448_FB4ECC2E 
X-CRM114-Status: GOOD (  15.08  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org


On 6/12/25 11:57 PM, Anup Patel wrote:
> Currently, the struct kvm_riscv_hfence does not have vmid field
> and various hfence processing functions always pick vmid assigned
> to the guest/VM. This prevents us from doing hfence operation on
> arbitrary vmid hence add vmid field to struct kvm_riscv_hfence
> and use it wherever applicable.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_tlb.h |  1 +
>   arch/riscv/kvm/tlb.c             | 30 ++++++++++++++++--------------
>   2 files changed, 17 insertions(+), 14 deletions(-)
>
> diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
> index cd00c9a46cb1..f67e03edeaec 100644
> --- a/arch/riscv/include/asm/kvm_tlb.h
> +++ b/arch/riscv/include/asm/kvm_tlb.h
> @@ -19,6 +19,7 @@ enum kvm_riscv_hfence_type {
>   struct kvm_riscv_hfence {
>   	enum kvm_riscv_hfence_type type;
>   	unsigned long asid;
> +	unsigned long vmid;
>   	unsigned long order;
>   	gpa_t addr;
>   	gpa_t size;
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index 6fc4361c3d75..349fcfc93f54 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -237,49 +237,43 @@ static bool vcpu_hfence_enqueue(struct kvm_vcpu *vcpu,
>   
>   void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu)
>   {
> -	unsigned long vmid;
>   	struct kvm_riscv_hfence d = { 0 };
> -	struct kvm_vmid *v = &vcpu->kvm->arch.vmid;
>   
>   	while (vcpu_hfence_dequeue(vcpu, &d)) {
>   		switch (d.type) {
>   		case KVM_RISCV_HFENCE_UNKNOWN:
>   			break;
>   		case KVM_RISCV_HFENCE_GVMA_VMID_GPA:
> -			vmid = READ_ONCE(v->vmid);
>   			if (kvm_riscv_nacl_available())
> -				nacl_hfence_gvma_vmid(nacl_shmem(), vmid,
> +				nacl_hfence_gvma_vmid(nacl_shmem(), d.vmid,
>   						      d.addr, d.size, d.order);
>   			else
> -				kvm_riscv_local_hfence_gvma_vmid_gpa(vmid, d.addr,
> +				kvm_riscv_local_hfence_gvma_vmid_gpa(d.vmid, d.addr,
>   								     d.size, d.order);
>   			break;
>   		case KVM_RISCV_HFENCE_VVMA_ASID_GVA:
>   			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
> -			vmid = READ_ONCE(v->vmid);
>   			if (kvm_riscv_nacl_available())
> -				nacl_hfence_vvma_asid(nacl_shmem(), vmid, d.asid,
> +				nacl_hfence_vvma_asid(nacl_shmem(), d.vmid, d.asid,
>   						      d.addr, d.size, d.order);
>   			else
> -				kvm_riscv_local_hfence_vvma_asid_gva(vmid, d.asid, d.addr,
> +				kvm_riscv_local_hfence_vvma_asid_gva(d.vmid, d.asid, d.addr,
>   								     d.size, d.order);
>   			break;
>   		case KVM_RISCV_HFENCE_VVMA_ASID_ALL:
>   			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_ASID_RCVD);
> -			vmid = READ_ONCE(v->vmid);
>   			if (kvm_riscv_nacl_available())
> -				nacl_hfence_vvma_asid_all(nacl_shmem(), vmid, d.asid);
> +				nacl_hfence_vvma_asid_all(nacl_shmem(), d.vmid, d.asid);
>   			else
> -				kvm_riscv_local_hfence_vvma_asid_all(vmid, d.asid);
> +				kvm_riscv_local_hfence_vvma_asid_all(d.vmid, d.asid);
>   			break;
>   		case KVM_RISCV_HFENCE_VVMA_GVA:
>   			kvm_riscv_vcpu_pmu_incr_fw(vcpu, SBI_PMU_FW_HFENCE_VVMA_RCVD);
> -			vmid = READ_ONCE(v->vmid);
>   			if (kvm_riscv_nacl_available())
> -				nacl_hfence_vvma(nacl_shmem(), vmid,
> +				nacl_hfence_vvma(nacl_shmem(), d.vmid,
>   						 d.addr, d.size, d.order);
>   			else
> -				kvm_riscv_local_hfence_vvma_gva(vmid, d.addr,
> +				kvm_riscv_local_hfence_vvma_gva(d.vmid, d.addr,
>   								d.size, d.order);
>   			break;
>   		default:
> @@ -336,10 +330,12 @@ void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
>   				    gpa_t gpa, gpa_t gpsz,
>   				    unsigned long order)
>   {
> +	struct kvm_vmid *v = &kvm->arch.vmid;
>   	struct kvm_riscv_hfence data;
>   
>   	data.type = KVM_RISCV_HFENCE_GVMA_VMID_GPA;
>   	data.asid = 0;
> +	data.vmid = READ_ONCE(v->vmid);
>   	data.addr = gpa;
>   	data.size = gpsz;
>   	data.order = order;
> @@ -359,10 +355,12 @@ void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
>   				    unsigned long gva, unsigned long gvsz,
>   				    unsigned long order, unsigned long asid)
>   {
> +	struct kvm_vmid *v = &kvm->arch.vmid;
>   	struct kvm_riscv_hfence data;
>   
>   	data.type = KVM_RISCV_HFENCE_VVMA_ASID_GVA;
>   	data.asid = asid;
> +	data.vmid = READ_ONCE(v->vmid);
>   	data.addr = gva;
>   	data.size = gvsz;
>   	data.order = order;
> @@ -374,10 +372,12 @@ void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
>   				    unsigned long hbase, unsigned long hmask,
>   				    unsigned long asid)
>   {
> +	struct kvm_vmid *v = &kvm->arch.vmid;
>   	struct kvm_riscv_hfence data;
>   
>   	data.type = KVM_RISCV_HFENCE_VVMA_ASID_ALL;
>   	data.asid = asid;
> +	data.vmid = READ_ONCE(v->vmid);
>   	data.addr = data.size = data.order = 0;
>   	make_xfence_request(kvm, hbase, hmask, KVM_REQ_HFENCE,
>   			    KVM_REQ_HFENCE_VVMA_ALL, &data);
> @@ -388,10 +388,12 @@ void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
>   			       unsigned long gva, unsigned long gvsz,
>   			       unsigned long order)
>   {
> +	struct kvm_vmid *v = &kvm->arch.vmid;
>   	struct kvm_riscv_hfence data;
>   
>   	data.type = KVM_RISCV_HFENCE_VVMA_GVA;
>   	data.asid = 0;
> +	data.vmid = READ_ONCE(v->vmid);
>   	data.addr = gva;
>   	data.size = gvsz;
>   	data.order = order;
Reviewed-by: Atish Patra <atishp@rivosinc.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
