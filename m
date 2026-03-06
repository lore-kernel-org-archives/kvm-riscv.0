Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9CBFCC065
	for <kvm-riscv@archiver.kernel.org>; Fri,  6 Mar 2026 19:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e7rjJ8+0XwIrWUzpQ/P5eBp8nPoDJYF/+FZlTTt3RtU=; b=wMe/XYfTKLTY1h
	UZk16RoZPKKGiP2rTAUoZuEXZYxCGp9YA1KUieQ5L460V+g1zaHVM3Wh2Jkksj91YCGtTS4dw2Pi0
	zB3JyNzO4IGpb79ivoRJYfGINj+JMaa8NAXp8TSmI3qciEYAHwN/ZRUnHMAmM1322LwUOYlKEGoVx
	8DlTnXSZ/BIzdSkogU0K93DRgICulecybBuAj+idaRBWEZBK/IRsPYTEdpzSjutzoqCxlb7NGJcAz
	QEdsAG957X45N2xRfDD+5gUljaQNdroP0eDsE4qGmcQ196178ePpULDOO5bLOKnrKsde4u98DoDqL
	KPMrjg0aHKO70IHkmr6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT9-00000004NAx-1Pwa;
	Fri, 06 Mar 2026 19:04:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT8-00000004NAm-25TS
	for kvm-riscv@bombadil.infradead.org;
	Fri, 06 Mar 2026 19:04:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=; b=HwMBy4JTkEQoGfHBHQSAP3xl8G
	b3RxbzehaCsEEy4no/ckeFuy7L8RXY2Mr6dOn2DZEyPPJdXBJkQMTBVnaah7Ri+zGPijBsxNyBkMM
	Zjvjy2P/6pEY4wQWN+LlhVYUC9M8arAef8mLMbf9chC1pjp4T4SmYd+s02Fes8zeJV9NzQKzIkyAi
	DBXjyHGDHac/4YREC5kdTqbd8Y0ptOJNKGtChWcXLlBGLTIdyqHCIUkjmb6tT7cRcIbUvFSRmSqa0
	IBXFB2KEwTgvBpFpg91casd1o0EgQbsj0UP1kjDdm4pw5Li/+cmxOCdPrZ4c7D62dWfQxh3XoDU+Q
	UwE0PRqg==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaT4-00000009V8R-0OkJ
	for kvm-riscv@lists.infradead.org;
	Fri, 06 Mar 2026 19:04:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626H1Yih1580469
	for <kvm-riscv@lists.infradead.org>; Fri, 6 Mar 2026 19:04:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AEOAphMTxOtU+FeDqrKslYGY
	3bAJTeE8NjE65jpbiNM=; b=LH5Ew2bJNm384DOERQnlB/g0uXjkq0MrVzViVT71
	WAqzzHqDvTLHiGHZ/tMURig3oM9FlmF0OrHZW1pYJs0iOiffcIheShW4UTEn5Jxr
	U3h3m2C2Yoz0iZPBPnNkH7YmqIPbdATG7yLAWomSYR6d0IO+9JIXpQ8ybKXrCQgC
	Yis2p+vczuf8HKZyYD/XtDN33SbZuKcGPCAt7hD5Sq+DEbh5LYW4KEEKvKF1+iKb
	btayfvs22QL1K/g1SHHm+cskZZctzt8xud2XDGvOe7FnGBBRuzfUU6p/6odvN/6J
	48Du7qq7d05rXs01jqibJmKwXZa4+bqAPgg3V/rp1vWo1A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5tqsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 19:04:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2be21c6e2f5so62695657eec.1
        for <kvm-riscv@lists.infradead.org>; Fri, 06 Mar 2026 11:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772823845; x=1773428645; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=;
        b=SqlQDvHGYXu7oUvlstp0cBHQku4UOsdZPIkfQ5Lu3ALxrlnvWddPsGdbgtlbTXqwnE
         BXbAePoQG2/b/JsoJ2DQDEJyBguofx5EwOanAqoV2y/N6Ox6PZ9dwJy5Kw/9+6h+JgkE
         5BDG1RvSQEdzoiMKqrNQYaZhe7eT32RiuB5Qy5oIC02IrAX+JVDABuDHIwsVoIazmBuv
         OugrxQr1hVsnuB9p/zRiwuFnpE2RMAtKen045SBjsOKvcOLpvNYfCghe5Pqalh9NlPIr
         nEB4W2AlNlHCpUDnAIDcLcYLDEC0BmPqY76NN4yI8Ymph9JsEHEp5oUUJHLfgk0wTTtk
         bFeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823845; x=1773428645;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AEOAphMTxOtU+FeDqrKslYGY3bAJTeE8NjE65jpbiNM=;
        b=veriGShG9B/qkqgzaCsGlSYkNrgu63SWDrDadrRALFwwSOzond/UYQSZZ8kMb+ddAi
         joOciyB5gKa7bwYSMWOILt6uU549/cfZ8rukYyBno6DI5UNfkDm35OjzP2SO6UwpYw5B
         +nmQHfjdN1K7xUaeuS2G4PxPfXUjtWG4fdC+ei3eSJoJr7qNuLFHQ4f1jXIKdiTiE2GS
         iMWZlTHl4oDaGLMm0jYCOBj6H1mOC7tQS24rtgyBDqKq7gYmrfVq48gGEmNI0pgYqnX6
         j5pfyZNQMIeYuoJHXWca6O2MhoBTxD5sEavkj9JeiMf6hiQPcKg9jkCFokXFTYxMfgTx
         OiQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+Y8PBTc18YyEH2qx0kh7kwUau00+u+LVgP0aHTj8XtujNEwTTTSvq5e98vrrRjZqRAE7iQO+wER8=@lists.infradead.org
