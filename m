Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8CE4CD98C7
	for <kvm-riscv@archiver.kernel.org>; Thu, 11 Jun 2026 20:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=guLaMx/PB7252H4abfSt3e+r7seM9JkoBuXN2JmmNHY=; b=fh47qOt7ZNaYxD
	t6fJcvVAdtKGckI4qek65JPJ2ZczKc6PmgVi6Q2ey9TfnJ2iukXhe22I+5Qc72l+ccw9KInk5byaY
	5gIyKseHRpSQIrVhYlySAtIzK621bo1leUxHeTg36VN6Sy38w2BI7qMy9RuSZYI5se5r6Qpio0jlE
	HqNpDdabqwPu/mtnWxl6BdYkGaItdHBc6HqTgScjlYm+2Xltd0xlKw6TDvX4oLztkBRAWiidPERul
	7dP6lpWaA7xi3O/kGIoqs39hLEWdO3jU8lTW2riyjla81u9GTIIAJCnShQmaX3zw6MTPzOpdyuxeH
	tTurwNT8yajZ8BEi+KjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmLw-0000000A4CK-1Bb6;
	Thu, 11 Jun 2026 20:50:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXmLs-0000000A4BX-39VM
	for kvm-riscv@lists.infradead.org;
	Thu, 11 Jun 2026 20:50:15 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65BJ3PiA1510640
	for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 20:50:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7U12GqzKZ3dJsiu7QWLZpQE1
	HJAiLvJ1NIcLGrlb2b8=; b=b33fGFdmUmHrcWlfymGF3o/dulCmz3LRdm9ooGYr
	A74OgzAgDg/YYlewa5wd14Nlzi8BIlGZdEwQLu8DshZF2rFrVdHDjT79f50f+TrP
	6CbQOBykIMAXFDZTspCj7K/q8nPzO5C6xm2zOkOOttY8Ocny8Nv5Ng1PcefMWFHC
	Gb/Mk2sY4arsQ2Ky7NAQcahmI9qHgIhxy1jq4sCwmo58UWIXkNtFkeUwbd94VwL/
	nbuQRkMk+0/Wx/2RWCDCRUuYaa7NoIqiBSN4XSvQckfGYI1dhYmxEhusqZFO3tat
	ryxAxSA5vJsmH18JS/KiFRlhXVzh8vv1ZUqwq9/8xFcEzg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4er2u40bw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 20:50:10 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304dd917645so599986eec.1
        for <kvm-riscv@lists.infradead.org>; Thu, 11 Jun 2026 13:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781211010; x=1781815810; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=bsz9bfyJ3u5NMlTf1csIBzjc31zPs4NN0fqC/WO3ujM/TlRv8kksGGQ5NwgiVV1bXW
         tijzcr5bIaFyPaEIOnNxi2nNMZJKaAKzM+pl0+EH3emeWR3DEMtgvOPoCrAipoMC498H
         kEvptadvP98fZ3YmOwp0nIfjtA7GJdbqwIArQvLuau8WQ+3r5L8zmaGwNWyqq/DSWlis
         k/BNi7oaMYUtBKFPwH4WS8TMYo2j4tdFVMkqVjkFPDHLS6b58ej7DTn0vjOXW0UDsmYB
         vGilaLvn4Ro5yTeEOR10rUsqHVScWiaeKCbsdEgh0Pj9FZeyT0C8w3uyUhgINLyffBlT
         2zDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781211010; x=1781815810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U12GqzKZ3dJsiu7QWLZpQE1HJAiLvJ1NIcLGrlb2b8=;
        b=Zgb1EmAYqFQ4VX+rB8gmG9O15kE7hIkZU+PRlxRv0xJ5g0/onvsGa/OXrIwk+OHdxz
         9ftwdlFEnUoXFlH2jAPYH1eD0lRCDTSCI/WucoD3Lg8UNDYNCniDGdsqB48jtFE2C38u
         nfKek4h9lLrnvhH2ZWO7wdw26poUONa9ESf64Cgq0d5vA9Kve2Nfcv9+VdoasrRwNr5g
         WAFG/AiCr8SWkUloo0r+jYVs3BCVvS1qKDT/Zae40WQPQmADxE5Ok7JLXMj5uY/sG8O5
         YCBV71T8KBZui076r7is7bvKBG88uR5EGJdGo83+2QpsEBkri7QgNFRlbxGRIBlFI1tk
         scdw==
