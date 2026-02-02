Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC75FE7DF0F
	for <kvm-riscv@archiver.kernel.org>; Mon,  2 Feb 2026 18:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5x2LzUDx8M5nEOeR2IdXIfW3YghJ4sGhmPt/M378S0M=; b=sKgS6Ry88cDxme
	Nr+2REIE7hrKWGHICmA6epKfNAJApYLgp31oRck7ovaZSUpKaBFppYmiQyP5QQrbUJ8ayP4edxUVi
	jpPP1BLNCPSY6DMRXhd7YlovrQy8zqszwxu7EuNeFuF/hBMmsotqpEk6X1+ZcWiffdfp+7QBHHXre
	fWwF2gSUS+oq9X9poAUsveVxkknLto3VBy2ri7Tt1oOc1ZLW2x/UWD/HWixMLYMkUwdrCd4GXgUdO
	w3+1N5WAvKISybu6QsTjw1+4FxJ0NlzNxt6bQXyzfEzFeDOmwncsdbEQXjsRQWOiEIbP7fj8NrljS
	7e1VsMZvv7mDByGiqZ2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyvg-00000005SpK-0mo0;
	Mon, 02 Feb 2026 18:45:44 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmyvY-00000005So2-3uAv
	for kvm-riscv@lists.infradead.org;
	Mon, 02 Feb 2026 18:45:41 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612AtMRF3916029
	for <kvm-riscv@lists.infradead.org>; Mon, 2 Feb 2026 18:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=F3pTCtfOUHdevSdvNcn6XqzL
	AXxPpY1f4QI0AgduT8w=; b=A6vQWelRxUO5ssU1d44HbW04LSRdJPcgJDyxrVRY
	Pc2aHeWYECNXWzDegYEcHfxupof23ZBmKMNWIGEP+3bnwrkj/iCzv6qYArKL12u+
	JFhpG3dfm6h/wOfRjiLBR41kilUIeIbNRjFKd/vMepW+pqb9sv8ln4ME28IUginG
	YOk07VoqVwmTpLvO7q12pqmW1iRis2xpqm3p1W/GVdEI+6S+0TyMmQ2hT9It0aPT
	Q32w4ITgOW8x55wWCvEF/z9HQ3XUCu3JehBwgFuAvlbhag+FMzXatRJ888aBxoD0
	fJSdRiOsoBtfbuBsFuJV8mKGqlEi/tKvOStg9UYB/w+Wfg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tkmheu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 18:45:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2b71bdcd037so21409eec.1
        for <kvm-riscv@lists.infradead.org>; Mon, 02 Feb 2026 10:45:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770057935; x=1770662735; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=F3pTCtfOUHdevSdvNcn6XqzLAXxPpY1f4QI0AgduT8w=;
        b=bSWZigLjM9vhCIHu8/P5iElrAJckw3iT35I2KpnAuW5tL/HBzD5VQI66Sxu8jNBMSH
         L9tuSliqN8CbiApoon8I1mqJhEFNKOvk9OCOP//Uh6IKuBUIIcL/2hVBjyZXQwLdPUEP
         Ljhj41GvgrcPIwaOuMJCSHrVOX52V8cMZ9oPPas+4loexwPx5PbXpUvpVZ8HkQH7ys7O
         T5kOisq9jIbH2K0aDmWnQYAZqfZ+4lQGkyLynYIkLlJ5CseVtN3gCsY8gi+d5ZL8Hk61
         8PnMIQQPaU0yQvnCgbXD3XKu8sL5RbNUcWiZSlGWPk6trJwj05lJ8d630IfmpnhJU/ZA
         3o8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770057935; x=1770662735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F3pTCtfOUHdevSdvNcn6XqzLAXxPpY1f4QI0AgduT8w=;
        b=FiyvpTUD+G8PaeykyyTfhnC+oMs1ypVTomG9SY4NY2GUeisEdcfWPeZGiM/eBAiT29
         oWrRaerydU8AuNOSA3T4Hpg0TxcRkZ1EAxrnr0GVoo5dvsHS63963IFQpiE0OKrG2M15
         jk5SMx71desCF2YUoa5YkGSHynUtfDsqZARfaIIIpaQhbVOp0QvtRfhcPXk/9H5v2ZHZ
         AF3RP3EopnL81XIQkWoxX9kWI87prJBRRpI60pjhnOvUP0jJTySU6iflyQI1uTk/QeGN
         XUwEEd96j2UKHTf5pdYSUCj4p9AGG3VWwcZ8xiLqZH3uQy/9eykt+yw//uXDFpvWVdFf
         nqVg==
