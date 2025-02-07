Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F80C02194
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M/kB8GFThT4CBX8RujXM5FIGJvTZjljNAguifXiral4=; b=A+SRz6ZuGRgikf
	tuEjDO0gO63eNMxWJ52Pr6DRDIHRtoLLLqMICY6tE1wj/VYXhNzRwTvxwz9isEzhkBBBoBW0hJAAd
	mj7TKqEjOtjMjILCFf3ZUyCEVIU0tfovuwYHEbg80jGi+9ZzcIZ6B5CLDnIe75YUpdWfbbOCem+FX
	xu5jf2cqOfl8ilVrau0AmiaOHFaKcI8InG/8nVsImbI5I9Hu7HVu7KLc7PBQHUZZjVDGgUwMDPJFE
	E7OkjF0pgRfsP2qpnAkWUd5ZOCA5nA3s+xgRZdQYnLYQmmWGuBpKofYFUhDPlkIVMtJLpkFGMW6pp
	6JNWsSo9UkoxYBRP4InA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLbp-00000009CXX-2ln7;
	Fri, 07 Feb 2025 10:29:17 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgLbm-00000009CVu-0w7x
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 10:29:15 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-436a03197b2so12590105e9.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Feb 2025 02:29:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738924152; x=1739528952; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kZecQt9IpEJ7wbD4TyHVoTgZZnQwqJP3yUkd6SaQ1fo=;
        b=UtKzgx1N1crJZ11lK67wtikJsjccEwo9jscSOpXkurLDgYW6LD4t12tgdcbFioY/2Z
         0Lo3qzcm2IkYPS+VWsVpWHL0qOgV999J+6Aa4764IB1k7NI+9P45BdqIPpL+dMGx/HkX
         qJXUfC/up2b7MFuckza6l9LkNPtW+hCZokWVv63/VhwybsXJz9set97uIoGuFAeuGPBQ
         beW6M14vn9UA3AvnUHeCRM/cQ+6iZf89uNrTWE4faL7NHmujNOIEdAxW0UbiK01zNa5d
         0lVA4Mbhch2/LvOpiufW1S99bLTLq9DXrqYumYwUzgye4tcISicW3RdVmADtjhcKD5w6
         bmbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738924152; x=1739528952;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kZecQt9IpEJ7wbD4TyHVoTgZZnQwqJP3yUkd6SaQ1fo=;
        b=FmZlnfc3At+SNas7nPEnw4IFEsmpyRLhQeZvCO9gVl5FaF1jzigAV3bJEEEK9om7oU
         VX2IZuvdYGXDA3wAFi6BRVWGpbvmvup+0J4QPy5UTcOvRMpSdsvcBNSrxZBGCZJ+78xR
         l2M0mw+GS2iMnoktfRYrZ99QGHGeOYrkkqmzHkTjTBpeSQDFdHq8+1jQLh4q+hXGg46c
         3HwM2E5wsJVGt5dcx/wXBjagJa6dCAEL+DAl8dzOfYoAjkv7yKi3ql3No9mysGfiw6+T
         K4dv/x++Ef6qRLF4pVAkjDBsqQ/TXa/QK31I8rhbz7got13rsYoeHh0ORymzbxuEe7Tv
         IIpA==
X-Forwarded-Encrypted: i=1; AJvYcCV/MDtb3Y2OiLpSEmPTVv066ozBjUS39+Ji56juXu2sYe1vaw4zW8isqJqI3kEpS4EwZ6nQbFbzev8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyzciAmDd2mMOCSzZQrXOAlWqGLTCkkFshD5Qy6G5HNr4JGfVsq
	YPl4Sz+t+SLAtSfgTWZ5hhRA33WuqphqjF/8OFg/z9RdxOENQ1FhwdAatpiw6jE=
