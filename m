Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5682DCA0EE4
	for <kvm-riscv@archiver.kernel.org>; Wed, 20 Aug 2025 16:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DJadkqog0eZDxB3HYh6beTNCbUDLnO5Uy0Zz+QdBHI=; b=lhs5jgpX2lHw3U
	W+kbZ/5vZJjWanfcX6XRCaM9XagMjm8D6F+tybBQL2G2bDvN8SLzFrMMvFkdGKswHC9XZXI6m9l5G
	NRb+RoviWzBCw5pehYbG/jI0/h4hwjTEPiIRexVO6cRtsAYURk7qms9VWG9gprrccrBdFQ84dR+xD
	/FQWyjwEO30Wqt4l1wJkHpX2uqDo1k8We0iBda1IVGNLhPV8nH/TiM1w/ai13eFAhnG8JwBMz2udQ
	+UVgyWr0btLFUiGdC1qyQEga6iOzVqBKo9u3NCiL/7CA/48itKgLrdxwekh8w4lq13vmcBf6rruYr
	r1uiEZxex875whlZIx+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uolhL-0000000EOvK-2aUy;
	Wed, 20 Aug 2025 16:30:03 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uojzc-0000000E80m-3JDP
	for kvm-riscv@lists.infradead.org;
	Wed, 20 Aug 2025 14:40:50 +0000
Date: Wed, 20 Aug 2025 22:40:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755700842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EcoFwzHSYrp+NY5s6PC1QvTSYtJuMsbUmRJhhxFBMK8=;
	b=ZO0pr5oKnEqT1iYmsMop0hBVSVyepMAvMrr5XQLeUU2tbWsGefS0c03EleG0w7NWqMQgOj
	tqsKnbjLTInR/2uoElcN6OvKd9AeMtj5Tz8S28UBaDegjd7FWOwujRDcTOWDDCgsupQL6l
	r+rlamPptN+vnegDZaDJj0eyerRJ5jc=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: fangyu.yu@linux.alibaba.com, anup@brainfault.org, atish.patra@linux.dev,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH v3 2/2] RISC-V KVM: Remove unnecessary HGATP csr_read
Message-ID: <aKXeXd4pZvoQmYB9@troy-wujie14pro-arch>
References: <20250820125952.71689-1-fangyu.yu@linux.alibaba.com>
 <20250820125952.71689-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250820125952.71689-3-fangyu.yu@linux.alibaba.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_074049_184287_9C904CC4 
X-CRM114-Status: GOOD (  18.15  )
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

On Wed, Aug 20, 2025 at 08:59:52PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> The HGATP has been set to zero in gstage_mode_detect(), so there
> is no need to save the old context. Unify the code convention
> with gstage_mode_detect().
> 
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  arch/riscv/kvm/vmid.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
> index 5f33625f4070..abb1c2bf2542 100644
> --- a/arch/riscv/kvm/vmid.c
> +++ b/arch/riscv/kvm/vmid.c
> @@ -25,15 +25,12 @@ static DEFINE_SPINLOCK(vmid_lock);
>  
>  void __init kvm_riscv_gstage_vmid_detect(void)
>  {
> -	unsigned long old;
> -
>  	/* Figure-out number of VMID bits in HW */
> -	old = csr_read(CSR_HGATP);
>  	csr_write(CSR_HGATP, (kvm_riscv_gstage_mode << HGATP_MODE_SHIFT) | HGATP_VMID);
>  	vmid_bits = csr_read(CSR_HGATP);
>  	vmid_bits = (vmid_bits & HGATP_VMID) >> HGATP_VMID_SHIFT;
>  	vmid_bits = fls_long(vmid_bits);
> -	csr_write(CSR_HGATP, old);
> +	csr_write(CSR_HGATP, 0);
Is setting HGATP to 0 in gstage_mode_detect meaningless now?
If so, it might be better to drop it and just keep the one here.

                - Troy

>  
>  	/* We polluted local TLB so flush all guest TLB */
>  	kvm_riscv_local_hfence_gvma_all();
> -- 
> 2.49.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
