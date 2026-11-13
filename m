Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73361606A31C
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 11:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NpP+D01n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lanxincomputing-com.20200927.dkim.feishu.cn header.i=@lanxincomputing-com.20200927.dkim.feishu.cn header.a=rsa-sha256 header.s=s1 header.b=2RJOnBmK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:In-Reply-To:Cc:To:Message-Id:
	From:Date:References:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oha6/jL0QpawG8TyCtijxFh572xaKvJwtC3fSPBHu1w=; b=NpP+D01nJQujsnfMX/ml5gmv/t
	oSf6hZXiQxSUSrRTsCHBWA/o9Z8sd27EhGm8M7+VyVPXb12sDNvvxEh0if/uz7G8wYqM5G7HfJDuI
	8QSUdvxAhUtY9Ez67CvhSbyIVqA71zjhyw8RVZYbOujOZ0p122q0zihX6jjgpXrx/VRgx7Zq4f/Nu
	NDOlAQp/R8UY9TYtkHPxZnfEY1TNSviyERaGUkBYfXELQCNrpVsRFX1mg+IPGyqRjc2D0LxeSgvA1
	w9Tg16lQPMIw9V14rmaIACwzLbemQqE1f4VcqAmezRLc9sMJUSqHmZ86M7px01pRWwIy90T8jNIjH
	NuDW1DxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpE0-0000000CV0R-0qs5;
	Fri, 13 Nov 2026 11:13:44 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRpDw-0000000CUyz-0XeN
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 11:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1794568414;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=5z3kRYBTZmascmZC3oBJ58Ce4ddSnbuJ0JbdYHj/1JU=;
 b=2RJOnBmKuMtUQ3+7IjG6Woaz9wyDDKqGAWaPEXWgDpQ6L0ZMktXmmcskyvJgoPA1s8ySnU
 XOGqIVBBbQzYPgnjEtbRYedF7VAboqEbExRMDAyiy2wfZHspHWHcn6iofRahw+d6UdPeGS
 I8PP/wrNOGlTgaEKF7GuVQWQXftQJYychqFFQivbPyXwjIEu1EsU2md39CVBs8DZKgKK0y
 qkxnp+itHCmfHcS16ymXylwInrux69aSf5sOCcvlyQVDdlKE9ECuZqndzOKu+6cAGzu1Df
 nkn0/avjcVxiIoZckUUsXepzV4VNTUhzQkYJGkEmjYLEzzD4CvbfkMZUGiOspg==
Content-Language: en-US
Received: from [127.0.0.1] ([123.120.5.129]) by smtp.feishu.cn with ESMTPS; Fri, 13 Nov 2026 19:13:31 +0800
X-Lms-Return-Path: <lba+26af6f0dc+720d7e+lists.infradead.org+xiangwencheng@lanxincomputing.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261113101358.3007601-1-xiangwencheng@lanxincomputing.com> <sashiko-outbox-212624@kernel.org>
Date: Fri, 13 Nov 2026 19:13:29 +0800
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Message-Id: <44886809-744d-4e4d-9a55-45e2fcc6dd08@lanxincomputing.com>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
To: "Anup Patel" <anup@brainfault.org>
Cc: <xb@ultrarisc.com>, <atish.patra@linux.dev>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<pbonzini@redhat.com>, <graf@amazon.com>, 
	<kvm-riscv@lists.infradead.org>, <kvm@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
