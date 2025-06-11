Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CB0AC677C4
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 00:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5XcfNHk653lLg89g+cyou6xyRi36uf/qSmNd2q8U58=; b=f42xAsT7i9G6Jq
	cVh4a/F3Y1Iuy37DdpjeIpuD7/53RovEkm8vBA1WXqh9eLoRYsPWA2rHawfFWLkKnW7JYbK68IWJh
	aXhmvQQB/1QuWGiZGsMjA7ED7iBPzjGunwHrdqXPsdLmeMfQ0lVRq6Q6QYAkx/exfa6ODKww5kiTQ
	ZZ/crRR6gEivSCvJvXDT7+uRr4mqmTsNMx80H1P6cc/JpbEAqdKAbHDYvGy63rAvJ5SiQU5g0moCt
	jioumswzqCohuzqgk5C3fLalcxh8CLU2QXaJ7bwFOeFkOb6dbrM9xNxf085kXrDM2zcU9NOVBj4fZ
	a7vyQvtoGc1qX4ntcp9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9Wm-00000008Ura-0nB2;
	Wed, 11 Jun 2025 00:41:16 +0000
Received: from mgamail.intel.com ([192.198.163.18])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP9Wj-00000008UrD-0VGZ
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 00:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749602473; x=1781138473;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=wv69m7y3xJ8R+WjJkkxUqUFXthhnGnUkVzQhoJmrwhQ=;
  b=cT9mm3DLCN13exhsccTeoBx+5nwf1RBoO7NExh93qaQGucyN3QC+QCe5
   gkNA//py02XjGbweU9sHCzwVPGQxwb9902XlU2TNjajf58kkh8fQi6i+1
   WaaTtlDhq9Pd5xFzmGlvRw6OkMYcRFPE2xtg3qNzvpCS9JH3gaggiSBg/
   NVxsM33wKIIhzLKa2BMh8IIkT9CCgNkjWzN2q7sM5FrzqtEcA4oN/NLRW
   B45ZjgMZ9cT5OzcrzJUqC13hhPdWKVEfMErwMmOwd89kr+7WNS4N4U/eB
   3S/XPqbEXw1dPZpxPb4ZGOFclWwHsLh3j5BPSF9Nyt8y8ANUVO0PQkTiY
   g==;
X-CSE-ConnectionGUID: L8Hf9bz/Qm6ZKiBVdaRpFg==
X-CSE-MsgGUID: qieReUJnSQmO/R2oyECh0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="50957701"
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="50957701"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:41:09 -0700
X-CSE-ConnectionGUID: +3sEoNirRQWj7lm2LYpISg==
X-CSE-MsgGUID: IkS75glYQImOsEKmFYhVBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,226,1744095600"; 
   d="scan'208";a="184176087"
Received: from dapengmi-mobl1.ccr.corp.intel.com (HELO [10.124.245.144]) ([10.124.245.144])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2025 17:41:06 -0700
Message-ID: <e6d1f2de-125e-4741-8f50-eebd42c3474c@linux.intel.com>
Date: Wed, 11 Jun 2025 08:41:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 07/16] x86/pmu: Rename
 pmu_gp_counter_is_available() to pmu_arch_event_is_available()
To: Sean Christopherson <seanjc@google.com>
Cc: Andrew Jones <andrew.jones@linux.dev>,
 Janosch Frank <frankja@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, =?UTF-8?Q?Nico_B=C3=B6hr?=
 <nrb@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 kvm@vger.kernel.org
References: <20250529221929.3807680-1-seanjc@google.com>
 <20250529221929.3807680-8-seanjc@google.com>
 <ffb5e853-dedc-45bb-acd8-c58ff2fc0b71@linux.intel.com>
 <aEhaQITromUV7lIO@google.com>
Content-Language: en-US
From: "Mi, Dapeng" <dapeng1.mi@linux.intel.com>
In-Reply-To: <aEhaQITromUV7lIO@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_174113_183425_661CF79D 
X-CRM114-Status: GOOD (  14.51  )
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


On 6/11/2025 12:16 AM, Sean Christopherson wrote:
> On Tue, Jun 10, 2025, Dapeng Mi wrote:
>> On 5/30/2025 6:19 AM, Sean Christopherson wrote:
>>> @@ -51,7 +51,7 @@ void pmu_init(void)
>>>  		}
>>>  		pmu.gp_counter_width = PMC_DEFAULT_WIDTH;
>>>  		pmu.gp_counter_mask_length = pmu.nr_gp_counters;
>>> -		pmu.gp_counter_available = (1u << pmu.nr_gp_counters) - 1;
>>> +		pmu.arch_event_available = (1u << pmu.nr_gp_counters) - 1;
>> "available architectural events" and "available GP counters" are two
>> different things. I know this would be changed in later patch 09/16, but
>> it's really confusing. Could we merge the later patch 09/16 into this patch?
> Ya.  I was trying to not mix too many things in one patch, but looking at this
> again, I 100% agree that squashing 7-9 into one patch is better overall.
>
>>> @@ -463,7 +463,7 @@ static void check_counters_many(void)
>>>  	int i, n;
>>>  
>>>  	for (i = 0, n = 0; n < pmu.nr_gp_counters; i++) {
>>> -		if (!pmu_gp_counter_is_available(i))
>>> +		if (!pmu_arch_event_is_available(i))
>>>  			continue;
>> The intent of check_counters_many() is to verify all available GP and fixed
>> counters can count correctly at the same time. So we should select another
>> available event to verify the counter instead of skipping the counter if an
>> event is not available.
> Agreed, but I'm going to defer that for now, this series already wanders in too
> many directions.  Definitely feel free to post a patch.

Sure. Thanks.



-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
