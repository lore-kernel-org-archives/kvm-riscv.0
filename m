Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72641E7DF0F
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 18:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iYacXRHODm58eTIwFEzGdBHqw34nVHURGJ8BRdrGNxM=; b=pngKsyiiZJknte
	a3f7wnQIUtqvYg7gLApWK6zSCE1h3zF6U8fY+FXTd61DFC0NG8bqEe7PaMXyPOKrzFGQIN0I55jgK
	ROA7nn9ZV2DQRS5zdzUkvBwMUVx/zql39R6qq6h4O5RYqv+k89njd3YQQKYyHRmUHA+uofIJTBG7V
	U4vV/TcSV6a/XfJ9lp8T9r8Iv+UykLWfaW7CJFh3bCo+ySkwMM2ksR2oScEcJB+8HwXSDrMHih6uz
	K0YP9onCPJR5HaxKxeCWntlEIY4KntLmQjMeoaaQpQP5H6NQ6egm//PQQXs2gGpVQ2mlaD3GuxhvB
	ml8DfpUMhWo4cD3jz3dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyze-00000005TCv-0CIO;
	Mon, 02 Feb 2026 18:49:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyza-00000005TC7-0qZC
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 18:49:47 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612B5Kv53459105
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Feb 2026 18:49:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=McETLnO4ta1TDAPHSx5gBrjB
	YMKIltkUc/cMr5/3QjA=; b=pEOj7a3sf+dmUCl/aWskVTC4TWNe/fNIOQypPRIo
	e28VblZNK1hcy9oPpaREDKlCBo0PDx5kjgDeA1JNgSiZcTvUtSg8NjB1iVg5PNAN
	BH48HLIsizSGBTcH+5I3zm3DoMOICpFQd1HisiSjjCjPEU81G7jD+zzlty+XFhhj
	frUxmqlXUAz7L6oW9pcbVQih9DQck7mNrgrns0yu3/q6L9o9wLGOCHv+qUu6Q5nt
	Ntma4/lTxvzlklcvsFEHKhYLk4XyOIW8EDfu2zr/Q+5YI2jDiP8KROCAA48rngKh
	FkRGWXHSYlpSKdInO4O+pnsS6jFUMhFuC9nR551/ZA/tFA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbhdb3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 18:49:44 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124a2d3d1b7so5903312c88.0
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 10:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770058184; x=1770662984; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=McETLnO4ta1TDAPHSx5gBrjBYMKIltkUc/cMr5/3QjA=;
        b=Gjf+JlbzYi3PFHCPFMDfQVpWsFgKOvuWkaBQUmUgZcWmKjKoQdvDG65Y3eXzH4fPKT
         CApUfjE192vQgROPu5JEVb3yLdTpkUmmTEZijQW3NJGNjVxF/inIVSVECAcFJ6BGorPp
         3AMazeG4XfJPmVRqOfdyGAeETqLDkuGUzl33zbBxDYm/A0/qpUv7Yto0GLXKFZjqx87X
         iOMDy/ptKfGduHY6xo/ZLxAx/lhg28FVe6qZ1NleohqBWwsNJ4i8Iw1f+3E+nnYX3Idl
         xUs2a13x8PyBI7uaFmUD8IeWvsNsdcRxYfJjQULkixGdLZKytmInuPQ9i9Ew9yJkISa4
         2MvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770058184; x=1770662984;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=McETLnO4ta1TDAPHSx5gBrjBYMKIltkUc/cMr5/3QjA=;
        b=nqdyLHQbMIkJBZJk9tCUSntK5CVyUsj8Of3D2GD/BCtGPFQ+qI0XYFYTXo33D/ZQwW
         EDjHOUHzGdsX3j1eVL2iT6SvEKZZRHhbrgvQFSSTQgfSzWSTZqZWwI3VSdM6T5H718BY
         MEJFRcs8Py8mhFKpcCKpPsgy2zgvGwBHcI41SNCwufeeTk6/jQuB768arS7TSEsFJJS4
         vAESAzP2c4QkG3W9k0duUP8goaio3JkEL9yQm56PujP7V4DEO878gr1S97CC7jAZ2pD9
         cSWq2MJs5j6EPd0b5xWeq94/aHUiHh5TeP7H85KESIbA8kqkhQpvgSaxVjCrGkW1D3L0
         129g==
