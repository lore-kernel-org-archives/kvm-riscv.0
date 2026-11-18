Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BE606A32F
	for <kvm-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 20:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Vjd6fb/5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPXpFQzU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3rH5ta5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:To:Cc:
	Subject:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=sqU7EmOOj7lnqFDPFVPtHnIoPKnKtuXfVme+Uh6gCLM=; b=Vjd6fb/5j2GvntPQ9ydf6DqCIY
	j8+mwavoTg3ZhqbC6jRU8d2D1uegzvn4eXrFTVD7ZAhHE+o214KuPySRlyZRAaqXYiK19b+SyT53i
	mZ48rxoNHEyaqpDEa8dL9ZM9nMmOX1Z4kaWcboiOwS+PlRbeGsOWufrLSx47I00QhemapwojisVHV
	WhKjnjY6RPPMqTVj0rmi1o7rTeJZgYRzIX/qDJvg/dQDK0E7kY8O3ABVIU2VNZMd37JhkgaIBmFEs
	nR/M6nP8XlOtZsOu8BQ4Onm2WCfgy+n8kVGRGAwZadBoEBteqvD5n7xY5/o4t27/Ty9mXyckvvVVo
	RGNNMFCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlyj-0000000ABoa-1Vdu;
	Wed, 18 Nov 2026 20:10:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTlyh-0000000ABm0-0pYs
	for kvm-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 20:10:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIJM37p2732918
	for <kvm-riscv@lists.infradead.org>; Wed, 18 Nov 2026 20:09:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=; b=ZPXpFQzUH6AbsOlY
	tF+ixoIdQ0jj1ae9RM7RCJctNoMbRbIbkMVris6T9wG50ovBmYKYEXHpBN8fVsZN
	B+hlLh1IKIylfzWhm069dLbohnT5QEkpRn/qgJP3A9cK6SQGxVDk4docSmvQgmFS
	gr8o1vTmh0hl3gwg7hmFk/7LjZnJcScYD6A0u13mf8wGY0V9bsaGY7RUV2opoDG2
	5qa8lXB54PX7bMhiQZ61HVmDa0vDI8jqXk8aTDUD3Lr5MHCTiWCDLbQF9VuVMZuj
	NBTRTVKCXtI9u6oLZabbjJNzUI7COsbnFQ1e4d+c4CDlPwuUkDU0gqrN3nXDozug
	mE1tTQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3b8syk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Wed, 18 Nov 2026 20:09:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so256171385a.1
        for <kvm-riscv@lists.infradead.org>; Wed, 18 Nov 2026 12:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795032597; x=1795637397; darn=lists.infradead.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=e3rH5ta5DD5f9M6739qq7ulQxZMSBrxBtB88w3b9yrpTtO0KPc/iephPiq6Tfk6NUA
         Z9ZHbpnrsKs9RIV2pRW0zlZ0c5vv4cgtInuC7K4pbz0aRsySbhq7BsvwQ823W5ffor6I
         xjcYvo/kBV0mKjjxAg2cOpl8MB8EdDOU0Jzib6Nc2vVGQL5ZthZEO0te9CZLqFDQqY6A
         4swk3Tak03vJ90k6jc5RxSdvoTVOJAu3xZgqCbJ06vvWPtAcSHSd9PmrpYVH6vxuhAt+
         JCKZ03GdhCUkbB1b/F6pCHLQUlT8FFUgV2jFjIKq1CE1aud/eVksmllTIpm3kzPzocJ1
         gcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795032597; x=1795637397;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Yelw5l1vTgIT3KQe49PZmxknXqCh77sINouzym+k2+4=;
        b=IcRzFRF7DqnrXJDtJsr6IE0QJMNJnjiLyPUkwTKTJdwciNBBKoA35RhG3QMj7eGeg3
         pzTCCsJJKk6peju7E+Oo6OIoOZlFi1Imum8RwnG7qbzklOkEAYhFTkhDtiJrxwNUZ/xt
         5R2L+KWqY6TehkCX6dCt+Urd0sUegEMIvs7FJ9aNXECYVUhmOdEtQyinCWvdslQqf203
         TSLZx8lIYyGqyYKESM5QnFdhDalraadWPJhnWHMAzQ1PjL+dJE3yvKJ4FRzm9CX1gFyU
         zqvRS03a9LhQuoiAypKolgdgHdMjV2qoX//f1bQCIa5BwxJMUu5Iywm1DAfFWi8AKxOs
         m9Ww==
