Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EDCCD6E4A
	for <kvm-riscv@archiver.kernel.org>; Thu,  4 Jun 2026 16:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyP6BmogAUAZAI2sNFPEIfL9WYuIeYNRDVuP/X4Oz88=; b=piD+59Lzus5UFw
	TWrcnaL77DGNKIxyrHjsELXCnEvSKsRdyMOgM8N1aq5szcaAXaHJneCIgRqRobE3rkCs/oJpMKyho
	3oQ0aDp2OunAyc8rT8ZMKj8SuaLZTMjFHgsi3sEMmgxC9cM69KMFyDP7JmSI7VFMeWXutTq2NmyUd
	+OO24NcYUe+0gKXfepzgLTLsRXE7slEtc9aRriP4O6JW6Ck+A04gzy+tJfT45/i7l7bU/jlezbqE4
	+DH0KMSRQNJ1Kwj2KRngNwrHhSLvKkh6+4wrURl+ifqMlFzqg6cI0hnnd0e9DqBA79074DkmQ1v0Z
	dejpqW28cRZQEvy3YZ1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAXm-0000000H25F-0EjD;
	Thu, 04 Jun 2026 16:03:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVAXl-0000000H24n-0CuY
	for kvm-riscv@bombadil.infradead.org;
	Thu, 04 Jun 2026 16:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=; b=oP4GYmiiT+2jJLSczN8H2W1KLu
	D4LITmg3A4gR/BvU0i4llSMORu7RU6cfYB2XUUT4VtfLLRh2bzbr7y/TiFsCoD2a/5PxNPIDgW39k
	Q3Xzy/tqKivuHqYwGD/at/VPpulstAKWvLUbcYWgGHfKYhZaBCi4W49fmkWghm9jMWkeMDGBQpxaQ
	jLkBV+Sd9gWJIpXe1ERxCzCmFVzY4pKepfpgoh+w+DQ4oCcQYGbvogMGd+39at7iFEK1y77rxMd91
	AbmGcU/YPB6BAhxlHAAoAfYzkxaNjxTXIiiem/sRMSzi5TZjkVpMrFfNofEu8RSqc3Uu3x+YqfWhf
	USWajkjg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wVAXg-0000000EY6e-2Xbm
	for kvm-riscv@lists.infradead.org;
	Thu, 04 Jun 2026 16:03:39 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654EFl331132186
	for <kvm-riscv@lists.infradead.org>; Thu, 4 Jun 2026 16:03:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8T3I1JSi6bPzTWMglkCJmeKM
	pAKkFgJd3nlCAFBxxjI=; b=R57WYhlKJl3K8bFUdl58ZqjkhTtCV46ZT5QO6j0A
	Kddjcmp6YEGcd8WIruVAt0ZMvC+hOWwkGsLEYz7Yb32W3tRSjhQMXgZc94DdG/6u
	YU3sFnnQtRqKdtqQjus9VHxy5Ee7e1r+jsPLX0pbfzq5ydcL/dpmaF0z9cdGphrJ
	/WYa44pwTb1IiQegKIZ9sqhZSST8w2Iiz/tW0BAkpcmqQsPp61iSH/YrPG4o0pxF
	PHXOOSiUGCCBEuyEbblKvDPdgi5d/iDCJwe1OMDiZjxZ7Cg1LrZfd6m3m8FpJylJ
	7poDjZlZipbJF3WIo4ECfDqr2LrUdd2XCKi/I3p96YyXYw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek5wshv6a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 16:03:34 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-6cfd65ab97aso1437366137.1
        for <kvm-riscv@lists.infradead.org>; Thu, 04 Jun 2026 09:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780589014; x=1781193814; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=TsBpb91k6a5UJwQCPc90iYo+wMTCqoRkMF5QyDVb1lXT/pkrHwPx70d8E9A18S8ux+
         0D7/ArUGr2KXeP64tNoh+HZshmqupVfEsaGfROXnsRD0XyTlzj7i7/NUf6uyXPsp5xCf
         7Hch8UfGIUFZaQKCTRwwhgGCF8tkh6chdGQVzGzrWht/WMTpywPUmeAYTxkrODqRALxi
         MVxDt+/QaSojY0u3NFvCiWconBoGz8htW8Q+UfYAs1dlZsBeky8OKGa+ePO22peq3Woo
         TiqPWoseaemn8bG0m28MEsINT9vEdVgSx9RgN+AeVEzkgSZ4fyfjXv5PkUm+Cv9QINmG
         7yhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780589014; x=1781193814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T3I1JSi6bPzTWMglkCJmeKMpAKkFgJd3nlCAFBxxjI=;
        b=WAxMb2UumFIalr74YsUf+sVXW952ZGdhRJU4W3w0u7X1Xb5QkZ0mJ7gkAbkzBPeGps
         0/toiDik2bVMNbM8+camg0YpVNFEW3lvd5aA1ROwZ4KLioYGG8Kenn1O9vFwqP9VS+kR
         i2TDWRgzlJ/2TX3lyyzKZsCVGaRAldveBLaZ4vHOwgFUJONR+hJSDDB5TPeCo+RAGtlr
         vnqpD4Qgn5icdxXzPr/DMmmeGIHeoPHYhvPdIT/hKkKaWUFsPPEFY/88g5ayUfPBsURt
         XXxINLAMVX7K+MbMyiP+jKKcCCbMBLTmWYJklQ0D/S051vXaKmoeU5Aatc7yUXYs0GEm
         brTA==
