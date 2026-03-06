Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58C1FCC05E
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 18:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jELa2IoYHG+rv5hLX1FYq05rEMwzYsFKfPwOoS0VIPo=; b=l6qzCl1lf2iA4v
	UEDfIwqJZRHmD4h58oWIrSLH3ky9UIs2i0C1VJSXTcTfkQOKmS/woRPa4X+aGY0kCKZxy8sr/hRHA
	BIPUl7o8iQozBb3TtHq7mBq0H1Lu0l22qoWRADxl39oxjeBIACpbeLyol/4y/MCje9exYjz9MY6tS
	XCSfWNxsuOwQpoYWKJAGGrYdEcVPSmyehRzbNDV97UUxQPs6sdFaGvms5waST/9i8HnLKpbl0g/ja
	9UIOkf2YdNidB2chlb2u11YoeGuILXkA3JKdXTM5O7HiFD1YyfJKh2J0LOeQBsv0oE/lnGf2ZV4gx
	WOt0uoLL9mufMye7XyAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaE5-00000004LqS-18vD;
	Fri, 06 Mar 2026 18:48:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaE2-00000004Lpi-2QtG
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 18:48:39 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H2Pf8742668
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 18:48:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NPwo3cTU9Dl1aKmohJUbynAG
	EZLvr2w5QZ5ywnXg5H8=; b=EsEeCLFnL4zpuVKiUXVvxfIrQ40D3u8z42hPho2y
	D2oByRXhvHX+Exhu3vr/S8dmZ+LJwXQQzKkzUCxdqWIUi34BeYeT7MGq5Lwip1lH
	AqdGtG14Oy+ynPoEQTy5sWuDMGnmfEswlASnHDoZCyb8b4EmLUx8kd+UonCIJqCZ
	zEM3a5iwajrIUmpSHFjG/1ijGy2E09nMW290bR3ZFZf3JykFhiXE8wVJIyEk4HlL
	GE2jluuah0h41qcTgyjc19IwXQF1KbRKlP+q9nEaFBhycEgQumCj7AsMVKYAULk1
	RgIhia9Edt1t69Z36bg1rzC0FYP6lCL9DkAgFsW8pIDnAg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqpxdu0te-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 18:48:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so9177615eec.0
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 10:48:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772822917; x=1773427717; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NPwo3cTU9Dl1aKmohJUbynAGEZLvr2w5QZ5ywnXg5H8=;
        b=btg4eZXmnhwWYNlWnIYNX4bOBfJ4XDgjczAxk2XM+rELf74Xn2B1qQ3GN6vLPwcHJ1
         hHIOya8Fno19c8D0s23FHtVBQLDPYAFoPEuS5D6CvFUpYMIuuE9WJ+1+ZzYzlIwsW9zb
         78vtJgEVlyyN+/V6UzXfAV1cZzCfH9YHW6saUsLGzTCGNq4ZuvVeySRd5aYXZ8Z1v9b4
         xR8gR67PFSnR93Yo+P3vONnT587uIEMNcRU4+Q4y7OyVuCwALKG1dqswbNLUHOYcweF9
         mB2OaJVxdHD7i1jfWqLC3kN8/cEZkw0tzFHIuFxg9uGgk3X8wBjl8sqbrqdCISLxw70o
         2bng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772822917; x=1773427717;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NPwo3cTU9Dl1aKmohJUbynAGEZLvr2w5QZ5ywnXg5H8=;
        b=HRGhTyEvufZuUfVvqX1bKZBPSR04Cqf4fHjZSuHwyI635jRzLGRdLwLXM+0RmMomvR
         jgpT7rXkpqSpfAuTeY6sjD8yjfvBhKOEQPROZMMf831CaqQyA57GwNU7ogNC+PB+H/F1
         TQz7WVHHcUr0E/2S097v5iGPVa9cMzUR/choEQG5X+pWrmxnVsHBuvTpgrcd1+IKOOwg
         wnl0VEFBlVO6cjp5yekAZF0K6C4yQw9YGWW8TsqEThZbJ/cafBM7MY+WlWpF5eWvdBKM
         Yv97VZQtTMdk+1qPGPgbTv0opxzwrvJ7rOkgCqHsL+l07womqMjow0QABWsdY1VphXS5
         hcsg==
X-Forwarded-Encrypted: i=1; AJvYcCXkJVIwK8Q6E/GJoCRgpGQkyNryBqoX1QSgCQV8+cmsh64o66V5bLF302fZ+AIQ9yoq9QIS3LrutQI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOk4c01+wzQZ8qBcXGqfM2V7VW3YBcg+wIvidWjnceqoq/iatH
	TJ8bakKvOFwoIRgaJcDo12ZB5QUVY0KQ/5bwtJKVpUY/o/JkWb4jVDXSZZ48kGRhY6y9qt+fkEJ
	ezwDOgP102nw6O1GKaSY0xw8qbSZ3rswBZASADH2GaY5gDERQ5jSi8dnmvIumX7u5X8AN
X-Gm-Gg: ATEYQzxIknBplyF5z1FzTZ96GFeFpHJDjbdxxpEFt+8mT3t8nq5+fze/xUrR22dKypD
	/qLSd9xGOQ3q4lI/klgK2ayAP0YSUhDuyp/9WIhlzXNzDLzsysZoJZa1nlhF8bA2NKf7RExstLb
	jHPD7rayDrYIE7RdRQ7zMoVbRUKxfE6lYGBxaIJTk6zp1Bp7LrkTsFWImuBfNr6C2hpA+0d6iAy
	6BUGZhA9R/XHOTPPE4kfEdid8nNmCEzlMY44QDTejc0iQK2mO8nsaGPFSudHmFe+wU1GcyQDrVW
	dMQ6qIX/5s/SWBzP5F7cD2QKkGnknYSt1yCy4MrVwH4Na1dpFSJOKlWK/KD2S4JbPVsxEjZL3k8
	=
