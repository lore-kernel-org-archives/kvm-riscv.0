Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39176D4A610
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 14:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I4CaYMUIzZlrjL9xxIJ1fYnnZNNaiEyVWHZ9FGmpSrE=; b=1m2jfXSuTuz74+
	1arYoGGfaOmJoW2xcrzmgZotz+SqTNvrI1+V9nt6fUIB4Q3oNrURNzarvVzFh+2KiON9XoAtouLtD
	FDWg5MoAb8Hc0EJXqvdIXjWxsNqwf06BsirDc1ZztR4Xe2dhBX5je8DnBvvhTYwr4DITvSdfJ8YtB
	BDatqLpNq7JfBob+rJJiE9+/dHr4K+wneHgAsiQWxheA+a/g3PYRlsm44nl7rBfIK+AR7WrmZt5rS
	k4J8ghfdKJS2AghwAc1mQ30wnyhyZtY1u3q9WaGnYhyypC9wppEIa1T67BQcgBCWpFMLhu1vNyB1d
	pApehjIx9+X8RW723nYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkqD-0000000EG5g-16mt;
	Fri, 16 Jan 2026 14:30:21 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgkq8-0000000EG3u-25rI;
	Fri, 16 Jan 2026 14:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1768573804; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=XnMbHiZD4Q8ihaJAYTR3qJJVShDyzERVKVSspF7MbMc=;
	b=eCCJGVPjwitC351Gssj6Rl1CvmVijt/YU7KiHVz82kIRnxdGMb7LKolpqKRXTBoTBCSnR0Oqn1Ic8eAlP8kCDDXRuZ9/ewrU6zXcrcn8F4tedHyUm7MUoR1uF4v3iiwrM9TbKluwa7Q8V5/GXbIYuMN2TY6JxAdLzOs5lfuAAUE=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WxARSAt_1768573791 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 Jan 2026 22:29:53 +0800
From: fangyu.yu@linux.alibaba.com
To: andrew.jones@oss.qualcomm.com
Cc: ajones@ventanamicro.com,
	alex@ghiti.fr,
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
	rkrcmar@ventanamicro.com
Subject: Re: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Date: Fri, 16 Jan 2026 22:29:47 +0800
Message-Id: <20260116142947.30520-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <dfhacs3uppweqmw5t6gwli2iy3b7l5oj6saykogjb5qkadl4rc@bi7mvnezkd2m>
References: <dfhacs3uppweqmw5t6gwli2iy3b7l5oj6saykogjb5qkadl4rc@bi7mvnezkd2m>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_063017_612144_EA676DFF 
X-CRM114-Status: GOOD (  20.63  )
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
>> This capability allows userspace to explicitly select the HGATP mode
>> for the VM. The selected mode must be less than or equal to the max
>> HGATP mode supported by the hardware. This capability must be enabled
>> before creating any vCPUs, and can only be set once per VM.
>>
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  Documentation/virt/kvm/api.rst | 14 ++++++++++++++
>>  arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
>>  include/uapi/linux/kvm.h       |  1 +
>>  3 files changed, 39 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 01a3abef8abb..9e17788e3a9d 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -8765,6 +8765,20 @@ helpful if user space wants to emulate instructions which are not
>>  This capability can be enabled dynamically even if VCPUs were already
>>  created and are running.
>>
>> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
>> +---------------------------------
>> +
>> +:Architectures: riscv
>> +:Type: VM
>> +:Parameters: args[0] contains the requested HGATP mode
>> +:Returns: 0 on success, -EINVAL if arg[0] is outside the range of hgatp
>> +          modes supported by the hardware.
>> +
>> +This capability allows userspace to explicitly select the HGATP mode for
>> +the VM. The selected mode must be less than or equal to the maximum HGATP
>> +mode supported by the hardware. This capability must be enabled before
>> +creating any vCPUs, and can only be set once per VM.
>
>I think I would prefer a KVM_CAP_RISCV_SET_MAX_GPA type of capability. The
>reason is because, while one of the results of the max-gpa being set will
>be to set hgatp, there may be other reasons to track the guest's maximum
>physical address too and kvm userspace shouldn't need to think about each
>individually.

That makes sense, thanks.

>> +
>>  8. Other capabilities.
>>  ======================
>>
>> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
>> index 4b2156df40fc..e9275023a73a 100644
>> --- a/arch/riscv/kvm/vm.c
>> +++ b/arch/riscv/kvm/vm.c
>> @@ -202,6 +202,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>  	case KVM_CAP_VM_GPA_BITS:
>>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>>  		break;
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +#ifdef CONFIG_64BIT
>> +		r = 1;
>> +#else/* CONFIG_32BIT */
>> +		r = 0;
>> +#endif
>
> r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;

Ack.

>> +		break;
>>  	default:
>>  		r = 0;
>>  		break;
>> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>>
>>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>>  {
>> +	if (cap->flags)
>> +		return -EINVAL;
>
>add blank line

Ack, will add a blank line after the flags check.

>
>>  	switch (cap->cap) {
>>  	case KVM_CAP_RISCV_MP_STATE_RESET:
>> -		if (cap->flags)
>> -			return -EINVAL;
>>  		kvm->arch.mp_state_reset = true;
>>  		return 0;
>> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
>> +#ifdef CONFIG_64BIT
>> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
>> +			cap->args[0] > kvm_riscv_gstage_max_mode)
>> +			return -EINVAL;
>> +		if (kvm->arch.gstage_mode_initialized)
>> +			return 0;
>
>I think we want to return -EBUSY here and it should be documented where it
>already states "...can only be set once per VM"

Agreed.

>> +		kvm->arch.gstage_mode_initialized = true;
>
>In the previous patch I thought we were missing this, but I see now it
>means "user initialized". Let's rename it as such,
>
> gstage_mode_user_initialized

Agreed.

>> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
>> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
>> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
>> +		kvm_info("using SV%lluX4 G-stage page table format\n",
>> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);
>> +#endif
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
>
Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