X-Forwarded-Encrypted: i=1; AL+hErGayq8HQNqX5TiM9FRwL6XhJywtZswtXw6ijUn3UNjVrbQ/MUTVZJUTaB44LKB1wYn8i1tBUhaN3gE=@lists.infradead.org
X-Gm-Message-State: APuU4Z/uTzDzQaA2UI9LnsRzH/yOpvKyHuDf81MGIKjjgd54pOa+1cJV
	B4sBV1D44gCqfxhmlemtH48RzhtIwUruU5vP8gTix7uJOOUanslqQHvTZIX5jLvjOZaNiQpeUhy
	hCD0TPV7Crggti1e/Isx4y7mNXGC+Q0d7aVIM9pkWsTv8JufORNUHilOF3AJuPNVWnjsO
X-Gm-Gg: AYBFou1oKr8jtHz7UFI9EnF7uqMzlbksEGzw/wwRtydXd+byT6ZDSdDGYmnPgzfs53b
	AqX+syzmBI35dABym6K/AAY0yqn45m7sWkZLr4Se9uUxvtSdFVH4jNy2HUMKkmUVZWWx/bz7VuY
	A0YGRXmSy5PZZKLOubRK7o9XZsZLI8ZiFMgKn8Z+BAa4mfQkCaOp3iM9d4uwvgaOS367UelJtYw
	KR9ny14zwLtDJKXJxC7Ca4NGTb7rgY91ZrMMWJTjyMH0TfsPO4q+JMTJJmw1NVTT0SYqJ24eT7e
	VoGZI5n27tyHZH2za5Qk+s/A8yW2V9S7n4J7/nsGF9KUhEcE7FeLZlL1fDS2l2Suth8sYX4bgW4
	A6e9TxA5M1rzj2yf4aKrjxDXvK+SSErkcggVWmzWI2zMVPwwOl5VORENx1eMWrzkMXDicT+g/R9
	0O/RvKPhCjKVp39Q==
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677403385a.28.1795032596750;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
X-Received: by 2002:a05:620a:808c:b0:943:b019:f011 with SMTP id af79cd13be357-9499965c44cmr677395085a.28.1795032596062;
        Wed, 18 Nov 2026 12:09:56 -0800 (PST)
Received: from localhost (ip-62-245-98-165.bb.vodafone.cz. [62.245.98.165])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656b1cfdfsm6840078f8f.47.2026.11.18.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:09:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 21:09:53 +0100
Message-Id: <DMYLY5JOE18Z.2CQQGB4INJ4RH@oss.qualcomm.com>
Subject: Re: [PATCH] riscv: cfi: parse riscv_nousercfi before
 riscv_fill_hwcap()
Cc: <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, "Conor Dooley" <conor@kernel.org>,
        "Charlie Jenkins" <thecharlesjenkins@gmail.com>,
        "Andy Chiu"
 <tchiu@tenstorrent.com>,
        "Anup Patel" <anup@brainfault.org>, <kvm-riscv@lists.infradead.org>
