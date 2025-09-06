Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22F24CA0FED
	for <kvm-riscv@archiver.kernel.org>; Sat,  6 Sep 2025 01:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QrSTMi7Up9jr3kwks8BiJB/3NKAfNFOOrEQm/Cl+Yo0=; b=B25efLQmmL2fWL
	UYZgyBWagnSAfPi6p8QBk5JSUInfBcd1tpD+6zMxY/ykc049C+CNLFn6omaKhbtonvhEmJyc8737e
	8pHnaf9BTTX4RZs7xDujmujm2MJ2FlIIXIHhvKVTbgboJoTdxN+w6raPAW+mwRccdF5KyFM0OAe/n
	822V5zSau7VH5YQV2AKgt2gMGE68nSq+LecmxywNaz5DUDCOcjDRk03BYM/W0sRkqwxVMCwyyTCtx
	4UFwNgVxhaPfa7kVSfDrdGniq+bO3pr00fkNb589Vm8Hcv2t6fXtqzGY3c6eCuJ6HM1p/Pbnqnkrv
	b25rS5rvwrCDX9yE5x5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuhvY-00000005va4-2JZO;
	Sat, 06 Sep 2025 01:41:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugrH-00000005eVL-07kA
	for kvm-riscv@bombadil.infradead.org;
	Sat, 06 Sep 2025 00:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rQWBk6wl3TKrhD9ZhYNdmamuQ/HWZyDDy7WGBK2NuqA=; b=HanJ86bEdt+ZlTglEVyPJOT1SV
	YrqPmE2cFQEbexeNTUGz60kovGLYvJDIJZx//CbPsSpf/UMnk35ui8Yvq9iD17ABJP59+hn9tQJFz
	CCe+S3chtbkzqaP57sw8N0T9EKZKLBUJ+0nmlgmiq2vJEliKqvN4cevw55Uv9ey5Lbr/VRa5r4Gli
	HLsLTQPv237Gdyolk6E/+D1BSSOVYwd0UeZ+vnVf3G3bQHzsxbX6atH0KE46aJRFx/VqZjK19KbiY
	sIULC/m0CTxz/J8iNQ0MHgdiYFmsEtwiusQCgpbzd5yTvYNbpRhrsdpSBgUgO/mmm7dZkAirkPA3T
	R6elF1iQ==;
Received: from m16.mail.163.com ([117.135.210.5])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uugrC-00000004iuG-0ifA
	for kvm-riscv@lists.infradead.org;
	Sat, 06 Sep 2025 00:32:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=rQWBk6wl3TKrhD9ZhYNdmamuQ/HWZyDDy7WGBK2NuqA=;
	b=m+2MTyUpk7EHNVoeIfqYD3Ot0z/aqOG97YmmXeUB9PLMCKG36DJxWYuurhKin2
	sBkEm3fIkyK6QQrb4V8vQpNn+EbiX/ADFyXawfgFLBIh2OCx6qXHdoDORpeQS5kc
	4uvtK+EdPDGV5gCl7WYHsoJDFndh4yYoFOeMdQHgJ0PhA=
Received: from [192.168.2.3] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXEPERgbtodT+4Bw--.34949S2;
	Sat, 06 Sep 2025 08:32:18 +0800 (CST)
Message-ID: <87674b60-1882-4566-b92d-23b75a2df187@163.com>
Date: Sat, 6 Sep 2025 08:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH] riscv: Fix sbi-deps expansion for older
 GNU Make
To: Andrew Jones <andrew.jones@linux.dev>, wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org, npiggin@gmail.com, joel@jms.id.au
References: <202509050748.5857mUY1083256@mse-fl1.zte.com.cn>
 <20250905-947146894bc614df37a82dfb@orel>
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20250905-947146894bc614df37a82dfb@orel>
X-CM-TRANSID: PigvCgCXEPERgbtodT+4Bw--.34949S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr1UKw47Cr4DJrWDWw4fAFb_yoW8Kw1rpw
	18GF4vyrWrKr1ak3W2vw15KFy8KrZ3ZF4fXFs0kr1jywnrXr47trs2k348WasI9rn5Xw40
	v3WDKa9ru34xWrUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDeOLUUUUU=
X-Originating-IP: [115.227.137.96]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYgLAoWi7f40fBgAAs5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_013242_964218_B3984B12 
X-CRM114-Status: GOOD (  19.02  )
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

On 9/5/25 11:37 PM, Andrew Jones wrote:

> On Fri, Sep 05, 2025 at 03:43:12PM +0800, wu.fei9@sanechips.com.cn wrote:
>>  From b8b66e40566bb89de57e45b08fc72446b26a7bfb Mon Sep 17 00:00:00 2001
>> From: Wu Fei <wu.fei9@sanechips.com.cn>
>> Date: Fri, 5 Sep 2025 14:31:48 +0800
>> Subject: [PATCH] riscv: Fix sbi-deps expansion for older GNU Make
>>
>> The prerequisite $$($$*-deps) cannot be expanded to $(TEST_DIR)/sbi-deps
>> in 4.2.1 Make, rename it to sbi-deps without the prefix path.
>>
>> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
>> ---
>>   riscv/Makefile | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
> Hi Wu Fei,
>
> It looks like you ran into and fixed the same thing as some others. Take a
> look at this patch and thread here [1]. I think Nicholas' solution is more
> complete since it includes the notdir. However, assuming your solution
> works, it makes me wonder why it's not necessary?


Hi Drew,


Yes, it should be the same thing. I didn't subscribe the mailing list 
yet yesterday, when I checked the archives I found Joel had reported it. 
It should be better to reply to that thread directly but I didn't figure 
out how to do that at that time.


Regarding notdir, yes, this patch happened to work on Make 4.2.1 but not 
work on 4.3.


Regards,

Fei.

>
> [1] https://lore.kernel.org/all/csh2fzymze636erajmsu5d55id6fpfsnvypkz3at7anp5i35uw@fhn2qgz327vj/
>
> Thanks,
> drew
>
>> diff --git a/riscv/Makefile b/riscv/Makefile
>> index beaeaefa..372c56b3 100644
>> --- a/riscv/Makefile
>> +++ b/riscv/Makefile
>> @@ -18,12 +18,12 @@ tests += $(TEST_DIR)/isa-dbltrp.$(exe)
>>
>>   all: $(tests)
>>
>> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-asm.o
>> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-dbtr.o
>> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-fwft.o
>> -$(TEST_DIR)/sbi-deps += $(TEST_DIR)/sbi-sse.o
>> +sbi-deps += $(TEST_DIR)/sbi-asm.o
>> +sbi-deps += $(TEST_DIR)/sbi-dbtr.o
>> +sbi-deps += $(TEST_DIR)/sbi-fwft.o
>> +sbi-deps += $(TEST_DIR)/sbi-sse.o
>>
>> -all_deps += $($(TEST_DIR)/sbi-deps)
>> +all_deps += $(sbi-deps)
>>
>>   # When built for EFI sieve needs extra memory, run with e.g. '-m 256' on QEMU
>>   $(TEST_DIR)/sieve.$(exe): AUXFLAGS = 0x1
>> --
>> 2.43.0
>>
>> -- 
>> kvm-riscv mailing list
>> kvm-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/kvm-riscv


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
