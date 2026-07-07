Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DF9C43458
	for <kvm-riscv@archiver.kernel.org>; Tue,  7 Jul 2026 02:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Qb8RpigsuYudt8yhuQKTpDzWFudUSZYQRezk04J0oM=; b=PoRk6reGfmWNO6
	+gj+WI31DRKERIOSu40Q0ExV9zSFZGTvfxArQQfzxNPND6e3SB76fsoqzdCOIN6h3MhKFWhhknepC
	Lr4dlA1AASGVh6HKMRmCj18tzrE6p3z5VR+o37R0cCcWhB1pvXz4nlMqGxY2VWbBAIM2GjZWoRqEe
	qoPClk1Y+eJ0ArSYO6dLO3U1BLi6PfWPSkkIZ3lftOMz550L/xr/GIYrCIhKYmXx8CAw/d8DLyFjS
	uju4WroyYXn3bzWcbAQfZlfJvR+vOkBb/FI+trZaEhavliFSmFS5rCtFpoG2kIfUkcsdQqwYYwndm
	Im6XYYCvDyeBU7ZWK86w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvpm-0000000DxLW-2M7F;
	Tue, 07 Jul 2026 02:46:54 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgvpj-0000000DxKh-43oM
	for kvm-riscv@lists.infradead.org;
	Tue, 07 Jul 2026 02:46:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so14986705ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jul 2026 19:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783392410; x=1783997210; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=i9g2H85BeGPj9TDwT9OofetdT89vG9VS/IPjJq1t0xkM6JM7o9q57tBxtkNhISBYt/
         nB2X/PI6ljNkrB011b3xD8+tOlxm66+wGs2YoS2W6anjxo9PinrDPb4dmLiyJ3D5NnLs
         Yv8fWCIo6L/aB7Q9LwAuynm1NKD4tGnRgvyD0oUrQynb1nVzJSllsO0CgbfW6+Lt2Vds
         wcxDiz3JIyXEKVEKqLaSuU8yLHaXGOg40LsUfylK9gOHDVXogIEHlhfdbEeUUSpa/izS
         jRA2AOjCoCArzgFbx8FTsQytBdZA7w7dDJ41yK0ActZ6R1suPxcY2vmAkGlW/8y3PVFv
         OQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783392410; x=1783997210;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2/fxWwb3oyYd4m0R5LKJRcZCrGk+3eTcmW2x4VDQgPg=;
        b=Aud9IOB70AdG8ZNcDdPeFKqHlJumKQNC+Btgz3BB8xS3cA+W+KJOg00dmHBh+NLNNK
         iJI+q7p5fGUK1Xyrn7H6NWyLr3yI3TcUTHcVHqE6IEoUmc+uIXeyq1VOS3T5AIoL4F2j
         3EExflrSjjCdyeqRIzGdZxFnopqEOttShqxAKVIN//C+2JWyFUC2GtZ3qmZU0BRSZhS+
         cRekrZ0kIfNv4tJC5UbRRCrLqrBuwKZ5IerlFxXIBmMy5HEY5mXYl4aB1vBN+ekMyeL6
         xGZU2IYVsSDoPqP00dpUDKbD8ORI/GNTz7qKBqFAhwl/gyrD0hT/0EJcI/xoK9g1Rp1V
         3lnQ==
X-Forwarded-Encrypted: i=1; AHgh+RpZ1RgBjwRFibwV+HVjDyAvcvO4b8GZgmANA6KiuoCKK/H+VS7xqbpQzd5DUXXGJ/3+BLMTY42MjN0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhWT5lx3kZZGSLLC2oebTtB9vPIfQW6eoIk/VRr4z3uxWqn6iN
	FuIf7hhtykXEP7Sm9xL3LI9FeNIK3P96+Q6DHLN7T394WMzVOZJTRxCc
X-Gm-Gg: AfdE7ckMqknWWlmp4LDvA5ZFxk8cN/Aj7KC9v9hOFqwiHR5QVwaqUVVcp/iX9W+pYbW
	32A7/adO04l69AFRcnZk2RHJIC03eZqkFi7t1Qp5yiJD8/wkNcJ2/fdoaZzBYVmrPbMZHOB15FO
	9Lfnxt5whThJ/nENJcvHBiqyXk6q6/1GOK7coBpLdvhWw3QCwcKbrBknzQM8vFJ8keuwkMYiaIo
	Op6XzgK918x/jqGn/y04XlH0ydJuSNXV5/hImoHutF6RBzfPUSdsn7hwBhh4C+bIs+WIFm2mZJ/
	UB+r5s3b4TDrXwixLtcXHpjslwkwi6GyussoNhb8wTMBS2mmQTwOmifuHTzN4jPW2lX9nIJAdF7
	VXHVZUAsjReSGwMlINrvlkVwBKvyXAEwXYWzYhk2lg+LNncUnsA8A4HGhfknpWKQ9