X-Gm-Message-State: AOJu0YyHLusZ9synn/VDFa4FzaUQ2jCJmH6ZlX3CGjciZZ6Am23tHruq
	XXT0ISw9TXFf/Dn/kFFNeDX2Di+s3cVn8pCh7nLbqktI15367gafSeIoZEAO49HaJkq5ltEQUX9
	Y9fvV/5248mrsFdA2qA4pupoKsrVFCP+mIeMUiVH4waI6XtG+z3cbMM1rSWyjGMIypAbu
X-Gm-Gg: ATEYQzzslQPSsyVUIyhx5qL4OEEpbzQblCSsySDUodxi1EE0YrHHakC+UZcPD4GbVRO
	dvGnSbjrFNgd54zp/HvNY8GYko5MweyQKO7FDlVYG+v40bWA1xrPmxmbe9UToSt67nN8SeuY/r/
	4v/J/xHai1nRaYQlESOECfDgEGOleph27CDdCJTb4Jv0St8XCA1p2rumAKCGy7q9FieJxgPhbPr
	lSoXtGkq1EjWKz7zQDD41t4uGcohuHgVrpJ9vTo0f5q4HtvI5TcWWhj/SYNfNxoF30t9M8U5VzP
	VGsR/EZ+CuBzzqo9O7cjuyCTqhe7k4ozAefiZmRDqgaGNr2Eo6Fjel2HGF6X8Sosm7cTxy5e6Ue
	DYCFIsRVWKlVXvEaDeMtU2bk04Fa36yE=
X-Received: by 2002:a05:693c:2b13:b0:2be:3cd:62bc with SMTP id 5a478bee46e88-2be4deaed2bmr1242302eec.13.1772823845203;
        Fri, 06 Mar 2026 11:04:05 -0800 (PST)
X-Received: by 2002:a05:693c:2b13:b0:2be:3cd:62bc with SMTP id 5a478bee46e88-2be4deaed2bmr1242278eec.13.1772823844574;
        Fri, 06 Mar 2026 11:04:04 -0800 (PST)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be4f848178sm1735603eec.14.2026.03.06.11.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:04:03 -0800 (PST)
Date: Fri, 6 Mar 2026 13:04:02 -0600
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Conor Dooley <conor@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, kvm-riscv@lists.infradead.org,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Anup Patel <anup@brainfault.org>,
        =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Charlie Jenkins <charlie@rivosinc.com>,
        Charlie Jenkins <thecharlesjenkins@gmail.com>,
        Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [RFC PATCH v1 04/11] riscv: Add B to hwcap
