Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE6CD5BAF
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 May 2026 00:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zl6vjgErVr/tR7E3EAG+VM6lcMh1uqFuiZN1zXj5DHU=; b=0evwjPNWHbCsRU
	ZSEuu2H62V6CJOVpuYIJGBswzuO/DdbaSf7QRulzvVRKHOneY+110i46JGgro3JEx7hBZk9iGyR0A
	x/pw/2X7Z4holyzuOup/IOE0u3yzQpSa7VH96IDxIV+zew+XiOYnPxHGrJ+HJM4Lq9lLmxpTVTX3A
	QrBwa2FlmJZ1E+91Bpx1v+jRmxJSjgVZ7KuT5ps8nKDkd1vi2dLMI2W6i3Uq3i/nydaq2mO4g52y8
	QUEqEyikJ7fSnSyzUG3ZaH9f6E5+HbUYQ6NRAC3ZtnNGm9f3m8o55jGOsqVvKwVV6u+fKJO7ZIalo
	ONx8WiXRysxoK1YG9mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDgJ-00000009OfV-442R;
	Fri, 22 May 2026 00:24:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQDgG-00000009OeQ-2zYo
	for kvm-riscv@lists.infradead.org;
	Fri, 22 May 2026 00:24:02 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64LKSwKL776936
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 00:23:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5GSON/0hiBS5ycqET1N4+CsB
	MgT/hpoirbtpuxXnHDo=; b=j6nAgohe17YHjIEKj+Ihg75j5WfPN0JUsHLCk1Yq
	qZ8MVDyv7FkQ7tR4l+tgBPPk1MWRU8xCFncqEpb1b4dLnOm259YGHK7jP4Sddtlx
	Oqm2W+9Oqkw1P+V/m1Am5Xe1OPLUhgkFeGg5yqfrhBe3CMKR9fmBlqi5iPLIqLYs
	CPhAqK7fQnWrrGaIyklLESc2g2NS1FZyjwPOQduckxvVH7f0VhrxaG+01rdVBh3P
	H13GaMEw0iwD1Hrim42IcLFVC1wC40znGo4ksGamtn7JJCUnYMF75mPocrhkhBgj
	BB3Um+efwSOQk5LDGgxnZ3pfhujoC/ayHtKXhOc/5eyBcg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea94h0vfg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 00:23:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2bda35eab74so5676735eec.0
        for <kvm-riscv@lists.infradead.org>; Thu, 21 May 2026 17:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779409439; x=1780014239; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5GSON/0hiBS5ycqET1N4+CsBMgT/hpoirbtpuxXnHDo=;
        b=A9yahcJbbkgbVtkuf5cGGsqtJwxZZR0DGAyMofQqviUwmRm4xAgof0OFkRpA3xAjWL
         KJoGSMC+B71fHntMI0LOJorcM0TqAJSY6P0Kzj//1+iaJ2IVVCsarO22kit3ZaBPn93W
         wWdnBxWhIFQhJPtJUVqn12c5JCOVTTh2ODs6CpCXW8pz7+nTwYzDLzt8sthnq8LbO/hR
         Q6X6+u6uPglEmMDwDbCxVGfgPR1YXOyjG3yUSrYJk75zl6541bZ/AiITPVz7/2ZGQbgl
         Gpv7uN/6cf0EZ2f7wD1JX7izt83M+LVeGcl4Ie2hQZ9UtZE2phrIUw8zrK7VKoDWz1lv
         Fsxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779409439; x=1780014239;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5GSON/0hiBS5ycqET1N4+CsBMgT/hpoirbtpuxXnHDo=;
        b=s9e94q0ehfuhSp/CQ3+rmCiqyZKrfM3LXzSebuS453/XwihUcP+3eW5Ma8RZSFO4fJ
         tku6WCk/+H2iKNsHPM5b2PtXpjSLlvWg2VMHeMaFhGNRfbFEt0gAPRFCKMPUynqMLJEm
         gRUAxrp0QleGNPd2ySt0Fb9g/b5itax+i1xjPrTb+rHAWwWJvR7FcXz9ZW6RXi/Z4BqU
         5uhHx6ENLSnv6AYH4XD/swtjAHzk44QSftmN5VuKr2FG6pOxxWocDl3JNpHshh3obm9Y
         0fyf883TML4Et2MQy7+faPCq0IXobHVdPa+4+l0nL0rHaDfF7AnTe6QmQc4wmhTyiR+/
         sq5Q==
X-Gm-Message-State: AOJu0YxqrPrSwnmEFzt2XQsWGISTgt8g7yWcAcQ5DQIugpu4ud6DKXdW
	eQpPsA1kETFSu8208VniJ6ly/ySvw/6sgXqdN33ytmNH+chBvZV6/y4aOB5RaPZs+ivnf0XvF4V
	NR2dj9Kqjo38V/XnIZRy4e20ZE6Z2oVQU8vgJ0oTA63Cg2nDBp6flg5hCPibaPnDHD98M
