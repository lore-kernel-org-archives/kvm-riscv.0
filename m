Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0261CC369D5
	for <kvm-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FSDspf6tJT4464n3NI0l1LuHXK/DteBtgca3o6nuABc=; b=oGwsDq8CGKHBWq
	up4c/aP+8+G3pJga8aGb1Jl7p4t7s8AhCDuK4hWzFQztRjcZfnjd2MCWFzmlVwt4Kp9XAvQ3tkhI5
	2SPUxVOTXyUIIXrWZRD42eiLb/0VK7Ky0XvmefkR9weydpcEbr4u5p9Mi4XjFEQz1PWZITpVah9or
	gEFPcfHKwEGBB4v5qmjln1+eZWNbFnpCNRwYdHSaobbvmV5AwuMTWSCwsYRIYUKeSnI5/vkbH+7Ej
	508W+xseyC3B2Nzb3CoPZ172bVITGQxsxSR3AfR3OC5Ppgh3r0GN8dnrDctfri7vY4rt84LQa+85Q
	xq46uIx7GTNczZAyYnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XHN-00000007kiC-3AVS;
	Mon, 28 Apr 2025 22:48:49 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9XHI-00000007kfd-2u4S
	for kvm-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 22:48:46 +0000
Message-ID: <7f84de30-80db-492a-adde-1f29d69da240@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745880522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1Af90aGrC2fXAsIAg/iqopX2dqetTTJsU459B5Sz2Uc=;
	b=kr0+CrOqqJGG1pjipZbprnsXdDL6NdYRS4iHHbqyrB3DYBuIR4qpd7CBo+UQPc6uVbun1L
	yeY0lB/i17viQCICOibcVYCReswttjPAWNoVeBeAwek3wSgxYS2K1YyoCe3YdhU193OvNl
	G4CW3yygzDw3rSvTjNNuvGHvVh6u0bY=
Date: Mon, 28 Apr 2025 15:48:37 -0700
MIME-Version: 1.0
Subject: Re: [PATCH 2/3] KVM: riscv: selftests: Decode stval to identify exact
 exception type
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
 <20250324-kvm_selftest_improve-v1-2-583620219d4f@rivosinc.com>
 <20250425-f458b9801a83cc35bda55c74@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250425-f458b9801a83cc35bda55c74@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_154844_889967_E79BA338 
X-CRM114-Status: GOOD (  15.49  )
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


On 4/25/25 6:33 AM, Andrew Jones wrote:
> On Mon, Mar 24, 2025 at 05:40:30PM -0700, Atish Patra wrote:
>> Currently, the sbi_pmu_test continues if the exception type is illegal
>> instruction because access to hpmcounter will generate that. However, we
>> may get illegal for other reasons as well which should result in test
>> assertion.
>>
>> Use the stval to decode the exact type of instructions and which csrs are
>> being accessed if it is csr access instructions. Assert in all cases
>> except if it is a csr access instructions that access valid PMU related
>> registers.
>>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   tools/testing/selftests/kvm/riscv/sbi_pmu_test.c | 32 ++++++++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> index 03406de4989d..11bde69b5238 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> @@ -128,11 +128,43 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>>   		       "Unable to stop counter %ld error %ld\n", counter, ret.error);
>>   }
>>   
>> +#define INSN_OPCODE_MASK	0x007c
>> +#define INSN_OPCODE_SHIFT	2
>> +#define INSN_OPCODE_SYSTEM	28
>> +
>> +#define INSN_MASK_FUNCT3	0x7000
>> +#define INSN_SHIFT_FUNCT3	12
>> +
>> +#define INSN_CSR_MASK		0xfff00000
>> +#define INSN_CSR_SHIFT		20
>> +
>> +#define GET_RM(insn)            (((insn) & INSN_MASK_FUNCT3) >> INSN_SHIFT_FUNCT3)
>> +#define GET_CSR_NUM(insn)       (((insn) & INSN_CSR_MASK) >> INSN_CSR_SHIFT)
> It'd be good to put these macros in include/riscv/processor.h or some new
> include/riscv/ header to be shared with other tests that may want to
> decode stval.

Sure. I will move it to include/riscv/processor.h

> Thanks,
> drew
>
>> +
>>   static void guest_illegal_exception_handler(struct ex_regs *regs)
>>   {
>> +	unsigned long insn;
>> +	int opcode, csr_num, funct3;
>> +
>>   	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>>   		       "Unexpected exception handler %lx\n", regs->cause);
>>   
>> +	insn = regs->stval;
>> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
>> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
>> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
>> +
>> +	csr_num = GET_CSR_NUM(insn);
>> +	funct3 = GET_RM(insn);
>> +	/* Validate if it is a CSR read/write operation */
>> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 || funct3 != 4),
>> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
>> +		       funct3, csr_num);
>> +
>> +	/* Validate if it is a HPMCOUNTER CSR operation */
>> +	__GUEST_ASSERT(csr_num == CSR_CYCLE || csr_num <= CSR_HPMCOUNTER31,
>> +		       "Unexpected csr_num 0x%x\n", csr_num);
>> +
>>   	illegal_handler_invoked = true;
>>   	/* skip the trapping instruction */
>>   	regs->epc += 4;
>>
>> -- 
>> 2.43.0
>>
>>
>> -- 
>> kvm-riscv mailing list
>> kvm-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
