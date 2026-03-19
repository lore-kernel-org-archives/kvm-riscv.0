Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54171091902
	for <kvm-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V8ZYLdAonbeb89yJJ1q1Q6H8w1gDi4kQeXw8Acu6p/s=; b=Llfi3erU2+OvMc
	dZWthy2cwiq4dEiJESCazi9t9d2s2oqAXIFcJjxAvekrMAQItuUA0HfREjCl1QigxyvvbPMyVOWul
	IhhGXq5K9dodsZ9Bfe5ZomQ3f0KD2O+3s17xHslcN5NtPn4E1izBUhpVs4o4a8PMVmKx6YDHjJ9eD
	YZ005qfo/MHuUilZi+p4EY3APCIfzSDmykSZTSNpjSVIh/8NGkd+3jMw4cgdGwpUrWOYlcYUg0o1e
	AFXCeCkhsTiu6kGGqwILza3MinnMi2+8d2LvSdPkuujLXtw+7nTtZOaGWV5oKg071jKXCk4OkNDp4
	mhteGqyTF1KqXEZtGJdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HLp-0000000BE03-20fc;
	Thu, 19 Mar 2026 17:40:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HLn-0000000BDyZ-3q6l
	for kvm-riscv@bombadil.infradead.org;
	Thu, 19 Mar 2026 17:40:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LSxHFEYoFillK/vghC83MQ1uH+vyR2Dj9tQeSVBrBRY=; b=K+XhU61ToxBgHOez06jVRELIeo
	gJN2XDfnWSKHpwG7EkMBLGvOnYh6fs9fzMcPhJypQDfjQSYKtGfO1vtncbzeyP4mJ6hX+sAlkuKu5
	hc26YcB398QhQjBtXonPq2tCIVY9hboNdxzd1lmI44vUrKW5wHwARAh1cuWA+DMUs+97FZGlcN5Dm
	6tVXAxAOHOAiYOEeMbj/U2HHhzGwm9s5yxz7tFl0Vh7XhjTBnM93o54d6hseUJjpyJcacSnHYXESh
	nuaAYZeqt0vlR7/PkGKkD1H1eh4EIkGdLYd4a+iv17IOm2f+xpnw3+qwLsmJJM79+VH8QgVr2cSY2
	6tzm3e/w==;
Received: from out-181.mta1.migadu.com ([95.215.58.181])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HLk-0000000E8Rz-3ovv
	for kvm-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 17:40:02 +0000
Message-ID: <27ce6795-1bb2-437f-a3a9-0589c1d65cdc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773941980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LSxHFEYoFillK/vghC83MQ1uH+vyR2Dj9tQeSVBrBRY=;
	b=UtGoAnIruJX7JI3e/I4TMz1seX8QDTYsVbZbOgAtJdFVhC6SNwApe9D1m1+SojpEFueKfP
	nJLzlLM1oukuALmSy0e05d5TKeRsXXpTxcsATT4MDfwe+vV1g9/GN/1OHAxdns0Q1ZxOSI
	1mKvJLPZbyk3oiCxhyExH9/UQdfiGOw=
Date: Thu, 19 Mar 2026 10:39:29 -0700
MIME-Version: 1.0
Subject: Re: [PATCH] RISC-V: KVM: Fix integer overflow in
 kvm_pmu_validate_counter_mask()
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
 Jiakai Xu <jiakaiPeanut@gmail.com>
References: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <20260319035902.924661-1-xujiakai2025@iscas.ac.cn>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_174001_047160_714F9F9B 
X-CRM114-Status: GOOD (  22.64  )
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


On 3/18/26 8:59 PM, Jiakai Xu wrote:
> When a guest initiates an SBI_EXT_PMU_COUNTER_CFG_MATCH call with
> ctr_base=0xfffffffffffffffe, ctr_mask=0xeb5f and flags=0x1
> (SBI_PMU_CFG_FLAG_SKIP_MATCH), kvm_riscv_vcpu_pmu_ctr_cfg_match()
> first invokes kvm_pmu_validate_counter_mask() to verify whether
> ctr_base and ctr_mask are valid, by evaluating:
>   !ctr_mask || (ctr_base + __fls(ctr_mask) >= kvm_pmu_num_counters(kvpmu))
>
> With the above inputs, __fls(0xeb5f) equals 15, and adding 15 to
> 0xfffffffffffffffe causes an integer overflow, wrapping around to 13.
> Since 13 is less than kvm_pmu_num_counters(), the validation wrongly
> succeeds.
>
> Thereafter, since flags & SBI_PMU_CFG_FLAG_SKIP_MATCH is satisfied,
> the code evaluates:
>   !test_bit(ctr_base + __ffs(ctr_mask), kvpmu->pmc_in_use)
>
> Here __ffs(0xeb5f) equals 0, so test_bit() receives 0xfffffffffffffffe
> as the bit index and attempts to access the corresponding element of
> the kvpmu->pmc_in_use, which results in an invalid memory access. This
> triggers the following Oops:
>   Unable to handle kernel paging request at virtual address e3ebffff12abba89
>    generic_test_bit include/asm-generic/bitops/generic-non-atomic.h:128
>    kvm_riscv_vcpu_pmu_ctr_cfg_match arch/riscv/kvm/vcpu_pmu.c:758
>    kvm_sbi_ext_pmu_handler arch/riscv/kvm/vcpu_sbi_pmu.c:49
>    kvm_riscv_vcpu_sbi_ecall arch/riscv/kvm/vcpu_sbi.c:608
>    kvm_riscv_vcpu_exit arch/riscv/kvm/vcpu_exit.c:240
>
> The root cause is that kvm_pmu_validate_counter_mask() does not account
> for the case where ctr_base itself is out of range, allowing the
> subsequent addition to silently overflow and bypass the check.
>
> Fix this by explicitly validating ctr_base against kvm_pmu_num_counters()
> before performing the addition.
>
> This bug was found by fuzzing the KVM RISC-V PMU interface.

Thanks for fuzzing. Do you have a detailed report that you can share ?

> Fixes: 0cb74b65d2e5e6 ("RISC-V: KVM: Implement perf support without sampling")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> ---
>   arch/riscv/kvm/vcpu_pmu.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b2..a098a9b417ad8 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -266,8 +266,10 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>   static int kvm_pmu_validate_counter_mask(struct kvm_pmu *kvpmu, unsigned long ctr_base,
>   					 unsigned long ctr_mask)
>   {
> -	/* Make sure the we have a valid counter mask requested from the caller */
> -	if (!ctr_mask || (ctr_base + __fls(ctr_mask) >= kvm_pmu_num_counters(kvpmu)))
> +	unsigned long num_ctrs = kvm_pmu_num_counters(kvpmu);
> +
> +	/* Make sure we have a valid counter mask requested from the caller */
> +	if (!ctr_mask || ctr_base >= num_ctrs || (ctr_base + __fls(ctr_mask) >= num_ctrs))
>   		return -EINVAL;
>   
>   	return 0;

Thanks for the fix.

Reviewed-by: Atish Patra <atish.patra@linux.dev>



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