X-Forwarded-Encrypted: i=1; AFNElJ/bomAAikjw81RKY9Os+vKruxT0bqHLik64UZuIsXdpr/+HfaKDkXyyqBX8VVTsThI3uWmeF+zEbh4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyDIzlUpRZGXVqzokjrBq2jVa93GfJqQ3d5UZgLygwdrgnLYW+S
	SnBdLveKLa008ZldkxvvkF6oqSoL+q0bKaFUJ+KWkmiiPaGITHvvT+yu+KmcK7t8sWMj0CZd4bR
	bwgF1dH27/sS/jMMMVz3Yvx34fIKrxstQmPGJoSAtTl+HgL8jjGCQS9ogfXBHLZmSZVeL
X-Gm-Gg: Acq92OGBekJ/YHy7gUxlCsoYVzitqV04DBQcC2q6W6Qhi1d6lEuZbD+EtZ7hqIM3yXa
	MGxcLt8lHe5rRaFJRrp7F40f2mJ8EKMdqvCXdt9R2nTGOytocwznTnMtxdhM+OJZgrfx3SAceBL
	A82S/O6l1+GMubAw7H0Cxr/RT31o8nFYTwGluym4p9Z4yWXwJxm6EL8DHad5F7ZNPCGB2D0EeBC
	pqa8JEvL2sz4oR8wCqBszpDZcsDXe/Y2Yz72WKjfICjg7Ghph4EZX1/ngmdarU+UiCiqfDfbIQg
	XODjCH60dbrt6vLhFQX7eRy3xPof13y1qGk+FYXVc8z/Pd7SxaxnPfSmppMRc4icpJDp2xbSriI
	mv5+mLJTJRZxIbEo/3FLLvVo4g2Etzw==
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430152eec.11.1781211009842;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
X-Received: by 2002:a05:7300:1481:b0:2d9:6373:ad0a with SMTP id 5a478bee46e88-308047729dcmr3430111eec.11.1781211009350;
        Thu, 11 Jun 2026 13:50:09 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081ea4fe55sm303031eec.25.2026.06.11.13.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 13:50:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 15:50:07 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>,
        Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>, linux-doc@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
        spacemit@lists.linux.dev, sophgo@lists.linux.dev,
        linux-kselftest@vger.kernel.org, Palmer Dabbelt <palmer@sifive.com>,
        Qingwei Hu <qingwei.hu@bytedance.com>
Subject: Re: [PATCH v4 09/16] riscv: Add Zic64b to cpufeature and hwprobe
Message-ID: <uttb7qknse5hk6suato3nelqatkrkoyo7r342pqay4wh6vyr4x@xestyyhoygtn>
References: <20260611-rva23u64-hwprobe-v2-v4-0-3f01a2449488@gmail.com>
 <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260611-rva23u64-hwprobe-v2-v4-9-3f01a2449488@gmail.com>
X-Proofpoint-GUID: 3ftR_ns7vQ50BPPKXJCKE8sxKDhkCzBb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfX095RQB6ekeaK
 6HtNKxQICApM4o3DC6dJ27C6WJeKfSB2nQtkUzMdjVTvsWoXSNDITx7Bu8bvC1ltBRIu3uEpw1D
 6UBTJoPqNKbCATdgho5/VKEsp+OSsF0=
