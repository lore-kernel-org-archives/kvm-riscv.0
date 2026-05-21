Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02465CD5BAB
	for <kvm-riscv@archiver.kernel.org>; Thu, 21 May 2026 23:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iLHqlOD2KPpqdN1DugMNWkfsFiaxu5jI39tmH/jG05g=; b=O3DBU9XAgM0Mfp
	6aNcsW9wD+MoIEz2cgWAKis/sYmFpGKIUzLLEFMXhlQD6QtrnMNz1lCHuMLSY9Ls9bd58hXlPTihD
	Afw0lgvvP/PYv7ykDGpNcjLdbayMQq8eWEQhtIMc1AMM+NjXULPJzbgvXCHqYEmU/WIq+nbHqg/XZ
	bcHIw6MdcfxTTkfQUyU1Y79aCn+hqxTCFxdBtFMuvCAJftAuSngPuHu6KDQR/zxEIjUUQ0o0NGtZt
	4cKLPqCfICDLj7AJ4lSYkORjEhRThKFYGmb5LbirtjXUrubINJOJ7SSmisC5ly71e3JNNPo+oYQ/B
	CRNVkhyAPhtJrAfkoDaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQD6z-00000009Lep-1scu;
	Thu, 21 May 2026 23:47:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQD6w-00000009Ldv-2zFV
	for kvm-riscv@lists.infradead.org;
	Thu, 21 May 2026 23:47:32 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LGk6F3399205
	for <kvm-riscv@lists.infradead.org>; Thu, 21 May 2026 23:47:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PUdFWIPa89vxzsAnhQHf6L+y
	G3KEiIca8aXD5VqPxII=; b=cX9pPedhuNT9q9JgbfnLFEWj14pBZkTiG8W88p/t
	eh989MdqtnNnHooQoUpC5tGonbAixDq0F38xCcO1zTVQQuSSCiNff1t8LeVbxuGf
	8zLt2lSI9ZBrsHjDJvqJV5HehTzkZYXYq1jaKy3N4eyQJfeP5LHcz37WqMZQBphR
	LAF5UYmXYt1Bw8xTgqbtlhQyCzORQ3b0lP/B7cVrmf8oegUoOtz8BhiSEM0xDfE/
	glhq3wzuxLHszw/Rpxs8L2T5UGaflaXFpRJyGD+1nKDSSdpQ2XdG2FkQXDaa8cqU
	H0G1vBfljHdX8zXvsQTGPXCmZ1w9gfR5oYyw9QJCsUpGVw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea5p9smbr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 21 May 2026 23:47:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so5639148eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 21 May 2026 16:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779407249; x=1780012049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUdFWIPa89vxzsAnhQHf6L+yG3KEiIca8aXD5VqPxII=;
        b=YfICvMLNA9R0GjUUNNSQIFMMGzvKdxLN4LYfHPOTLPf1/TCAgGNFUgZ4g0tcaFpxcn
         ibw/DVI1rsDy8z7bZcUo1sPlcLiyfLYUY6brt9JcJK88RY8gSCGcXJXDxmdDVUQConJW
         gYWdYJfK1VECNlC+0l+WntN0ClIkwY8yNs2vUYBre8rEBTcMj3J5bstlEXLJS3eXompH
         zJ5/XQEZ+zxsoaiFlJZ2YI49l7gVFHTiqzxS+DiqYKKM62FDbxwa+iFcQUdzzizzC3IH
         f3pvVrcV2+OTBNhlfd2G64fRMBm2eP3c4ccjLU/uHI3YycZkxPQiu8P6Jd1q5f1vzT0k
         QyKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779407249; x=1780012049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUdFWIPa89vxzsAnhQHf6L+yG3KEiIca8aXD5VqPxII=;
        b=j01+43cT8zv2HxA/+XY+Us+5npzSsWR8ZY6gkMjlrU3HSfysyDV3s6phFHFKhuBwm4
         UU6cWSB3XQdRKj28C1K/p/1VXV8G7eCYwo8oNgbHXSF3BExWvcR9132lRUy0gDsfdZjm
         BdCkkduKIW6TNAkj6M2jXNgxDmhj4Xjy8wCGrYscgDm48BHtRZ/Itsxiwa0XHPR6cyPE
         Jy4mklk6ZaRoovq6CiSAaG+bDAUL3hHZHyyRzZHasQUmWVVnb1FPzHtsfm1sgXjVPjxn
         9JzNe/7/emd64jl456DitxL7Y3ns7n4+Tm9FqXJ9ZO0P8d1jHkuxwcxN5yaArZ1/FJYQ
         np1A==