In-Reply-To: <sashiko-outbox-212624@kernel.org>
Subject: Re: [PATCH v4] RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
User-Agent: Mozilla Thunderbird
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_031340_272537_EE079BD0 
X-CRM114-Status: GOOD (  18.57  )
X-Spam-Score: -1.9 (-)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/2026 6:34 PM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issues to consider:
> - [High] RISC-V: KVM: stale topei passed to
>    __imsic_swfile_extirq_update()
> - [High] RISC-V: KVM: imsic->swfile dereferenced before !imsic check in
>    inject
> - [Low] RISC-V: KVM: missing Fixes trailer on IMSIC TOPEI serialization
>    fix
> --
> 
> commit 322bd38f6016b31c1cdf5b875effdce4436f4b2f
> Author: BillXiang <xiangwencheng@lanxincomputing.com>
> 
>> RISC-V: KVM: Serialize and atomize the IMSIC's TOPEI read-and-clear operation
>>
>> The TOPEI read-and-clear must be atomic with respect to
>> interrupt injection (set_bit in EIP). Otherwise an
>> interrupt injected between the topei read and the
>> clear_bit could be silently dropped.
>>
>> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
> 
> [Severity: Low]
> Since this fixes a race in the IMSIC software file TOPEI handling, should
> it include:
> 
>    Fixes: db8b7e97d613 ("RISC-V: KVM: Add in-kernel virtualization of AIA IMSIC")
> 
>> diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
>> index 302938972aa0e..f4cc1691e0478 100644
>> --- a/arch/riscv/kvm/aia_imsic.c
>> +++ b/arch/riscv/kvm/aia_imsic.c
>> @@ -526,26 +526,25 @@ static void imsic_vsfile_cleanup(struct imsic *imsic)
>>   		kvm_riscv_aia_free_hgei(old_vsfile_cpu, old_vsfile_hgei);
>>   }
>>   
>> -static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
>> +static void __imsic_swfile_extirq_update(struct kvm_vcpu *vcpu, u32 topei)
>>   {
>>   	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
>>   	struct imsic_mrif *mrif = imsic->swfile;
>> -	unsigned long flags;
>> -
>> -	/*
>> -	 * The critical section is necessary during external interrupt
>> -	 * updates to avoid the risk of losing interrupts due to potential
>> -	 * interruptions between reading topei and updating pending status.
>> -	 */
>> -
>> -	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
>>   
>> -	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) &&
>> -	    imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis))
>> +	if (imsic_mrif_atomic_read(mrif, &mrif->eidelivery) && topei)
>>   		kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT);
>>   	else
>>   		kvm_riscv_vcpu_unset_interrupt(vcpu, IRQ_VS_EXT);
>> +}
>> +
>> +static void imsic_swfile_extirq_update(struct kvm_vcpu *vcpu)
>> +{
>> +	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
>> +	struct imsic_mrif *mrif = imsic->swfile;
>> +	unsigned long flags;
>>   
>> +	raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
>> +	__imsic_swfile_extirq_update(vcpu, imsic_mrif_topei(mrif, imsic->nr_eix, imsic->nr_msis));
>>   	raw_spin_unlock_irqrestore(&imsic->swfile_extirq_lock, flags);
>>   }
>>   
>> @@ -830,12 +829,15 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
>>   	struct imsic_mrif_eix *eix;
>>   	int r, rc = KVM_INSN_CONTINUE_NEXT_SEPC;
>>   	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
>> +	unsigned long flags;
>>   
>>   	/* If IMSIC vCPU state not initialized then forward to user space */
>>   	if (!imsic)
>>   		return KVM_INSN_EXIT_TO_USER_SPACE;
>>   
>>   	if (isel == KVM_RISCV_AIA_IMSIC_TOPEI) {
>> +		raw_spin_lock_irqsave(&imsic->swfile_extirq_lock, flags);
>> +
>>   		/* Read pending and enabled interrupt with highest priority */
>>   		topei = imsic_mrif_topei(imsic->swfile, imsic->nr_eix,
>>   					 imsic->nr_msis);
>> @@ -852,16 +854,20 @@ int kvm_riscv_vcpu_aia_imsic_rmw(struct kvm_vcpu *vcpu, unsigned long isel,
>>   					  eix->eip);
>>   			}
>>   		}
>> +		if (wr_mask)
>> +			__imsic_swfile_extirq_update(vcpu, topei);
> 
> [Severity: High]
> Does this pass the pre-clear interrupt ID in topei to
> __imsic_swfile_extirq_update() instead of re-reading imsic_mrif_topei()
> after clear_bit()?
> 
> When a guest claims the last pending interrupt in imsic->swfile via a
> TOPEI write, topei still holds the non-zero ID that was just cleared from
> eix->eip.  __imsic_swfile_extirq_update() then calls
> kvm_riscv_vcpu_set_interrupt(vcpu, IRQ_VS_EXT) instead of unsetting
> IRQ_VS_EXT, leaving IRQ_VS_EXT asserted and causing spurious guest
> external interrupt traps.
> 
> [ ... ]
> 
>> @@ -959,6 +965,7 @@ int kvm_riscv_vcpu_aia_imsic_inject(struct kvm_vcpu *vcpu,
>>   	unsigned long flags;
>>   	struct imsic_mrif_eix *eix;
>>   	struct imsic *imsic = vcpu->arch.aia_context.imsic_state;
>> +	struct imsic_mrif *mrif = imsic->swfile;
>>   
>>   	/* We only emulate one IMSIC MMIO page for each Guest VCPU */
>>   	if (!imsic || !iid || guest_index ||
> 
> [Severity: High]
> Does imsic->swfile dereference a NULL imsic pointer before the !imsic
> check below?  If a vCPU is created after aia_init(), its imsic_state is
> NULL and injecting an MSI to that vCPU will crash the host kernel instead
> of returning -ENODEV.
> 

Ignore this version.

Regards,
Bill

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
