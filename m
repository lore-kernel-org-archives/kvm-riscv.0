Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE8ECD4F52
	for <kvm-riscv@archiver.kernel.org>; Mon, 18 May 2026 12:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/odDoP3yDB7em4edoOOGduza9KdBmlMfz6k4PsLXFrQ=; b=VNxDdxow9B2e2q
	BPgVw/TXo5DnJLT7sJ2LD5Bvr6NMO688A9W1MwDwnGgc7VtcNP4lwHVu9P/Erq1pRV74WVK6xvHN3
	0fBMs3HXajCuTmvaeNJ6Xb0iKfusqg59nBNtQ6M5Ru2OLQxghmSJySEYBkgrxMxiRqTF539h1t2kL
	gSEQJkgCLgMc5ZHrFbMThC9UK9NTKDgfDropoDeROFMK3BL/W+Z6DpWl5lIJTST7xf99Q9CM9QjXF
	JeGd0t64Ha5rFQ9L95Af77QvZ6uhpBVconZu4R03sC8L+ZOgWdihAtKBLBnXrR+H8971KoM+MLuDf
	cu0m9jI0UFnnZbbTTlDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxV2-0000000FiNQ-3xcy;
	Mon, 18 May 2026 12:55:12 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOxUw-0000000FiDY-3a4E;
	Mon, 18 May 2026 12:55:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Message-ID:Date:MIME-Version:Subject:To:From:
	Content-Type; bh=CrDEAo7psewF/Zo6NTuk77pv1DJdNaLBNAD0ghaWzHc=;
	b=lC427nXPvIjwiNmYFg/EZ/bY2f01kkqizgwT6ZxEcbkcVrzaAjXF5M7SV+IYPV
	sXbPF76d/xj+TKNqP2aVu90z3McknrtM8SAd+IYUYWZY0ea6E6q1c6IlTl63PiPj
	r+E/5byfzxXrboWTXGYok4Hd1XL2GITtdX1Je6vcqI/Mc=
Received: from [IPV6:240e:38c:8516:b200:791b:8dc7:75fb:a430] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDnp4GVCwtqUaZZDw--.170S2;
	Mon, 18 May 2026 20:52:40 +0800 (CST)
Message-ID: <22e32ff9-3d79-4130-a3cb-3a4ec2efd498@163.com>
Date: Mon, 18 May 2026 20:52:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] KVM: selftests: Add unit to dirty_log_test
To: Sean Christopherson <seanjc@google.com>
Cc: wu.fei9@sanechips.com.cn, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, anup@brainfault.org,
 atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, pbonzini@redhat.com, shuah@kernel.org
References: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
 <202605111130.64BBUXDN013040@mse-fl2.zte.com.cn>
 <agO_0ejKd0x38_-E@google.com> <f64029bf-1f4c-40a7-860a-eb04fbe5317b@163.com>
 <agck1WqW-TyEqkqd@google.com>
Content-Language: en-US
From: Wu Fei <atwufei@163.com>
In-Reply-To: <agck1WqW-TyEqkqd@google.com>
X-CM-TRANSID: PigvCgDnp4GVCwtqUaZZDw--.170S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4kKFyrCrWfWw18Cw4rZrb_yoW7AFWDpF
	WSga47KFs7A345Cwn2yayDXryFkr43JFWDA34rt3s0k3s0gF1fXr1xKFy09F95Cr1rZr1S
	vrZ0q347Zr1DuaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UYD7-UUUUU=
X-Originating-IP: [240e:38c:8516:b200:791b:8dc7:75fb:a430]
X-CM-SenderInfo: pdwz3wlhl6il2tof0z/xtbCzRlG52oLC5nAxgAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_055507_477803_B55DE6E4 
X-CRM114-Status: GOOD (  31.07  )
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