X-Received: by 2002:a17:903:1a0e:b0:2c1:ee75:56bb with SMTP id d9443c01a7336-2ccbe618242mr29826855ad.20.1783392410361;
        Mon, 06 Jul 2026 19:46:50 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfd443sm3388815ad.30.2026.07.06.19.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 19:46:49 -0700 (PDT)
Date: Tue, 7 Jul 2026 10:46:14 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Atish Patra <atish.patra@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Sergey Matyukevich <geomatsi@gmail.com>, Thomas Huth <thuth@redhat.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Deepak Gupta <debug@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
	Longbin Li <looong.bin@gmail.com>, Quan Zhou <zhouquan@iscas.ac.cn>
Subject: Re: [PATCH v5 1/8] RISC-V: KVM: Add support for Svadu FWFT features
Message-ID: <akxm_sT7R9u4OIXo@inochi.infowork>
References: <20260706022046.214956-1-inochiama@gmail.com>
 <20260706022046.214956-2-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260706022046.214956-2-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_194652_007338_7BED0692 
X-CRM114-Status: GOOD (  28.43  )
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

On Mon, Jul 06, 2026 at 10:20:37AM +0800, Inochi Amaoto wrote:
> Hardware updating of PTE A/D bits is controlled through ADUE bit in
> henvcfg Expose the feature only if both Svadu and Svade are supported
> for VS-mode.
> 
> Allow the VMM to enable/disable this feature by change the ISA
> extension state in the guest.
> 
> Assisted-by: YuanSheng:claude-4.7-opus
> Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_sbi_fwft.c    | 77 +++++++++++++++++++++++++++++++
>  2 files changed, 78 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 504e73305343..7bbea8812d92 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -240,6 +240,7 @@ struct kvm_riscv_sbi_fwft_feature {
>  struct kvm_riscv_sbi_fwft {
>  	struct kvm_riscv_sbi_fwft_feature misaligned_deleg;
>  	struct kvm_riscv_sbi_fwft_feature pointer_masking;
> +	struct kvm_riscv_sbi_fwft_feature pte_ad_hw_updating;
>  };
>  
>  /* If you need to interpret the index values, here is the key: */
> diff --git a/arch/riscv/kvm/vcpu_sbi_fwft.c b/arch/riscv/kvm/vcpu_sbi_fwft.c
> index ab39ac464ffd..01db40b53295 100644
> --- a/arch/riscv/kvm/vcpu_sbi_fwft.c
> +++ b/arch/riscv/kvm/vcpu_sbi_fwft.c
> @@ -11,6 +11,7 @@
>  #include <linux/kvm_host.h>
>  #include <asm/cpufeature.h>
>  #include <asm/sbi.h>
> +#include <asm/kvm_nacl.h>
>  #include <asm/kvm_vcpu_sbi.h>
>  #include <asm/kvm_vcpu_sbi_fwft.h>
>  
> @@ -94,6 +95,45 @@ static bool kvm_fwft_is_defined_feature(enum sbi_fwft_feature_t feature)
>  	return false;
>  }
>  
> +static void kvm_sbi_fwft_env_flag_reset_helper(struct kvm_vcpu *vcpu,
> +					       u64 flag)
> +{
> +	vcpu->arch.cfg.henvcfg &= ~flag;
> +}
> +
> +static long kvm_sbi_fwft_env_flag_set_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long value, u64 flag)
> +{
> +	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
> +
> +	if (value == 0)
> +		cfg->henvcfg &= ~flag;
> +	else if (value == 1)
> +		cfg->henvcfg |= flag;
> +	else
> +		return SBI_ERR_INVALID_PARAM;
> +
> +	if (!one_reg_access) {
> +		ncsr_write(CSR_HENVCFG, vcpu->arch.cfg.henvcfg);
> +		if (IS_ENABLED(CONFIG_32BIT))
> +			ncsr_write(CSR_HENVCFGH, vcpu->arch.cfg.henvcfg >> 32);
> +	}
> +
> +	return SBI_SUCCESS;
> +}
> +

