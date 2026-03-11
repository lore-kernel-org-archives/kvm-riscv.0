Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD03104BEC9
	for <kvm-riscv@archiver.kernel.org>; Wed, 11 Mar 2026 16:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dpklPHTZn7rQj3SDDL9Sm4sA/pvk5/U7qCiOhqFG9kc=; b=NPW9nRMdegxWxt
	J09QOaSUMBG0T64t6Oa9IVToG6kfcMFWbxX19eeO0Hq1Lw0p7MFkWWsXzAiu+TPY7a6a3WgMNnuIa
	J4pTYrHARl1lfg22reYhYRCNpfZgIPWkjSMmpj2Wz8PlQlPjlrTFgpmEB5Ws/n4uKOntfaSnjnvYJ
	JSE+lWyNhmZjqIFBT4hx6K4SrxTO7d9wV3x3vlirCziehJQ9zRfTqZjEHZ3xBxJBFgAdeWsSIhJM4
	59ErFGXpf3JIbVL5ceF2PI8wT1+HaUpuINKmA0DDnvtJp33p/ZrZCl5J5roBwOgHGTk03efTJwPmH
	ESKZKhYCrs9clfwuMgeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mn4-0000000Bwvw-2siy;
	Wed, 11 Mar 2026 16:52:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Mn1-0000000BwvG-40ZZ
	for kvm-riscv@lists.infradead.org;
	Wed, 11 Mar 2026 16:52:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BAvHVE2622287
	for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:52:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=y3/JAW+oGfTE3BgR575SvjKP
	t61kz+8CmpWiBiOLuUw=; b=nbSFXa8zbVW04UR3iGjV/y2nQU0cIJB5fIuIpNrB
	dB/eJOcWljGTnFzeLjAeI0ABRqyBIyUKFJ1wdq7yzWKgNsTeQKuigY1qdb5PmnaJ
	oZ3fcgf6bTe+BeXglfvEQDBY1CRAfnhkoX6n+HEfwXzGR2D3iK05JY5xHpIC1IHZ
	3v+uF8Ga++9meEkPQ1pIXuyMVfOnbBc1KGT8w9hbKrzbzG0mObW6re0Cpv+mo4yY
	W0bZ6qbz2x0yWT7eMpMpSlcKGYRCCx/0sIyYJuTFLmw8ndJnBHJ8P26gQVeHXLR+
	VD9KYFwPYSnusa3S81pVF341iRDPIVoGioWuqdadGkoP/g==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu73h1b00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 16:52:06 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7d73fc43561so1205082a34.0
        for <kvm-riscv@lists.infradead.org>; Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773247926; x=1773852726; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=IJrQW/ATfN6FIvRgTSSJaScB+KrR+EqhAl3VMYnxock0LHaJc4YYfgh4e5KQNtAKdc
         n/NSksavatxWY6HK5nWlOAPBQJT3ng1BaYY1h+4AVNv3CBSKMTdNzmaSMJ04tHo9cUD7
         2yyLJqLuXYDCUWx+ZDjKs7rGCADZf8t0Fq/bXEJXF6UygvRqZMSJPatelMyHuAEhAhN9
         IGTjMigBwG50hPwZg9o3g/m02DCU8Y4TMjBkoizGBynwAilvNhIwCvlr086iiOCMjQNZ
         KrDmAZHqxKMOlk8gQ/EHFBTgPHMeT60vWnMm9FqeYrbsPNHItW6e7K8pNvfFqZN0ysEg
         nRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773247926; x=1773852726;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y3/JAW+oGfTE3BgR575SvjKPt61kz+8CmpWiBiOLuUw=;
        b=AvfUR7h1f632szG+lL2iU2iS3zKE3xB9MODrkx0BKklK7GnisCYZObGlQ7MEMsBqOO
         HFoshh3X4SRLv8Gg6quDJBdxSI8mJiV0VMbK1swl1K7T4ZxE2ui37KxyApWli698K/yc
         mfCu4qPy2qzxNNMzOaWVWeyRbWH1sU+Kv33eeaFhGVuLpxnC6rZncVrlIrz/bYicOACQ
         gqe3tbWJeATTVR//DWoWdT4OY8InmEDK36gUo596Pf5gzd/GydQ1R/xx5ZTzOkbJudX6
         rdhXI4OVVBWbqhQPtI78KSbOaGGBK/erGORw0S3L0Qctn9kM0XXZPH5XHU+ob3telLYL
         uaUg==
X-Gm-Message-State: AOJu0Yw8G1Me5NYEqn623sgAudITzihTmhaVoyPjKLE9rjNZa+aDm2QH
	AYRySE60Mn0QkkqJvewg8TqbRXqJjKk3zpsAPUDaVoahJAC1w8+3DODPb+mbgHDIZS2RGYcOhG4
	OXbISaPSE4MKh3NezPACX73NZyQZMj4XpdAJYQUpnfxkVUcHYNLQX6xFvPNQ2g/94aulE
X-Gm-Gg: ATEYQzy/NmAiu2oaUVU5nQyIDio718Ir3kJ/8d0OmLk51GmPKXfmCFPLsK4HjBZv7eL
	zs1dBGlhxfXaP+c3lCi6F//Jzr9hQJbS10ki6s5Y4qM+QzebMooKeB6obC6cvv3bzrWD59/T7Qj
	WiOgSRTxoP6Y9ElLGYG3I7SfpAUccLxbDeIeJpOhjeQ01+nwt5lnPoHM5HlQ6rFsDRf8LZG/d3J
	ya5WtyuuxaoMdPwvOxE/5eR/1x52H7AxwCp3BLCHCNLiUOn2DAvPvImRFTg9BQNT9tleDfzL9aD
	mE+K1ioNj16ieY18fxf7spSWTApCcFvJWOuAIs9M6uUMFe8acmDa6yrKAzXid2K5RK2eiO/Z0dS
	aOhj2HNH2rTCqji+9Cw9OXj0vbR7n47Y=
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127332a34.35.1773247926135;
        Wed, 11 Mar 2026 09:52:06 -0700 (PDT)
