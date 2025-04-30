Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E82E2C3ABA9
	for <kvm-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 07:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/S5t56GegHWXfUQBeREDR3kGPJwvHxDpua/DFdJrPDs=; b=e9KXxctyI2109b
	sFjg9h5mGAsJagSlYd2bnZuhIbbGXFt7XpGdQ/7nm10r9foaTTkCzX+SIuOgrxGzKkfbZbFbT4ABi
	abzaSzQRTzKgPc4/o36lXU/7JjI6s8WdUK9hqWS9OMQjXD5qPG66mD45e8P2JU0UTmd0SyLzTuRjz
	hm7oodCzT67ix3sg1o3L925oC8lq6lVB0yOzMsRKuyyhp2EUXVBjpc6+MTMoPeEnijdMJLr+HQiCN
	PfsLp5C6eu6a6hIDEGZgDNztFq2NVz/fBDM+UzFhV9HqvlQmg3b4qdm9fhotbNlPIXOShADJk6qyf
	CoQAzqh2FcJ95wEssZ6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1w8-0000000C0AJ-2Rwg;
	Wed, 30 Apr 2025 07:32:56 +0000
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1kd-0000000By9F-3vL8
	for kvm-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 07:21:05 +0000
Message-ID: <a6cb0396-4bc5-4215-9e2e-a68be83c1c94@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745997661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OuZnX2BRFmICCR806hXS16BUkH/lmlas9chN4sIYfsU=;
	b=bPJx5QNDt0UOh1b+z/teoeW8pSlsLjqvN8xsIZ7LxxCrsjwdSOitJftIIG28PfVJ0lU720
	Kq7KISGQs3uESsgO2qFARs4nDrGziShEw2urNKkH/45pLX6V9hvHF4uNfOHFNdimWASxXn
	WxZsi9Cy1Lkr7N7P2Zm1fFMkaf5y8BI=
Date: Wed, 30 Apr 2025 00:20:48 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/3] KVM: riscv: selftests: Decode stval to identify
 exact exception type
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250429-kvm_selftest_improve-v2-0-51713f91e04a@rivosinc.com>
 <20250429-kvm_selftest_improve-v2-2-51713f91e04a@rivosinc.com>
 <20250430-b40cd14818cc9264506e61f2@orel>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20250430-b40cd14818cc9264506e61f2@orel>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_002104_115859_B7B71BE7 
X-CRM114-Status: GOOD (  14.08  )
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


On 4/30/25 12:09 AM, Andrew Jones wrote:
> On Tue, Apr 29, 2025 at 05:18:46PM -0700, Atish Patra wrote:
>> Currently, the sbi_pmu_test continues if the exception type is illegal
>> instruction because access to hpmcounter will generate that. However
>> illegal instruction exception may occur due to the other reasons
>> which should result in test assertion.
>>
>> Use the stval to decode the exact type of instructions and which csrs are
>> being accessed if it is csr access instructions. Assert in all cases
>> except if it is a csr access instructions that access valid PMU related
>> registers.
>>
>> Reviewed-by: Anup Patel <anup@brainfault.org>
>> Signed-off-by: Atish Patra <atishp@rivosinc.com>
>> ---
>>   .../testing/selftests/kvm/include/riscv/processor.h  | 13 +++++++++++++
>>   tools/testing/selftests/kvm/riscv/sbi_pmu_test.c     | 20 ++++++++++++++++++++
>>   2 files changed, 33 insertions(+)
>>
>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
>> index 1b5aef87de0f..162f303d9daa 100644
>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
>> @@ -11,6 +11,19 @@
>>   #include <asm/csr.h>
>>   #include "kvm_util.h"
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
>> +
>>   static inline uint64_t __kvm_reg_id(uint64_t type, uint64_t subtype,
>>   				    uint64_t idx, uint64_t size)
>>   {
>> diff --git a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> index 6e66833e5941..3c47268df262 100644
>> --- a/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> +++ b/tools/testing/selftests/kvm/riscv/sbi_pmu_test.c
>> @@ -130,9 +130,29 @@ static void stop_counter(unsigned long counter, unsigned long stop_flags)
>>   
>>   static void guest_illegal_exception_handler(struct pt_regs *regs)
>>   {
>> +	unsigned long insn;
>> +	int opcode, csr_num, funct3;
>> +
>>   	__GUEST_ASSERT(regs->cause == EXC_INST_ILLEGAL,
>>   		       "Unexpected exception handler %lx\n", regs->cause);
>>   
>> +	insn = regs->badaddr;
>> +	opcode = (insn & INSN_OPCODE_MASK) >> INSN_OPCODE_SHIFT;
>> +	__GUEST_ASSERT(opcode == INSN_OPCODE_SYSTEM,
>> +		       "Unexpected instruction with opcode 0x%x insn 0x%lx\n", opcode, insn);
>> +
>> +	csr_num = GET_CSR_NUM(insn);
>> +	funct3 = GET_RM(insn);
>> +	/* Validate if it is a CSR read/write operation */
>> +	__GUEST_ASSERT(funct3 <= 7 && (funct3 != 0 && funct3 != 4),
>> +		       "Unexpected system opcode with funct3 0x%x csr_num 0x%x\n",
>> +		       funct3, csr_num);
>> +
>> +	/* Validate if it is a HPMCOUNTER CSR operation */
>> +	__GUEST_ASSERT((csr_num >= CSR_CYCLE && csr_num <= CSR_HPMCOUNTER31) ||
>> +		       (csr_num >= CSR_CYCLEH && csr_num <= CSR_HPMCOUNTER31H),
> We should never get csr accesses to the rv32 high registers since we only
> support 64-bit.

Sure. I will remove that along with CSR_CYCLEH in pmu_csr_read_num.

>> +		       "Unexpected csr_num 0x%x\n", csr_num);
>> +
>>   	illegal_handler_invoked = true;
>>   	/* skip the trapping instruction */
>>   	regs->epc += 4;
>>
>> -- 
>> 2.43.0
>>
> Otherwise,
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