X-Gm-Message-State: AOJu0YyK1oRmwPRXLEDOvN6adX7WyDdO1pFDB8cjJ/B+vEqbQ++PyvmS
	wcCWH5n8e0YBVBzteWFAbGQcnCS7INegQMYIam0gD29aCkQZzHaQP37qVWeorYs5+bL3J6X/1oL
	5Gk8vyosGHs6fkWb59j7ObJebRt0ePE8Vpk9QbmB7uFVeX79Ru1+dJv9aIvrbQ/GLzhMJ
X-Gm-Gg: Acq92OFnCvCVi81JTL4DX9O8tRJPMP4J/0/vD1KLqxJGvh/wvXavXqPFq8sLoj4ZdDN
	jYJ8ZIgNnu6A1Gnzvu7D52ZEYUlrsXhZftw0ahq3UF62jkrHSLFS5dAGRyqcPWGCEPx/Xg6jQwL
	whItyG+oiOMYjkwFEM496DgnUZOskDqYZTRskq+/jp33VnbqM7+Fo/98PXTirsHxN55cFsc7+kt
	fEC2pNKJ9mywVzmXwa0oeXfV4Y4MWOyTeYE2rbNQw1gxdcgUNKk/Vujt7TrIXjccYPPYBEXO8aO
	0We351bCD3VHPPqdtUkDjM5sJgLdOkxXovORfMbfth7oj7zBeZ/WQ9M/yZT360h1VE2w7zdYMDM
	dWCotTjJONzvKvWgTtnkvkavKutZ6VcA=
X-Received: by 2002:a05:7300:23d3:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-304304f8840mr2709607eec.3.1779407248793;
        Thu, 21 May 2026 16:47:28 -0700 (PDT)
X-Received: by 2002:a05:7300:23d3:b0:2c5:c532:1fe1 with SMTP id 5a478bee46e88-304304f8840mr2709570eec.3.1779407248205;
        Thu, 21 May 2026 16:47:28 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044b9121c8sm625990eec.14.2026.05.21.16.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 16:47:27 -0700 (PDT)
Date: Thu, 21 May 2026 18:47:26 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <zfvysxe5eqyogy3cesmp53omigq6a7cjajs3ffbrfyqq7huph4@bbfw7ro5zz7l>
References: <20260521142030.1560861-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521142030.1560861-1-xujiakai2025@iscas.ac.cn>
X-Authority-Analysis: v=2.4 cv=DKm/JSNb c=1 sm=1 tr=0 ts=6a0f9991 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=19519zxkop7UJ02bGBcA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: yUTJvCwML9-v7W38YK9DiJbc0ELl8tmS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDIzOSBTYWx0ZWRfX0L5pcTUiD0ng
 YaglrSIlHWNZ7WnR8TrZg3mXzDhqdKb+pKvGch2uTIBFyWZZU+P6PifCYDyNv+7PrS2tfk6Y3XV
 MCgq1mhuXSeWnKpcNp+naSWzP08BDhuCkKS2LvZnCHbaki21Gq01sawj9fxCj+hQS4tdKDcubYu
 Iwifx+VfeyQlEGM2RlQjsDxpoqBRaNXnB31hrUIXcFmEqf2ZBKeXfZE9nXccXHu+uv3MSMgR+vm
 Wc+SyNkslpNrfC0OGIt+QCZF3TcN+k5I01DDe6x+UOozLJI+FL3hyJHkZP2yijmXEAXnR9Ku+El
 H2S623gDAZl2yoYvOyXTWv/YtedLlPpVSO+s4Q46jZ+e9G6mpo5iV75hZJfTFaHStcKatlvfGqp
 GxP5GdO7Gqq1CpfvtLJq+1qshHGfpNPOZl1ZngHP7wpB76VCHhsb70M33JGPtB985si8k4J5KuL
 2FFYO46KE8cMkGdZ7kA==
X-Proofpoint-ORIG-GUID: yUTJvCwML9-v7W38YK9DiJbc0ELl8tmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210239
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_164730_757261_C6323892 
X-CRM114-Status: GOOD (  31.31  )
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

