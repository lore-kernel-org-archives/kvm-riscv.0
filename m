Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E46F4BB8C
	for <kvm-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 21:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f9oXf1VUeMWwSEMSrADHr2R2p/7YWu8g5Cps/LIUE8w=; b=ZhRtw49AaAfe/b
	TxisdJo6dAL7hZkISINMxy2f9V/Z15ItskXNhaRYqZEXk7ukzpwMLHF5lw/Euor1UKwnLeH2dznAV
	dXae7XXjbGwQWLfjWuVrnOXwT+XbWzDhyda2qMKi6onQg81kUCWrpTnX0f6Mb7mGGwhgmmXaqsTee
	NWEv7QAC+i22K6C00IEv+wtMIjJEDLfnVavgYDwKW1sg+pA3X2AGjZdVLoZzsY48QEege4w8828/9
	dWUpxJbiRtg+VdUwakCTpqFoO1CGaCgnmCTYXtosYyQRKhMYKGspteoO5iHZUmHLAlxG6UDqf7nIK
	QTvZgw2/C79Nme8xZkrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0J3-00000002pHF-35nF;
	Tue, 24 Feb 2026 21:51:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv0J0-00000002pGV-2z40
	for kvm-riscv@lists.infradead.org;
	Tue, 24 Feb 2026 21:51:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61OLQWVE2432444
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 21:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PYdOYbhb4RINNVZP0bdh4mEu
	h5KJPe7w0rQzb0Et4Lk=; b=cQmV6/+hvUaKLA8pJgSUofxUW98ZZ1zAEaUqekSu
	i1o6YtvHC47F99Tm+i2Jh9cBnJ1kbwGXZChybh8lNAeuejdEk3RZ0DvHFYLpckX0
	aYHNYRRB3qiYDB2pwmh9fJR/dsCe4VyACviHfnhLhy1Pt0n2cS4kMPOpKmYkm45N
	QmdlLl3Rgdtz8bGhtGbboY01vAbbpHdwP94XUyx3Rs4muDUKmoM2Fi0dXinpzt80
	7PT5LWLwow62dTZD8bFIwxcv88PLetthKN1b99UsArMxKiy5lb7fH//jumzIvkAV
	9wiBy9nOYdr8Ej2vCQoCqleKJQtMZiSRD+3OWQDwZsShJw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekj9cd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 21:50:57 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so6770631eec.0
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Feb 2026 13:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771969856; x=1772574656; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PYdOYbhb4RINNVZP0bdh4mEuh5KJPe7w0rQzb0Et4Lk=;
        b=K8Pjg0Se+JaZLCEB3N/vdzMafqPzL4gK2kATRzGjdoaU/fuVJ+hWL8Xa1JKBNEWX18
         ji4mCX8Bif3HPfqnlryXkvuXRZdLV4jmovpk8Buz0N2uxs0ZGpilEandlVEGkd+ZVd/J
         YoOfcRqbgGqwm8ZPqtVzCHjob8XtxZ3lPm5LAPeN+PuNhr6MDxBOkfo2n16ptSoR6ev4
         nV6y/EINkNzMcK6b4Zmp4z14If2atrOWAeOnD+JEtisEFFPcKZe8j5BYYhalRPGl6tdM
         DxlpLOqk222EPNVXcDJRQqMn3SOzjI6oRiMfL7n+f4fQSUs7wZacL7dx0PZocZ63nmlH
         gbyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771969856; x=1772574656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PYdOYbhb4RINNVZP0bdh4mEuh5KJPe7w0rQzb0Et4Lk=;
        b=qUfaykdXnl2mOtFI5Et/3igUsezjQl5IRnJs8344vfVEfi7MzoOlbGMKezQHOHye6h
         zC1VeerAaVgH1VWxAfPJCPyTwtIC6SVceiLi7fWe8WbqrIIx+ZAWURfQZGFhciIqK3zj
         fDUsLBo830/l3pMtfMc6LcvM1RC4a0COHTAPIEjEQZTlC95Rt5yaNnyXc/eJLAX4HtJ8
         mOl+d+kFF3oA+eILOqFYeGCOQ8K4pXF30dVBe8H4FEABNx77CbRaCf8SNERg7j3wLkzS
         xXYrGs0Mu+GRBXlftxWO00pfiAGsMSDSIDkqcOsWMPqsZPKYF2XSpYK+3Rslx+J3QIRQ
         Rf5w==
X-Forwarded-Encrypted: i=1; AJvYcCWb/0Nzdn5D2r8lswgOdAA3rNSAtP779T5y5sLDofA4xAWKxS9LJWCjkuQ0pFclTf8bq55laVN/15I=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3LyyRCAZGAbbKQyCGkKARWuYonQp8yYmK1/YS7EXEywnMdzlS
	fayHDiutuiT3AS5a3ANjL/nlyMRf1nmWgc89x4aSaDBIlwe2J/b5mgqTU0t/pOSiYp4TvGtVGV9
	Pe29GJXIW3pIXT2Fs2pKRDn6EqNg7NwGgjgxCd2qa7X+2FS8gZMh0IkY50nNVbLxyJnIf
