Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FFB5CCD193
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpi2N//pxaJkzo5sJewuB86JUBVYKK3bhZbqzCcHnZ8=; b=l0TMQeO6sj7VSQ
	F0JqLiWiWXrX7cDVwVO4ANSinYn/ArHukjEME985nKWnwFW1PohdkGw6x7MHm4MQM+FTpmmFSxWPL
	xobV3p2QsuQTbt0nlA64xsnb2hUq7EqaoAv6Y4QXDfizvLh4xW2M7O7lswDYzq6imUTWcNhxm7NMp
	utWKKFqNyCf0D/WwLcI2ZxeJI0nw17sItl3NRAKZ0QG/mvXTT+1ht0CBxC5XWbsfodx/XxCtHtlpQ
	mMXeDYrgsKpSXb6Ib3qIV7LlJqrWI/22NFfRyNGaEQoja7W2SXXYBlqRUOaTwCsX11QHuzpxCXsRJ
	FpR7fehdLutT2IfZfe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApyh-0000000DnNE-1IVU;
	Mon, 20 Oct 2025 13:31:11 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApye-0000000DnLK-1Lfk
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 13:31:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=iaBLmPkIvucF1j+atVvzh2XN9QRKiGaTDtnH1rWANGU=;
	b=ZuBc09qWRF111oLafKz3rllDpql/71qpYjW3UoHBUHKDh59cRlhTY6p8XW79l/
	+Yqxw+YwrwxRyZkXqzYupxqNEXEBfWaOVrE0jeq+cj+yowpMsHA3OSpVeAddsLs6
	Tze9spAJwWNhA6sfq19bNhX3DQFimyn2l+D/jC1hy/rBs=
Received: from [IPV6:240e:38d:8311:d200:2132:715b:71ac:8b03] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXX+2VOfZo7fGJAw--.3009S3;
	Mon, 20 Oct 2025 21:31:02 +0800 (CST)
Message-ID: <93d3af21-5d3d-465c-a9f2-0eaed7475fb3@163.com>
Date: Mon, 20 Oct 2025 21:26:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] KVM: riscv: selftests: Detect supported vm modes
To: Andrew Jones <ajones@ventanamicro.com>, wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170319.59H3JmWd056039@mse-fl2.zte.com.cn>
 <20251017-f2c1b717d2364067c64f95a6@orel>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20251017-f2c1b717d2364067c64f95a6@orel>
X-CM-TRANSID: PSgvCgDXX+2VOfZo7fGJAw--.3009S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3Xr4rZw17CrW8Cr1rur4xtFb_yoWxXry7pF
	1kC3W0kFWxtFy2qFyfG3sYqFWxtw1rGrWI9r1aqF17Cw4vyrn7tr4xKF45Ca4furWSq3WF
	yF1SgFnxur47XFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRtCzNUUUUU=
X-Originating-IP: [240e:38d:8311:d200:2132:715b:71ac:8b03]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiYgHsoWj2MuiQ3wAAsl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_063108_744470_AC16BA88 
X-CRM114-Status: GOOD (  25.55  )
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

On 10/18/25 00:04, Andrew Jones wrote:
> On Fri, Oct 17, 2025 at 11:15:57AM +0800, wu.fei9@sanechips.com.cn wrote:
>> The default vm mode on riscv is hardcoded to sv48, which causes tests to
>> fail on platform supporting sv39 only, such as '-cpu rva23s64' on qemu.
>> This patch detects the support vm modes and sets default to the maximum
>> supported one.
>>
>> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
>> ---
>>   .../testing/selftests/kvm/include/kvm_util.h  |  4 ++-
>>   .../selftests/kvm/include/riscv/processor.h   |  2 ++
>>   tools/testing/selftests/kvm/lib/guest_modes.c | 24 +++++++++----
>>   .../selftests/kvm/lib/riscv/processor.c       | 36 +++++++++++++++++++
>>   4 files changed, 59 insertions(+), 7 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
>> index 02224bc514d4..7bc2ee9f0cad 100644
>> --- a/tools/testing/selftests/kvm/include/kvm_util.h
>> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
>> @@ -234,7 +234,9 @@ extern enum vm_guest_mode vm_mode_default;
>>   #error "RISC-V 32-bit kvm selftests not supported"
>>   #endif
>>
>> -#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
>> +extern enum vm_guest_mode vm_mode_default;
> 
> We can just move this declaration out of the #ifdef __aarch64__ region.
> It shouldn't harm other architectures.

OK.

