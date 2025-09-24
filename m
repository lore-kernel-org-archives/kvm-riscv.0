Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7C2CAC5AC
	for <kvm-riscv@archiver.kernel.org>; Wed, 24 Sep 2025 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:Mime-Version:Message-Id
	:Date:References:In-Reply-To:To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LPpYxNZV4zkyi1snxHaGDXCsi7w8F6WZszBV4YG1NUc=; b=bf8qt7TEtOOgVA
	y3NL+lIFHqBD/W67dtLg20+ZZpjFxwXgPBuQVdbXOn7loBjiBisCmXN/I/uQRl1SiquqQOuxZ5Y2g
	9Yp8qK9RqPGDD1BJk+L1D2eDag1M8Tr7p10L6QCvtnpA6SbsdtFfIiqchQXmN3lGIWKvzo1SfGrgk
	697FFGYNIbJ+xUgsuoUrQHKEuMwmpQMneuMoQB6lEB0hcJIbeNNCsh93o71S5rHGxDEkX3l+b+uaO
	ojdEj2tHqFIrvWB2ZR7js2SSoq+oBNjOzDEdbkp3J8tljHA177iyJ0H81ls8j3YefGNN6DullNjuw
	1CaoXe3m1/Od/fxC4CRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FMA-0000000FN2y-2AVN;
	Wed, 24 Sep 2025 02:35:46 +0000
