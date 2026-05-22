Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE52CD5BB0
	for <kvm-riscv@archiver.kernel.org>; Fri, 22 May 2026 12:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CCRU4OGCGINBFBV7zoIhg83GRuek2qIzZj4mhUoKEnk=; b=OZDtZuDDRXjXhV
	gY4nqMeEAAjc9QrV5G18kaNwsq+s7+K3ndzUML6w3Z2iRdNH3nbaI6usJbY8Nj6B12rXrO5zyo/Qo
	tXZozSCDM0PYdKhAEKPQh3LbNKEdlqmo6cIoKjUbuR0cYR0dm4m1Pg+7OEL4lXm4qZ+1Gklb2va8U
	mrefUFYwpUQEJVsHmSfqPeXva/J3jt/GDt3slXcUD2kUJtU869MTeQSdpiEvFADx7/y1ejcCTJO6v
	Jy7uWRAbc1MBn07m3xqd+VqtYtMjQy8849hYB+r7xKO7ZNyg9mvqDYP3c+9futOmF3Nbg+BapbeD+
	HCSQSkAMB/ir62svJ+4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPL0-0000000AsNL-1Az4;
	Fri, 22 May 2026 12:50:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPKx-0000000AsMZ-2lpw
	for kvm-riscv@lists.infradead.org;
	Fri, 22 May 2026 12:50:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M93s4T1816063
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 12:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=; b=mXls+qtXCZljlfkr
	7YpD1hKAiWwM+Ee2Q5AG4oUA9GRJnOtlK8EqTOgD9gdEvq9MgoyTbp2xEMfTG3mm
	1d+lTUZYyUikwVJ1x2SPYDiuCrVH+7UveQPMJ8i42kS2XR04D96K/8FyqxaGsagw
	U3NFJ57iz66hiO32GT71UhGGoFxswXfGyaEQyB80wvdPer176nO0h350YSGh6AVJ
	J++k0z2gwr7BoaWibi3JY9XmuyV7wy/EcJWL9NMR31c1HouSOlURy1yxe+Mv6bDL
	XLgvEONbC9whtem7wg4zobbvrq/BanhmJI5ICWVKx59wxGoRBtauFtQ7Yi362u16
	Qb0R0g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eafrm208j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 12:50:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3041ab826ddso5054500eec.0
        for <kvm-riscv@lists.infradead.org>; Fri, 22 May 2026 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779454245; x=1780059045; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=;
        b=LXIMOAn9q/s5jGCzbOuiECudlZMqYEhV4LKVqoYbfN0qk/wPp/BsQf0cP/4p5Jrug3
         SNfmPZiMlT+9DCB0Zjob+a3Enf0G3mN9FayM4HF+g3RDl2o+eMHDDSmgEY0b1x/V9Yv2
         Zj+pvuI8OCZwi6YdwyQthz/VybLAFFq4TBuxN01RVt2hsUlmSaFpYn8rcz79qn4e9KMS
         YXCOEoMbaJ8tAAHL9/xp2zLjqhUco0ROPEWqs9dQS1K635zHKzKzPYHSI7AI/s+zJR9c
         V8zl4U5E7fxCeBqZRqWXkl2xqWXe/MdGq/WHLVYzpeFF94B0g5OSvSRPOxCL9V0nWu/j
         LDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779454245; x=1780059045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rXlJwEKxokX+wnRp06beoB2Vqo9GEkg42UQMNgZOco4=;
        b=Nltghh8Cm/+g3ORQd84dBB2IiEQYPYDvI1hSPyNbrSv8LSJjh08mN8jtP6zzhnfubP
         WA51nzZPDmZU3TGKu9b7+Fu7+H1xYPqmPP4frKO7KmFEA6NXRQanwAtuy2fmFEWYJWR9
         rWo2LqXFISnBrS0BveBqgCgiHM1YTgFL70CEHk+drK0Ry0UyUoRb/gUenCGboA2FHY6M
         jD4ZJyBu1J4CaQ8+SLcyu1cs60bppRf74mV6KK5lC2tGQ5uGM+qhAZvaL+A1ID48aszK
         MLGVZTaNLiWMLq/eUrz3bT5BmR8CRBhMetaCBoeGfY5ZUAF8RAAtfWUL24a4rsUAVDgq
         opUg==