On 5/15/26 21:51, Sean Christopherson wrote:
> On Wed, May 13, 2026, Wu Fei wrote:
>> On 5/13/26 08:03, Sean Christopherson wrote:
>>> On Mon, May 11, 2026, wu.fei9@sanechips.com.cn wrote:
>>>> Currently dirty_log_test hardcodes usleep 1ms in each interval, which
>>>> could be too short for guest to write and fault in enough pages, then
>>>> there is less chance to test the write protection mechanism, especially
>>>> in the case of (log_mode != LOG_MODE_DIRTY_RING).
>>>
>>> But when log_mode != LOG_MODE_DIRTY_RING, the individual sleep time is largely
>>> meaningless, because the test won't reap the bitmaps for iterations > 0.
>>>
>>> 			if (i && host_log_mode != LOG_MODE_DIRTY_RING)
>>> 				continue;
>>>
>> The first usleep  matters in the case of KVM_DIRTY_LOG_INITIALLY_SET. The
>> dirty bitmap is not precise in the first get_dirty_log, all pages are marked
>> as dirty but most of them are not populated in page table, this creates the
>> situation I mentioned in the cover letter.
> 
> I suspect something is messed up in your workflow, because the actual patches
> aren't properly threaded with respect to the cover letter.  E.g. patch 1 has
> 
>    In-Reply-To: <202605111849442561v1a0B_7W1L2Z-ENusLaP@zte.com.cn>
> 
> but the cover letter has:
> 
>    Message-Id: <202605111108.64BB8RFR010522@mse-db.zte.com.cn>
> 
> Copy+pasting the entirety of the cover letter for reference:
> 
>   : The current gstage range walker unconditionally advances by 'page_size'
>   : when a leaf PTE is not found, e.g. when the range to wp is
>   : [0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
>   : returns false and page_size is 2MB, it skips the whole range, but it's
>   : possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
>   : only [0xfffff01fc000, 0xfffff0200000) can be skipped safely. Both
>   : wp/unamp have the same pattern.
>   :
>   : dirty_log_test intentionally sets up the unaligned guest physical
>   : address, after riscv kvm enabling KVM_DIRTY_LOG_INITIALLY_SET, it's easy
>   : to trigger this bug if there is a larger window for guest to write more
>   : pages before first collect_dirty_pages.
> 
>> "when the range to wp is
>> [0xfffff01fc000, 0xfffff023c000) , if found_leaf of 0xfffff01fc000
>> returns false and page_size is 2MB, it skips the whole range, but it's
>> possible to have valid entries in [0xfffff0200000, 0xfffff023c000), so
>> only [0xfffff01fc000, 0xfffff0200000) can be skipped safely."
>>
>>>>
>>>> Unit is introduced to replace the default 1ms if specified in command
>>>> line. The following test can't trigger failure on my riscv vm:
>>>
>>> Failure of what?  And does the failure really not reproduce with a higher interval?
>>
>> On riscv, it fails to write protect some pages with valid page table entry
>> then loses track of dirty pages. Higher interval doesn't help because only
>> the first usleep matters, after the first collect_dirty_pages, all dirty
>> pages are tracked precisely then there is no such problem.
> 
> Ah, gotcha.  Rather than let (and force) the user to provide a larger sleep time,
> what if we instead randomize the delay before the initial reaping of the dirty
> bitmap/ring?  That should provide a good balance between coverage, complexity and
> user-friendliness.

I'm fine with your solution, I applied it and it did trigger the same issue.

Thanks,
Fei.

> 
> diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
> index 12446a4b6e8d..74ca096bf976 100644
> --- a/tools/testing/selftests/kvm/dirty_log_test.c
> +++ b/tools/testing/selftests/kvm/dirty_log_test.c
> @@ -694,7 +694,17 @@ static void run_test(enum vm_guest_mode mode, void *arg)
>          pthread_create(&vcpu_thread, NULL, vcpu_worker, vcpu);
>   
>          for (iteration = 1; iteration <= p->iterations; iteration++) {
> -               unsigned long i;
> +               unsigned long i, reap_i;
> +
> +               /*
> +                * Select a random point in the time interval to reap the dirty
> +                * bitmap/ring while the guest is running, i.e. randomize how
> +                * long the guest gets to initially run and thus how many pages
> +                * it can dirty, before collecting the dirty bitmap/ring.  See
> +                * the loop below for details.
> +                */
> +               reap_i = random() % p->interval;
> +               printf("Reaping after a %lu ms delay\n", reap_i);
>   
>                  sync_global_to_guest(vm, iteration);
>   
> @@ -729,13 +739,17 @@ static void run_test(enum vm_guest_mode mode, void *arg)
>                           * that's effectively blocked.  Collecting while the
>                           * guest is running also verifies KVM doesn't lose any
>                           * state.
> -                        *
> +                        */
> +                       if (i < reap_i)
> +                               continue;
> +
> +                       /*
>                           * For bitmap modes, KVM overwrites the entire bitmap,
>                           * i.e. collecting the bitmaps is destructive.  Collect
> -                        * the bitmap only on the first pass, otherwise this
> -                        * test would lose track of dirty pages.
> +                        * the bitmap while the guest is running only once,
> +                        * otherwise this test would lose track of dirty pages.
>                           */
> -                       if (i && host_log_mode != LOG_MODE_DIRTY_RING)
> +                       if (i > reap_i && host_log_mode != LOG_MODE_DIRTY_RING)
>                                  continue;
>   
>                          /*
> @@ -745,7 +759,7 @@ static void run_test(enum vm_guest_mode mode, void *arg)
>                           * the ring on every pass would make it unlikely the
>                           * vCPU would ever fill the fing).
>                           */
> -                       if (i && !READ_ONCE(dirty_ring_vcpu_ring_full))
> +                       if (i > reap_i && !READ_ONCE(dirty_ring_vcpu_ring_full))
>                                  continue;
>   
>                          log_mode_collect_dirty_pages(vcpu, TEST_MEM_SLOT_INDEX,


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
