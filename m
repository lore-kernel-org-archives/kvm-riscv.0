Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D58CCD1A2
	for <kvm-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p35JKHSqO5jT32704F77gUeSpNEoI68nGCVzWLPceFg=; b=R1KIIm+z1g35z3
	rG66SHKQcyHI8OBUfgQTzCJhShrBQ6WY/WZHUVLlpq371oza2VIF+OPZ1sAjqyZc53jA0r/Z919Sw
	QMbxhL8uJVzu9W3DizfZRlN1a3DsEY1x0Vpehigfc3kmTkaVE0Qjv+GBYU7izzAH628T8BQgD2jzS
	bPQXht8Sds5J7eh9qUv+JT42hfaxcxCW1goAIKOhZSLbeJnL0aA0ZTA/YRX0KKj4g6B8N4duS0i3c
	I/Tn5X1U1B6dLF1T4AqI7p1Vrlpg/JBXBJfNhZJqVGmuvHoLWWuAdZqs6YU920L2TZzxjbq+kn0Fq
	r8kHgtVDxe3jPZSAjYBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApyh-0000000DnN6-0GaU;
	Mon, 20 Oct 2025 13:31:11 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApyd-0000000DnLJ-1Gdr
	for kvm-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 13:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=M2DVP/gUm7nXePLrw2pSY1SEDi3zLgFpC7VLn4kOgyE=;
	b=LdnOfyjOIOm0DO6sVorRW+YAuVp2sWkmoDXtQfMITPmo2SdpwFmNIeYPPKlxOw
	oiig+C44+nSwT62woUcmoCQzc5LudjDVZCm7YZXgCoVvuy48qYxnmWCUgxxJP2kl
	PkyUSyCilxx88C7W+cwSELdfEJTBysmMenJNvGeBxS+Q0=
Received: from [IPV6:240e:38d:8311:d200:2132:715b:71ac:8b03] (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgDXX+2VOfZo7fGJAw--.3009S2;
	Mon, 20 Oct 2025 21:31:02 +0800 (CST)
Message-ID: <7b0a5403-2438-4f19-808b-1c9a64730be7@163.com>
Date: Mon, 20 Oct 2025 21:09:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] KVM: riscv: selftests: Add riscv vm satp modes
To: Andrew Jones <ajones@ventanamicro.com>, wu.fei9@sanechips.com.cn
Cc: kvm-riscv@lists.infradead.org
References: <20251017110908650RWBl7sDIk6WUGhkvJSH4L@zte.com.cn>
 <202510170334.59H3Y7fB074149@mse-fl2.zte.com.cn>
 <20251017-a54df6d42b219d16a24a26ea@orel>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <20251017-a54df6d42b219d16a24a26ea@orel>
X-CM-TRANSID: PSgvCgDXX+2VOfZo7fGJAw--.3009S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxKw13uFy8urW5WF4ktw15XFb_yoWxAF43pa
	ykGa1Fka4xtFy7XFyxWr9YqFWftan5ArW8ury2qFW7uw4vyrn7Ar1xKF43Aa43ZrWfWwn3
	AF1SgF9rurWxXFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRctxgUUUUU=
X-Originating-IP: [240e:38d:8311:d200:2132:715b:71ac:8b03]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/1tbiSgTsoWj2MH7EagAAs9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_063107_772388_3E6A4B52 
X-CRM114-Status: GOOD (  21.53  )
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