X-Forwarded-Encrypted: i=1; AFNElJ+yHX+/9LLijE9OzItbM7rsUvlns+Lqg0Q/1p8ESstFTXHJq9vk8efnoal+6uRpGx7DR29X8NI2mQk=@lists.infradead.org
X-Gm-Message-State: AOJu0YwfrMD1DDBuzsqFkXJ46+jzH04LkMVLM1xgx4cqkk3TtFka8n8M
	R80PQXzK0vvxGTdHLSJKSBrvgxvHnokoUvRDMVIq2sWvniEepRB8eXgmuYiHpQlk3IpCNMdc0Gg
	qXHs+pg9EDRiToC4CoSNS5D+9QIirNQg9ejAggRDUdZ51kiovUKRO0NAeGl/fGsOsrdAT
X-Gm-Gg: Acq92OFMy5WqLe/7F3uAzkLkt4p95enWbjNrHE58yBiR2geMEIRmyUXsTGN3SUXVIC2
	yOLAVH5SKELaHyToDr/+kQ8ergy/cqjCuTikxXKBSqU2zLImZ12ocRlxbcYWXYuibV1cttV0eM+
	idIUwBlJoXVr7yPX6hRkopfM4DVadwJRBbLUoZSg7VzyLEfVm3jHvx+PSqKqLW/5NcqcWIPncra
	q0lbMpqkTNOGNSN8x8MYkdqNidYo7ukDLrABj+AN2Bm8L97dFnZ95qkqllNEw55zSXQssDndq6V
	v7oqfYdNlwEMpjfWIfIcYfL59w3/D/ysxgDb+95eyY2aDFA9tGY1o+EId9jMUvdVx6O9R2/oPjv
	M2c32gULiPzO6u05/yhYZFzKTqr7uhjKjti1pVw5LhQ==
X-Received: by 2002:a05:7301:6007:b0:2f2:5726:db31 with SMTP id 5a478bee46e88-3044913a03fmr1905500eec.35.1779454245481;
        Fri, 22 May 2026 05:50:45 -0700 (PDT)
X-Received: by 2002:a05:7301:6007:b0:2f2:5726:db31 with SMTP id 5a478bee46e88-3044913a03fmr1905472eec.35.1779454244912;
        Fri, 22 May 2026 05:50:44 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30452230dddsm1100812eec.17.2026.05.22.05.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 05:50:44 -0700 (PDT)
Date: Fri, 22 May 2026 07:50:43 -0500
From: Andrew Jones <andrew.jones@oss.qualcomm.com>
To: Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: ajones@ventanamicro.com, alex@ghiti.fr, anup@brainfault.org,
        aou@eecs.berkeley.edu, atish.patra@linux.dev, jiakaiPeanut@gmail.com,
        kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
        palmer@dabbelt.com, pjw@kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix TOCTOU race in SBI system suspend
 handler
Message-ID: <y2nfuwydbx4wxk3optxr5bex2pubo5whqvk2bzsl7os2kdkwaq@yk36oa4kozfh>
References: <yirnowpcfq6wqru3jshbbaicqftfj4ef3dcss65jdtuon6nzml@iyv45tnmmfha>
 <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260522031813.3429490-1-xujiakai2025@iscas.ac.cn>
X-Proofpoint-ORIG-GUID: 8Dpew8UBp4lTkfe54GNJiz0FRLfddUoT
X-Authority-Analysis: v=2.4 cv=Zekt8MVA c=1 sm=1 tr=0 ts=6a105126 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=cvcws7F5//HeuvjG1O1erQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=dx1DtnK-AAMJs4xixqwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEyNyBTYWx0ZWRfX8h1VWtzKPwmk
 UhWuAFrrgn/K9l9cIPQJgbJWQEnmlnGCXXtJ78FwTPMbpvnEkptT9warTyuklKJwjTf1391i6PL
 9+IEon5zYpT4igPSSZkvZGBPuulnr21uoBY88aiJFVKHZ5Sx6DK1OUCYkhiQEHnHCm8TCChoMlr
 Vj8AV7VIrliXWnsK98DfbQH6EWU+vxKEMf8qdHwiY9p5ygRpqxTmQD75lVEKRbKAHEIQ0oxKEod
 fDx8ueYIPrq7FESc/CxII9fFpOqIfJfpB70/7Q8cMGcY8au9rw4XlBMjldSrRNVQq6eiH0DIBij
 H7Jvmt6fmJN+N9S3olmXXAMPxONnRNTGbCaMO8cyUGM9AaMpiYuZ7OKrmviQ3td8pRPaojDCZBD
 uXDR4lkHOZCayVq7vEfaiqd+eCbOQhuEHjGgfNcwxFKUv6d2xL8H24Zn5ZZL955KoUvU1o2yqGc
 UnjtAEy1rwOSf/moTGw==