X-Received: by 2002:a05:7300:a883:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2be4e064a5fmr1152047eec.39.1772822917083;
        Fri, 06 Mar 2026 10:48:37 -0800 (PST)
X-Received: by 2002:a05:7300:a883:b0:2b0:5b6b:6529 with SMTP id 5a478bee46e88-2be4e064a5fmr1152030eec.39.1772822916383;
        Fri, 06 Mar 2026 10:48:36 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f984ceasm1998273eec.32.2026.03.06.10.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 10:48:35 -0800 (PST)
Date: Fri, 6 Mar 2026 12:48:34 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Andrew Jones <ajones@ventanamicro.com>,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <jiakaiPeanut@gmail.com>
Subject: Re: [PATCH 1/2] RISC-V: KVM: Fix array out-of-bounds in
 pmu_ctr_read()
Message-ID: <7cv4cq43l33fvpbikecjecfulomzurfmlbjk45u6amvdmnmrhu@7padusm25g5l>
References: <20260306073739.3441292-1-xujiakai2025@iscas.ac.cn>
 <20260306073739.3441292-2-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306073739.3441292-2-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: Uw6ysFu4Igh32h5NTDkaSXiruJIU_3c6
X-Authority-Analysis: v=2.4 cv=E83AZKdl c=1 sm=1 tr=0 ts=69ab2185 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=JfrnYn6hAAAA:8 a=pGLkceISAAAA:8 a=ABfPBq6YoVPYWZtmEusA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE3NyBTYWx0ZWRfX5u6YFiMIPER5
 V8C4WDz+5FGHwnxRqvfFVNuXxDIe+AEIoiCOvBJs2hErRMnpccuqs7tlOvHeVios1cluC3I4rE6
 WbUmPRUFESuBc2tvYZHvxweiLw5fiLDYgtd1lg5XKeGYjEQHLvpsH947uVjLmgnPDsQeiTzRRTN
 NbvWhmArEmyYomCs/rtEsMVnZTrFZu3b4b2m6gfBQ77rjvHq/GG4nU2TPcCP5HU6q0/p9ehZRNm
 ilRsSI6R4IKte85XI0zzx3R+BQFz1UZPjY1epE0I9ha4FuHsHbSQuCY4LvVY6hI2G0fdPmYpQgs
 Pxuae3QnldHxEG5bGKjewjM7gO2KzI0rHH1mh8q57ZDosV66E4uwLDMM2tyzRs95dmNptjnsxPy
 uh3GxiPNZ+NGtcSG09frqedsItaP3GGeKM37D9zXVCahH0tIec6zs7DYKqgKYIoPdqHzVPhI3UX
 zVxOnOV3dXJ7iQ7zCkw==
X-Proofpoint-GUID: Uw6ysFu4Igh32h5NTDkaSXiruJIU_3c6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_104838_769473_14BCAD19 
X-CRM114-Status: GOOD (  26.45  )
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

On Fri, Mar 06, 2026 at 07:37:38AM +0000, Jiakai Xu wrote:
> When a guest invokes SBI_EXT_PMU_COUNTER_FW_READ on a firmware counter
> that has not been configured via SBI_EXT_PMU_COUNTER_CFG_MATCH, the
> pmc->event_idx remains SBI_PMU_EVENT_IDX_INVALID (0xFFFFFFFF).
> get_event_code() extracts the lower 16 bits, yielding 0xFFFF (65535),
> which is then used to index into kvpmu->fw_event[]. Since fw_event is
> only RISCV_KVM_MAX_FW_CTRS (32) entries, this triggers an
> array-index-out-of-bounds:
> 
>   UBSAN: array-index-out-of-bounds in arch/riscv/kvm/vcpu_pmu.c:255:37
>   index 65535 is out of range for type 'kvm_fw_event [32]'
> 
> Add a bounds check on fevent_code before accessing the fw_event array,
> returning -EINVAL for invalid event codes.
> 
> Fixes: badc386869e2c ("RISC-V: KVM: Support firmware events")
> Signed-off-by: Jiakai Xu <xujiakai2025@iscas.ac.cn>
> Signed-off-by: Jiakai Xu <jiakaiPeanut@gmail.com>
> ---
>  arch/riscv/kvm/vcpu_pmu.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
> index e873430e596b..c6d42459c2a1 100644
> --- a/arch/riscv/kvm/vcpu_pmu.c
> +++ b/arch/riscv/kvm/vcpu_pmu.c
> @@ -252,6 +252,10 @@ static int pmu_ctr_read(struct kvm_vcpu *vcpu, unsigned long cidx,
>  
>  	if (pmc->cinfo.type == SBI_PMU_CTR_TYPE_FW) {
>  		fevent_code = get_event_code(pmc->event_idx);
> +		if (fevent_code >= SBI_PMU_FW_MAX) {
> +			pr_warn("Invalid firmware event code [%d] for counter [%ld]\n", fevent_code, cidx);

We shouldn't add warnings for these types of things since a guest could
fill the host's log buffer. At most it could be a warn-once, but I think
we should just return the error as quickly as possible. It looks like
there are other pr_warns in the pmu emulation code that should probably
be audited to see if they should be removed or changed to warn-once as
well.

Thanks,
drew

> +			return -EINVAL;
> +		}
>  		pmc->counter_val = kvpmu->fw_event[fevent_code].value;
>  	} else if (pmc->perf_event) {
>  		pmc->counter_val += perf_event_read_value(pmc->perf_event, &enabled, &running);
> -- 
> 2.34.1
> 
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
