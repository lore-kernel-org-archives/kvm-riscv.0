Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD02ECCD184
	for <kvm-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 12:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SdhzeIQhWKl+koDn0AtMnjzZLuPSdJa5GV00NoJPk/E=; b=ZrhYksnw7RXWsN
	Cq/8Yca8K0LYQmaQyxhGJf3Mef62WJKw4gvKRVlPrEV0oQilobOr13MTWFFj2vUr/or5gnE8j4XS0
	PlHPDFambTlTyh4I+jNIFc5/SkFTNPHH4DmpcurT6S0FQ5dAXEhzIKG7CG6rKNLK85+x7UrmWRHZ2
	J45VEyzGB/+JFFRBXl/kH61XinvjubeFIhd9cdWGgDeoOzx4kWV+45n8PUkL3YlbSQfP0A5DsRpmm
	sx9KXhd/EdpD/a/ALjUhrKpJvniao5DUQXVj6MToOpIwN9Bs9YY+Go9yKixqyGtySEa/haiTUAUZj
	UNpqJZiMILORdR4yejFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pwK-000000067cN-2El8;
	Thu, 09 Oct 2025 12:40:12 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6pwH-000000067bw-2qng
	for kvm-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 12:40:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=mzdVfx8xn/QPdBUCN4U3pznV6jxD0CiJPSw0Brr2v6c=;
	b=dD1z6oWSFvYPvJRwrLVmeLK5FLoc+1qmJmfP35SSkI/IGnI8I6nbt0Hs7nEaC+
	8uSsnf6G8yrK3CGLN8NxziUo34OFIW6HZ2sT6wbBEcW3rqNifRV7Cv0aG0hKI2gD
	GV57wi0eDWoKaNrCE/L3cFm/0hqbLi3aZG68t8a9GgjR0=
Received: from [IPV6:240e:38d:8311:d200:5af6:a9f0:accb:2e3f] (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD3VyAjredoNpXxCw--.20897S2;
	Thu, 09 Oct 2025 20:40:04 +0800 (CST)
Message-ID: <305003be-8f8b-47f1-bbe6-17c547eb3725@163.com>
Date: Thu, 9 Oct 2025 20:40:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: riscv: selftests: sv39 support needed?
To: Andrew Jones <ajones@ventanamicro.com>, wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
References: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
 <20250918-618ded295b364b5aee7d17b2@orel>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20250918-618ded295b364b5aee7d17b2@orel>
X-CM-TRANSID: _____wD3VyAjredoNpXxCw--.20897S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFyrtr4DWw13Kw15Jry3XFb_yoW8Jw1fpr
	W8Cr13KF9FvrZak3W8Za4vvFWFyFZ3XrWjy3yUJFn7JrWq9a9Fgr4IkFW3CFWYgrnFyFya
	yrWYqFnrWa1qv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRbTmDUUUUU=
X-Originating-IP: [240e:38d:8311:d200:5af6:a9f0:accb:2e3f]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYA-hoWjnqvVHDAAAs0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_054010_168410_9AB6387A 
X-CRM114-Status: GOOD (  13.10  )
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


On 9/18/25 22:13, Andrew Jones wrote:
> On Wed, Sep 17, 2025 at 10:11:05AM +0800, wu.fei9@sanechips.com.cn wrote:
>> I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
>> uses sv39 by default, then I got the following error. After some debugging I
>> found sv39 is not supported for selftests, should we add sv39 support? I can
>> prepare a patch if it's needed.
> Yes, please.


Should we add another mode as VM_MODE_P41V39_4K? The smallest VA is 
47bits on the existing modes.

Also, is it necessary to add mode for sv57? Or we can just use some 
existing ones such as P52V48 instead.

>
>> # ./arch_timer
>> Random seed: 0x6b8b4567
>> ==== Test Assertion Failure ====
>>    arch_timer.c:73: false
>>    pid=144 tid=146 errno=0 - Success
> We can avoid errors for the default case by adding a
> kvm_selftest_arch_init() function for riscv which calls
> guest_modes_append_default(). We'll also need to modify
> guest_modes_append_default() to configure the default using information
> from KVM that can be obtained with a get-one-reg of the satp_mode config
> register. OIOW, use satp_mode but otherwise just mimic arm64's setup.


Is the current kvm_check_cap(KVM_CAP_VM_GPA_BITS) equal to satp_mode,

e.g. gpa 41-bits always means 8 in satp_mode?


Thanks,

Fei.


>
> Thanks,
> drew
>


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