On 10/17/25 23:38, Andrew Jones wrote:
> On Fri, Oct 17, 2025 at 11:13:33AM +0800, wu.fei9@sanechips.com.cn wrote:
>> Current vm modes cannot represent riscv guest modes precisely, here add
>> P41V39, P50V48 and P56V57.
>>
>> Signed-off-by: Wu Fei <wu.fei9@sanechips.com.cn>
>> ---
>>   .../testing/selftests/kvm/include/kvm_util.h  |  7 ++++++-
>>   tools/testing/selftests/kvm/lib/guest_modes.c |  7 +++----
>>   tools/testing/selftests/kvm/lib/kvm_util.c    | 15 +++++++++++++
>>   .../selftests/kvm/lib/riscv/processor.c       | 21 +++++++++++++++----
>>   4 files changed, 41 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/testing/selftests/kvm/include/kvm_util.h b/tools/testing/selftests/kvm/include/kvm_util.h
>> index bee65ca08721..02224bc514d4 100644
>> --- a/tools/testing/selftests/kvm/include/kvm_util.h
>> +++ b/tools/testing/selftests/kvm/include/kvm_util.h
>> @@ -179,6 +179,11 @@ enum vm_guest_mode {
>>          VM_MODE_P36V48_64K,
>>          VM_MODE_P47V47_16K,
>>          VM_MODE_P36V47_16K,
>> +
>> +       VM_MODE_P56V57_4K,      /* For riscv64 */
> 
> This should be P59

Although sv57x4 in hgatp does support P59, sv57 itself doesn't, so guest 
can only address 56bits gpa.

> 
>> +       VM_MODE_P50V48_4K,
>> +       VM_MODE_P41V39_4K,
>> +
>>          NUM_VM_MODES,
>>   };
>>
>> @@ -229,7 +234,7 @@ extern enum vm_guest_mode vm_mode_default;
>>   #error "RISC-V 32-bit kvm selftests not supported"
>>   #endif
>>
>> -#define VM_MODE_DEFAULT                        VM_MODE_P40V48_4K
>> +#define VM_MODE_DEFAULT                        VM_MODE_P50V48_4K
>>   #define MIN_PAGE_SHIFT                 12U
>>   #define ptes_per_page(page_size)       ((page_size) / 8)
>>
>> diff --git a/tools/testing/selftests/kvm/lib/guest_modes.c b/tools/testing/selftests/kvm/lib/guest_modes.c
>> index b04901e55138..63d0d5479188 100644
>> --- a/tools/testing/selftests/kvm/lib/guest_modes.c
>> +++ b/tools/testing/selftests/kvm/lib/guest_modes.c
>> @@ -75,10 +75,9 @@ void guest_modes_append_default(void)
>>          {
>>                  unsigned int sz = kvm_check_cap(KVM_CAP_VM_GPA_BITS);
>>
>> -               if (sz >= 52)
>> -                       guest_mode_append(VM_MODE_P52V48_4K, true);
>> -               if (sz >= 48)
>> -                       guest_mode_append(VM_MODE_P48V48_4K, true);
>> +               guest_mode_append(VM_MODE_P56V57_4K, sz >= 59);
>> +               guest_mode_append(VM_MODE_P50V48_4K, sz >= 50);
>> +               guest_mode_append(VM_MODE_P41V39_4K, sz >= 41);
> 
> Even when the host doesn't support P59 a guest may still use V57 (and when
> a host doesn't support P50 a guest may still use V57 or V48). The host
> simply doesn't describe physical memory with address bit widths greater
> than its limits to the guest. Then the guest is free to use whatever
> virtual address width is supported by the MMU. IOW, we need all
> combinations of P and V widths for modes and then select similarly to how
> Arm has multiple modes to manage all the different page sizes. Also in
> order to know the maximum supported virtual bit width we need to
> get-one-reg satp_mode. We should do that here instead of in
> riscv_vcpu_mmu_setup() in order to filter out invalid modes when
> appending them.

Make sense, modes in satp/hgatp/vsatp are independent, more discussions 
in next patch.

Thanks,
Fei.

> 
> Thanks,
> drew
> 
>>          }
>>   #endif
>>   }
>> diff --git a/tools/testing/selftests/kvm/lib/kvm_util.c b/tools/testing/selftests/kvm/lib/kvm_util.c
>> index a055343a7bf7..4cd69fffa06d 100644
>> --- a/tools/testing/selftests/kvm/lib/kvm_util.c
>> +++ b/tools/testing/selftests/kvm/lib/kvm_util.c
>> @@ -224,6 +224,9 @@ const char *vm_guest_mode_string(uint32_t i)
>>                  [VM_MODE_P36V48_64K]    = "PA-bits:36,  VA-bits:48, 64K pages",
>>                  [VM_MODE_P47V47_16K]    = "PA-bits:47,  VA-bits:47, 16K pages",
>>                  [VM_MODE_P36V47_16K]    = "PA-bits:36,  VA-bits:47, 16K pages",
>> +               [VM_MODE_P56V57_4K]     = "PA-bits:56,  VA-bits:57,  4K pages",
>> +               [VM_MODE_P50V48_4K]     = "PA-bits:50,  VA-bits:48,  4K pages",
>> +               [VM_MODE_P41V39_4K]     = "PA-bits:41,  VA-bits:39,  4K pages",
>>          };
>>          _Static_assert(sizeof(strings)/sizeof(char *) == NUM_VM_MODES,
>>                         "Missing new mode strings?");
>> @@ -251,6 +254,9 @@ const struct vm_guest_mode_params vm_guest_mode_params[] = {
>>          [VM_MODE_P36V48_64K]    = { 36, 48, 0x10000, 16 },
>>          [VM_MODE_P47V47_16K]    = { 47, 47,  0x4000, 14 },
>>          [VM_MODE_P36V47_16K]    = { 36, 47,  0x4000, 14 },
>> +       [VM_MODE_P56V57_4K]     = { 56, 57,  0x1000, 12 },
>> +       [VM_MODE_P50V48_4K]     = { 50, 48,  0x1000, 12 },
>> +       [VM_MODE_P41V39_4K]     = { 41, 39,  0x1000, 12 },
>>   };
>>   _Static_assert(sizeof(vm_guest_mode_params)/sizeof(struct vm_guest_mode_params) == NUM_VM_MODES,
>>                 "Missing new mode params?");
>> @@ -351,6 +357,15 @@ struct kvm_vm *____vm_create(struct vm_shape shape)
>>          case VM_MODE_P44V64_4K:
>>                  vm->pgtable_levels = 5;
>>                  break;
>> +       case VM_MODE_P56V57_4K:
>> +               vm->pgtable_levels = 5;
>> +               break;
>> +       case VM_MODE_P50V48_4K:
>> +               vm->pgtable_levels = 4;
>> +               break;
>> +       case VM_MODE_P41V39_4K:
>> +               vm->pgtable_levels = 3;
>> +               break;
>>          default:
>>                  TEST_FAIL("Unknown guest mode: 0x%x", vm->mode);
>>          }
>> diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> index 2eac7d4b59e9..de84c092f982 100644
>> --- a/tools/testing/selftests/kvm/lib/riscv/processor.c
>> +++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
>> @@ -197,22 +197,35 @@ void riscv_vcpu_mmu_setup(struct kvm_vcpu *vcpu)
>>   {
>>          struct kvm_vm *vm = vcpu->vm;
>>          unsigned long satp;
>> +       unsigned long satp_mode;
>> +       unsigned long max_satp_mode;
>>
>>          /*
>>           * The RISC-V Sv48 MMU mode supports 56-bit physical address
>>           * for 48-bit virtual address with 4KB last level page size.
>>           */
>>          switch (vm->mode) {
>> -       case VM_MODE_P52V48_4K:
>> -       case VM_MODE_P48V48_4K:
>> -       case VM_MODE_P40V48_4K:
>> +       case VM_MODE_P56V57_4K:
>> +               satp_mode = SATP_MODE_57;
>> +               break;
>> +       case VM_MODE_P50V48_4K:
>> +               satp_mode = SATP_MODE_48;
>> +               break;
>> +       case VM_MODE_P41V39_4K:
>> +               satp_mode = SATP_MODE_39;
>>                  break;
>>          default:
>>                  TEST_FAIL("Unknown guest mode, mode: 0x%x", vm->mode);
>>          }
>>
>> +       max_satp_mode = vcpu_get_reg(vcpu, RISCV_CONFIG_REG(satp_mode));
>> +
>> +       if ((satp_mode >> SATP_MODE_SHIFT) > max_satp_mode)
>> +               TEST_FAIL("Unable to set satp mode 0x%lx, max mode 0x%lx\n",
>> +                         satp_mode >> SATP_MODE_SHIFT, max_satp_mode);
>> +
>>          satp = (vm->pgd >> PGTBL_PAGE_SIZE_SHIFT) & SATP_PPN;
>> -       satp |= SATP_MODE_48;
>> +       satp |= satp_mode;
>>
>>          vcpu_set_reg(vcpu, RISCV_GENERAL_CSR_REG(satp), satp);
>>   }
>> --
>> 2.43.0
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
