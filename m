Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87087C982F0
	for <kvm-riscv@archiver.kernel.org>; Fri, 16 Jan 2026 19:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2KaPMzzi9GxwkVgKICi206tsavuiMseRUy8oLL0rPLk=; b=F/9Q11Gj2JXsk4
	hfSPh7dB2WThCjauawOgcOBoT0w/1LPW6d01Dq9zPqv9YByTEE9YSNOoAcoJ343AuE3Iti19mjcEM
	J1NMhBn1Jyrb8GqksvROGR1zH351Z34ypV55jv1Vd4repv2jne4QMYVfehSgg7f5ox32TVFqRbWkm
	+hBkQCHvb7lWWTQ5cRYjF77c8qADAbLNjqAqsgN/aya+qx6ix2P8x8EmGSrUnVUVGaAHgMubt0v+a
	/VXYTUPE10GK5ew0ZU9GDNf5mAQO2iFGZEwwk6jQsL2hEZ+2xDYvWTaGDjRHXHOGnfiRTV5HGOMv6
	cJWRQ3Atn5ytWwJJ+gSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp6X-0000000EfLy-3tmn;
	Fri, 16 Jan 2026 19:03:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgp6V-0000000EfLG-2NCS
	for kvm-riscv@lists.infradead.org;
	Fri, 16 Jan 2026 19:03:29 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GExm7U914139
	for <kvm-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ctdwtzx4woC6De+DgvE6qX6t
	IJzFb2FXyuR20qfZBEg=; b=LGtcOnPtOR+13bTj4jHF6nGlYrcYhfluq4KC3l/S
	6UOnnPz6682Jwq/EWmZW7agEUTEQL9y/l/PX/3AY7ugCJJZv1Nv+Nkf1HOEIVRNK
	VPWJrH9q5xHOVlCTzIs5XWUMYWhk0iG+QMZdlPRjtaH/H0G6GVd+bKz2O9p6xAWB
	hyMIE2I3yBgJAo3Ot+sE+XHGeVz8BZ3xbwVwb5LcR936uamiROOi5uArxm1Rwy33
	/a+kV+OgDTBk/cGmIw16Bz157nFLcOyn8Z8RU7UzEaqzbMIxJh24EJyUfS9gkUrt
	NeAAhMJWuU3AN0XXa8dchBbWjJ6bl+HRWAC6/YsNZ7CYfw==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqqjurrm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 16 Jan 2026 19:03:26 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7cfd0f67288so4894075a34.3
        for <kvm-riscv@lists.infradead.org>; Fri, 16 Jan 2026 11:03:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768590205; x=1769195005; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ctdwtzx4woC6De+DgvE6qX6tIJzFb2FXyuR20qfZBEg=;
        b=KkF8AJrS/2WTOXmtA8eDK0dEeK1aWHmi6eZviwBA5EkpEx3lo9gzeHhQQcO6kEzGLM
         qW6Fm8iyV+QVzwnyLYZZPLF1xra2P4sD1tmVgPqKsuCfDUuyTZds5ihAr3W0KljoczEC
         cLN2b3IscRBTovSm7mjjKZHWp4qIbOWdInjxx+RTk99bLVUDin7WyW+zIprMphwHqeFz
         cq2hGO8NakEQuIc+zYuW7oVrqQLuoSYpLLQjsvlAtKide+DFMymZuXOaG8RunK2yVEfl
         iJvSa3Cv1LPD6H/DhHAnq/gYxrpiIJyKSkoAWLcX0stC2LIy+Eq1VCcSI2t4xeYhlZW8
         D7fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768590205; x=1769195005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctdwtzx4woC6De+DgvE6qX6tIJzFb2FXyuR20qfZBEg=;
        b=xHKfH39IYsGj3YAvJqFzFLZ9eK8ejkSPaLspOwTrxh3z51qufm2ORGGpNsu03CpPwa
         c1W2D2nFqZir5g6HM2yW8RRrqQtQOQkAuHXx3LGQ8FHqmUqKDEHdaBZ2XABh/RFvaGAs
         sib9tWNa3X0fxqULzkgPl8CdCopKAhrqnytx9I8iN7xfUn8yWSlNmo8nU8W3HU5ZrnJO
         j1V6TQtZ1R6jX06eJk7iFQllIS9KKxrpvUuILjtAZAa99dHrxOdOP6LSRqhcURYAxaaT
         spP0tF4G60a1u0+tJDzCyM8oS3m53jC1FLhpDxBAiS+yAUuGk+NX9brr8Ul/Hqusff43
         9KIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWauhrB+Hlk+3CBmcGnSITrVynhYyKHUpX8TxZowptHIqGC8PTpJ3PdPyQil/FFa6kkbd+48XOgc3s=@lists.infradead.org
X-Gm-Message-State: AOJu0Yys3FxVjt52Rx7j8RYZyW+5EQbu+rRwDvw6ypCel0CfJYE1t/m2
	sYvbW7LJ8qhlAK9P3tjHoOBwzrriVU+0Ayo+yf4WAmCjL8GboW71xcxJ5iDIj5tTH6aksuAAqRx
	Zf3jynIXD/CReKU7jvLdMTwxqJUwGCekTQJbhrsTHDmcPqILD9nOGxPgXw6LmqEsEEjY2