X-Gm-Gg: ASbGncuj3qDR5zvIEgz9jCDieFX15MNlkbrGIO7/Qq+jJrVFkyAqonxay+iKH7pOBNT
	K6jjUGf5dZY/K8Ak4jybG9OOd9UTP0OdvPb+s8V/NKAeWsAURdO2LVhgmmGba+WGJMFZDx63oFX
	/tMuV65b5hr2Lh74uZUhRdOyXKk215ZF79GStVYjn5Bwk/ZaiPn0Bxe0FFZEcCQspzTPA8to6cS
	FIwfrPbx6WXomJc5s5TShiHAmzsEVqZoqSooWaXnxBwfObgThX32QT4Ee2ZsOof7bC4nIJYRVgu
	U+tpxh0hBuDDTyJeVpMHv/mIeiYsMHUlozwkcMmTJfPyJyy8CICJm/TnyJ3u
X-Google-Smtp-Source: AGHT+IHCoYm88N9w7MLKhv47jx2sJHV5XaJtNjy2Kt9tKO8gApEJnGbxZzlJthncRDoGbW5dA9LdfQ==
X-Received: by 2002:a05:600c:c19:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-4392497f9cbmr21820835e9.2.1738924150908;
        Fri, 07 Feb 2025 02:29:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933794sm87719805e9.7.2025.02.07.02.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Feb 2025 02:29:10 -0800 (PST)
Message-ID: <586dc43d-74cd-413b-86e2-545384ad796f@rivosinc.com>
Date: Fri, 7 Feb 2025 11:29:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/21] RISC-V: perf: Modify the counter discovery
 mechanism
To: Atish Patra <atishp@rivosinc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
 <20250205-counter_delegation-v4-12-835cfa88e3b1@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-12-835cfa88e3b1@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_022914_525459_34B134C1 
X-CRM114-Status: GOOD (  39.74  )
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