X-Forwarded-Encrypted: i=1; AFNElJ/Ck6sU0A0KCsAt4xapky4tPg5gkVxHgkShsVXe6Oa3sa7HyOIGd5hZsbxFUG9B4+UOcBVDL7kWL7U=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYy4yvN+YHoLs+LoN8VAxO25FPNsvTtGw3C+H1ar7UN9Q9U7yn
	884u06W3OYkPTT3BUeiyJDVh/C+Gfq6KaKch4i0xdAICNmGw0tR9XiYiIxE95EMTFcLbLGZexBR
	1iXxRYTTZfKrI6VqedJXxT7bq26Py00O69f4U+IqO5PfW1VplOyw/ZIuhUfpAA6iHn/qqwq7EL2
	Y2
X-Gm-Gg: Acq92OETQR39aLwiB0AzjHHtoFV0E/4dYi2uxOOK/Yxrk6DrqGV3FHoIwDaP5Xa4D6K
	Xop6yOWtsG+7TEaMpA3MOaKK7c1gzP6uEzybYEHyP/vuSmfPbqvGdE1m069dB5BbU0DH1Hn1ZjM
	E1r/aNY73wDVbEtUshoFtBmQ8M/GZaeOTPplK6CoSjSN70SM0pFPq0WDaqeCzno8BRCE1gIFPeo
	/8WzGOaeUtgaAeYiL+vSPZimIMxRcCkMyybukP+oCHx/c3qIdLVHCC6MDTrHVV9OQIa9Im39K00
	Xi4hfUYVsvuFJjfs1e8r5z9LpFrcwOsmlp6KE87K6/wLBlOfqtrVSx/gI9thLm/w/lHJ0dwwVYv
	A6Z7Aa0/lHUGCXBaAHMVa/fUml+i32khKODyfhy1Dew==
X-Received: by 2002:a05:6102:a47:b0:631:44d9:2ca2 with SMTP id ada2fe7eead31-6ec4e2917bcmr5951850137.30.1780589013462;
        Thu, 04 Jun 2026 09:03:33 -0700 (PDT)
X-Received: by 2002:a05:7301:100c:b0:304:4f23:4466 with SMTP id 5a478bee46e88-3074faa488dmr4046204eec.15.1780589001468;
        Thu, 04 Jun 2026 09:03:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db55f60sm6911110eec.6.2026.06.04.09.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 09:03:20 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:03:19 -0500
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
        Inochi Amaoto <inochiama@gmail.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Shuah Khan <shuah@kernel.org>, Christian Brauner <brauner@kernel.org>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>,
        devicetree@vger.kernel.org, spacemit@lists.linux.dev,
        sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org,
        Charles Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Jesse Taube <jesse@rivosinc.com>, Andy Chiu <andybnac@gmail.com>
Subject: Re: [PATCH v3 00/15] riscv: hwprobe: Expose RVA23U64 base behavior
Message-ID: <dyafwgy6wgahizpld2vfuk56nzhueh727u6vzblmasmw24vb23@uw46cc5sxpb2>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
X-Proofpoint-GUID: N8OTNgpLgDt0s_2PyXRGDWXgCHB1s4qE
X-Proofpoint-ORIG-GUID: N8OTNgpLgDt0s_2PyXRGDWXgCHB1s4qE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDE1NyBTYWx0ZWRfXxFVi8Gy7j4Hl
 FsTS2sO3CesNoa0JAWyCJ1WZvwjML41Yw+N6B9wwKDEugutvFKZ4d56s6XjgmT9/CYRWpi/4k/5
 vpTbUpRSy5pHALVeJAz1avMtsZ2XXUFWdaRZJYJzmtku0FGjPTTpIgpFxNdvfyvm7iajY0EaSSc
 B5UbDh36uBaZ3scj676L3G4wb5/wnCNqBOw8cPvpSYNLM8WXESdudDiVqBAFrNPc7a6L5B0DLJ3
 nWKaFn9BpqIiFg7qjeeCgGv+fA59yXZKqJrMDi6XOa52/Q27nWUm/5Z19Mx2seShXh+lyu3DhIM
 TXIsDPCHjFIAQwGaAUX0jNOOmNCUyqj7QG2NU8NCMxEWbBhmoDkagO8IMLgiL5gQbBww47tS/E9
 2eIUKmF8EbZb9IY7LrBe/eBvq1aSaHr0OrUy1JrQnl07MGXJPMN/eB87m44XwTctJZ9wdcjUd6h
 6D5FWeONvz7lmLoCxnA==
X-Authority-Analysis: v=2.4 cv=POc/P/qC c=1 sm=1 tr=0 ts=6a21a1d6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bmEhWVV90QwrJAxICpMA:9 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606040157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_170336_925589_E20AD69D 
X-CRM114-Status: GOOD (  15.27  )
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

On Wed, Jun 03, 2026 at 07:11:55AM -0400, Guodong Xu wrote:
> This series builds on Andrew Jones's earlier RFC [1]. It lets
> userspace check for RVA23U64 conformance in one call, instead of
> walking hwprobe + prctl across every mandatory extension.
> 
> The series adds a small framework that resolves profile-class
> bases (IMA and RVA23U64) from the kernel's ISA extension bitmap at
> init time, and surfaces the result through both /proc/cpuinfo and
> hwprobe. Later patches can add RVA23S64, and backward RVA22 / RVA20
> detection, to riscv_set_isa_bases() without changes to the
> surrounding code.
>

Hi Guodong,

The series looks good to me. Thanks a lot for picking up this work!

drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
