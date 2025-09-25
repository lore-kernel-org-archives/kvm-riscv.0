Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35A1CAC5A5
	for <kvm-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 02:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:Date:Mime-Version:
	Message-Id:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ulOkStr7+eBDtKx10OYxnGCHhz6+xOeHblc7fZSGhnA=; b=fZx1bP9DmrESo2
	kTvdEJc75Wpuqv9ZKES2B+ErobJBpcF4qnmvbcBb3HedtSJZqbR4ir90SBrNMt9q9V2xRPVQK6HF2
	dQBFYbIvegoC+1ZAK2FtFXHS1VcDwOrPDZcRMwBIdMrS1Kvd0a3BNgMEzEAHTGoEvwHe4ezFIHsUM
	kgzK+427BbWdtt/P8NHnqclOa/5ornjZfkW2ozxFyRnYAXHFADg7oziSqF7clZ9Yi8QIPH5rtSvuK
	wJunWibu9iCPFRvjebutv17ujlWe8sKZFOZge7Hnz/kUokUUMs+UGp2o0ZmXVzTt+zoqU3htGnjEr
	glNyLSr6DVHb70rQsJ1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bQy-00000005GNN-0hcw;
	Thu, 25 Sep 2025 02:10:12 +0000
Received: from sg-1-19.ptr.blmpb.com ([118.26.132.19])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1bQu-00000005GMQ-27pu
	for kvm-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 02:10:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1758766193;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=esxiSXJVAf692v1GQuzD2vDj9cm0Pc2N16YVXiroVfk=;
 b=R88jEXdp5M4F/gq0w/bjjMGxVoDpcBiOHJopskY9hFlm5AF3BJV1E90zWxhWbiaqW/oUAQ
 CsXhLE428IyJXea0LxV/QYN+O5Bcf9dyDFcKh08YPfPhucRn1TmWvKwzm/HhNVAnMPwFu2
 5/Mw6a8blCFSpC47tlyhFKk2cbjzIi7HU2MyiVgmMjCI6wGXWqQaOLYPWmsvlXSoUjJlMR
 W+2za6EWEsLrjap6NiKqn9W+RGRSZaenMpf2qkAKaicvoUtGM3mc94Lfa6z90szzNli+OP
 KG3+4wg+2SadPZUDon2K8xEv5hTluLRpb7gq8ht6Yd0+CyxkVXcGxKdq8jbdHw==
Content-Language: en-US
In-Reply-To: <20250924-7e9764acec6722b5ef29ce7d@orel>
References: <20250917085246.1430354-1-xiangwencheng@lanxincomputing.com> <20250923-5498566fbd48a3dfd61ecd08@orel> <1be32bd0-a3d1-4fea-8f22-e050f664907b@lanxincomputing.com> <20250924-7e9764acec6722b5ef29ce7d@orel>
Message-Id: <fe1f3a3e-a6e2-4d4d-b7da-0f4689bda34a@lanxincomputing.com>
Mime-Version: 1.0
Date: Thu, 25 Sep 2025 10:09:48 +0800
From: "BillXiang" <xiangwencheng@lanxincomputing.com>
Subject: Re: [PATCH] riscv: Move user-visible sbi ext ids to uapi
X-Original-From: BillXiang <xiangwencheng@lanxincomputing.com>
Received: from [127.0.0.1] ([222.128.9.250]) by smtp.feishu.cn with ESMTPS; Thu, 25 Sep 2025 10:09:49 +0800
To: "Andrew Jones" <ajones@ventanamicro.com>
User-Agent: Mozilla Thunderbird
X-Lms-Return-Path: <lba+268d4a46e+1bdc3e+lists.infradead.org+xiangwencheng@lanxincomputing.com>
Cc: <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>, 
	<linux-kernel@vger.kernel.org>, <paul.walmsley@sifive.com>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_191008_926607_C43B33F2 
X-CRM114-Status: GOOD (  19.95  )
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

On 9/24/2025 8:54 PM, Andrew Jones wrote:
> On Wed, Sep 24, 2025 at 10:35:25AM +0800, BillXiang wrote:
>> On 9/24/2025 4:14 AM, Andrew Jones wrote:
>>> On Wed, Sep 17, 2025 at 04:52:46PM +0800, BillXiang wrote:
>>>> Move those sbi ext ids to uapi because they will be forwarded
>>>> to user space by kvm.
>>>
>>> We don't need to publish the IDs in UAPI since they are already known to
>>> userspace by reading the SBI spec. Indeed QEMU already defines all of
>>> these except for the experimental range.>
>>> What problem are you trying to solve?
>>
>>
>> I'm working on rust-vmm[1], which auto-generates the ID constants
>> from uapi/kvm.h via bindgen[2]. Any ID that isn't exported there is
>> invisible to us. I expect other VMMs besides QEMU will need these
>> numbers as well, so let's keep one canonical definition in the UAPI
>> headers for everyone to share.
> 
> But KVM isn't the authority on these IDs, the spec is. KVM and its
> userspaces are just some implementations of SBI. M-mode software
> and other hypervisors also implements SBI.
> 
> For Rust you can use https://docs.rs/sbi-spec/latest/sbi_spec/ to get
> the constants you're looking for.

This is a good idea. I'll try it.

Thanks,
bill