X-Forwarded-Encrypted: i=1; AJvYcCVnYbQZhwjgbyLwoCejG6ON3gTNWEp49pZlorPtjdJMNh7AQX/pMNB3vJQDg8lLVlqwkArpx7maf+o=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz3GLxGPyy6MlPBFRhFeebQQYHCKn7AyVe6T5KECl9mkil7zjH
	JC6ZDkmEPrcs5F1YdRINpzBRKlmTQ1YWClE1Rzpyl9VMo5RDLfm4m76DMV0Wn39hO9BEeHGAwjP
	EtEwDo+95FehXfAUK6pkTysm5WzW7ySCpsSXyWrNjtiB8bN81EB+XqXpWAi3rDxd3tLWl
X-Gm-Gg: AZuq6aIMJ11ZAWhU9mkb5mCKyy6SJsNBb1ueW4KYgTmgxSQxltKSkdqe46bjmZfV8uk
	oXP765BUylNcecC839qyQ+H95MJ0TyEWaQrUTUVXhPphLPEQtILww4tqwdVaV07UpprDYmRrpuh
	RZNqqcxs8ht3yDp/CzWdMV6h1OamSGUG4gFu6Av3fgb2PrS+s6e8ElW6cPdvRPFYOnT9H+ppaIj
	18SkpZCLQh2zOPN350XpIHLC5LDKoHNkTJIts2a3ssZIjEzWt3b1Jn58V4iXillaDUI6Zj/agOR
	XXxm6xTKMKQVDjRtwY2488VuADpVjNUCrw8m7CiA2iBDmn6O80hzclwGTFCobJIbE4EHbIBJHCs
	UQniHO6qoL+SvNXV7jzk=
X-Received: by 2002:a05:7022:608f:b0:11b:d4a8:d244 with SMTP id a92af1059eb24-125c0f93c6fmr5769708c88.16.1770058183599;
        Mon, 02 Feb 2026 10:49:43 -0800 (PST)
X-Received: by 2002:a05:7022:608f:b0:11b:d4a8:d244 with SMTP id a92af1059eb24-125c0f93c6fmr5769692c88.16.1770058183010;
        Mon, 02 Feb 2026 10:49:43 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1abedcasm20534927eec.21.2026.02.02.10.49.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:49:42 -0800 (PST)
Date: Mon, 2 Feb 2026 12:49:41 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <73zrxri5snnenmezjxrdorbcsps4dlvtrkvkq3w4ain4ggbxdl@hjw4u73msaro>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-4-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202140716.34323-4-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: _hj55--kC3-iS05UBGGYto80rGXUsI1f
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980f1c8 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=Y8ST6Fl8U4FUF0grvJQA:9
 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: _hj55--kC3-iS05UBGGYto80rGXUsI1f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0NyBTYWx0ZWRfX9Ai8slJln0un
 KDy3RLwOmfy0+Blbl/X0/7VumjHoVgAKHEtfQ4gjgWwWXoTH3a53WmJPIRZIcWNavIBJXjM/2iB
 ePeVDfymf2phI/erS99qXjhMOsWw/9uypToSGzzJ7ECfQqI3sUJkZim04bvb90XQBKSi2ziCJkR
 Fwyy+i4MUD303IhGmFV44TFOMBQgchjyFPuzbd4EKX84FZcZSSM7TFuut/k/mTOmbvTvZ5Mv1V+
 7LSwivECkyGEuQheock8aEY0EG9HehnPFmuMUsPW2g+BvlaiaBs1lGsHGmNs+26ezdT9rRHDzUo
 Aj1YFVnBjvTNThESRI9LRKD1Sj3cAD8EVlK6R5c8wn3/tsHAWdldGxOlSeNczQtQqejvwtckU+4
 dkTYhqvLiYYWqEpGB/SaEsybmOj8M4P7FLWeNZLtVYr1H9P5jOpU73OLgYKQjzE2+CQEFZ6gsQk
 fGwTdMstpLLCJQWF1EQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020147
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104946_362187_E32E3A68 
X-CRM114-Status: GOOD (  35.50  )
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

