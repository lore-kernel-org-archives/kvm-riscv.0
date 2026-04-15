Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07986FA0C37
	for <kvm-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 07:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MY0jpgxFtqX1XW8vJGyCJdNxlk4gs/dO6XXzaOaPr4A=; b=uVzSXzi+pJoVQ/
	ZX3eu+WC45QAyr5iXXgKGEUMZ5jPUXHW/+S3vFgkP4rjprAQpNHymujM52cph22uoDBA7C3PFxTy5
	3+Ln1gfGf66c3GuM3AzO4a9xw368McaIOyR4CP+IkR29aqkjYdGOSWooAdggYNDZneEXPwe8WwTeI
	kFPkX12Q2g2OJrAqtlBuVNsQUr7mUrp66SpeyJG0KCG0t9f8SzBdmxyxVeDpCxMqffcZd6ARnUPPt
	/16Zy5VO1vwiuUr6tsXEHt4TacLQp29HB7XVVkPjXcz5whGlKxSjfKaD212O5wRbpOzUn67WErXhK
	WhsBTRyLegzqr7rd9YFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuKI-00000000hFM-2yhq;
	Wed, 15 Apr 2026 07:06:18 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCuKF-00000000hDd-0rwp
	for kvm-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 07:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776236758;
	bh=6I3bBZmLh72H2avsIFwM++E65eh7BrZ80xu8h1RyaDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=Piu/S8D4sZkK6hfaniAuJuhRpc7VOJ3jYg1N87I1mO+u+z3swAkZ3oOna4JAO1aWn
	 pn90hKxF0l8b5IYWlDvN5/vbUo5rb+vgKZHEeTzQJVcOG3aXv5WfN842dPqTQ5DBJs
	 GzF8QKXh1QLOgKtXgePiB9A0/KSBvY5VTXF3jttg=
X-QQ-mid: esmtpgz12t1776236755t9a02ae7c
X-QQ-Originating-IP: 48JPQq2xqbbxOrNHcGYJAji1baJVzYwWPu0JffE55WE=
Received: from [127.0.0.1] ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 15 Apr 2026 15:05:53 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14424645630730695149
Message-ID: <96AFE36BFF9E072C+72a6bd92-35de-48ee-bf52-c0ae86cbe846@linux.spacemit.com>
Date: Wed, 15 Apr 2026 15:05:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/11] riscv: cpufeature: Add Sdtrig optional CSRs
 checks
To: Max Hsu <max.hsu@sifive.com>, Conor Dooley <conor@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org
References: <20240329-dev-maxh-lin-452-6-9-v1-0-1534f93b94a7@sifive.com>
 <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
From: Zane Leung <liangzhen@linux.spacemit.com>
In-Reply-To: <20240329-dev-maxh-lin-452-6-9-v1-5-1534f93b94a7@sifive.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: NV+fGFr24pKXcxjEYk3jJ0G/748Pgpd+q28+m88e1oSKuonkjdH0zBjK
	lIKplGbE2jSYk5bCy3eWGsWDiuMY4U/u07HSqfgJXph1X9hCAGkcloyWfHBBr4PugKzr+m4
	QPkLxSV7K7HSA0WzyR2Zl1N7+ihljEH4sADJr/W8ZIZilGFWQOOFHMntswSYg40tjj5sRPG
	vVixTNcWOFmmU8m2gqug6/dNuVIg9+iU8Id8pnkTCIzGykohypkI7dZr3mbJ7rV5mVMbtck
	GenUGtfhry+5YtmRpJcBiNxwl8GZsrlLdiy975oSWzUqjrVbc0MQ7oWBseAS9nULI9nWA9x
	1mo+mo8D2vfBC4hHYZX595DegAKD+97srrT98yBoAFfPyLu+f4d/LpXEKDvPcsR6SbOlilL
	cofrWn4D0MRH77+OfFof9ROBpuzM32iURQfKEm3rBT7cwi4in/opKP7G3DiT3FVGJKT2tky
	3UnN54iP+zDFhi2z8LAGHt/Ku6iOOA7KmAo5N7bOXj//wqrwZypS3CrCUu5J/pevEifHG9p
	T7Rzmb+daYKZvQVuKAIxJfmDxrMvRKbD2cMFlNIbIM2aYKfMDRdkzAyYsGL7wSAwLBIxe9S
	zOV0MzoQT1KB3n8dqKWq9EK5Erb43Sm0wqlJkeuNrSEoE+hzgJ3Eu9DjcpFLjmFzhinB1Eu
	N+pCBX6VCDGSGyBoinQAhRHJnjD/bcshGei0NKYVnkizxFU3xS+DJFxLwnSlSDY2QLBhB3e
	80W5Pi9aH9IWvjAdYqIMy1XnCCU+x0KMSdoanFo9m5fUv1ekiwBo0cYWF4EYJpHbuKBNS1X
	/tc5N1kRaVUe294s2ED0/R1QGoUMxu9M2mllUfFI1U8wu5iYNzSjukgtQ/5jyVoA1ApNdeR
	ZW8Cu8JsDIRWExu8PAtpd3vwdfvi7ZiGGumE8mHjrjmxJwWZP4P8ql51RzMa6QCXvP/T79j
	IwMstM0lL3rpR9xASBLEUlUg14q+4VpfvMUdkhwLb8PvceO8hDErQ3whHVaqwiIDvGz+w4P
	WmuJWw2n382tQCt0fKxI2MmoGyqi8BqBG4XXayGrjedZa8pGwYE27kmzpemasQf/bWGGzcO
	A==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_000616_158644_2F80301C 
