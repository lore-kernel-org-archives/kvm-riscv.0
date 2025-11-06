Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3EFCCFA05
	for <kvm-riscv@archiver.kernel.org>; Thu,  6 Nov 2025 13:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E+U+PYcq+Sh2e1hNuLxAZXvtzfSGf4/6K/NanYqr9Gk=; b=3qMsZtB0O4n+H2
	1v3jex7oDH7KclteBPmtTOO2Zh08bM7aOhtDdOK1D+t+8gGuttqYji5fXwxUfhytlvWLRLCzrF8Ka
	dZJBPtWqkOoq+hZyoQMYqNyMG+WhKFSldIpfk39zxyd2JJtNnCYKhYbDGJgP1ulJVXCVuDyJAbvlk
	szBvC3kUhDPWoYtzf63ptwgBLcmJmLSx9qOS/59EiWBch5vnlpCZA97kldaVZFmaWcGjTJGWembnY
	MTzPbFMt5hAKQholB1ptaD9EFOE2KCHh5rAyHPCtm8VodKE76u8dkSznKnbbPeHPTQrXFMmmSsBNa
	4pOhgKrrQh/pgqEMmuKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH03w-0000000FZZT-1oQW;
	Thu, 06 Nov 2025 13:30:04 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH03t-0000000FZYH-1u1y;
	Thu, 06 Nov 2025 13:30:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1762435793; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=1kXLXXv2N3VYJNPmf0poJF0RIiMv5kZuy7eqQXCw1X4=;
	b=Z7jQs5McRR/RUUvFRE7otomvLWt0boJZ1+Pkv1Zam6Qu0BPlEdHaDUEz5VT2wQbz+Pa9GSPt6hWBdiOkvzHtxM1ANuxCAiIOWweja/nFkaqnkjELynDtdUdmpZGWLi+W0dEqDcud7D295t/QKWleRKSZmK6D/mlkA0DJg183jYk=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WrptGql_1762435791 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 06 Nov 2025 21:29:52 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	graf@amazon.com,
	guoren@kernel.org,
	jiangyifei@huawei.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbonzini@redhat.com
Subject: Re: Re: [PATCH] RISC-V: KVM: Fix guest page fault within HLV* instructions 
Date: Thu,  6 Nov 2025 21:29:50 +0800
Message-Id: <20251106132950.80534-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <CAAhSdy0azfC-L3buko7-mN1PDWxi08HN=3NQ+0VeyMR8gVJNoQ@mail.gmail.com>
References: <CAAhSdy0azfC-L3buko7-mN1PDWxi08HN=3NQ+0VeyMR8gVJNoQ@mail.gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_053001_664964_F926B78C 
X-CRM114-Status: GOOD (  11.98  )
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
>> Fixes: 9f7013265112 ("RISC-V: KVM: Handle MMIO exits for VCPU")
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>>  arch/riscv/kvm/vcpu_insn.c | 21 ++++++++++++++++++---
>>  1 file changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
>> index 97dec18e6989..a8b93aa4d8ec 100644
>> --- a/arch/riscv/kvm/vcpu_insn.c
>> +++ b/arch/riscv/kvm/vcpu_insn.c
>> @@ -448,7 +448,12 @@ int kvm_riscv_vcpu_virtual_insn(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>                         insn = kvm_riscv_vcpu_unpriv_read(vcpu, true,
>>                                                           ct->sepc,
>>                                                           &utrap);
>> -                       if (utrap.scause) {
>> +                       switch (utrap.scause) {
>> +                       case 0:
>> +                               break;
>
>This looks like an unrelated change so drop it or send a separate patch
>with proper explanation.
>
>> +                       case EXC_LOAD_GUEST_PAGE_FAULT:
>> +                               return KVM_INSN_CONTINUE_SAME_SEPC;
>
>The KVM_INSN_xyz enum values are only for functions called via
>system_opcode_insn() so return 1 over here just like the below
>default case.
>
>Also, add some comments over here about why we are simply
>continuing the guest.
>
>> +                       default:
>>                                 utrap.sepc = ct->sepc;
>>                                 kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>>                                 return 1;
>> @@ -503,7 +508,12 @@ int kvm_riscv_vcpu_mmio_load(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>                  */
>>                 insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>>                                                   &utrap);
>> -               if (utrap.scause) {
>> +               switch (utrap.scause) {
>> +               case 0:
>> +                       break;
>
>This looks like an unrelated change so drop it or send a separate patch
>with proper explanation.
>
>> +               case EXC_LOAD_GUEST_PAGE_FAULT:
>> +                       return KVM_INSN_CONTINUE_SAME_SEPC;
>
>Same comment as kvm_riscv_vcpu_virtual_insn().
>
>> +               default:
>>                         /* Redirect trap if we failed to read instruction */
>>                         utrap.sepc = ct->sepc;
>>                         kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>> @@ -629,7 +639,12 @@ int kvm_riscv_vcpu_mmio_store(struct kvm_vcpu *vcpu, struct kvm_run *run,
>>                  */
>>                 insn = kvm_riscv_vcpu_unpriv_read(vcpu, true, ct->sepc,
>>                                                   &utrap);
>> -               if (utrap.scause) {
>> +               switch (utrap.scause) {
>> +               case 0:
>> +                       break;
>
>This looks like an unrelated change so drop it or send a separate patch
>with proper explanation.
>
>> +               case EXC_LOAD_GUEST_PAGE_FAULT:
>> +                       return KVM_INSN_CONTINUE_SAME_SEPC;
>
>Same comment as kvm_riscv_vcpu_virtual_insn().
>
>> +               default:
>>                         /* Redirect trap if we failed to read instruction */
>>                         utrap.sepc = ct->sepc;
>>                         kvm_riscv_vcpu_trap_redirect(vcpu, &utrap);
>> --
>> 2.49.0
>>
>>
>
>Regards,
>Anup

Hi Anup:

Thanks for the review.
I will follow your suggestions in the next version.

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
