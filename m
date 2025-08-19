Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB6CA0EEB
	for <kvm-riscv@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l42vDVWRGmbJTsZRn2TJe8p7iEIfFrAjOUgm51+a9yM=; b=ACMlByZBHSQelb
	S/uRdT6BCjphfW06EQ+/skxGXPl1yEKC+vVNu/cdQ9PHphfMs5EuQ0HBQY1dTwWh/o7V2OSx+eHZ+
	G8qzlND572fRzFUWqK3IclBXg92Bv4W46ZgQGqwCJIVU/wrLeYh5qtlGLAqrStrAz3/8bA8BKVVSy
	+eVoOtRXahDtzDX3VoL8czDpCA0VxtrRQs7uvch3GmsnHN2m0c/aG5ilL8H93k7tQS05NYxa0BIi6
	fN+OixbnyvUwnNGFwrF0+AnCRpCnB+L4DmpNaXBE63IJS/gmvWmmzUYMP0ipZ4add34eQ2JDwAmQ4
	ifSbA85WH7pO1QhdgRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQrz-0000000BFQG-3SCG;
	Tue, 19 Aug 2025 18:15:39 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNLs-0000000Akbi-36N8
	for kvm-riscv@lists.infradead.org;
	Tue, 19 Aug 2025 14:30:18 +0000
Date: Tue, 19 Aug 2025 22:27:02 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755613629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TWvZTXUXEJL7nh5uPtT4Ud1hkvku6IV5nyuOFNoTAv0=;
	b=T9GqhK34sK0ikauzeNSBxRN+EiQBDKH+FGTdM+8EKZAk6f96SaUGXFbx8fWXcyBXWpZl4X
	0EPRsXPggdH7pQiRg1jQTC5wQrkfVwCYUqzXVPSD80QBctEB5jeuwnpeavr0ymy91sfeaR
	xOyZHtsELbRedj3ZwbDihZ9DiD0AjH8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Troy Mitchell <troy.mitchell@linux.dev>
To: guoren@kernel.org, paul.walmsley@sifive.com, anup@brainfault.org,
	atish.patra@linux.dev, fangyu.yu@linux.alibaba.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	Troy Mitchell <troy.mitchell@linux.dev>
Subject: Re: [PATCH] RISC-V: KVM: Prevent HGATP_MODE_BARE passed
Message-ID: <aKSJtqea0x0r44Tq@troy-wujie14pro-arch>
References: <20250819004643.1884149-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250819004643.1884149-1-guoren@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_073016_912445_A71FFCE1 
X-CRM114-Status: GOOD (  19.51  )
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

On Mon, Aug 18, 2025 at 08:46:43PM -0400, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> urrent kvm_riscv_gstage_mode_detect() assumes H-extension must
> have HGATP_MODE_SV39X4/SV32X4 at least, but the spec allows
> H-extension with HGATP_MODE_BARE alone. The KVM depends on
> !HGATP_MODE_BARE at least, so enhance the gstage-mode-detect
> to block HGATP_MODE_BARE.
> 
> Move gstage-mode-check closer to gstage-mode-detect to prevent
> unnecessary init.
> 
> Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> ---
>  arch/riscv/kvm/gstage.c | 27 ++++++++++++++++++++++++---
>  arch/riscv/kvm/main.c   | 35 +++++++++++++++++------------------
>  2 files changed, 41 insertions(+), 21 deletions(-)
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>

> 
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 24c270d6d0e2..b67d60d722c2 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -321,7 +321,7 @@ void __init kvm_riscv_gstage_mode_detect(void)
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
>  		kvm_riscv_gstage_mode = HGATP_MODE_SV57X4;
>  		kvm_riscv_gstage_pgd_levels = 5;
> -		goto skip_sv48x4_test;
> +		goto done;
>  	}
>  
>  	/* Try Sv48x4 G-stage mode */
> @@ -329,10 +329,31 @@ void __init kvm_riscv_gstage_mode_detect(void)
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
>  		kvm_riscv_gstage_mode = HGATP_MODE_SV48X4;
>  		kvm_riscv_gstage_pgd_levels = 4;
> +		goto done;
>  	}
> -skip_sv48x4_test:
>  
> +	/* Try Sv39x4 G-stage mode */
> +	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> +	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
> +		kvm_riscv_gstage_mode = HGATP_MODE_SV39X4;
> +		kvm_riscv_gstage_pgd_levels = 3;
> +		goto done;
> +	}
> +#else /* CONFIG_32BIT */
> +	/* Try Sv32x4 G-stage mode */
> +	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
> +	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {
> +		kvm_riscv_gstage_mode = HGATP_MODE_SV32X4;
> +		kvm_riscv_gstage_pgd_levels = 2;
> +		goto done;
> +	}
> +#endif
> +
> +	/* KVM depends on !HGATP_MODE_OFF */
> +	kvm_riscv_gstage_mode = HGATP_MODE_OFF;
> +	kvm_riscv_gstage_pgd_levels = 0;
> +
> +done:
>  	csr_write(CSR_HGATP, 0);
>  	kvm_riscv_local_hfence_gvma_all();
> -#endif
>  }
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index 67c876de74ef..8ee7aaa74ddc 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -93,6 +93,23 @@ static int __init riscv_kvm_init(void)
>  		return rc;
>  
>  	kvm_riscv_gstage_mode_detect();
> +	switch (kvm_riscv_gstage_mode) {
> +	case HGATP_MODE_SV32X4:
> +		str = "Sv32x4";
> +		break;
> +	case HGATP_MODE_SV39X4:
> +		str = "Sv39x4";
> +		break;
> +	case HGATP_MODE_SV48X4:
> +		str = "Sv48x4";
> +		break;
> +	case HGATP_MODE_SV57X4:
> +		str = "Sv57x4";
> +		break;
> +	default:
> +		return -ENODEV;
> +	}
> +	kvm_info("using %s G-stage page table format\n", str);
>  
>  	kvm_riscv_gstage_vmid_detect();
>  
> @@ -135,24 +152,6 @@ static int __init riscv_kvm_init(void)
>  			 (rc) ? slist : "no features");
>  	}
>  
> -	switch (kvm_riscv_gstage_mode) {
> -	case HGATP_MODE_SV32X4:
> -		str = "Sv32x4";
> -		break;
> -	case HGATP_MODE_SV39X4:
> -		str = "Sv39x4";
> -		break;
> -	case HGATP_MODE_SV48X4:
> -		str = "Sv48x4";
> -		break;
> -	case HGATP_MODE_SV57X4:
> -		str = "Sv57x4";
> -		break;
> -	default:
> -		return -ENODEV;
> -	}
> -	kvm_info("using %s G-stage page table format\n", str);
> -
>  	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
>  
>  	if (kvm_riscv_aia_available())
> -- 
> 2.40.1
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
