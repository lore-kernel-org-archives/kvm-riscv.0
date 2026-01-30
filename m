Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FDAAE6BF39
	for <kvm-riscv@archiver.kernel.org>; Fri, 30 Jan 2026 20:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUMYKOZxi1WYnWhR38s7mZSCr3zjCMIKyuHfs80YUQ8=; b=cW1STLFJihmIl2
	U1fnsOtf6h3iY7TNcHcckHv4zg8LnFittRcmt06/SIkn+fp+I3K9EnZTFYRAA2rZfaTtwZeZeVU7b
	wlK69RA3hSrQVq4XHOjhnzYosyzACjsOj29vJHN8yNv+eVE7gronU7v6HwY6O6Nhf4zuBi0S0c5cw
	vsuLHYP3H3Y8hDe8kfL7YZ0mKDr482TefTG88B1HxbGvyJLwX/E5saU6UwablWX2GVWsZ5KsjuRgg
	uKVz79bGcR7EEo2LXU2vO6jNphvN34OGctT4j16WgnXSApHXgxzoGqPjYq7Wn2Tax5T4ptdBAi2FC
	3zuXg2jLZjNkjwpn4l0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvPU-00000001xIl-2nyy;
	Fri, 30 Jan 2026 20:48:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlvPR-00000001xHV-29VJ
	for kvm-riscv@lists.infradead.org;
	Fri, 30 Jan 2026 20:48:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UCV7IU2295334
	for <kvm-riscv@lists.infradead.org>; Fri, 30 Jan 2026 20:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nX+GGcv58sT3+6A/ukn6uGr+
	PmhTbKUYkNYsXb8LOA0=; b=dXGSsY+hqRrbv8uy3gXwlzkQquz4q7A/7+sVeh3e
	nX8WJvsbcVFnGDcZJIj7ud6qWqx7iABDzrIi1nv3BefikVOd5wkvFYNVHTrgecLe
	Ctwfl6nZorKuaOpWe+sDzuuuwry9hcKsV4VcP7IDLus1gyXpciZ/heo61UvnC7Vb
	yAJ8rkTnnD+GMitvFkFG5RJotv11bKlIZDak4/6SCXN3Y6a/eSgi5vFkIl6yYC1B
	LOubGkAHI12SZrGeu9/C+Pex1I5qpasESHiysC7RzAGuUCAw3CRRGmUQVDfIYYcw
	asaJh2+/uNgLcistcwBM1jMCPqk8EORuWQm/RmWIVDk2QA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0p1xasba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 30 Jan 2026 20:48:04 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2b6b9c1249fso4053645eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 30 Jan 2026 12:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769806083; x=1770410883; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nX+GGcv58sT3+6A/ukn6uGr+PmhTbKUYkNYsXb8LOA0=;
        b=WMIRjqc2cVBzUV0O3caRT7JfRLZ9FlOab25OhCCbLkaK1XajYirq881NhyrBtu7rf8
         zlWM61H8qE+u1C8FqvAIelrLRzLQy2rBk4qjaNMaS9cPAFNIzRNIBpC+6cVvXoNonPnm
         hu9ckCBlovsYvJTOCgNFkG1nk8f8uh898YR5/cj2Gxebeby/WcIIBhLik5MdCm+5vQqK
         NhQwwYuo5OYqru/oq30dUqPb8K+bwRCutG0Er4KGQo+nNd0cYTBGtmjW0irMwxWgqb2e
         8nhm/g7cSzAQ4Jd7PaylJT/ETtb9YNxokMSMcRvOLfMo6Aghrrec1WF40WV3GZAwE+NL
         MtBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769806083; x=1770410883;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nX+GGcv58sT3+6A/ukn6uGr+PmhTbKUYkNYsXb8LOA0=;
        b=JcJXzTefrumH17OY7S9VV9Xh7trrFt1V5riYPpDo8jagxIFIC4qzIRgvKeAyfQrlSC
         QYX8lOrjmnzqmyMJ+4cv08wfUK4A4gAmyT7a73VgElUnNX2KPMwUnEF9wpzC6CK6MCMg
         kkN9cImGpFIDMmOzalPl3v8NBOPSKAEc9kyNe0GgRcH7qqbY7LZY6omJi02k0IwDNtS1
         iXx1FRW9CfdQVoUXjuhzl+RWGK3LLiwBalhUkW8oadmB979pCoedvRuMNGNCYgXNAOXA
         n6np/dTUz97cJvJZwTCtLhrb34TRfRm/0wa0gr/pAD6xNHFCvaQrYyu8/vJIBabJ1wYl
         njYA==
X-Forwarded-Encrypted: i=1; AJvYcCW1k75YjHdDSlDMpH2DdOlulSH6G+kdt1HdfOBCyZUTpF4y8HlCbhbsMkffXvjfV1Phv2lEODqkZ84=@lists.infradead.org
X-Gm-Message-State: AOJu0YzOkw0skU7jMxLGEWbR35aRPmKL5jLTfaTsxIBkKZvqhOjDHUt7
	TR7TktDKx/TRbpiFzvtp4AmRiUFf8FXOe1QGiwyZ3DCCmEJ1D9BptRmiVf1WfrrfYACC5c9q9ZJ
	+WzGzp4vv5eaTMX0gbNkSiTlSsFn6sQMvsrjuvz9gglRb2B1TjgOwh2fgmU+Wj9Qgmiss
