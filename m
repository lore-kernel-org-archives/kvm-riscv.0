Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91158EA794C
	for <kvm-riscv@archiver.kernel.org>; Thu,  5 Feb 2026 01:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fx9sGbrtVElJm9kFlwwnkIIhvG1EISwa4KiX2WRy8Rk=; b=l6Juf6fAi6hceR
	ZjfrDu5Xd14tLYuXmOgF8YrbpRkuBoIRDYYj0/ETpuAKlbbOf/ts3Axe70idHRzzZ4sev0c41yX1u
	+0dQzIo8dDNhGaoUH8V2bfDW+lQDCTHZ3aXJ9wXOhTEs+RGe1pTZ+4NWMV8jkXpElSUX85zKqr2TP
	a/i8EJ+2GxfTaO7eOQe9tW26BJn128idCvL0TXr2q30Z14qI1KUIZ1DFQA1cyuOatDYe8GC5Lge7b
	MnzxZsBAfiHXvUIcLMpCLzsuSgd2Vh0kN/Gxt4uUphwJp/bMx7HIivIrlvF5s1FxPgpUT1+GfiR2s
	3SmzGATRT7Talr6fZcnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoAV-00000009GMG-0UCa;
	Thu, 05 Feb 2026 01:28:27 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnoAQ-00000009GLO-3B0y;
	Thu, 05 Feb 2026 01:28:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1770254895; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=ch2lw3Gkx/tmSQGhjBy06LxNeqZ/lvoi8ni6rWgh66M=;
	b=yGA9ZSnFPe0kW6jneI9Ffxs11MOU+imY89sxh+VOCRLTMJaz51YukP0nsdL58YoC4VnIDQd56+2E6L+jXCLkakcZhZcqbPKwgd/FcqMQJbpyaAhwvcflUOyxsUCqHkrmlHX7LC8nci8EKv2S86uUhOM+6Khz/Akk8nKVnYVQ3e0=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WyZ3nte_1770254889 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 05 Feb 2026 09:28:11 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	corbet@lwn.net,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	radim.krcmar@oss.qualcomm.com
Subject: Re: Re: [PATCH v5 3/3] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Date: Thu,  5 Feb 2026 09:28:08 +0800
Message-Id: <20260205012808.98973-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
References: <ocfqo4zpsg6yyaz6kd65jrvudtb35uerdsueazqdk6w7c5lvdf@wvwzhc57gxez>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_172823_797958_F12B5C22 
X-CRM114-Status: GOOD (  22.25  )
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

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> 
>> Add a VM capability that allows userspace to select the G-stage page table
>> format by setting HGATP.MODE on a per-VM basis.
>> 
>> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
>> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
>> not supported by the host, and with -EBUSY if the VM has already been
>> committed (e.g. vCPUs have been created or any memslot is populated).
>> 
>> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
>> HGATP.MODE formats supported by the host.
>> 
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
>>  arch/riscv/kvm/vm.c            | 19 +++++++++++++++++--
>>  include/uapi/linux/kvm.h       |  1 +
>>  3 files changed, 45 insertions(+), 2 deletions(-)
>> 
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 01a3abef8abb..62dc120857c1 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
>>  This capability can be enabled dynamically even if VCPUs were already
>>  created and are running.
>>  
>> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
>> +---------------------------------
>> +
>> +:Architectures: riscv
>> +:Type: VM
>> +:Parameters: args[0] contains the requested HGATP mode
>> +:Returns:
>> +  - 0 on success.
>> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
>> +    hardware.
>> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
>> +    non-empty memslots.
>> +
>
>Currently the documentation for KVM_SET_ONE_REG has this for EBUSY
>
>  EBUSY    (riscv) changing register value not allowed after the vcpu
>           has run at least once
>
>I suggest we update the KVM_SET_ONE_REG EBUSY description to say
>
>(riscv) changing register value not allowed. This may occur after the vcpu
>has run at least once or when other setup has completed which depends on
>the value of the register.

Thanks for the suggestion.

In this series the HGATP mode is configured via KVM_ENABLE_CAP at the VM level
(kvm_vm_ioctl_enable_cap), not via KVM_SET_ONE_REG. Updating the KVM_SET_ONE_REG
-EBUSY description might be misleading since it is vCPU one-reg specific and not
directly related to this series.

>> +This capability allows userspace to explicitly select the HGATP mode for
>> +the VM. The selected mode must be supported by both KVM and hardware. This
>> +capability must be enabled before creating any vCPUs or memslots.
>> +
>> +If this capability is not enabled, KVM will select the default HGATP mode
>> +automatically. The default is the highest HGATP.MODE value supported by
>> +hardware.
>> +
>> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
>> +HGATP.MODE values supported by the host. A return value of 0 indicates that
>> +the capability is not supported. Supported-mode bitmask use HGATP.MODE
>> +encodings as defined by the RISC-V privileged specification, such as Sv39x4
>> +corresponds to HGATP.MODE=8, so userspace should test bitmask & BIT(8).
>> +
>>  8. Other capabilities.
>>  ======================
>>  
>> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
>> index 4b2156df40fc..7d1e1d257df5 100644
>> --- a/arch/riscv/kvm/vm.c
>> +++ b/arch/riscv/kvm/vm.c
>> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  	case KVM_CAP_VM_GPA_BITS:
>>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>>  		break;
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +		r = kvm_riscv_get_hgatp_mode_mask();
>> +		break;
>>  	default:
>>  		r = 0;
>>  		break;
>> @@ -212,12 +215,24 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  
>>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>>  {
>> +	if (cap->flags)
>> +		return -EINVAL;
>> +
>>  	switch (cap->cap) {
>>  	case KVM_CAP_RISCV_MP_STATE_RESET:
>> -		if (cap->flags)
>> -			return -EINVAL;
>>  		kvm->arch.mp_state_reset = true;
>>  		return 0;
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
>> +			return -EINVAL;
>> +
>> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
>> +			return -EBUSY;
>> +#ifdef CONFIG_64BIT
>> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
>> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
>> +#endif
>
> 'if (IS_ENABLED(CONFIG_64BIT))' is preferred to the #ifdef.
>
>> +		return 0;
>>  	default:
>>  		return -EINVAL;
>>  	}
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index dddb781b0507..00c02a880518 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>>  #define KVM_CAP_ARM_SEA_TO_USER 245
>>  #define KVM_CAP_S390_USER_OPEREXEC 246
>> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>>  
>>  struct kvm_irq_routing_irqchip {
>>  	__u32 irqchip;
>> -- 
>> 2.50.1
>>
>
>Thanks,
>drew

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
