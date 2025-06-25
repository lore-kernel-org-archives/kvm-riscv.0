Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8810DC77B7C
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Jun 2025 08:37:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:In-Reply-To:Message-Id:Cc:
	References:From:To:Mime-Version:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=TiK8tF7QgbanIjcaUnriwLOwnjgzgctPnMP0MUgsuwg=; b=CpYxZWY7Gi9Q2sAKiGuSwd/TOw
	IB2BVQ8Xs/Z5x0NBf824ECYWgIlcH0/+diBBa8gXkZnuqd6B+e+/0u/qxxCVuRTBmvCUMb/qeXdx6
	v+fhOOwrJdBnY7bkq/QaPSRrf9K91ZqzcSgZk2/KJpMAUp3UB9N/qQn86QtLP8ekzidopOB0xXCXo
	c9ZvNgamk57KmwyQS+tv5ZbgKlQ5TF/uEAVO60UeJMqOj0R/rgLsy580AaoAUZXTfYYQ/Rg3+ODOg
	cbwLJ6ai2lM9AUGbSm73IZnBeJ9q3sfIC9NqkcWC7X8KV2Hez3YuiQTQBPeaI5A0pO01oQd/itJ4p
	agovC6Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uULcu-00000007yhh-0x5p;
	Wed, 25 Jun 2025 08:37:04 +0000
