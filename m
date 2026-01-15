Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BAE7D47CAA
	for <kvm-riscv@archiver.kernel.org>; Thu, 15 Jan 2026 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fdve/iPzkdLbkBZedaQJ4DZ3uZiNNrIu7zRl4DRZPWE=; b=CCH7VdG8ze7Wv0
	Uxykodfb8bWtdwzEMG9P+6HBS5aV0ddSZboHjF3iJsMh5KHLEiBC7ilAxnK97v074USiMiZ+OLRF9
	X/cEByVFJPJ6V39iFhpTJdf7VnMGSQEmg1eXbQsK2Mi+JOaCrc+ncimBEIJspbj0SDHfzDhIlQEYW
	zWBdkyMdUWERsjJiAzDM+UDEDC4UeQhpR+dByw3+Wbc6gDVARkeZcEzpkk6GsJI7U9EXsaMrBDeiW
	ub5hhlC7EJA8Y54dDWY8B7xklCvwjqMMG8HAQUAiZnExUVWVyn7N5dIqjNcFE6zlS1BN+1Ant34iM
	TxjbDo5LXPlIfs5L4Sew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXCg-0000000DLUH-0P9Z;
	Thu, 15 Jan 2026 23:56:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgXCe-0000000DLTo-2MuE
	for kvm-riscv@lists.infradead.org;
	Thu, 15 Jan 2026 23:56:37 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FMbbU51240968
	for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 23:56:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=irBiMr6CSbVRpYyOwfv82LqW
	psqYNDBdD+tqHLqBSZI=; b=gF08ylFAUxFHsYjFUuZnr3tqhwjYRsGlydrkv9zD
	T9KmNe4vJh1QQrR2XB3754hRbNcmNUgPRPKBjKt7fCkH2Ku+xLQcurfjxmfgbvVc
	uch+M13GWIyx8I+zqAkW3d4RB+Wr3iQ2lcIecrQFTJk8Rg/qv7ocCNt/4pcJKGCW
	oEx9KTImWDV3+otwOk3hGhbbT9aUlBO676aBU3vfqLCd3juPi4w5KToneoMMtvZQ
	1Ab7FOU9ujAcmPWLd9ENyXyg7bKINiWycPyzT6EQqxMZl/Vd8SE0tTTn67Hzi6o3
	4HNvX229swWpxSB9XVcR67SlnlUtNtZpX/xg7C1eh7CVNw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq96sr55b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 23:56:36 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1219f27037fso5318615c88.1
        for <kvm-riscv@lists.infradead.org>; Thu, 15 Jan 2026 15:56:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768521395; x=1769126195; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=irBiMr6CSbVRpYyOwfv82LqWpsqYNDBdD+tqHLqBSZI=;
        b=eqzIoItkoBYlWcY+C6M/t2tJVy2BtgzPmMA1uSNUmJfjXT48fgEaGVPuCok1OkpUij
         cSJt4iup3dlSaNn4ODBu2dxW6atJq8VQ6kanzHAIhxT8b7O0Zm2rXamoYIlJCqV76kmZ
         smVkyKIKkw62a6hGk8SByKfPrOLxWu9DYf1SURFyDTk/F/V21JYL1mOLlJ/vULbGmQqF
         HswlY6udWPuIlA/EHp9q24dqLcijIp7aSiUuUHp6td0kBs1/3cWHBG1Opvle5Hgo9ors
         FlYgDXfpNO/6PLk3ss83Jda6avN3Jry4ZFfvQd+vY688A/U6CK9kVhFQO9pHAPH+3bkG
         HVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768521395; x=1769126195;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=irBiMr6CSbVRpYyOwfv82LqWpsqYNDBdD+tqHLqBSZI=;
        b=SVnjKl9MY86eB8yW55GcVm3gIG4fONKMn6d83aBCLQecvu/V8RLDYLzJ28gIz+z9NC
         Fepg6Ld/hPWWi6QkkV95sXz/dv/8JFTFmJpxtfjAD8gVgDviPiZd+27AObNMTBnU+b7a
         iz/gp+hsikYjlsVypClnzlJsHEKog/nlwc7kj1FXptDqTWn+wvWjdaPNgkGd9exyhfSI
         Yfp9BSDQ4eQEwyB0HbIYN4cHXeijzu0Gvtqyw3f3aCtnf70sMgsGvlKApg4sJ98GO1fO
         KYyfpomwV4JFg1sMdxnARPYPPPHIoLMORVEH+iajhTWihlQCoLSVGUq8jW3jW83sGmt1
         jUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWndf5IWMbM2gWBqPEVTiJ1VDdmcc+hKWzkP02Id/dDdlDXf1FzwaoB/6BWytboDPwJic8tBl/X4gE=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOb9YpZ4yc3BjXACzi4kDdP+/JS3VL8eqkbkz/ryHG5mwO8Vl6
	tYSVmCCwR+/0ZwNiC16cCJKzOVJYWuTrhEISldXUuukE8I4VRB8ZnN4qxckraewdDmwYIYKQ905
	6uk12fo+2qb8WrgTXC3TIsnEtp/wN89jBRyFusW/DikzTvUzfSo/pMerW/wia+dFtA1CM