To: "Guodong Xu" <guodong.xu@oss.qualcomm.com>,
        "Jonathan Corbet"
 <corbet@lwn.net>,
        "Shuah Khan" <skhan@linuxfoundation.org>,
        "Randy Dunlap"
 <rdunlap@infradead.org>,
        "Paul Walmsley" <pjw@kernel.org>,
        "Palmer Dabbelt"
 <palmer@dabbelt.com>,
        "Albert Ou" <aou@eecs.berkeley.edu>,
        "Alexandre
 Ghiti" <alex@ghiti.fr>,
        "Deepak Gupta" <debug@rivosinc.com>
From: =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?=
 <radim.krcmar@oss.qualcomm.com>
References: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
In-Reply-To: <20261108-nousercfi-early-param-v1-1-ea22d3a60683@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: ZWCtwgo65uxpLnGDLoXswDeTtHoIhLgw
X-Proofpoint-GUID: ZWCtwgo65uxpLnGDLoXswDeTtHoIhLgw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfX4u7bYvqVGZ3f
 HqM/Wp/JQIYhcZ610rWghNZvmsivvjWQLc6lAPdzJkul5exVHcpmXhGX2tZfSHVFN+OR48/jqGe
 X0BI4tOlBFUJnNTOiH1VNhSKaWZ9Ong=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe0615 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Sz50MssrUYSuVvM2sb41rg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=M51BFTxLslgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_3qaHc-GLK8r7rxdq84A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NyBTYWx0ZWRfXzFTcGDur/Vrk
 XPKB7Mmc3coyhDKA7cyCsXYH9xp00Lt5VOdTRmKhiXl9vLtJfXeTCDY2z2w5Prdsi42WHG2rvKH
 HyQsN8MDOD27fHXz4swNuItQB4wW5bPhFZpqgFKTkqi6zumRiunrdmMSTEGwXdHDlwZcMlI2Rut
 YD15rby7T34BVJRZNUYFiKFyX1TPVBdafXgCTvRYYB4L9uapcCKAsZaDIHNfdAo4iOJn0HM0xgC
 Nu/u80xmm3WBBOs3olwU8KYbiJt5bpA67rWgqExwAc/CuaV+/uDoi0NF/VlqjMZq2zFl6JuBWwp
 0Cwkh7Zqsp5LiMZditWUt9t9hsJmNbZkzy0BCiX7vBssGQmEMAHyKCPFi4VH3Xvkf+6nk1hWuza
 he04QmKO3mPyXmbLhceLpQVkZVsQxrQAn251dgXemqkksP6XCz4Lr7DYZF4/M83b0H9TO89ncZG
 86R4at2eBIvvwrg3r8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_06,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1011 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_120959_370708_D5B13637 
X-CRM114-Status: GOOD (  12.73  )
X-Spam-Score: -2.8 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

2026-11-08T04:42:01-05:00, Guodong Xu <guodong.xu@oss.qualcomm.com>:
> ISA bitmaps don't honour riscv_nousercfi because the ISA bitmaps are
> composed during setup_arch(), while riscv_nousercfi is a __setup()
> parameter, and those are parsed from start_kernel() after setup_arch()
> has returned.
>
> As a consequence, the riscv_nousercfi test in riscv_cfilp_validate() and
> riscv_cfiss_validate() always sees zero, and Zicfilp and Zicfiss stay in
> the ISA bitmaps even when user CFI is disabled on the kernel command
> line.

(I thought that was the intention.)

riscv_nousercfi definintely should disable the hwprobe reporting of
those features (my series did that), and prevent their enablement in
user-mode.

Why disable Zicfilp and Zicfiss in the ISA bitmaps by setting nousercfi,
though?  Aren't the validate functions just misusing riscv_nousercfi
instead of defining a clear detection mechanism?

I think the ISA bitmaps should consider whether Linux has the
extensions, which with standard SBI means a successfuly executed FWFT
set/get.

Linux can then use the ISA bitmap to decide whether to use CFI for
kernel code, allow it in KVM guests, report it as available hardware
feature, or allow it in user mode.

nousercfi seems like it should only restrict use of CFI in user mode.

Thanks.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