X-Received: by 2002:a05:6830:6c17:b0:7ca:c7a2:c935 with SMTP id 46e09a7af769-7d76a79e74emr2127304a34.35.1773247925706;
        Wed, 11 Mar 2026 09:52:05 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d7749f1f5csm389205a34.6.2026.03.11.09.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:52:04 -0700 (PDT)
Date: Wed, 11 Mar 2026 11:52:03 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alex@ghiti.fr>,
        Andrew Jones <ajones@ventanamicro.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paolo Bonzini <pbonzini@redhat.com>, Paul Walmsley <pjw@kernel.org>,
        Shuah Khan <shuah@kernel.org>, Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read() and pmu_fw_ctr_read_hi()
Message-ID: <2apicvahmomu57i7gjd2cgc5cakq4pxsbphz5xnl4cr2sqvp72@hqud4u6bo53b>
References: <20260310055557.835531-1-xujiakai2025@iscas.ac.cn>
 <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310055557.835531-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 8vPgul2mrbmJIO1oNYrLBQqbbkV79kqb
X-Authority-Analysis: v=2.4 cv=T7uBjvKQ c=1 sm=1 tr=0 ts=69b19db6 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=RS4Nko6ylG0vjQzhQroA:9 a=CjuIK1q_8ugA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: 8vPgul2mrbmJIO1oNYrLBQqbbkV79kqb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDE0MiBTYWx0ZWRfXwonhizosGpB7
 8YrhxSNE1b5Klvy7NhnhKShkm+7DdyeoBdfhlStAf14/pGlCUXZSWnIo7igWgRh6kn5nol8HF+a
 Fx/Bsf1qE5CKUIv272anmLcO/ih+8JENRMzmbA/M4md5uwnp4tZ2uYn3ZNQbcQUNrKI8YhevGFz
 sXGuKI7vGR0HOvB9ZC+LPH1gYISWvETFAV6ZFGOcsrJDLXdY4BRE/D9qZkFFGabT1UEDGVWozPx
 IlbblzgmV3NM1aN25daN1Ki7LlsH3MuaO7lnaKQiZqXRsA9kr5duXVY1Iqfemmf+oOyPSOb76yt
 OD2GNcbNWdflOrNAmmJFuF6F/5vOjpNUbxHJn3kuhf0OYxxz2Cp84irC8iE8Sk7EgrBSyWBZpTH
 v0AJ6rVaSzX+nVTUWeRIdRsKcxlwSatfBrvaXCpr1hO4eaMsS94MBUh40KggSb/YOYDMRscmX9Z
 NMFl1FUdNCR5CiDieuQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095208_021580_B4EE0564 
X-CRM114-Status: GOOD (  23.50  )
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

On Tue, Mar 10, 2026 at 05:55:56AM +0000, Jiakai Xu wrote:
> When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ or
> SBI_EXT_PMU_COUNTER_FW_READ_HI on a firmware counter that has not been
> configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the pmc->event_idx remains
> SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF). get_event_code() extracts the
> lower 16 bits, yielding 0xFFFF (65535), which is then used to index into
> kvpmu->fw_event[]. Since fw_event is only RISCV_KVM_MAX_FW_CTRS (32)
> entries, this triggers an array-index-out-of-bounds:
> 
>   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
>   index 65535 is out of range for type 'kvm_fw_event [32]'
> 
> Add a check for the known unconfigured case (SBI_PMU_EVENT_IDX_INVALID)
> and a WARN_ONCE guard for any unexpected out-of-bounds event codes,
> returning -EINVAL in both cases.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Fixes: 08fb07d6dcf71 ("RISC-V: KVM: Support 64 bit firmware counters on RV32")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
> V2 -> V3:
> - Added check for SBI_PMU_EVENT_IDX_INVALID.
> - Added WARN_ONCE for unexpected out-of-bounds event codes.
> V1 -> V2:
> - Merged the fixes for pmu_ctr_read() and pmu_fw_ctr_read_hi() into a single
> commit.
> - Removed the pr_warn, simply returning -EINVAL instead.
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..c87a7b0037cf 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -226,7 +226,14 @@ static int pmu_fw_ctr_read_hi(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	if (pmc->cinfo.type != SBI_PMU_CTR_TYPE_FW)
>  		return -EINVAL;
>  
> +	if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +		return -EINVAL;
> +
>  	fevent_code = get_event_code(pmc->event_idx);
> +	if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +				  "Invalid firmware event code: %d\n", fevent_code))

Align under previous parameter, not the >= operator

 if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
     "Invalid firmware event code: %d\n", fevent_code))

> +		return -EINVAL;
> +
>  	pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  
>  	*out_val = pmc->counter_val >> 32;
> @@ -251,7 +258,14 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  	pmc = &kvpmu->pmc[cidx];
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
> +		if (pmc->event_idx == SBI_PMU_EVENT_IDX_INVALID)
> +			return -EINVAL;
> +
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (WARN_ONCE(fevent_code >= SBI_PMU_FW_MAX,
> +					  "Invalid firmware event code: %d\n", fevent_code))
> +			return -EINVAL;
> +
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
>

Otherwise,

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