X-Gm-Gg: AZuq6aJp6uHRP/UcJ8UGZoEGjwFLTF9DhS9h1MbjAnT8rGDbnMa8hlUjsv7TQz6kZYl
	eHPH9/tLmw8huhU4T4AgqdYD/2xIzSBxZt1ykBN3woSksJtcYUw5r5wZ5o9C6DZGZ0WPPoHUobI
	elzZceljK12bY1Tu5JXdQmCl8uv9VN1r7EtIQ9CrDaD/zub+lgVx0KHvjFsnhzD9P/ht70rE6TM
	KyVYqPCPxzNwYK5Ux40FzoGKmwJWL97aM3qOZl1zJnR3Q3v9hOTwGLiQnfsu5KacXYz5fePOpG0
	LR5tLcvbl6RPouoEcwg25k7A2VGSeju6EsRmpYM+Metme8irdhAJz3lQjJa5CyA+i0phEIrA3E1
	adhjQVm8JB4JoHuD4TQc=
X-Received: by 2002:a05:7300:4302:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2b7c863300amr2186695eec.4.1769806082985;
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
X-Received: by 2002:a05:7300:4302:b0:2b7:1d38:3596 with SMTP id 5a478bee46e88-2b7c863300amr2186680eec.4.1769806082432;
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9d6b906sm12831536c88.4.2026.01.30.12.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jan 2026 12:48:02 -0800 (PST)
Date: Fri, 30 Jan 2026 14:48:00 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <jiakaipeanut@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
        Atish Patra <atish.patra@linux.dev>, Anup Patel <anup@brainfault.org>,
        Jiakai Xu <xujiakai2025@iscas.ac.cn>
Subject: Re: [PATCH] RISC-V: KVM: Validate SBI STA shmem alignment in
 kvm_sbi_ext_sta_set_reg
Message-ID: <ydibz63oh6tj66utjlemeikxg7iateqoox3bwg7r4pdvbwijoj@5zxhlhesvv2t>
References: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260124022042.2168136-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-GUID: 7fanpCVNqUmB8oFbzHh8VYhPN7CJfNr0
X-Proofpoint-ORIG-GUID: 7fanpCVNqUmB8oFbzHh8VYhPN7CJfNr0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDE3MSBTYWx0ZWRfX+8Njd7DPZiKa
 iL3XZDCPPn2+nYfS2C+lvhjPcMCfLOxXz7XwC4Wp6oUPB8VDl5fzlQaaAMU0tJYD4CRo/34VS7S
 b70+2+TuoD5+rHsIn/CaRbCCEHf24I18ng/RBVayd5SpR5Krxf+4P1Ohw2xwDAhAW01pyOVAfGs
 uusG28bqeAlll+3etaNi1JefcsV5dg8+nekPL19IyaVVwmnneB9AWWMWpmE+y9YC+nh2+vdPVKt
 lmc1xDbKeKnGfYzon8B4jImC9IdAbT1qwsDn9lpUx3tmb11/8v1KqVamZ/pDC36OFNDvfItDA/V
 ntf3Rnsh+Z2xLG3iL/9ALm5RqB+3RdA/j2WHzb4Lrw101KcWZ/Jn8dMYZy2fuLe9fot4trlX+nj
 MtPa8QAgtkH0VlGVgOg6R8zLE9tM0W6tSGWBwB0X8Re4sv8XAczO8UAcdqqFf0Ac8r66JKbY+0o
 zGS2GP3yt9YuzmQlphw==
X-Authority-Analysis: v=2.4 cv=G5cR0tk5 c=1 sm=1 tr=0 ts=697d1904 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=ZDiY3XfEgKCrtrtHt9QA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_124805_672306_11EB3AE3 
X-CRM114-Status: GOOD (  18.96  )
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

On Sat, Jan 24, 2026 at 02:20:42AM +0000, Jiakai Xu wrote:
...
> diff --git a/arch/riscv/kvm/vcpu_sbi_sta.c b/arch/riscv/kvm/vcpu_sbi_sta.c
> index afa0545c3bcfc..7dfe671c42eaa 100644
> --- a/arch/riscv/kvm/vcpu_sbi_sta.c
> +++ b/arch/riscv/kvm/vcpu_sbi_sta.c
> @@ -186,23 +186,25 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  		return -EINVAL;
>  	value = *(const unsigned long *)reg_val;
>  
> +	gpa_t new_shmem = vcpu->arch.sta.shmem;

Please declare new_shmem at the top of the function and there's no
need to initialize it to vcpu->arch.sta.shmem. Actually it appears you
meant to initialize it to NULL, based on the 'if (new_shmem ...)' check
below.

> +
>  	switch (reg_num) {
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_lo):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t hi = upper_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = value;
> -			vcpu->arch.sta.shmem |= hi << 32;
> +			new_shmem = value;
> +			new_shmem |= hi << 32;
>  		} else {
> -			vcpu->arch.sta.shmem = value;
> +			new_shmem = value;
>  		}
>  		break;
>  	case KVM_REG_RISCV_SBI_STA_REG(shmem_hi):
>  		if (IS_ENABLED(CONFIG_32BIT)) {
>  			gpa_t lo = lower_32_bits(vcpu->arch.sta.shmem);
>  
> -			vcpu->arch.sta.shmem = ((gpa_t)value << 32);
> -			vcpu->arch.sta.shmem |= lo;
> +			new_shmem = ((gpa_t)value << 32);
> +			new_shmem |= lo;
>  		} else if (value != 0) {
>  			return -EINVAL;
>  		}
> @@ -210,7 +212,10 @@ static int kvm_sbi_ext_sta_set_reg(struct kvm_vcpu *vcpu, unsigned long reg_num,
>  	default:
>  		return -ENOENT;
>  	}

Please add a blank line here.

> +	if (new_shmem && !IS_ALIGNED(new_shmem, 64))
> +		return -EINVAL;
>  
> +	vcpu->arch.sta.shmem = new_shmem;

And another blank line here.

>  	return 0;
>  }
>  
> -- 
> 2.34.1
>

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