X-Gm-Gg: Acq92OEIS1ij7vABfIwcuIsSk8BpqfvnvEX6DiqJdocxdxpXZOStBaHE8T7JJ631b+k
	LLQ2P4Lsk+4+1hhLDTkLhvL/GOYx1HP2IXGYRYlm4XoTR5rCYzLNHBURlzEtEzmfqxceyVlK4Zz
	oSvmNNDUEqUwhRuJiROCvUvJ5fwYWQC6gkk0kNKxokGbaZ5yEV3XWIq8QvlNh8EwkcjxRPxnznk
	gsjcR+Gt9VfPmJ4S/kxekddpKzgAGdU03LacEHnvmuTRsGXpaahK/6RZs6bYltIkfAaJ0qqLkhJ
	AornVwkJhDc4X/sfw6cTGas+zwBNI9nsi/+M/fjObokxTcqS9UH0O40TVjMhH44arWuKlR8i0Nx
	r6bhYsz+/b6P9E/KTKS9Zbmj6PSDvo1o=
X-Received: by 2002:a05:7300:230d:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-30430e40401mr2728643eec.12.1779409438524;
        Thu, 21 May 2026 17:23:58 -0700 (PDT)
X-Received: by 2002:a05:7300:230d:b0:2d2:d5a3:e97c with SMTP id 5a478bee46e88-30430e40401mr2728626eec.12.1779409437908;
        Thu, 21 May 2026 17:23:57 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3044b6d16f9sm804742eec.2.2026.05.21.17.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 17:23:57 -0700 (PDT)
Date: Thu, 21 May 2026 19:23:56 -0500
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
Message-ID: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
References: <20260521142030.1560861-1-xujiakai2025@iscas.ac.cn>
 <zfvysxe5eqyogy3cesmp53omigq6a7cjajs3ffbrfyqq7huph4@bbfw7ro5zz7l>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <zfvysxe5eqyogy3cesmp53omigq6a7cjajs3ffbrfyqq7huph4@bbfw7ro5zz7l>
X-Proofpoint-GUID: uBj8niWgsC_gzkvbeY5ABos--SX31Jh0
X-Authority-Analysis: v=2.4 cv=QblWeMbv c=1 sm=1 tr=0 ts=6a0fa21f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=c92rfblmAAAA:8 a=pGLkceISAAAA:8 a=xEbelNxs-k07UTx3eFkA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-ORIG-GUID: uBj8niWgsC_gzkvbeY5ABos--SX31Jh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDAwMiBTYWx0ZWRfX+56S000eYaO5
 NS8g9+IOO9eyisIFHc6SG5taiecrwruoLkQsOuPaUMQHCi7pPKS/R+e4pSWsmzLFQpEGYdSOBdQ
 PqxdOpTxiPgWBgJBkHjxFCofbdDR5B/OLbALIH/wTXf2Arph03qbpvnWxLM0fDvVzUGdO+XXfG8
 XjVqwzJYeiaUFCZr/RUBHaW3tH3VteoiKRK26u8icitYS8JSSF3e6+Q4oyosuBLm1ye+XMhmdhe
 sPG2tuK8BNI9V08ZzssbpPyWz0a1nOYs/cp9X1sietoUGm7BZUFP6DwyB6doN4yIOLaHMf6ZxsE
 RqaZm7xq/SmxZxcsgQR3BLgyvgZDagxaM5P7tQq0VBceukCyGOXaPKBvU4qKeSeuYyEqmYHLzps
 Qrd/n2bQaKeiL+L5auG1YJJ2XLYAiBKLg/9yFtwxoVWY7Efwkem4eJHgNGY2rymsMBsfvHk7/Rl
 3NijUppb/a5+omIJ5aQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_172400_865486_3D165856 
X-CRM114-Status: GOOD (  34.35  )
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