> 
> Thanks,
> drew
> 
>>
>>
>> [1] https://github.com/rust-vmm
>> [2] https://crates.io/crates/bindgen
>>
>>>
>>> Thanks,
>>> drew
>>>
>>>>
>>>> Signed-off-by: BillXiang <xiangwencheng@lanxincomputing.com>
>>>> ---
>>>>    arch/riscv/include/asm/sbi.h      | 16 +-----------
>>>>    arch/riscv/include/uapi/asm/sbi.h | 43 +++++++++++++++++++++++++++++++
>>>>    2 files changed, 44 insertions(+), 15 deletions(-)
>>>>    create mode 100644 arch/riscv/include/uapi/asm/sbi.h
>>>>
>>>> diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
>>>> index 341e74238aa0..e196feaabb2e 100644
>>>> --- a/arch/riscv/include/asm/sbi.h
>>>> +++ b/arch/riscv/include/asm/sbi.h
>>>> @@ -10,13 +10,12 @@
>>>>    #include <linux/types.h>
>>>>    #include <linux/cpumask.h>
>>>>    #include <linux/jump_label.h>
>>>> +#include <uapi/asm/sbi.h>
>>>>    
>>>>    #ifdef CONFIG_RISCV_SBI
>>>>    enum sbi_ext_id {
>>>>    #ifdef CONFIG_RISCV_SBI_V01
>>>>    	SBI_EXT_0_1_SET_TIMER = 0x0,
>>>> -	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
>>>> -	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>>>>    	SBI_EXT_0_1_CLEAR_IPI = 0x3,
>>>>    	SBI_EXT_0_1_SEND_IPI = 0x4,
>>>>    	SBI_EXT_0_1_REMOTE_FENCE_I = 0x5,
>>>> @@ -37,13 +36,6 @@ enum sbi_ext_id {
>>>>    	SBI_EXT_NACL = 0x4E41434C,
>>>>    	SBI_EXT_FWFT = 0x46574654,
>>>>    
>>>> -	/* Experimentals extensions must lie within this range */
>>>> -	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>>>> -	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
>>>> -
>>>> -	/* Vendor extensions must lie within this range */
>>>> -	SBI_EXT_VENDOR_START = 0x09000000,
>>>> -	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>>>>    };
>>>>    
>>>>    enum sbi_ext_base_fid {
>>>> @@ -263,12 +255,6 @@ enum sbi_pmu_ctr_type {
>>>>    #define SBI_PMU_STOP_FLAG_RESET BIT(0)
>>>>    #define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
>>>>    
>>>> -enum sbi_ext_dbcn_fid {
>>>> -	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>>>> -	SBI_EXT_DBCN_CONSOLE_READ = 1,
>>>> -	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>>>> -};
>>>> -
>>>>    /* SBI STA (steal-time accounting) extension */
>>>>    enum sbi_ext_sta_fid {
>>>>    	SBI_EXT_STA_STEAL_TIME_SET_SHMEM = 0,
>>>> diff --git a/arch/riscv/include/uapi/asm/sbi.h b/arch/riscv/include/uapi/asm/sbi.h
>>>> new file mode 100644
>>>> index 000000000000..d29ac0abeefe
>>>> --- /dev/null
>>>> +++ b/arch/riscv/include/uapi/asm/sbi.h
>>>> @@ -0,0 +1,43 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>>>> +/*
>>>> + * Copyright (C) 2025 Lanxincomputing Corporation or its affiliates.
>>>> + *
>>>> + * Authors:
>>>> + *     BillXiang <xiangwencheng@lanxincomputing.com>
>>>> + */
>>>> +
>>>> +#ifndef _UAPI_ASM_RISCV_SBI_H
>>>> +#define _UAPI_ASM_RISCV_SBI_H
>>>> +
>>>> +
>>>> +enum SBI_EXT_ID {
>>>> +	/*
>>>> +	* The CONSOLE_GETCHAR/CONSOLE_PUTCHAR SBI calls cannot be
>>>> +	* handled in kernel so they will be forwarded to userspace by kvm.
>>>> +	*/
>>>> +	SBI_EXT_0_1_CONSOLE_PUTCHAR = 0x1,
>>>> +	SBI_EXT_0_1_CONSOLE_GETCHAR = 0x2,
>>>> +	/*
>>>> +	* Both SBI experimental and vendor extensions are
>>>> +	* unconditionally forwarded to userspace by kvm.
>>>> +	*/
>>>> +	/* Experimentals extensions must lie within this range */
>>>> +	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
>>>> +	SBI_EXT_EXPERIMENTAL_END = 0x08FFFFFF,
>>>> +
>>>> +	/* Vendor extensions must lie within this range */
>>>> +	SBI_EXT_VENDOR_START = 0x09000000,
>>>> +	SBI_EXT_VENDOR_END = 0x09FFFFFF,
>>>> +};
>>>> +
>>>> +/*
>>>> +* The SBI debug console functions are unconditionally
>>>> +* forwarded to the userspace by kvm.
>>>> +*/
>>>> +enum sbi_ext_dbcn_fid {
>>>> +	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
>>>> +	SBI_EXT_DBCN_CONSOLE_READ = 1,
>>>> +	SBI_EXT_DBCN_CONSOLE_WRITE_BYTE = 2,
>>>> +};
>>>> +
>>>> +#endif /* _UAPI_ASM_RISCV_SBI_H */
>>>> \ No newline at end of file
>>>> -- 
>>>> 2.43.0

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