X-Gm-Gg: AY/fxX4F09oLPcbGDPeAyvMJEPG8CzEMpLIEFTQtD+9IfjNQfPhOuHLxthHlsL1+Ra8
	R9bDe5OiCUkfTeGY0m4MCymzdi8yMDUVBsEuM25lD+4qMd9WUZnX6GuU76882EHM5pIKDrefBkT
	wb6nMHZbnhPiJvSW3DcjbEoKph12FcezHq2Hwk419hw4CA4FBdfaEzwA1BFOqn/1eN6Js2Sxvzi
	sUCRoCBPHi0apnqiXZ69ubNro1AkRhaMukn+dSB3xj07C3gLcCpaAhrNdNLeMfqYMINGAfVQsp/
	MoLEp4R85ir4ulrp1lLLTGC59epL24pV46J8+N9qjbB8BmOkdYkXhljnlLX4ip+F81NzUpZvsLf
	BY+pvXS74jJE2kaz3KCc=
X-Received: by 2002:a05:6830:7305:b0:7ca:f1fa:e9d7 with SMTP id 46e09a7af769-7cfe013b1cbmr1708043a34.16.1768590205337;
        Fri, 16 Jan 2026 11:03:25 -0800 (PST)
X-Received: by 2002:a05:6830:7305:b0:7ca:f1fa:e9d7 with SMTP id 46e09a7af769-7cfe013b1cbmr1708026a34.16.1768590204813;
        Fri, 16 Jan 2026 11:03:24 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cfdf0f0137sm2144941a34.12.2026.01.16.11.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 11:03:24 -0800 (PST)
Date: Fri, 16 Jan 2026 13:03:23 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: fangyu.yu@linux.alibaba.com
Cc: pbonzini@redhat.com, corbet@lwn.net, anup@brainfault.org,
        atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com,
        aou@eecs.berkeley.edu, alex@ghiti.fr, guoren@kernel.org,
        ajones@ventanamicro.com, rkrcmar@ventanamicro.com,
        linux-doc@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: KVM: add KVM_CAP_RISCV_SET_HGATP_MODE
Message-ID: <6txqxrkyqh4afmked4hdi6qekkqrb54ar3q5upz3ennnuaktsi@dtoarqt7e26t>
References: <20260105143232.76715-1-fangyu.yu@linux.alibaba.com>
 <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105143232.76715-3-fangyu.yu@linux.alibaba.com>
X-Proofpoint-ORIG-GUID: 8IHmZQhOK_yupT3lVRUUQufshMuZvJfF
X-Proofpoint-GUID: 8IHmZQhOK_yupT3lVRUUQufshMuZvJfF
X-Authority-Analysis: v=2.4 cv=atu/yCZV c=1 sm=1 tr=0 ts=696a8b7e cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=JfrnYn6hAAAA:8 a=SRrdq9N9AAAA:8
 a=y9tgS1qgbWeIrQugNAQA:9 a=CjuIK1q_8ugA:10 a=EyFUmsFV_t8cxB2kMr4A:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE0MSBTYWx0ZWRfX0/U5mxKzvTmv
 YJLfWd6p50BfgZYnzUJg8oPd+n9dPbKVYI7PoO9eH8+1ALLIJfpBfnS9sHUDdOY8U//qoDYkgsh
 97vuKonDGyqQAnacJWzFUhDGa9GSTchu65GXiY5eP4t+Qot5qnql/QzasPO2CmLw486LJEMwVvJ
 UMnaJojsxEEOTsxqbjFyTvhm2Ui8ieLPB4o8VLNuh9jGHtwCuCPg5gCyAf1E9uQKOiBqdd/nQdF
 PEwdjPOjBA9XqxdLGMIPHm3CgAyV1F0g/TXY3YD2Jxp14QM80SZdYbkloBwgfW4BOwe8l1m/pj7
 Mtdb8KRB1XrMbpAgCOezKzK9P+uCuir7eH5+fHpfS64SVXR8+uNTItspCUtCoAgrKhMsEb6pYbi
 0w3i17ZRSqI3QrNxiObUtosxWlC4ZJVSmdlhk8KNpC8mB79nBr41NJpuo98ysRgOse+cSTlNLla
 zMPBCDwR9XSOGjOjl3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_07,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160141
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_110327_727304_4428E44B 
X-CRM114-Status: GOOD (  19.16  )
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

On Mon, Jan 05, 2026 at 10:32:32PM +0800, fangyu.yu@linux.alibaba.com wrote:
...
> +	case KVM_CAP_RISCV_SET_HGATP_MODE:
> +#ifdef CONFIG_64BIT
> +		if (cap->args[0] < HGATP_MODE_SV39X4 ||
> +			cap->args[0] > kvm_riscv_gstage_max_mode)
> +			return -EINVAL;
> +		if (kvm->arch.gstage_mode_initialized)
> +			return 0;
> +		kvm->arch.gstage_mode_initialized = true;
> +		kvm->arch.kvm_riscv_gstage_mode = cap->args[0];
> +		kvm->arch.kvm_riscv_gstage_pgd_levels = 3 +
> +		    kvm->arch.kvm_riscv_gstage_mode - HGATP_MODE_SV39X4;
> +		kvm_info("using SV%lluX4 G-stage page table format\n",
> +			39 + (cap->args[0] - HGATP_MODE_SV39X4) * 9);

I don't think we want this kvm_info line, particularly if it doesn't also
include a VM ID in some form to allow readers to know which VM is using
the selected format. Let's either drop it or change it to kvm_debug and
include a VM ID.

Thanks,
drew

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
> 
> -- 
> kvm-riscv mailing list
> kvm-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kvm-riscv

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