On Thu, May 21, 2026 at 02:20:30PM +0000, Jiakai Xu wrote:
> The SBI SUSP handler kvm_sbi_ext_susp_handler() checks that all other
> vCPUs are stopped before entering system suspend, but it does not hold
> mp_state_lock during the iteration. A concurrent HSM HART_START from
> another vCPU can start a target vCPU after the SUSP handler has already
> checked it, violating the invariant that all vCPUs must be stopped
> before suspend.
> 
> Fix this with a two-phase approach:
> 1. Set a VM-wide suspend_in_progress flag before the iteration to block
>    concurrent HSM HART_START. The HSM start handler checks this flag
>    under its existing mp_state_lock, closing the race.
> 2. Hold mp_state_lock during each per-vCPU stopped check so that
>    mp_state reads are ordered against concurrent power_on/power_off
>    writes on the other side of the lock.
> 
> The flag is self-clearing: it resets when any vCPU re-enters
> kvm_arch_vcpu_ioctl_run after the suspend-resume cycle completes.
> 
> Fixes: 023c15151fbb ("RISC-V: KVM: Add SBI system suspend support")
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Assisted-by: YuanSheng:DeepSeek-V3.2
> ---
>  arch/riscv/include/asm/kvm_host.h |  3 +++
>  arch/riscv/kvm/vcpu.c             |  8 ++++++++
>  arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 +++++++++++
>  arch/riscv/kvm/vcpu_sbi_system.c  | 10 ++++++++++
>  4 files changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 75b0a951c1bc6..c4e710ec40f90 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -93,6 +93,9 @@ struct kvm_arch {
>  
>  	/* KVM_CAP_RISCV_MP_STATE_RESET */
>  	bool mp_state_reset;
> +
> +	/* Set by SBI SUSP to block concurrent HSM HART_START during system suspend */
> +	bool suspend_in_progress;
>  };
>  
>  struct kvm_cpu_trap {
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a73690eda84b5..ea6f14244addb 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -838,6 +838,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  	/* Mark this VCPU ran at least once */
>  	vcpu->arch.ran_atleast_once = true;
>  
> +	/*
> +	 * Clear stale suspend flag from a previous suspend-resume cycle.
> +	 * The flag was set by kvm_sbi_ext_susp_handler() and persists
> +	 * across the userspace exit; clearing it here ensures subsequent
> +	 * HSM HART_START operations are not blocked after resume.
> +	 */
> +	WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
> +
>  	kvm_vcpu_srcu_read_lock(vcpu);
>  
>  	switch (run->exit_reason) {
> diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> index f26207f84bab6..2f88d93768bc8 100644
> --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> @@ -31,6 +31,17 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
>  		goto out;
>  	}
>  
> +	/*
> +	 * Reject HART_START while a system suspend is in progress.
> +	 * kvm_sbi_ext_susp_handler() sets this flag before checking
> +	 * that all vCPUs are stopped; checking it here under
> +	 * mp_state_lock closes the race.
> +	 */
> +	if (READ_ONCE(target_vcpu->kvm->arch.suspend_in_progress)) {
> +		ret = SBI_ERR_DENIED;
> +		goto out;
> +	}
> +
>  	kvm_riscv_vcpu_sbi_request_reset(target_vcpu, cp->a1, cp->a2);
>  
>  	__kvm_riscv_vcpu_power_on(target_vcpu);
> diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
> index c6f7e609ac794..b79c1cff7a996 100644
> --- a/arch/riscv/kvm/vcpu_sbi_system.c
> +++ b/arch/riscv/kvm/vcpu_sbi_system.c
> @@ -35,13 +35,23 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
>  			return 0;
>  		}
>  
> +		/*
> +		 * Set the VM-wide flag to block concurrent HSM HART_START
> +		 * from racing with the per-vCPU stopped checks below.
> +		 */
> +		WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, true);
> +
>  		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
>  			if (tmp == vcpu)
>  				continue;
> +			spin_lock(&tmp->arch.mp_state_lock);
>  			if (!kvm_riscv_vcpu_stopped(tmp)) {
> +				spin_unlock(&tmp->arch.mp_state_lock);
> +				WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
>  				retdata->err_val = SBI_ERR_DENIED;
>  				return 0;
>  			}
> +			spin_unlock(&tmp->arch.mp_state_lock);
>  		}
>  
>  		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
> -- 
> 2.34.1
>

I'm not a big fan of this approach and I see sashiko found it has gaps[1].
I'd rather we introduce a mutex to kvm_arch to serialize cross-vcpu
mp-state operations. So it'd be taken in SUSP, HART_START, and also SRST
(anywhere that reads or modifies another vcpu's mp-state). Operations that
only modify the calling vcpu's own state would still only use the per-vcpu
mp_state_lock.

[1] https://sashiko.dev/#/patchset/20260521142030.1560861-1-xujiakai2025%40iscas.ac.cn

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