> 
>> +
>> +#define VM_MODE_DEFAULT                        vm_mode_default
>>   #define MIN_PAGE_SHIFT                 12U
>>   #define ptes_per_page(page_size)       ((page_size) / 8)
>>
>> diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
>> index 162f303d9daa..2d5a5548e698 100644
>> --- a/tools/testing/selftests/kvm/include/riscv/processor.h
>> +++ b/tools/testing/selftests/kvm/include/riscv/processor.h
>> @@ -191,4 +191,6 @@ static inline void local_irq_disable(void)
>>          csr_clear(CSR_SSTATUS, SR_SIE);
>>   }
>>
>> +unsigned long riscv64_get_satp_mode(void);
>> +
>>   #endif /* SELFTEST_KVM_PROCESSOR_H */
>> diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
>> index 63d0d5479188..9c4a9e86223e 100644
>> --- a/tools/testing/selftests/kvm/lib/guest_modes.c
>> +++ b/tools/testing/selftests/kvm/lib/guest_modes.c
>> @@ -4,7 +4,7 @@
>>    */
>>   #include "guest_modes.h"
>>
>> -#ifdef __aarch64__
>> +#if defined(__aarch64__) || defined(__riscv)
>>   #include "processor.h"
>>   enum vm_guest_mode vm_mode_default;
>>   #endif
>> @@ -13,9 +13,11 @@ struct guest_mode guest_modes[NUM_VM_MODES];
>>
>>   void guest_modes_append_default(void)
>>   {
>> -#ifndef __aarch64__
>> +#if !defined(__aarch64__) && !defined(__riscv)
>>          guest_mode_append(VM_MODE_DEFAULT, true);
>> -#else
>> +#endif
>> +
>> +#ifdef __aarch64__
>>          {
>>                  unsigned int limit = kvm_check_cap(KVM_CAP_ARM_VM_IPA_SIZE);
>>                  uint32_t ipa4k, ipa16k, ipa64k;
>> @@ -74,10 +76,20 @@ void guest_modes_append_default(void)
>>   #ifdef __riscv
>>          {
>>                  unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
>> +               unsigned long satp_mode = riscv64_get_satp_mode() << SATP_MODE_SHIFT;
>> +               int i;
>>
>> -               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
>> -               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
>> -               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
>> +               guest_mode_append(VM_MODE_P56V57_4K, satp_mode >= SATP_MODE_57 && sz >= 59);
>> +               guest_mode_append(VM_MODE_P50V48_4K, satp_mode >= SATP_MODE_48 && sz >= 50);
>> +               guest_mode_append(VM_MODE_P41V39_4K, satp_mode >= SATP_MODE_39 && sz >= 41);
> 
> Something along these lines was what I was suggesting in the last patch,
> but where we select from many more combinations of P and V for modes.
> 
> VM_MODE_P41V39_4K
> VM_MODE_P41V48_4K
> VM_MODE_P41V57_4K
> VM_MODE_P50V48_4K
> VM_MODE_P50V57_4K
> VM_MODE_P59V57_4K

Do we need more? e.g. for sv39, there could be P50V39 and P56V39.

> 
>> +
>> +               // set the first (maximum) supported mode as default
> 
> Please, no C++ comments, and don't we want a V39 mode to be the default?
> In fact, VM_MODE_P41V39_4K should always be supported, so we can just set
> VM_MODE_DEFAULT to that.

It's likely the maximum supported mode is the most common configuration 
on production?

Thanks,
Fei.

> 
> Thanks,
> drew
> 
>> +               vm_mode_default = NUM_VM_MODES;
>> +               for (i = 0; vm_mode_default == NUM_VM_MODES && i < NUM_VM_MODES; i++) {
>> +                       if (guest_modes[i].supported && guest_modes[i].enabled)
>> +                               vm_mode_default = i;
>> +               }
>> +               TEST_ASSERT(vm_mode_default != NUM_VM_MODES, "No supported mode!");
>>          }
>>   #endif
>>   }
>> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> index de84c092f982..eac67cb21f50 100644
>> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/compiler.h>
>>   #include <assert.h>
>>
>> +#include "guest_modes.h"
>>   #include "kvm_util.h"
>>   #include "processor.h"
>>   #include "ucall_common.h"
>> @@ -528,3 +529,38 @@ unsigned long get_host_sbi_spec_version(void)
>>
>>          return ret.value;
>>   }
>> +
>> +void kvm_selftest_arch_init(void)
>> +{
>> +       /*
>> +        * riscv64 doesn't have a true default mode, so start by detecting the
>> +        * supported vm mode.
>> +        */
>> +       guest_modes_append_default();
>> +}
>> +
>> +unsigned long riscv64_get_satp_mode(void)
>> +{
>> +       int kvm_fd, vm_fd, vcpu_fd, err;
>> +       uint64_t val;
>> +       struct kvm_one_reg reg = {
>> +               .id     = RISCV_CONFIG_REG(satp_mode),
>> +               .addr   = (uint64_t)&val,
>> +       };
>> +
>> +       kvm_fd = open_kvm_dev_path_or_exit();
>> +       vm_fd = __kvm_ioctl(kvm_fd, KVM_CREATE_VM, NULL);
>> +       TEST_ASSERT(vm_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VM, vm_fd));
>> +
>> +       vcpu_fd = ioctl(vm_fd, KVM_CREATE_VCPU, 0);
>> +       TEST_ASSERT(vcpu_fd >= 0, KVM_IOCTL_ERROR(KVM_CREATE_VCPU, vcpu_fd));
>> +
>> +       err = ioctl(vcpu_fd, KVM_GET_ONE_REG, &reg);
>> +       TEST_ASSERT(err == 0, KVM_IOCTL_ERROR(KVM_GET_ONE_REG, vcpu_fd));
>> +
>> +       close(vcpu_fd);
>> +       close(vm_fd);
>> +       close(kvm_fd);
>> +
>> +       return val;
>> +}
>> --
>> 2.43.0
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
