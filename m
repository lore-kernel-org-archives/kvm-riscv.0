Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B10A4D4662F
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XTNfvNmHadPuGBzX4mx8Vo6g4UYhLq8ROkY4eTg+RGM=; b=mFPO1zMaCeW3pu
	X5N/H46AyV1KmT5mzyS3k3ac7eCRLlPoCcPG5WYZatq3HrN5O20vJdw7OIbaLwOs77OgzaKOh/0k3
	Wg7uUhv0dCMKYnYJmqUmijZK+pm1E0WJF7sTyKKlpo/HYeQlzDVeAZIlPHm20fcuRHyN1g0/jeDIv
	i+KRS8epN9JDwbnlJmsR4oxq5tnzTTBZr8Np06LfJJjab7OqDNkGC9gfcyAlDF57uj1JGXoCGtK91
	z90yQfgPMP/37Ptsd3k1arXF+a0xqcdxEvo3nNtFBZRZemwbs5PBaMDZSxa6/t6WPaBP52wxShIUH
	YMoap5D7jnwQI+4pJw2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWtz-0000000DK2n-35iI;
	Thu, 15 Jan 2026 23:37:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgWtw-0000000DK21-0acW
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:37:18 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMaKOI3192152
	for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 23:37:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z2n8CWclOK+qAz33/QIvyokv
	GlStxnKTjh7o52+P4ZA=; b=HTl99NAwcrysLUNfE3tycmK4Btg3pFqr1HiWFBbD
	teWa20AywXozwyn/kXs0tFV8cSgG8yEYevRj2yfp43kVqXW1LhxwI7M2oU49JIpP
	ngvBiAhXCuezePq4mcRp1pz2eTDsajDyjEvkZFwu9VM+SHxLcfvTRKkuOiFYutXz
	MWWQEg7iLCihmWBYeZZu6RsMTu3bfl1TLOr1rItgMU233SO1LAjtohGZ+r4Qi4Kt
	gwJ/18zyK/7P5wDvowjN3Wk8btde0s1MsXW/jA3eORLuyBAELpwyaAOJ33Wsjyoj
	7z8nK21tVhtJBFeL/fgft03fkMJsmCv/RMjfE9Rc8shtQQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq968g4m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 23:37:15 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-123308e5e6aso2743940c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768520234; x=1769125034; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z2n8CWclOK+qAz33/QIvyokvGlStxnKTjh7o52+P4ZA=;
        b=NJoBsHUI+TsD993s9yl43OxyuDXBFv6tQikJNmUsPY92JqofKPy3t4YCBbiTrs4pYg
         qPQKZ5TFO/gT1WgBeSw9g/C8ActfqEnkp98qRutfH5m7aX5ogwLgJ5miHt6+9OwMu1jT
         jbgaV4lF6/mYLDxjQWwYi1OGHpBS863rdBqZlIRBzJDqKIHASAKEYruOgiLTYNPS1WZ2
         LAL6UrVtOYLkgx5zVinxfN4HucZP9uFMXNkcGzcnP4Xtq1HAxs2RfetamwRQUzDz4e7O
         kAif8VMAfzGGYyUpJZ9CCPufKOpmarAmdRQHGNlNpiAL+qf3PtjRBtIF8G/uZTPu8xBI
         b/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768520234; x=1769125034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z2n8CWclOK+qAz33/QIvyokvGlStxnKTjh7o52+P4ZA=;
        b=HOwPmxRhNf6j3/NKuxedDe2WzQVu66dv5u8rDolOeNPdxnN2r3NYiqcEZdgMzPI5Bc
         YjFm46jJBUofgDAWbvK3+I+Ng8gEF1HIqhCgW+J7aU8Rqo6AGZWq6n82uxaK0Y7W9gJa
         3YF9Kz2/m6n3zTjv7qj6vRlvlUWrQcqoWP+2ZA21xe8/syVbKr4HGhnGtsynoBvSDjK0
         5PqhNwjVjvlEXal7vGHMD2qWjlBGdHOqMZay3Zu+v/f0a90ykFGILXPAF9Gq99O7Eu6N
         mQG9Ki6+qtMzDg/WYpyKQrutaRKAQ7BP89MjiuEd74c9U+h1rZxbfj9GqqyjhZCuY1t2
         NExw==
