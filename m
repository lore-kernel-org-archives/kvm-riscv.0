Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E3A5C83F1A
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Jul 2025 09:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HEDuQ+Co/q3qM4XwG+TE55Qe2cA3wdCn95NsJkwcMvM=; b=j6z7FJRwczr7dM
	dXnZ1kM4MAm8KGQNNOB5ZipAcHETVqSp/RJMHBLNTAFJFLa8c2/oCmB22H+LBk0yOI6pv5EDWfM67
	yhYJIg1oJV2JAcyJHmh0WEAd1FxD+5LRZtzTy8bFq0Qlf2LAvSoJhYFthdzPbYoVRsIEbSgk+6Y8A
	6kUTt/Pab1HFhutSQd/02IscX7zT6+FD6REIVygkZKfInbKUlQSktvZm0LoPyMv4dkIBkTYL/TxS6
	J7D4uPFJladel5wJTMgDmdHT8lOKwqma4+uIO9B4bc3X6G4X/YI4XgK6wiwGWs/Ar3hstRMbd1GD9
	KvvpN+Z7VKOMQL5TJaYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL7F-00000009lMp-0jld;
	Thu, 17 Jul 2025 09:41:25 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucL2B-00000009k1o-3oDK;
	Thu, 17 Jul 2025 09:36:13 +0000
Received: from [10.69.1.138] (unknown [180.111.100.227])
	by APP-05 (Coremail) with SMTP id zQCowAC3SVoFxHhoW9PDBA--.4361S2;
	Thu, 17 Jul 2025 17:36:06 +0800 (CST)
Message-ID: <3eabf9a8-d518-4d22-bb66-cc891176d820@iscas.ac.cn>
Date: Thu, 17 Jul 2025 17:24:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Add common supported test
 cases
To: Andrew Jones <ajones@ventanamicro.com>
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org
References: <cover.1749810735.git.zhouquan@iscas.ac.cn>
 <7e8f1272337e8d03851fd3bb7f6fc739e604309e.1749810736.git.zhouquan@iscas.ac.cn>
 <20250624-d7b4b9ba702fcaf2f42695b1@orel>
Content-Language: en-US
From: Quan Zhou <zhouquan@iscas.ac.cn>
In-Reply-To: <20250624-d7b4b9ba702fcaf2f42695b1@orel>
X-CM-TRANSID: zQCowAC3SVoFxHhoW9PDBA--.4361S2
X-Coremail-Antispam: 1UD129KBjvJXoWxArWfGF1Dur17Xr1fCryrtFb_yoWrCF43p3
	WFyFyjkF4kCF17Jw1fGrsrZFWxK395KF48Kr1Yg3yUZr1UJF4xJrn3Kayakrnaqws0vr1S
	ka4agF4a9ayDtw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkIb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWxJVW8Jr
	1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r1q6r43MxAI
	w28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxG
	rwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJw
	CI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2
	z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1m0PDUUUUU==
X-Originating-IP: [180.111.100.227]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiDAUGBmh4vWsbGQAAsN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_023612_323651_D0763CE7 
X-CRM114-Status: GOOD (  15.41  )
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