Received: from sg-1-23.ptr.blmpb.com ([118.26.132.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1FM6-0000000FN21-17ao
	for kvm-riscv@lists.infradead.org;
	Wed, 24 Sep 2025 02:35:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1758681331;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=eok84aP1Pvike2H3H6rF9a3VUr2fUupZ8SYJp6uSjEU=;
 b=Z0qbgezDvXZ4mBqAUkDqcWvJJozPa4c6/JwipC4VD+eD9k1g+//d0FCpktbMZjFgQcwCaG
 0j33v1jmgBIYf2waIspmlmMvGOWnEWIMw4RCU385rrVDCGAzkEc9UDaKP/m9auJll1+rmf
 D1YfSTT32a5yln3g7NrMXolnIPzOKq8rMuLUAF4tNFuBG+02zqVfybcOK4TnsbZObcAIgT
 4c3xGePHqZWuUZPuGLGnQnEUjKlHxDOlvD1nTQoIHGXYL2DunNHaC1wcT7XDHqHt426RqA
 geH/3PauGhsyAgh+LMG8LUpApWCdyRIba3Ij1RAR7tB1ptVVd2JvYwJqHc1RmA==
To: "Andrew Jones" <ajones@ventanamicro.com>
In-Reply-To: <20250923-5498566fbd48a3dfd61ecd08@orel>
References: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com> <20250923-5498566fbd48a3dfd61ecd08@orel>
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Date: Wed, 24 Sep 2025 10:35:25 +0800
Message-Id: <1be32bd0-a3d1-4fea-8f22-e050f664907b@lanxincomputing.com>
Mime-Version: 1.0
Content-Language: en-US
X-Lms-Return-Path: <lba+268d358f1+676d67+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Cc: <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<atishp@rivosinc.com>
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
User-Agent: Mozilla Thunderbird
Received: from [127.0.0.1] ([222.128.9.250]) by smtp.feishu.cn with ESMTPS; Wed, 24 Sep 2025 10:35:28 +0800
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_193542_955771_DA2A6BCE 
X-CRM114-Status: GOOD (  20.27  )
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

On 9/24/2025 4:14 AM, Andrew Jones wrote:
> On Wed, Sep 17, 2025 at 04:52:46PM +0800, BillXiang wrote:
>> Move those sbi ext ids to uapi because they will be forwarded
>> to user space by kvm.
> 
> We don't need to publish the IDs in UAPI since they are already known to
> userspace by reading the SBI spec. Indeed QEMU already defines all of
> these except for the experimental range.>
> What problem are you trying to solve?


I'm working on rust-vmm[1], which auto-generates the ID constants
from uapi/kvm.h via bindgen[2]. Any ID that isn't exported there is
invisible to us. I expect other VMMs besides QEMU will need these
numbers as well, so let's keep one canonical definition in the UAPI
headers for everyone to share.


[1] https://github.com/rust-vmm
[2] https://crates.io/crates/bindgen

> 
> Thanks,
> drew
> 
>>
>> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
>> ---
>>   arch/riscv/include/asm/sbi.h      | 16 +-----------
>>   arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
>>   2 files changed, 44 insertions(+), 15 deletions(-)
>>   create mode 100644 arch/riscv/include/uapi/asm/sbi.h
>>
>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>> index 341e74238aa0..e196feaabb2e 100644
>> --- a/arch/riscv/include/asm/sbi.h
>> +++ b/arch/riscv/include/asm/sbi.h
>> @@ -10,13 +10,12 @@
>>   #include <linux/types.h>
>>   #include <linux/cpumask.h>
>>   #include <linux/jump_label.h>
>> +#include <uapi/asm/sbi.h>
>>   
>>   #ifdef CONFIG_RISCV_SBI
>>   enum sbi_ext_id {
>>   #ifdef CONFIG_RISCV_SBI_V01
>>   	SBI_EXT_0_1_SET_TIMER = 0x0,
>> -	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
>> -	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>>   	SBI_EXT_0_1_CLEAR_IPI = 0x3,
>>   	SBI_EXT_0_1_SEND_IPI = 0x4,
>>   	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
>> @@ -37,13 +36,6 @@ enum sbi_ext_id {
>>   	SBI_EXT_NACL = 0x4E41434C,
>>   	SBI_EXT_FWFT = 0x46574654,
>>   
>> -	/* Experimentals extensions must lie within this range */
>> -	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>> -	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
>> -
>> -	/* Vendor extensions must lie within this range */
>> -	SBI_EXT_VENDOR_START = 0x09000000,
>> -	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>>   };
>>   
>>   enum sbi_ext_base_fid {
>> @@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
>>   #define SBI_PMU_STOP_FLAG_RESET BIT(0)
>>   #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>>   
>> -enum sbi_ext_dbcn_fid {
>> -	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>> -	SBI_EXT_DBCN_CONSOLE_READ = 1,
>> -	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>> -};
>> -
>>   /* SBI STA (steal-time accounting) extension */
>>   enum sbi_ext_sta_fid {
>>   	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
>> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
>> new file mode 100644
>> index 000000000000..d29ac0abeefe
>> --- /dev/null
>> +++ b/arch/riscv/include/uapi/asm/sbi.h
>> @@ -0,0 +1,43 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
>> + *
>> + * Authors:
>> + *     BillXiang <xiangwencheng@lanxincomputing.com>
>> + */
>> +
>> +#ifndef _UAPI_ASM_RISCV_SBI_H
>> +#define _UAPI_ASM_RISCV_SBI_H
>> +
>> +
>> +enum SBI_EXT_ID {
>> +	/*
>> +	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
>> +	* handled in kernel so they will be forwarded to userspace by kvm.
>> +	*/
>> +	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
>> +	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>> +	/*
>> +	* Both SBI experimental and vendor extensions are
>> +	* unconditionally forwarded to userspace by kvm.
>> +	*/
>> +	/* Experimentals extensions must lie within this range */
>> +	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>> +	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
>> +
>> +	/* Vendor extensions must lie within this range */
>> +	SBI_EXT_VENDOR_START = 0x09000000,
>> +	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>> +};
>> +
>> +/*
>> +* The SBI debug console functions are unconditionally
>> +* forwarded to the userspace by kvm.
>> +*/
>> +enum sbi_ext_dbcn_fid {
>> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
>> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>> +};
>> +
>> +#endif /* _UAPI_ASM_RISCV_SBI_H */
>> \ No newline at end of file
>> -- 
>> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