X-Gm-Gg: ATEYQzwNkryLwS+q3CCn1A/6kO9COJqThtqcTlpaoN1T2fnvzL6WHz3/bRRShmIT4s5
	7kf6gbKvcYDxbf5Lo8YE9PGPE1XUyq1h/IUrby1I3uwFupTUPYHxwgta+yfxHvrfLMTlMuCxQnQ
	0GgoV4vOLVafhBw/QtvHFGXQeVBvKNjBFnAK6RwC5g8F3s6furVOL/C2eMTkbgQRnbQZPHzSbW3
	TtxPDH1OiaMsEpK33lfgTlmdFdpICvc2u0drCvucYmQGj3ndqnU9m1APvLmSSug2IaPJZGurDwb
	+MXu9bjw6uydLwdn+AzcMRoYMeAHrIrIn7SCqxUMtblGPwotjdqItAeKUxV7UxKiK0FlNUi5dKH
	Iv6RmguRqxefHtwXQ56K/gzfHLo2HbhU=
X-Received: by 2002:a05:693c:2b0d:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2bd7bae9c9dmr5164264eec.16.1771969856476;
        Tue, 24 Feb 2026 13:50:56 -0800 (PST)
X-Received: by 2002:a05:693c:2b0d:b0:2b8:4a34:6c39 with SMTP id 5a478bee46e88-2bd7bae9c9dmr5164253eec.16.1771969855873;
        Tue, 24 Feb 2026 13:50:55 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7dc164e3sm7529614eec.25.2026.02.24.13.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 13:50:55 -0800 (PST)
Date: Tue, 24 Feb 2026 15:50:54 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jinyu Tang <tjytimi@163.com>
Cc: anup@brainfault.org, atish.patra@linux.dev, ajones@ventanamicro.com,
        conor.dooley@microchip.com, yongxuan.wang@sifive.com,
        nutty.liu@hotmail.com, paul.walmsley@sifive.com, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] KVM: riscv: Skip CSR restore if VCPU is reloaded on
 the same core
Message-ID: <fr5tir6ypoxkgqwfg5u2ke5n23bucdkk6zaxckfha2wibsebbo@qqusmvhky24e>
References: <20260222045741.260325-1-tjytimi@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260222045741.260325-1-tjytimi@163.com>
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699e1d41 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=Byx-y9mGAAAA:8 a=J8dAU397a_ys_4ZrTBUA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: D-Vc537J-4FgXrQTSqMgdcM3zXwWrRxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDE5MCBTYWx0ZWRfX4HH5Siv7bt+4
 4Rl79VfR0Ie8OFcab+9FDWrGqgJN1cA7lpZ9GU5iHeZGl69xtlV+NmZTgMG/VSox2i3zCgHnZXo
 MxDbDf07YMkRYsnNL8r8xzQ6TjVwuAXWRTG6ekPmmNJBli8mvdA+znOmSzxn27rsvV/Thrq1Ywb
 +55OI3nIm6NKTLUARli6OZ56ei5KXUcaAdo+mJZyymnbZJIDZB/fo/A+qicjzu/w/blfaAnwLQt
 rAsAksGLS3H9emkRy6tq6e7uTfQ8xNTRbSJ7zv+puh/6ZZllq2ZT4/QIahAY/HW8zQEPSyV4+T4
 m5AnX4+YmvpXtOFvzGsXBbrx1EmA8/wB/yQiHmo+lp1Tox2CIaVCc0vz6OZEfksXrGm8inwpOnD
 6UfOO8GmptCrGfllejkTV3JHqIU1qAu7XpBl4tnf5MLTIJZBxbg0uf6tdmij6ks2HMrA1g7aO4x
 +3GFutnLw4oRdUI+kuw==
X-Proofpoint-GUID: D-Vc537J-4FgXrQTSqMgdcM3zXwWrRxf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240190
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_135058_864225_6EA8571B 
X-CRM114-Status: GOOD (  35.54  )
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

On Sun, Feb 22, 2026 at 12:57:41PM +0800, Jinyu Tang wrote:
> Currently, kvm_arch_vcpu_load() unconditionally restores guest CSRs and
> HGATP. However, when a preempted VCPU is scheduled back on the same
> physical CPU, and no other KVM VCPU has run on this CPU in the meantime,
> the hardware CSRs are still valid.
> 
> This patch optimizes the vcpu_load path by skipping the expensive CSR
> writes if all the following conditions are met:
> 1. The VCPU was previously preempted (vcpu->scheduled_out == 1).
> 2. It is being reloaded on the same CPU (vcpu->arch.last_exit_cpu == cpu).
> 3. No other VCPU used this CPU (vcpu == __this_cpu_read(kvm_former_vcpu)).
> 4. The CSRs are not dirty (!vcpu->arch.csr_dirty).
> 
> To ensure this fast-path doesn't break corner cases:
> - Live migration and VCPU reset are naturally safe. KVM initializes
>   last_exit_cpu to -1, which guarantees the fast-path won't trigger.
> - A new 'csr_dirty' flag is introduced to track runtime userspace
>   interventions. If userspace modifies guest configurations (e.g.,
>   hedeleg via KVM_SET_GUEST_DEBUG, or CSRs via KVM_SET_ONE_REG) while
>   the VCPU is preempted, the flag is set to skip fast path.