X-Forwarded-Encrypted: i=1; AJvYcCV1L/RIEShB0lWJc8sV9uhPmk7rIGw1+plMOXObh+wP98sCg8IdRPqSd0dw+/at68cMibmCMGQGGGg=@lists.infradead.org
X-Gm-Message-State: AOJu0YzfuIehA2brfrWS3ZJboAYmRRC99Ay7sfTzlrfQkw5w85uny4ph
	8HOZvhZSWMdrzi+TdiSvTgFcM+Kia5vb5Amc8B9VYFxpEGhgR4j8P/KLwZPZo/ixhPEJ/oGgkKC
	U6Y63CSSQTLYw5VXQEkTf+CseRHe0qdIxHejBQvBpFZXM6TDs5uzS7D596TGzpDxvy5rk
X-Gm-Gg: AY/fxX5g2yiIDPios6ZL1FTosYMj4vD8YZXUhnaP81Hr+wp0a22YdANFFwblOy+C+2S
	L3l2SNc6oJeQN/oDQ2UWnt9u9PsbMj1aqWcWTd3uto11aRO59We0neD+rXmjRs+Fuahm4QyOQ46
	O8Y5Qf8RXU0i2LBaeyl6V7m6D2HA6B0VOOUuHq8khBQaTGqmLHN2JO0voaTwjTDVnIJB5zub6Zt
	o1Q2thf/oTsw25Urw5xCJZNubb0JjNv2vNmelyvjA4EO6+zuYWy2vRaCWPA4izZnFd2rRI8QujT
	3JHTCrX0S9lzyP2QlM1DtuIR8t5yd1so2ewPPavCUiS/XeuViBWHSIC1eNXRqiC+xoGUJfU0Hpe
	qJN2zOe+F52QsKNmj3bY=
X-Received: by 2002:a05:7022:618a:b0:119:e56b:98b1 with SMTP id a92af1059eb24-1244a736612mr1274982c88.24.1768520234279;
        Thu, 15 Jan 2026 15:37:14 -0800 (PST)
X-Received: by 2002:a05:7022:618a:b0:119:e56b:98b1 with SMTP id a92af1059eb24-1244a736612mr1274951c88.24.1768520233582;
        Thu, 15 Jan 2026 15:37:13 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac5842csm1024112c88.1.2026.01.15.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:37:13 -0800 (PST)
Date: Thu, 15 Jan 2026 17:37:11 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: Support runtime configuration for
 per-VM's HGATP mode
Message-ID: <7rxerhpw33mhucn2m563iersxfarcck67vcmm5o3u25tmcrahf@lsjqygd5jj4b>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-2-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105143232.76715-2-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=JNg2csKb c=1 sm=1 tr=0 ts=69697a2b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=oBzv5dPfi-9pHJfKKYwA:9
 a=CjuIK1q_8ugA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: uDRnad4bjWm5BJqWGZ-yNSGl2u4yW_lJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE4NyBTYWx0ZWRfX7BUnBUxFkgAU
 hAbB/pepAtZkfqHlpi1mEk2iLI8kzGZ8cIej7FXiHnunLLaokGaCww6ZHKwlY7sFbbK+I+QAkhW
 3arZ69Y3Q92OnU+/2qGtgaI5p3LpVoFtcQCtSXmazoVLwWwkl0XTWQH1jMHwGRobZFyQzf+DugS
 yCw2Ljkj7kFZ0h7RlxJsThnsVEfrFkyjQCLDOOlt7LMbj4vA/gMtYovmvA8UIK1vc3frFVLdMeD
 6r7KO41GsJsjtylHbbfgtXqaqH4BVTTXNANBgUrqAJbYsD4rDd3BlU9toXwN3VsTd69PJbH39Cg
 5aVR8uhEVV21mLiol7Z/BcnxjdrN0BlOokltFySV4lNaSRpL+EePLg+VNe3e2t8cfnH52mlo5bs
 anxet8RtCTa3hf0rQs8j1zdGUExyX1Z+RE46UqNqayKmHOiAZvSJNzSzN9AiFUyZSkMKdPyK7Cj
 FGC+GsaZn66LbkF6p4w==
X-Proofpoint-GUID: uDRnad4bjWm5BJqWGZ-yNSGl2u4yW_lJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 clxscore=1011 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150187
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_153716_216748_939F1086 
X-CRM114-Status: GOOD (  30.99  )
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