Message-ID: <qjj6rwl7kysulsjkpmqsh4ttxowgj6i7p5ewxxrkqe7zginau2@psteng6ylgz7>
References: <20260206002349.96740-1-andrew.jones@oss.qualcomm.com>
 <20260206002349.96740-5-andrew.jones@oss.qualcomm.com>
 <CAH1PCMb5YS3UzaxhHCjPJHxeTKMcdO78VTPxa7+oktbbhqQ72Q@mail.gmail.com>
 <wozbsfbvlhsqhvrvjsxyx2u5rpagwlnezythkutzqwikmzeoah@lc3brdn5cu3t>
 <CAH1PCMaAEyZVioQmyJh7oFisnFnrxhnc_exJh5=vbZSvNcieJw@mail.gmail.com>
 <z5bm4uoryuvz5cnsdl37pqmctkqrxw3kk7vqnb3vopnyg2mhl2@ctwdfkgahjfk>
 <20260306-extradite-vexingly-707b5633ef03@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260306-extradite-vexingly-707b5633ef03@spud>
X-Proofpoint-ORIG-GUID: FvOEYP2BFQG2CSIs034SxTZOvyT_9MBn
X-Proofpoint-GUID: FvOEYP2BFQG2CSIs034SxTZOvyT_9MBn
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69ab2526 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8zqSyz1bBbSAnvxMoyIA:9 a=CjuIK1q_8ugA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE4MCBTYWx0ZWRfX+bv0pv4fiL36
 dMWefa4d1pWENmuNPStlONog+OwMLcoknYajyalU0jp+zfLroQZRDCdFeDrifrzpteMJD/NgvUR
 6oxe6sYyquhvuv+XnEtQCBAfD9Mo/YEa31nu/0ijMYXm+jJb9h108M6y6tMeeKFwifSupTdbSFZ
 YEm4onW93VC1VaeWTIRM7DDRqfTn4gUzAgt4Tmk79jZoHkh6zUHopJwSqTAz7Kb0r+yK3lLEM9F
 Kr3+fpVfJzFST9bWHGf1aOS+mV8Qc00m6hony6XuIHME9pQ4hWbdcxXSSX7yzhnlzMkZo75tilE
 EGmhsRBBcdWRgS80iz6BynRogqMlkZzmYspB+syiu7QF7Hr4/AMSKBOh09cGT/S7NNsvQ4lU+g1
 M7oOLOrnuaBBxJTWrVS1/o9cCYEobWNQPhoiykjk98ZVV4JmYT3voFWBd1p7B0ynH5vXRDExaVj
 AB/6o57rUPwvj1O2zlA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_190410_409035_CF92A2EE 
X-CRM114-Status: GOOD (  18.85  )
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

On Fri, Mar 06, 2026 at 06:50:20PM +0000, Conor Dooley wrote:
> On Fri, Mar 06, 2026 at 12:27:50PM -0600, Andrew Jones wrote:
> > On Fri, Mar 06, 2026 at 10:17:19AM +0800, Guodong Xu wrote:
> 
> > > + /*
> > > +  * B is functionally a bundle (Zba + Zbb + Zbs,
> > > +  * no additional instructions). We use SUPERSET
> > > +  * instead of BUNDLE because B needs a valid ext
> > > +  * id for isa2hwcap[] to set COMPAT_HWCAP_ISA_B.
> 
> What's the actual rationale for it working like that?
> Why shouldn't bundles appear in cpuinfo etc, I forget entirely why we
> did it this way. Feels like it'd be easier for users, no?
> 
> 2023 me might disagree, but 2026 me doesn't see the value in hiding these
> extensions. All I can think of was me being very negative, and hedging
> against bad software checking for zkn and not checking for the subsets,
> and breaking if the dt listed the entire subset but not zkn. That, or
> not wanting to implement code that looked for subset extensions and
> populated the relevant bundle if the bundle itself was missing but all
> components were there.

I also can't remember and the 2026 me doesn't want to google 2023 me's
thoughts. I think we may have opted not to publish bundles because we
didn't believe publishing them would help reduce much confusion, as the
concept of a bundle itself was a bit confusing...

Thanks,
drew

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