X-Forwarded-Encrypted: i=1; AJvYcCW1lakvtUgKKdfDZv6iieNseKV6uAYAMZ8zDHtAJCB8tUqizS8EJM3MlJTK9LivotCntBXDPXBNDPE=@lists.infradead.org
X-Gm-Message-State: AOJu0YwqPz2znP5OrpDFG7b6XzX2jtSk0rhMvOCSwlALObPdgsLJy/Ux
	GEpf1NN6quDwxUP3xmQpihF1+Q3LLaiK0olj96yrXSTsg5iWv+RuZFLqA35qRL3DNVToC2z2sZX
	pC2XhM9PVLl49L4vCXX4QT64nzvPom6qE19jx8+SwMcH2FPXZgTooh4PzHvco79PNVkWN
X-Gm-Gg: AZuq6aIprymdObtyklWUQc3u54ksfMl85a7OJjFlJ9mjR50mcS7LffEj2bAoXRxUAIh
	O3/HdF3QdPwmfnUYurvncxyQJrj4REQa3huKizvO7pVdl44sEBlTcdsTD6NlRlGkdrXU68QU2Er
	Ps1UH5ttcwsQdwNxpdWmAxTdOyMX5kxSNsebQF9fLmoL8k9PJmEwq3vOGJD9H7TGjBPy6A13+X5
	l/Dv5Oapb2bwVGF/a2xm0IOYqZ5iqHpvam1DxaW+T2R02N8gAfExdZ7S/K3ik/+DGItzDzjtYLF
	zccvCgutgCpK1lkOAHkX0WhqcbXxvq35gc4HWzqf/6+P4LEw5DFImaKzkdc3unTRPd3wqqfj2+E
	IOXy/Gmac/5HzJHxU7f8=
X-Received: by 2002:a05:693c:2289:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b820e4d59cmr181284eec.2.1770057934516;
        Mon, 02 Feb 2026 10:45:34 -0800 (PST)
X-Received: by 2002:a05:693c:2289:b0:2a4:3593:ccbb with SMTP id 5a478bee46e88-2b820e4d59cmr181263eec.2.1770057933918;
        Mon, 02 Feb 2026 10:45:33 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a16eab80sm20197175eec.9.2026.02.02.10.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 10:45:33 -0800 (PST)
Date: Mon, 2 Feb 2026 12:45:31 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        radim.krcmar@oss.qualcomm.com, linux-doc@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] RISC-V: KVM: Detect and expose supported HGATP
 G-stage modes
Message-ID: <ftdnjnfvmybiskej3txd23mqn3jpjdewmgjxjbap3y4ekj4h4m@d74ihtpclyps>
References: <20260202140716.34323-1-fangyu.yu@linux.alibaba.com>
 <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260202140716.34323-3-fangyu.yu@linux.alibaba.com>
X-Authority-Analysis: v=2.4 cv=TaebdBQh c=1 sm=1 tr=0 ts=6980f0cf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=SRrdq9N9AAAA:8 a=XyLJYK2s2W5OP0ZauVAA:9
 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: ZrddB9GAHWSMKmCzezpXCPGKqhyYAq8v