X-Gm-Gg: AY/fxX5TICKL4sflB6UcWFG+rvcRk7hwYDBtcjLWb6wRe7MFoyIn42LdWiTcYXiGudZ
	gwcYuw5rF1RcyiHDkBNkohobDVuCqTt61X31XPDdqIdodIjuCwDcGkuH+Vaxd8B1+DZ5BROMJ0a
	z3YR7+I5LyrCZnP/1+8ZYhwWjYc7uqBkcdYrpp6FcMPEXMSQogWjOmNRfFXNXakN+naMUSFUeKX
	552sa8UtQfFXVwuDPa21wOOVfw+2dTJKHkXbcsqk6QJvhd/h25Cm90UlDWAskABk9+L3hwGXsfe
	OV+dQc4c33H4X5Y+C4y3qAi6nXuW2aoGI4EHa5Nw8WjcSupWqOeUf4ZV2jhax1oWTTIDr5aO6pM
	KBN++PejtyOoY7FWTjDk=
X-Received: by 2002:a05:7022:6286:b0:11d:f44c:afbc with SMTP id a92af1059eb24-1244a74fb80mr1753396c88.37.1768521393919;
        Thu, 15 Jan 2026 15:56:33 -0800 (PST)
X-Received: by 2002:a05:7022:6286:b0:11d:f44c:afbc with SMTP id a92af1059eb24-1244a74fb80mr1753378c88.37.1768521393394;
        Thu, 15 Jan 2026 15:56:33 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10c3csm879911c88.15.2026.01.15.15.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 15:56:32 -0800 (PST)
Date: Thu, 15 Jan 2026 17:56:31 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <dfhacs3uppweqmw5t6gwli2iy3b7l5oj6saykogjb5qkadl4rc@bi7mvnezkd2m>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: dOZ75siTdBKLHItgfjbTW5DOo3zgFpXV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE5MCBTYWx0ZWRfX0XS4EUYfXWmq
 aEbE+yOqJaOklIMtAs5ImT91rE+YB58rFTXR+mCXwtQHDoFRqEtEH2CaDTI9K+xUMRvQ5E+CCKy
 fJ2RPXBId0dnsVk3eOJG4bWKady5zLUUb6MScFoeqbn/X51Rsfd1VENcLNSjZMc3dRI2e7NoxxC
 1ylg8JXIV0Pi+BZDO5xItEMKpiaF5I7KlVBR7hPzkoip2yZ3W1RDmGt0oMNXUt4vl2uKD6QVjws
 qSVhCdndxu7ZwOYvhOuFIZFGAC2Fs8hHWNQ1wiAX81z5W6NJZe98moFZoPMDleEzE0g0e5JzP4T
 0TuGkVILCRiaqCBTfjZlP70WdckqKHFC1WDAQeSkEbhJXplMzd4wK8y8FLQeJJcpAHLtmBRZLOs
 mPn1U2tau+01Lo0dZZx5tE//U7r0/t1N0aWbiGQGoHgfNh7LLCFSjzoWEdY0WlNM66T10E7D39O
 YIyiqIchEiW0uG4wHgA==
X-Proofpoint-GUID: dOZ75siTdBKLHItgfjbTW5DOo3zgFpXV
X-Authority-Analysis: v=2.4 cv=M9tA6iws c=1 sm=1 tr=0 ts=69697eb4 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=SurXiuQvfP0cLrRCYjkA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_155636_602204_03F878D7 
X-CRM114-Status: GOOD (  30.79  )
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

On Mon, Jan 05, 2026 at 10:32:32PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> This capability allows userspace to explicitly select the HGATP mode
> for the VM. The selected mode must be less than or equal to the max
> HGATP mode supported by the hardware. This capability must be enabled
> before creating any vCPUs, and can only be set once per VM.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 14 ++++++++++++++
>  arch/riscv/kvm/vm.c            | 26 ++++++++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 39 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..9e17788e3a9d 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,20 @@ helpful if user space wants to emulate instructions which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>  
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv
> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns: 0 on success, -EINVAL if arg[0] is outside the range of hgatp
> +          modes supported by the hardware.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be less than or equal to the maximum HGATP
> +mode supported by the hardware. This capability must be enabled before
> +creating any vCPUs, and can only be set once per VM.

I think I would prefer a KVM_CAP_RISCV_SET_MAX_GPA type of capability. The
reason is because, while one of the results of the max-gpa being set will
be to set hgatp, there may be other reasons to track the guest's maximum
physical address too and kvm userspace shouldn't need to think about each
individually.

> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..e9275023a73a 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,13 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		r = 1;
> +#else/* CONFIG_32BIT */
> +		r = 0;
> +#endif

 r = IS_ENABLED(CONFIG_64BIT) ? 1 : 0;

> +		break;
>  	default:
>  		r = 0;
>  		break;
> @@ -212,12 +219,27 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;

add blank line

>  	switch (cap->cap) {
>  	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>  		kvm->arch.mp_state_reset = true;
>  		return 0;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;

I think we want to return -EBUSY here and it should be documented where it
already states "...can only be set once per VM"

> +		kvm->arch.gstage_mode_initialized = true;

In the previous patch I thought we were missing this, but I see now it
means "user initialized". Let's rename it as such,

 gstage_mode_user_initialized

> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
> +		kvm_info("using SV%lluX4 G-stage page table format\n",
> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);
> +#endif
> +		return 0;
>  	default:
>  		return -EINVAL;
>  	}
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index dddb781b0507..00c02a880518 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -974,6 +974,7 @@ struct kvm_enable_cap {
>  #define KVM_CAP_GUEST_MEMFD_FLAGS 244
>  #define KVM_CAP_ARM_SEA_TO_USER 245
>  #define KVM_CAP_S390_USER_OPEREXEC 246
> +#define KVM_CAP_RISCV_SET_HGATP_MODE 247
>  
>  struct kvm_irq_routing_irqchip {
>  	__u32 irqchip;
> -- 
> 2.50.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