On Thu, May 21, 2026 at 06:47:26PM -0500, Andrew Jones wrote:
> On Thu, May 21, 2026 at 02:20:30PM +0000, Jiakai Xu wrote:
> > The SBI SUSP handler kvm_sbi_ext_susp_handler() checks that all other
> > vCPUs are stopped before entering system suspend, but it does not hold
> > mp_state_lock during the iteration. A concurrent HSM HART_START from
> > another vCPU can start a target vCPU after the SUSP handler has already
> > checked it, violating the invariant that all vCPUs must be stopped
> > before suspend.
> > 
> > Fix this with a two-phase approach:
> > 1. Set a VM-wide suspend_in_progress flag before the iteration to block
> >    concurrent HSM HART_START. The HSM start handler checks this flag
> >    under its existing mp_state_lock, closing the race.
> > 2. Hold mp_state_lock during each per-vCPU stopped check so that
> >    mp_state reads are ordered against concurrent power_on/power_off
> >    writes on the other side of the lock.
> > 
> > The flag is self-clearing: it resets when any vCPU re-enters
> > kvm_arch_vcpu_ioctl_run after the suspend-resume cycle completes.
> > 
> > Fixes: 023c15151fbb ("RISC-V: KVM: Add SBI system suspend support")
> > Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> > Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> > Assisted-by: YuanSheng:DeepSeek-V3.2
> > ---
> >  arch/riscv/include/asm/kvm_host.h |  3 +++
> >  arch/riscv/kvm/vcpu.c             |  8 ++++++++
> >  arch/riscv/kvm/vcpu_sbi_hsm.c     | 11 +++++++++++
> >  arch/riscv/kvm/vcpu_sbi_system.c  | 10 ++++++++++
> >  4 files changed, 32 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> > index 75b0a951c1bc6..c4e710ec40f90 100644
> > --- a/arch/riscv/include/asm/kvm_host.h
> > +++ b/arch/riscv/include/asm/kvm_host.h
> > @@ -93,6 +93,9 @@ struct kvm_arch {
> >  
> >  	/* KVM_CAP_RISCV_MP_STATE_RESET */
> >  	bool mp_state_reset;
> > +
> > +	/* Set by SBI SUSP to block concurrent HSM HART_START during system suspend */
> > +	bool suspend_in_progress;
> >  };
> >  
> >  struct kvm_cpu_trap {
> > diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> > index a73690eda84b5..ea6f14244addb 100644
> > --- a/arch/riscv/kvm/vcpu.c
> > +++ b/arch/riscv/kvm/vcpu.c
> > @@ -838,6 +838,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
> >  	/* Mark this VCPU ran at least once */
> >  	vcpu->arch.ran_atleast_once = true;
> >  
> > +	/*
> > +	 * Clear stale suspend flag from a previous suspend-resume cycle.
> > +	 * The flag was set by kvm_sbi_ext_susp_handler() and persists
> > +	 * across the userspace exit; clearing it here ensures subsequent
> > +	 * HSM HART_START operations are not blocked after resume.
> > +	 */
> > +	WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
> > +
> >  	kvm_vcpu_srcu_read_lock(vcpu);
> >  
> >  	switch (run->exit_reason) {
> > diff --git a/arch/riscv/kvm/vcpu_sbi_hsm.c b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > index f26207f84bab6..2f88d93768bc8 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_hsm.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_hsm.c
> > @@ -31,6 +31,17 @@ static int kvm_sbi_hsm_vcpu_start(struct kvm_vcpu *vcpu)
> >  		goto out;
> >  	}
> >  
> > +	/*
> > +	 * Reject HART_START while a system suspend is in progress.
> > +	 * kvm_sbi_ext_susp_handler() sets this flag before checking
> > +	 * that all vCPUs are stopped; checking it here under
> > +	 * mp_state_lock closes the race.
> > +	 */
> > +	if (READ_ONCE(target_vcpu->kvm->arch.suspend_in_progress)) {
> > +		ret = SBI_ERR_DENIED;
> > +		goto out;
> > +	}
> > +
> >  	kvm_riscv_vcpu_sbi_request_reset(target_vcpu, cp->a1, cp->a2);
> >  
> >  	__kvm_riscv_vcpu_power_on(target_vcpu);
> > diff --git a/arch/riscv/kvm/vcpu_sbi_system.c b/arch/riscv/kvm/vcpu_sbi_system.c
> > index c6f7e609ac794..b79c1cff7a996 100644
> > --- a/arch/riscv/kvm/vcpu_sbi_system.c
> > +++ b/arch/riscv/kvm/vcpu_sbi_system.c
> > @@ -35,13 +35,23 @@ static int kvm_sbi_ext_susp_handler(struct kvm_vcpu *vcpu, struct kvm_run *run,
> >  			return 0;
> >  		}
> >  
> > +		/*
> > +		 * Set the VM-wide flag to block concurrent HSM HART_START
> > +		 * from racing with the per-vCPU stopped checks below.
> > +		 */
> > +		WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, true);
> > +
> >  		kvm_for_each_vcpu(i, tmp, vcpu->kvm) {
> >  			if (tmp == vcpu)
> >  				continue;
> > +			spin_lock(&tmp->arch.mp_state_lock);
> >  			if (!kvm_riscv_vcpu_stopped(tmp)) {
> > +				spin_unlock(&tmp->arch.mp_state_lock);
> > +				WRITE_ONCE(vcpu->kvm->arch.suspend_in_progress, false);
> >  				retdata->err_val = SBI_ERR_DENIED;
> >  				return 0;
> >  			}
> > +			spin_unlock(&tmp->arch.mp_state_lock);
> >  		}
> >  
> >  		kvm_riscv_vcpu_sbi_request_reset(vcpu, cp->a1, cp->a2);
> > -- 
> > 2.34.1
> >
> 
> I'm not a big fan of this approach and I see sashiko found it has gaps[1].
> I'd rather we introduce a mutex to kvm_arch to serialize cross-vcpu

Eh, not sure why I said 'introduce' here. We can just use kvm->lock.

> mp-state operations. So it'd be taken in SUSP, HART_START, and also SRST

And, even though SRST doesn't really need it - why not... Consistency has
its merits.

> (anywhere that reads or modifies another vcpu's mp-state). Operations that
> only modify the calling vcpu's own state would still only use the per-vcpu
> mp_state_lock.
> 
> [1] https://sashiko.dev/#/patchset/20260521142030.1560861-1-xujiakai2025%40iscas.ac.cn
> 

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