Hi, Anup,

The sashiko bot point out calling NACL helper is not safe here as
preemption is not allowed when calling this_cpu_ptr() and it is 
used by the NACL helper. Since I have no idea about how to fix it,
is it acceptable to use csr read/write directly here as other FWFT
feature?

Regards,
Inochi


The original reply from the bot is 

Is it safe to call ncsr_write() here without preemption disabled?

KVM handles SBI ecalls with preemption enabled. The ncsr_write() macro
evaluates nacl_shmem(), which relies on this_cpu_ptr(). Using this_cpu_ptr()
with preemption enabled will trigger a CONFIG_DEBUG_PREEMPT warning.

Could the thread be migrated to another CPU after computing the pointer but
before writing to it, resulting in per-CPU memory corruption by writing to
the NACL shared memory of another physical CPU?

Additionally, when NACL is disabled, it falls back to csr_write(), which
writes directly to the physical CPU's host CSRs (CSR_HENVCFG). Could this
leave the host with modified hardware state if the vCPU thread migrates?


> +static long kvm_sbi_fwft_env_flag_get_helper(struct kvm_vcpu *vcpu,
> +					     struct kvm_sbi_fwft_config *conf,
> +					     bool one_reg_access,
> +					     unsigned long *value, u64 flag)
> +{
> +	*value = (vcpu->arch.cfg.henvcfg & flag) == flag;
> +
> +	return SBI_SUCCESS;
> +}
> +
>  static bool kvm_sbi_fwft_misaligned_delegation_supported(struct kvm_vcpu *vcpu)
>  {
>  	return misaligned_traps_can_delegate();
> @@ -137,6 +177,34 @@ static long kvm_sbi_fwft_get_misaligned_delegation(struct kvm_vcpu *vcpu,
>  	return SBI_SUCCESS;
>  }
>  
> +static bool kvm_sbi_fwft_pte_ad_hw_updating_supported(struct kvm_vcpu *vcpu)
> +{
> +	return riscv_isa_extension_available(vcpu->arch.isa, SVADU) &&
> +		riscv_isa_extension_available(vcpu->arch.isa, SVADE);
> +}
> +
> +static void kvm_sbi_fwft_reset_pte_ad_hw_updating(struct kvm_vcpu *vcpu)
> +{
> +	if (kvm_sbi_fwft_pte_ad_hw_updating_supported(vcpu))
> +		kvm_sbi_fwft_env_flag_reset_helper(vcpu, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_set_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long value)
> +{
> +	return kvm_sbi_fwft_env_flag_set_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
> +static long kvm_sbi_fwft_get_pte_ad_hw_updating(struct kvm_vcpu *vcpu,
> +						struct kvm_sbi_fwft_config *conf,
> +						bool one_reg_access, unsigned long *value)
> +{
> +	return kvm_sbi_fwft_env_flag_get_helper(vcpu, conf, one_reg_access,
> +						value, ENVCFG_ADUE);
> +}
> +
>  #ifndef CONFIG_32BIT
>  
>  static bool try_to_set_pmm(unsigned long value)
> @@ -246,6 +314,15 @@ static const struct kvm_sbi_fwft_feature features[] = {
>  		.set = kvm_sbi_fwft_set_misaligned_delegation,
>  		.get = kvm_sbi_fwft_get_misaligned_delegation,
>  	},
> +	{
> +		.id = SBI_FWFT_PTE_AD_HW_UPDATING,
> +		.first_reg_num = offsetof(struct kvm_riscv_sbi_fwft, pte_ad_hw_updating.enable) /
> +				 sizeof(unsigned long),
> +		.supported = kvm_sbi_fwft_pte_ad_hw_updating_supported,
> +		.reset = kvm_sbi_fwft_reset_pte_ad_hw_updating,
> +		.set = kvm_sbi_fwft_set_pte_ad_hw_updating,
> +		.get = kvm_sbi_fwft_get_pte_ad_hw_updating,
> +	},
>  #ifndef CONFIG_32BIT
>  	{
>  		.id = SBI_FWFT_POINTER_MASKING_PMLEN,
> -- 
> 2.55.0
> 

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