X-CRM114-Status: GOOD (  30.52  )
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


On 3/29/2024 5:26 PM, Max Hsu wrote:
> Sdtrig extension introduce two optional CSRs [hcontext/scontext],
> that will be storing PID/Guest OS ID for the debug feature.
>
> The availability of these two CSRs will be determined by
> DTS and Smstateen extension [h/s]stateen0 CSR bit 57.
>
> If all CPUs hcontext/scontext checks are satisfied, it will enable the
> use_hcontext/use_scontext static branch.
>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  arch/riscv/include/asm/switch_to.h |   6 ++
>  arch/riscv/kernel/cpufeature.c     | 161 +++++++++++++++++++++++++++++++++++++
>  2 files changed, 167 insertions(+)
>
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
> index 7efdb0584d47..07432550ed54 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -69,6 +69,12 @@ static __always_inline bool has_fpu(void) { return false; }
>  #define __switch_to_fpu(__prev, __next) do { } while (0)
>  #endif
>  
> +DECLARE_STATIC_KEY_FALSE(use_scontext);
> +static __always_inline bool has_scontext(void)
> +{
> +	return static_branch_likely(&use_scontext);
> +}
> +
>  extern struct task_struct *__switch_to(struct task_struct *,
>  				       struct task_struct *);
>  
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 080c06b76f53..44ff84b920af 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -35,6 +35,19 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  /* Per-cpu ISA extensions. */
>  struct riscv_isainfo hart_isa[NR_CPUS];
>  
> +atomic_t hcontext_disable;
> +atomic_t scontext_disable;
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_hcontext);
> +EXPORT_SYMBOL(use_hcontext);
> +
> +DEFINE_STATIC_KEY_FALSE_RO(use_scontext);
> +EXPORT_SYMBOL(use_scontext);
> +
> +/* Record the maximum number that the hcontext CSR allowed to hold */
> +atomic_long_t hcontext_id_share;
> +EXPORT_SYMBOL(hcontext_id_share);
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -719,6 +732,154 @@ unsigned long riscv_get_elf_hwcap(void)
>  	return hwcap;
>  }
>  
> +static void __init sdtrig_percpu_csrs_check(void *data)
> +{
> +	struct device_node *node;
> +	struct device_node *debug_node;
> +	struct device_node *trigger_module;
> +
> +	unsigned int cpu = smp_processor_id();
> +
> +	/*
> +	 * Expect every cpu node has the [h/s]context-present property
> +	 * otherwise, jump to sdtrig_csrs_disable_all to disable all access to
> +	 * [h/s]context CSRs
> +	 */
> +	node = of_cpu_device_node_get(cpu);
> +	if (!node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	debug_node = of_get_compatible_child(node, "riscv,debug-v1.0.0");
> +	of_node_put(node);
> +
> +	if (!debug_node)
> +		goto sdtrig_csrs_disable_all;
> +
> +	trigger_module = of_get_child_by_name(debug_node, "trigger-module");
> +	of_node_put(debug_node);
> +
> +	if (!trigger_module)
> +		goto sdtrig_csrs_disable_all;
> +
> +	if (!(IS_ENABLED(CONFIG_KVM) &&
> +	      of_property_read_bool(trigger_module, "hcontext-present")))
> +		atomic_inc(&hcontext_disable);
> +
> +	if (!of_property_read_bool(trigger_module, "scontext-present"))
> +		atomic_inc(&scontext_disable);
> +
> +	of_node_put(trigger_module);
> +
> +	/*
> +	 * Before access to hcontext/scontext CSRs, if the smstateen
> +	 * extension is present, the accessibility will be controlled
> +	 * by the hstateen0[H]/sstateen0 CSRs.
> +	 */
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SMSTATEEN)) {
> +		u64 hstateen_bit, sstateen_bit;
> +
> +		if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_h)) {
> +#if __riscv_xlen > 32
> +			csr_set(CSR_HSTATEEN0, SMSTATEEN0_HSCONTEXT);
> +			hstateen_bit = csr_read(CSR_HSTATEEN0);
> +#else
> +			csr_set(CSR_HSTATEEN0H, SMSTATEEN0_HSCONTEXT >> 32);
> +			hstateen_bit = csr_read(CSR_HSTATEEN0H) << 32;
> +#endif
> +			if (!(hstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				goto sdtrig_csrs_disable_all;
> +
> +		} else {
> +			if (IS_ENABLED(CONFIG_KVM))
> +				atomic_inc(&hcontext_disable);
> +
> +			/*
> +			 * In RV32, the smstateen extension doesn't provide
> +			 * high 32 bits of sstateen0 CSR which represent
> +			 * accessibility for scontext CSR;
> +			 * The decision is left on whether the dts has the
> +			 * property to access the scontext CSR.
> +			 */
> +#if __riscv_xlen > 32
> +			csr_set(CSR_SSTATEEN0, SMSTATEEN0_HSCONTEXT);
> +			sstateen_bit = csr_read(CSR_SSTATEEN0);
> +
> +			if (!(sstateen_bit & SMSTATEEN0_HSCONTEXT))
> +				atomic_inc(&scontext_disable);
> +#endif
For the supervisor-level sstateen registers, high-half CSRs are not added at this time because
it is expected the upper 32 bits of these registers will always be zeros. see:
https://github.com/riscv/riscv-isa-manual/blob/dca12d638b140d86441ad0b067997c70d2017017/src/priv/smstateen.adoc#L71-L7


> +		}
> +	}
> +
> +	/*
> +	 * The code can only access hcontext/scontext CSRs if:
> +	 * The cpu dts node have [h/s]context-present;
> +	 * If Smstateen extension is presented, then the accessibility bit
> +	 * toward hcontext/scontext CSRs is enabled; Or the Smstateen extension
> +	 * isn't available, thus the access won't be blocked by it.
> +	 *
> +	 * With writing 1 to the every bit of these CSRs, we retrieve the
> +	 * maximum bits that is available on the CSRs. and decide
> +	 * whether it's suit for its context recording operation.
> +	 */
> +	if (IS_ENABLED(CONFIG_KVM) &&
> +	    !atomic_read(&hcontext_disable)) {
> +		unsigned long hcontext_available_bits = 0;
> +
> +		csr_write(CSR_HCONTEXT, -1UL);
> +		hcontext_available_bits = csr_swap(CSR_HCONTEXT, hcontext_available_bits);
> +
> +		/* hcontext CSR is required by at least 1 bit */
> +		if (hcontext_available_bits)
> +			atomic_long_and(hcontext_available_bits, &hcontext_id_share);
> +		else
> +			atomic_inc(&hcontext_disable);
> +	}
> +
> +	if (!atomic_read(&scontext_disable)) {
> +		unsigned long scontext_available_bits = 0;
> +
> +		csr_write(CSR_SCONTEXT, -1UL);
> +		scontext_available_bits = csr_swap(CSR_SCONTEXT, scontext_available_bits);
> +
> +		/* scontext CSR is required by at least the sizeof pid_t */
> +		if (scontext_available_bits < ((1UL << (sizeof(pid_t) << 3)) - 1))
> +			atomic_inc(&scontext_disable);
> +	}
> +
> +	return;
> +
> +sdtrig_csrs_disable_all:
> +	if (IS_ENABLED(CONFIG_KVM))
> +		atomic_inc(&hcontext_disable);
> +
> +	atomic_inc(&scontext_disable);
> +}
> +
> +static int __init sdtrig_enable_csrs_fill(void)
> +{
> +	if (__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SDTRIG)) {
> +		atomic_long_set(&hcontext_id_share, -1UL);
> +
> +		/* check every CPUs sdtrig extension optional CSRs */
> +		sdtrig_percpu_csrs_check(NULL);
> +		smp_call_function(sdtrig_percpu_csrs_check, NULL, 1);
> +
> +		if (IS_ENABLED(CONFIG_KVM) &&
> +		    !atomic_read(&hcontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'GuestOS ID' to hcontext CSR is enabled\n");
> +			static_branch_enable(&use_hcontext);
> +		}
> +
> +		if (!atomic_read(&scontext_disable)) {
> +			pr_info("riscv-sdtrig: Writing 'PID' to scontext CSR is enabled\n");
> +			static_branch_enable(&use_scontext);
> +		}
> +	}
> +	return 0;
> +}
> +
> +arch_initcall(sdtrig_enable_csrs_fill);
> +
>  void riscv_user_isa_enable(void)
>  {
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