On Mon, Feb 02, 2026 at 10:07:15PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Add a VM capability that allows userspace to select the G-stage page table
> format by setting HGATP.MODE on a per-VM basis.
> 
> Userspace enables the capability via KVM_ENABLE_CAP, passing the requested
> HGATP.MODE in args[0]. The request is rejected with -EINVAL if the mode is
> not supported by the host, and with -EBUSY if the VM has already been
> committed (e.g. vCPUs have been created or any memslot is populated).
> 
> KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE) returns a bitmask of the
> HGATP.MODE formats supported by the host.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  Documentation/virt/kvm/api.rst | 27 +++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c            | 20 ++++++++++++++++++--
>  include/uapi/linux/kvm.h       |  1 +
>  3 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index 01a3abef8abb..1a0c5ddacae8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -8765,6 +8765,33 @@ helpful if user space wants to emulate instructions which are not
>  This capability can be enabled dynamically even if VCPUs were already
>  created and are running.
>  
> +7.47 KVM_CAP_RISCV_SET_HGATP_MODE
> +---------------------------------
> +
> +:Architectures: riscv

If we only want this to work for rv64, then we should write riscv64 here,
but, as I said in the last patch, I think we can just support rv32 too
by supporting its one and only mode.

> +:Type: VM
> +:Parameters: args[0] contains the requested HGATP mode
> +:Returns:
> +  - 0 on success.
> +  - -EINVAL if args[0] is outside the range of HGATP modes supported by the
> +    hardware.
> +  - -EBUSY if vCPUs have already been created for the VM, if the VM has any
> +    non-empty memslots.
> +
> +This capability allows userspace to explicitly select the HGATP mode for
> +the VM. The selected mode must be supported by both KVM and hardware. This
> +capability must be enabled before creating any vCPUs or memslots.

We should write what happens if the capability (setting the mode) is not
done, i.e. what's the default mode.

> +
> +``KVM_CHECK_EXTENSION(KVM_CAP_RISCV_SET_HGATP_MODE)`` returns a bitmask of
> +HGATP.MODE values supported by the host. A return value of 0 indicates that
> +the capability is not supported.
> +
> +The returned bitmask uses the following bit positions::
> +
> +  bit 0: HGATP.MODE = SV39X4
> +  bit 1: HGATP.MODE = SV48X4
> +  bit 2: HGATP.MODE = SV57X4

Could write something along the lines of the UAPI having the bit
definitions rather than duplicating that information here.

> +
>  8. Other capabilities.
>  ======================
>  
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4b2156df40fc..3bbbcb6a17a6 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -202,6 +202,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  	case KVM_CAP_VM_GPA_BITS:
>  		r = kvm_riscv_gstage_gpa_bits(&kvm->arch);
>  		break;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +		r = kvm_riscv_get_hgatp_mode_mask();
> +		break;
>  	default:
>  		r = 0;
>  		break;
> @@ -212,12 +215,25 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  
>  int kvm_vm_ioctl_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap)
>  {
> +	if (cap->flags)
> +		return -EINVAL;
> +
>  	switch (cap->cap) {
>  	case KVM_CAP_RISCV_MP_STATE_RESET:
> -		if (cap->flags)
> -			return -EINVAL;
>  		kvm->arch.mp_state_reset = true;
>  		return 0;
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (!kvm_riscv_hgatp_mode_is_valid(cap->args[0]))
> +			return -EINVAL;
> +
> +		if (kvm->created_vcpus || !kvm_are_all_memslots_empty(kvm))
> +			return -EBUSY;
> +
> +		kvm->arch.kvm_riscv_gstage_pgd_levels =
> +				3 + cap->args[0] - HGATP_MODE_SV39X4;
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