X-Proofpoint-ORIG-GUID: ZrddB9GAHWSMKmCzezpXCPGKqhyYAq8v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE0NiBTYWx0ZWRfX9dFbKArA2BTM
 cyFRz+EDH3zcOnhpWnYfuSGT9FZiWiLT33wHqG5V7+5RCOywrMas/wXNectAhHIUwP5/BuC54XH
 K1sc9nobvxtcjoZwxlHyCZ4oMhMEwZOtVB/G12nA5C7h5rVsAHoQsbzrSYFx6feP6LlUC7ehBn9
 BuL4WmajJizpr+NU/sedLtkJHC5G1RRGY+hcm6NfocgJczHHjzTthdXIB5TcP/iKJr8GEUaSUBk
 Vx/vzpX/R7hTd6lr5XJ3eRqH75qcWW9c5XmCFm2TqyTgI8KmhtXsE8hWKnig3KXNC3VVNChgwtp
 HbuB326mLLr+531zR31scy/jyivSuh/WrLtxcu7ZGe1jdfy5+JGvV+YpXpiFxe1q8lwYMTrGCDd
 ryS7cFFf0eLxwN7ZNQuR5QMZzQ1op95zC+/r1MIV8a8/Kcgmlgnbz/td1L7/H44YWnWLVdO08KA
 BxJ833XtEEWkSXk+kCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_104538_524087_6BED42ED 
X-CRM114-Status: GOOD (  30.51  )
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

