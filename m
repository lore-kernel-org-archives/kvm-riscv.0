Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 693D4CCD185
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Oct 2025 14:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JeWRnjk59obPAoeHJYCJdW/SbE7LPKRqBuikcWh+Z6s=; b=l9RiOheKJZznRg
	ZV/F8ni4ZmpUjxRVByDhl7JPwbhziEwsb8t8x4hUszjA0Yl//bGkdGO3ofZUht9EKRsTbWYgj9Z1B
	rPmQVKHfUokcRE8Jj6KocsSFwhYEiaK7bomNLLgrgVlH74AyqL2/MX5qVafyIue/erBsTemULJoGj
	XCeL+Psk2IaROCl3pAUsiFlPghEo0rp+WhE6dfhM1Vb0BhMDsmAT0Nzlf4m1e8OP5/pLFfbs7uCdW
	m+OOzcSweswQH3oSLEajuquMkSicoGqLf2BPwgOOPUe2yqDyOOQcL8XiMhMMuXJEvitK+JxR7kKTQ
	MeXkbOw4+BC/O5CkZqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dqh-00000008dWC-04qb;
	Fri, 10 Oct 2025 14:11:59 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Dqd-00000008dTH-2Iig
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Oct 2025 14:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=EGTg3UI8+wmv7/ItHdXdZcjDDD21GS2UPYiO+4FZMjA=;
	b=PN3JzIi3oWX48a8vGhPna5NOrHA3DXT8IAPIUAgmEO8MKsZky4AIT89r/TFqI2
	w+3RiTPX1LWZtHFkTbNs0Izo5GsFqH5S38eu6CXDIkb3IOnxV8nTflAr9pYZNg60
	QMKgZ+9nPaqTRi/CqSfk5lsgN23qbBGcGQ6iz9q1R8Zwc=
Received: from [IPV6:240e:38d:8311:d200:72f2:4161:c85c:bd3e] (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wD3n6IjFOlokxRJDQ--.5490S2;
	Fri, 10 Oct 2025 22:11:47 +0800 (CST)
Message-ID: <56cae42e-158e-47e8-ae94-56b2e0a84643@163.com>
Date: Fri, 10 Oct 2025 22:11:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: KVM: riscv: selftests: sv39 support needed?
To: Andrew Jones <ajones@ventanamicro.com>
Cc: wu.fei9@sanechips.com.cn, kvm-riscv@lists.infradead.org
References: <202509170234.58H2YCma081344@mse-fl2.zte.com.cn>
 <20250918-618ded295b364b5aee7d17b2@orel>
 <305003be-8f8b-47f1-bbe6-17c547eb3725@163.com>
 <20251009-fbe27696dc9ef50de56c44d3@orel>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20251009-fbe27696dc9ef50de56c44d3@orel>
X-CM-TRANSID: _____wD3n6IjFOlokxRJDQ--.5490S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxWr1kZr4UurykJr1ktr4xJFb_yoW5uw15pr
	W2kF45Ka4DJan7AF40934vqFy8trW5JryUXayvvF1UGwsYgw12yr1Iga15uFyS9r1xZa48
	tF4YqFy3Can8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pZg4rcUUUUU=
X-Originating-IP: [240e:38d:8311:d200:72f2:4161:c85c:bd3e]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYgfioWjpDEfxBQAAsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_071155_972369_304A1D0D 
X-CRM114-Status: GOOD (  28.60  )
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

On 10/9/25 22:40, Andrew Jones wrote:
> On Thu, Oct 09, 2025 at 08:40:03PM +0800, Wu Fei wrote:
>>
>> On 9/18/25 22:13, Andrew Jones wrote:
>>> On Wed, Sep 17, 2025 at 10:11:05AM +0800, wu.fei9@sanechips.com.cn wrote:
>>>> I was running kvm selftests on qemu-system-riscv64 with "-cpu rva23s64", which
>>>> uses sv39 by default, then I got the following error. After some debugging I
>>>> found sv39 is not supported for selftests, should we add sv39 support? I can
>>>> prepare a patch if it's needed.
>>> Yes, please.
>>
>>
>> Should we add another mode as VM_MODE_P41V39_4K? The smallest VA is 47bits
>> on the existing modes.
> 
> Why P41? sv39 supports a 56-bit physical address. To support sv39 I'd
> expect to add a VM_MODE_P56V39_4K. And, afaict, the reason we don't have a
> VM_MODE_P56V48_4K is simply because when riscv support was added it
> didn't add any new modes. We could VM_MODE_P56V48_4K as part of this work.

It's about mode for guest? Which is also limited by hgapt.mode, suppose 
hgapt.mode is Sv39x4, the valid gpa bits is 41.

> 
>>
>> Also, is it necessary to add mode for sv57? Or we can just use some existing
>> ones such as P52V48 instead.
> 
> We need new modes that support 57-bit virtual addresses to test that
> support, and I'd like to see that. Again we have a 56-bit physical
> address, so the new mode would be VM_MODE_P56V57_4K.
> 
>>
>>>
>>>> # ./arch_timer
>>>> Random seed: 0x6b8b4567
>>>> ==== Test Assertion Failure ====
>>>>     arch_timer.c:73: false
>>>>     pid=144 tid=146 errno=0 - Success
>>> We can avoid errors for the default case by adding a
>>> kvm_selftest_arch_init() function for riscv which calls
>>> guest_modes_append_default(). We'll also need to modify
>>> guest_modes_append_default() to configure the default using information
>>> from KVM that can be obtained with a get-one-reg of the satp_mode config
>>> register. OIOW, use satp_mode but otherwise just mimic arm64's setup.
>>
>>
>> Is the current kvm_check_cap(KVM_CAP_VM_GPA_BITS) equal to satp_mode,
>>
>> e.g. gpa 41-bits always means 8 in satp_mode?
> 
> No, KVM_CAP_VM_GPA_BITS only tells you the number of physical bits of the
> host, which dictates the maximum mode you can choose (see
> lib/guest_modes.c). You can get the maximum satp_mode with get-one-reg
> RISCV_CONFIG_REG(satp_mode) and then use that or anything smaller than
> that for the mode in the test. See lib/guest_modes.c again to see how
> there's support in the test framework for looping over modes in order to
> run the same tests on multiple modes. To do that, the test will change
> the guest configured mode with a set-one-reg of satp_mode.

Got it, just check the difference of the two methods:
* KVM_CAP_VM_GPA_BITS - value from hgatp.mode, which is set during 
kvm_riscv_gstage_mode_detect(), represents the hardware capability
* RISCV_CONFIG_REG(satp_mode) - value from satp_mode, which is set 
during set_satp_mode(), decided by both hardware capability and kernel 
cmdline

It looks like current implementation tries to ensure vsatp.mode equals 
to host satp.mode (I don't think it's necessary from spec point of 
view), so that only one mode can be set for guest, in 
kvm_riscv_vcpu_set_reg_config:

         case KVM_REG_RISCV_CONFIG_REG(satp_mode):
                 if (reg_val != (satp_mode >> SATP_MODE_SHIFT))
                         return -EINVAL;
                 break;

Thanks,
Fei.

> 
> Thanks,
> drew


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
