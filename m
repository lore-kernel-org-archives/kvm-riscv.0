Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9D7CDB462
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 00:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jWBTYB5o7H7jTV0hIIVR+tuaZiT43H58JzOipaVEM1k=; b=d8EAjsKGmV1Bak
	G9w2XFia39wsLTgRxPRDia0SeV1IWojgk/hgZ/FrkGSwSuipBf6eBIFEl5ejd4H0Sr19pr3W6W06u
	+Fxl/4SZvAHL8atzVJ9tcaMQs6gs7U02IOKOxYPh75UT9HlbJ5ZdEgIxkKZ/RzvblNXuWWmpf+oGB
	MeXUYiNfEosvL+2O93BS4VAXLLVTNc46GYGsyV3QYxLZAf2LYJf4DYO4HmU3v1IsejnqgRn56z36k
	M1593JXXuaTphg+YcDj1ME0dMbXxX5uMDRxy34ME3mxM27QbU0ftZscimLBQghVOep058l0MNTkQO
	zLruYd0I9Wcqbx/ZHyVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpn-0000000BLCf-0JyP;
	Fri, 14 Nov 2025 00:38:39 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJhpj-0000000BLBD-1sSi;
	Fri, 14 Nov 2025 00:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763080708; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=K9zzNpoDVrl55TirCdSU+HRj83fU0wQW4y8Ugf7Cnc4=;
	b=B4a6q/P6Q8EzHyVcwH7uRdMvYHEE05f2kodX8HWu78b3+lJOXGSWc8b+2Fq7LWB3Thp9JZci+wHHrcq8pbVJem81BukJaAhCFNyTy43HFseBr5xw3z7W8WWiqPp0Ouzb85XIS5qOt7DMuGCbQsgdhOCsbY3YxRgPmvjpCHBc3Vc=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WsKydO7_1763080704 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 14 Nov 2025 08:38:26 +0800
From: fangyu.yu@linux.alibaba.com
To: ajones@ventanamicro.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pjw@kernel.org
Subject: Re: Re: [PATCH v2] RISC-V: KVM: Fix guest page fault within HLV* instructions
Date: Fri, 14 Nov 2025 08:38:19 +0800
Message-Id: <20251114003819.42547-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20251112-ae882e7fd8d1fcbb73d87c6c@orel>
References: <20251112-ae882e7fd8d1fcbb73d87c6c@orel>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_163836_122069_47197301 
X-CRM114-Status: GOOD (  12.56  )
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
>> When executing HLV* instructions at the HS mode, a guest page fault
>> may occur when a g-stage page table migration between triggering the
>> virtual instruction exception and executing the HLV* instruction.
>> 
>> This may be a corner case, and one simpler way to handle this is to
>> re-execute the instruction where the virtual  instruction exception
>> occurred, and the guest page fault will be automatically handled.
>> 
>> Fixes: b91f0e4cb8a3 ("RISC-V: KVM: Factor-out instruction emulation into separate sources")
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> 
>> ---
>> Changes in v2:
>> - Remove unnecessary modifications and add comments(suggested by Anup)
>> - Update Fixes tag
>> - Link to v1: https://lore.kernel.org/linux-riscv/20250912134332.22053-1-fangyu.yu@linux.alibaba.com/
>> ---
>>  arch/riscv/kvm/vcpu_insn.c | 39 ++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 39 insertions(+)
>> 
>> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
>> index de1f96ea6225..a8d796ef2822 100644
>> --- a/arch/riscv/kvm/vcpu_insn.c
>> +++ b/arch/riscv/kvm/vcpu_insn.c
>> @@ -323,6 +323,19 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>  							  ct->sepc,
>>  							  &utrap);
>>  			if (utrap.scause) {
>> +				/**
>> +				 * If a g-stage page fault occurs, the direct approach
>> +				 * is to let the g-stage page fault handler handle it
>> +				 * naturally, however, calling the g-stage page fault
>> +				 * handler here seems rather strange.
>> +				 * Considering this is an corner case, we can directly
>> +				 * return to the guest and re-execute the same PC, this
>> +				 * will trigger a g-stage page fault again and then the
>> +				 * regular g-stage page fault handler will populate
>> +				 * g-stage page table.
>> +				 */
>> +				if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
>> +					return 1;
>>  				utrap.sepc = ct->sepc;
>>  				kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>>  				return 1;
>> @@ -378,6 +391,19 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>>  						  &utrap);
>>  		if (utrap.scause) {
>> +			/**
>> +			 * If a g-stage page fault occurs, the direct approach
>> +			 * is to let the g-stage page fault handler handle it
>> +			 * naturally, however, calling the g-stage page fault
>> +			 * handler here seems rather strange.
>> +			 * Considering this is an corner case, we can directly
>> +			 * return to the guest and re-execute the same PC, this
>> +			 * will trigger a g-stage page fault again and then the
>> +			 * regular g-stage page fault handler will populate
>> +			 * g-stage page table.
>> +			 */
>> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
>> +				return 1;
>>  			/* Redirect trap if we failed to read instruction */
>>  			utrap.sepc = ct->sepc;
>>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>> @@ -504,6 +530,19 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>  		insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>>  						  &utrap);
>>  		if (utrap.scause) {
>> +			/**
>> +			 * If a g-stage page fault occurs, the direct approach
>> +			 * is to let the g-stage page fault handler handle it
>> +			 * naturally, however, calling the g-stage page fault
>> +			 * handler here seems rather strange.
>> +			 * Considering this is an corner case, we can directly
>> +			 * return to the guest and re-execute the same PC, this
>> +			 * will trigger a g-stage page fault again and then the
>> +			 * regular g-stage page fault handler will populate
>> +			 * g-stage page table.
>> +			 */
>> +			if (utrap.scause == EXC_LOAD_GUEST_PAGE_FAULT)
>> +				return 1;
>>  			/* Redirect trap if we failed to read instruction */
>>  			utrap.sepc = ct->sepc;
>>  			kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>> -- 
>> 2.50.1
>>
>
>To avoid repeating the same paragraph three times I would create a
>helper function, kvm_riscv_check_load_guest_page_fault(), with the
>paragraph placed in that function along with the utrap.scause
>exception type check.
>
>Thanks,
>drew

Thanks for the suggestion! I'll incorporate this change in the next version.

Thanks,
Fangyu


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