X-Proofpoint-GUID: 8Dpew8UBp4lTkfe54GNJiz0FRLfddUoT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_055047_810430_20F3E04D 
X-CRM114-Status: GOOD (  18.03  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBNYXkgMjIsIDIwMjYgYXQgMDM6MTg6MTNBTSArMDAwMCwgSmlha2FpIFh1IHdyb3Rl
Ogo+IEhpLCBkcmV3IQo+IAo+IFRoYW5rcyBmb3IgeW91ciByZXZpZXchCj4gCj4gPiA+IEknbSBu
b3QgYSBiaWcgZmFuIG9mIHRoaXMgYXBwcm9hY2ggYW5kIEkgc2VlIHNhc2hpa28gZm91bmQgaXQg
aGFzIGdhcHNbMV0uCj4gCj4gSSByZWFkIHNhc2hpa28ncyBmZWVkYmFjayBhbmQgSSB0aGluayBp
dCBtYWtlcyBzZW5zZS4KPiAKPiA+ID4gSSdkIHJhdGhlciB3ZSBpbnRyb2R1Y2UgYSBtdXRleCB0
byBrdm1fYXJjaCB0byBzZXJpYWxpemUgY3Jvc3MtdmNwdQo+ID4gCj4gPiBFaCwgbm90IHN1cmUg
d2h5IEkgc2FpZCAnaW50cm9kdWNlJyBoZXJlLiBXZSBjYW4ganVzdCB1c2Uga3ZtLT5sb2NrLgo+
IAo+IEkgbG9va2VkIGludG8gdGhhdCwgYnV0IGl0IG1heSBiZSBub3Qgc3VpdGFibGUuIEhlcmUn
cyB3aHk6Cj4gCj4gRG9jdW1lbnRhdGlvbi92aXJ0L2t2bS9sb2NraW5nLnJzdCBleHBsaWNpdGx5
IHN0YXRlczoga3ZtLT5sb2NrIGlzIHRha2VuIAo+IG91dHNpZGUgdmNwdS0+bXV0ZXguIFRoZSBz
dXNwIGhhbmRsZXIgcnVucyBpbnNpZGUga3ZtX2FyY2hfdmNwdV9pb2N0bF9ydW4oKSwgCj4gd2hp
Y2ggaXMgY2FsbGVkIGZyb20ga3ZtX3ZjcHVfaW9jdGwoKSB3aGVyZSB2Y3B1LT5tdXRleCBpcyBh
bHJlYWR5IGhlbGQuCj4gCj4gVGFraW5nIGt2bS0+bG9jayBpbnNpZGUgdGhlIHN1c3AgaGFuZGxl
ciB3b3VsZCBwcm9kdWNlOiB2Y3B1LT5tdXRleCDihpIga3ZtLT5sb2NrLgo+IFNvIG1heSBiZSB3
ZSBzaG91bGQgaW50cm9kdWNlIGEgbXV0ZXggdG8ga3ZtX2FyY2ggdG8gc2VyaWFsaXplIGNyb3Nz
LXZjcHUKPiBtcC1zdGF0ZSBvcGVyYXRpb25zLgo+IAo+IFdoYXQgZG8geW91IHRoaW5rPwoKR29v
ZCBjYXRjaC4gSSBzaG91bGQgaGF2ZSB0cnVzdGVkIG15IGluaXRpYWwgaW5zdGluY3RzIHRvIGlu
dHJvZHVjZSBhIG5ldwptdXRleCA6LSkKClRoYW5rcywKZHJldwoKLS0gCmt2bS1yaXNjdiBtYWls
aW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