I'm a bit concerned that the need for csr_dirty makes this fragile. Maybe
some reorganizing/factoring of kvm_arch_vcpu_load() could be done in a way
to make it obvious to anybody that's adding another csr to be loaded that
they also need to ensure csr_dirty is set when appropriate? At least a big
comment would help.

That said, can we now apply csr_dirty everywhere CSRs are dirtied allowing
us to remove the vcpu->scheduled_out check? Unless I'm missing something
we should only need to ensure last-cpu and last-vcpu are as expected and
that no csrs are dirty in order to skip the writes - it shouldn't matter
that we're reloading after a sched out or otherwise.

A couple nits below.

> 
> Note that kvm_riscv_vcpu_aia_load() is kept outside the skip logic
> to ensure IMSIC/AIA interrupt states are always properly
> synchronized.
> 
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> ---
>  v3 -> v4:
>  - Addressed Anup Patel's review regarding hardware state inconsistency.
>  - Introduced 'csr_dirty' flag to track dynamic userspace CSR/CONFIG
>    modifications (KVM_SET_ONE_REG, KVM_SET_GUEST_DEBUG), forcing a full
>    restore when debugging or modifying states at userspace.
>  - Kept kvm_riscv_vcpu_aia_load() out of the skip block to resolve IMSIC
>    VS-file instability.
> 
>  v2 -> v3:
>  v2 was missing a critical check because I generated the patch from my
>  wrong (experimental) branch. This is fixed in v3. Sorry for my trouble.
> 
>  v1 -> v2:
>  Apply the logic to aia csr load. Thanks for Andrew Jones's advice.
> ---
>  arch/riscv/include/asm/kvm_host.h |  3 +++
>  arch/riscv/kvm/vcpu.c             | 13 +++++++++++++
>  arch/riscv/kvm/vcpu_onereg.c      |  3 +++
>  3 files changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index 24585304c..7ee47b83c 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -273,6 +273,9 @@ struct kvm_vcpu_arch {
>  	/* 'static' configurations which are set only once */
>  	struct kvm_vcpu_config cfg;
>  
> +	/* Indicates modified guest CSRs */
> +	bool csr_dirty;
> +
>  	/* SBI steal-time accounting */
>  	struct {
>  		gpa_t shmem;
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index a55a95da5..f7f58f02c 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -24,6 +24,8 @@
>  #define CREATE_TRACE_POINTS
>  #include "trace.h"
>  
> +static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_former_vcpu);
> +
>  const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
>  	KVM_GENERIC_VCPU_STATS(),
>  	STATS_DESC_COUNTER(VCPU, ecall_exit_stat),
> @@ -537,6 +539,9 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>  		vcpu->arch.cfg.hedeleg |= BIT(EXC_BREAKPOINT);
>  	}
>  
> +	/* Mark CSRs dirty on hedeleg update */

Unnecessary comment.

> +	vcpu->arch.csr_dirty = true;
> +
>  	return 0;
>  }
>  
> @@ -581,6 +586,11 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  	struct kvm_vcpu_config *cfg = &vcpu->arch.cfg;
>  
> +	if (vcpu->scheduled_out && vcpu == __this_cpu_read(kvm_former_vcpu) &&
> +		vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)

Align the second line condition under the first

	if (vcpu->scheduled_out && vcpu == __this_cpu_read(kvm_former_vcpu) &&
	    vcpu->arch.last_exit_cpu == cpu && !vcpu->arch.csr_dirty)

> +		goto csr_restore_done;
> +
> +	vcpu->arch.csr_dirty = false;
>  	if (kvm_riscv_nacl_sync_csr_available()) {
>  		nsh = nacl_shmem();
>  		nacl_csr_write(nsh, CSR_VSSTATUS, csr->vsstatus);
> @@ -624,6 +634,7 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
>  
>  	kvm_riscv_mmu_update_hgatp(vcpu);
>  
> +csr_restore_done:
>  	kvm_riscv_vcpu_timer_restore(vcpu);
>  
>  	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
> @@ -645,6 +656,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>  	void *nsh;
>  	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
>  
> +	__this_cpu_write(kvm_former_vcpu, vcpu);
> +
>  	vcpu->cpu = -1;
>  
>  	kvm_riscv_vcpu_aia_put(vcpu);
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index e7ab6cb00..88cfcb018 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -652,6 +652,9 @@ static int kvm_riscv_vcpu_set_reg_csr(struct kvm_vcpu *vcpu,
>  	if (rc)
>  		return rc;
>  
> +	/* Mark CSRs dirty after userspace update csr */

Unnecessary comment.

> +	vcpu->arch.csr_dirty = true;
> +
>  	return 0;
>  }
>  
> -- 
> 2.43.0
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
