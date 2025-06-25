Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAE1C7115C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Mime-Version:From:References
	:Subject:In-Reply-To:Cc:To:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4uyRACWo0O5KHoE9uPoSTbrOiQ0ozaJKddEqaYPEO+s=; b=QbSrC75oWtzoT9
	lLRBXSPob3fSrHfVpuE52N5as2X+rinGvQIBDzmYs00sE7NYfkKrTQk0beZ1hqdygrmFyOCvd+3f7
	WRzm0NccuSUiGcAvEJGB0AfmFtjQv7iJyWvuTvKHw8q9QodlqhlIBE5DarDpBxC67EMwsB0IAcU3+
	TVazb7ZXyq2pP4e7dWb3GhLihcg60YamzjmJrIOfhZPTbOTG1qyuV89+6g3QiI5/6v50A+iktvIGb
	A5BLuPW2ip9EhjHstTDrBMQA40+WC3UZ2jaHjckkVAcBoTp+eTzhfRnijh12uO0+p2DP8NPfVxhtr
	MTe+iiUbgpDJJal76V4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULhh-00000007znU-0l20;
	Wed, 25 Jun 2025 08:42:01 +0000
Received: from sg-1-17.ptr.blmpb.com ([118.26.132.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKyn-00000007sby-02Em
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:55:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750838130;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Uwcz+ylJEsmNE1CVgp+CscW5a5nPPX8eXKPrXaxr/uc=;
 b=mBTR6PgjmCU+frhNcEwLlXR8N78NYFR8ZiLbDiT1l99f1D6q6v6n28ASL4Jth+22MTKN5R
 od9MIDiPk92CTCB68s4YSWslGs0z5R/hFySbeZxwLvuaA3lIJDCkijGpShrs008oP1ZYLG
 Ty0N2gbiXvW57po93CoX3okpkXIZJgImBlZKD0npBeUS/nwMQgG35eHcRakGfSQ6zeabf+
 LiUXO0kpinv+JCj3aRVRGSWA3RzORVORACUy6QXDZ5+cbehoAIcoIv1wU5oFDLxZjQdyXG
 BaN2X0DNNaLwAL4HmPkzfS1Ap2yU29Wz5a+a06BUMlvWjfnIHRHQWYTrW0txfg==
Date: Wed, 25 Jun 2025 15:55:25 +0800
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:55:27 +0800
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
In-Reply-To: <20250618113532.471448-11-apatel@ventanamicro.com>
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/12] RISC-V: KVM: Add vmid field to struct kvm_riscv_hfence
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-11-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Content-Language: en-US
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Mime-Version: 1.0
Message-Id: <e074d79d-a8c6-42c6-bffb-543112778c1b@lanxincomputing.com>
X-Lms-Return-Path: <lba+2685bab70+5a618b+lists.infradead.org+liujingqi@lanxincomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_005537_407094_8D9CE417 
X-CRM114-Status: GOOD (  14.07  )
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

On 6/18/2025 7:35 PM, Anup Patel wrote:
> Currently, the struct kvm_riscv_hfence does not have vmid field
> and various hfence processing functions always pick vmid assigned
> to the guest/VM. This prevents us from doing hfence operation on
> arbitrary vmid hence add vmid field to struct kvm_riscv_hfence
> and use it wherever applicable.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
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

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