Received: from va-1-15.ptr.blmpb.com ([209.127.230.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUKkd-00000007qkD-1uhg
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Jun 2025 07:41:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1750837220;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=Igi/Xzy2Sqo3QkpvBSCq+pYDh7kgK5YBvqZ/seq5kj4=;
 b=hfRF4+NS/apm+DL2TJVCzQmMsJngZ1hTkuR1THmjmQJgsac/BS7fnsmhY8Sf+bq9CmsSQR
 Ps8UqUYX9G3MsUJ0vBYSVIQug4/8bR+y2twU6uMM5gjAeV7YrHEPqISx2Y1GNOvjLDrv3H
 rt/lTO5KeuHNZGgcjFmaMg8hOcs9iQXb0wNuObaVS+xLsUCoeWmvcu2/gOKfqUeP1OZBEJ
 2MB2HBjQnz+U9sknUiFfv4zzz0WTWclTTq6guFTSDENXrbPfdHIIIQmBrTpDUaHQcxXmRp
 vCi4TXfCUN8nCHRnP+iEydo9pcg7dcvttEd6CTf/D1yP42416DFrhEfEW8XTcg==
Received: from [127.0.0.1] ([139.226.59.215]) by smtp.feishu.cn with ESMTPS; Wed, 25 Jun 2025 15:40:17 +0800
X-Lms-Return-Path: <lba+2685ba7e2+536441+lists.infradead.org+liujingqi@lanxincomputing.com>
Subject: Re: [PATCH v3 08/12] RISC-V: KVM: Factor-out MMU related declarations into separate headers
Mime-Version: 1.0
To: "Anup Patel" <apatel@ventanamicro.com>, 
	"Atish Patra" <atish.patra@linux.dev>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
References: <20250618113532.471448-1-apatel@ventanamicro.com> <20250618113532.471448-9-apatel@ventanamicro.com>
Cc: "Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, 
	"Andrew Jones" <ajones@ventanamicro.com>, 
	"Anup Patel" <anup@brainfault.org>, <kvm@vger.kernel.org>, 
	<kvm-riscv@lists.infradead.org>, <linux-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, "Atish Patra" <atishp@rivosinc.com>
Message-Id: <f273db65-5271-41bd-b334-85352baa78d6@lanxincomputing.com>
Content-Language: en-US
In-Reply-To: <20250618113532.471448-9-apatel@ventanamicro.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Date: Wed, 25 Jun 2025 15:40:16 +0800
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_004059_654844_52508FF8 
X-CRM114-Status: GOOD (  17.28  )
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
> The MMU, TLB, and VMID management for KVM RISC-V already exists as
> seprate sources so create separate headers along these lines. This
> further simplifies asm/kvm_host.h header.
>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>   arch/riscv/include/asm/kvm_host.h | 100 +-----------------------------
>   arch/riscv/include/asm/kvm_mmu.h  |  26 ++++++++
>   arch/riscv/include/asm/kvm_tlb.h  |  78 +++++++++++++++++++++++
>   arch/riscv/include/asm/kvm_vmid.h |  27 ++++++++
>   arch/riscv/kvm/aia_imsic.c        |   1 +
>   arch/riscv/kvm/main.c             |   1 +
>   arch/riscv/kvm/mmu.c              |   1 +
>   arch/riscv/kvm/tlb.c              |   2 +
>   arch/riscv/kvm/vcpu.c             |   1 +
>   arch/riscv/kvm/vcpu_exit.c        |   1 +
>   arch/riscv/kvm/vm.c               |   1 +
>   arch/riscv/kvm/vmid.c             |   2 +
>   12 files changed, 143 insertions(+), 98 deletions(-)
>   create mode 100644 arch/riscv/include/asm/kvm_mmu.h
>   create mode 100644 arch/riscv/include/asm/kvm_tlb.h
>   create mode 100644 arch/riscv/include/asm/kvm_vmid.h
>
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 6162575e2177..bd5341efa127 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -16,6 +16,8 @@
>   #include <asm/hwcap.h>
>   #include <asm/kvm_aia.h>
>   #include <asm/ptrace.h>
> +#include <asm/kvm_tlb.h>
> +#include <asm/kvm_vmid.h>
>   #include <asm/kvm_vcpu_fp.h>
>   #include <asm/kvm_vcpu_insn.h>
>   #include <asm/kvm_vcpu_sbi.h>
> @@ -56,24 +58,6 @@
>   					 BIT(IRQ_VS_TIMER) | \
>   					 BIT(IRQ_VS_EXT))
>   
> -enum kvm_riscv_hfence_type {
> -	KVM_RISCV_HFENCE_UNKNOWN = 0,
> -	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
> -	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
> -	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
> -	KVM_RISCV_HFENCE_VVMA_GVA,
> -};
> -
> -struct kvm_riscv_hfence {
> -	enum kvm_riscv_hfence_type type;
> -	unsigned long asid;
> -	unsigned long order;
> -	gpa_t addr;
> -	gpa_t size;
> -};
> -
> -#define KVM_RISCV_VCPU_MAX_HFENCE	64
> -
>   struct kvm_vm_stat {
>   	struct kvm_vm_stat_generic generic;
>   };
> @@ -99,15 +83,6 @@ struct kvm_vcpu_stat {
>   struct kvm_arch_memory_slot {
>   };
>   
> -struct kvm_vmid {
> -	/*
> -	 * Writes to vmid_version and vmid happen with vmid_lock held
> -	 * whereas reads happen without any lock held.
> -	 */
> -	unsigned long vmid_version;
> -	unsigned long vmid;
> -};
> -
>   struct kvm_arch {
>   	/* G-stage vmid */
>   	struct kvm_vmid vmid;
> @@ -311,77 +286,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
>   	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
>   }
>   
> -#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
> -
> -void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> -					  gpa_t gpa, gpa_t gpsz,
> -					  unsigned long order);
> -void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
> -void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
> -				     unsigned long order);
> -void kvm_riscv_local_hfence_gvma_all(void);
> -void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
> -					  unsigned long asid,
> -					  unsigned long gva,
> -					  unsigned long gvsz,
> -					  unsigned long order);
> -void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
> -					  unsigned long asid);
> -void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
> -				     unsigned long gva, unsigned long gvsz,
> -				     unsigned long order);
> -void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
> -
> -void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
> -
> -void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
> -void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> -void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
> -
> -void kvm_riscv_fence_i(struct kvm *kvm,
> -		       unsigned long hbase, unsigned long hmask);
> -void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
> -				    unsigned long hbase, unsigned long hmask,
> -				    gpa_t gpa, gpa_t gpsz,
> -				    unsigned long order);
> -void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
> -				    unsigned long hbase, unsigned long hmask);
> -void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
> -				    unsigned long hbase, unsigned long hmask,
> -				    unsigned long gva, unsigned long gvsz,
> -				    unsigned long order, unsigned long asid);
> -void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
> -				    unsigned long hbase, unsigned long hmask,
> -				    unsigned long asid);
> -void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
> -			       unsigned long hbase, unsigned long hmask,
> -			       unsigned long gva, unsigned long gvsz,
> -			       unsigned long order);
> -void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
> -			       unsigned long hbase, unsigned long hmask);
> -
> -int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> -			     phys_addr_t hpa, unsigned long size,
> -			     bool writable, bool in_atomic);
> -void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
> -			      unsigned long size);
> -int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> -			 struct kvm_memory_slot *memslot,
> -			 gpa_t gpa, unsigned long hva, bool is_write);
> -int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
> -void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
> -void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> -void __init kvm_riscv_gstage_mode_detect(void);
> -unsigned long __init kvm_riscv_gstage_mode(void);
> -int kvm_riscv_gstage_gpa_bits(void);
> -
> -void __init kvm_riscv_gstage_vmid_detect(void);
> -unsigned long kvm_riscv_gstage_vmid_bits(void);
> -int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
> -bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
> -void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
> -void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
> -
>   int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
>   
>   void __kvm_riscv_unpriv_trap(void);
> diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
> new file mode 100644
> index 000000000000..4e1654282ee4
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_mmu.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#ifndef __RISCV_KVM_MMU_H_
> +#define __RISCV_KVM_MMU_H_
> +
> +#include <linux/kvm_types.h>
> +
> +int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
> +			     phys_addr_t hpa, unsigned long size,
> +			     bool writable, bool in_atomic);
> +void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
> +			      unsigned long size);
> +int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
> +			 struct kvm_memory_slot *memslot,
> +			 gpa_t gpa, unsigned long hva, bool is_write);
> +int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
> +void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
> +void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
> +void kvm_riscv_gstage_mode_detect(void);
> +unsigned long kvm_riscv_gstage_mode(void);
> +int kvm_riscv_gstage_gpa_bits(void);
> +
> +#endif
> diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
> new file mode 100644
> index 000000000000..cd00c9a46cb1
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_tlb.h
> @@ -0,0 +1,78 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#ifndef __RISCV_KVM_TLB_H_
> +#define __RISCV_KVM_TLB_H_
> +
> +#include <linux/kvm_types.h>
> +
> +enum kvm_riscv_hfence_type {
> +	KVM_RISCV_HFENCE_UNKNOWN = 0,
> +	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
> +	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
> +	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
> +	KVM_RISCV_HFENCE_VVMA_GVA,
> +};
> +
> +struct kvm_riscv_hfence {
> +	enum kvm_riscv_hfence_type type;
> +	unsigned long asid;
> +	unsigned long order;
> +	gpa_t addr;
> +	gpa_t size;
> +};
> +
> +#define KVM_RISCV_VCPU_MAX_HFENCE	64
> +
> +#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
> +
> +void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
> +					  gpa_t gpa, gpa_t gpsz,
> +					  unsigned long order);
> +void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
> +void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
> +				     unsigned long order);
> +void kvm_riscv_local_hfence_gvma_all(void);
> +void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
> +					  unsigned long asid,
> +					  unsigned long gva,
> +					  unsigned long gvsz,
> +					  unsigned long order);
> +void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
> +					  unsigned long asid);
> +void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
> +				     unsigned long gva, unsigned long gvsz,
> +				     unsigned long order);
> +void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
> +
> +void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
> +
> +void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
> +void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
> +void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
> +
> +void kvm_riscv_fence_i(struct kvm *kvm,
> +		       unsigned long hbase, unsigned long hmask);
> +void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
> +				    unsigned long hbase, unsigned long hmask,
> +				    gpa_t gpa, gpa_t gpsz,
> +				    unsigned long order);
> +void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
> +				    unsigned long hbase, unsigned long hmask);
> +void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
> +				    unsigned long hbase, unsigned long hmask,
> +				    unsigned long gva, unsigned long gvsz,
> +				    unsigned long order, unsigned long asid);
> +void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
> +				    unsigned long hbase, unsigned long hmask,
> +				    unsigned long asid);
> +void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
> +			       unsigned long hbase, unsigned long hmask,
> +			       unsigned long gva, unsigned long gvsz,
> +			       unsigned long order);
> +void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
> +			       unsigned long hbase, unsigned long hmask);
> +
> +#endif
> diff --git a/arch/riscv/include/asm/kvm_vmid.h b/arch/riscv/include/asm/kvm_vmid.h
> new file mode 100644
> index 000000000000..ab98e1434fb7
> --- /dev/null
> +++ b/arch/riscv/include/asm/kvm_vmid.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2025 Ventana Micro Systems Inc.
> + */
> +
> +#ifndef __RISCV_KVM_VMID_H_
> +#define __RISCV_KVM_VMID_H_
> +
> +#include <linux/kvm_types.h>
> +
> +struct kvm_vmid {
> +	/*
> +	 * Writes to vmid_version and vmid happen with vmid_lock held
> +	 * whereas reads happen without any lock held.
> +	 */
> +	unsigned long vmid_version;
> +	unsigned long vmid;
> +};
> +
> +void __init kvm_riscv_gstage_vmid_detect(void);
> +unsigned long kvm_riscv_gstage_vmid_bits(void);
> +int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
> +bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
> +void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
> +void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
> +
> +#endif
> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
> index 29ef9c2133a9..40b469c0a01f 100644
> --- a/arch/riscv/kvm/aia_imsic.c
> +++ b/arch/riscv/kvm/aia_imsic.c
> @@ -16,6 +16,7 @@
>   #include <linux/swab.h>
>   #include <kvm/iodev.h>
>   #include <asm/csr.h>
> +#include <asm/kvm_mmu.h>
>   
>   #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
>   
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 4b24705dc63a..b861a5dd7bd9 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/kvm_host.h>
>   #include <asm/cpufeature.h>
> +#include <asm/kvm_mmu.h>
>   #include <asm/kvm_nacl.h>
>   #include <asm/sbi.h>
>   
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index a5387927a1c1..c1a3eb076df3 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -15,6 +15,7 @@
>   #include <linux/vmalloc.h>
>   #include <linux/kvm_host.h>
>   #include <linux/sched/signal.h>
> +#include <asm/kvm_mmu.h>
>   #include <asm/kvm_nacl.h>
>   #include <asm/page.h>
>   #include <asm/pgtable.h>
> diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
> index f46a27658c2e..6fc4361c3d75 100644
> --- a/arch/riscv/kvm/tlb.c
> +++ b/arch/riscv/kvm/tlb.c
> @@ -15,6 +15,8 @@
>   #include <asm/cpufeature.h>
>   #include <asm/insn-def.h>
>   #include <asm/kvm_nacl.h>
> +#include <asm/kvm_tlb.h>
> +#include <asm/kvm_vmid.h>
>   
>   #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>   
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 6eb11c913b13..8ad7b31f5939 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -18,6 +18,7 @@
>   #include <linux/fs.h>
>   #include <linux/kvm_host.h>
>   #include <asm/cacheflush.h>
> +#include <asm/kvm_mmu.h>
>   #include <asm/kvm_nacl.h>
>   #include <asm/kvm_vcpu_vector.h>
>   
> diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
> index 85c43c83e3b9..965df528de90 100644
> --- a/arch/riscv/kvm/vcpu_exit.c
> +++ b/arch/riscv/kvm/vcpu_exit.c
> @@ -9,6 +9,7 @@
>   #include <linux/kvm_host.h>
>   #include <asm/csr.h>
>   #include <asm/insn-def.h>
> +#include <asm/kvm_mmu.h>
>   #include <asm/kvm_nacl.h>
>   
>   static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index b27ec8f96697..8601cf29e5f8 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/uaccess.h>
>   #include <linux/kvm_host.h>
> +#include <asm/kvm_mmu.h>
>   
>   const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
>   	KVM_GENERIC_VM_STATS()
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 92c01255f86f..3b426c800480 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -14,6 +14,8 @@
>   #include <linux/smp.h>
>   #include <linux/kvm_host.h>
>   #include <asm/csr.h>
> +#include <asm/kvm_tlb.h>
> +#include <asm/kvm_vmid.h>
>   
>   static unsigned long vmid_version = 1;
>   static unsigned long vmid_next;

Reviewed-by: Nutty Liu <liujingqi@lanxincomputing.com>

Thanks,
Nutty

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