On 06/02/2025 08:23, Atish Patra wrote:
> If both counter delegation and SBI PMU is present, the counter
> delegation will be used for hardware pmu counters while the SBI PMU
> will be used for firmware counters. Thus, the driver has to probe
> the counters info via SBI PMU to distinguish the firmware counters.
> 
> The hybrid scheme also requires improvements of the informational
> logging messages to indicate the user about underlying interface
> used for each use case.
> 
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> ---
>  drivers/perf/riscv_pmu_dev.c | 118 ++++++++++++++++++++++++++++++++-----------
>  1 file changed, 88 insertions(+), 30 deletions(-)
> 
> diff --git a/drivers/perf/riscv_pmu_dev.c b/drivers/perf/riscv_pmu_dev.c
> index 6b43d844eaea..5ddf4924c5b3 100644
> --- a/drivers/perf/riscv_pmu_dev.c
> +++ b/drivers/perf/riscv_pmu_dev.c
> @@ -66,6 +66,10 @@ static bool sbi_v2_available;
>  static DEFINE_STATIC_KEY_FALSE(sbi_pmu_snapshot_available);
>  #define sbi_pmu_snapshot_available() \
>  	static_branch_unlikely(&sbi_pmu_snapshot_available)
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_sbi_available);
> +static DEFINE_STATIC_KEY_FALSE(riscv_pmu_cdeleg_available);
> +static bool cdeleg_available;
> +static bool sbi_available;
>  
>  static struct attribute *riscv_arch_formats_attr[] = {
>  	&format_attr_event.attr,
> @@ -88,7 +92,8 @@ static int sysctl_perf_user_access __read_mostly = SYSCTL_USER_ACCESS;
>  
>  /*
>   * This structure is SBI specific but counter delegation also require counter
> - * width, csr mapping. Reuse it for now.
> + * width, csr mapping. Reuse it for now we can have firmware counters for
> + * platfroms with counter delegation support.
>   * RISC-V doesn't have heterogeneous harts yet. This need to be part of
>   * per_cpu in case of harts with different pmu counters
>   */
> @@ -100,6 +105,8 @@ static unsigned int riscv_pmu_irq;
>  
>  /* Cache the available counters in a bitmask */
>  static unsigned long cmask;
> +/* Cache the available firmware counters in another bitmask */
> +static unsigned long firmware_cmask;
>  
>  struct sbi_pmu_event_data {
>  	union {
> @@ -778,35 +785,49 @@ static int rvpmu_sbi_find_num_ctrs(void)
>  		return sbi_err_map_linux_errno(ret.error);
>  }
>  
> -static int rvpmu_sbi_get_ctrinfo(int nctr, unsigned long *mask)
> +static int rvpmu_deleg_find_ctrs(void)
> +{
> +	/* TODO */
> +	return -1;
> +}
> +
> +static int rvpmu_sbi_get_ctrinfo(int nsbi_ctr, int ndeleg_ctr)

Hi Atish,

These parameters could be unsigned I think.

>  {
>  	struct sbiret ret;
> -	int i, num_hw_ctr = 0, num_fw_ctr = 0;
> +	int i, num_hw_ctr = 0, num_fw_ctr = 0, num_ctr = 0;
>  	union sbi_pmu_ctr_info cinfo;
>  
> -	pmu_ctr_list = kcalloc(nctr, sizeof(*pmu_ctr_list), GFP_KERNEL);
> -	if (!pmu_ctr_list)
> -		return -ENOMEM;
> -
> -	for (i = 0; i < nctr; i++) {
> +	for (i = 0; i < nsbi_ctr; i++) {
>  		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
>  		if (ret.error)
>  			/* The logical counter ids are not expected to be contiguous */
>  			continue;
>  
> -		*mask |= BIT(i);
> -
>  		cinfo.value = ret.value;
>  		if (cinfo.type == SBI_PMU_CTR_TYPE_FW)
>  			num_fw_ctr++;
> -		else
> +
> +		if (!cdeleg_available) {

What is the rationale for using additional boolean identical to the
static keys ? Reducing the amount of code patch site in cold path ? If
so, I guess you can use static_key_enabled(&riscv_pmu_cdeleg_available).
But your solution is fine as well, it just duplicates two identical values.

>  			num_hw_ctr++;
> -		pmu_ctr_list[i].value = cinfo.value;
> +			cmask |= BIT(i);
> +			pmu_ctr_list[i].value = cinfo.value;
> +		} else if (cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +			/* Track firmware counters in a different mask */
> +			firmware_cmask |= BIT(i);
> +			pmu_ctr_list[i].value = cinfo.value;
> +		}
> +
>  	}
>  
> -	pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
> +	if (cdeleg_available) {
> +		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, ndeleg_ctr);
> +		num_ctr = num_fw_ctr + ndeleg_ctr;
> +	} else {
> +		pr_info("%d firmware and %d hardware counters\n", num_fw_ctr, num_hw_ctr);
> +		num_ctr = nsbi_ctr;
> +	}
>  
> -	return 0;
> +	return num_ctr;
>  }
>  
>  static inline void rvpmu_sbi_stop_all(struct riscv_pmu *pmu)
> @@ -1067,16 +1088,33 @@ static void rvpmu_ctr_stop(struct perf_event *event, unsigned long flag)
>  	/* TODO: Counter delegation implementation */
>  }
>  
> -static int rvpmu_find_num_ctrs(void)
> +static int rvpmu_find_ctrs(void)
>  {
> -	return rvpmu_sbi_find_num_ctrs();
> -	/* TODO: Counter delegation implementation */
> -}
> +	int num_sbi_counters = 0, num_deleg_counters = 0, num_counters = 0;
>  
> -static int rvpmu_get_ctrinfo(int nctr, unsigned long *mask)
> -{
> -	return rvpmu_sbi_get_ctrinfo(nctr, mask);
> -	/* TODO: Counter delegation implementation */
> +	/*
> +	 * We don't know how many firmware counters available. Just allocate
> +	 * for maximum counters driver can support. The default is 64 anyways.
> +	 */
> +	pmu_ctr_list = kcalloc(RISCV_MAX_COUNTERS, sizeof(*pmu_ctr_list),
> +			       GFP_KERNEL);
> +	if (!pmu_ctr_list)
> +		return -ENOMEM;
> +
> +	if (cdeleg_available)
> +		num_deleg_counters = rvpmu_deleg_find_ctrs();
> +
> +	/* This is required for firmware counters even if the above is true */
> +	if (sbi_available)
> +		num_sbi_counters = rvpmu_sbi_find_num_ctrs();
> +
> +	if (num_sbi_counters >= RISCV_MAX_COUNTERS || num_deleg_counters >= RISCV_MAX_COUNTERS)
> +		return -ENOSPC;

Why is this using '>=' ? You allocated space for RISCV_MAX_COUNTERS, so
RISCV_MAX_COUNTERS should fit right ?

> +
> +	/* cache all the information about counters now */
> +	num_counters = rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_deleg_counters);
> +
> +	return num_counters;

return rvpmu_sbi_get_ctrinfo(num_sbi_counters, num_deleg_counters);

>  }
>  
>  static int rvpmu_event_map(struct perf_event *event, u64 *econfig)
> @@ -1377,12 +1415,21 @@ static int rvpmu_device_probe(struct platform_device *pdev)
>  	int ret = -ENODEV;
>  	int num_counters;
>  
> -	pr_info("SBI PMU extension is available\n");
> +	if (cdeleg_available) {
> +		pr_info("hpmcounters will use the counter delegation ISA extension\n");
> +		if (sbi_available)
> +			pr_info("Firmware counters will be use SBI PMU extension\n");

s/will be use/will use

> +		else
> +			pr_info("Firmware counters will be not available as SBI PMU extension is not present\n");

s/will be not/will not

> +	} else if (sbi_available) {
> +		pr_info("Both hpmcounters and firmware counters will use SBI PMU extension\n");
> +	}
> +
>  	pmu = riscv_pmu_alloc();
>  	if (!pmu)
>  		return -ENOMEM;
>  
> -	num_counters = rvpmu_find_num_ctrs();
> +	num_counters = rvpmu_find_ctrs();
>  	if (num_counters < 0) {
>  		pr_err("SBI PMU extension doesn't provide any counters\n");
>  		goto out_free;
> @@ -1394,9 +1441,6 @@ static int rvpmu_device_probe(struct platform_device *pdev)
>  		pr_info("SBI returned more than maximum number of counters. Limiting the number of counters to %d\n", num_counters);
>  	}
>  
> -	/* cache all the information about counters now */
> -	if (rvpmu_get_ctrinfo(num_counters, &cmask))
> -		goto out_free;
>  
>  	ret = rvpmu_setup_irqs(pmu, pdev);
>  	if (ret < 0) {
> @@ -1486,13 +1530,27 @@ static int __init rvpmu_devinit(void)
>  	int ret;
>  	struct platform_device *pdev;
>  
> -	if (sbi_spec_version < sbi_mk_version(0, 3) ||
> -	    !sbi_probe_extension(SBI_EXT_PMU)) {
> -		return 0;
> +	if (sbi_spec_version >= sbi_mk_version(0, 3) &&
> +	    sbi_probe_extension(SBI_EXT_PMU)) {
> +		static_branch_enable(&riscv_pmu_sbi_available);
> +		sbi_available = true;
>  	}
>  
>  	if (sbi_spec_version >= sbi_mk_version(2, 0))
>  		sbi_v2_available = true;
> +	/*
> +	 * We need all three extensions to be present to access the counters
> +	 * in S-mode via Supervisor Counter delegation.
> +	 */
> +	if (riscv_isa_extension_available(NULL, SSCCFG) &&
> +	    riscv_isa_extension_available(NULL, SMCDELEG) &&
> +	    riscv_isa_extension_available(NULL, SSCSRIND)) {
> +		static_branch_enable(&riscv_pmu_cdeleg_available);
> +		cdeleg_available = true;
> +	}
> +
> +	if (!(sbi_available || cdeleg_available))
> +		return 0;
>  
>  	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
>  				      "perf/riscv/pmu:starting",
> 


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