On 2025/6/24 22:10, Andrew Jones wrote:
> On Fri, Jun 13, 2025 at 07:30:13PM +0800, zhouquan@iscas.ac.cn wrote:
>> From: Quan Zhou <zhouquan@iscas.ac.cn>
>>
>> Some common KVM test cases are supported on riscv now as following:
>>
>>      access_tracking_perf_test
>>      demand_paging_test
>>      dirty_log_perf_test
>>      dirty_log_test
>>      guest_print_test
>>      kvm_binary_stats_test
>>      kvm_create_max_vcpus
>>      kvm_page_table_test
>>      memslot_modification_stress_test
>>      memslot_perf_test
>>      rseq_test
>>      set_memory_region_test
> 
> Half this list is already build for riscv since they're common. See
> TEST_GEN_PROGS_COMMON. If the other half can be built and run then
> please send a separate patch, not something tacked onto this series,
> since they're all unrelated to the series.
> 
>>
>> Add missing headers for tests and fix RISCV_FENCE redefinition
>> in `rseq-riscv.h` by using the existing macro from <asm/fence.h>.
>>
>> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
>> ---
>>   tools/testing/selftests/kvm/Makefile.kvm             | 12 ++++++++++++
>>   .../testing/selftests/kvm/include/riscv/processor.h  |  2 ++
>>   tools/testing/selftests/rseq/rseq-riscv.h            |  3 +--
>>   3 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
>> index 38b95998e1e6..565e191e99c8 100644
>> --- a/tools/testing/selftests/kvm/Makefile.kvm
>> +++ b/tools/testing/selftests/kvm/Makefile.kvm
>> @@ -197,6 +197,18 @@ TEST_GEN_PROGS_riscv += arch_timer
>>   TEST_GEN_PROGS_riscv += coalesced_io_test
>>   TEST_GEN_PROGS_riscv += get-reg-list
>>   TEST_GEN_PROGS_riscv += steal_time
>> +TEST_GEN_PROGS_riscv += access_tracking_perf_test
>> +TEST_GEN_PROGS_riscv += demand_paging_test
>> +TEST_GEN_PROGS_riscv += dirty_log_perf_test
>> +TEST_GEN_PROGS_riscv += dirty_log_test
>> +TEST_GEN_PROGS_riscv += guest_print_test
>> +TEST_GEN_PROGS_riscv += kvm_binary_stats_test
>> +TEST_GEN_PROGS_riscv += kvm_create_max_vcpus
>> +TEST_GEN_PROGS_riscv += kvm_page_table_test
>> +TEST_GEN_PROGS_riscv += memslot_modification_stress_test
>> +TEST_GEN_PROGS_riscv += memslot_perf_test
>> +TEST_GEN_PROGS_riscv += rseq_test
>> +TEST_GEN_PROGS_riscv += set_memory_region_test
>>   
>>   TEST_GEN_PROGS_loongarch += coalesced_io_test
>>   TEST_GEN_PROGS_loongarch += demand_paging_test
>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
>> index 162f303d9daa..4cf5ae11760f 100644
>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
>> @@ -9,7 +9,9 @@
>>   
>>   #include <linux/stringify.h>
>>   #include <asm/csr.h>
>> +#include <asm/vdso/processor.h>
>>   #include "kvm_util.h"
>> +#include "ucall_common.h"
> 
> These should be included directly from the tests that need them.
> 
>>   
>>   #define INSN_OPCODE_MASK	0x007c
>>   #define INSN_OPCODE_SHIFT	2
>> diff --git a/tools/testing/selftests/rseq/rseq-riscv.h b/tools/testing/selftests/rseq/rseq-riscv.h
>> index 67d544aaa9a3..06c840e81c8b 100644
>> --- a/tools/testing/selftests/rseq/rseq-riscv.h
>> +++ b/tools/testing/selftests/rseq/rseq-riscv.h
>> @@ -8,6 +8,7 @@
>>    * exception when executed in all modes.
>>    */
>>   #include <endian.h>
>> +#include <asm/fence.h>
>>   
>>   #if defined(__BYTE_ORDER) ? (__BYTE_ORDER == __LITTLE_ENDIAN) : defined(__LITTLE_ENDIAN)
>>   #define RSEQ_SIG   0xf1401073  /* csrr mhartid, x0 */
>> @@ -24,8 +25,6 @@
>>   #define REG_L	__REG_SEL("ld ", "lw ")
>>   #define REG_S	__REG_SEL("sd ", "sw ")
>>   
>> -#define RISCV_FENCE(p, s) \
>> -	__asm__ __volatile__ ("fence " #p "," #s : : : "memory")
>>   #define rseq_smp_mb()	RISCV_FENCE(rw, rw)
>>   #define rseq_smp_rmb()	RISCV_FENCE(r, r)
>>   #define rseq_smp_wmb()	RISCV_FENCE(w, w)
>> -- 
>> 2.34.1
> 
> tools/testing/selftests/rseq isn't under KVM's purview, so this should be
> a separate patch CC'ing the appropriate people and lists.
> 
> Thanks,
> drew

Thanks so much for your review, I'll split and modify this set of patches.

Regards,
Quan


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