On Mon, Feb 02, 2026 at 10:07:14PM +0800, fangyu.yu@linux.alibaba.com wrote:
> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> 
> Extend kvm_riscv_gstage_mode_detect() to probe all HGATP.MODE values
> supported by the host and record them in a bitmask. Keep tracking the
> maximum supported G-stage page table level for existing internal users.
> 
> Also provide lightweight helpers to retrieve the supported-mode bitmask
> and validate a requested HGATP.MODE against it.
> 
> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/kvm_gstage.h | 37 +++++++++++++++++++++++++++
>  arch/riscv/kvm/gstage.c             | 39 ++++++++++++++++-------------
>  2 files changed, 58 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/kvm_gstage.h b/arch/riscv/include/asm/kvm_gstage.h
> index b12605fbca44..c0c5a8b99056 100644
> --- a/arch/riscv/include/asm/kvm_gstage.h
> +++ b/arch/riscv/include/asm/kvm_gstage.h
> @@ -30,6 +30,7 @@ struct kvm_gstage_mapping {
>  #endif
>  
>  extern unsigned long kvm_riscv_gstage_max_pgd_levels;
> +extern u32 kvm_riscv_gstage_mode_mask;
>  
>  #define kvm_riscv_gstage_pgd_xbits	2
>  #define kvm_riscv_gstage_pgd_size	(1UL << (HGATP_PAGE_SHIFT + kvm_riscv_gstage_pgd_xbits))
> @@ -75,4 +76,40 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  
>  void kvm_riscv_gstage_mode_detect(void);
>  
> +enum kvm_riscv_hgatp_mode_bit {
> +	HGATP_MODE_SV39X4_BIT = 0,
> +	HGATP_MODE_SV48X4_BIT = 1,
> +	HGATP_MODE_SV57X4_BIT = 2,
> +};

These should be defined in the UAPI, as I see the last patch of the series
does. No need to define them twice.

> +
> +static inline u32 kvm_riscv_get_hgatp_mode_mask(void)
> +{
> +	return kvm_riscv_gstage_mode_mask;
> +}
> +
> +static inline bool kvm_riscv_hgatp_mode_is_valid(unsigned long mode)
> +{
> +#ifdef CONFIG_64BIT
> +	u32 bit;
> +
> +	switch (mode) {
> +	case HGATP_MODE_SV39X4:
> +		bit = HGATP_MODE_SV39X4_BIT;
> +		break;
> +	case HGATP_MODE_SV48X4:
> +		bit = HGATP_MODE_SV48X4_BIT;
> +		break;
> +	case HGATP_MODE_SV57X4:
> +		bit = HGATP_MODE_SV57X4_BIT;
> +		break;
> +	default:
> +		return false;
> +	}
> +
> +	return kvm_riscv_gstage_mode_mask & BIT(bit);
> +#else
> +	return false;
> +#endif

It seems like we're going out of our way to only provide the capability
for rv64. While the cap isn't useful for rv32, having #ifdefs in KVM and
additional paths in kvm userspace is probably worse than just having a
useless HGATP_MODE_SV32X4_BIT that rv32 userspace can set.

> +}
> +
>  #endif
> diff --git a/arch/riscv/kvm/gstage.c b/arch/riscv/kvm/gstage.c
> index 2d0045f502d1..edbabdac57d8 100644
> --- a/arch/riscv/kvm/gstage.c
> +++ b/arch/riscv/kvm/gstage.c
> @@ -16,6 +16,8 @@ unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 3;
>  #else
>  unsigned long kvm_riscv_gstage_max_pgd_levels __ro_after_init = 2;
>  #endif
> +/* Bitmask of supported HGATP.MODE (see HGATP_MODE_*_BIT). */
> +u32 kvm_riscv_gstage_mode_mask __ro_after_init;
>  
>  #define gstage_pte_leaf(__ptep)	\
>  	(pte_val(*(__ptep)) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC))
> @@ -315,42 +317,43 @@ void kvm_riscv_gstage_wp_range(struct kvm_gstage *gstage, gpa_t start, gpa_t end
>  	}
>  }
>  
> +static bool __init kvm_riscv_hgatp_mode_supported(unsigned long mode)
> +{
> +	csr_write(CSR_HGATP, mode << HGATP_MODE_SHIFT);
> +	return ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == mode);
> +}
> +
>  void __init kvm_riscv_gstage_mode_detect(void)
>  {
> +	kvm_riscv_gstage_mode_mask = 0;
> +	kvm_riscv_gstage_max_pgd_levels = 0;
> +
>  #ifdef CONFIG_64BIT
> -	/* Try Sv57x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV57X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV57X4) {
> -		kvm_riscv_gstage_max_pgd_levels = 5;
> -		goto done;
> +	/* Try Sv39x4 G-stage mode */
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV39X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV39X4_BIT);
> +		kvm_riscv_gstage_max_pgd_levels = 3;
>  	}
>  
>  	/* Try Sv48x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV48X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV48X4) {
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV48X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV48X4_BIT);
>  		kvm_riscv_gstage_max_pgd_levels = 4;
> -		goto done;
>  	}
>  
> -	/* Try Sv39x4 G-stage mode */
> -	csr_write(CSR_HGATP, HGATP_MODE_SV39X4 << HGATP_MODE_SHIFT);
> -	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV39X4) {
> -		kvm_riscv_gstage_max_pgd_levels = 3;
> -		goto done;
> +	/* Try Sv57x4 G-stage mode */
> +	if (kvm_riscv_hgatp_mode_supported(HGATP_MODE_SV57X4)) {
> +		kvm_riscv_gstage_mode_mask |= BIT(HGATP_MODE_SV57X4_BIT);
> +		kvm_riscv_gstage_max_pgd_levels = 5;
>  	}
>  #else /* CONFIG_32BIT */
>  	/* Try Sv32x4 G-stage mode */
>  	csr_write(CSR_HGATP, HGATP_MODE_SV32X4 << HGATP_MODE_SHIFT);
>  	if ((csr_read(CSR_HGATP) >> HGATP_MODE_SHIFT) == HGATP_MODE_SV32X4) {

Can use kvm_riscv_hgatp_mode_supported() here too.

>  		kvm_riscv_gstage_max_pgd_levels = 2;
> -		goto done;
>  	}
>  #endif
>  
> -	/* KVM depends on !HGATP_MODE_OFF */
> -	kvm_riscv_gstage_max_pgd_levels = 0;
> -
> -done:
>  	csr_write(CSR_HGATP, 0);
>  	kvm_riscv_local_hfence_gvma_all();
>  }
> -- 
> 2.50.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