X-Proofpoint-ORIG-GUID: 3ftR_ns7vQ50BPPKXJCKE8sxKDhkCzBb
X-Authority-Analysis: v=2.4 cv=N94Z0W9B c=1 sm=1 tr=0 ts=6a2b1f82 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=HwFc7jivAAAA:8 a=968KyxNXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=acXkj6VtvC73PAOtBy8A:9 a=CjuIK1q_8ugA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=kr7TZk85JJIQSqC0cl8G:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDIwOSBTYWx0ZWRfXzyt/y3/xYDk9
 J/ISmilKPl4Ad5FWRoHAqj0PRK3THsKDYFJCuyIQHN8jLWxPxIHN7qPDhVfUsSaG5UgvFMfsM57
 J6lEoxlw3o/ZbXIrO9YgjdaYiDx9McpLvTdepgzyjlwstEWwwxC1c8BLJr2VkQflRHFTfhgSjRq
 4x1dmQo7ok4WsG4NVcWPqnDILX2j8Vfnw27f5QR+6Eckv1DaYoahAmahpgiUnnzRi+7PJSBN0Ow
 rIU2tz/EFoV5gukMZwTI3Bz3XVNLZtZeFEUQVytMETrx7SmG+IVYxwxavXoIWyVGeGPeZOspw1a
 xSg3BmIvGBuEhWrlTaAP0JxJ51R2vWQCyiG3nXiDXCaFRd2Ib3spibxDs/yaBOMQrvNaq8s/q+S
 MDJLDbbNSJGJd4wyYha6PP7O/ZORoJqiUe15vpgU9nY0ABz00+xf6kyKOtVxl/Afci7+DWnOsSa
 RfY5aZ5ljHi8SF2Dtsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_04,2026-06-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_135012_914403_3EEE5BC2 
X-CRM114-Status: GOOD (  19.19  )
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

On Thu, Jun 11, 2026 at 04:12:46PM -0400, Guodong Xu wrote:
> From: Qingwei Hu <qingwei.hu@bytedance.com>
> 
> Zic64b mandates 64-byte naturally aligned cache blocks and is a
> mandatory extension of the RVA22 and RVA23 profiles.  Allocate a
> RISCV_ISA_EXT_ZIC64B id, parse "zic64b" from the ISA string with a
> validate callback that requires each cbom/cbop/cboz cache block size to
> be 64 bytes when it is present, and export it through hwprobe.
> 
> Link: https://lists.riscv.org/g/tech-unprivileged/topic/question_about_zic64b_and/119631059
> Signed-off-by: Qingwei Hu <qingwei.hu@bytedance.com>
> Co-developed-by: Guodong Xu <docular.xu@gmail.com>
> Signed-off-by: Guodong Xu <docular.xu@gmail.com>
> ---
> v4:
> - Credit Qingwei Hu's earlier Zic64b cpufeature patch: set him as
>   author, with Co-developed-by (Guodong Xu).
> - Validate only the cbom/cbop/cboz block sizes that are present; Zic64b
>   does not imply the CMO extensions (Conor, Qingwei, Greg).
> - Add a Link: to Greg's confirmation on the tech-unprivileged list.
> - Add the missing blank line before the ZIC64B hwprobe.rst entry
>   (Andrew).
> - Did not carry Andrew Jones's v3 Reviewed-by: the validation was
>   rewritten (present block sizes only) and the patch is now authored by
>   Qingwei, so it warrants a fresh review.
> v3: New patch.
> ---
>  Documentation/arch/riscv/hwprobe.rst  |  4 ++++
>  arch/riscv/include/asm/hwcap.h        |  1 +
>  arch/riscv/include/uapi/asm/hwprobe.h |  1 +
>  arch/riscv/kernel/cpufeature.c        | 19 +++++++++++++++++++
>  arch/riscv/kernel/sys_hwprobe.c       |  1 +
>  5 files changed, 26 insertions(+)
>

Reviewed-by: Andrew Jones <andrew.jones@oss.qualcomm.com>

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