On Mon, Jan 05, 2026 at 10:32:31PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Introduces two per-VM architecture-specific fields to support runtime
> configuration of the G-stage page table format:
> 
> - kvm->arch.kvm_riscv_gstage_mode: specifies the HGATP mode used by the
>   current VM;
> - kvm->arch.kvm_riscv_gstage_pgd_levels: the corresponding number of page
>   table levels for the selected mode.
> 
> These fields replace the previous global variables
> kvm_riscv_gstage_mode and kvm_riscv_gstage_pgd_levels, enabling different
> virtual machines to independently select their G-stage page table format
> instead of being forced to share the maximum mode detected by the kernel
> at boot time.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/kvm_gstage.h | 12 ++---
>  arch/riscv/include/asm/kvm_host.h   |  4 ++
>  arch/riscv/kvm/gstage.c             | 82 +++++++++++++++++------------
>  arch/riscv/kvm/main.c               |  4 +-
>  arch/riscv/kvm/mmu.c                | 18 +++++--
>  arch/riscv/kvm/vm.c                 |  2 +-
>  arch/riscv/kvm/vmid.c               |  2 +-
>  7 files changed, 74 insertions(+), 50 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> index 595e2183173e..fdcada123b3f 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -29,16 +29,11 @@ struct kvm_gstage_mapping {
>  #define kvm_riscv_gstage_index_bits	10
>  #endif
>  
> -extern unsigned long kvm_riscv_gstage_mode;
> -extern unsigned long kvm_riscv_gstage_pgd_levels;
> +extern unsigned long kvm_riscv_gstage_max_mode;
> +extern unsigned long kvm_riscv_gstage_max_pgd_levels;
>  
>  #define kvm_riscv_gstage_pgd_xbits	2
>  #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
> -#define kvm_riscv_gstage_gpa_bits	(HGATP_PAGE_SHIFT + \
> -					 (kvm_riscv_gstage_pgd_levels * \
> -					  kvm_riscv_gstage_index_bits) + \
> -					 kvm_riscv_gstage_pgd_xbits)
> -#define kvm_riscv_gstage_gpa_size	((gpa_t)(1ULL << kvm_riscv_gstage_gpa_bits))
>  
>  bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
>  			       pte_t **ptepp, u32 *ptep_level);
> @@ -69,4 +64,7 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  
>  void kvm_riscv_gstage_mode_detect(void);
>  
> +gpa_t kvm_riscv_gstage_gpa_size(struct kvm_arch *k);
> +unsigned long kvm_riscv_gstage_gpa_bits(struct kvm_arch *k);
> +
>  #endif
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 24585304c02b..27ea8e8fd5b0 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -103,6 +103,10 @@ struct kvm_arch {
>  
>  	/* KVM_CAP_RISCV_MP_STATE_RESET */
>  	bool mp_state_reset;
> +
> +	unsigned long kvm_riscv_gstage_mode;

There's a 1:1 mapping for mode/levels, so we don't need to track both.
Since mode is rarely used, then I think something like this would still
provide enough convenience without requiring the storage allocation.

 static inline unsigned long kvm_riscv_gstage_mode(struct kvm_gstage *gstage)
 {
     unsigned long modes[] = {
         [2] = HGATP_MODE_SV32X4,
         [3] = HGATP_MODE_SV39X4,
         [4] = HGATP_MODE_SV48X4,
         [5] = HGATP_MODE_SV57X4,
     };

     return modes[gstage->kvm->arch.kvm_riscv_gstage_pgd_levels];
 }

> +	unsigned long kvm_riscv_gstage_pgd_levels;
> +	bool gstage_mode_initialized;
>  };
>  
>  struct kvm_cpu_trap {
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index b67d60d722c2..06452e4c2ab2 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -12,22 +12,23 @@
>  #include <asm/kvm_gstage.h>
>  
>  #ifdef CONFIG_64BIT
> -unsigned long kvm_riscv_gstage_mode __ro_after_init = HGATP_MODE_SV39X4;
> -unsigned long kvm_riscv_gstage_pgd_levels __ro_after_init = 3;
> +unsigned long kvm_riscv_gstage_max_mode __ro_after_init = HGATP_MODE_SV39X4;

With a kvm_riscv_gstage_mode() function we don't need
kvm_riscv_gstage_max_mode either.

> +unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
>  #else
> -unsigned long kvm_riscv_gstage_mode __ro_after_init = HGATP_MODE_SV32X4;
> -unsigned long kvm_riscv_gstage_pgd_levels __ro_after_init = 2;
> +unsigned long kvm_riscv_gstage_max_mode __ro_after_init = HGATP_MODE_SV32X4;
> +unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
>  #endif
>  
>  #define gstage_pte_leaf(__ptep)	\
>  	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
>  
> -static inline unsigned long gstage_pte_index(gpa_t addr, u32 level)
> +static inline unsigned long gstage_pte_index(struct kvm_gstage *gstage,
> +					     gpa_t addr, u32 level)
>  {
>  	unsigned long mask;
>  	unsigned long shift = HGATP_PAGE_SHIFT + (kvm_riscv_gstage_index_bits * level);
>  
> -	if (level == (kvm_riscv_gstage_pgd_levels - 1))
> +	if (level == (gstage->kvm->arch.kvm_riscv_gstage_pgd_levels - 1))

nit: we can drop the unnecessary () while touching this line.

>  		mask = (PTRS_PER_PTE * (1UL << kvm_riscv_gstage_pgd_xbits)) - 1;
>  	else
>  		mask = PTRS_PER_PTE - 1;
> @@ -40,12 +41,13 @@ static inline unsigned long gstage_pte_page_vaddr(pte_t pte)
>  	return (unsigned long)pfn_to_virt(__page_val_to_pfn(pte_val(pte)));
>  }
>  
> -static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
> +static int gstage_page_size_to_level(struct kvm_gstage *gstage, unsigned long page_size,
> +				     u32 *out_level)
>  {
>  	u32 i;
>  	unsigned long psz = 1UL << 12;
>  
> -	for (i = 0; i < kvm_riscv_gstage_pgd_levels; i++) {
> +	for (i = 0; i < gstage->kvm->arch.kvm_riscv_gstage_pgd_levels; i++) {
>  		if (page_size == (psz << (i * kvm_riscv_gstage_index_bits))) {
>  			*out_level = i;
>  			return 0;
> @@ -55,21 +57,23 @@ static int gstage_page_size_to_level(unsigned long page_size, u32 *out_level)
>  	return -EINVAL;
>  }
>  
> -static int gstage_level_to_page_order(u32 level, unsigned long *out_pgorder)
> +static int gstage_level_to_page_order(struct kvm_gstage *gstage, u32 level,
> +				      unsigned long *out_pgorder)
>  {
> -	if (kvm_riscv_gstage_pgd_levels < level)
> +	if (gstage->kvm->arch.kvm_riscv_gstage_pgd_levels < level)
>  		return -EINVAL;
>  
>  	*out_pgorder = 12 + (level * kvm_riscv_gstage_index_bits);
>  	return 0;
>  }
>  
> -static int gstage_level_to_page_size(u32 level, unsigned long *out_pgsize)
> +static int gstage_level_to_page_size(struct kvm_gstage *gstage, u32 level,
> +				     unsigned long *out_pgsize)
>  {
>  	int rc;
>  	unsigned long page_order = PAGE_SHIFT;
>  
> -	rc = gstage_level_to_page_order(level, &page_order);
> +	rc = gstage_level_to_page_order(gstage, level, &page_order);
>  	if (rc)
>  		return rc;
>  
> @@ -81,11 +85,11 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
>  			       pte_t **ptepp, u32 *ptep_level)
>  {
>  	pte_t *ptep;
> -	u32 current_level = kvm_riscv_gstage_pgd_levels - 1;
> +	u32 current_level = gstage->kvm->arch.kvm_riscv_gstage_pgd_levels - 1;
>  
>  	*ptep_level = current_level;
>  	ptep = (pte_t *)gstage->pgd;
> -	ptep = &ptep[gstage_pte_index(addr, current_level)];
> +	ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
>  	while (ptep && pte_val(ptep_get(ptep))) {
>  		if (gstage_pte_leaf(ptep)) {
>  			*ptep_level = current_level;
> @@ -97,7 +101,7 @@ bool kvm_riscv_gstage_get_leaf(struct kvm_gstage *gstage, gpa_t addr,
>  			current_level--;
>  			*ptep_level = current_level;
>  			ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
> -			ptep = &ptep[gstage_pte_index(addr, current_level)];
> +			ptep = &ptep[gstage_pte_index(gstage, addr, current_level)];
>  		} else {
>  			ptep = NULL;
>  		}
> @@ -110,7 +114,7 @@ static void gstage_tlb_flush(struct kvm_gstage *gstage, u32 level, gpa_t addr)
>  {
>  	unsigned long order = PAGE_SHIFT;
>  
> -	if (gstage_level_to_page_order(level, &order))
> +	if (gstage_level_to_page_order(gstage, level, &order))
>  		return;
>  	addr &= ~(BIT(order) - 1);
>  
> @@ -125,9 +129,9 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
>  			     struct kvm_mmu_memory_cache *pcache,
>  			     const struct kvm_gstage_mapping *map)
>  {
> -	u32 current_level = kvm_riscv_gstage_pgd_levels - 1;
> +	u32 current_level = gstage->kvm->arch.kvm_riscv_gstage_pgd_levels - 1;
>  	pte_t *next_ptep = (pte_t *)gstage->pgd;
> -	pte_t *ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
> +	pte_t *ptep = &next_ptep[gstage_pte_index(gstage, map->addr, current_level)];
>  
>  	if (current_level < map->level)
>  		return -EINVAL;
> @@ -151,7 +155,7 @@ int kvm_riscv_gstage_set_pte(struct kvm_gstage *gstage,
>  		}
>  
>  		current_level--;
> -		ptep = &next_ptep[gstage_pte_index(map->addr, current_level)];
> +		ptep = &next_ptep[gstage_pte_index(gstage, map->addr, current_level)];
>  	}
>  
>  	if (pte_val(*ptep) != pte_val(map->pte)) {
> @@ -175,7 +179,7 @@ int kvm_riscv_gstage_map_page(struct kvm_gstage *gstage,
>  	out_map->addr = gpa;
>  	out_map->level = 0;
>  
> -	ret = gstage_page_size_to_level(page_size, &out_map->level);
> +	ret = gstage_page_size_to_level(gstage, page_size, &out_map->level);
>  	if (ret)
>  		return ret;
>  
> @@ -217,7 +221,7 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
>  	u32 next_ptep_level;
>  	unsigned long next_page_size, page_size;
>  
> -	ret = gstage_level_to_page_size(ptep_level, &page_size);
> +	ret = gstage_level_to_page_size(gstage, ptep_level, &page_size);
>  	if (ret)
>  		return;
>  
> @@ -229,7 +233,7 @@ void kvm_riscv_gstage_op_pte(struct kvm_gstage *gstage, gpa_t addr,
>  	if (ptep_level && !gstage_pte_leaf(ptep)) {
>  		next_ptep = (pte_t *)gstage_pte_page_vaddr(ptep_get(ptep));
>  		next_ptep_level = ptep_level - 1;
> -		ret = gstage_level_to_page_size(next_ptep_level, &next_page_size);
> +		ret = gstage_level_to_page_size(gstage, next_ptep_level, &next_page_size);
>  		if (ret)
>  			return;
>  
> @@ -263,7 +267,7 @@ void kvm_riscv_gstage_unmap_range(struct kvm_gstage *gstage,
>  
>  	while (addr < end) {
>  		found_leaf = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &ptep_level);
> -		ret = gstage_level_to_page_size(ptep_level, &page_size);
> +		ret = gstage_level_to_page_size(gstage, ptep_level, &page_size);
>  		if (ret)
>  			break;
>  
> @@ -297,7 +301,7 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  
>  	while (addr < end) {
>  		found_leaf = kvm_riscv_gstage_get_leaf(gstage, addr, &ptep, &ptep_level);
> -		ret = gstage_level_to_page_size(ptep_level, &page_size);
> +		ret = gstage_level_to_page_size(gstage, ptep_level, &page_size);
>  		if (ret)
>  			break;
>  
> @@ -319,41 +323,51 @@ void __init kvm_riscv_gstage_mode_detect(void)
>  	/* Try Sv57x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> -		kvm_riscv_gstage_mode = HGATP_MODE_SV57X4;
> -		kvm_riscv_gstage_pgd_levels = 5;
> +		kvm_riscv_gstage_max_mode = HGATP_MODE_SV57X4;
> +		kvm_riscv_gstage_max_pgd_levels = 5;
>  		goto done;
>  	}
>  
>  	/* Try Sv48x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
> -		kvm_riscv_gstage_mode = HGATP_MODE_SV48X4;
> -		kvm_riscv_gstage_pgd_levels = 4;
> +		kvm_riscv_gstage_max_mode = HGATP_MODE_SV48X4;
> +		kvm_riscv_gstage_max_pgd_levels = 4;
>  		goto done;
>  	}
>  
>  	/* Try Sv39x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
> -		kvm_riscv_gstage_mode = HGATP_MODE_SV39X4;
> -		kvm_riscv_gstage_pgd_levels = 3;
> +		kvm_riscv_gstage_max_mode = HGATP_MODE_SV39X4;
> +		kvm_riscv_gstage_max_pgd_levels = 3;
>  		goto done;
>  	}
>  #else /* CONFIG_32BIT */
>  	/* Try Sv32x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
> -		kvm_riscv_gstage_mode = HGATP_MODE_SV32X4;
> -		kvm_riscv_gstage_pgd_levels = 2;
> +		kvm_riscv_gstage_max_mode = HGATP_MODE_SV32X4;
> +		kvm_riscv_gstage_max_pgd_levels = 2;
>  		goto done;
>  	}
>  #endif
>  
>  	/* KVM depends on !HGATP_MODE_OFF */
> -	kvm_riscv_gstage_mode = HGATP_MODE_OFF;
> -	kvm_riscv_gstage_pgd_levels = 0;
> +	kvm_riscv_gstage_max_mode = HGATP_MODE_OFF;
> +	kvm_riscv_gstage_max_pgd_levels = 0;
>  
>  done:
>  	csr_write(CSR_HGATP, 0);
>  	kvm_riscv_local_hfence_gvma_all();
>  }
> +
> +unsigned long kvm_riscv_gstage_gpa_bits(struct kvm_arch *k) {

Did you run checkpatch? I think it requires '{' to be on its own line.

nit: s/k/ka/ would be consistent with other archs, although I see k is
used in riscv's kvm_riscv_mmu_update_hgatp() but that can be fixed up
in this patch since there's a change in the same place too.


> +	return (HGATP_PAGE_SHIFT + (k->kvm_riscv_gstage_pgd_levels *
> +		    kvm_riscv_gstage_index_bits) +
> +		    kvm_riscv_gstage_pgd_xbits);
> +}
> +
> +gpa_t kvm_riscv_gstage_gpa_size(struct kvm_arch *k) {

same comments as above

> +	return ((gpa_t)(1ULL << kvm_riscv_gstage_gpa_bits(k)));

 return BIT_ULL(kvm_riscv_gstage_gpa_bits(ka))

(the cast is implicit from return type)

> +}
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 45536af521f0..56a246e0e791 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -105,7 +105,7 @@ static int __init riscv_kvm_init(void)
>  		return rc;
>  
>  	kvm_riscv_gstage_mode_detect();
> -	switch (kvm_riscv_gstage_mode) {
> +	switch (kvm_riscv_gstage_max_mode) {
>  	case HGATP_MODE_SV32X4:
>  		str = "Sv32x4";
>  		break;
> @@ -164,7 +164,7 @@ static int __init riscv_kvm_init(void)
>  			 (rc) ? slist : "no features");
>  	}
>  
> -	kvm_info("using %s G-stage page table format\n", str);
> +	kvm_info("Max G-stage page table format %s \n", str);
>  
>  	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>  
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 4ab06697bfc0..574783907162 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -67,7 +67,7 @@ int kvm_riscv_mmu_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>  		if (!writable)
>  			map.pte = pte_wrprotect(map.pte);
>  
> -		ret = kvm_mmu_topup_memory_cache(&pcache, kvm_riscv_gstage_pgd_levels);
> +		ret = kvm_mmu_topup_memory_cache(&pcache,kvm->arch.kvm_riscv_gstage_pgd_levels);
                                                         ^ missing space

>  		if (ret)
>  			goto out;
>  
> @@ -186,8 +186,9 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>  	 * space addressable by the KVM guest GPA space.
>  	 */
>  	if ((new->base_gfn + new->npages) >=
> -	    (kvm_riscv_gstage_gpa_size >> PAGE_SHIFT))
> +			(kvm_riscv_gstage_gpa_size(&kvm->arch) >> PAGE_SHIFT)) {
>  		return -EFAULT;
> +	}

nit: Remove the unnecessary () and the '{' and the condition will fit on
one 100 char line.

>  
>  	hva = new->userspace_addr;
>  	size = new->npages << PAGE_SHIFT;
> @@ -332,7 +333,7 @@ int kvm_riscv_mmu_map(struct kvm_vcpu *vcpu, struct kvm_memory_slot *memslot,
>  	memset(out_map, 0, sizeof(*out_map));
>  
>  	/* We need minimum second+third level pages */
> -	ret = kvm_mmu_topup_memory_cache(pcache, kvm_riscv_gstage_pgd_levels);
> +	ret = kvm_mmu_topup_memory_cache(pcache, kvm->arch.kvm_riscv_gstage_pgd_levels);
>  	if (ret) {
>  		kvm_err("Failed to topup G-stage cache\n");
>  		return ret;
> @@ -431,6 +432,11 @@ int kvm_riscv_mmu_alloc_pgd(struct kvm *kvm)
>  		return -ENOMEM;
>  	kvm->arch.pgd = page_to_virt(pgd_page);
>  	kvm->arch.pgd_phys = page_to_phys(pgd_page);
> +	if (!kvm->arch.gstage_mode_initialized) {
> +		/*user-space didn't set KVM_CAP_RISC_HGATP_MODE cap*/
                  ^ missing space                                  ^ missing space
> +		kvm->arch.kvm_riscv_gstage_mode = kvm_riscv_gstage_max_mode;
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = kvm_riscv_gstage_max_pgd_levels;

Missing 'kvm->arch.gstage_mode_initialized = true' statement.

> +	}
>  
>  	return 0;
>  }
> @@ -446,10 +452,12 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>  		gstage.flags = 0;
>  		gstage.vmid = READ_ONCE(kvm->arch.vmid.vmid);
>  		gstage.pgd = kvm->arch.pgd;
> -		kvm_riscv_gstage_unmap_range(&gstage, 0UL, kvm_riscv_gstage_gpa_size, false);
> +		kvm_riscv_gstage_unmap_range(&gstage, 0UL, kvm_riscv_gstage_gpa_size(&kvm->arch), false);
>  		pgd = READ_ONCE(kvm->arch.pgd);
>  		kvm->arch.pgd = NULL;
>  		kvm->arch.pgd_phys = 0;
> +		kvm->arch.kvm_riscv_gstage_mode = HGATP_MODE_OFF;
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 0;
>  	}
>  	spin_unlock(&kvm->mmu_lock);
>  
> @@ -459,8 +467,8 @@ void kvm_riscv_mmu_free_pgd(struct kvm *kvm)
>  
>  void kvm_riscv_mmu_update_hgatp(struct kvm_vcpu *vcpu)
>  {
> -	unsigned long hgatp = kvm_riscv_gstage_mode << HGATP_MODE_SHIFT;
>  	struct kvm_arch *k = &vcpu->kvm->arch;
> +	unsigned long hgatp = k->kvm_riscv_gstage_mode << HGATP_MODE_SHIFT;
>  
>  	hgatp |= (READ_ONCE(k->vmid.vmid) << HGATP_VMID_SHIFT) & HGATP_VMID;
>  	hgatp |= (k->pgd_phys >> PAGE_SHIFT) & HGATP_PPN;
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 66d91ae6e9b2..4b2156df40fc 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -200,7 +200,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = KVM_USER_MEM_SLOTS;
>  		break;
>  	case KVM_CAP_VM_GPA_BITS:
> -		r = kvm_riscv_gstage_gpa_bits;
> +		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
>  	default:
>  		r = 0;
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index cf34d448289d..db27430f111e 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -26,7 +26,7 @@ static DEFINE_SPINLOCK(vmid_lock);
>  void __init kvm_riscv_gstage_vmid_detect(void)
>  {
>  	/* Figure-out number of VMID bits in HW */
> -	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
> +	csr_write(CSR_HGATP, (kvm_riscv_gstage_max_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
>  	vmid_bits = csr_read(CSR_HGATP);
>  	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>  	vmid_bits = fls_long(vmid_bits);
> -- 
> 2.50.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
